@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/blinds.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "angle", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Blinds"}, {"desc": "Slats catch the light edge-on, then tilt shut top to bottom, lit rims glinting as warm light squeezes through the closing gaps with dust in it; then they tilt open and fade."}, {"tags": ["blinds", "slats", "light", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": ["#1a120c", "#33241a", "#5a4030", "#8a6848", "#c09a6a", "#e8cc98", "#fff0cc", "#ffffff"]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "N", 12)
	_S.define(_e, "SH", _S.binary("/", _S.read(_e, "H"), _S.read(_e, "N")))
	_S.define(_e, "SHUT0", 0.08)
	_S.define(_e, "OPEN0", 1.02)
	_S.define(_e, "STEP", 0.038)
	_S.define(_e, "TURN", 0.42)
	_S.define(_e, "OSTEP", 0.03)
	_S.define(_e, "OTURN", 0.4)
	_S.define(_e, "FADE0", 1.72)
	_S.define(_e, "FADE1", 1.94)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN0"))):
		return _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHUT0")), _S.binary("*", _S.read(_e, "i"), _S.read(_e, "STEP"))), _S.read(_e, "TURN"))]), 1.6]))
	return _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN0")), _S.binary("*", _S.read(_e, "i"), _S.read(_e, "OSTEP"))), _S.read(_e, "OTURN"))])])))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FADE0")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.8]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "i", _S.invoke(_S.read(_v0, "R"), "int", [0, _S.binary("-", _S.read(_v0, "N"), 1)]))
		_S.define(_v0, "th", _S.call_value(_S.read(_v0, "angle"), [_S.read(_v0, "i"), _S.read(_v0, "t")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v0, "th"), 0.2), func(): return _S.binary("<", _S.read(_v0, "th"), 1.45))):
			_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "EMBER"), _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "W")]), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v0, "i"), 1), _S.read(_v0, "SH")), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [2, 8])), _S.invoke(_S.read(_v0, "Math"), "min", [_S.invoke(_S.read(_v0, "R"), "range", [0.5, 1]), _S.binary("-", _S.read(_v0, "end"), _S.read(_v0, "t"))]), 0, 1])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "open", _S.invoke(_S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "H")]), "fill", [1]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "N"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "h", _S.invoke(_S.read(_v2, "Math"), "max", [1, _S.binary("*", _S.binary("+", _S.read(_v2, "SH"), 1), _S.invoke(_S.read(_v2, "Math"), "abs", [_S.invoke(_S.read(_v2, "Math"), "sin", [_S.call_value(_S.read(_v2, "angle"), [_S.read(_v2, "i"), _S.read(_v2, "t")])])]))]))
		_S.define(_v2, "yc", _S.binary("*", _S.binary("+", _S.read(_v2, "i"), 0.5), _S.read(_v2, "SH")))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "y", _S.invoke(_S.read(_v3, "Math"), "max", [0, _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("-", _S.binary("-", _S.read(_v3, "yc"), _S.binary("/", _S.read(_v3, "h"), 2)), 0.5)])]))
		while _S.truth(_S.binary("<=", _S.read(_v3, "y"), _S.invoke(_S.read(_v3, "Math"), "min", [_S.binary("-", _S.read(_v3, "H"), 1), _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.read(_v3, "yc"), _S.binary("/", _S.read(_v3, "h"), 2)), 0.5)])]))):
			_S.set_prop(_S.read(_v3, "open"), _S.read(_v3, "y"), 0, "=", false)
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "y", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	for _v4 in _S.array(_S.prop(_S.read(_e, "ps"), "list")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "q", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "y", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.prop(_S.read(_v6, "q"), "y")]))
		_S.define(_v6, "k", _S.binary("/", _S.prop(_S.read(_v6, "q"), "life"), _S.prop(_S.read(_v6, "q"), "max")))
		if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_v6, "q"), "delay"), 0), func(): return _S.binary("<", _S.read(_v6, "y"), 0)), func(): return _S.binary(">=", _S.read(_v6, "y"), _S.read(_v6, "H"))), func(): return _S.unary("!", _S.prop(_S.read(_v6, "open"), _S.read(_v6, "y")))), func(): return _S.binary("<", _S.prop(_S.read(_v6, "q"), "x"), 0)), func(): return _S.binary(">=", _S.prop(_S.read(_v6, "q"), "x"), _S.read(_v6, "W")))):
			continue
		_S.define(_v6, "tw", _S.logical("&&", _S.binary("<", _S.binary("%", _S.prop(_S.read(_v6, "q"), "seed"), 1), 0.3), func(): return _S.binary(">", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v6, "t"), 14), _S.prop(_S.read(_v6, "q"), "seed"))]), 0)))
		_S.invoke(_S.read(_v6, "p0"), "px", [_S.prop(_S.read(_v6, "q"), "x"), _S.read(_v6, "y"), (_S.read(_v6, "WHITE") if _S.truth(_S.logical("||", _S.read(_v6, "tw"), func(): return _S.binary(">", _S.read(_v6, "k"), 0.5))) else _S.prop(_S.read(_v6, "C"), 5))])
		if _S.truth(_S.read(_v6, "tw")):
			for _v7 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v8 = _S.scope(_v6)
				var _v9 = _v7
				_S.define(_v8, "dx", _S.prop(_v9, 0))
				_S.define(_v8, "dy", _S.prop(_v9, 1))
				if _S.truth(_S.prop(_S.read(_v8, "open"), _S.binary("+", _S.read(_v8, "y"), _S.read(_v8, "dy")))):
					_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v8, "q"), "x"), _S.read(_v8, "dx")), _S.binary("+", _S.read(_v8, "y"), _S.read(_v8, "dy")), _S.prop(_S.read(_v8, "C"), 6)])
		_S.invoke(_S.read(_v6, "p0"), "light", [_S.prop(_S.read(_v6, "q"), "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 6), _S.binary("*", (0.7 if _S.truth(_S.read(_v6, "tw")) else 0.4), _S.read(_v6, "k"))])
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FADE0")), _S.binary("-", _S.read(_e, "FADE1"), _S.read(_e, "FADE0")))])))
	_S.define(_e, "appear", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SHUT0"))]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "N"))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "th", _S.call_value(_S.read(_v11, "angle"), [_S.read(_v11, "i"), _S.read(_v11, "t")]))
		_S.define(_v11, "s", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "th")]))
		_S.define(_v11, "c", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "th")]))
		_S.define(_v11, "yc", _S.binary("*", _S.binary("+", _S.read(_v11, "i"), 0.5), _S.read(_v11, "SH")))
		_S.define(_v11, "h", _S.invoke(_S.read(_v11, "Math"), "max", [1, _S.binary("*", _S.binary("+", _S.read(_v11, "SH"), 1), _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "s")]))]))
		_S.define(_v11, "y0", _S.invoke(_S.read(_v11, "Math"), "max", [0, _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.binary("-", _S.binary("-", _S.read(_v11, "yc"), _S.binary("/", _S.read(_v11, "h"), 2)), 0.5)])]))
		_S.define(_v11, "y1", _S.invoke(_S.read(_v11, "Math"), "min", [_S.binary("-", _S.read(_v11, "H"), 1), _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.read(_v11, "yc"), _S.binary("/", _S.read(_v11, "h"), 2)), 0.5)])]))
		_S.define(_v11, "under", _S.binary(">", _S.read(_v11, "th"), _S.binary("/", _S.prop(_S.read(_v11, "Math"), "PI"), 2)))
		if _S.truth(_S.binary("<", _S.read(_v11, "h"), 2.5)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "k", _S.invoke(_S.read(_v12, "Math"), "min", [_S.read(_v12, "appear"), _S.read(_v12, "fade")]))
			if _S.truth(_S.binary("<=", _S.read(_v12, "k"), 0)):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "i", 1, "+=", true)
				continue
			_S.define(_v12, "yy", _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("-", _S.read(_v12, "yc"), 0.5)]))
			_S.call_value(_S.read(_v12, "rect"), [_S.read(_v12, "p0"), 0, _S.read(_v12, "yy"), _S.read(_v12, "W"), 1, (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.66)) else (_S.prop(_S.read(_v12, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.33)) else _S.prop(_S.read(_v12, "C"), 2)))])
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v12, "h"), 1.5), func(): return _S.binary("<", _S.binary("+", _S.read(_v12, "yy"), 1), _S.read(_v12, "H")))):
				_S.call_value(_S.read(_v12, "rect"), [_S.read(_v12, "p0"), 0, _S.binary("+", _S.read(_v12, "yy"), 1), _S.read(_v12, "W"), 1, (_S.prop(_S.read(_v12, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.5)) else _S.prop(_S.read(_v12, "C"), 1))])
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "x"), _S.read(_v13, "W"))):
				_S.invoke(_S.read(_v13, "p0"), "light", [_S.read(_v13, "x"), _S.read(_v13, "yy"), _S.prop(_S.read(_v13, "C"), 5), _S.binary("*", 0.18, _S.read(_v13, "k"))])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "x", 2, "+=", false)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
			continue
		_S.define(_v11, "lit", (0 if _S.truth(_S.read(_v11, "under")) else _S.read(_v11, "c")))
		var _v14 = _S.scope(_v11)
		_S.define(_v14, "y", _S.read(_v14, "y0"))
		while _S.truth(_S.binary("<=", _S.read(_v14, "y"), _S.read(_v14, "y1"))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "r", _S.binary("-", _S.read(_v15, "y"), _S.read(_v15, "y0")))
			_S.define(_v15, "last", _S.binary("===", _S.read(_v15, "y"), _S.read(_v15, "y1")))
			_S.define(_v15, "v", _S.binary("/", _S.read(_v15, "r"), _S.invoke(_S.read(_v15, "Math"), "max", [1, _S.binary("-", _S.read(_v15, "y1"), _S.read(_v15, "y0"))])))
			_S.define(_v15, "f", _S.binary("*", _S.read(_v15, "lit"), _S.binary("-", 1, _S.binary("*", _S.read(_v15, "v"), 0.8))))
			_S.define(_v15, "col", ((_S.read(_v15, "WHITE") if _S.truth(_S.binary(">", _S.read(_v15, "lit"), 0.55)) else (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v15, "lit"), 0.3)) else (_S.prop(_S.read(_v15, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v15, "lit"), 0.12)) else _S.read(_v15, "ink")))) if _S.truth(_S.binary("===", _S.read(_v15, "r"), 0)) else ((_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v15, "lit"), 0.45)) else (_S.prop(_S.read(_v15, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v15, "lit"), 0.2)) else _S.read(_v15, "ink"))) if _S.truth(_S.binary("===", _S.read(_v15, "r"), 1)) else (_S.read(_v15, "ink") if _S.truth(_S.read(_v15, "last")) else (_S.prop(_S.read(_v15, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v15, "f"), 0.55)) else (_S.prop(_S.read(_v15, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v15, "f"), 0.35)) else (_S.prop(_S.read(_v15, "C"), 1) if _S.truth(_S.binary(">", _S.read(_v15, "f"), 0.15)) else _S.read(_v15, "ink"))))))))
			_S.call_value(_S.read(_v15, "rect"), [_S.read(_v15, "p0"), 0, _S.read(_v15, "y"), _S.read(_v15, "W"), 1, _S.read(_v15, "col")])
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v15, "r"), 0), func(): return _S.binary(">", _S.read(_v15, "lit"), 0.12))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "x", 0)
				while _S.truth(_S.binary("<", _S.read(_v16, "x"), _S.read(_v16, "W"))):
					_S.invoke(_S.read(_v16, "p0"), "light", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "C"), 5), _S.binary("*", 0.35, _S.read(_v16, "lit"))])
					_v16 = _S.iteration(_v16)
					_S.write(_v16, "x", 2, "+=", false)
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "y", 1, "+=", true)
		_S.define(_v11, "gap", _S.binary("-", _S.read(_v11, "SH"), _S.read(_v11, "h")))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v11, "gap"), 0.5), func(): return _S.binary(">", _S.read(_v11, "th"), 0.12)), func(): return _S.unary("!", _S.read(_v11, "under")))):
			var _v17 = _S.scope(_v11)
			_S.define(_v17, "k", _S.binary("*", _S.binary("+", 0.2, _S.binary("*", 0.45, _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_v17, "gap"), _S.read(_v17, "SH"))), 1.5))), _S.invoke(_S.read(_v17, "Math"), "min", [1, _S.binary("/", _S.read(_v17, "th"), 0.4)])))
			_S.define(_v17, "gy", _S.binary("+", _S.read(_v17, "y1"), 1))
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "y", _S.read(_v18, "gy"))
			while _S.truth(_S.binary("<", _S.read(_v18, "y"), _S.invoke(_S.read(_v18, "Math"), "min", [_S.read(_v18, "H"), _S.binary("+", _S.read(_v18, "gy"), _S.invoke(_S.read(_v18, "Math"), "ceil", [_S.read(_v18, "gap")]))]))):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "v", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v19, "y"), _S.read(_v19, "gy")), 0.5), _S.read(_v19, "gap")))
				_S.define(_v19, "kk", _S.binary("*", _S.read(_v19, "k"), _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "abs", [_S.binary("-", _S.read(_v19, "v"), 0.5)]), 1.2))))
				if _S.truth(_S.binary(">", _S.read(_v19, "kk"), 0.01)):
					var _v20 = _S.scope(_v19)
					_S.define(_v20, "x", 0)
					while _S.truth(_S.binary("<", _S.read(_v20, "x"), _S.read(_v20, "W"))):
						_S.last([_S.invoke(_S.read(_v20, "p0"), "light", [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.prop(_S.read(_v20, "C"), 6), _S.read(_v20, "kk")]), _S.invoke(_S.read(_v20, "p0"), "light", [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.prop(_S.read(_v20, "C"), 4), _S.binary("*", _S.read(_v20, "kk"), 0.5)])])
						_v20 = _S.iteration(_v20)
						_S.write(_v20, "x", 1, "+=", false)
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "y", 1, "+=", true)
		_S.define(_v11, "u", (_S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v11, "t"), _S.read(_v11, "SHUT0")), _S.binary("*", _S.read(_v11, "i"), _S.read(_v11, "STEP"))), _S.read(_v11, "TURN"))]) if _S.truth(_S.binary("<", _S.read(_v11, "t"), _S.read(_v11, "OPEN0"))) else _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v11, "t"), _S.read(_v11, "OPEN0")), _S.binary("*", _S.read(_v11, "i"), _S.read(_v11, "OSTEP"))), _S.read(_v11, "OTURN"))])))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v11, "lit"), 0.3), func(): return _S.binary(">", _S.read(_v11, "u"), 0.05)), func(): return _S.binary("<", _S.read(_v11, "u"), 0.95))):
			_S.call_value(_S.read(_v11, "glint"), [_S.read(_v11, "p"), _S.binary("*", _S.read(_v11, "W"), (_S.read(_v11, "u") if _S.truth(_S.binary("<", _S.read(_v11, "t"), _S.read(_v11, "OPEN0"))) else _S.binary("-", 1, _S.read(_v11, "u")))), _S.read(_v11, "y0"), _S.binary("*", 6, _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v11, "Math"), "PI"), _S.read(_v11, "u"))])), _S.binary("*", _S.read(_v11, "u"), 3), _S.prop(_S.read(_v11, "C"), 6), _S.prop(_S.read(_v11, "C"), 5)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	return null
