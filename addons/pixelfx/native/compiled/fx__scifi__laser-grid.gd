@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/laser-grid.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "beams", _S.function_value(_e, "_f0"))
	_S.define(_e, "laser", _S.function_value(_e, "_f2"))
	_S.define(_e, "cross", _S.function_value(_e, "_f4"))
	_S.define(_e, "near", _S.function_value(_e, "_f5"))
	_S.define(_e, "post", _S.function_value(_e, "_f6"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Laser grid"}, {"desc": "Security lasers between two steel posts: red beams slide and scissor across, dust and haze light up only where they cut through, and the floor sweepers scorch and spark."}, {"tags": ["scifi", "laser", "security", "trap", "hazard", "beam", "ground", "loop"]}, {"size": [128, 84]}, {"origin": [64, 76]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0408", "#4a0a12", "#8a1020", "#d01c2a", "#ff4a4a", "#ff9a90", "#ffe4e0", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 31}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "PX", 48)
	_S.define(_e, "TOP", _S.unary("-", 64))
	_S.define(_e, "IN", _S.binary("-", _S.read(_e, "PX"), 4))
	_S.define(_e, "SLIDE", [[_S.unary("-", 14), 8, 1, 0], [_S.unary("-", 31), 12, 2, 1.3], [_S.unary("-", 48), 9, 1, 3.6]])
	_S.define(_e, "sweepX", _S.function_value(_e, "_f12"))
	_S.define(_e, "slideY", _S.function_value(_e, "_f13"))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "out", _S.invoke(_S.read(_e, "SLIDE"), "map", [_S.function_value(_e, "_f1")]))
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		_S.invoke(_S.read(_v1, "out"), "push", [[_S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "IN")), _S.binary("+", _S.read(_v1, "TOP"), 6), _S.call_value(_S.read(_v1, "sweepX"), [_S.read(_v1, "t"), _S.read(_v1, "s")]), 0]])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return [_S.unary("-", _S.read(_e, "IN")), _S.call_value(_S.read(_e, "slideY"), [_S.read(_e, "t"), _S.read(_e, "b")]), _S.read(_e, "IN"), _S.call_value(_S.read(_e, "slideY"), [_S.read(_e, "t"), _S.read(_e, "b")])]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	var _v2 = _S.read(_e, "b")
	_S.define(_e, "x0", _S.prop(_v2, 0))
	_S.define(_e, "y0", _S.prop(_v2, 1))
	_S.define(_e, "x1", _S.prop(_v2, 2))
	_S.define(_e, "y1", _S.prop(_v2, 3))
	_S.define(_e, "steep", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0"))])))
	_S.define(_e, "ox", (1 if _S.truth(_S.read(_e, "steep")) else 0))
	_S.define(_e, "oy", (0 if _S.truth(_S.read(_e, "steep")) else 1))
	for _v3 in _S.array([_S.unary("-", 1), 1]):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "s", _v3)
		_S.invoke(_S.read(_v4, "p"), "line", [_S.binary("+", _S.read(_v4, "x0"), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "ox"))), _S.binary("+", _S.read(_v4, "y0"), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "oy"))), _S.binary("+", _S.read(_v4, "x1"), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "ox"))), _S.binary("+", _S.read(_v4, "y1"), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "oy"))), (_S.prop(_S.read(_v4, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v4, "s"), 0)) else _S.prop(_S.read(_v4, "C"), 3))])
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.function_value(_e, "_f3")])
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "d", 0)
	while _S.truth(_S.binary("<=", _S.read(_v5, "d"), _S.read(_v5, "L"))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "x", _S.call_value(_S.read(_v6, "lerp"), [_S.read(_v6, "x0"), _S.read(_v6, "x1"), _S.binary("/", _S.read(_v6, "d"), _S.read(_v6, "L"))]))
		_S.define(_v6, "y", _S.call_value(_S.read(_v6, "lerp"), [_S.read(_v6, "y0"), _S.read(_v6, "y1"), _S.binary("/", _S.read(_v6, "d"), _S.read(_v6, "L"))]))
		_S.define(_v6, "h", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v6, "tileFbm"), [_S.binary("+", _S.binary("/", _S.read(_v6, "x"), 14), _S.binary("*", _S.binary("/", _S.read(_v6, "t"), _S.read(_v6, "D")), 4)), _S.binary("/", _S.read(_v6, "y"), 10), 4, 0, _S.read(_v6, "seed")]))))
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.binary("+", 6, _S.binary("*", 4, _S.read(_v6, "h"))), _S.prop(_S.read(_v6, "C"), 3), _S.binary("+", 0.14, _S.binary("*", _S.binary("*", 0.3, _S.read(_v6, "h")), _S.read(_v6, "h")))])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "d", 5, "+=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_e, "u"), 5), _S.binary("*", _S.read(_e, "t"), 3)), 1), 1), 1), 0.12)) else _S.read(_e, "WHITE"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	var _v7 = _S.read(_e, "a")
	_S.define(_e, "x1", _S.prop(_v7, 0))
	_S.define(_e, "y1", _S.prop(_v7, 1))
	_S.define(_e, "x2", _S.prop(_v7, 2))
	_S.define(_e, "y2", _S.prop(_v7, 3))
	var _v8 = _S.read(_e, "b")
	_S.define(_e, "x3", _S.prop(_v8, 0))
	_S.define(_e, "y3", _S.prop(_v8, 1))
	_S.define(_e, "x4", _S.prop(_v8, 2))
	_S.define(_e, "y4", _S.prop(_v8, 3))
	_S.define(_e, "d", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x2")), _S.binary("-", _S.read(_e, "y3"), _S.read(_e, "y4"))), _S.binary("*", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y2")), _S.binary("-", _S.read(_e, "x3"), _S.read(_e, "x4")))))
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "d")]), 0.000001)):
		return null
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x3")), _S.binary("-", _S.read(_e, "y3"), _S.read(_e, "y4"))), _S.binary("*", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y3")), _S.binary("-", _S.read(_e, "x3"), _S.read(_e, "x4")))), _S.read(_e, "d")))
	_S.define(_e, "v", _S.binary("/", _S.unary("-", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x2")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y3"))), _S.binary("*", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y2")), _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x3"))))), _S.read(_e, "d")))
	return ([_S.binary("+", _S.read(_e, "x1"), _S.binary("*", _S.read(_e, "u"), _S.binary("-", _S.read(_e, "x2"), _S.read(_e, "x1")))), _S.binary("+", _S.read(_e, "y1"), _S.binary("*", _S.read(_e, "u"), _S.binary("-", _S.read(_e, "y2"), _S.read(_e, "y1"))))] if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<=", _S.read(_e, "u"), 1)), func(): return _S.binary(">=", _S.read(_e, "v"), 0)), func(): return _S.binary("<=", _S.read(_e, "v"), 1))) else null)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	var _v9 = _S.read(_e, "b")
	_S.define(_e, "x0", _S.prop(_v9, 0))
	_S.define(_e, "y0", _S.prop(_v9, 1))
	_S.define(_e, "x1", _S.prop(_v9, 2))
	_S.define(_e, "y1", _S.prop(_v9, 3))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0")), _S.read(_e, "dx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0")), _S.read(_e, "dy"))), _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))]))
	_S.define(_e, "ex", _S.binary("-", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "u"))), _S.read(_e, "x")))
	_S.define(_e, "ey", _S.binary("-", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "u"))), _S.read(_e, "y")))
	return _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "ex"), _S.read(_e, "ex")), _S.binary("*", _S.read(_e, "ey"), _S.read(_e, "ey")))])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "x0", _S.binary("-", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "PX")), 4))
	_S.define(_e, "B", _S.invoke(_S.read(_e, "SLIDE"), "map", [_S.function_value(_e, "_f7")]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "y", _S.binary("+", _S.read(_v10, "TOP"), 4))
	while _S.truth(_S.binary("<", _S.read(_v10, "y"), 0)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "glint", _S.invoke(_S.read(_v11, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_v11, "B"), "map", [_S.function_value(_v11, "_f8")]))])))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 8)):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "x", _S.binary("+", _S.read(_v13, "x0"), _S.read(_v13, "i")))
			_S.define(_v13, "inner", (_S.binary(">=", _S.read(_v13, "i"), 6) if _S.truth(_S.binary("<", _S.read(_v13, "s"), 0)) else _S.binary("<=", _S.read(_v13, "i"), 1)))
			_S.define(_v13, "c", (_S.prop(_S.read(_v13, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v13, "i"), 0), func(): return _S.binary("===", _S.read(_v13, "i"), 7))) else (_S.prop(_S.read(_v13, "H"), 4) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 1)) else (_S.prop(_S.read(_v13, "H"), 3) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 2)) else (_S.prop(_S.read(_v13, "H"), 1) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 4)) else (_S.prop(_S.read(_v13, "H"), 2) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 6)) else _S.prop(_S.read(_v13, "H"), 3)))))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v13, "inner"), func(): return _S.binary("!==", _S.read(_v13, "i"), 0)), func(): return _S.binary("!==", _S.read(_v13, "i"), 7)), func(): return _S.binary(">", _S.read(_v13, "glint"), 0.35))):
				_S.write(_v13, "c", (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "glint"), 0.75)) else _S.prop(_S.read(_v13, "C"), 3)), "=", false)
			_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "y", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "y", _S.binary("+", _S.read(_v14, "TOP"), 12))
	while _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.unary("-", 4))):
		_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.read(_v14, "x0"), 3), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "H"), 5)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "y", 9, "+=", false)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "y", _S.read(_v15, "TOP"))
	while _S.truth(_S.binary("<", _S.read(_v15, "y"), _S.binary("+", _S.read(_v15, "TOP"), 10))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 9)):
			_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("+", _S.read(_v16, "x0"), _S.read(_v16, "i")), _S.read(_v16, "y"), (_S.prop(_S.read(_v16, "H"), 0) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v16, "i"), _S.unary("-", 1)), func(): return _S.binary("===", _S.read(_v16, "i"), 8)), func(): return _S.binary("===", _S.read(_v16, "y"), _S.read(_v16, "TOP"))), func(): return _S.binary("===", _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "TOP"), 9)))) else (_S.prop(_S.read(_v16, "H"), 5) if _S.truth(_S.binary("===", _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "TOP"), 1))) else (_S.prop(_S.read(_v16, "H"), 4) if _S.truth(_S.binary("<", _S.read(_v16, "i"), 3)) else _S.prop(_S.read(_v16, "H"), 2))))])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 6), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 5), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 7), _S.prop(_S.read(_e, "C"), 4)])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.unary("-", 3))
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), 11)):
		_S.last([_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), _S.unary("-", 2), (_S.prop(_S.read(_v17, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v17, "i"), _S.unary("-", 3)), func(): return _S.binary("===", _S.read(_v17, "i"), 10))) else _S.prop(_S.read(_v17, "H"), 4))]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), _S.unary("-", 1), (_S.prop(_S.read(_v17, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v17, "i"), _S.unary("-", 3)), func(): return _S.binary("===", _S.read(_v17, "i"), 10))) else _S.prop(_S.read(_v17, "H"), 2))]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), 0, _S.prop(_S.read(_v17, "H"), 1)])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	for _v18 in _S.array(_S.read(_e, "B")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "by", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "y", _S.invoke(_S.read(_v20, "Math"), "round", [_S.read(_v20, "by")]))
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "j", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v21, "j"), 2)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "i"), 4)):
				_S.invoke(_S.read(_v22, "p"), "px", [(_S.binary("+", _S.binary("+", _S.read(_v22, "x0"), 5), _S.read(_v22, "i")) if _S.truth(_S.binary("<", _S.read(_v22, "s"), 0)) else _S.binary("+", _S.binary("-", _S.read(_v22, "x0"), 1), _S.read(_v22, "i"))), _S.binary("+", _S.read(_v22, "y"), _S.read(_v22, "j")), (_S.prop(_S.read(_v22, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "j")]), 2), func(): return _S.binary("===", _S.read(_v22, "i"), (3 if _S.truth(_S.binary("<", _S.read(_v22, "s"), 0)) else 0)))) else (_S.prop(_S.read(_v22, "H"), 5) if _S.truth(_S.binary("<", _S.read(_v22, "j"), 0)) else _S.prop(_S.read(_v22, "H"), 3)))])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "i", 1, "+=", true)
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "j", 1, "+=", true)
		_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "IN")), _S.read(_v20, "y"), _S.read(_v20, "WHITE")])
		_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "IN")), _S.read(_v20, "y"), 7, _S.prop(_S.read(_v20, "C"), 4), 0.55])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 6), 8, _S.prop(_S.read(_e, "C"), 4), 0.55])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "slideY"), [_S.read(_e, "t"), _S.read(_e, "b")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "by", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "by")), 2.5), 2))])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"ground": _S.function_value(_e, "_f10")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}, {"box": [_S.unary("-", 62), _S.unary("-", 80), 62, 7]}])]))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "i"), 36)):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "tb", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v24, "i"), 36), _S.read(_v24, "D")), _S.invoke(_S.read(_v24, "rn"), "range", [0, 0.05])))
		_S.define(_v24, "s", (1 if _S.truth(_S.binary("%", _S.read(_v24, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v24, "x", _S.call_value(_S.read(_v24, "sweepX"), [_S.read(_v24, "tb"), _S.read(_v24, "s")]))
		_S.define(_v24, "dir", _S.logical("||", _S.invoke(_S.read(_v24, "Math"), "sign", [_S.binary("-", _S.call_value(_S.read(_v24, "sweepX"), [_S.binary("+", _S.read(_v24, "tb"), 0.02), _S.read(_v24, "s")]), _S.read(_v24, "x"))]), func(): return 1))
		_S.define(_v24, "a", _S.binary("-", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v24, "Math"), "PI")), 2), _S.binary("*", _S.read(_v24, "dir"), _S.invoke(_S.read(_v24, "rn"), "range", [0.2, 1.1]))))
		_S.invoke(_S.read(_v24, "g"), "add", [_S.read(_v24, "tb"), _S.prop(_S.read(_v24, "P"), "SPARK"), _S.read(_v24, "x"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.invoke(_S.read(_v24, "rn"), "range", [50, 140])), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.invoke(_S.read(_v24, "rn"), "range", [50, 140])), _S.invoke(_S.read(_v24, "rn"), "range", [0.2, 0.45])])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v24, "i"), 4), 0)):
			_S.invoke(_S.read(_v24, "g"), "add", [_S.read(_v24, "tb"), _S.prop(_S.read(_v24, "P"), "SMOKE"), _S.read(_v24, "x"), _S.unary("-", 2), _S.invoke(_S.read(_v24, "rn"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v24, "rn"), "range", [6, 14])), _S.invoke(_S.read(_v24, "rn"), "range", [0.8, 1.2]), _S.call_value(_S.read(_v24, "hex"), ["#3a2a30"]), _S.invoke(_S.read(_v24, "rn"), "range", [1.6, 2.4])])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "key"), _S.read(_e, "g")])
	return _S.read(_e, "g")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "beams"), [_S.read(_e, "t")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	for _v25 in _S.array([_S.unary("-", 1), 1]):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "s", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "k"), 14)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "ago", _S.binary("*", _S.read(_v28, "k"), 0.025))
			_S.define(_v28, "x", _S.call_value(_S.read(_v28, "sweepX"), [_S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "ago")), _S.read(_v28, "s")]))
			_S.define(_v28, "c", (_S.read(_v28, "WHITE") if _S.truth(_S.binary("<", _S.read(_v28, "k"), 2)) else (_S.prop(_S.read(_v28, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v28, "k"), 5)) else (_S.prop(_S.read(_v28, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v28, "k"), 9)) else _S.prop(_S.read(_v28, "C"), 3)))))
			_S.invoke(_S.read(_v28, "p"), "dot", [_S.read(_v28, "x"), 0, _S.read(_v28, "c"), _S.binary("-", 1, _S.binary("/", _S.read(_v28, "k"), 14))])
			_S.invoke(_S.read(_v28, "p"), "dot", [_S.read(_v28, "x"), 1, _S.prop(_S.read(_v28, "C"), 3), _S.binary("-", 0.6, _S.binary("/", _S.read(_v28, "k"), 24))])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "k", 1, "+=", true)
	var _v29 = _S.scope(_e)
	_S.define(_v29, "x", _S.unary("-", 40))
	while _S.truth(_S.binary("<=", _S.read(_v29, "x"), 40)):
		_S.invoke(_S.read(_v29, "p"), "glow", [_S.read(_v29, "x"), _S.unary("-", 2), 20, _S.prop(_S.read(_v29, "C"), 3), 0.12])
		_v29 = _S.iteration(_v29)
		_S.write(_v29, "x", 20, "+=", false)
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	var _v30 = _S.scope(_e)
	_S.define(_v30, "y", _S.unary("-", 60))
	while _S.truth(_S.binary("<", _S.read(_v30, "y"), 0)):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "x", _S.binary("+", _S.unary("-", _S.read(_v31, "IN")), 1))
		while _S.truth(_S.binary("<", _S.read(_v31, "x"), _S.read(_v31, "IN"))):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "d", 99)
			for _v33 in _S.array(_S.read(_v32, "B")):
				var _v34 = _S.scope(_v32)
				_S.define(_v34, "b", _v33)
				_S.write(_v34, "d", _S.invoke(_S.read(_v34, "Math"), "min", [_S.read(_v34, "d"), _S.call_value(_S.read(_v34, "near"), [_S.read(_v34, "b"), _S.binary("+", _S.read(_v34, "x"), 0.5), _S.binary("+", _S.read(_v34, "y"), 0.5)])]), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v32, "d"), 11)):
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "x", 1, "+=", true)
				continue
			_S.define(_v32, "low", _S.binary("+", 0.35, _S.binary("*", 0.65, _S.call_value(_S.read(_v32, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_v32, "y"), 60), 50)]))))
			_S.define(_v32, "n", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v32, "tileFbm"), [_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v32, "x"), 0.5), 18), _S.binary("*", _S.read(_v32, "ph"), 3)), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v32, "y"), 0.5), 7), _S.binary("*", 0.4, _S.invoke(_S.read(_v32, "Math"), "sin", [_S.binary("*", _S.read(_v32, "TAU"), _S.read(_v32, "ph"))]))), 3, 0, _S.binary("+", _S.read(_v32, "S"), 7), 2]))))
			_S.define(_v32, "dens", _S.binary("*", _S.call_value(_S.read(_v32, "clamp"), [_S.binary("*", _S.binary("-", _S.read(_v32, "n"), 0.42), 2.2)]), _S.read(_v32, "low")))
			if _S.truth(_S.binary("<=", _S.read(_v32, "dens"), 0.02)):
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "x", 1, "+=", true)
				continue
			_S.define(_v32, "lit", _S.invoke(_S.read(_v32, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v32, "d")), 4.5)]))
			_S.invoke(_S.read(_v32, "p"), "blend", [_S.binary("+", _S.read(_v32, "x"), 0.5), _S.binary("+", _S.read(_v32, "y"), 0.5), (_S.prop(_S.read(_v32, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v32, "lit"), 0.5)) else (_S.prop(_S.read(_v32, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v32, "lit"), 0.15)) else _S.prop(_S.read(_v32, "C"), 1))), _S.binary("*", _S.binary("*", _S.read(_v32, "dens"), 0.8), _S.read(_v32, "lit"))])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "x", 1, "+=", true)
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "y", 1, "+=", true)
	for _v35 in _S.array([_S.unary("-", 1), 1]):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "s", _v35)
		_S.call_value(_S.read(_v36, "post"), [_S.read(_v36, "p"), _S.read(_v36, "s"), _S.read(_v36, "H"), _S.read(_v36, "C"), _S.read(_v36, "t")])
	for _v37 in _S.array(_S.read(_e, "B")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "b", _v37)
		_S.call_value(_S.read(_v38, "laser"), [_S.read(_v38, "p"), _S.read(_v38, "b"), _S.read(_v38, "C"), _S.read(_v38, "t"), _S.read(_v38, "S")])
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), 90)):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "x", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("*", _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "S"), _S.read(_v40, "i")]), 2), 1), _S.binary("-", _S.read(_v40, "IN"), 3)), _S.binary("*", 4, _S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v40, "TAU"), _S.binary("/", _S.read(_v40, "t"), _S.read(_v40, "D"))), _S.read(_v40, "i"))]))))
		_S.define(_v40, "y", _S.binary("+", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "S"), _S.read(_v40, "i"), 1]), 62)), _S.binary("*", 3, _S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v40, "TAU"), 2), _S.binary("/", _S.read(_v40, "t"), _S.read(_v40, "D"))), _S.binary("*", _S.read(_v40, "i"), 1.7))]))))
		_S.define(_v40, "d", 9)
		for _v41 in _S.array(_S.read(_v40, "B")):
			var _v42 = _S.scope(_v40)
			_S.define(_v42, "b", _v41)
			_S.write(_v42, "d", _S.invoke(_S.read(_v42, "Math"), "min", [_S.read(_v42, "d"), _S.call_value(_S.read(_v42, "near"), [_S.read(_v42, "b"), _S.read(_v42, "x"), _S.read(_v42, "y")])]), "=", false)
		if _S.truth(_S.binary("<", _S.read(_v40, "d"), 1.6)):
			var _v43 = _S.scope(_v40)
			_S.invoke(_S.read(_v43, "p"), "px", [_S.read(_v43, "x"), _S.read(_v43, "y"), (_S.read(_v43, "WHITE") if _S.truth(_S.binary("<", _S.read(_v43, "d"), 0.9)) else _S.prop(_S.read(_v43, "C"), 6))])
			_S.invoke(_S.read(_v43, "p"), "glow", [_S.read(_v43, "x"), _S.read(_v43, "y"), 3, _S.prop(_S.read(_v43, "C"), 5), 0.45])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	var _v44 = _S.scope(_e)
	_S.define(_v44, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v44, "i"), _S.prop(_S.read(_v44, "B"), "length"))):
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "j", _S.binary("+", _S.read(_v45, "i"), 1))
		while _S.truth(_S.binary("<", _S.read(_v45, "j"), _S.prop(_S.read(_v45, "B"), "length"))):
			var _v46 = _S.scope(_v45)
			_S.define(_v46, "c", _S.call_value(_S.read(_v46, "cross"), [_S.prop(_S.read(_v46, "B"), _S.read(_v46, "i")), _S.prop(_S.read(_v46, "B"), _S.read(_v46, "j"))]))
			if _S.truth(_S.unary("!", _S.read(_v46, "c"))):
				_v45 = _S.iteration(_v45)
				_S.write(_v45, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v46, "p"), "glow", [_S.prop(_S.read(_v46, "c"), 0), _S.prop(_S.read(_v46, "c"), 1), 9, _S.prop(_S.read(_v46, "C"), 5), 0.4])
			_S.call_value(_S.read(_v46, "sparkle"), [_S.read(_v46, "p"), _S.prop(_S.read(_v46, "c"), 0), _S.prop(_S.read(_v46, "c"), 1), 2, _S.prop(_S.read(_v46, "C"), 6), _S.prop(_S.read(_v46, "C"), 5), 0.3])
			_v45 = _S.iteration(_v45)
			_S.write(_v45, "j", 1, "+=", true)
		_v44 = _S.iteration(_v44)
		_S.write(_v44, "i", 1, "+=", true)
	for _v47 in _S.array([_S.unary("-", 1), 1]):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "s", _v47)
		var _v49 = _S.scope(_v48)
		_S.define(_v49, "x", _S.call_value(_S.read(_v49, "sweepX"), [_S.read(_v49, "t"), _S.read(_v49, "s")]))
		_S.invoke(_S.read(_v49, "p"), "px", [_S.read(_v49, "x"), _S.unary("-", 1), _S.read(_v49, "WHITE")])
		_S.invoke(_S.read(_v49, "p"), "px", [_S.binary("-", _S.read(_v49, "x"), 1), 0, _S.prop(_S.read(_v49, "C"), 6)])
		_S.invoke(_S.read(_v49, "p"), "px", [_S.binary("+", _S.read(_v49, "x"), 1), 0, _S.prop(_S.read(_v49, "C"), 6)])
		_S.invoke(_S.read(_v49, "p"), "glow", [_S.read(_v49, "x"), _S.unary("-", 1), 10, _S.prop(_S.read(_v49, "C"), 4), 0.55])
		_S.invoke(_S.read(_v49, "p"), "glow", [_S.read(_v49, "x"), _S.unary("-", 1), 4, _S.read(_v49, "WHITE"), 0.35])
	_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "ghosts"), [_S.read(_e, "o"), _S.read(_e, "C")]), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	return _S.binary("*", _S.read(_e, "s"), _S.binary("-", 34, _S.binary("*", 68, _S.binary("-", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "TAU"), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D"))), (0 if _S.truth(_S.binary(">", _S.read(_e, "s"), 0)) else 1.9))]))))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	var _v50 = _S.arg(_args, 1)
	_S.define(_e, "y", _S.prop(_v50, 0))
	_S.define(_e, "a", _S.prop(_v50, 1))
	_S.define(_e, "n", _S.prop(_v50, 2))
	_S.define(_e, "f", _S.prop(_v50, 3))
	return _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "a"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "n")), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D"))), _S.read(_e, "f"))])))
