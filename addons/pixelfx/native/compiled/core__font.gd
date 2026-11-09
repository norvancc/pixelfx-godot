@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/font.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "build", _S.function_value(_e, "_f0"))
	_S.define(_e, "textWidth", _S.function_value(_e, "_f3"))
	_S.define(_e, "rasterText", _S.function_value(_e, "_f4"))
	_S.define(_e, "MINI", _S.merge([{"A": ".#.|#.#|###|#.#|#.#"}, {"B": "##.|#.#|##.|#.#|##."}, {"C": ".##|#..|#..|#..|.##"}, {"D": "##.|#.#|#.#|#.#|##."}, {"E": "###|#..|##.|#..|###"}, {"F": "###|#..|##.|#..|#.."}, {"G": ".##|#..|#.#|#.#|.##"}, {"H": "#.#|#.#|###|#.#|#.#"}, {"I": "###|.#.|.#.|.#.|###"}, {"J": "..#|..#|..#|#.#|.#."}, {"K": "#.#|#.#|##.|#.#|#.#"}, {"L": "#..|#..|#..|#..|###"}, {"M": "#.#|###|###|#.#|#.#"}, {"N": "##.|#.#|#.#|#.#|#.#"}, {"O": ".#.|#.#|#.#|#.#|.#."}, {"P": "##.|#.#|##.|#..|#.."}, {"Q": ".#.|#.#|#.#|##.|.##"}, {"R": "##.|#.#|##.|#.#|#.#"}, {"S": ".##|#..|.#.|..#|##."}, {"T": "###|.#.|.#.|.#.|.#."}, {"U": "#.#|#.#|#.#|#.#|###"}, {"V": "#.#|#.#|#.#|#.#|.#."}, {"W": "#.#|#.#|###|###|#.#"}, {"X": "#.#|#.#|.#.|#.#|#.#"}, {"Y": "#.#|#.#|.#.|.#.|.#."}, {"Z": "###|..#|.#.|#..|###"}, {0: "###|#.#|#.#|#.#|###"}, {1: ".#.|##.|.#.|.#.|###"}, {2: "##.|..#|.#.|#..|###"}, {3: "##.|..#|.#.|..#|##."}, {4: "#.#|#.#|###|..#|..#"}, {5: "###|#..|##.|..#|##."}, {6: ".##|#..|###|#.#|###"}, {7: "###|..#|.#.|.#.|.#."}, {8: "###|#.#|###|#.#|###"}, {9: "###|#.#|###|..#|##."}, {"+": "...|.#.|###|.#.|..."}, {"-": "...|...|###|...|..."}, {"!": "#|#|#|.|#"}, {"?": "##.|..#|.#.|...|.#."}, {".": ".|.|.|.|#"}, {",": "..|..|..|.#|#."}, {":": ".|#|.|#|."}, {"/": "..#|..#|.#.|#..|#.."}, {"%": "#.#|..#|.#.|#..|#.#"}, {"x": "...|#.#|.#.|#.#|..."}, {"*": "#.#|.#.|#.#|...|..."}, {"'": "#|#|.|.|."}, {"(": ".#|#.|#.|#.|.#"}, {")": "#.|.#|.#|.#|#."}, {"<": "..#|.#.|#..|.#.|..#"}, {">": "#..|.#.|..#|.#.|#.."}, {"=": "...|###|...|###|..."}, {"_": "...|...|...|...|###"}, {"#": "#.#|###|#.#|###|#.#"}]))
	_S.define(_e, "BIG", _S.merge([{"A": ".###.|#...#|#...#|#####|#...#|#...#|#...#"}, {"B": "####.|#...#|#...#|####.|#...#|#...#|####."}, {"C": ".###.|#...#|#....|#....|#....|#...#|.###."}, {"D": "####.|#...#|#...#|#...#|#...#|#...#|####."}, {"E": "#####|#....|#....|####.|#....|#....|#####"}, {"F": "#####|#....|#....|####.|#....|#....|#...."}, {"G": ".###.|#...#|#....|#.###|#...#|#...#|.####"}, {"H": "#...#|#...#|#...#|#####|#...#|#...#|#...#"}, {"I": "###|.#.|.#.|.#.|.#.|.#.|###"}, {"J": "..###|...#.|...#.|...#.|...#.|#..#.|.##.."}, {"K": "#...#|#..#.|#.#..|##...|#.#..|#..#.|#...#"}, {"L": "#....|#....|#....|#....|#....|#....|#####"}, {"M": "#...#|##.##|#.#.#|#.#.#|#...#|#...#|#...#"}, {"N": "#...#|#...#|##..#|#.#.#|#..##|#...#|#...#"}, {"O": ".###.|#...#|#...#|#...#|#...#|#...#|.###."}, {"P": "####.|#...#|#...#|####.|#....|#....|#...."}, {"Q": ".###.|#...#|#...#|#...#|#.#.#|#..#.|.##.#"}, {"R": "####.|#...#|#...#|####.|#.#..|#..#.|#...#"}, {"S": ".####|#....|#....|.###.|....#|....#|####."}, {"T": "#####|..#..|..#..|..#..|..#..|..#..|..#.."}, {"U": "#...#|#...#|#...#|#...#|#...#|#...#|.###."}, {"V": "#...#|#...#|#...#|#...#|#...#|.#.#.|..#.."}, {"W": "#...#|#...#|#...#|#.#.#|#.#.#|#.#.#|.#.#."}, {"X": "#...#|#...#|.#.#.|..#..|.#.#.|#...#|#...#"}, {"Y": "#...#|#...#|.#.#.|..#..|..#..|..#..|..#.."}, {"Z": "#####|....#|...#.|..#..|.#...|#....|#####"}, {0: ".###.|#...#|#..##|#.#.#|##..#|#...#|.###."}, {1: ".#.|##.|.#.|.#.|.#.|.#.|###"}, {2: ".###.|#...#|....#|...#.|..#..|.#...|#####"}, {3: "#####|...#.|..#..|...#.|....#|#...#|.###."}, {4: "...#.|..##.|.#.#.|#..#.|#####|...#.|...#."}, {5: "#####|#....|####.|....#|....#|#...#|.###."}, {6: "..##.|.#...|#....|####.|#...#|#...#|.###."}, {7: "#####|....#|...#.|..#..|.#...|.#...|.#..."}, {8: ".###.|#...#|#...#|.###.|#...#|#...#|.###."}, {9: ".###.|#...#|#...#|.####|....#|...#.|.##.."}, {"!": "#|#|#|#|#|.|#"}, {"?": ".###.|#...#|....#|...#.|..#..|.....|..#.."}, {"+": ".....|..#..|..#..|#####|..#..|..#..|....."}, {"-": "....|....|....|####|....|....|...."}, {".": ".|.|.|.|.|.|#"}, {",": "..|..|..|..|..|.#|#."}, {":": ".|.|#|.|.|#|."}, {"/": "....#|....#|...#.|..#..|.#...|#....|#...."}, {"%": "##...|##..#|...#.|..#..|.#...|#..##|...##"}, {"x": ".....|.....|#...#|.#.#.|..#..|.#.#.|#...#"}, {"*": ".....|..#..|#.#.#|.###.|#.#.#|..#..|....."}, {"'": "#|#|.|.|.|.|."}, {"<": "...#|..#.|.#..|#...|.#..|..#.|...#"}, {">": "#...|.#..|..#.|...#|..#.|.#..|#..."}, {"=": "....|....|####|....|####|....|...."}, {"(": "..#|.#.|#..|#..|#..|.#.|..#"}, {")": "#..|.#.|..#|..#|..#|.#.|#.."}, {"#": ".#.#.|.#.#.|#####|.#.#.|#####|.#.#.|.#.#."}]))
	_S.define(_e, "FONTS", _S.merge([{"mini": _S.merge([{"h": 5}, {"space": 2}, {"gap": 1}, {"glyphs": _S.call_value(_S.read(_e, "build"), [_S.read(_e, "MINI"), 5])}])}, {"big": _S.merge([{"h": 7}, {"space": 3}, {"gap": 1}, {"glyphs": _S.call_value(_S.read(_e, "build"), [_S.read(_e, "BIG"), 7])}])}]))
	_exports["FONTS"] = _S.read(_e, "FONTS")
	_exports["textWidth"] = _S.read(_e, "textWidth")
	_exports["rasterText"] = _S.read(_e, "rasterText")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "table", _S.arg(_args, 0))
	_S.define(_e, "h", _S.arg(_args, 1))
	_S.define(_e, "out", _S.merge([]))
	for _v0 in _S.array(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "table")])):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "ch", _S.prop(_v2, 0))
		_S.define(_v1, "src", _S.prop(_v2, 1))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "rows", _S.invoke(_S.read(_v3, "src"), "split", ["|"]))
		_S.set_prop(_S.read(_v3, "out"), _S.read(_v3, "ch"), _S.merge([{"w": _S.prop(_S.prop(_S.read(_v3, "rows"), 0), "length")}, {"rows": _S.invoke(_S.read(_v3, "rows"), "map", [_S.function_value(_v3, "_f1")])}]), "=", false)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v3, "rows"), "length"), _S.read(_v3, "h"))):
			_S.fail(_S.construct(_S.read(_v3, "Error"), [("glyph " + _S.string(_S.read(_v3, "ch")) + " has " + _S.string(_S.prop(_S.read(_v3, "rows"), "length")) + " rows, expected " + _S.string(_S.read(_v3, "h")) + "")]))
			return null
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.concat([_S.array(_S.read(_e, "r"))]), "map", [_S.function_value(_e, "_f2")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("===", _S.read(_e, "c"), "#")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "str", _S.arg(_args, 0))
	_S.define(_e, "font", _S.coalesce(_S.arg(_args, 1), func(): return "mini"))
	_S.define(_e, "F", _S.prop(_S.read(_e, "FONTS"), _S.read(_e, "font")))
	_S.define(_e, "w", 0)
	for _v4 in _S.array(_S.call_value(_S.read(_e, "String"), [_S.read(_e, "str")])):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "ch", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "g", _S.logical("??", _S.prop(_S.prop(_S.read(_v6, "F"), "glyphs"), _S.read(_v6, "ch")), func(): return _S.prop(_S.prop(_S.read(_v6, "F"), "glyphs"), _S.invoke(_S.read(_v6, "ch"), "toUpperCase", []))))
		_S.write(_v6, "w", _S.binary("+", (_S.prop(_S.read(_v6, "g"), "w") if _S.truth(_S.read(_v6, "g")) else _S.prop(_S.read(_v6, "F"), "space")), _S.prop(_S.read(_v6, "F"), "gap")), "+=", false)
	return _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "w"), _S.prop(_S.read(_e, "F"), "gap"))])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "str", _S.arg(_args, 0))
	_S.define(_e, "font", _S.arg(_args, 1))
	_S.define(_e, "plot", _S.arg(_args, 2))
	_S.define(_e, "F", _S.prop(_S.read(_e, "FONTS"), _S.read(_e, "font")))
	_S.define(_e, "x", 0)
	for _v7 in _S.array(_S.call_value(_S.read(_e, "String"), [_S.read(_e, "str")])):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "ch", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "g", _S.logical("??", _S.prop(_S.prop(_S.read(_v9, "F"), "glyphs"), _S.read(_v9, "ch")), func(): return _S.prop(_S.prop(_S.read(_v9, "F"), "glyphs"), _S.invoke(_S.read(_v9, "ch"), "toUpperCase", []))))
		if _S.truth(_S.unary("!", _S.read(_v9, "g"))):
			var _v10 = _S.scope(_v9)
			_S.write(_v10, "x", _S.binary("+", _S.prop(_S.read(_v10, "F"), "space"), _S.prop(_S.read(_v10, "F"), "gap")), "+=", false)
			continue
		var _v11 = _S.scope(_v9)
		_S.define(_v11, "r", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "r"), _S.prop(_S.read(_v11, "F"), "h"))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "c", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "c"), _S.prop(_S.read(_v12, "g"), "w"))):
				if _S.truth(_S.prop(_S.prop(_S.prop(_S.read(_v12, "g"), "rows"), _S.read(_v12, "r")), _S.read(_v12, "c"))):
					_S.call_value(_S.read(_v12, "plot"), [_S.binary("+", _S.read(_v12, "x"), _S.read(_v12, "c")), _S.read(_v12, "r")])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "c", 1, "+=", true)
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "r", 1, "+=", true)
		_S.write(_v9, "x", _S.binary("+", _S.prop(_S.read(_v9, "g"), "w"), _S.prop(_S.read(_v9, "F"), "gap")), "+=", false)
	return null
