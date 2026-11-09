@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/necro-skulls.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "skullAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "tail", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSkull", _S.function_value(_e, "_f2"))
	_S.define(_e, "flame", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Necro skulls"}, {"desc": "Spectral skulls circle a cold green flame on a tilted orbit, passing behind and before it, eyes lit, trailing curls of ghost smoke."}, {"tags": ["shadow", "necromancy", "skull", "orbit", "ghost", "spectral", "magic", "loop"]}, {"size": [136, 116]}, {"origin": [68, 108]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#040e10", "#0a2228", "#0f3d44", "#16615f", "#23907f", "#45c4a0", "#9af0c8", "#e8fff4"]}, {"bone": ["#0c1a1c", "#2c4a4a", "#5c847c", "#a6cdb8", "#e4fff0"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 52))
	_S.define(_e, "FB", _S.unary("-", 32))
	_S.define(_e, "FH", 34)
	_S.define(_e, "RX", 42)
	_S.define(_e, "RY", 11)
	_S.define(_e, "TILT", _S.unary("-", 0.12))
	_S.define(_e, "D", 3)
	_S.define(_e, "N", 5)
	_S.define(_e, "SKULL", ["...kkkkk...", ".kkhhhllkk.", "khhhhlllmmk", "khhllllllmk", "kleeeleeemk", "kleeeleeedk", "kmleelleedk", ".kmllnllmk.", ".kmmlnlmdk.", "..kmmmmmk..", "..ktgtgtk..", "...kkkkk..."])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.read(_e, "TAU")), _S.read(_e, "N"))))
	_S.define(_e, "ex", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "RX")))
	_S.define(_e, "ey", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "RY")))
	_S.define(_e, "bob", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("*", _S.read(_e, "i"), 1.7))]), 2))
	return _S.merge([{"x": _S.binary("-", _S.binary("*", _S.read(_e, "ex"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")])), _S.binary("*", _S.read(_e, "ey"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")])))}, {"y": _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "ex"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")]))), _S.binary("*", _S.read(_e, "ey"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")]))), _S.read(_e, "bob"))}, {"z": _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])}, {"a": _S.read(_e, "a")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "i", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "k", 8)
	while _S.truth(_S.binary(">=", _S.read(_v0, "k"), 1)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "tt", _S.binary("-", _S.read(_v1, "t"), _S.binary("*", _S.read(_v1, "k"), 0.05)))
		_S.define(_v1, "s", _S.call_value(_S.read(_v1, "skullAt"), [_S.read(_v1, "i"), _S.read(_v1, "tt")]))
		_S.define(_v1, "age", _S.binary("/", _S.read(_v1, "k"), 8))
		_S.define(_v1, "r", _S.binary("+", 2, _S.binary("*", _S.read(_v1, "age"), 3.6)))
		_S.define(_v1, "a", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v1, "age")), 0.5), _S.binary("+", 0.6, _S.binary("/", _S.binary("*", 0.4, _S.binary("+", _S.prop(_S.read(_v1, "s"), "z"), 1)), 2))))
		_S.invoke(_S.read(_v1, "p"), "disc", [_S.prop(_S.read(_v1, "s"), "x"), _S.binary("+", _S.binary("-", _S.prop(_S.read(_v1, "s"), "y"), _S.binary("*", _S.read(_v1, "age"), 7)), 2), _S.read(_v1, "r"), (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "age"), 0.4)) else (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v1, "age"), 0.7)) else _S.prop(_S.read(_v1, "C"), 3))), _S.read(_v1, "a")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "k", 1, "-=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "K", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "i", _S.arg(_args, 5))
	_S.define(_e, "front", _S.binary(">=", _S.prop(_S.read(_e, "s"), "z"), 0))
	_S.define(_e, "depth", _S.binary("+", 0.55, _S.binary("/", _S.binary("*", 0.45, _S.binary("+", _S.prop(_S.read(_e, "s"), "z"), 1)), 2)))
	_S.define(_e, "PAL", (_S.merge([{"k": _S.prop(_S.read(_e, "K"), 0)}, {"d": _S.prop(_S.read(_e, "K"), 1)}, {"m": _S.prop(_S.read(_e, "K"), 2)}, {"l": _S.prop(_S.read(_e, "K"), 3)}, {"h": _S.prop(_S.read(_e, "K"), 4)}, {"e": _S.prop(_S.read(_e, "C"), 0)}, {"n": _S.prop(_S.read(_e, "C"), 0)}, {"t": _S.prop(_S.read(_e, "K"), 3)}, {"g": _S.prop(_S.read(_e, "K"), 0)}]) if _S.truth(_S.read(_e, "front")) else _S.merge([{"k": _S.prop(_S.read(_e, "K"), 0)}, {"d": _S.prop(_S.read(_e, "K"), 0)}, {"m": _S.prop(_S.read(_e, "K"), 1)}, {"l": _S.prop(_S.read(_e, "K"), 2)}, {"h": _S.prop(_S.read(_e, "K"), 3)}, {"e": _S.prop(_S.read(_e, "C"), 0)}, {"n": _S.prop(_S.read(_e, "C"), 0)}, {"t": _S.prop(_S.read(_e, "K"), 2)}, {"g": _S.prop(_S.read(_e, "K"), 0)}])))
	_S.define(_e, "x0", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "s"), "x")]), 5))
	_S.define(_e, "y0", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "s"), "y")]), 6))
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "SKULL"), _S.read(_e, "PAL"), _S.read(_e, "x0"), _S.read(_e, "y0")])
	_S.define(_e, "k", _S.binary("+", _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 3), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("*", _S.read(_e, "i"), 2.1))]))), 0.5), 0.5))
	for _v2 in _S.array([3, 7]):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "ex", _v2)
		var _v4 = _S.scope(_v3)
		_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v4, "x0"), _S.read(_v4, "ex")), 0.5), _S.binary("+", _S.read(_v4, "y0"), 5.5), ((_S.read(_v4, "WHITE") if _S.truth(_S.binary(">", _S.read(_v4, "k"), 0.75)) else _S.prop(_S.read(_v4, "C"), 7)) if _S.truth(_S.read(_v4, "front")) else _S.prop(_S.read(_v4, "C"), 6))])
		if _S.truth(_S.read(_v4, "front")):
			_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v4, "x0"), _S.read(_v4, "ex")), 0.5), _S.binary("+", _S.read(_v4, "y0"), 4.5), _S.prop(_S.read(_v4, "C"), 5)])
		_S.invoke(_S.read(_v4, "p"), "glow", [_S.binary("+", _S.binary("+", _S.read(_v4, "x0"), _S.read(_v4, "ex")), 1), _S.binary("+", _S.read(_v4, "y0"), 6), 6, _S.prop(_S.read(_v4, "C"), 5), _S.binary("*", _S.binary("*", 0.45, _S.read(_v4, "depth")), _S.read(_v4, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "s"), "x"), _S.prop(_S.read(_e, "s"), "y"), 11, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.18, _S.read(_e, "depth"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "W", 10)
	_S.define(_e, "scroll", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 4), _S.binary("-", _S.binary("-", _S.read(_e, "FB"), _S.read(_e, "FH")), 4), _S.binary("+", _S.read(_e, "W"), 4), _S.binary("+", _S.read(_e, "FB"), 2), _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "FB"), _S.binary("*", _S.read(_e, "FH"), 0.35)), 40, _S.prop(_S.read(_e, "C"), 5), 0.45])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "FB"), 5), 12, _S.prop(_S.read(_e, "C"), 7), 0.25])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "FB"), _S.read(_e, "y")), _S.read(_e, "FH")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), _S.unary("-", 0.04)), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "n1", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.3), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 0.2), _S.binary("*", _S.read(_e, "scroll"), 8)), 0, 8, 3]))
	_S.define(_e, "n2", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.6), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 0.45), _S.binary("*", _S.read(_e, "scroll"), 16)), 0, 16, 5]))
	_S.define(_e, "prof", (_S.binary("+", 0.35, _S.binary("*", 0.65, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "u")]), 0.22)]))) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.22)) else _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.22), 0.78)), 0.85])))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "prof")), _S.binary("+", 1, _S.binary("*", 0.3, _S.read(_e, "n1")))), _S.binary("*", _S.binary("*", _S.read(_e, "n2"), 2.2), _S.read(_e, "u"))))
	_S.define(_e, "sway", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "n1"), 3), _S.read(_e, "u")), _S.read(_e, "u")))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "sway"))]), _S.invoke(_S.read(_e, "Math"), "max", [0.6, _S.read(_e, "w")])))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "heat", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "d")), 0.7]), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.read(_e, "u"))]), 0.55])), _S.binary("*", _S.read(_e, "n2"), 0.12)))
	if _S.truth(_S.binary("===", _S.binary("&", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])), 1), 0)):
		_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.16, _S.read(_e, "heat")), "=", false)
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.82)) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.66)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.46)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.27)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.12)) else _S.prop(_S.read(_e, "C"), 3))))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bone"), 5]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 40, _S.prop(_S.read(_e, "C"), 4), 0.2])
	_S.define(_e, "order", _S.invoke(_S.invoke(_S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f6")]), "filter", [_S.function_value(_e, "_f7")]), "sort", [_S.function_value(_e, "_f8")]))
	for _v6 in _S.array(_S.read(_e, "order")):
		var _v7 = _S.scope(_e)
		var _v8 = _v6
		_S.define(_v7, "i", _S.prop(_v8, 0))
		_S.call_value(_S.read(_v7, "tail"), [_S.read(_v7, "p"), _S.read(_v7, "C"), _S.read(_v7, "i"), _S.read(_v7, "t")])
	for _v9 in _S.array(_S.read(_e, "order")):
		var _v10 = _S.scope(_e)
		var _v11 = _v9
		_S.define(_v10, "i", _S.prop(_v11, 0))
		_S.define(_v10, "s", _S.prop(_v11, 1))
		_S.call_value(_S.read(_v10, "drawSkull"), [_S.read(_v10, "p"), _S.read(_v10, "C"), _S.read(_v10, "K"), _S.read(_v10, "s"), _S.read(_v10, "t"), _S.read(_v10, "i")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.read(_e, "i"), _S.call_value(_S.read(_e, "skullAt"), [_S.read(_e, "i"), _S.read(_e, "t")])]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v5 = _S.arg(_args, 0)
	_S.define(_e, "s", _S.prop(_v5, 1))
	return _S.binary("<", _S.prop(_S.read(_e, "s"), "z"), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.prop(_S.read(_e, "a"), 1), "z"), _S.prop(_S.prop(_S.read(_e, "b"), 1), "z"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bone"), 5]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.read(_e, "S"), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "flame"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t")])
	_S.define(_e, "order", _S.invoke(_S.invoke(_S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f12")]), "filter", [_S.function_value(_e, "_f13")]), "sort", [_S.function_value(_e, "_f14")]))
	for _v13 in _S.array(_S.read(_e, "order")):
		var _v14 = _S.scope(_e)
		var _v15 = _v13
		_S.define(_v14, "i", _S.prop(_v15, 0))
		_S.call_value(_S.read(_v14, "tail"), [_S.read(_v14, "p"), _S.read(_v14, "C"), _S.read(_v14, "i"), _S.read(_v14, "t")])
	for _v16 in _S.array(_S.read(_e, "order")):
		var _v17 = _S.scope(_e)
		var _v18 = _v16
		_S.define(_v17, "i", _S.prop(_v18, 0))
		_S.define(_v17, "s", _S.prop(_v18, 1))
		_S.call_value(_S.read(_v17, "drawSkull"), [_S.read(_v17, "p"), _S.read(_v17, "C"), _S.read(_v17, "K"), _S.read(_v17, "s"), _S.read(_v17, "t"), _S.read(_v17, "i")])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, _S.read(_e, "CY"), 0, 46, _S.prop(_S.read(_e, "C"), 4), 0.12])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.4])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 5), _S.invoke(_S.read(_e, "r"), "range", [0, 6]))]), 3), _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.read(_e, "FB"), 6), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "r"), "range", [36, 56]))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 6)), (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)) else _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 3.3))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_e, "u")))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.read(_e, "i"), _S.call_value(_S.read(_e, "skullAt"), [_S.read(_e, "i"), _S.read(_e, "t")])]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v12 = _S.arg(_args, 0)
	_S.define(_e, "s", _S.prop(_v12, 1))
	return _S.binary(">=", _S.prop(_S.read(_e, "s"), "z"), 0)

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.prop(_S.read(_e, "a"), 1), "z"), _S.prop(_S.prop(_S.read(_e, "b"), 1), "z"))
