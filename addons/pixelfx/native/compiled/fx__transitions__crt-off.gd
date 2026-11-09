@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/crt-off.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "shape", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "CRT off"}, {"desc": "The picture squeezes into a white-hot glowing line, the line into a dot that lingers as a fading afterglow; then it switches back on, dot to line to picture, with a warm-up glow."}, {"tags": ["crt", "tv", "retro", "switch", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": ["#060a14", "#0e1a33", "#1a3360", "#2a5a9a", "#4a8fd0", "#8cc4f0", "#d4ecff", "#ffffff"]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "YC", _S.binary("/", _S.read(_e, "H"), 2))
	_S.define(_e, "XC", _S.binary("/", _S.read(_e, "W"), 2))
	_S.define(_e, "SQ0", 0.06)
	_S.define(_e, "SQ1", 0.34)
	_S.define(_e, "LN1", 0.56)
	_S.define(_e, "DOT1", 0.86)
	_S.define(_e, "ON0", 1.06)
	_S.define(_e, "ON1", 1.16)
	_S.define(_e, "OPEN1", 1.42)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SQ0"))):
		return _S.merge([{"h": _S.read(_e, "H")}, {"w": _S.read(_e, "XC")}])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SQ1"))):
		return _S.merge([{"h": _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", _S.read(_e, "H"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SQ0")), _S.binary("-", _S.read(_e, "SQ1"), _S.read(_e, "SQ0")))])))])}, {"w": _S.read(_e, "XC")}])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LN1"))):
		return _S.merge([{"h": 1}, {"w": _S.binary("*", _S.read(_e, "XC"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SQ1")), _S.binary("-", _S.read(_e, "LN1"), _S.read(_e, "SQ1")))])))}])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ON0"))):
		return _S.merge([{"h": 0}, {"w": 0}])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ON1"))):
		return _S.merge([{"h": 1}, {"w": _S.binary("*", _S.read(_e, "XC"), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ON0")), _S.binary("-", _S.read(_e, "ON1"), _S.read(_e, "ON0")))]))}])
	return _S.merge([{"h": _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ON1")), _S.binary("-", _S.read(_e, "OPEN1"), _S.read(_e, "ON1")))])]))])}, {"w": _S.read(_e, "XC")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	var _v0 = _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "t")])
	_S.define(_e, "h", _S.prop(_v0, "h"))
	_S.define(_e, "w", _S.prop(_v0, "w"))
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]), 7, _S.prop(_S.read(_e, "o"), "seed")]))))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN1"), 0.02)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN1"), 0.6)))):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "u", _S.binary("/", _S.binary("-", _S.read(_v1, "t"), _S.read(_v1, "OPEN1")), 0.6))
		_S.define(_v1, "band", _S.binary("+", _S.unary("-", 20), _S.binary("*", _S.read(_v1, "u"), _S.binary("+", _S.read(_v1, "H"), 40))))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "y"), _S.read(_v2, "H"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "k", _S.binary("+", _S.binary("+", _S.binary("*", 0.22, _S.binary("**", _S.binary("-", 1, _S.read(_v3, "u")), 2)), _S.binary("*", _S.binary("*", 0.3, _S.binary("**", _S.invoke(_S.read(_v3, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "band"))]), 10))]), 2)), _S.binary("-", 1, _S.read(_v3, "u")))), (_S.binary("*", 0.05, _S.binary("-", 1, _S.read(_v3, "u"))) if _S.truth(_S.binary("&", _S.read(_v3, "y"), 1)) else 0)))
			if _S.truth(_S.binary(">", _S.read(_v3, "k"), 0.01)):
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "x", 0)
				while _S.truth(_S.binary("<", _S.read(_v4, "x"), _S.read(_v4, "W"))):
					_S.invoke(_S.read(_v4, "p0"), "light", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 5), _S.read(_v4, "k")])
					_v4 = _S.iteration(_v4)
					_S.write(_v4, "x", 1, "+=", false)
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "y", 1, "+=", true)
		return null
	if _S.truth(_S.binary(">=", _S.read(_e, "h"), _S.read(_e, "H"))):
		return null
	_S.define(_e, "top", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "YC"), _S.binary("/", _S.read(_e, "h"), 2))]))
	_S.define(_e, "bot", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "YC"), _S.binary("/", _S.read(_e, "h"), 2))]))
	if _S.truth(_S.binary(">", _S.read(_e, "top"), 0)):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, 0, _S.read(_e, "W"), _S.read(_e, "top"), _S.read(_e, "ink")])
	if _S.truth(_S.binary("<", _S.read(_e, "bot"), _S.read(_e, "H"))):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, _S.read(_e, "bot"), _S.read(_e, "W"), _S.binary("-", _S.read(_e, "H"), _S.read(_e, "bot")), _S.read(_e, "ink")])
	if _S.truth(_S.binary(">", _S.read(_e, "h"), 2)):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "sq", _S.binary("-", 1, _S.binary("/", _S.read(_v5, "h"), _S.read(_v5, "H"))))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "y", _S.read(_v6, "top"))
		while _S.truth(_S.binary("<", _S.read(_v6, "y"), _S.read(_v6, "bot"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "e", _S.invoke(_S.read(_v7, "Math"), "min", [_S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "top")), _S.binary("-", _S.binary("-", _S.read(_v7, "bot"), 1), _S.read(_v7, "y"))]))
			_S.define(_v7, "k", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", 0.55, _S.read(_v7, "sq")), _S.read(_v7, "sq")), (_S.binary("*", 0.08, _S.read(_v7, "sq")) if _S.truth(_S.binary("&", _S.read(_v7, "y"), 1)) else 0)), _S.binary("*", 0.35, _S.binary("**", _S.invoke(_S.read(_v7, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v7, "e"), 6))]), 2))))
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v8, "x"), _S.read(_v8, "W"))):
				_S.invoke(_S.read(_v8, "p0"), "light", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", _S.read(_v8, "k"), _S.read(_v8, "fl"))])
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "x", 1, "+=", true)
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "y", 1, "+=", true)
		for _v9 in _S.array([_S.binary("-", _S.read(_v5, "top"), 1), _S.read(_v5, "bot")]):
			var _v10 = _S.scope(_v5)
			_S.define(_v10, "y", _v9)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v10, "y"), 0), func(): return _S.binary("<", _S.read(_v10, "y"), _S.read(_v10, "H")))):
				_S.call_value(_S.read(_v10, "rect"), [_S.read(_v10, "p0"), 0, _S.read(_v10, "y"), _S.read(_v10, "W"), 1, (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v10, "sq"), 0.6)) else _S.prop(_S.read(_v10, "C"), 5))])
		return null
	_S.define(_e, "dotPhase", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LN1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ON0"))))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "XC"), _S.read(_e, "w"))]))
	_S.define(_e, "x1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "XC"), _S.read(_e, "w"))]))
	_S.define(_e, "fresh", _S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SQ1"), 0.08)), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "ON0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "ON1"), 0.04)))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "h"), 0), func(): return _S.binary(">=", _S.read(_e, "w"), 1))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "fr", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.read(_v11, "t"), 30)]))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "max", [0, _S.read(_v12, "x0")]))
		while _S.truth(_S.binary("<", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "min", [_S.read(_v12, "W"), _S.read(_v12, "x1")]))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "u", _S.binary("/", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.read(_v13, "XC"))]), _S.read(_v13, "w")))
			_S.define(_v13, "y", _S.binary("+", _S.read(_v13, "YC"), _S.invoke(_S.read(_v13, "Math"), "round", [_S.binary("*", _S.call_value(_S.read(_v13, "noise"), [_S.binary("+", _S.binary("/", _S.read(_v13, "x"), 23), _S.binary("*", _S.read(_v13, "t"), 9)), _S.prop(_S.read(_v13, "o"), "seed")]), _S.binary("+", 0.7, _S.binary("*", 0.5, _S.read(_v13, "u"))))])))
			_S.invoke(_S.read(_v13, "p0"), "px", [_S.read(_v13, "x"), _S.read(_v13, "y"), (_S.read(_v13, "WHITE") if _S.truth(_S.binary("<", _S.read(_v13, "u"), 0.85)) else _S.prop(_S.read(_v13, "C"), 6))])
			if _S.truth(_S.binary("<", _S.read(_v13, "u"), 0.92)):
				_S.last([_S.invoke(_S.read(_v13, "p0"), "px", [_S.read(_v13, "x"), _S.binary("-", _S.read(_v13, "y"), 1), _S.prop(_S.read(_v13, "C"), 6)]), _S.invoke(_S.read(_v13, "p0"), "px", [_S.read(_v13, "x"), _S.binary("+", _S.read(_v13, "y"), 1), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v13, "u"), 0.6)) else _S.prop(_S.read(_v13, "C"), 5))])])
			if _S.truth(_S.logical("&&", _S.read(_v13, "fresh"), func(): return _S.binary("<", _S.read(_v13, "u"), 0.8))):
				_S.last([_S.invoke(_S.read(_v13, "p0"), "dot", [_S.read(_v13, "x"), _S.binary("-", _S.read(_v13, "y"), 2), _S.prop(_S.read(_v13, "C"), 4), 0.5]), _S.invoke(_S.read(_v13, "p0"), "dot", [_S.read(_v13, "x"), _S.binary("+", _S.read(_v13, "y"), 2), _S.prop(_S.read(_v13, "C"), 4), 0.5])])
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "x"), _S.read(_v13, "fr"), _S.binary("+", _S.prop(_S.read(_v13, "o"), "seed"), 3)]), 0.06)):
				_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.binary("+", _S.read(_v13, "y"), _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "x"), _S.read(_v13, "fr"), _S.binary("+", _S.prop(_S.read(_v13, "o"), "seed"), 4)]), 0.5)) else 1), _S.binary("+", 2, _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "x"), _S.read(_v13, "fr"), _S.binary("+", _S.prop(_S.read(_v13, "o"), "seed"), 5)]), 4)])))), (_S.read(_v13, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "x"), _S.read(_v13, "fr"), 6]), 0.5)) else _S.prop(_S.read(_v13, "C"), 5))])
			_S.invoke(_S.read(_v13, "p0"), "light", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.prop(_S.read(_v13, "C"), 6), _S.binary("*", _S.binary("*", 0.5, _S.read(_v13, "fl")), _S.binary("-", 1, _S.binary("*", _S.read(_v13, "u"), 0.6)))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "x", 1, "+=", true)
		var _v14 = _S.scope(_v11)
		_S.define(_v14, "x", _S.read(_v14, "x0"))
		while _S.truth(_S.binary("<=", _S.read(_v14, "x"), _S.read(_v14, "x1"))):
			_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "YC"), 10, _S.prop(_S.read(_v14, "C"), 5), _S.binary("*", 0.35, _S.read(_v14, "fl"))])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "x", 9, "+=", false)
		_S.invoke(_S.read(_v11, "p"), "glow", [_S.read(_v11, "XC"), _S.read(_v11, "YC"), _S.invoke(_S.read(_v11, "Math"), "min", [70, _S.binary("+", 16, _S.binary("*", _S.read(_v11, "w"), 0.4))]), _S.prop(_S.read(_v11, "C"), 5), _S.binary("*", 0.4, _S.read(_v11, "fl"))])
	if _S.truth(_S.read(_e, "dotPhase")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "u", _S.binary("/", _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "LN1")), _S.binary("-", _S.read(_v15, "DOT1"), _S.read(_v15, "LN1"))))
		if _S.truth(_S.binary("<", _S.read(_v15, "u"), 0.35)):
			_S.call_value(_S.read(_v15, "glint"), [_S.read(_v15, "p"), _S.read(_v15, "XC"), _S.read(_v15, "YC"), _S.binary("+", _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.read(_v15, "u"), 0.35))), 3), _S.binary("+", 0.2, _S.binary("*", _S.read(_v15, "u"), 2)), _S.prop(_S.read(_v15, "C"), 6), _S.prop(_S.read(_v15, "C"), 5)])
		if _S.truth(_S.binary("<", _S.read(_v15, "u"), 1)):
			var _v16 = _S.scope(_v15)
			_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "XC"), _S.read(_v16, "YC"), (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.5)) else (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.75)) else _S.prop(_S.read(_v16, "C"), 4)))])
			_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("-", _S.read(_v16, "XC"), 1), _S.read(_v16, "YC"), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.4)) else _S.prop(_S.read(_v16, "C"), 4))])
			_S.define(_v16, "sm", _S.invoke(_S.read(_v16, "Math"), "round", [_S.binary("*", 9, _S.binary("-", 1, _S.read(_v16, "u")))]))
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "k", 2)
			while _S.truth(_S.binary("<=", _S.read(_v17, "k"), _S.read(_v17, "sm"))):
				_S.last([_S.invoke(_S.read(_v17, "p"), "dot", [_S.binary("-", _S.read(_v17, "XC"), _S.read(_v17, "k")), _S.read(_v17, "YC"), _S.prop(_S.read(_v17, "C"), 4), _S.binary("-", 1, _S.binary("/", _S.read(_v17, "k"), _S.binary("+", _S.read(_v17, "sm"), 1)))]), _S.invoke(_S.read(_v17, "p"), "dot", [_S.binary("-", _S.binary("+", _S.read(_v17, "XC"), _S.read(_v17, "k")), 1), _S.read(_v17, "YC"), _S.prop(_S.read(_v17, "C"), 4), _S.binary("-", 1, _S.binary("/", _S.read(_v17, "k"), _S.binary("+", _S.read(_v17, "sm"), 1)))])])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "k", 1, "+=", true)
			_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "XC"), _S.read(_v16, "YC"), _S.binary("*", 22, _S.binary("-", 1, _S.binary("*", _S.read(_v16, "u"), 0.5))), _S.prop(_S.read(_v16, "C"), 5), _S.binary("*", 0.55, _S.binary("**", _S.binary("-", 1, _S.read(_v16, "u")), 1.5))])
	_S.define(_e, "s", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ON0")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "s"), 0), func(): return _S.binary("<", _S.read(_e, "s"), 0.14))):
		_S.last([_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "XC"), _S.read(_e, "YC"), _S.binary("+", _S.binary("*", 12, _S.binary("-", 1, _S.binary("/", _S.read(_e, "s"), 0.14))), 2), _S.binary("+", 0.4, _S.binary("*", _S.read(_e, "s"), 6)), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "XC"), _S.read(_e, "YC"), 40, _S.read(_e, "WHITE"), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "s"), 0.14)))])])
	return null
