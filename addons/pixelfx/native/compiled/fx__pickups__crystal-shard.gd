@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/crystal-shard.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "drawGem", _S.import_value("fx/pickups/_lib.js", "drawGem"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "splinter", _S.function_value(_e, "_f1"))
	_S.define(_e, "splinters", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Crystal shard"}, {"desc": "A broken amber shard hovers and sways: chipped uneven faces, its top sheared off, light pulsing up through glowing cracks and flaring out of the break; splinters orbit it."}, {"tags": ["pickup", "crystal", "shard", "relic", "broken", "loop"]}, {"size": [64, 76]}, {"origin": [32, 68]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0a04", "#3e1606", "#702a08", "#a8480c", "#e07818", "#ffa838", "#ffd890", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HALF", 6)
	_S.define(_e, "TILT", 0.18)
	_S.define(_e, "LEAN", 0.2)
	_S.define(_e, "roll", _S.function_value(_e, "_f6"))
	_S.define(_e, "unit", _S.function_value(_e, "_f7"))
	_S.define(_e, "SOLID", _S.call_value(_S.function_value(_e, "_f8"), []))
	_S.define(_e, "CRACKS", [[[0.5, _S.unary("-", 9), 0.3], [_S.unary("-", 0.8), _S.unary("-", 5), 0.5], [0.6, _S.unary("-", 1), 0.2], [_S.unary("-", 0.4), 3, 0.6], [1.4, 6.5, 0.4], [2.2, 8.5, 0.6]], [[0.6, _S.unary("-", 1), 0.2], [2.4, 1.5, 1], [3.4, 4.2, 1.2]], [[_S.unary("-", 0.4), 3, 0.6], [_S.unary("-", 2), 6.5, 0.4], [_S.unary("-", 2.6), 10.5, 0.2], [_S.unary("-", 2.4), 14.5, 0.1]], [[_S.unary("-", 0.8), _S.unary("-", 5), 0.5], [_S.unary("-", 2.8), _S.unary("-", 3), 0.8]]])
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [32, 52]))
	_S.define(_e, "SL", _S.construct(_S.read(_e, "Layer"), [16, 16]))
	_S.define(_e, "HOVER", 27)
	_S.define(_e, "RX", 15)
	_S.define(_e, "RY", 3.8)
	_S.define(_e, "pose", _S.function_value(_e, "_f9"))
	_S.define(_e, "climb", _S.function_value(_e, "_f10"))
	_S.define(_e, "project", _S.function_value(_e, "_f11"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "spin", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.arg(_args, 4))
	_S.define(_e, "s0", _S.call_value(_S.read(_e, "climb"), [_S.read(_e, "ph")]))
	_S.define(_e, "rim", _S.binary(">>>", _S.prop(_S.read(_e, "C"), 0), 0))
	for _v0 in _S.array(_S.read(_e, "CRACKS")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "crack", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "crack"), "length"))):
			var _v3 = _S.scope(_v2)
			var _v4 = _S.call_value(_S.read(_v3, "project"), [_S.prop(_S.read(_v3, "crack"), _S.binary("-", _S.read(_v3, "i"), 1)), _S.read(_v3, "spin"), _S.read(_v3, "cy")])
			_S.define(_v3, "x0", _S.prop(_v4, 0))
			_S.define(_v3, "y0", _S.prop(_v4, 1))
			var _v5 = _S.call_value(_S.read(_v3, "project"), [_S.prop(_S.read(_v3, "crack"), _S.read(_v3, "i")), _S.read(_v3, "spin"), _S.read(_v3, "cy")])
			_S.define(_v3, "x1", _S.prop(_v5, 0))
			_S.define(_v3, "y1", _S.prop(_v5, 1))
			_S.define(_v3, "n", _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("*", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.read(_v3, "x1"), _S.read(_v3, "x0")), _S.binary("-", _S.read(_v3, "y1"), _S.read(_v3, "y0"))]), 2)]))
			var _v6 = _S.scope(_v3)
			_S.define(_v6, "j", 0)
			while _S.truth(_S.binary("<=", _S.read(_v6, "j"), _S.read(_v6, "n"))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "u", _S.binary("/", _S.read(_v7, "j"), _S.read(_v7, "n")))
				_S.define(_v7, "x", _S.binary("+", _S.read(_v7, "x0"), _S.binary("*", _S.binary("-", _S.read(_v7, "x1"), _S.read(_v7, "x0")), _S.read(_v7, "u"))))
				_S.define(_v7, "y", _S.binary("+", _S.read(_v7, "y0"), _S.binary("*", _S.binary("-", _S.read(_v7, "y1"), _S.read(_v7, "y0")), _S.read(_v7, "u"))))
				_S.define(_v7, "h", _S.binary("+", _S.prop(_S.prop(_S.read(_v7, "crack"), _S.binary("-", _S.read(_v7, "i"), 1)), 1), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v7, "crack"), _S.read(_v7, "i")), 1), _S.prop(_S.prop(_S.read(_v7, "crack"), _S.binary("-", _S.read(_v7, "i"), 1)), 1)), _S.read(_v7, "u"))))
				_S.define(_v7, "c", _S.binary(">>>", _S.invoke(_S.read(_v7, "L"), "get", [_S.read(_v7, "x"), _S.read(_v7, "y")]), 0))
				if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v7, "c")), func(): return _S.binary("===", _S.read(_v7, "c"), _S.read(_v7, "rim")))):
					_v6 = _S.iteration(_v6)
					_S.write(_v6, "j", 1, "+=", true)
					continue
				_S.define(_v7, "b", _S.binary("+", 0.3, _S.invoke(_S.read(_v7, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v7, "h"), 9), 22), _S.read(_v7, "s0")), 0.14), 2))])))
				_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.read(_v7, "WHITE") if _S.truth(_S.binary(">", _S.read(_v7, "b"), 0.9)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v7, "b"), 0.55)) else _S.prop(_S.read(_v7, "C"), 5)))])
				if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_v7, "j"), 4), 0), func(): return _S.binary(">", _S.read(_v7, "b"), 0.5))):
					_S.invoke(_S.read(_v7, "p"), "glow", [_S.binary("+", _S.read(_v7, "x"), 0.5), _S.binary("+", _S.read(_v7, "y"), 0.5), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v7, "b"))), _S.prop(_S.read(_v7, "C"), 5), _S.binary("*", 0.16, _S.read(_v7, "b"))])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "j", 1, "+=", true)
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "len", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "far", _S.arg(_args, 6))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.invoke(_S.read(_e, "SL"), "begin", [_S.binary("-", _S.read(_e, "X"), 7), _S.binary("-", _S.read(_e, "Y"), 7)])
	_S.invoke(_S.read(_e, "SL"), "fill", [_S.binary("-", _S.read(_e, "X"), 7), _S.binary("-", _S.read(_e, "Y"), 7), _S.binary("+", _S.read(_e, "X"), 6), _S.binary("+", _S.read(_e, "Y"), 6), _S.function_value(_e, "_f2")])
	_S.invoke(_S.invoke(_S.read(_e, "SL"), "outline", [_S.prop(_S.read(_e, "C"), (1 if _S.truth(_S.read(_e, "far")) else 0))]), "draw", [_S.read(_e, "p")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	if _S.truth(_S.binary(">", _S.binary("+", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), _S.read(_e, "len")), _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), (1.7 if _S.truth(_S.binary(">", _S.read(_e, "u"), 0)) else 1.1))), 1)):
		return 0
	_S.define(_e, "lit", _S.binary("*", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "ca"), 0.6), _S.binary("*", _S.read(_e, "sa"), 0.8))), _S.invoke(_S.read(_e, "Math"), "sign", [_S.logical("||", _S.read(_e, "v"), func(): return 1)])))
	return ((_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.prop(_S.read(_e, "C"), 3)) if _S.truth(_S.read(_e, "far")) else (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 0.5), func(): return _S.binary("<", _S.read(_e, "u"), 0))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("===", _S.binary("<", _S.read(_e, "v"), 0), _S.binary(">", _S.read(_e, "lit"), 0))) else _S.prop(_S.read(_e, "C"), 4))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("+", _S.binary("*", _S.read(_v9, "ph"), _S.read(_v9, "TAU")), _S.binary("/", _S.binary("*", _S.read(_v9, "i"), _S.read(_v9, "TAU")), 3)))
		_S.define(_v9, "s", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v9, "s"), 0), _S.read(_v9, "back"))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
			continue
		_S.define(_v9, "x", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "RX")))
		_S.define(_v9, "y", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v9, "cy"), 1), _S.binary("*", _S.read(_v9, "s"), _S.read(_v9, "RY"))), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), 1.5)))
		_S.define(_v9, "near", _S.binary("/", _S.binary("+", _S.read(_v9, "s"), 1), 2))
		_S.call_value(_S.read(_v9, "splinter"), [_S.read(_v9, "p"), _S.read(_v9, "C"), _S.read(_v9, "x"), _S.read(_v9, "y"), _S.binary("+", 3, _S.binary("*", 1.6, _S.read(_v9, "near"))), _S.binary("+", _S.binary("*", _S.read(_v9, "a"), 2), _S.binary("*", _S.read(_v9, "i"), 1.7)), _S.read(_v9, "back")])
		_S.invoke(_S.read(_v9, "p"), "glow", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.binary("+", 6, _S.binary("*", 3, _S.read(_v9, "near"))), _S.prop(_S.read(_v9, "C"), 5), _S.binary("*", (0.18 if _S.truth(_S.read(_v9, "back")) else 0.32), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v9, "near"))))])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v9, "back")), func(): return _S.binary(">", _S.read(_v9, "s"), 0.92))):
			_S.call_value(_S.read(_v9, "glint"), [_S.read(_v9, "p"), _S.binary("-", _S.read(_v9, "x"), 1), _S.binary("-", _S.read(_v9, "y"), 1), _S.binary("/", _S.binary("*", 2.5, _S.binary("-", _S.read(_v9, "s"), 0.92)), 0.08), _S.read(_v9, "WHITE"), 0.4])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	var _v10 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "ph")])
	_S.define(_e, "y", _S.prop(_v10, "y"))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, 6, 0.75])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0, 0.5, 20, 3.5, _S.prop(_S.read(_e, "C"), 4), 0.3])
	_S.invoke(_S.read(_e, "p"), "glowRing", [0, _S.read(_e, "y"), 7, 20, _S.prop(_S.read(_e, "C"), 4), 0.22])
	_S.call_value(_S.read(_e, "splinters"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "y"), true])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	var _v11 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "ph")])
	_S.define(_e, "y", _S.prop(_v11, "y"))
	_S.define(_e, "spin", _S.prop(_v11, "spin"))
	_S.define(_e, "s0", _S.call_value(_S.read(_e, "climb"), [_S.read(_e, "ph")]))
	_S.call_value(_S.read(_e, "drawGem"), [_S.read(_e, "L"), _S.read(_e, "p"), _S.read(_e, "SOLID"), 0, _S.read(_e, "y"), _S.read(_e, "spin"), _S.read(_e, "C"), _S.merge([{"tilt": _S.read(_e, "TILT")}, {"gain": 0.6}])])
	_S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "spin"), _S.read(_e, "y"), _S.read(_e, "ph")])
	_S.define(_e, "inside", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "s0"), 0.45), 0.45), 2))]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y"), 10, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.2, _S.read(_e, "inside"))])
	_S.call_value(_S.read(_e, "splinters"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "y"), false])
	var _v12 = _S.call_value(_S.read(_e, "project"), [[1.8, 8.4, 0.9], _S.read(_e, "spin"), _S.read(_e, "y")])
	_S.define(_e, "fx", _S.prop(_v12, 0))
	_S.define(_e, "fy", _S.prop(_v12, 1))
	_S.define(_e, "out", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "s0"), 1.05)]), 0.18))]))
	if _S.truth(_S.binary(">", _S.read(_e, "out"), 0)):
		_S.last([_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "fx"), _S.read(_e, "fy"), _S.binary("*", 3.5, _S.read(_e, "out")), _S.read(_e, "WHITE"), _S.binary("*", 0.55, _S.read(_e, "out"))]), _S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "fx"), _S.read(_e, "fy"), 12, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "out"))])])
	_S.define(_e, "P2", _S.binary("/", _S.prop(_S.read(_e, "meta"), "duration"), 2))
	_S.define(_e, "burst", _S.binary("*", _S.binary("/", _S.binary("+", 1.05, 0.3), 1.7), _S.read(_e, "P2")))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 7)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "born", _S.binary("+", _S.read(_v14, "burst"), _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "i"), _S.prop(_S.read(_v14, "o"), "seed"), 1]), 0.12)))
		_S.define(_v14, "at", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v14, "t"), _S.read(_v14, "born")), _S.read(_v14, "P2")), _S.read(_v14, "P2")), _S.read(_v14, "P2")))
		_S.define(_v14, "life", _S.binary("+", 0.6, _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "i"), _S.prop(_S.read(_v14, "o"), "seed"), 2]), 0.45)))
		if _S.truth(_S.binary(">", _S.read(_v14, "at"), _S.read(_v14, "life"))):
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
			continue
		_S.define(_v14, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v14, "at"), _S.read(_v14, "life"))))
		_S.define(_v14, "x", _S.binary("+", _S.binary("+", _S.read(_v14, "fx"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "i"), _S.prop(_S.read(_v14, "o"), "seed"), 3]), 0.5), 4)), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v14, "at"), 5), _S.read(_v14, "i"))]), 2), _S.binary("/", _S.read(_v14, "at"), _S.read(_v14, "life")))))
		_S.define(_v14, "yy", _S.binary("-", _S.read(_v14, "fy"), _S.binary("*", _S.read(_v14, "at"), _S.binary("+", 14, _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "i"), _S.prop(_S.read(_v14, "o"), "seed"), 4]), 14)))))
		_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "yy"), (_S.read(_v14, "WHITE") if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.6)) else (_S.prop(_S.read(_v14, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.3)) else _S.prop(_S.read(_v14, "C"), 5)))])
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.binary("+", _S.read(_v14, "x"), 0.5), _S.binary("+", _S.read(_v14, "yy"), 0.5), 3, _S.prop(_S.read(_v14, "C"), 5), _S.binary("*", 0.35, _S.read(_v14, "k"))])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v15 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v15, 0))
	_S.define(_e, "y", _S.prop(_v15, 1))
	_S.define(_e, "z", _S.prop(_v15, 2))
	return [_S.binary("-", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "LEAN")])), _S.binary("*", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "LEAN")]))), _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "LEAN")])), _S.binary("*", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "LEAN")]))), _S.read(_e, "z")]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "z")]))
	return [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "y"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "z"), _S.read(_e, "l"))]

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "planes", [])
	_S.define(_e, "deg", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 180))
	_S.define(_e, "jit", [0, 8, _S.unary("-", 6), 4, _S.unary("-", 9), 5])
	_S.define(_e, "rr", [1, 0.86, 1.08, 0.94, 0.82, 1.04])
	_S.define(_e, "low", [6.5, 5.5, 7, 6, 5, 6.8])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "k"), 6)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v17, "k"), 60), _S.prop(_S.read(_v17, "jit"), _S.read(_v17, "k"))), _S.read(_v17, "deg")))
		_S.define(_v17, "r", _S.binary("*", 4.8, _S.prop(_S.read(_v17, "rr"), _S.read(_v17, "k"))))
		_S.define(_v17, "ct", _S.invoke(_S.read(_v17, "Math"), "atan2", [13, _S.read(_v17, "r")]))
		_S.define(_v17, "cb", _S.invoke(_S.read(_v17, "Math"), "atan2", [_S.prop(_S.read(_v17, "low"), _S.read(_v17, "k")), _S.read(_v17, "r")]))
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 0, _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")])]}, {"d": _S.read(_v17, "r")}, {"kind": 6}])])
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "ct")]), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")])), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "ct")]), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "ct")]), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "ct")]), _S.read(_v17, "r")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "ct")]), _S.read(_v17, "HALF")))}, {"kind": 7}])])
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "cb")]), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")])), _S.unary("-", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "cb")])), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "cb")]), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "cb")]), _S.read(_v17, "r")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "cb")]), _S.read(_v17, "HALF")))}, {"kind": 8}])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "k", 1, "+=", true)
	_S.define(_e, "shear", _S.call_value(_S.read(_e, "unit"), [0.7, 0.62, 0.34]))
	_S.invoke(_S.read(_e, "planes"), "push", [_S.merge([{"n": _S.read(_e, "shear")}, {"d": _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "shear"), 1), 7.2), _S.binary("*", _S.prop(_S.read(_e, "shear"), 0), _S.unary("-", 0.6)))}, {"kind": 9}])])
	for _v18 in _S.array([[_S.call_value(_S.read(_e, "unit"), [_S.unary("-", 0.7), _S.unary("-", 0.25), 0.65]), 4], [_S.call_value(_S.read(_e, "unit"), [0.75, 0.15, 0.6]), 3.9], [_S.call_value(_S.read(_e, "unit"), [_S.unary("-", 0.55), 0.5, 0.3]), 6.8]]):
		var _v19 = _S.scope(_e)
		var _v20 = _v18
		_S.define(_v19, "n", _S.prop(_v20, 0))
		_S.define(_v19, "d", _S.prop(_v20, 1))
		_S.invoke(_S.read(_v19, "planes"), "push", [_S.merge([{"n": _S.read(_v19, "n")}, {"d": _S.read(_v19, "d")}, {"kind": 10}])])
	for _v21 in _S.array(_S.read(_e, "planes")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "q", _v21)
		_S.set_prop(_S.read(_v22, "q"), "n", _S.call_value(_S.read(_v22, "roll"), [_S.prop(_S.read(_v22, "q"), "n")]), "=", false)
	return _S.merge([{"planes": _S.read(_e, "planes")}, {"r": 8}, {"top": _S.binary("+", _S.read(_e, "HALF"), 13)}, {"bottom": _S.binary("+", _S.read(_e, "HALF"), 8)}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.merge([{"y": _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.8, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))])))}, {"spin": _S.binary("+", 0.3, _S.binary("*", 0.62, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))])))}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.binary("-", _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1), 1.7), 0.3)

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pt", _S.arg(_args, 0))
	_S.define(_e, "spin", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	var _v23 = _S.call_value(_S.read(_e, "roll"), [_S.read(_e, "pt")])
	_S.define(_e, "x", _S.prop(_v23, 0))
	_S.define(_e, "y", _S.prop(_v23, 1))
	_S.define(_e, "z", _S.prop(_v23, 2))
	_S.define(_e, "xr", _S.binary("-", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))))
	_S.define(_e, "zr", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")]))))
	return [_S.read(_e, "xr"), _S.binary("-", _S.read(_e, "cy"), _S.binary("-", _S.binary("*", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")])), _S.binary("*", _S.read(_e, "zr"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")]))))]
