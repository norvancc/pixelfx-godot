@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/cursed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "trails", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Cursed"}, {"desc": "Hexed: violet smoke rises off the body in winding trails, a dark stain creeps up from the feet with a glowing edge, the eyes burn, a skull glitches in overhead."}, {"tags": ["status", "curse", "hex", "dark", "debuff", "shadow", "loop"]}, {"size": [64, 84]}, {"origin": [32, 76]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0c0612", "#1f0f2e", "#3a1a55", "#5e2a85", "#8a3fc0", "#b86ef0", "#e0b0ff", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HUNCH", _S.merge([{"turn": 1}, {"crouch": 4}, {"lean": 3}, {"hy": 1}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 33)}, {"bx": 8}, {"by": _S.unary("-", 33)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "HUNCH")], [0.6, _S.merge([_S.read(_e, "HUNCH"), {"crouch": 5}])], [1.2, _S.merge([_S.read(_e, "HUNCH"), {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "HUNCH"), {"crouch": 5}])], [2.4, _S.read(_e, "HUNCH")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SKULL", _S.call_value(_S.read(_e, "bitmap"), [["...#####...", ".#########.", "###########", "##eee#eee##", "##eEe#eEe##", "##eee#eee##", "#####.#####", ".####.####.", "..#######..", "..#.#.#.#..", "...#####..."]]))
	_S.define(_e, "IN", 0.5)
	_S.define(_e, "HOLD", 0.75)
	_S.define(_e, "OUT", 1.85)
	_S.define(_e, "GONE", 2.1)
	_S.define(_e, "tide", _S.function_value(_e, "_f6"))
	_S.define(_e, "reach", _S.function_value(_e, "_f7"))
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
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.define(_e, "front", _S.arg(_args, 6))
	_S.define(_e, "spots", [[0.12, _S.unary("-", 1)], [0.1, 1], [0.5, _S.unary("-", 1)], [0.48, 1]])
	_S.invoke(_S.read(_e, "spots"), "forEach", [_S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "q", _S.prop(_v0, 0))
	_S.define(_e, "side", _S.prop(_v0, 1))
	_S.define(_e, "j", _S.arg(_args, 1))
	if _S.truth(_S.binary("!==", _S.binary("===", _S.binary("%", _S.read(_e, "j"), 2), 0), _S.read(_e, "front"))):
		return null
	_S.define(_e, "my", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "S"), "h"), _S.read(_e, "q"))]))
	var _v1 = _S.logical("??", _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.read(_e, "my")), func(): return [0, 0])
	_S.define(_e, "l", _S.prop(_v1, 0))
	_S.define(_e, "r", _S.prop(_v1, 1))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), (_S.read(_e, "l") if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else _S.binary("+", _S.read(_e, "r"), 1))))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "my")))
	_S.define(_e, "life", 1.6)
	_S.define(_e, "n", 18)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", _S.binary("-", _S.read(_v2, "n"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v2, "i"), 0)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("-", _S.read(_v3, "t"), _S.binary("*", _S.binary("/", _S.read(_v3, "i"), _S.read(_v3, "n")), _S.read(_v3, "D"))), _S.binary("*", _S.read(_v3, "j"), 0.37)), _S.read(_v3, "D")), _S.read(_v3, "D")), _S.read(_v3, "D")))
		_S.define(_v3, "tb", _S.binary("-", _S.read(_v3, "t"), _S.read(_v3, "age")))
		_S.define(_v3, "u", _S.binary("/", _S.read(_v3, "age"), _S.read(_v3, "life")))
		if _S.truth(_S.binary(">=", _S.read(_v3, "u"), 1)):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "-=", true)
			continue
		_S.define(_v3, "sway", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v3, "tb"), _S.read(_v3, "D")), _S.read(_v3, "TAU")), 2), _S.binary("*", _S.read(_v3, "j"), 1.7))]), 4), _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("*", _S.read(_v3, "u"), 1.6)])))
		_S.define(_v3, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v3, "x0"), _S.binary("*", _S.binary("*", _S.read(_v3, "side"), _S.read(_v3, "u")), 7)), _S.read(_v3, "sway")), _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "i"), _S.read(_v3, "j"), 71]), 0.5), 2.5), _S.read(_v3, "u"))))
		_S.define(_v3, "y", _S.binary("-", _S.binary("-", _S.read(_v3, "y0"), _S.binary("*", _S.read(_v3, "age"), 19)), _S.binary("*", _S.binary("*", 5, _S.read(_v3, "u")), _S.read(_v3, "u"))))
		_S.define(_v3, "rad", _S.binary("*", _S.binary("+", 1.3, _S.binary("*", 3.6, _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "pow", [_S.binary("-", 1, _S.read(_v3, "u")), 3])))), _S.binary("+", 0.7, _S.binary("*", 0.6, _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "i"), _S.read(_v3, "j"), 72])))))
		_S.define(_v3, "k", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v3, "smooth"), [0, 0.12, _S.read(_v3, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_v3, "smooth"), [0.45, 1, _S.read(_v3, "u")]))), (0.5 if _S.truth(_S.read(_v3, "front")) else 0.62)))
		_S.define(_v3, "c", _S.call_value(_S.read(_v3, "mix"), [(_S.prop(_S.read(_v3, "C"), 4) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "i"), _S.read(_v3, "j"), 70]), 0.5)) else _S.call_value(_S.read(_v3, "mix"), [_S.prop(_S.read(_v3, "C"), 4), _S.prop(_S.read(_v3, "C"), 3), 0.4])), _S.prop(_S.read(_v3, "C"), 1), _S.binary("*", _S.read(_v3, "u"), 0.85)]))
		_S.invoke(_S.read(_v3, "p"), "disc", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "rad"), 1.08), _S.read(_v3, "c"), _S.binary("*", _S.read(_v3, "k"), 0.4)])
		_S.invoke(_S.read(_v3, "p"), "disc", [_S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.read(_v3, "rad"), 0.05)), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "rad"), 0.08)), _S.binary("*", _S.read(_v3, "rad"), 0.76), _S.read(_v3, "c"), _S.binary("*", _S.read(_v3, "k"), 0.55)])
		_S.invoke(_S.read(_v3, "p"), "disc", [_S.binary("-", _S.read(_v3, "x"), _S.binary("*", _S.read(_v3, "rad"), 0.22)), _S.binary("-", _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "rad"), 0.3)), _S.binary("*", _S.read(_v3, "rad"), 0.48), _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "c"), _S.prop(_S.read(_v3, "C"), 6), 0.25]), _S.binary("*", _S.binary("*", _S.read(_v3, "k"), 0.38), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "u"), 0.6)))])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v3, "i"), 3), 0)):
			_S.invoke(_S.read(_v3, "p"), "glow", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "rad"), 1.6), _S.prop(_S.read(_v3, "C"), 4), _S.binary("*", 0.08, _S.read(_v3, "k"))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "-=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	var _v4 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.binary("-", _S.prop(_S.read(_e, "S"), "h"), 1))
	_S.define(_e, "fl", _S.prop(_v4, 0))
	_S.define(_e, "fr", _S.prop(_v4, 1))
	_S.define(_e, "cx", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("/", _S.binary("+", _S.binary("+", _S.read(_e, "fl"), _S.read(_e, "fr")), 1), 2)))
	_S.define(_e, "rx", _S.binary("+", _S.binary("+", _S.binary("/", _S.binary("-", _S.read(_e, "fr"), _S.read(_e, "fl")), 2), 7), _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU"))]))))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v5, "cx"), _S.read(_v5, "rx")), 1)]))
	while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.binary("+", _S.binary("+", _S.read(_v5, "cx"), _S.read(_v5, "rx")), 1))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "q", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v6, "x"), 0.5), _S.read(_v6, "cx"))]), _S.read(_v6, "rx")))
		_S.define(_v6, "n", _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "x"), 31]))
		if _S.truth(_S.binary(">", _S.read(_v6, "q"), _S.binary("+", 1, _S.binary("*", _S.read(_v6, "n"), 0.12)))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), 0, (_S.prop(_S.read(_v6, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v6, "q"), 0.8)) else (_S.prop(_S.read(_v6, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v6, "n"), 0.2)) else _S.prop(_S.read(_v6, "C"), 2)))])
		if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.85)):
			_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), 1, _S.prop(_S.read(_v6, "C"), 1)])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v6, "q"), 0.55), func(): return _S.binary("<", _S.read(_v6, "n"), 0.7))):
			_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), 2, _S.prop(_S.read(_v6, "C"), 1)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "cx"), _S.read(_e, "rx")), 6), _S.unary("-", 4), _S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "rx")), 6), 5, _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "trails"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "S"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), false])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.binary("+", _S.read(_e, "rx"), 6)), _S.binary("/", _S.read(_e, "y"), 4)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 4), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", 0.2, _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	for _v7 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "mx", _S.prop(_v9, 0))
		_S.define(_v8, "my", _S.prop(_v9, 1))
		var _v10 = _S.scope(_v8)
		_S.define(_v10, "c", _S.call_value(_S.read(_v10, "colorAt"), [_S.read(_v10, "a"), _S.read(_v10, "mx"), _S.read(_v10, "my")]))
		_S.define(_v10, "up", _S.binary("-", 1, _S.binary("/", _S.binary("+", _S.read(_v10, "my"), 0.5), _S.read(_v10, "H"))))
		_S.define(_v10, "lv", _S.call_value(_S.read(_v10, "reach"), [_S.read(_v10, "mx"), _S.read(_v10, "t"), _S.prop(_S.read(_v10, "o"), "seed")]))
		if _S.truth(_S.binary(">", _S.read(_v10, "up"), _S.binary("+", _S.read(_v10, "lv"), 0.035))):
			continue
		_S.define(_v10, "x", _S.binary("+", _S.prop(_S.read(_v10, "a"), "x"), _S.read(_v10, "mx")))
		_S.define(_v10, "y", _S.binary("+", _S.prop(_S.read(_v10, "a"), "y"), _S.read(_v10, "my")))
		if _S.truth(_S.binary(">", _S.read(_v10, "up"), _S.binary("-", _S.read(_v10, "lv"), 0.02))):
			_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.prop(_S.read(_v10, "C"), 6)])
		else:
			if _S.truth(_S.binary(">", _S.read(_v10, "up"), _S.binary("-", _S.read(_v10, "lv"), 0.06))):
				_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.prop(_S.read(_v10, "C"), 4)])
			else:
				_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.call_value(_S.read(_v10, "mix"), [_S.prop(_S.read(_v10, "C"), 1), _S.prop(_S.read(_v10, "C"), 3), _S.call_value(_S.read(_v10, "clamp"), [_S.binary("*", _S.call_value(_S.read(_v10, "luma"), [_S.read(_v10, "c")]), 1.6)])])])
	var _v11 = _S.scope(_e)
	_S.define(_v11, "mx", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "mx"), _S.prop(_S.read(_v11, "S"), "w"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "lv", _S.call_value(_S.read(_v12, "reach"), [_S.read(_v12, "mx"), _S.read(_v12, "t"), _S.prop(_S.read(_v12, "o"), "seed")]))
		_S.define(_v12, "my", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.read(_v12, "lv")), _S.read(_v12, "H"))]))
		if _S.truth(_S.invoke(_S.read(_v12, "S"), "on", [_S.read(_v12, "mx"), _S.read(_v12, "my")])):
			_S.invoke(_S.read(_v12, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v12, "a"), "x"), _S.read(_v12, "mx")), _S.binary("+", _S.prop(_S.read(_v12, "a"), "y"), _S.read(_v12, "my")), 4, _S.prop(_S.read(_v12, "C"), 5), 0.14])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "mx", 1, "+=", true)
	for _v13 in _S.array(_S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")])):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "e", _v13)
		var _v15 = _S.scope(_v14)
		for _v16 in _S.array(_S.prop(_S.read(_v15, "e"), "px")):
			var _v17 = _S.scope(_v15)
			var _v18 = _v16
			_S.define(_v17, "x", _S.prop(_v18, 0))
			_S.define(_v17, "y", _S.prop(_v18, 1))
			_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v17, "a"), "x"), _S.read(_v17, "x")), _S.binary("+", _S.prop(_S.read(_v17, "a"), "y"), _S.read(_v17, "y")), (_S.prop(_S.read(_v17, "C"), 7) if _S.truth(_S.binary("===", _S.read(_v17, "y"), _S.prop(_S.read(_v17, "e"), "y0"))) else _S.prop(_S.read(_v17, "C"), 5))])
		_S.invoke(_S.read(_v15, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v15, "a"), "x"), _S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v15, "e"), "x0"), _S.prop(_S.read(_v15, "e"), "x1")), 1), 2)), _S.binary("+", _S.prop(_S.read(_v15, "a"), "y"), _S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v15, "e"), "y0"), _S.prop(_S.read(_v15, "e"), "y1")), 1), 2)), 5, _S.prop(_S.read(_v15, "C"), 5), 0.4])
	_S.call_value(_S.read(_e, "trails"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "S"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), true])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE")))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "glitch", (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "IN")), _S.binary("-", _S.read(_v19, "HOLD"), _S.read(_v19, "IN")))) if _S.truth(_S.binary("<", _S.read(_v19, "t"), _S.read(_v19, "HOLD"))) else (_S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "OUT")), _S.binary("-", _S.read(_v19, "GONE"), _S.read(_v19, "OUT"))) if _S.truth(_S.binary(">", _S.read(_v19, "t"), _S.read(_v19, "OUT"))) else 0)))
		_S.define(_v19, "f", _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.read(_v19, "t"), 30)]))
		_S.define(_v19, "on", _S.logical("||", _S.binary("<", _S.read(_v19, "glitch"), 0.15), func(): return _S.binary(">", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "f"), 3]), _S.binary("*", _S.read(_v19, "glitch"), 0.6))))
		_S.define(_v19, "x", 0)
		_S.define(_v19, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v19, "a"), "y"), 12), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v19, "t"), _S.read(_v19, "D")), _S.read(_v19, "TAU")), 2)]), 1.2)))
		if _S.truth(_S.read(_v19, "on")):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "tear", _S.function_value(_v20, "_f5"))
			if _S.truth(_S.binary(">", _S.read(_v20, "glitch"), 0)):
				var _v21 = _S.scope(_v20)
				_S.call_value(_S.read(_v21, "icon"), [_S.read(_v21, "p"), _S.binary("-", _S.read(_v21, "x"), 2), _S.read(_v21, "y"), 7, _S.read(_v21, "tear"), [0, _S.prop(_S.read(_v21, "C"), 2), _S.prop(_S.read(_v21, "C"), 2), _S.prop(_S.read(_v21, "C"), 3)], _S.binary("*", 0.7, _S.read(_v21, "glitch"))])
				_S.call_value(_S.read(_v21, "icon"), [_S.read(_v21, "p"), _S.binary("+", _S.read(_v21, "x"), 2), _S.read(_v21, "y"), 7, _S.read(_v21, "tear"), [0, _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 6)], _S.binary("*", 0.5, _S.read(_v21, "glitch"))])
			_S.call_value(_S.read(_v20, "icon"), [_S.read(_v20, "p"), _S.read(_v20, "x"), _S.read(_v20, "y"), 8, _S.read(_v20, "tear"), [_S.prop(_S.read(_v20, "C"), 0), _S.prop(_S.read(_v20, "C"), 4), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 7)], 1, _S.merge([{"e": _S.prop(_S.read(_v20, "C"), 0)}, {"E": _S.prop(_S.read(_v20, "C"), 7)}])])
			_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("-", _S.read(_v20, "x"), 3), _S.binary("-", _S.read(_v20, "y"), 1), 5, _S.prop(_S.read(_v20, "C"), 5), 0.6])
			_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("+", _S.read(_v20, "x"), 3), _S.binary("-", _S.read(_v20, "y"), 1), 5, _S.prop(_S.read(_v20, "C"), 5), 0.6])
			_S.invoke(_S.read(_v20, "p"), "glow", [_S.read(_v20, "x"), _S.read(_v20, "y"), 16, _S.prop(_S.read(_v20, "C"), 4), _S.binary("+", 0.24, _S.binary("*", 0.3, _S.read(_v20, "glitch")))])
		if _S.truth(_S.binary(">", _S.read(_v19, "glitch"), 0.1)):
			var _v22 = _S.scope(_v19)
			_S.define(_v22, "k", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "k"), 3)):
				var _v23 = _S.scope(_v22)
				_S.define(_v23, "ly", _S.binary("+", _S.binary("-", _S.read(_v23, "y"), 5), _S.invoke(_S.read(_v23, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v23, "rand"), [_S.read(_v23, "f"), _S.read(_v23, "k"), 11]), 11)])))
				_S.define(_v23, "lx", _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("*", _S.binary("-", _S.call_value(_S.read(_v23, "rand"), [_S.read(_v23, "f"), _S.read(_v23, "k"), 12]), 0.5), 10)]))
				_S.define(_v23, "len", _S.binary("+", 3, _S.invoke(_S.read(_v23, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v23, "rand"), [_S.read(_v23, "f"), _S.read(_v23, "k"), 13]), 8)])))
				_S.invoke(_S.read(_v23, "p"), "line", [_S.binary("-", _S.read(_v23, "lx"), _S.binary("/", _S.read(_v23, "len"), 2)), _S.read(_v23, "ly"), _S.binary("+", _S.read(_v23, "lx"), _S.binary("/", _S.read(_v23, "len"), 2)), _S.read(_v23, "ly"), (_S.prop(_S.read(_v23, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v23, "k"), 2)) else _S.prop(_S.read(_v23, "C"), 4)), _S.read(_v23, "glitch")])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.read(_e, "H"), _S.binary("-", 1, _S.call_value(_S.read(_e, "tide"), [_S.read(_e, "t")])))), 24, _S.prop(_S.read(_e, "C"), 4), 0.2])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.read(_e, "H"), 0.45)), 30, _S.prop(_S.read(_e, "C"), 3), 0.12])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	_S.define(_e, "row", _S.binary("+", _S.read(_e, "dy"), 6))
	_S.define(_e, "shift", (_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "f"), _S.read(_e, "row"), 9]), 0.5), 6), _S.read(_e, "glitch"))]) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "glitch"), 0), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "f"), _S.binary(">>", _S.read(_e, "row"), 1), 7]), _S.binary("*", _S.read(_e, "glitch"), 0.8)))) else 0))
	return _S.call_value(_S.read(_e, "SKULL"), [_S.binary("-", _S.read(_e, "dx"), _S.read(_e, "shift")), _S.read(_e, "dy")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 0.3, _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU"))])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.arg(_args, 2))
	return _S.binary("+", _S.call_value(_S.read(_e, "tide"), [_S.read(_e, "t")]), _S.binary("*", 0.13, _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("*", _S.read(_e, "x"), 0.35), _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), 4), 0, 4, _S.read(_e, "seed"), 2])))
