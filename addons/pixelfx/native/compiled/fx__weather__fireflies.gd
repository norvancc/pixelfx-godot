@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/fireflies.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "fly", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "firefly", _S.function_value(_e, "_f9"))
	_S.define(_e, "grass", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Fireflies"}, {"desc": "Fireflies wander over a meadow at night, each glowing up and fading on its own rhythm, trailing light and lighting the grass tips beneath them."}, {"tags": ["weather", "fireflies", "night", "glow", "meadow", "nature", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a3a10", "#5a7a1a", "#9ad02a", "#d6ff5a", "#f4ffb8", "#ffffff"]}, {"grass": ["#070f0b", "#0c1a12", "#13281a", "#1d3a24", "#2b5232", "#3f6e40"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "cyc", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "R", _S.function_value(_e, "_f1"))
	_S.define(_e, "depth", (0 if _S.truth(_S.binary("<", _S.read(_e, "i"), 14)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "i"), 26)) else 2)))
	_S.define(_e, "k", _S.prop([0.5, 0.8, 1], _S.read(_e, "depth")))
	_S.define(_e, "cx", _S.binary("+", _S.unary("-", 150), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), 300)))
	_S.define(_e, "cy", _S.binary("-", _S.unary("-", 16), _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), (70 if _S.truth(_S.binary("===", _S.read(_e, "depth"), 2)) else 130))))
	_S.define(_e, "ax", _S.binary("*", _S.binary("+", 14, _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), 26)), _S.read(_e, "k")))
	_S.define(_e, "ay", _S.binary("*", _S.binary("+", 8, _S.binary("*", _S.call_value(_S.read(_e, "R"), [4]), 14)), _S.read(_e, "k")))
	_S.define(_e, "n1", _S.binary("+", 1, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), 2)])))
	_S.define(_e, "n2", _S.binary("+", 1, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [6]), 3)])))
	_S.define(_e, "pos", _S.function_value(_e, "_f2"))
	_S.define(_e, "per", _S.binary("/", _S.read(_e, "D"), _S.binary("+", 3, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [9]), 4)]))))
	_S.define(_e, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "per")), _S.call_value(_S.read(_e, "R"), [10])), 1), 1), 1))
	_S.define(_e, "two", _S.binary("<", _S.call_value(_S.read(_e, "R"), [11]), 0.35))
	_S.define(_e, "pulse", _S.function_value(_e, "_f3"))
	_S.define(_e, "glow", _S.invoke(_S.read(_e, "Math"), "max", [_S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "u")]), (_S.binary("*", _S.call_value(_S.read(_e, "pulse"), [_S.binary("-", _S.read(_e, "u"), 0.22)]), 0.8) if _S.truth(_S.read(_e, "two")) else 0)]))
	return _S.merge([{"pos": _S.read(_e, "pos")}, {"depth": _S.read(_e, "depth")}, {"glow": _S.read(_e, "glow")}, {"R": _S.read(_e, "R")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "n")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return [_S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "ax"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.call_value(_S.read(_e, "cyc"), [_S.read(_e, "tt"), _S.read(_e, "n1"), _S.binary("*", _S.call_value(_S.read(_e, "R"), [7]), _S.read(_e, "TAU"))])]))), _S.binary("*", _S.binary("*", 10, _S.read(_e, "k")), _S.call_value(_S.read(_e, "loopNoise"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), 1.5, _S.binary("*", _S.read(_e, "i"), 3)]))), _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "ay"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.call_value(_S.read(_e, "cyc"), [_S.read(_e, "tt"), _S.read(_e, "n2"), _S.binary("*", _S.call_value(_S.read(_e, "R"), [8]), _S.read(_e, "TAU"))])]))), _S.binary("*", _S.binary("*", 6, _S.read(_e, "k")), _S.call_value(_S.read(_e, "loopNoise"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), 1.5, _S.binary("+", _S.binary("*", _S.read(_e, "i"), 3), 1)])))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.binary("/", _S.read(_e, "v"), 0.06) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.06)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.14)) else (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "v"), 0.14), 0.26)) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.4)) else 0)))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "grass"), 6]))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f5")])
	_S.define(_e, "flies", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 32}]), _S.function_value(_e, "_f6")]))
	_S.call_value(_S.read(_e, "grass"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "G"), _S.read(_e, "C"), _S.read(_e, "flies"), false])
	for _v0 in _S.array(_S.read(_e, "flies")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "f", _v0)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v1, "f"), "depth"), 2)):
			_S.call_value(_S.read(_v1, "firefly"), [_S.read(_v1, "q"), _S.read(_v1, "t"), _S.read(_v1, "f"), _S.read(_v1, "C")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 170), 180))
	_S.invoke(_S.prop(_S.read(_e, "R"), "c"), "fill", [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "G"), 0), _S.prop(_S.read(_e, "G"), 1), _S.read(_e, "k")])])
	_S.invoke(_S.prop(_S.read(_e, "R"), "a"), "fill", [_S.binary("+", 0.48, _S.binary("*", 0.14, _S.read(_e, "k")))])
	_S.invoke(_S.prop(_S.read(_e, "R"), "b"), "fill", [1])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "t")])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "grass"), 6]))
	_S.define(_e, "flies", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 32}]), _S.function_value(_e, "_f8")]))
	_S.call_value(_S.read(_e, "grass"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "G"), _S.read(_e, "C"), _S.read(_e, "flies"), true])
	for _v2 in _S.array(_S.read(_e, "flies")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "f", _v2)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v3, "f"), "depth"), 2)):
			_S.call_value(_S.read(_v3, "firefly"), [_S.read(_v3, "q"), _S.read(_v3, "t"), _S.read(_v3, "f"), _S.read(_v3, "C")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "t")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "f", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	var _v4 = _S.invoke(_S.read(_e, "f"), "pos", [_S.read(_e, "t")])
	_S.define(_e, "x", _S.prop(_v4, 0))
	_S.define(_e, "y", _S.prop(_v4, 1))
	_S.define(_e, "g", _S.prop(_S.read(_e, "f"), "glow"))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "f"), "depth"), 0)):
		var _v5 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v5, "g"), 0.08)):
			return null
		_S.invoke(_S.read(_v5, "q"), "dot", [_S.read(_v5, "X"), _S.read(_v5, "Y"), (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v5, "g"), 0.6)) else _S.prop(_S.read(_v5, "C"), 3)), _S.invoke(_S.read(_v5, "Math"), "min", [1, _S.binary("*", _S.read(_v5, "g"), 1.6)])])
		_S.invoke(_S.read(_v5, "q"), "glow", [_S.read(_v5, "x"), _S.read(_v5, "y"), 6, _S.prop(_S.read(_v5, "C"), 2), _S.binary("*", 0.45, _S.read(_v5, "g"))])
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.3)):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "j", 1)
		while _S.truth(_S.binary("<=", _S.read(_v6, "j"), 4)):
			var _v7 = _S.scope(_v6)
			var _v8 = _S.invoke(_S.read(_v7, "f"), "pos", [_S.binary("-", _S.read(_v7, "t"), _S.binary("*", _S.read(_v7, "j"), 0.05))])
			_S.define(_v7, "tx", _S.prop(_v8, 0))
			_S.define(_v7, "ty", _S.prop(_v8, 1))
			_S.invoke(_S.read(_v7, "q"), "dot", [_S.read(_v7, "tx"), _S.read(_v7, "ty"), _S.prop(_S.read(_v7, "C"), 2), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v7, "g"), 0.3), _S.binary("-", 1, _S.binary("/", _S.read(_v7, "j"), 5))), 1.3)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "j", 1, "+=", true)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "f"), "depth"), 1)):
		var _v9 = _S.scope(_e)
		_S.invoke(_S.read(_v9, "q"), "px", [_S.read(_v9, "X"), _S.read(_v9, "Y"), (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v9, "g"), 0.5)) else (_S.prop(_S.read(_v9, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v9, "g"), 0.15)) else _S.prop(_S.read(_v9, "C"), 1)))])
		if _S.truth(_S.binary(">", _S.read(_v9, "g"), 0.4)):
			_S.invoke(_S.read(_v9, "q"), "px", [_S.read(_v9, "X"), _S.binary("+", _S.read(_v9, "Y"), 1), _S.prop(_S.read(_v9, "C"), 2)])
		_S.invoke(_S.read(_v9, "q"), "glow", [_S.read(_v9, "x"), _S.read(_v9, "y"), 9, _S.prop(_S.read(_v9, "C"), 2), _S.binary("*", 0.5, _S.read(_v9, "g"))])
		_S.invoke(_S.read(_v9, "q"), "glow", [_S.read(_v9, "x"), _S.read(_v9, "y"), 3, _S.prop(_S.read(_v9, "C"), 4), _S.binary("*", 0.5, _S.read(_v9, "g"))])
		return null
	var _v10 = _S.invoke(_S.read(_e, "f"), "pos", [_S.binary("+", _S.read(_e, "t"), 0.05)])
	_S.define(_e, "nx", _S.prop(_v10, 0))
	_S.define(_e, "dir", (1 if _S.truth(_S.binary(">=", _S.read(_e, "nx"), _S.read(_e, "x"))) else _S.unary("-", 1)))
	_S.define(_e, "beat", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]), 2))
	_S.invoke(_S.read(_e, "q"), "px", [_S.binary("+", _S.read(_e, "X"), _S.read(_e, "dir")), _S.read(_e, "Y"), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "q"), "px", [_S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.read(_e, "dir"), 2)), _S.read(_e, "Y"), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "q"), "dot", [_S.read(_e, "X"), _S.binary("-", _S.binary("-", _S.read(_e, "Y"), 1), _S.read(_e, "beat")), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.read(_e, "WHITE"), 0.4]), 0.7])
	_S.invoke(_S.read(_e, "q"), "dot", [_S.binary("+", _S.read(_e, "X"), _S.read(_e, "dir")), _S.binary("-", _S.binary("-", _S.read(_e, "Y"), 1), _S.read(_e, "beat")), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.read(_e, "WHITE"), 0.4]), 0.7])
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "X"), _S.read(_e, "Y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.3)) else _S.prop(_S.read(_e, "C"), 1))])
	_S.invoke(_S.read(_e, "q"), "px", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "dir")), _S.read(_e, "Y"), (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.5)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.15)) else _S.prop(_S.read(_e, "C"), 1)))])
	if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.6)):
		_S.invoke(_S.read(_e, "q"), "px", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "dir")), _S.binary("+", _S.read(_e, "Y"), 1), _S.prop(_S.read(_e, "C"), 3)])
	if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.7)):
		for _v11 in _S.array([[0, _S.unary("-", 2)], [0, 2], [_S.unary("-", 2), 0], [2, 0]]):
			var _v12 = _S.scope(_e)
			var _v13 = _v11
			_S.define(_v12, "dx", _S.prop(_v13, 0))
			_S.define(_v12, "dy", _S.prop(_v13, 1))
			_S.invoke(_S.read(_v12, "q"), "dot", [_S.binary("+", _S.binary("-", _S.read(_v12, "X"), _S.read(_v12, "dir")), _S.read(_v12, "dx")), _S.binary("+", _S.read(_v12, "Y"), _S.read(_v12, "dy")), _S.prop(_S.read(_v12, "C"), 3), _S.binary("*", _S.binary("-", _S.read(_v12, "g"), 0.7), 3)])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 28, _S.prop(_S.read(_e, "C"), 2), _S.binary("*", 0.45, _S.read(_e, "g"))])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 10, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.5, _S.read(_e, "g"))])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.read(_e, "g"))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "G", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "flies", _S.arg(_args, 5))
	_S.define(_e, "front", _S.arg(_args, 6))
	_S.define(_e, "lit", _S.invoke(_S.invoke(_S.read(_e, "flies"), "filter", [_S.function_value(_e, "_f11")]), "map", [_S.function_value(_e, "_f12")]))
	_S.define(_e, "n", (150 if _S.truth(_S.read(_e, "front")) else 230))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.read(_v14, "n"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "R", _S.function_value(_v15, "_f13"))
		_S.define(_v15, "x", _S.binary("+", _S.unary("-", 162), _S.binary("*", _S.binary("+", _S.read(_v15, "i"), _S.call_value(_S.read(_v15, "R"), [1])), _S.binary("/", 324, _S.read(_v15, "n")))))
		_S.define(_v15, "h", _S.binary("+", _S.binary("+", (4 if _S.truth(_S.read(_v15, "front")) else 5), _S.binary("*", _S.call_value(_S.read(_v15, "R"), [2]), (8 if _S.truth(_S.read(_v15, "front")) else 11))), (6 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v15, "R"), [3]), 0.1)) else 0)))
		_S.define(_v15, "base", _S.binary("-", (9 if _S.truth(_S.read(_v15, "front")) else 2), _S.binary("*", _S.call_value(_S.read(_v15, "R"), [4]), 3)))
		_S.define(_v15, "sway", _S.binary("+", _S.binary("*", _S.binary("+", 1.2, _S.call_value(_S.read(_v15, "R"), [5])), _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("+", _S.call_value(_S.read(_v15, "cyc"), [_S.read(_v15, "t"), 2, _S.binary("*", _S.unary("-", _S.read(_v15, "x")), 0.03)]), _S.call_value(_S.read(_v15, "R"), [6]))])), _S.binary("*", 0.6, _S.invoke(_S.read(_v15, "Math"), "sin", [_S.call_value(_S.read(_v15, "cyc"), [_S.read(_v15, "t"), 5, _S.binary("*", _S.read(_v15, "x"), 0.07)])]))))
		_S.define(_v15, "tone", (_S.binary("+", 1, _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v15, "R"), [7]), 3)])) if _S.truth(_S.read(_v15, "front")) else _S.binary("+", 1, _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v15, "R"), [7]), 2)]))))
		_S.define(_v15, "tipLight", 0)
		for _v16 in _S.array(_S.read(_v15, "lit")):
			var _v17 = _S.scope(_v15)
			var _v18 = _v16
			_S.define(_v17, "fx", _S.prop(_v18, 0))
			_S.define(_v17, "fy", _S.prop(_v18, 1))
			_S.define(_v17, "g", _S.prop(_v18, 2))
			var _v19 = _S.scope(_v17)
			_S.define(_v19, "d", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "fx"), _S.binary("+", _S.read(_v19, "x"), _S.read(_v19, "sway"))), _S.binary("-", _S.read(_v19, "fy"), _S.binary("-", _S.read(_v19, "base"), _S.read(_v19, "h")))]))
			if _S.truth(_S.binary("<", _S.read(_v19, "d"), 28)):
				_S.write(_v19, "tipLight", _S.invoke(_S.read(_v19, "Math"), "max", [_S.read(_v19, "tipLight"), _S.binary("*", _S.read(_v19, "g"), _S.binary("-", 1, _S.binary("/", _S.read(_v19, "d"), 28)))]), "=", false)
		var _v20 = _S.scope(_v15)
		_S.define(_v20, "r", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "r"), _S.read(_v20, "h"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "u", _S.binary("/", _S.read(_v21, "r"), _S.read(_v21, "h")))
			_S.define(_v21, "c", ((_S.prop(_S.read(_v21, "C"), 3) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v21, "tipLight"), 0.55), func(): return _S.binary(">", _S.read(_v21, "u"), 0.9))) else _S.prop(_S.read(_v21, "C"), 2)) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v21, "u"), 0.8), func(): return _S.binary(">", _S.read(_v21, "tipLight"), 0.2))) else (_S.prop(_S.read(_v21, "G"), _S.invoke(_S.read(_v21, "Math"), "min", [5, _S.binary("+", _S.read(_v21, "tone"), 1)])) if _S.truth(_S.binary(">", _S.read(_v21, "u"), 0.7)) else _S.prop(_S.read(_v21, "G"), _S.read(_v21, "tone")))))
			_S.invoke(_S.read(_v21, "q"), "px", [_S.binary("+", _S.read(_v21, "x"), _S.binary("*", _S.binary("*", _S.read(_v21, "sway"), _S.read(_v21, "u")), _S.read(_v21, "u"))), _S.binary("-", _S.read(_v21, "base"), _S.read(_v21, "r")), _S.read(_v21, "c")])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "r", 1, "+=", true)
		if _S.truth(_S.binary("<", _S.call_value(_S.read(_v15, "R"), [8]), 0.07)):
			var _v22 = _S.scope(_v15)
			_S.define(_v22, "sx", _S.binary("+", _S.read(_v22, "x"), _S.read(_v22, "sway")))
			_S.define(_v22, "sy", _S.binary("-", _S.read(_v22, "base"), _S.read(_v22, "h")))
			_S.invoke(_S.read(_v22, "q"), "px", [_S.read(_v22, "sx"), _S.binary("-", _S.read(_v22, "sy"), 1), (_S.prop(_S.read(_v22, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v22, "tipLight"), 0.2)) else _S.prop(_S.read(_v22, "G"), 5))])
			_S.invoke(_S.read(_v22, "q"), "px", [_S.binary("-", _S.read(_v22, "sx"), 1), _S.read(_v22, "sy"), _S.prop(_S.read(_v22, "G"), 4)])
			_S.invoke(_S.read(_v22, "q"), "px", [_S.binary("+", _S.read(_v22, "sx"), 1), _S.read(_v22, "sy"), _S.prop(_S.read(_v22, "G"), 4)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "f"), "glow"), 0.25), func(): return _S.binary(">", _S.prop(_S.read(_e, "f"), "depth"), 0))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.concat([_S.array(_S.invoke(_S.read(_e, "f"), "pos", [_S.read(_e, "t")])), [_S.prop(_S.read(_e, "f"), "glow")]])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), (1 if _S.truth(_S.read(_e, "front")) else 0)), _S.read(_e, "i"), _S.read(_e, "k")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "n")), _S.read(_e, "t")), _S.read(_e, "D")), _S.read(_e, "ph"))
