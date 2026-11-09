@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/soul-drain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "along", _S.function_value(_e, "_f0"))
	_S.define(_e, "vessel", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Soul drain"}, {"desc": "Pale souls are torn loose on the right and dragged down a funnel of streaks into a black crystal vessel, which flares violet as each one lands."}, {"tags": ["shadow", "soul", "drain", "necromancy", "funnel", "directional", "magic", "loop"]}, {"size": [208, 120]}, {"origin": [40, 110]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"soul": ["#2c3f66", "#7d9fd0", "#cfe6ff", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "VY", _S.unary("-", 50))
	_S.define(_e, "D", 3.2)
	_S.define(_e, "LINES", 11)
	_S.define(_e, "SOULS", 4)
	_S.define(_e, "TRAVEL", 1.45)
	_S.define(_e, "wrap", _S.function_value(_e, "_f10"))
	_S.define(_e, "line", _S.function_value(_e, "_f11"))
	_S.define(_e, "LN", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "LINES")}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "soul", _S.function_value(_e, "_f13"))
	_S.define(_e, "landings", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "u", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("-", 1, _S.read(_e, "u")))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), _S.read(_e, "v")))
	_S.define(_e, "b", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "v")), _S.read(_e, "v")), _S.read(_e, "u")))
	_S.define(_e, "c", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "v")), _S.read(_e, "u")), _S.read(_e, "u")))
	_S.define(_e, "d", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.read(_e, "u")))
	return [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "a"), _S.prop(_S.read(_e, "L"), "sx")), _S.binary("*", _S.read(_e, "b"), _S.prop(_S.read(_e, "L"), "c1x"))), _S.binary("*", _S.read(_e, "c"), _S.prop(_S.read(_e, "L"), "c2x"))), _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "a"), _S.prop(_S.read(_e, "L"), "sy")), _S.binary("*", _S.read(_e, "b"), _S.prop(_S.read(_e, "L"), "c1y"))), _S.binary("*", _S.read(_e, "c"), _S.prop(_S.read(_e, "L"), "c2y"))), _S.binary("*", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "VY"), _S.prop(_S.read(_e, "L"), "sy")))), _S.binary("*", _S.read(_e, "d"), _S.prop(_S.read(_e, "L"), "sy")))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "f", _S.arg(_args, 3))
	_S.define(_e, "y0", _S.binary("+", _S.read(_e, "VY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D"))]), 1.5)))
	_S.define(_e, "W", 9)
	_S.define(_e, "UP", 14)
	_S.define(_e, "DN", 12)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y0"), _S.read(_e, "UP")), 1), _S.binary("+", _S.read(_e, "W"), 1), _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "DN")), 1), _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y0"), _S.binary("+", 30, _S.binary("*", 14, _S.read(_e, "f"))), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_e, "f")))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "y0"), 1), 8, _S.read(_e, "WHITE"), _S.binary("+", 0.25, _S.binary("*", 0.6, _S.read(_e, "f")))])
	return _S.read(_e, "y0")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0")))
	_S.define(_e, "half", (_S.binary("*", _S.read(_e, "W"), _S.binary("+", 1, _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "UP")))) if _S.truth(_S.binary("<", _S.read(_e, "dy"), 0)) else _S.binary("*", _S.read(_e, "W"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "DN"))))))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "half"), 0), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.read(_e, "half"), 0.6)))):
		return null
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "half"), 0.4))):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.5)) else _S.prop(_S.read(_e, "C"), 1))
	_S.define(_e, "ridge", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "dy"), 0.12))]), 0.6))
	_S.define(_e, "heart", _S.binary("<", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "dy"), 1)])), _S.binary("+", 2.6, _S.binary("*", _S.read(_e, "f"), 1.5))))
	if _S.truth(_S.read(_e, "heart")):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.4)) else _S.prop(_S.read(_e, "C"), 6))
	if _S.truth(_S.read(_e, "ridge")):
		return (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))
	if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)):
		return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.2)) else _S.prop(_S.read(_e, "C"), 4)) if _S.truth(_S.binary("<", _S.read(_e, "dy"), 0)) else _S.prop(_S.read(_e, "C"), 3))
	return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.read(_e, "dy"), 0)) else _S.prop(_S.read(_e, "C"), 1))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "LINES"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "L", _S.prop(_S.read(_v1, "LN"), _S.read(_v1, "i")))
		_S.define(_v1, "ph", _S.binary("/", _S.call_value(_S.read(_v1, "wrap"), [_S.binary("+", _S.read(_v1, "t"), _S.binary("*", _S.read(_v1, "i"), 0.37))]), _S.read(_v1, "D")))
		_S.define(_v1, "px", null)
		_S.define(_v1, "py", null)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "u", 0)
		while _S.truth(_S.binary("<=", _S.read(_v2, "u"), 1.0001)):
			var _v3 = _S.scope(_v2)
			var _v4 = _S.call_value(_S.read(_v3, "along"), [_S.read(_v3, "L"), _S.read(_v3, "u")])
			_S.define(_v3, "x", _S.prop(_v4, 0))
			_S.define(_v3, "y", _S.prop(_v4, 1))
			_S.define(_v3, "dash", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v3, "u"), 5), _S.binary("*", _S.read(_v3, "ph"), 10)), _S.binary("*", _S.read(_v3, "i"), 0.3)), 1), 1), 1))
			if _S.truth(_S.binary("!==", _S.read(_v3, "px"), null)):
				_S.invoke(_S.read(_v3, "p"), "line", [_S.read(_v3, "px"), _S.read(_v3, "py"), _S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v3, "u"), 0.6)) else _S.prop(_S.read(_v3, "C"), 2)), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v3, "u")))])
			if _S.truth(_S.binary("<", _S.read(_v3, "dash"), 0.18)):
				_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v3, "u"), 0.7)) else (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v3, "u"), 0.35)) else _S.prop(_S.read(_v3, "C"), 5)))])
			_S.last([_S.write(_v3, "px", _S.read(_v3, "x"), "=", false), _S.write(_v3, "py", _S.read(_v3, "y"), "=", false)])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "u", 0.01, "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [10, _S.read(_e, "VY"), 40, _S.prop(_S.read(_e, "C"), 4), 0.22])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "soul"), 4]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "landings"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 22, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 1), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.define(_e, "y0", _S.call_value(_S.read(_e, "vessel"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "f")]))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "k"), 6)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v8, "TAU"), _S.binary("*", 2, _S.read(_v8, "t"))), _S.read(_v8, "D")), _S.binary("/", _S.binary("*", _S.read(_v8, "k"), _S.read(_v8, "TAU")), 6)))
		_S.define(_v8, "ex", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), 15))
		_S.define(_v8, "ey", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 5), 2))
		_S.define(_v8, "z", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]))
		_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "ex"), _S.binary("+", _S.read(_v8, "y0"), _S.read(_v8, "ey")), (_S.prop(_S.read(_v8, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v8, "z"), 0)) else _S.prop(_S.read(_v8, "C"), 4))])
		if _S.truth(_S.binary(">", _S.read(_v8, "z"), 0)):
			_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "ex"), _S.binary("+", _S.read(_v8, "y0"), _S.read(_v8, "ey")), 4, _S.prop(_S.read(_v8, "C"), 6), 0.35])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "k", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "j"), _S.read(_v9, "SOULS"))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "s", _S.call_value(_S.read(_v10, "soul"), [_S.read(_v10, "j")]))
		_S.define(_v10, "age", _S.call_value(_S.read(_v10, "wrap"), [_S.binary("-", _S.read(_v10, "t"), _S.prop(_S.read(_v10, "s"), "born"))]))
		if _S.truth(_S.binary(">", _S.read(_v10, "age"), _S.read(_v10, "TRAVEL"))):
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "j", 1, "+=", true)
			continue
		_S.define(_v10, "L", _S.prop(_S.read(_v10, "LN"), _S.prop(_S.read(_v10, "s"), "line")))
		_S.define(_v10, "u", _S.invoke(_S.read(_v10, "Math"), "pow", [_S.binary("/", _S.read(_v10, "age"), _S.read(_v10, "TRAVEL")), 1.8]))
		var _v11 = _S.call_value(_S.read(_v10, "along"), [_S.read(_v10, "L"), _S.read(_v10, "u")])
		_S.define(_v10, "x", _S.prop(_v11, 0))
		_S.define(_v10, "y", _S.prop(_v11, 1))
		if _S.truth(_S.binary("<", _S.read(_v10, "age"), 0.18)):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v12, "age"), 0.18)))
			_S.call_value(_S.read(_v12, "ringFast"), [_S.read(_v12, "p"), _S.prop(_S.read(_v12, "L"), "sx"), _S.prop(_S.read(_v12, "L"), "sy"), _S.binary("+", 3, _S.binary("*", 9, _S.binary("-", 1, _S.read(_v12, "k")))), 1, (_S.prop(_S.read(_v12, "S"), 2) if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.5)) else _S.prop(_S.read(_v12, "S"), 1))])
			_S.invoke(_S.read(_v12, "p"), "glow", [_S.prop(_S.read(_v12, "L"), "sx"), _S.prop(_S.read(_v12, "L"), "sy"), 12, _S.prop(_S.read(_v12, "S"), 1), _S.binary("*", 0.5, _S.read(_v12, "k"))])
		var _v13 = _S.scope(_v10)
		_S.define(_v13, "k", 14)
		while _S.truth(_S.binary(">=", _S.read(_v13, "k"), 1)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "uu", _S.invoke(_S.read(_v14, "Math"), "pow", [_S.binary("/", _S.invoke(_S.read(_v14, "Math"), "max", [0, _S.binary("-", _S.read(_v14, "age"), _S.binary("*", _S.read(_v14, "k"), 0.03))]), _S.read(_v14, "TRAVEL")), 1.8]))
			var _v15 = _S.call_value(_S.read(_v14, "along"), [_S.read(_v14, "L"), _S.read(_v14, "uu")])
			_S.define(_v14, "tx", _S.prop(_v15, 0))
			_S.define(_v14, "ty", _S.prop(_v15, 1))
			_S.define(_v14, "w", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v14, "t"), 12), _S.binary("*", _S.read(_v14, "k"), 0.8)), _S.read(_v14, "j"))]), _S.read(_v14, "k")), 0.16))
			_S.define(_v14, "r", _S.invoke(_S.read(_v14, "Math"), "max", [0.5, _S.binary("-", 2.6, _S.binary("*", _S.read(_v14, "k"), 0.17))]))
			_S.invoke(_S.read(_v14, "p"), "disc", [_S.read(_v14, "tx"), _S.binary("+", _S.read(_v14, "ty"), _S.read(_v14, "w")), _S.read(_v14, "r"), (_S.prop(_S.read(_v14, "S"), 2) if _S.truth(_S.binary("<", _S.read(_v14, "k"), 4)) else (_S.prop(_S.read(_v14, "S"), 1) if _S.truth(_S.binary("<", _S.read(_v14, "k"), 9)) else _S.prop(_S.read(_v14, "C"), 5))), _S.binary("*", 0.75, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "k"), 15)))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "k", 1, "-=", true)
		_S.define(_v10, "near", _S.call_value(_S.read(_v10, "smooth"), [0.82, 1, _S.read(_v10, "u")]))
		_S.define(_v10, "hr", _S.binary("-", 3.4, _S.binary("*", _S.read(_v10, "near"), 1.6)))
		_S.invoke(_S.read(_v10, "p"), "circle", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("+", _S.read(_v10, "hr"), 0.8), _S.prop(_S.read(_v10, "S"), 1)])
		_S.invoke(_S.read(_v10, "p"), "circle", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.read(_v10, "hr"), _S.prop(_S.read(_v10, "S"), 2)])
		_S.invoke(_S.read(_v10, "p"), "px", [_S.binary("-", _S.read(_v10, "x"), 1), _S.binary("-", _S.read(_v10, "y"), 2), _S.prop(_S.read(_v10, "S"), 3)])
		_S.invoke(_S.read(_v10, "p"), "px", [_S.binary("-", _S.read(_v10, "x"), 2), _S.binary("-", _S.read(_v10, "y"), 1), _S.prop(_S.read(_v10, "S"), 3)])
		if _S.truth(_S.binary("<", _S.read(_v10, "near"), 0.5)):
			var _v16 = _S.scope(_v10)
			_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("-", _S.read(_v16, "x"), 1.5), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "S"), 0)])
			_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("+", _S.read(_v16, "x"), 1.5), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "S"), 0)])
			_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), 1.6), _S.prop(_S.read(_v16, "S"), 0)])
			_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), 2.4), _S.prop(_S.read(_v16, "S"), 0)])
		_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x"), _S.read(_v10, "y"), 10, _S.prop(_S.read(_v10, "S"), 1), 0.5])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "j", 1, "+=", true)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "j"), _S.read(_v17, "SOULS"))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "since", _S.call_value(_S.read(_v18, "wrap"), [_S.binary("-", _S.binary("-", _S.read(_v18, "t"), _S.prop(_S.call_value(_S.read(_v18, "soul"), [_S.read(_v18, "j")]), "born")), _S.read(_v18, "TRAVEL"))]))
		if _S.truth(_S.binary("<", _S.read(_v18, "since"), 0.3)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "k", _S.binary("/", _S.read(_v19, "since"), 0.3))
			_S.call_value(_S.read(_v19, "ringFast"), [_S.read(_v19, "p"), 0, _S.read(_v19, "y0"), _S.binary("+", 6, _S.binary("*", 18, _S.invoke(_S.read(_v19, "ease"), "outCubic", [_S.read(_v19, "k")]))), _S.invoke(_S.read(_v19, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v19, "k")))]), (_S.prop(_S.read(_v19, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v19, "k"), 0.4)) else (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v19, "k"), 0.7)) else _S.prop(_S.read(_v19, "C"), 3)))])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "j", 1, "+=", true)
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, _S.read(_e, "y0"), 4, 22, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.25, _S.read(_e, "f"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.3])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "Lf", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.invoke(_S.read(_e, "r"), "range", [100, 150]))
	_S.define(_e, "y", _S.binary("-", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 80), _S.unary("-", 20)]), _S.binary("*", _S.read(_e, "age"), 18)))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "Lf")))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "S"), 2), _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 0.8)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "S"), 1), _S.binary("*", 0.2, _S.binary("-", 1, _S.read(_e, "u")))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.4, 0.7])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "Lf", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "L", _S.prop(_S.read(_e, "LN"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "LINES"))])))
	_S.define(_e, "u0", _S.invoke(_S.read(_e, "r"), "range", [0.15, 0.5]))
	_S.define(_e, "q", _S.binary("+", _S.read(_e, "u0"), _S.binary("*", _S.binary("-", 1, _S.read(_e, "u0")), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "age"), _S.read(_e, "Lf")), 2.2]))))
	_S.define(_e, "q2", _S.binary("+", _S.read(_e, "u0"), _S.binary("*", _S.binary("-", 1, _S.read(_e, "u0")), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "age"), 0.06)]), _S.read(_e, "Lf")), 2.2]))))
	var _v5 = _S.call_value(_S.read(_e, "along"), [_S.read(_e, "L"), _S.read(_e, "q")])
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	var _v6 = _S.call_value(_S.read(_e, "along"), [_S.read(_e, "L"), _S.read(_e, "q2")])
	_S.define(_e, "tx", _S.prop(_v6, 0))
	_S.define(_e, "ty", _S.prop(_v6, 1))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "tx"), _S.read(_e, "ty"), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f9")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "C"), 6), 0.35])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.7)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.35)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "x"), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "sx", _S.binary("+", 96, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 1]), 64)))
	_S.define(_e, "sy", _S.binary("+", _S.unary("-", 88), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 2]), 72)))
	_S.define(_e, "bend", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 3]), 0.5), 50))
	return _S.merge([{"sx": _S.read(_e, "sx")}, {"sy": _S.read(_e, "sy")}, {"c1x": _S.binary("*", _S.read(_e, "sx"), 0.55)}, {"c1y": _S.binary("+", _S.read(_e, "sy"), _S.read(_e, "bend"))}, {"c2x": _S.binary("+", 22, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 4]), 14))}, {"c2y": _S.binary("+", _S.read(_e, "VY"), _S.binary("*", _S.binary("-", _S.read(_e, "sy"), _S.read(_e, "VY")), 0.25))}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "line"), [_S.read(_e, "i")])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "j", _S.arg(_args, 0))
	return _S.merge([{"born": _S.binary("*", _S.binary("+", _S.binary("+", _S.read(_e, "j"), 0.15), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "j"), 7]), 0.5)), _S.binary("/", _S.read(_e, "D"), _S.read(_e, "SOULS")))}, {"line": _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "j"), 8]), _S.read(_e, "LINES"))])}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "f", 0)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.read(_v20, "SOULS"))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "since", _S.call_value(_S.read(_v21, "wrap"), [_S.binary("-", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.call_value(_S.read(_v21, "soul"), [_S.read(_v21, "j")]), "born")), _S.read(_v21, "TRAVEL"))]))
		_S.write(_v21, "f", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v21, "since")), 0.14)]), (1 if _S.truth(_S.binary("<", _S.read(_v21, "since"), 1)) else 0)), "+=", false)
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "j", 1, "+=", true)
	return _S.invoke(_S.read(_e, "Math"), "min", [1.4, _S.read(_e, "f")])
