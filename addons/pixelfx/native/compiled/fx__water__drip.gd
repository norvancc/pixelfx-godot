@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/drip.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "dripstone", _S.function_value(_e, "_f0"))
	_S.define(_e, "puddle", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Drip"}, {"desc": "A bead swells under a wet stone tip and catches the light, pinches off, falls stretched by its speed and plinks into a puddle with a crown, a ring and a tiny rebound."}, {"tags": ["water", "drip", "drop", "puddle", "cave", "ambient", "loop"]}, {"size": [72, 88]}, {"origin": [36, 78]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 62}, {"source": true}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.28)
	_S.define(_e, "G", 760)
	_S.define(_e, "LET", 0.78)
	_S.define(_e, "PRX", 20)
	_S.define(_e, "C_WET", _S.invoke(["#5d6a86", "#9fb6d6"], "map", [_S.function_value(_e, "_f6")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_S.define(_e, "landAt", _S.function_value(_e, "_f7"))
	_S.define(_e, "REBOUND", 0.06)
	_S.define(_e, "BACK", 0.2)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "top", _S.binary("-", _S.unary("-", _S.read(_e, "H")), 14))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 24), _S.read(_e, "top"), 22, _S.binary("+", _S.unary("-", _S.read(_e, "H")), 0.5), _S.function_value(_e, "_f1")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.binary("-", _S.unary("-", _S.read(_v0, "H")), 7))
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.unary("-", _S.read(_v0, "H")))):
		_S.invoke(_S.read(_v0, "p"), "px", [_S.unary("-", 1), _S.read(_v0, "y"), (_S.prop(_S.read(_v0, "C_WET"), 1) if _S.truth(_S.binary(">", _S.read(_v0, "y"), _S.binary("-", _S.unary("-", _S.read(_v0, "H")), 3))) else _S.prop(_S.read(_v0, "C_WET"), 0))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 1), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), _S.read(_e, "WHITE")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "under", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "top"), 7), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "x"), 0.45)]), 1.2)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 1.3), 1)]), 0.6)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "x"), 4)]), 0.12)))
	_S.define(_e, "cone", _S.binary("-", _S.unary("-", _S.read(_e, "H")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 1.25)))
	_S.define(_e, "bottom", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "under"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "cone"), _S.unary("-", _S.read(_e, "H"))])]))
	_S.define(_e, "span", (24 if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else 22))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "y"), _S.read(_e, "bottom")), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "span"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.binary("+", _S.read(_e, "top"), 3), _S.read(_e, "y"))]), 4))))):
		return null
	_S.define(_e, "rim", _S.logical("||", _S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "bottom"), 1)), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "span"), 1))))
	_S.define(_e, "lx", _S.binary("/", _S.binary("+", _S.read(_e, "x"), 24), 46))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), 14))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "ST"), 0) if _S.truth(_S.read(_e, "rim")) else (_S.prop(_S.read(_e, "ST"), 1) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.25)) else ((_S.prop(_S.read(_e, "ST"), 4) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "ST"), 2)) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.read(_e, "under")), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 6))) else (_S.prop(_S.read(_e, "ST"), 4) if _S.truth(_S.binary("<", _S.read(_e, "lx"), 0.3)) else (_S.prop(_S.read(_e, "ST"), 3) if _S.truth(_S.binary("<", _S.read(_e, "lx"), 0.62)) else _S.prop(_S.read(_e, "ST"), 2)))))), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_e, "rim")), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), 9), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), 0.4))]), 0.5)), func(): return _S.binary(">", _S.read(_e, "v"), 0.3)), func(): return _S.binary("<", _S.read(_e, "v"), 0.7))):
		_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "ST"), 0), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "PRX"), _S.read(_e, "SY")))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "Y", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.unary("-", _S.read(_v1, "ry"))]))
	while _S.truth(_S.binary("<", _S.read(_v1, "Y"), _S.read(_v1, "ry"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "X", _S.unary("-", _S.read(_v2, "PRX")))
		while _S.truth(_S.binary("<", _S.read(_v2, "X"), _S.read(_v2, "PRX"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "x", _S.binary("+", _S.read(_v3, "X"), 0.5))
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "Y"), 0.5))
			_S.define(_v3, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_v3, "x"), _S.read(_v3, "PRX")), 2), _S.binary("**", _S.binary("/", _S.read(_v3, "y"), _S.read(_v3, "ry")), 2)))
			if _S.truth(_S.binary(">", _S.read(_v3, "d"), 1)):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "X", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v3, "p"), "blend", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "C"), 1), _S.binary("*", 0.72, _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v3, "d")), 5)]))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "X", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "Y", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "X", _S.binary("+", _S.unary("-", _S.read(_v4, "PRX")), 3))
	while _S.truth(_S.binary("<", _S.read(_v4, "X"), _S.binary("-", _S.read(_v4, "PRX"), 3))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "X"), 0.5))
		_S.define(_v5, "y", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_v5, "x"), _S.read(_v5, "PRX")), 2))])), _S.read(_v5, "ry")))
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.binary("+", _S.read(_v5, "y"), 0.5), (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.read(_v5, "x")]), _S.binary("*", _S.read(_v5, "PRX"), 0.5))) else _S.prop(_S.read(_v5, "C"), 3)), 0.95])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "X", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "puddle"), [_S.read(_e, "p"), _S.read(_e, "C")])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "landAt"), [_S.prop(_S.read(_e, "o"), "height")])))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 0)):
		_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 2, _S.binary("*", 17, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.read(_e, "u"), 0.75)]))), _S.read(_e, "SY"), _S.binary("*", 1.1, _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.75))), _S.read(_e, "C"), _S.merge([{"n": 2}, {"gap": 2.5}, {"half": _S.unary("-", 1)}, {"seed": 1}, {"wob": 0.4}])])
	_S.define(_e, "v", _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "landAt"), [_S.prop(_S.read(_e, "o"), "height")])), _S.read(_e, "REBOUND")), _S.read(_e, "BACK")))
	if _S.truth(_S.binary(">=", _S.read(_e, "v"), 0)):
		_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 1.5, _S.binary("*", 9, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.read(_e, "v"), 0.5)]))), _S.read(_e, "SY"), _S.binary("*", 0.9, _S.binary("-", 1, _S.binary("/", _S.read(_e, "v"), 0.5))), _S.read(_e, "C"), _S.merge([{"n": 1}, {"half": _S.unary("-", 1)}, {"seed": 2}])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "land", _S.call_value(_S.read(_e, "landAt"), [_S.read(_e, "H")]))
	if _S.truth(_S.prop(_S.read(_e, "o"), "source")):
		_S.call_value(_S.read(_e, "dripstone"), [_S.read(_e, "p"), _S.read(_e, "H")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LET"))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "k", _S.binary("/", _S.read(_v6, "t"), _S.read(_v6, "LET")))
		_S.define(_v6, "r", _S.binary("+", 0.7, _S.binary("*", 2.3, _S.invoke(_S.read(_v6, "ease"), "inQuad", [_S.read(_v6, "k")]))))
		_S.define(_v6, "wob", _S.binary("*", _S.binary("*", 0.15, _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("*", _S.read(_v6, "t"), 26)])), _S.read(_v6, "k")))
		_S.define(_v6, "neck", _S.binary("*", _S.call_value(_S.read(_v6, "smooth"), [0.82, 1, _S.read(_v6, "k")]), 2.5))
		_S.define(_v6, "cy", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_v6, "H")), _S.read(_v6, "r")), _S.read(_v6, "neck")))
		if _S.truth(_S.binary(">", _S.read(_v6, "neck"), 0.2)):
			_S.invoke(_S.read(_v6, "p"), "line", [0, _S.unary("-", _S.read(_v6, "H")), 0, _S.binary("-", _S.read(_v6, "cy"), _S.read(_v6, "r")), _S.prop(_S.read(_v6, "C"), 5)])
		_S.invoke(_S.read(_v6, "p"), "ellipse", [0, _S.read(_v6, "cy"), _S.binary("*", _S.read(_v6, "r"), _S.binary("-", 1, _S.read(_v6, "wob"))), _S.binary("+", _S.binary("*", _S.read(_v6, "r"), _S.binary("+", 1, _S.read(_v6, "wob"))), _S.binary("*", 0.3, _S.read(_v6, "k"))), _S.function_value(_v6, "_f5")])
		if _S.truth(_S.binary(">", _S.read(_v6, "r"), 1)):
			_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("*", _S.unary("-", _S.read(_v6, "r")), 0.4), _S.binary("-", _S.read(_v6, "cy"), _S.binary("*", _S.read(_v6, "r"), 0.45)), _S.read(_v6, "WHITE")])
		_S.invoke(_S.read(_v6, "p"), "glow", [0, _S.read(_v6, "cy"), _S.binary("+", 4, _S.binary("*", _S.read(_v6, "r"), 2)), _S.prop(_S.read(_v6, "C"), 5), _S.binary("+", 0.14, _S.binary("*", 0.14, _S.read(_v6, "k")))])
	else:
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _S.binary("/", _S.binary("-", _S.read(_v7, "t"), _S.read(_v7, "LET")), 0.15))
		if _S.truth(_S.binary("<", _S.read(_v7, "s"), 1)):
			_S.invoke(_S.read(_v7, "p"), "ellipse", [0, _S.binary("+", _S.unary("-", _S.read(_v7, "H")), 0.8), _S.binary("*", 1.2, _S.binary("-", 1, _S.binary("*", _S.read(_v7, "s"), 0.6))), _S.binary("+", 1, _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "s"), _S.prop(_S.read(_v7, "Math"), "PI"))]), 0.8)), _S.prop(_S.read(_v7, "C"), 4)])
	_S.define(_e, "f", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LET")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "land")))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "y", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_v8, "H")), 3), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v8, "G")), _S.read(_v8, "f")), _S.read(_v8, "f"))))
		_S.define(_v8, "vy", _S.binary("*", _S.read(_v8, "G"), _S.read(_v8, "f")))
		_S.call_value(_S.read(_v8, "bead"), [_S.read(_v8, "p"), 0, _S.read(_v8, "y"), 0, _S.read(_v8, "vy"), 3, _S.read(_v8, "C")])
		_S.invoke(_S.read(_v8, "p"), "glow", [0, _S.read(_v8, "y"), 6, _S.prop(_S.read(_v8, "C"), 5), 0.2])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "land")))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 0)):
		var _v9 = _S.scope(_e)
		_S.call_value(_S.read(_v9, "ring"), [_S.read(_v9, "p"), 0, 0, _S.binary("+", 2, _S.binary("*", 17, _S.invoke(_S.read(_v9, "ease"), "outCubic", [_S.binary("/", _S.read(_v9, "u"), 0.75)]))), _S.read(_v9, "SY"), _S.binary("*", 1.1, _S.binary("-", 1, _S.binary("/", _S.read(_v9, "u"), 0.75))), _S.read(_v9, "C"), _S.merge([{"n": 2}, {"gap": 2.5}, {"half": 1}, {"hot": _S.binary("<", _S.read(_v9, "u"), 0.08)}, {"seed": 1}, {"wob": 0.4}, {"glint": (_S.binary("-", 1, _S.binary("*", _S.read(_v9, "u"), 2)) if _S.truth(_S.binary("<", _S.read(_v9, "u"), 0.5)) else 0)}])])
		if _S.truth(_S.binary("<", _S.read(_v9, "u"), 0.06)):
			var _v10 = _S.scope(_v9)
			_S.invoke(_S.read(_v10, "p"), "px", [0, 0, _S.read(_v10, "WHITE")])
			_S.invoke(_S.read(_v10, "p"), "px", [_S.unary("-", 1), 0, _S.prop(_S.read(_v10, "C"), 6)])
			_S.invoke(_S.read(_v10, "p"), "px", [1, 0, _S.prop(_S.read(_v10, "C"), 6)])
			_S.invoke(_S.read(_v10, "p"), "glow", [0, _S.unary("-", 1), 10, _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v10, "u"), 0.06)))])
		for _v11 in _S.array([[_S.unary("-", 26), 70], [24, 64], [_S.unary("-", 6), 90]]):
			var _v12 = _S.scope(_v9)
			var _v13 = _v11
			_S.define(_v12, "vx", _S.prop(_v13, 0))
			_S.define(_v12, "vh", _S.prop(_v13, 1))
			var _v14 = _S.scope(_v12)
			_S.define(_v14, "h", _S.binary("-", _S.binary("*", _S.read(_v14, "vh"), _S.read(_v14, "u")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v14, "G")), _S.read(_v14, "u")), _S.read(_v14, "u"))))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v14, "h"), 0), func(): return _S.binary("<", _S.read(_v14, "u"), 0.3))):
				_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("*", _S.read(_v14, "vx"), _S.read(_v14, "u")), _S.unary("-", _S.read(_v14, "h")), (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.1)) else _S.prop(_S.read(_v14, "C"), 6))])
		_S.define(_v9, "r", _S.binary("-", _S.read(_v9, "u"), _S.read(_v9, "REBOUND")))
		_S.define(_v9, "h", _S.binary("-", _S.binary("*", 52, _S.read(_v9, "r")), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v9, "G")), 0.5), _S.read(_v9, "r")), _S.read(_v9, "r")), 2)))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v9, "r"), 0), func(): return _S.binary(">", _S.read(_v9, "h"), 0))):
			var _v15 = _S.scope(_v9)
			_S.invoke(_S.read(_v15, "p"), "line", [0, _S.unary("-", 1), 0, _S.binary("+", _S.unary("-", _S.read(_v15, "h")), 1), _S.prop(_S.read(_v15, "C"), 5)])
			_S.invoke(_S.read(_v15, "p"), "circle", [0, _S.unary("-", _S.read(_v15, "h")), 1.1, _S.prop(_S.read(_v15, "C"), 6)])
			_S.invoke(_S.read(_v15, "p"), "px", [0, _S.binary("-", _S.unary("-", _S.read(_v15, "h")), 1), _S.read(_v15, "WHITE")])
		_S.define(_v9, "v", _S.binary("-", _S.binary("-", _S.read(_v9, "u"), _S.read(_v9, "REBOUND")), _S.read(_v9, "BACK")))
		if _S.truth(_S.binary(">=", _S.read(_v9, "v"), 0)):
			_S.call_value(_S.read(_v9, "ring"), [_S.read(_v9, "p"), 0, 0, _S.binary("+", 1.5, _S.binary("*", 9, _S.invoke(_S.read(_v9, "ease"), "outCubic", [_S.binary("/", _S.read(_v9, "v"), 0.5)]))), _S.read(_v9, "SY"), _S.binary("*", 0.9, _S.binary("-", 1, _S.binary("/", _S.read(_v9, "v"), 0.5))), _S.read(_v9, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": 2}, {"hot": _S.binary("<", _S.read(_v9, "v"), 0.06)}])])
		_S.invoke(_S.read(_v9, "p"), "glow", [0, 0, 18, _S.prop(_S.read(_v9, "C"), 4), _S.binary("*", 0.22, _S.binary("-", 1, _S.call_value(_S.read(_v9, "clamp"), [_S.binary("/", _S.read(_v9, "u"), 0.6)])))])
	_S.define(_e, "sh", (0 if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 20)]), 0)) else 1))
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.unary("-", 1), _S.read(_e, "sh")), 2, _S.prop(_S.read(_e, "C"), 4)])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "land")))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "ry", _S.binary("+", 2, _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v16, "G")), _S.read(_v16, "f")), _S.read(_v16, "f")), 0.04)))
		_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "sh"), _S.invoke(_S.read(_v16, "Math"), "min", [4, _S.read(_v16, "ry")]), _S.prop(_S.read(_v16, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.unary("-", _S.read(_e, "H")), 2), 8, _S.prop(_S.read(_e, "C"), 5), 0.16])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 26, _S.prop(_S.read(_e, "C"), 3), 0.14])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 0), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0.3))) else _S.prop(_S.read(_e, "C"), 3)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.72)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "d"), 0.35), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 0))) else _S.prop(_S.read(_e, "C"), 4)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.binary("|", _S.binary("|", _S.binary("|", _S.call_value(_S.read(_e, "parseInt"), [_S.invoke(_S.read(_e, "h"), "slice", [1, 3]), 16]), _S.binary("<<", _S.call_value(_S.read(_e, "parseInt"), [_S.invoke(_S.read(_e, "h"), "slice", [3, 5]), 16]), 8)), _S.binary("<<", _S.call_value(_S.read(_e, "parseInt"), [_S.invoke(_S.read(_e, "h"), "slice", [5, 7]), 16]), 16)), 4278190080)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "H", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "LET"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.read(_e, "H")), _S.read(_e, "G"))]))
