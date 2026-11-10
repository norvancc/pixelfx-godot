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
	_S.define(_e, "MINI", _S.merge([{"A": ".#.|#.#|###|#.#|#.#"}, {"B": "##.|#.#|##.|#.#|##."}, {"C": ".##|#..|#..|#..|.##"}, {"D": "##.|#.#|#.#|#.#|##."}, {"E": "###|#..|##.|#..|###"}, {"F": "###|#..|##.|#..|#.."}, {"G": ".##|#..|#.#|#.#|.##"}, {"H": "#.#|#.#|###|#.#|#.#"}, {"I": "###|.#.|.#.|.#.|###"}, {"J": "..#|..#|..#|#.#|.#."}, {"K": "#.#|#.#|##.|#.#|#.#"}, {"L": "#..|#..|#..|#..|###"}, {"M": "#.#|###|###|#.#|#.#"}, {"N": "##.|#.#|#.#|#.#|#.#"}, {"O": ".#.|#.#|#.#|#.#|.#."}, {"P": "##.|#.#|##.|#..|#.."}, {"Q": ".#.|#.#|#.#|##.|.##"}, {"R": "##.|#.#|##.|#.#|#.#"}, {"S": ".##|#..|.#.|..#|##."}, {"T": "###|.#.|.#.|.#.|.#."}, {"U": "#.#|#.#|#.#|#.#|###"}, {"V": "#.#|#.#|#.#|#.#|.#."}, {"W": "#.#|#.#|###|###|#.#"}, {"X": "#.#|#.#|.#.|#.#|#.#"}, {"Y": "#.#|#.#|.#.|.#.|.#."}, {"Z": "###|..#|.#.|#..|###"}, {"0": "###|#.#|#.#|#.#|###"}, {"1": ".#.|##.|.#.|.#.|###"}, {"2": "##.|..#|.#.|#..|###"}, {"3": "##.|..#|.#.|..#|##."}, {"4": "#.#|#.#|###|..#|..#"}, {"5": "###|#..|##.|..#|##."}, {"6": ".##|#..|###|#.#|###"}, {"7": "###|..#|.#.|.#.|.#."}, {"8": "###|#.#|###|#.#|###"}, {"9": "###|#.#|###|..#|##."}, {"+": "...|.#.|###|.#.|..."}, {"-": "...|...|###|...|..."}, {"!": "#|#|#|.|#"}, {"?": "##.|..#|.#.|...|.#."}, {".": ".|.|.|.|#"}, {",": "..|..|..|.#|#."}, {":": ".|#|.|#|."}, {"/": "..#|..#|.#.|#..|#.."}, {"%": "#.#|..#|.#.|#..|#.#"}, {"x": "...|#.#|.#.|#.#|..."}, {"*": "#.#|.#.|#.#|...|..."}, {"'": "#|#|.|.|."}, {"(": ".#|#.|#.|#.|.#"}, {")": "#.|.#|.#|.#|#."}, {"<": "..#|.#.|#..|.#.|..#"}, {">": "#..|.#.|..#|.#.|#.."}, {"=": "...|###|...|###|..."}, {"_": "...|...|...|...|###"}, {"#": "#.#|###|#.#|###|#.#"}]))
	_S.define(_e, "BIG", _S.merge([{"A": ".###.|#...#|#...#|#####|#...#|#...#|#...#"}, {"B": "####.|#...#|#...#|####.|#...#|#...#|####."}, {"C": ".###.|#...#|#....|#....|#....|#...#|.###."}, {"D": "####.|#...#|#...#|#...#|#...#|#...#|####."}, {"E": "#####|#....|#....|####.|#....|#....|#####"}, {"F": "#####|#....|#....|####.|#....|#....|#...."}, {"G": ".###.|#...#|#....|#.###|#...#|#...#|.####"}, {"H": "#...#|#...#|#...#|#####|#...#|#...#|#...#"}, {"I": "###|.#.|.#.|.#.|.#.|.#.|###"}, {"J": "..###|...#.|...#.|...#.|...#.|#..#.|.##.."}, {"K": "#...#|#..#.|#.#..|##...|#.#..|#..#.|#...#"}, {"L": "#....|#....|#....|#....|#....|#....|#####"}, {"M": "#...#|##.##|#.#.#|#.#.#|#...#|#...#|#...#"}, {"N": "#...#|#...#|##..#|#.#.#|#..##|#...#|#...#"}, {"O": ".###.|#...#|#...#|#...#|#...#|#...#|.###."}, {"P": "####.|#...#|#...#|####.|#....|#....|#...."}, {"Q": ".###.|#...#|#...#|#...#|#.#.#|#..#.|.##.#"}, {"R": "####.|#...#|#...#|####.|#.#..|#..#.|#...#"}, {"S": ".####|#....|#....|.###.|....#|....#|####."}, {"T": "#####|..#..|..#..|..#..|..#..|..#..|..#.."}, {"U": "#...#|#...#|#...#|#...#|#...#|#...#|.###."}, {"V": "#...#|#...#|#...#|#...#|#...#|.#.#.|..#.."}, {"W": "#...#|#...#|#...#|#.#.#|#.#.#|#.#.#|.#.#."}, {"X": "#...#|#...#|.#.#.|..#..|.#.#.|#...#|#...#"}, {"Y": "#...#|#...#|.#.#.|..#..|..#..|..#..|..#.."}, {"Z": "#####|....#|...#.|..#..|.#...|#....|#####"}, {"0": ".###.|#...#|#..##|#.#.#|##..#|#...#|.###."}, {"1": ".#.|##.|.#.|.#.|.#.|.#.|###"}, {"2": ".###.|#...#|....#|...#.|..#..|.#...|#####"}, {"3": "#####|...#.|..#..|...#.|....#|#...#|.###."}, {"4": "...#.|..##.|.#.#.|#..#.|#####|...#.|...#."}, {"5": "#####|#....|####.|....#|....#|#...#|.###."}, {"6": "..##.|.#...|#....|####.|#...#|#...#|.###."}, {"7": "#####|....#|...#.|..#..|.#...|.#...|.#..."}, {"8": ".###.|#...#|#...#|.###.|#...#|#...#|.###."}, {"9": ".###.|#...#|#...#|.####|....#|...#.|.##.."}, {"!": "#|#|#|#|#|.|#"}, {"?": ".###.|#...#|....#|...#.|..#..|.....|..#.."}, {"+": ".....|..#..|..#..|#####|..#..|..#..|....."}, {"-": "....|....|....|####|....|....|...."}, {".": ".|.|.|.|.|.|#"}, {",": "..|..|..|..|..|.#|#."}, {":": ".|.|#|.|.|#|."}, {"/": "....#|....#|...#.|..#..|.#...|#....|#...."}, {"%": "##...|##..#|...#.|..#..|.#...|#..##|...##"}, {"x": ".....|.....|#...#|.#.#.|..#..|.#.#.|#...#"}, {"*": ".....|..#..|#.#.#|.###.|#.#.#|..#..|....."}, {"'": "#|#|.|.|.|.|."}, {"<": "...#|..#.|.#..|#...|.#..|..#.|...#"}, {">": "#...|.#..|..#.|...#|..#.|.#..|#..."}, {"=": "....|....|####|....|####|....|...."}, {"(": "..#|.#.|#..|#..|#..|.#.|..#"}, {")": "#..|.#.|..#|..#|..#|.#.|#.."}, {"#": ".#.#.|.#.#.|#####|.#.#.|#####|.#.#.|.#.#."}]))
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

static func _f1(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_S.concat([_S.array(_n_r_b0)]),"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	return _S.binary("===",_n_c_b0,"#")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_FONTS = _S.read(_parent,"FONTS")
	var _n_String = _S.read(_parent,"String")
	var _n_str_b0 = _S.arg(_args,0)
	var _n_font_b1 = _S.coalesce(_S.arg(_args,1),func():return "mini")
	var _n_F_b2 = _S.index_value(_n_FONTS,_n_font_b1)
	var _n_w_b3 = 0
	for _iter_0 in _S.array(_S.call_value(_n_String,[_n_str_b0])):
		var _n_ch_b4 = _iter_0
		var _n_g_b5 = (_S.index_value(_S.named_value(_n_F_b2,"glyphs"),_n_ch_b4) if _S.index_value(_S.named_value(_n_F_b2,"glyphs"),_n_ch_b4)!=null else _S.index_value(_S.named_value(_n_F_b2,"glyphs"),_S.invoke(_n_ch_b4,"toUpperCase",[])))
		_n_w_b3 += ((_S.named_value(_n_g_b5,"w") if _S.truth(_n_g_b5) else _S.named_value(_n_F_b2,"space")) + _S.named_value(_n_F_b2,"gap"))
	return maxf(0,(_n_w_b3 - _S.named_value(_n_F_b2,"gap")))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_FONTS = _S.read(_parent,"FONTS")
	var _n_String = _S.read(_parent,"String")
	var _n_str_b0 = _S.arg(_args,0)
	var _n_font_b1 = _S.arg(_args,1)
	var _n_plot_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.index_value(_n_FONTS,_n_font_b1)
	var _n_x_b4 = 0
	for _iter_0 in _S.array(_S.call_value(_n_String,[_n_str_b0])):
		var _n_ch_b5 = _iter_0
		var _n_g_b6 = (_S.index_value(_S.named_value(_n_F_b3,"glyphs"),_n_ch_b5) if _S.index_value(_S.named_value(_n_F_b3,"glyphs"),_n_ch_b5)!=null else _S.index_value(_S.named_value(_n_F_b3,"glyphs"),_S.invoke(_n_ch_b5,"toUpperCase",[])))
		if _S.truth(not _S.truth(_n_g_b6)):
			_n_x_b4 += (_S.named_value(_n_F_b3,"space") + _S.named_value(_n_F_b3,"gap"))
			continue
		if true:
			var _n_r_b7 = 0
			while _S.truth((_n_r_b7 < _S.named_value(_n_F_b3,"h"))):
				if true:
					var _n_c_b8 = 0
					while _S.truth((_n_c_b8 < _S.named_value(_n_g_b6,"w"))):
						if _S.truth(_S.index_value(_S.index_value(_S.named_value(_n_g_b6,"rows"),_n_r_b7),_n_c_b8)):
							_S.call_value(_n_plot_b2,[(_n_x_b4 + _n_c_b8), _n_r_b7])
						_n_c_b8 += 1.0
				_n_r_b7 += 1.0
		_n_x_b4 += (_S.named_value(_n_g_b6,"w") + _S.named_value(_n_F_b3,"gap"))
	return null
