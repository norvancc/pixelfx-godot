@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/storm-cloud.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "billows", _S.function_value(_e, "_f0"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f2"))
	_S.define(_e, "scud", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Storm cloud"}, {"desc": "A storm cloud boils overhead, billows lit from inside by flickering discharges, ragged scud under its flat dark base; rain slants down and once a loop a bolt cracks to the floor."}, {"tags": ["lightning", "storm", "weather", "cloud", "rain", "ambient", "loop"]}, {"size": [168, 176]}, {"origin": [84, 164]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"cloud": ["#09070f", "#120f1e", "#1b182e", "#252640", "#323758", "#464d78", "#646b9c"]}, {"rain": ["#2b3250", "#46527a", "#6d7cab", "#a5b5e0"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 90)
	_S.define(_e, "P", 3)
	_S.define(_e, "BASE", _S.unary("-", 100))
	_S.define(_e, "TOP", _S.unary("-", 156))
	_S.define(_e, "TH", 0.35)
	_S.define(_e, "VIS", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "TH")]))]))
	_S.define(_e, "BILLOWS", [[_S.unary("-", 6), _S.unary("-", 132), 17], [18, _S.unary("-", 127), 14], [_S.unary("-", 28), _S.unary("-", 122), 12], [38, _S.unary("-", 118), 10], [0, _S.unary("-", 142), 12], [14, _S.unary("-", 149), 19, 0.38], [40, _S.unary("-", 148), 14, 0.34], [_S.unary("-", 48), _S.unary("-", 113), 10], [55, _S.unary("-", 110), 9], [_S.unary("-", 17), _S.unary("-", 115), 13], [22, _S.unary("-", 113), 12], [_S.unary("-", 42), _S.unary("-", 104), 11], [_S.unary("-", 10), _S.unary("-", 104), 12], [20, _S.unary("-", 104), 11], [48, _S.unary("-", 103), 9], [_S.unary("-", 63), _S.unary("-", 104), 7], [66, _S.unary("-", 103), 6]])
	_S.define(_e, "FLASHES", [[7, 2, 0.8], [8, 9, 0.55], [29, 1, 0.75], [31, 10, 1], [33, 3, 0.5], [70, 0, 0.8], [71, 4, 0.55], [72, 5, 0.35]])
	_S.define(_e, "BOLT", 52)
	_S.define(_e, "BOLT_B", 12)
	_S.define(_e, "BK", [1, 0.7, 0.3, 0.95, 0.5, 0.75, 0.2])
	_S.define(_e, "W0", _S.unary("-", 84))
	_S.define(_e, "H0", _S.binary("-", _S.read(_e, "TOP"), 6))
	_S.define(_e, "GW", 168)
	_S.define(_e, "GH", _S.binary("-", _S.binary("+", _S.read(_e, "BASE"), 8), _S.read(_e, "H0")))
	_S.define(_e, "FIELD", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "GX", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "GY", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "LIT", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "BILLOWS"), "map", [_S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "v", _S.prop(_v0, 2))
	_S.define(_e, "sq", _S.coalesce(_S.prop(_v0, 3), func(): return 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "top", _S.logical("&&", _S.binary("<", _S.read(_e, "y"), _S.unary("-", 112)), func(): return _S.binary("===", _S.read(_e, "sq"), 1)))
	_S.define(_e, "boil", _S.binary("+", 0.82, _S.binary("*", 0.3, _S.binary("**", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("%", _S.binary("+", _S.read(_e, "ph"), _S.binary("*", _S.read(_e, "i"), 0.37)), 1))]), 2))))
	return _S.merge([{"sq": _S.read(_e, "sq")}, {"x": _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", 3.5, _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.7, _S.binary("+", _S.read(_e, "seed"), _S.read(_e, "i"))]))), (_S.binary("*", 4, _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.5, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.read(_e, "i")), 90)])) if _S.truth(_S.binary("<", _S.read(_e, "sq"), 1)) else 0))}, {"y": _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.binary("*", 2, _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.7, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.read(_e, "i")), 30)]))), (_S.binary("*", 4, _S.binary("-", _S.read(_e, "boil"), 0.97)) if _S.truth(_S.read(_e, "top")) else 0))}, {"r": _S.binary("/", _S.binary("*", _S.read(_e, "v"), (_S.read(_e, "boil") if _S.truth(_S.read(_e, "top")) else _S.binary("+", 1, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.6, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.read(_e, "i")), 60)]))))), _S.read(_e, "VIS"))}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "K", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "flashes", _S.arg(_args, 6))
	_S.invoke(_S.read(_e, "FIELD"), "fill", [0])
	_S.invoke(_S.read(_e, "GX"), "fill", [0])
	_S.invoke(_S.read(_e, "GY"), "fill", [0])
	_S.invoke(_S.read(_e, "LIT"), "fill", [0])
	for _v1 in _S.array(_S.invoke(_S.read(_e, "B"), "entries", [])):
		var _v2 = _S.scope(_e)
		var _v3 = _v1
		_S.define(_v2, "i", _S.prop(_v3, 0))
		_S.define(_v2, "b", _S.prop(_v3, 1))
		var _v4 = _S.scope(_v2)
		_S.define(_v4, "k", _S.logical("??", _S.invoke(_S.read(_v4, "flashes"), "get", [_S.read(_v4, "i")]), func(): return 0))
		_S.define(_v4, "r2", _S.binary("*", _S.prop(_S.read(_v4, "b"), "r"), _S.prop(_S.read(_v4, "b"), "r")))
		_S.define(_v4, "ry", _S.binary("*", _S.prop(_S.read(_v4, "b"), "r"), _S.prop(_S.read(_v4, "b"), "sq")))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "y", _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v5, "b"), "y"), _S.read(_v5, "ry")), _S.read(_v5, "H0"))])]))
		while _S.truth(_S.binary("<", _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "Math"), "min", [_S.read(_v5, "GH"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v5, "b"), "y"), _S.read(_v5, "ry")), _S.read(_v5, "H0"))])]))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "x", _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v6, "b"), "x"), _S.prop(_S.read(_v6, "b"), "r")), _S.read(_v6, "W0"))])]))
			while _S.truth(_S.binary("<", _S.read(_v6, "x"), _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "GW"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v6, "b"), "x"), _S.prop(_S.read(_v6, "b"), "r")), _S.read(_v6, "W0"))])]))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "dx", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v7, "x"), _S.read(_v7, "W0")), 0.5), _S.prop(_S.read(_v7, "b"), "x")))
				_S.define(_v7, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v7, "y"), _S.read(_v7, "H0")), 0.5), _S.prop(_S.read(_v7, "b"), "y")), _S.prop(_S.read(_v7, "b"), "sq")))
				_S.define(_v7, "d2", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v7, "dx"), _S.read(_v7, "dx")), _S.binary("*", _S.read(_v7, "dy"), _S.read(_v7, "dy"))), _S.read(_v7, "r2")))
				if _S.truth(_S.binary(">=", _S.read(_v7, "d2"), 1)):
					_v6 = _S.iteration(_v6)
					_S.write(_v6, "x", 1, "+=", true)
					continue
				_S.define(_v7, "j", _S.binary("+", _S.binary("*", _S.read(_v7, "y"), _S.read(_v7, "GW")), _S.read(_v7, "x")))
				_S.define(_v7, "u", _S.binary("-", 1, _S.read(_v7, "d2")))
				_S.define(_v7, "c", _S.binary("*", _S.read(_v7, "u"), _S.read(_v7, "u")))
				_S.set_prop(_S.read(_v7, "FIELD"), _S.read(_v7, "j"), _S.read(_v7, "c"), "+=", false)
				_S.set_prop(_S.read(_v7, "GX"), _S.read(_v7, "j"), _S.binary("/", _S.binary("*", _S.binary("*", _S.unary("-", 4), _S.read(_v7, "u")), _S.read(_v7, "dx")), _S.read(_v7, "r2")), "+=", false)
				_S.set_prop(_S.read(_v7, "GY"), _S.read(_v7, "j"), _S.binary("/", _S.binary("*", _S.binary("*", _S.unary("-", 4), _S.read(_v7, "u")), _S.read(_v7, "dy")), _S.binary("*", _S.read(_v7, "r2"), _S.prop(_S.read(_v7, "b"), "sq"))), "+=", false)
				if _S.truth(_S.read(_v7, "k")):
					_S.set_prop(_S.read(_v7, "LIT"), _S.read(_v7, "j"), _S.binary("*", _S.binary("*", _S.read(_v7, "k"), _S.binary("+", 0.25, _S.binary("*", 0.75, _S.read(_v7, "c")))), (1 if _S.truth(_S.binary("<", _S.read(_v7, "d2"), 1)) else 0)), "+=", false)
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "x", 1, "+=", true)
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "y", 1, "+=", true)
	_S.define(_e, "ramp", _S.concat([_S.array(_S.read(_e, "K")), [_S.prop(_S.read(_e, "C"), 3)], [_S.prop(_S.read(_e, "C"), 4)], [_S.prop(_S.read(_e, "C"), 5)], [_S.prop(_S.read(_e, "C"), 6)]]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "K"), "length"))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "y"), _S.read(_v8, "GH"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "cy", _S.binary("+", _S.binary("+", _S.read(_v9, "y"), _S.read(_v9, "H0")), 0.5))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "x"), _S.read(_v10, "GW"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "j", _S.binary("+", _S.binary("*", _S.read(_v11, "y"), _S.read(_v11, "GW")), _S.read(_v11, "x")))
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v11, "FIELD"), _S.read(_v11, "j")), _S.binary("-", _S.read(_v11, "TH"), 0.06))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "x", 1, "+=", true)
				continue
			_S.define(_v11, "cx", _S.binary("+", _S.binary("+", _S.read(_v11, "x"), _S.read(_v11, "W0")), 0.5))
			_S.define(_v11, "base", _S.binary("+", _S.read(_v11, "BASE"), _S.binary("*", 1.5, _S.call_value(_S.read(_v11, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_v11, "cx"), 0.12), _S.binary("*", 9, _S.read(_v11, "ph"))), 3, 9, 0, _S.binary("+", _S.read(_v11, "seed"), 5)]))))
			_S.define(_v11, "F", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v11, "FIELD"), _S.read(_v11, "j")), _S.binary("-", 1, _S.call_value(_S.read(_v11, "smooth"), [_S.binary("-", _S.read(_v11, "base"), 3), _S.read(_v11, "base"), _S.read(_v11, "cy")]))), _S.binary("*", 0.05, _S.call_value(_S.read(_v11, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_v11, "cx"), 0.21), _S.binary("*", 18, _S.read(_v11, "ph"))), _S.binary("*", _S.read(_v11, "cy"), 0.21), 18, 0, _S.read(_v11, "seed")]))))
			if _S.truth(_S.binary("<", _S.read(_v11, "F"), _S.read(_v11, "TH"))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "x", 1, "+=", true)
				continue
			_S.define(_v11, "gl", _S.logical("||", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.prop(_S.read(_v11, "GX"), _S.read(_v11, "j")), _S.prop(_S.read(_v11, "GY"), _S.read(_v11, "j"))]), func(): return 1))
			_S.define(_v11, "lam", _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v11, "GX"), _S.read(_v11, "j")), 0.42), _S.binary("*", _S.prop(_S.read(_v11, "GY"), _S.read(_v11, "j")), 0.9))), _S.read(_v11, "gl")))
			_S.define(_v11, "edge", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("*", _S.read(_v11, "gl"), 5)]), (1 if _S.truth(_S.binary("<", _S.read(_v11, "F"), _S.binary("+", _S.read(_v11, "TH"), 0.08))) else 0.55)))
			_S.define(_v11, "h", _S.binary("-", 1, _S.binary("*", 2, _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v11, "cy"), _S.read(_v11, "TOP")), _S.binary("-", _S.read(_v11, "BASE"), _S.read(_v11, "TOP")))]))))
			_S.define(_v11, "i", _S.binary("+", _S.binary("+", _S.binary("+", 2.7, _S.binary("*", 2.2, _S.read(_v11, "h"))), _S.binary("*", _S.binary("*", 1.3, _S.read(_v11, "lam")), _S.read(_v11, "edge"))), _S.binary("*", 0.4, _S.call_value(_S.read(_v11, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_v11, "cx"), 0.16), _S.binary("*", 12, _S.read(_v11, "ph"))), _S.binary("*", _S.read(_v11, "cy"), 0.16), 12, 0, _S.binary("+", _S.read(_v11, "seed"), 9)]))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v11, "F"), _S.binary("+", _S.read(_v11, "TH"), 0.05)), func(): return _S.binary(">", _S.read(_v11, "lam"), 0.3)), func(): return _S.binary(">", _S.read(_v11, "h"), _S.unary("-", 0.5)))):
				_S.write(_v11, "i", 1, "+=", false)
			if _S.truth(_S.binary(">", _S.read(_v11, "cy"), _S.binary("-", _S.read(_v11, "base"), 6))):
				_S.write(_v11, "i", 1, "-=", false)
			_S.write(_v11, "i", _S.call_value(_S.read(_v11, "clamp"), [_S.invoke(_S.read(_v11, "Math"), "round", [_S.read(_v11, "i")]), 0, _S.binary("-", _S.read(_v11, "n"), 1)]), "=", false)
			_S.define(_v11, "L", _S.binary("*", _S.prop(_S.read(_v11, "LIT"), _S.read(_v11, "j")), _S.binary("+", 0.7, _S.binary("*", 0.6, _S.call_value(_S.read(_v11, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v11, "cx"), 0.2), _S.binary("*", 14, _S.read(_v11, "ph"))), _S.binary("*", _S.read(_v11, "cy"), 0.2), 14, 0, _S.binary("+", _S.read(_v11, "seed"), 3)])))))
			if _S.truth(_S.binary(">", _S.read(_v11, "L"), 0.12)):
				_S.write(_v11, "i", _S.invoke(_S.read(_v11, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v11, "ramp"), "length"), 1), _S.binary("+", _S.read(_v11, "i"), _S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("*", _S.read(_v11, "L"), 5.5)]))]), "=", false)
			_S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "cx"), _S.read(_v11, "cy"), _S.prop(_S.read(_v11, "ramp"), _S.read(_v11, "i"))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "x", 1, "+=", true)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "y", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.arg(_args, 2))
	_S.define(_e, "K", _S.arg(_args, 3))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), 13]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "w", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "w"), 6)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "x0", _S.invoke(_S.read(_v13, "r"), "range", [_S.unary("-", 60), 60]))
		_S.define(_v13, "y0", _S.binary("+", _S.read(_v13, "BASE"), _S.invoke(_S.read(_v13, "r"), "range", [3, 9])))
		_S.define(_v13, "rx", _S.invoke(_S.read(_v13, "r"), "range", [10, 20]))
		_S.define(_v13, "ry", _S.invoke(_S.read(_v13, "r"), "range", [1.3, 2.2]))
		_S.define(_v13, "off", _S.invoke(_S.read(_v13, "r"), "next", []))
		_S.define(_v13, "u", _S.binary("%", _S.binary("+", _S.read(_v13, "ph"), _S.read(_v13, "off")), 1))
		_S.define(_v13, "a", _S.binary("**", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v13, "Math"), "PI"), _S.read(_v13, "u"))]), 0.8))
		_S.define(_v13, "xc", _S.binary("+", _S.read(_v13, "x0"), _S.binary("*", 16, _S.binary("-", _S.read(_v13, "u"), 0.5))))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "y", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v14, "y0"), _S.read(_v14, "ry")), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v14, "y"), _S.binary("+", _S.binary("+", _S.read(_v14, "y0"), _S.read(_v14, "ry")), 1))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "x", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v15, "xc"), _S.read(_v15, "rx")), 1)]))
			while _S.truth(_S.binary("<=", _S.read(_v15, "x"), _S.binary("+", _S.binary("+", _S.read(_v15, "xc"), _S.read(_v15, "rx")), 1))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v16, "x"), 0.5), _S.read(_v16, "xc")), _S.read(_v16, "rx")))
				_S.define(_v16, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v16, "y"), 0.5), _S.read(_v16, "y0")), _S.read(_v16, "ry")))
				_S.define(_v16, "nz", _S.call_value(_S.read(_v16, "tileNoise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v16, "x"), 0.5), 0.35), _S.binary("*", 10, _S.read(_v16, "ph"))), _S.binary("*", _S.read(_v16, "w"), 7)), _S.binary("*", _S.binary("+", _S.read(_v16, "y"), 0.5), 0.5), 10, 0, _S.binary("+", _S.binary("+", _S.read(_v16, "seed"), 20), _S.read(_v16, "w"))]))
				_S.define(_v16, "v", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("-", 1, _S.binary("*", _S.read(_v16, "dx"), _S.read(_v16, "dx"))), _S.binary("*", _S.read(_v16, "dy"), _S.read(_v16, "dy"))), _S.read(_v16, "a")), _S.binary("*", 0.6, _S.read(_v16, "nz"))), 0.25))
				if _S.truth(_S.binary(">", _S.read(_v16, "v"), 0)):
					_S.invoke(_S.read(_v16, "p"), "blend", [_S.binary("+", _S.read(_v16, "x"), 0.5), _S.binary("+", _S.read(_v16, "y"), 0.5), (_S.prop(_S.read(_v16, "K"), 2) if _S.truth(_S.binary(">", _S.read(_v16, "v"), 0.4)) else _S.prop(_S.read(_v16, "K"), 3)), _S.invoke(_S.read(_v16, "Math"), "min", [0.6, _S.binary("+", 0.2, _S.binary("*", _S.read(_v16, "v"), 0.7))])])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "y", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "w", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "cloud"), 7]))
	_S.define(_e, "RN", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "rain"), 4]))
	_S.define(_e, "S", _S.invoke(_S.prop(_S.read(_e, "o"), "sparks"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "f"), _S.read(_e, "N")))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "billows"), [_S.prop(_S.read(_e, "o"), "seed"), _S.read(_e, "ph")]))
	_S.define(_e, "br", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 5, _S.read(_e, "BOLT")]))
	_S.define(_e, "ba", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "BOLT")))
	_S.define(_e, "bx0", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "BILLOWS"), _S.read(_e, "BOLT_B")), 0), _S.invoke(_S.read(_e, "br"), "range", [_S.unary("-", 4), 4])))
	_S.define(_e, "bx1", _S.invoke(_S.read(_e, "br"), "range", [_S.unary("-", 24), 24]))
	_S.define(_e, "flashes", _S.construct(_S.read(_e, "Map"), [_S.invoke(_S.invoke(_S.read(_e, "FLASHES"), "filter", [_S.function_value(_e, "_f5")]), "map", [_S.function_value(_e, "_f6")])]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "ba"), 0), func(): return _S.binary("<", _S.read(_e, "ba"), _S.prop(_S.read(_e, "BK"), "length")))):
		_S.invoke(_S.read(_e, "flashes"), "set", [_S.read(_e, "BOLT_B"), _S.invoke(_S.read(_e, "Math"), "max", [_S.logical("??", _S.invoke(_S.read(_e, "flashes"), "get", [_S.read(_e, "BOLT_B")]), func(): return 0), _S.prop(_S.read(_e, "BK"), _S.read(_e, "ba"))])])
	_S.define(_e, "lights", _S.invoke(_S.concat([_S.array(_S.read(_e, "flashes"))]), "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "flash", _S.invoke(_S.read(_e, "lights"), "reduce", [_S.function_value(_e, "_f8"), 0]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "P"), 150, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 11), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "scud"), [_S.read(_e, "p"), _S.read(_e, "ph"), _S.prop(_S.read(_e, "o"), "seed"), _S.read(_e, "K")])
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "B"), _S.read(_e, "ph"), _S.prop(_S.read(_e, "o"), "seed"), _S.read(_e, "K"), _S.read(_e, "C"), _S.read(_e, "flashes")])
	for _v24 in _S.array(_S.read(_e, "lights")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "l", _v24)
		_S.invoke(_S.read(_v25, "p"), "glow", [_S.prop(_S.read(_v25, "l"), "x"), _S.prop(_S.read(_v25, "l"), "y"), _S.prop(_S.read(_v25, "l"), "r"), _S.prop(_S.read(_v25, "C"), 4), _S.binary("*", 0.4, _S.prop(_S.read(_v25, "l"), "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 122), 80, _S.prop(_S.read(_e, "C"), 2), _S.binary("+", 0.05, _S.binary("*", 0.22, _S.read(_e, "flash")))])
	for _v26 in _S.array(_S.read(_e, "FLASHES")):
		var _v27 = _S.scope(_e)
		var _v28 = _v26
		_S.define(_v27, "ff", _S.prop(_v28, 0))
		_S.define(_v27, "b", _S.prop(_v28, 1))
		_S.define(_v27, "k", _S.prop(_v28, 2))
		if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v27, "ff"), _S.read(_v27, "f")), func(): return _S.binary(">", _S.read(_v27, "k"), 0.6))):
			var _v29 = _S.scope(_v27)
			_S.define(_v29, "r", _S.call_value(_S.read(_v29, "rng"), [_S.prop(_S.read(_v29, "o"), "seed"), 7, _S.read(_v29, "ff")]))
			_S.define(_v29, "x", _S.prop(_S.prop(_S.read(_v29, "B"), _S.read(_v29, "b")), "x"))
			_S.call_value(_S.read(_v29, "crackle"), [_S.read(_v29, "p"), _S.call_value(_S.read(_v29, "zigzag"), [_S.read(_v29, "r"), _S.binary("-", _S.read(_v29, "x"), _S.invoke(_S.read(_v29, "r"), "range", [12, 22])), _S.binary("-", _S.read(_v29, "BASE"), _S.invoke(_S.read(_v29, "r"), "range", [2, 6])), _S.binary("+", _S.read(_v29, "x"), _S.invoke(_S.read(_v29, "r"), "range", [12, 22])), _S.binary("-", _S.read(_v29, "BASE"), _S.invoke(_S.read(_v29, "r"), "range", [1, 5])), 0.25, 0.5]), 0.6, _S.read(_v29, "C"), 0.4])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "ba"), 0), func(): return _S.binary("<", _S.read(_e, "ba"), _S.prop(_S.read(_e, "BK"), "length")))):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "k", _S.prop(_S.read(_v30, "BK"), _S.read(_v30, "ba")))
		_S.call_value(_S.read(_v30, "stroke"), [_S.read(_v30, "p"), _S.call_value(_S.read(_v30, "zigzag"), [_S.call_value(_S.read(_v30, "rng"), [_S.prop(_S.read(_v30, "o"), "seed"), 9, _S.read(_v30, "BOLT")]), _S.read(_v30, "bx0"), _S.binary("-", _S.read(_v30, "BASE"), 3), _S.read(_v30, "bx1"), 0, 0.22, 0.7]), _S.read(_v30, "k"), _S.read(_v30, "C"), (1.15 if _S.truth(_S.binary("===", _S.read(_v30, "ba"), 0)) else 1), _S.merge([{"hero": _S.binary("===", _S.read(_v30, "ba"), 0)}])])
		_S.invoke(_S.read(_v30, "p"), "circle", [_S.read(_v30, "bx1"), _S.unary("-", 1), _S.binary("+", _S.binary("*", 3, _S.read(_v30, "k")), 1.5), _S.prop(_S.read(_v30, "C"), 2)])
		_S.invoke(_S.read(_v30, "p"), "circle", [_S.read(_v30, "bx1"), _S.unary("-", 1), _S.binary("+", _S.binary("*", 3, _S.read(_v30, "k")), 0.5), _S.prop(_S.read(_v30, "C"), 5)])
		_S.invoke(_S.read(_v30, "p"), "circle", [_S.read(_v30, "bx1"), _S.unary("-", 1), _S.binary("*", 2, _S.read(_v30, "k")), _S.read(_v30, "WHITE")])
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.read(_v30, "bx1"), _S.unary("-", 22), 78, _S.prop(_S.read(_v30, "C"), 3), _S.binary("*", 0.5, _S.read(_v30, "k"))])
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.read(_v30, "bx1"), _S.unary("-", 3), 18, _S.prop(_S.read(_v30, "C"), 5), _S.binary("*", 0.45, _S.read(_v30, "k"))])
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.read(_v30, "bx0"), _S.read(_v30, "BASE"), 84, _S.prop(_S.read(_v30, "C"), 4), _S.binary("*", 0.3, _S.read(_v30, "k"))])
	_S.define(_e, "sa", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.binary("/", _S.read(_e, "BOLT"), _S.read(_e, "FPS"))), _S.read(_e, "P")), _S.read(_e, "P")), _S.read(_e, "P")))
	var _v31 = _S.scope(_e)
	_S.define(_v31, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v31, "j"), 16)):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "q", _S.call_value(_S.read(_v32, "rng"), [_S.prop(_S.read(_v32, "o"), "seed"), 31, _S.read(_v32, "j")]))
		_S.define(_v32, "life", _S.invoke(_S.read(_v32, "q"), "range", [0.25, 0.6]))
		if _S.truth(_S.binary(">=", _S.read(_v32, "sa"), _S.read(_v32, "life"))):
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "j", 1, "+=", true)
			continue
		_S.define(_v32, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 2), _S.invoke(_S.read(_v32, "q"), "range", [_S.unary("-", 1.3), 1.3])))
		_S.define(_v32, "sp", _S.invoke(_S.read(_v32, "q"), "range", [60, 200]))
		var _v33 = _S.call_value(_S.read(_v32, "flight"), [_S.read(_v32, "bx1"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.read(_v32, "sa"), _S.merge([{"floor": 0}])])
		_S.define(_v32, "x", _S.prop(_v33, 0))
		_S.define(_v32, "y", _S.prop(_v33, 1))
		_S.define(_v32, "vx", _S.prop(_v33, 2))
		_S.define(_v32, "vy", _S.prop(_v33, 3))
		_S.call_value(_S.read(_v32, "spark"), [_S.read(_v32, "p"), _S.read(_v32, "x"), _S.read(_v32, "y"), _S.read(_v32, "vx"), _S.read(_v32, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v32, "sa"), _S.read(_v32, "life"))), _S.read(_v32, "S")])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v17 = _S.arg(_args, 0)
	_S.define(_e, "ff", _S.prop(_v17, 0))
	return _S.binary("===", _S.read(_e, "ff"), _S.read(_e, "f"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v18 = _S.arg(_args, 0)
	_S.define(_e, "b", _S.prop(_v18, 1))
	_S.define(_e, "k", _S.prop(_v18, 2))
	return [_S.read(_e, "b"), _S.read(_e, "k")]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v19 = _S.arg(_args, 0)
	_S.define(_e, "b", _S.prop(_v19, 0))
	_S.define(_e, "k", _S.prop(_v19, 1))
	return _S.merge([{"x": _S.prop(_S.prop(_S.read(_e, "B"), _S.read(_e, "b")), "x")}, {"y": _S.prop(_S.prop(_S.read(_e, "B"), _S.read(_e, "b")), "y")}, {"k": _S.read(_e, "k")}, {"r": _S.binary("*", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "B"), _S.read(_e, "b")), "r"), _S.read(_e, "VIS")), (1.6 if _S.truth(_S.binary("<", _S.prop(_S.prop(_S.read(_e, "B"), _S.read(_e, "b")), "sq"), 1)) else 2.2))}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "l", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "s"), _S.prop(_S.read(_e, "l"), "k")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.5, 0.62])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 62), 62]))
	_S.define(_e, "vy", _S.invoke(_S.read(_e, "r"), "range", [190, 240]))
	_S.define(_e, "vx", _S.binary("*", _S.unary("-", _S.read(_e, "vy")), 0.18))
	_S.define(_e, "tf", _S.binary("/", _S.binary("-", 0, _S.binary("+", _S.read(_e, "BASE"), 4)), _S.read(_e, "vy")))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "tf"))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "x", _S.binary("+", _S.read(_v20, "x0"), _S.binary("*", _S.read(_v20, "vx"), _S.read(_v20, "age"))))
		_S.define(_v20, "y", _S.binary("+", _S.binary("+", _S.read(_v20, "BASE"), 4), _S.binary("*", _S.read(_v20, "vy"), _S.read(_v20, "age"))))
		_S.define(_v20, "l", _S.invoke(_S.read(_v20, "r"), "range", [4, 6.5]))
		_S.invoke(_S.read(_v20, "p"), "line", [_S.binary("-", _S.read(_v20, "x"), _S.binary("*", _S.binary("*", _S.read(_v20, "vx"), 0.018), _S.binary("/", _S.read(_v20, "l"), 4))), _S.binary("-", _S.read(_v20, "y"), _S.read(_v20, "l")), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.function_value(_v20, "_f11")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.binary("+", _S.read(_e, "tf"), 0.12))):
			var _v21 = _S.scope(_e)
			_S.define(_v21, "x", _S.binary("+", _S.read(_v21, "x0"), _S.binary("*", _S.read(_v21, "vx"), _S.read(_v21, "tf"))))
			_S.define(_v21, "a", _S.binary("/", _S.binary("-", _S.read(_v21, "age"), _S.read(_v21, "tf")), 0.12))
			for _v22 in _S.array([_S.unary("-", 1), 1]):
				var _v23 = _S.scope(_v21)
				_S.define(_v23, "s", _v22)
				_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.read(_v23, "x"), _S.binary("*", _S.read(_v23, "s"), _S.binary("+", 1, _S.binary("*", _S.read(_v23, "a"), 2.5)))), _S.binary("-", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.binary("*", _S.read(_v23, "a"), _S.prop(_S.read(_v23, "Math"), "PI"))]), 2.5)), (_S.prop(_S.read(_v23, "RN"), 3) if _S.truth(_S.binary("<", _S.read(_v23, "a"), 0.5)) else _S.prop(_S.read(_v23, "RN"), 2))])
			if _S.truth(_S.binary("<", _S.read(_v21, "a"), 0.4)):
				_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "x"), 0, _S.prop(_S.read(_v21, "RN"), 3)])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "flash"), 0.5)) else _S.prop(_S.read(_e, "RN"), 3)) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "flash"), 0.5)) else _S.prop(_S.read(_e, "RN"), (2 if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.35)) else 1))))
