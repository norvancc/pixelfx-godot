@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/rage.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "ember", _S.import_value("fx/status/_lib.js", "ember"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Rage"}, {"desc": "Seething: the body judders on every heartbeat, an anger mark throbs at the temple, eyes burn, steam jets off the head, stress lines flash out and the floor cracks hot underfoot."}, {"tags": ["status", "rage", "berserk", "anger", "buff", "loop"]}, {"size": [80, 80]}, {"origin": [40, 70]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a0208", "#4a0612", "#8a0c1c", "#c81828", "#ff3040", "#ff7a7a", "#ffc8c8", "#ffffff"]}, {"heat": ["#5a0a0a", "#c8281a", "#ff7a2a", "#ffd27a"]}, {"steam": "#f2e8ee"}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SEETHE", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 19)}, {"bx": 13}, {"by": _S.unary("-", 19)}, {"ffx": _S.unary("-", 8)}, {"fbx": 9}]))
	_S.define(_e, "THUD", _S.merge([_S.read(_e, "SEETHE"), {"crouch": 6}, {"fy": _S.unary("-", 23)}, {"by": _S.unary("-", 23)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "SEETHE")], [0.05, _S.read(_e, "THUD"), "snap"], [0.17, _S.read(_e, "SEETHE"), "snap"], [0.29, _S.merge([_S.read(_e, "THUD"), {"crouch": 5}]), "snap"], [0.4, _S.read(_e, "SEETHE"), "snap"], [1.2, _S.read(_e, "SEETHE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LUB", 0.05)
	_S.define(_e, "DUB", 0.29)
	_S.define(_e, "G", 760)
	_S.define(_e, "pulse", _S.function_value(_e, "_f7"))
	_S.define(_e, "beat", _S.function_value(_e, "_f8"))
	_S.define(_e, "since", _S.function_value(_e, "_f9"))
	_S.define(_e, "shaking", _S.function_value(_e, "_f10"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f11"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "MARK", [_S.call_value(_S.read(_e, "bitmap"), [["..#.#..", "..#.#..", "##...##", ".......", "##...##", "..#.#..", "..#.#.."]]), _S.call_value(_S.read(_e, "bitmap"), [["...#.#...", "...#.#...", "..##.##..", "###...###", ".........", "###...###", "..##.##..", "...#.#...", "...#.#..."]])])
	_S.define(_e, "CRACKS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	if _S.truth(_S.invoke(_S.read(_e, "CRACKS"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "CRACKS"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	var _v0 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.binary("-", _S.prop(_S.read(_e, "S"), "h"), 1))
	_S.define(_e, "fl", _S.prop(_v0, 0))
	_S.define(_e, "fr", _S.prop(_v0, 1))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 31), 7)]))
	_S.define(_e, "out", [])
	for _v1 in _S.array([[_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "fl")), 2), _S.unary("-", 1)], [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "fr")), 1), 1], [_S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("/", _S.binary("+", _S.read(_e, "fl"), _S.read(_e, "fr")), 2)), _S.unary("-", 1)], [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("/", _S.binary("+", _S.read(_e, "fl"), _S.read(_e, "fr")), 2)), 1), 1]]):
		var _v2 = _S.scope(_e)
		var _v3 = _v1
		_S.define(_v2, "x0", _S.prop(_v3, 0))
		_S.define(_v2, "dir", _S.prop(_v3, 1))
		var _v4 = _S.scope(_v2)
		_S.define(_v4, "x", _S.read(_v4, "x0"))
		_S.define(_v4, "y", 0.5)
		_S.define(_v4, "pts", [[_S.read(_v4, "x"), _S.read(_v4, "y")]])
		_S.define(_v4, "n", _S.invoke(_S.read(_v4, "R"), "int", [5, 9]))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.read(_v5, "n"))):
			var _v6 = _S.scope(_v5)
			_S.write(_v6, "x", _S.binary("*", _S.read(_v6, "dir"), _S.invoke(_S.read(_v6, "R"), "range", [1.2, 2.4])), "+=", false)
			_S.write(_v6, "y", _S.call_value(_S.read(_v6, "clamp"), [_S.binary("+", _S.read(_v6, "y"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 0.9), 0.9])), 0, 2.5]), "=", false)
			_S.invoke(_S.read(_v6, "pts"), "push", [[_S.read(_v6, "x"), _S.read(_v6, "y")]])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v6, "i"), 1), func(): return _S.invoke(_S.read(_v6, "R"), "chance", [0.3]))):
				_S.invoke(_S.read(_v6, "out"), "push", [[[_S.read(_v6, "x"), _S.read(_v6, "y")], [_S.binary("+", _S.read(_v6, "x"), _S.binary("*", _S.read(_v6, "dir"), _S.invoke(_S.read(_v6, "R"), "range", [1, 2]))), _S.call_value(_S.read(_v6, "clamp"), [_S.binary("+", _S.read(_v6, "y"), _S.binary("*", _S.invoke(_S.read(_v6, "R"), "sign", []), _S.invoke(_S.read(_v6, "R"), "range", [0.6, 1.4]))), 0, 3])]]])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		_S.invoke(_S.read(_v4, "out"), "push", [_S.read(_v4, "pts")])
	_S.invoke(_S.read(_e, "CRACKS"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Hh", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "heat"), 4]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t")]))
	_S.define(_e, "stamp", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.read(_e, "LUB")])), 0.18)]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 2), _S.function_value(_e, "_f2"), _S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 30), _S.unary("-", 4), 30, 8, _S.function_value(_e, "_f4")])
	_S.define(_e, "heat", _S.binary("+", 0.25, _S.binary("*", 0.75, _S.read(_e, "stamp"))))
	for _v8 in _S.array(_S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "o"), "seed")])):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "pts", _v8)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.prop(_S.read(_v10, "pts"), "length"))):
			var _v11 = _S.scope(_v10)
			var _v12 = _S.prop(_S.read(_v11, "pts"), _S.binary("-", _S.read(_v11, "i"), 1))
			_S.define(_v11, "x0", _S.prop(_v12, 0))
			_S.define(_v11, "y0", _S.prop(_v12, 1))
			var _v13 = _S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i"))
			_S.define(_v11, "x1", _S.prop(_v13, 0))
			_S.define(_v11, "y1", _S.prop(_v13, 1))
			_S.define(_v11, "far", _S.binary("/", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "pts"), "length")))
			_S.invoke(_S.read(_v11, "p"), "line", [_S.read(_v11, "x0"), _S.read(_v11, "y0"), _S.read(_v11, "x1"), _S.read(_v11, "y1"), (_S.prop(_S.read(_v11, "Hh"), 3) if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v11, "heat"), _S.binary("-", 1, _S.binary("*", _S.read(_v11, "far"), 0.6))), 0.6)) else (_S.prop(_S.read(_v11, "Hh"), 2) if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v11, "heat"), _S.binary("-", 1, _S.binary("*", _S.read(_v11, "far"), 0.5))), 0.35)) else _S.prop(_S.read(_v11, "Hh"), 1)))])
			if _S.truth(_S.binary("%", _S.read(_v11, "i"), 2)):
				_S.invoke(_S.read(_v11, "p"), "glow", [_S.read(_v11, "x1"), _S.read(_v11, "y1"), 4, _S.prop(_S.read(_v11, "Hh"), 2), _S.binary("*", _S.binary("*", 0.25, _S.read(_v11, "heat")), _S.binary("-", 1, _S.binary("*", _S.read(_v11, "far"), 0.5)))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.7, 1.1])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 16), 16]))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [10, 40])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [14, 22]))))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "r"), "range", [6, 11]))
	_S.define(_e, "ph", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]), 0.55))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "d", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "d"), _S.read(_v7, "len"))):
		_S.invoke(_S.read(_v7, "p"), "dot", [_S.binary("+", _S.binary("-", _S.read(_v7, "x0"), _S.binary("/", _S.read(_v7, "len"), 2)), _S.read(_v7, "d")), _S.binary("+", _S.read(_v7, "y"), _S.invoke(_S.read(_v7, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v7, "d"), 0.9), _S.read(_v7, "ph")), _S.binary("*", _S.read(_v7, "age"), 12))]), 0.8)])), (_S.prop(_S.read(_v7, "C"), 2) if _S.truth(_S.binary("%", _S.read(_v7, "d"), 3)) else _S.prop(_S.read(_v7, "C"), 1)), _S.binary("*", _S.read(_v7, "k"), _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "abs", [_S.binary("-", _S.binary("/", _S.read(_v7, "d"), _S.read(_v7, "len")), 0.5)]), 1.4)))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "d", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "x"), 28), _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), 4.5)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 3), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("+", 0.2, _S.binary("*", 0.3, _S.read(_e, "b"))), _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Hh", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "heat"), 4]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t")]))
	_S.define(_e, "steam", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "steam")]))
	_S.define(_e, "shake", _S.call_value(_S.read(_e, "shaking"), [_S.read(_e, "t")]))
	_S.define(_e, "dx", ((1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 60)]), 2)) else _S.unary("-", 1)) if _S.truth(_S.read(_e, "shake")) else 0))
	_S.define(_e, "dy", (_S.unary("-", 1) if _S.truth(_S.logical("&&", _S.read(_e, "shake"), func(): return _S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "LUB"), 0.02)]), 0.06))) else 0))
	for _v14 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "mx", _S.prop(_v16, 0))
		_S.define(_v15, "my", _S.prop(_v16, 1))
		var _v17 = _S.scope(_v15)
		_S.define(_v17, "c", _S.call_value(_S.read(_v17, "colorAt"), [_S.read(_v17, "a"), _S.read(_v17, "mx"), _S.read(_v17, "my")]))
		_S.define(_v17, "l", _S.call_value(_S.read(_v17, "luma"), [_S.read(_v17, "c")]))
		_S.define(_v17, "skin", _S.logical("&&", _S.binary(">", _S.read(_v17, "l"), 0.55), func(): return _S.binary(">", _S.binary("&", _S.read(_v17, "c"), 255), _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v17, "c"), 16), 255), 30))))
		if _S.truth(_S.read(_v17, "skin")):
			_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), "x"), _S.read(_v17, "mx")), _S.read(_v17, "dx")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), "y"), _S.read(_v17, "my")), _S.read(_v17, "dy")), _S.call_value(_S.read(_v17, "mix"), [_S.read(_v17, "c"), _S.prop(_S.read(_v17, "C"), 4), _S.binary("+", 0.22, _S.binary("*", 0.3, _S.read(_v17, "b")))])])
		else:
			if _S.truth(_S.read(_v17, "shake")):
				_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), "x"), _S.read(_v17, "mx")), _S.read(_v17, "dx")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), "y"), _S.read(_v17, "my")), _S.read(_v17, "dy")), _S.read(_v17, "c")])
	for _v18 in _S.array(_S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")])):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "e", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "ex", _S.binary("+", _S.prop(_S.read(_v20, "a"), "x"), _S.read(_v20, "dx")))
		_S.define(_v20, "ey", _S.binary("+", _S.prop(_S.read(_v20, "a"), "y"), _S.read(_v20, "dy")))
		_S.define(_v20, "inner", (1 if _S.truth(_S.binary("<", _S.binary("/", _S.binary("+", _S.prop(_S.read(_v20, "e"), "x0"), _S.prop(_S.read(_v20, "e"), "x1")), 2), _S.binary("/", _S.prop(_S.read(_v20, "a"), "w"), 2))) else _S.unary("-", 1)))
		for _v21 in _S.array(_S.prop(_S.read(_v20, "e"), "px")):
			var _v22 = _S.scope(_v20)
			var _v23 = _v21
			_S.define(_v22, "x", _S.prop(_v23, 0))
			_S.define(_v22, "y", _S.prop(_v23, 1))
			_S.invoke(_S.read(_v22, "p"), "px", [_S.binary("+", _S.read(_v22, "ex"), _S.read(_v22, "x")), _S.binary("+", _S.read(_v22, "ey"), _S.read(_v22, "y")), (_S.prop(_S.read(_v22, "C"), 7) if _S.truth(_S.binary("===", _S.read(_v22, "y"), _S.prop(_S.read(_v22, "e"), "y0"))) else (_S.prop(_S.read(_v22, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v22, "y"), _S.binary("+", _S.prop(_S.read(_v22, "e"), "y0"), 1))) else _S.prop(_S.read(_v22, "C"), 4)))])
		_S.define(_v20, "xi", (_S.prop(_S.read(_v20, "e"), "x1") if _S.truth(_S.binary(">", _S.read(_v20, "inner"), 0)) else _S.prop(_S.read(_v20, "e"), "x0")))
		_S.define(_v20, "xo", (_S.prop(_S.read(_v20, "e"), "x0") if _S.truth(_S.binary(">", _S.read(_v20, "inner"), 0)) else _S.prop(_S.read(_v20, "e"), "x1")))
		_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v20, "ex"), _S.read(_v20, "xo")), _S.read(_v20, "inner")), _S.binary("-", _S.binary("+", _S.read(_v20, "ey"), _S.prop(_S.read(_v20, "e"), "y0")), 2), 4280227622])
		_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("+", _S.read(_v20, "ex"), _S.read(_v20, "xo")), _S.binary("-", _S.binary("+", _S.read(_v20, "ey"), _S.prop(_S.read(_v20, "e"), "y0")), 2), 4280227622])
		_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("+", _S.read(_v20, "ex"), _S.read(_v20, "xi")), _S.binary("-", _S.binary("+", _S.read(_v20, "ey"), _S.prop(_S.read(_v20, "e"), "y0")), 1), 4280227622])
		_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("+", _S.read(_v20, "ex"), _S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v20, "e"), "x0"), _S.prop(_S.read(_v20, "e"), "x1")), 1), 2)), _S.binary("+", _S.binary("+", _S.read(_v20, "ey"), _S.prop(_S.read(_v20, "e"), "y0")), 1), 5, _S.prop(_S.read(_v20, "C"), 5), _S.binary("+", 0.35, _S.binary("*", 0.35, _S.read(_v20, "b")))])
	_S.define(_e, "big", _S.logical("||", _S.binary(">", _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "LUB"), 0.02), 0.05]), 0.35), func(): return _S.binary(">", _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "DUB"), 0.02), 0.04]), 0.6)))
	_S.define(_e, "mx", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("*", _S.prop(_S.read(_e, "a"), "w"), 0.86)), _S.read(_e, "dx")))
	_S.define(_e, "my", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 3), _S.read(_e, "dy")))
	_S.call_value(_S.read(_e, "icon"), [_S.read(_e, "p"), _S.read(_e, "mx"), _S.read(_e, "my"), 5, _S.prop(_S.read(_e, "MARK"), (1 if _S.truth(_S.read(_e, "big")) else 0)), [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)]])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "mx"), (3 if _S.truth(_S.read(_e, "big")) else 2)), _S.binary("-", _S.read(_e, "my"), (3 if _S.truth(_S.read(_e, "big")) else 2)), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "mx"), _S.read(_e, "my"), 8, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.25, _S.binary("*", 0.4, _S.read(_e, "b")))])
	for _v24 in _S.array([[_S.binary("+", _S.read(_e, "LUB"), 0.04), 7, 1], [_S.binary("+", _S.read(_e, "DUB"), 0.04), 4, 0.75]]):
		var _v25 = _S.scope(_e)
		var _v26 = _v24
		_S.define(_v25, "at", _S.prop(_v26, 0))
		_S.define(_v25, "n", _S.prop(_v26, 1))
		_S.define(_v25, "power", _S.prop(_v26, 2))
		for _v27 in _S.array([_S.unary("-", 1), 1]):
			var _v28 = _S.scope(_v25)
			_S.define(_v28, "side", _v27)
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v29, "i"), _S.read(_v29, "n"))):
				var _v30 = _S.scope(_v29)
				_S.define(_v30, "age", _S.call_value(_S.read(_v30, "since"), [_S.read(_v30, "t"), _S.binary("+", _S.read(_v30, "at"), _S.binary("*", _S.read(_v30, "i"), 0.016))]))
				_S.define(_v30, "life", _S.binary("+", 0.22, _S.binary("*", 0.12, _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "i"), _S.read(_v30, "side"), 3]))))
				if _S.truth(_S.binary(">=", _S.read(_v30, "age"), _S.read(_v30, "life"))):
					_v29 = _S.iteration(_v29)
					_S.write(_v29, "i", 1, "+=", true)
					continue
				_S.define(_v30, "u", _S.binary("/", _S.read(_v30, "age"), _S.read(_v30, "life")))
				_S.define(_v30, "ang", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 2), _S.binary("*", _S.read(_v30, "side"), _S.binary("+", 0.5, _S.binary("*", 0.2, _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "i"), _S.read(_v30, "side"), 5]))))))
				_S.define(_v30, "sp", _S.binary("*", _S.binary("+", 90, _S.binary("*", 40, _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "i"), _S.read(_v30, "side"), 7]))), _S.read(_v30, "power")))
				_S.define(_v30, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v30, "side"), _S.prop(_S.read(_v30, "a"), "w")), 0.36), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "ang")]), _S.call_value(_S.read(_v30, "travel"), [_S.read(_v30, "sp"), 0, 7, _S.read(_v30, "age")]))))
				_S.define(_v30, "y", _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v30, "a"), "y"), 3), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "ang")]), _S.call_value(_S.read(_v30, "travel"), [_S.read(_v30, "sp"), 0, 7, _S.read(_v30, "age")]))), _S.binary("*", 8, _S.read(_v30, "age"))))
				_S.define(_v30, "rad", _S.binary("*", _S.binary("+", 1, _S.binary("*", 3.2, _S.invoke(_S.read(_v30, "Math"), "sqrt", [_S.read(_v30, "u")]))), _S.binary("+", 0.8, _S.binary("*", 0.4, _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "i"), _S.read(_v30, "side"), 9])))))
				_S.define(_v30, "k", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "min", [1, _S.binary("*", _S.read(_v30, "u"), 12)]), _S.invoke(_S.read(_v30, "Math"), "pow", [_S.binary("-", 1, _S.read(_v30, "u")), 2])))
				_S.invoke(_S.read(_v30, "p"), "disc", [_S.read(_v30, "x"), _S.read(_v30, "y"), _S.read(_v30, "rad"), _S.read(_v30, "steam"), _S.binary("*", 0.7, _S.read(_v30, "k"))])
				_S.invoke(_S.read(_v30, "p"), "disc", [_S.binary("-", _S.read(_v30, "x"), _S.binary("*", _S.read(_v30, "rad"), 0.2)), _S.binary("-", _S.read(_v30, "y"), _S.binary("*", _S.read(_v30, "rad"), 0.25)), _S.binary("*", _S.read(_v30, "rad"), 0.6), 4294967295, _S.binary("*", 0.6, _S.read(_v30, "k"))])
				if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.3)):
					_S.invoke(_S.read(_v30, "p"), "dot", [_S.read(_v30, "x"), _S.read(_v30, "y"), 4294967295, _S.binary("-", 1, _S.binary("/", _S.read(_v30, "u"), 0.3))])
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "i", 1, "+=", true)
	for _v31 in _S.array([[_S.read(_e, "LUB"), 8, 7], [_S.read(_e, "DUB"), 6, 5]]):
		var _v32 = _S.scope(_e)
		var _v33 = _v31
		_S.define(_v32, "at", _S.prop(_v33, 0))
		_S.define(_v32, "n", _S.prop(_v33, 1))
		_S.define(_v32, "len", _S.prop(_v33, 2))
		var _v34 = _S.scope(_v32)
		_S.define(_v34, "age", _S.call_value(_S.read(_v34, "since"), [_S.read(_v34, "t"), _S.read(_v34, "at")]))
		if _S.truth(_S.binary(">", _S.read(_v34, "age"), 0.2)):
			continue
		_S.define(_v34, "k", _S.binary("/", _S.read(_v34, "age"), 0.2))
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), _S.read(_v35, "n"))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "ang", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v36, "Math"), "PI")), 2), _S.binary("*", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v36, "i"), 0.5), _S.read(_v36, "n")), 0.5), 4.4)))
			_S.define(_v36, "r0", _S.binary("+", 15, _S.binary("*", 6, _S.read(_v36, "k"))))
			_S.define(_v36, "ca", _S.invoke(_S.read(_v36, "Math"), "cos", [_S.read(_v36, "ang")]))
			_S.define(_v36, "sa", _S.invoke(_S.read(_v36, "Math"), "sin", [_S.read(_v36, "ang")]))
			_S.define(_v36, "cx", 0)
			_S.define(_v36, "cy", _S.binary("+", _S.prop(_S.read(_v36, "a"), "y"), 12))
			_S.define(_v36, "pts", [])
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "j", 0)
			while _S.truth(_S.binary("<=", _S.read(_v37, "j"), 3)):
				var _v38 = _S.scope(_v37)
				_S.define(_v38, "r", _S.binary("+", _S.read(_v38, "r0"), _S.binary("*", _S.binary("/", _S.read(_v38, "j"), 3), _S.read(_v38, "len"))))
				_S.define(_v38, "off", (1.3 if _S.truth(_S.binary("%", _S.read(_v38, "j"), 2)) else _S.unary("-", 0.4)))
				_S.invoke(_S.read(_v38, "pts"), "push", [[_S.binary("-", _S.binary("+", _S.read(_v38, "cx"), _S.binary("*", _S.read(_v38, "ca"), _S.read(_v38, "r"))), _S.binary("*", _S.read(_v38, "sa"), _S.read(_v38, "off"))), _S.binary("+", _S.binary("+", _S.read(_v38, "cy"), _S.binary("*", _S.read(_v38, "sa"), _S.read(_v38, "r"))), _S.binary("*", _S.read(_v38, "ca"), _S.read(_v38, "off")))]])
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "j", 1, "+=", true)
			_S.invoke(_S.read(_v36, "p"), "polyline", [_S.read(_v36, "pts"), _S.function_value(_v36, "_f6"), _S.binary("-", 1.2, _S.read(_v36, "k"))])
			_S.invoke(_S.read(_v36, "p"), "glowLine", [_S.prop(_S.prop(_S.read(_v36, "pts"), 0), 0), _S.prop(_S.prop(_S.read(_v36, "pts"), 0), 1), _S.prop(_S.prop(_S.read(_v36, "pts"), 3), 0), _S.prop(_S.prop(_S.read(_v36, "pts"), 3), 1), 3, _S.prop(_S.read(_v36, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v36, "k")))])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
	_S.define(_e, "st", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.read(_e, "LUB")]))
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), 10)):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "life", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "i"), 11]))))
		_S.define(_v40, "age", _S.binary("-", _S.read(_v40, "st"), _S.binary("*", 0.02, _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "i"), 12]))))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v40, "age"), 0), func(): return _S.binary(">", _S.read(_v40, "age"), _S.read(_v40, "life")))):
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
			continue
		_S.define(_v40, "x", _S.binary("+", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "i"), 13]), 0.5), 30), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v40, "age"), 9), _S.read(_v40, "i"))]), 1.5), _S.read(_v40, "age"))))
		_S.define(_v40, "y", _S.binary("+", _S.unary("-", 1), _S.call_value(_S.read(_v40, "travel"), [_S.unary("-", _S.binary("+", 40, _S.binary("*", 50, _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "i"), 14])))), _S.unary("-", 20), 1.6, _S.read(_v40, "age")])))
		_S.call_value(_S.read(_v40, "ember"), [_S.read(_v40, "p"), _S.read(_v40, "x"), _S.read(_v40, "y"), _S.binary("/", _S.read(_v40, "age"), _S.read(_v40, "life")), [_S.prop(_S.read(_v40, "Hh"), 3), _S.prop(_S.read(_v40, "Hh"), 2), _S.prop(_S.read(_v40, "Hh"), 1)], _S.binary("+", _S.read(_v40, "age"), _S.read(_v40, "i"))])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	var _v41 = _S.scope(_e)
	_S.define(_v41, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v41, "i"), 12)):
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "vx", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v42, "rand"), [_S.read(_v42, "i"), 21]), 0.5), 90))
		_S.define(_v42, "vy", _S.unary("-", _S.binary("+", 40, _S.binary("*", 70, _S.call_value(_S.read(_v42, "rand"), [_S.read(_v42, "i"), 22])))))
		_S.define(_v42, "tt", _S.read(_v42, "st"))
		_S.define(_v42, "x", _S.binary("+", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v42, "rand"), [_S.read(_v42, "i"), 23]), 0.5), 18), _S.binary("*", _S.read(_v42, "vx"), _S.read(_v42, "tt"))))
		_S.define(_v42, "y", _S.binary("+", _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_v42, "vy"), _S.read(_v42, "tt"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v42, "G")), _S.read(_v42, "tt")), _S.read(_v42, "tt"))))
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v42, "tt"), 0.6), func(): return _S.binary(">", _S.read(_v42, "y"), 0))):
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "i", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v42, "p"), "px", [_S.read(_v42, "x"), _S.read(_v42, "y"), (_S.prop(_S.read(_v42, "C"), 2) if _S.truth(_S.binary("%", _S.read(_v42, "i"), 3)) else 4285161074)])
		_v41 = _S.iteration(_v41)
		_S.write(_v41, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 10), 26, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.4, _S.read(_e, "b")))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 22), 34, _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.08, _S.binary("*", 0.18, _S.read(_e, "b")))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.66)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.33)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 2), func(): return 0.06))
	return _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("%", _S.binary("+", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "at")), _S.read(_e, "D")), _S.read(_e, "D")), _S.binary("/", _S.read(_e, "D"), 2)), _S.read(_e, "D")), _S.binary("/", _S.read(_e, "D"), 2)), _S.read(_e, "w")), 2))])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "t"), _S.read(_e, "LUB")]), _S.binary("*", 0.65, _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "t"), _S.read(_e, "DUB")])))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "at")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.logical("||", _S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "LUB"), 0.02)]), 0.13), func(): return _S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "DUB"), 0.02)]), 0.09))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.call_value(_S.read(_e, "shaking"), [_S.read(_e, "t")])) else 1)
