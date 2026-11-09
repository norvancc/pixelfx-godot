@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tone", _S.function_value(_e, "_f0"))
	_S.define(_e, "mote", _S.function_value(_e, "_f1"))
	_S.define(_e, "streak", _S.function_value(_e, "_f2"))
	_S.define(_e, "arc", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawArc", _S.function_value(_e, "_f4"))
	_S.define(_e, "floorRing", _S.function_value(_e, "_f9"))
	_S.define(_e, "glyph", _S.function_value(_e, "_f11"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f12"))
	_S.define(_e, "shades", _S.function_value(_e, "_f13"))
	_S.define(_e, "squeezed", _S.function_value(_e, "_f14"))
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f15")]))
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "bayer", _S.function_value(_e, "_f16"))
	_exports["bayer"] = _S.read(_e, "bayer")
	_exports["tone"] = _S.read(_e, "tone")
	_exports["mote"] = _S.read(_e, "mote")
	_exports["streak"] = _S.read(_e, "streak")
	_exports["arc"] = _S.read(_e, "arc")
	_exports["drawArc"] = _S.read(_e, "drawArc")
	_exports["floorRing"] = _S.read(_e, "floorRing")
	_S.define(_e, "GLYPHS", [[".#.", "#.#", ".#.", ".#.", "#.#"], ["#.#", "#.#", ".#.", "#.#", "#.#"], ["##.", "#.#", "##.", "#..", "#.."], ["#..", "#.#", "###", "#.#", "..#"], [".##", "#..", ".#.", "..#", "##."], ["###", ".#.", "###", ".#.", ".#."], ["#.#", "###", "#.#", "..#", "..#"], [".#.", ".##", ".#.", "##.", ".#."]])
	_exports["GLYPHS"] = _S.read(_e, "GLYPHS")
	_exports["glyph"] = _S.read(_e, "glyph")
	_S.define(_e, "SIGILS", [["..#..", ".#.#.", "#.#.#", "..#..", ".###.", "..#..", ".#.#."], ["#...#", ".#.#.", "..#..", ".###.", "..#..", ".#.#.", "#...#"], ["#....", "##...", "#.#..", "#..#.", "#.#..", "##...", "#...."], ["..#..", "#.#.#", ".###.", "..#..", "..#..", ".#.#.", "#...#"], ["#.#.#", "#.#.#", "#####", "..#..", "..#..", "..#..", ".###."], ["#...#", "##.##", "#.#.#", "#...#", "#.#.#", "##.##", "#...#"], ["..#..", ".#.#.", "#...#", ".#.#.", "..#..", "..#..", "..#.."], ["#..#.", "#.#..", "##...", "#....", "##...", "#.#..", "#..#."]])
	_exports["SIGILS"] = _S.read(_e, "SIGILS")
	_exports["sigil"] = _S.read(_e, "sigil")
	_exports["shades"] = _S.read(_e, "shades")
	_exports["squeezed"] = _S.read(_e, "squeezed")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "I", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "lo", _S.coalesce(_S.arg(_args, 4), func(): return 0.06))
	_S.define(_e, "sharp", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "bayer"), [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "I"), _S.read(_e, "lo")), func(): return _S.binary(">", _S.read(_e, "b"), _S.binary("/", _S.read(_e, "I"), _S.read(_e, "lo"))))):
		return 0
	_S.define(_e, "n", _S.binary("-", _S.prop(_S.read(_e, "R"), "length"), 1))
	_S.define(_e, "f", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "I")]), _S.read(_e, "n")))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "f")]))
	_S.define(_e, "q", (_S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "i")), 0.5), _S.binary("-", 1, _S.read(_e, "sharp"))), 0.5)]) if _S.truth(_S.binary(">", _S.read(_e, "sharp"), 0)) else _S.binary("-", _S.read(_e, "f"), _S.read(_e, "i"))))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), _S.read(_e, "b"))):
		_S.write(_e, "i", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "n"), _S.binary("+", _S.read(_e, "i"), 1)]), "=", false)
	return _S.prop(_S.read(_e, "R"), _S.read(_e, "i"))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "size", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "glow", _S.coalesce(_S.arg(_args, 8), func(): return 0.4))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "len", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [16, _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "sp"), 0.026))]), _S.read(_e, "size")))
	_S.define(_e, "a", (_S.binary("/", _S.read(_e, "k"), 0.35) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.35)) else 1))
	if _S.truth(_S.binary(">", _S.read(_e, "len"), 1.2)):
		_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.35)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.35)), _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.55]), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.4)), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c"), _S.read(_e, "a")])
	if _S.truth(_S.binary(">", _S.read(_e, "glow"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 2.5, _S.read(_e, "size")), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "glow"), _S.read(_e, "k"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "maxLen", _S.coalesce(_S.arg(_args, 7), func(): return 7))
	_S.define(_e, "glow", _S.coalesce(_S.arg(_args, 8), func(): return 0.4))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "sp"), 30), 1, _S.read(_e, "maxLen")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", _S.read(_v0, "L"))
	while _S.truth(_S.binary(">=", _S.read(_v0, "d"), 0)):
		_S.invoke(_S.read(_v0, "p"), "dot", [_S.binary("-", _S.read(_v0, "x"), _S.binary("*", _S.read(_v0, "ux"), _S.read(_v0, "d"))), _S.binary("-", _S.read(_v0, "y"), _S.binary("*", _S.read(_v0, "uy"), _S.read(_v0, "d"))), (_S.read(_v0, "WHITE") if _S.truth(_S.binary("<", _S.read(_v0, "d"), 1)) else (_S.read(_v0, "c") if _S.truth(_S.binary("<", _S.read(_v0, "d"), _S.binary("*", _S.read(_v0, "L"), 0.5))) else _S.call_value(_S.read(_v0, "scale"), [_S.read(_v0, "c"), 0.6]))), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v0, "d"), _S.binary("*", _S.read(_v0, "L"), 0.5))) else _S.binary("-", 1.2, _S.binary("/", _S.read(_v0, "d"), _S.read(_v0, "L")))), _S.read(_v0, "a"))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 0.5, "-=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "glow"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 4, _S.read(_e, "c"), _S.binary("*", _S.read(_e, "glow"), _S.read(_e, "a"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	var _v1 = _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([]))
	_S.define(_e, "jag", _S.coalesce(_S.prop(_v1, "jag"), func(): return 0.3))
	_S.define(_e, "forks", _S.coalesce(_S.prop(_v1, "forks"), func(): return 1))
	_S.define(_e, "forkLen", _S.coalesce(_S.prop(_v1, "forkLen"), func(): return 0.5))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	_S.define(_e, "depth", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "min", [5, _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "Math"), "log2", [_S.binary("/", _S.read(_e, "L"), 1.5)])])])]))
	_S.define(_e, "main", _S.call_value(_S.read(_e, "bolt"), [_S.read(_e, "r"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.merge([{"jag": _S.read(_e, "jag")}, {"depth": _S.read(_e, "depth")}])]))
	_S.define(_e, "out", [_S.merge([{"pts": _S.read(_e, "main")}, {"w": 1}])])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "k", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v2, "k"), _S.read(_v2, "forks")), func(): return _S.binary(">", _S.prop(_S.read(_v2, "main"), "length"), 3))):
		var _v3 = _S.scope(_v2)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "r"), "next", []), 0.7)):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "k", 1, "+=", true)
			continue
		_S.define(_v3, "i", _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v3, "r"), "next", []), _S.binary("-", _S.prop(_S.read(_v3, "main"), "length"), 2))])))
		var _v4 = _S.prop(_S.read(_v3, "main"), _S.read(_v3, "i"))
		_S.define(_v3, "x", _S.prop(_v4, 0))
		_S.define(_v3, "y", _S.prop(_v4, 1))
		var _v5 = _S.prop(_S.read(_v3, "main"), _S.binary("-", _S.read(_v3, "i"), 1))
		_S.define(_v3, "px", _S.prop(_v5, 0))
		_S.define(_v3, "py", _S.prop(_v5, 1))
		_S.define(_v3, "a", _S.binary("+", _S.invoke(_S.read(_v3, "Math"), "atan2", [_S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "py")), _S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "px"))]), _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v3, "r"), "next", []), 0.5)) else 1), _S.binary("+", 0.4, _S.binary("*", _S.invoke(_S.read(_v3, "r"), "next", []), 0.6)))))
		_S.define(_v3, "l", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v3, "L"), _S.read(_v3, "forkLen")), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.invoke(_S.read(_v3, "r"), "next", [])))), _S.binary("-", 1, _S.binary("/", _S.read(_v3, "i"), _S.prop(_S.read(_v3, "main"), "length")))))
		if _S.truth(_S.binary(">", _S.read(_v3, "l"), 1.5)):
			_S.invoke(_S.read(_v3, "out"), "push", [_S.merge([{"pts": _S.call_value(_S.read(_v3, "bolt"), [_S.read(_v3, "r"), _S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "l"))), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "l"))), _S.merge([{"jag": _S.binary("*", _S.read(_v3, "jag"), 1.1)}, {"depth": _S.invoke(_S.read(_v3, "Math"), "max", [1, _S.binary("-", _S.read(_v3, "depth"), 2)])}])])}, {"w": 0.55}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "k", 1, "+=", true)
	return _S.read(_e, "out")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "paths", _S.arg(_args, 1))
	_S.define(_e, "cols", _S.arg(_args, 2))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "glowK", _S.coalesce(_S.arg(_args, 4), func(): return 0.5))
	_S.define(_e, "steps", _S.function_value(_e, "_f5"))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.45)):
		_S.call_value(_S.read(_e, "steps"), [_S.function_value(_e, "_f6")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.25)):
		_S.call_value(_S.read(_e, "steps"), [_S.function_value(_e, "_f7")])
	_S.call_value(_S.read(_e, "steps"), [_S.function_value(_e, "_f8")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "fn", _S.arg(_args, 0))
	for _v6 in _S.array(_S.read(_e, "paths")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "path", _v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v8, "path"), "pts"), "length"), 1))):
			var _v9 = _S.scope(_v8)
			var _v10 = _S.prop(_S.prop(_S.read(_v9, "path"), "pts"), _S.read(_v9, "i"))
			_S.define(_v9, "ax", _S.prop(_v10, 0))
			_S.define(_v9, "ay", _S.prop(_v10, 1))
			var _v11 = _S.prop(_S.prop(_S.read(_v9, "path"), "pts"), _S.binary("+", _S.read(_v9, "i"), 1))
			_S.define(_v9, "bx", _S.prop(_v11, 0))
			_S.define(_v9, "by", _S.prop(_v11, 1))
			_S.define(_v9, "l", _S.invoke(_S.read(_v9, "Math"), "max", [1, _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.binary("-", _S.read(_v9, "bx"), _S.read(_v9, "ax")), _S.binary("-", _S.read(_v9, "by"), _S.read(_v9, "ay"))])]))
			var _v12 = _S.scope(_v9)
			_S.define(_v12, "d", 0)
			while _S.truth(_S.binary("<=", _S.read(_v12, "d"), _S.read(_v12, "l"))):
				_S.call_value(_S.read(_v12, "fn"), [_S.binary("+", _S.read(_v12, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v12, "bx"), _S.read(_v12, "ax")), _S.read(_v12, "d")), _S.read(_v12, "l"))), _S.binary("+", _S.read(_v12, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v12, "by"), _S.read(_v12, "ay")), _S.read(_v12, "d")), _S.read(_v12, "l"))), _S.read(_v12, "path"), _S.read(_v12, "i"), _S.binary("===", _S.read(_v12, "d"), 0)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "d", 0.5, "+=", false)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "path", _S.arg(_args, 2))
	if _S.truth(_S.binary(">=", _S.prop(_S.read(_e, "path"), "w"), 1)):
		for _v13 in _S.array(_S.read(_e, "CROSS")):
			var _v14 = _S.scope(_e)
			var _v15 = _v13
			_S.define(_v14, "dx", _S.prop(_v15, 0))
			_S.define(_v14, "dy", _S.prop(_v15, 1))
			_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.read(_v14, "x"), _S.binary("*", _S.read(_v14, "dx"), 1.5)), _S.binary("+", _S.read(_v14, "y"), _S.binary("*", _S.read(_v14, "dy"), 1.5)), _S.prop(_S.read(_v14, "cols"), "halo"), _S.binary("*", _S.binary("-", _S.read(_v14, "k"), 0.45), 1.6)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "path", _S.arg(_args, 2))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "path"), "w"), 0.4)):
		_S.last([_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "cols"), "body")]), _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "cols"), "body")])])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "path", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "first", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "cols"), "core") if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_e, "path"), "w"), 1), func(): return _S.binary(">", _S.read(_e, "k"), 0.3))) else _S.prop(_S.read(_e, "cols"), "body"))])
	if _S.truth(_S.logical("&&", _S.read(_e, "first"), func(): return _S.binary("===", _S.binary("%", _S.read(_e, "i"), 3), 0))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", (9 if _S.truth(_S.binary(">=", _S.prop(_S.read(_e, "path"), "w"), 1)) else 5), _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "k"), 0.5))), _S.prop(_S.read(_e, "cols"), "glow"), _S.binary("*", _S.binary("*", _S.read(_e, "glowK"), _S.read(_e, "k")), _S.prop(_S.read(_e, "path"), "w"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "sy", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "keep", _S.coalesce(_S.arg(_args, 7), func(): return null))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.5)):
		return null
	_S.define(_e, "fc", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	_S.define(_e, "fa", _S.binary("===", _S.unary("typeof", _S.read(_e, "a")), "function"))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "sy")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "cx"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "ry")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "ry")), 1), _S.function_value(_e, "_f10")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "nx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "r")))
	_S.define(_e, "ny", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.invoke(_S.read(_e, "Math"), "max", [0.3, _S.read(_e, "ry")])))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "nx"), _S.read(_e, "ny")]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.000001)):
		return null
	_S.define(_e, "g", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "nx"), _S.read(_e, "r")), _S.binary("/", _S.read(_e, "ny"), _S.invoke(_S.read(_e, "Math"), "max", [0.3, _S.read(_e, "ry")]))]), _S.read(_e, "d")))
	if _S.truth(_S.binary(">", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "d"), 1)]), _S.read(_e, "g")), 0.5)):
		return null
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "ny"), _S.read(_e, "nx")]))
	if _S.truth(_S.logical("&&", _S.read(_e, "keep"), func(): return _S.unary("!", _S.call_value(_S.read(_e, "keep"), [_S.read(_e, "ang")])))):
		return null
	_S.set_prop(_S.read(_e, "o"), "c", (_S.call_value(_S.read(_e, "c"), [_S.read(_e, "ang")]) if _S.truth(_S.read(_e, "fc")) else _S.read(_e, "c")), "=", false)
	_S.set_prop(_S.read(_e, "o"), "a", (_S.call_value(_S.read(_e, "a"), [_S.read(_e, "ang")]) if _S.truth(_S.read(_e, "fa")) else _S.read(_e, "a")), "=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.define(_e, "under", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "g", _S.prop(_S.read(_e, "GLYPHS"), _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "GLYPHS"), "length")), _S.prop(_S.read(_e, "GLYPHS"), "length")), _S.prop(_S.read(_e, "GLYPHS"), "length"))))
	_S.define(_e, "X", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 1))
	_S.define(_e, "Y", _S.binary("+", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), _S.prop(_S.read(_e, "g"), "length")), 1))
	if _S.truth(_S.read(_e, "under")):
		_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "g"), _S.merge([]), _S.read(_e, "X"), _S.binary("+", _S.read(_e, "Y"), 1), _S.merge([{"tint": _S.read(_e, "under")}, {"a": _S.read(_e, "a")}])])
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "g"), _S.merge([]), _S.read(_e, "X"), _S.read(_e, "Y"), _S.merge([{"tint": _S.read(_e, "c")}, {"a": _S.read(_e, "a")}])])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.define(_e, "edge", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "g", _S.prop(_S.read(_e, "SIGILS"), _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "SIGILS"), "length")), _S.prop(_S.read(_e, "SIGILS"), "length")), _S.prop(_S.read(_e, "SIGILS"), "length"))))
	_S.define(_e, "X", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 2))
	_S.define(_e, "Y", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), 3))
	if _S.truth(_S.read(_e, "edge")):
		for _v16 in _S.array(_S.read(_e, "CROSS")):
			var _v17 = _S.scope(_e)
			var _v18 = _v16
			_S.define(_v17, "dx", _S.prop(_v18, 0))
			_S.define(_v17, "dy", _S.prop(_v18, 1))
			_S.invoke(_S.read(_v17, "p"), "sprite", [_S.read(_v17, "g"), _S.merge([]), _S.binary("+", _S.read(_v17, "X"), _S.read(_v17, "dx")), _S.binary("+", _S.read(_v17, "Y"), _S.read(_v17, "dy")), _S.merge([{"tint": _S.read(_v17, "edge")}, {"a": _S.read(_v17, "a")}])])
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "g"), _S.merge([]), _S.read(_e, "X"), _S.read(_e, "Y"), _S.merge([{"tint": _S.read(_e, "c")}, {"a": _S.read(_e, "a")}])])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "s", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.prop(_S.read(_e, "A"), "w"), _S.prop(_S.read(_e, "A"), "h"))]))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.prop(_S.read(_v19, "s"), "length"))):
		if _S.truth(_S.prop(_S.prop(_S.prop(_S.read(_v19, "A"), "mask"), "data"), _S.read(_v19, "i"))):
			_S.set_prop(_S.read(_v19, "s"), _S.read(_v19, "i"), ((1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v19, "luma"), [_S.prop(_S.prop(_S.read(_v19, "A"), "pixels"), _S.read(_v19, "i"))]), 0.24)) else (2 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v19, "luma"), [_S.prop(_S.prop(_S.read(_v19, "A"), "pixels"), _S.read(_v19, "i"))]), 0.62)) else 3)) if _S.truth(_S.prop(_S.read(_v19, "A"), "pixels")) else 2), "=", false)
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	return _S.read(_e, "s")

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "sh", _S.arg(_args, 2))
	_S.define(_e, "sx", _S.arg(_args, 3))
	_S.define(_e, "body", _S.arg(_args, 4))
	_S.define(_e, "edge", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "dx", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	if _S.truth(_S.binary("<=", _S.read(_e, "sx"), 0.02)):
		return null
	_S.define(_e, "cx", _S.binary("+", _S.prop(_S.read(_e, "A"), "x"), _S.binary("/", _S.prop(_S.read(_e, "A"), "w"), 2)))
	_S.define(_e, "half", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "A"), "w"), 2), 1))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "y"), _S.prop(_S.read(_v20, "A"), "h"))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "x", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("-", _S.read(_v21, "cx"), _S.binary("*", _S.read(_v21, "half"), _S.read(_v21, "sx")))]))
		while _S.truth(_S.binary("<=", _S.read(_v21, "x"), _S.invoke(_S.read(_v21, "Math"), "ceil", [_S.binary("+", _S.read(_v21, "cx"), _S.binary("*", _S.read(_v21, "half"), _S.read(_v21, "sx")))]))):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "i", _S.binary("-", _S.invoke(_S.read(_v22, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v22, "cx"), _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v22, "x"), 0.5), _S.read(_v22, "cx")), _S.read(_v22, "sx"))), 0.5)]), _S.prop(_S.read(_v22, "A"), "x")))
			_S.define(_v22, "v", (0 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v22, "i"), 0), func(): return _S.binary(">=", _S.read(_v22, "i"), _S.prop(_S.read(_v22, "A"), "w")))) else _S.prop(_S.read(_v22, "sh"), _S.binary("+", _S.binary("*", _S.read(_v22, "y"), _S.prop(_S.read(_v22, "A"), "w")), _S.read(_v22, "i")))))
			if _S.truth(_S.read(_v22, "v")):
				_S.invoke(_S.read(_v22, "p"), "dot", [_S.binary("+", _S.read(_v22, "x"), _S.read(_v22, "dx")), _S.binary("+", _S.prop(_S.read(_v22, "A"), "y"), _S.read(_v22, "y")), (_S.read(_v22, "edge") if _S.truth(_S.binary("===", _S.read(_v22, "v"), 1)) else _S.read(_v22, "body")), _S.read(_v22, "a")])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "x", 1, "+=", true)
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "y", 1, "+=", true)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.read(_e, "v"), 0.5), 16)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "BAYER"), _S.binary("|", _S.binary("<<", _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 3), 2), _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 3)))
