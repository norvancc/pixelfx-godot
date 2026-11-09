@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/waterfall.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f0"))
	_S.define(_e, "rockMap", _S.function_value(_e, "_f3"))
	_S.define(_e, "outcrop", _S.function_value(_e, "_f5"))
	_S.define(_e, "river", _S.function_value(_e, "_f8"))
	_S.define(_e, "curl", _S.function_value(_e, "_f10"))
	_S.define(_e, "pool", _S.function_value(_e, "_f12"))
	_S.define(_e, "foam", _S.function_value(_e, "_f14"))
	_S.define(_e, "mist", _S.function_value(_e, "_f18"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f22"))
	_S.define(_e, "draw", _S.function_value(_e, "_f23"))
	_S.define(_e, "meta", _S.merge([{"name": "Waterfall"}, {"desc": "A river pours from a notch in a rock outcrop: a white curl, a deep sheet that splits into strands, churning foam, spray, drifting mist and rings on a dark pool."}, {"tags": ["water", "waterfall", "cascade", "foam", "mist", "ambient", "loop"]}, {"size": [144, 136]}, {"origin": [72, 118]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 92}, {"width": 13}, {"ledge": true}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.2)
	_S.define(_e, "G", 760)
	_S.define(_e, "POOL", [56, 11])
	_S.define(_e, "halfW", _S.function_value(_e, "_f28"))
	_S.define(_e, "ROCKS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.binary("+", _S.unary("-", _S.read(_v0, "H")), 2))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.unary("-", 1))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "d", _S.binary("+", _S.binary("+", _S.read(_v1, "y"), 0.5), _S.read(_v1, "H")))
		_S.define(_v1, "v", _S.binary("/", _S.read(_v1, "d"), _S.read(_v1, "H")))
		_S.define(_v1, "s", _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.binary("+", _S.read(_v1, "d"), 3)]))
		_S.define(_v1, "hw0", _S.call_value(_S.read(_v1, "halfW"), [_S.read(_v1, "W"), _S.read(_v1, "d"), _S.read(_v1, "H")]))
		_S.define(_v1, "split", _S.call_value(_S.read(_v1, "smooth"), [0.56, 0.95, _S.read(_v1, "v")]))
		_S.define(_v1, "glass", _S.binary("-", 1, _S.call_value(_S.read(_v1, "smooth"), [4, 24, _S.read(_v1, "d")])))
		_S.define(_v1, "wl", _S.binary("*", _S.call_value(_S.read(_v1, "tileNoise"), [2, _S.binary("-", _S.binary("*", _S.read(_v1, "s"), 1.4), _S.binary("*", _S.read(_v1, "ph"), 12)), 0, 12, _S.binary("+", _S.read(_v1, "S"), 2)]), _S.binary("+", 0.4, _S.binary("*", 1.8, _S.read(_v1, "v")))))
		_S.define(_v1, "wr", _S.binary("*", _S.call_value(_S.read(_v1, "tileNoise"), [11, _S.binary("-", _S.binary("*", _S.read(_v1, "s"), 1.4), _S.binary("*", _S.read(_v1, "ph"), 12)), 0, 12, _S.binary("+", _S.read(_v1, "S"), 2)]), _S.binary("+", 0.4, _S.binary("*", 1.8, _S.read(_v1, "v")))))
		_S.define(_v1, "fan", (_S.binary("*", _S.call_value(_S.read(_v1, "tileNoise"), [3, _S.binary("-", _S.binary("*", _S.read(_v1, "s"), 0.8), _S.binary("*", _S.read(_v1, "ph"), 4)), 0, 4, _S.binary("+", _S.read(_v1, "S"), 61)]), 1.6) if _S.truth(_S.binary(">", _S.read(_v1, "split"), 0)) else 0))
		_S.define(_v1, "sd", _S.binary("-", _S.binary("*", _S.read(_v1, "s"), 1.5), _S.binary("*", _S.read(_v1, "ph"), 20)))
		_S.define(_v1, "sb", _S.binary("-", _S.binary("*", _S.read(_v1, "s"), 0.45), _S.binary("*", _S.read(_v1, "ph"), 6)))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "X", _S.binary("-", _S.unary("-", _S.read(_v2, "W")), 8))
		while _S.truth(_S.binary("<=", _S.read(_v2, "X"), _S.binary("+", _S.read(_v2, "W"), 8))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "x", _S.binary("+", _S.read(_v3, "X"), 0.5))
			_S.define(_v3, "hw", _S.binary("+", _S.read(_v3, "hw0"), (_S.read(_v3, "wl") if _S.truth(_S.binary("<", _S.read(_v3, "x"), 0)) else _S.read(_v3, "wr"))))
			_S.define(_v3, "ax", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]))
			if _S.truth(_S.binary(">", _S.read(_v3, "ax"), _S.read(_v3, "hw"))):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "X", 1, "+=", true)
				continue
			_S.define(_v3, "e", _S.binary("/", _S.read(_v3, "ax"), _S.read(_v3, "hw")))
			_S.define(_v3, "edge", false)
			if _S.truth(_S.binary(">", _S.read(_v3, "split"), 0)):
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "f", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("/", _S.read(_v4, "x"), _S.binary("+", 1, _S.binary("*", 0.22, _S.read(_v4, "split")))), _S.read(_v4, "fan")), 64), 5.4), 1), 1), 1))
				if _S.truth(_S.binary(">", _S.read(_v4, "f"), _S.binary("-", 1, _S.binary("*", 0.46, _S.read(_v4, "split"))))):
					_v2 = _S.iteration(_v2)
					_S.write(_v2, "X", 1, "+=", true)
					continue
				_S.write(_v4, "edge", _S.binary("<", _S.read(_v4, "f"), 0.2), "=", false)
			_S.define(_v3, "dash", _S.call_value(_S.read(_v3, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_v3, "X"), 1.618), 0.31), _S.read(_v3, "sd"), 0, 20, _S.read(_v3, "S")]))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "X"), _S.binary("+", _S.read(_v3, "S"), 60)]), 0.48), func(): return _S.binary("<", _S.read(_v3, "e"), 0.86)), func(): return _S.unary("!", _S.read(_v3, "edge")))):
				var _v5 = _S.scope(_v3)
				_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.binary("+", _S.read(_v5, "y"), 0.5), (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v5, "dash"), 0.45)) else (_S.prop(_S.read(_v5, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v5, "glass"), 0.5)) else _S.prop(_S.read(_v5, "C"), 2))), (0.7 if _S.truth(_S.binary(">", _S.read(_v5, "dash"), 0.45)) else _S.binary("+", 0.42, _S.binary("*", 0.15, _S.read(_v5, "v"))))])
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "X", 1, "+=", true)
				continue
			_S.define(_v3, "broad", _S.call_value(_S.read(_v3, "tileNoise"), [_S.binary("*", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_v3, "x"), 40), 3)]), 2.7), _S.read(_v3, "sb"), 0, 6, _S.binary("+", _S.read(_v3, "S"), 1)]))
			_S.define(_v3, "b", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", _S.unary("-", 0.34), _S.binary("*", 0.46, _S.read(_v3, "v"))), _S.binary("*", 0.3, _S.read(_v3, "broad"))), _S.binary("*", _S.read(_v3, "glass"), 0.5)), _S.binary("*", _S.binary("*", 0.35, _S.call_value(_S.read(_v3, "smooth"), [0.7, 1, _S.read(_v3, "e")])), (1 if _S.truth(_S.binary("<", _S.read(_v3, "x"), 0)) else 0.3))), (_S.binary("*", 0.12, _S.read(_v3, "e")) if _S.truth(_S.binary(">", _S.read(_v3, "x"), 0)) else 0)), (0.3 if _S.truth(_S.read(_v3, "edge")) else 0)))
			if _S.truth(_S.binary(">", _S.read(_v3, "dash"), _S.binary("-", 0.2, _S.binary("*", 0.22, _S.read(_v3, "v"))))):
				_S.write(_v3, "b", _S.binary("+", 0.36, _S.binary("*", 0.7, _S.binary("-", _S.read(_v3, "dash"), 0.2))), "+=", false)
			if _S.truth(_S.binary(">", _S.read(_v3, "b"), _S.unary("-", 0.2))):
				_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "X"), _S.read(_v3, "y"), (_S.read(_v3, "WHITE") if _S.truth(_S.binary(">", _S.read(_v3, "b"), 0.62)) else (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v3, "b"), 0.34)) else (_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v3, "b"), 0.08)) else _S.prop(_S.read(_v3, "C"), 4))))])
			else:
				_S.invoke(_S.read(_v3, "p"), "blend", [_S.read(_v3, "x"), _S.binary("+", _S.read(_v3, "y"), 0.5), _S.prop(_S.read(_v3, "C"), 3), 0.8])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "X", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")), _S.read(_e, "D"), 16, _S.binary("+", _S.read(_e, "S"), 30), 0.4, _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "r"), "range", [14, _S.binary("*", _S.read(_e, "H"), 0.7)]))
	_S.define(_e, "d", _S.binary("+", _S.binary("+", _S.read(_e, "d0"), _S.binary("*", 50, _S.read(_e, "age"))), _S.binary("*", _S.binary("*", 260, _S.read(_e, "age")), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "H"), 6))):
		return null
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "side"), _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "W"), _S.read(_e, "d"), _S.read(_e, "H")]), 1.5), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [6, 16])))))
	_S.define(_e, "y", _S.binary("+", _S.unary("-", _S.read(_e, "H")), _S.read(_e, "d")))
	_S.define(_e, "len", _S.binary("+", 2, _S.binary("*", 6, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "len")), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f2"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.5))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 4))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "lumps", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	_S.define(_e, "hgt", _S.arg(_args, 4))
	_S.define(_e, "Lx", _S.arg(_args, 5))
	_S.define(_e, "Ly", _S.arg(_args, 6))
	_S.define(_e, "Lz", _S.arg(_args, 7))
	_S.define(_e, "S", _S.arg(_args, 8))
	_S.define(_e, "id", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "hgt"))]), "fill", [_S.unary("-", 1)]))
	_S.define(_e, "lit", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "hgt"))]))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "j"), _S.read(_v6, "hgt"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), _S.read(_v7, "w"))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "x", _S.binary("+", _S.binary("+", _S.read(_v8, "x0"), _S.read(_v8, "i")), 0.5))
			_S.define(_v8, "y", _S.binary("+", _S.binary("+", _S.read(_v8, "y0"), _S.read(_v8, "j")), 0.5))
			_S.define(_v8, "best", _S.unary("-", 1))
			_S.define(_v8, "z", _S.unary("-", 1000000000))
			_S.define(_v8, "l", 0)
			_S.invoke(_S.read(_v8, "lumps"), "forEach", [_S.function_value(_v8, "_f4")])
			_S.set_prop(_S.read(_v8, "id"), _S.binary("+", _S.binary("*", _S.read(_v8, "j"), _S.read(_v8, "w")), _S.read(_v8, "i")), _S.read(_v8, "best"), "=", false)
			_S.set_prop(_S.read(_v8, "lit"), _S.binary("+", _S.binary("*", _S.read(_v8, "j"), _S.read(_v8, "w")), _S.read(_v8, "i")), _S.binary("+", _S.read(_v8, "l"), _S.binary("*", 0.2, _S.call_value(_S.read(_v8, "tileNoise"), [_S.binary("*", _S.read(_v8, "x"), 0.32), _S.binary("*", _S.read(_v8, "y"), 0.32), 0, 0, _S.binary("+", _S.read(_v8, "S"), 70)]))), "=", false)
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "j", 1, "+=", true)
	return _S.merge([{"id": _S.read(_e, "id")}, {"lit": _S.read(_e, "lit")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "cx", _S.prop(_v9, 0))
	_S.define(_e, "cy", _S.prop(_v9, 1))
	_S.define(_e, "rx", _S.prop(_v9, 2))
	_S.define(_e, "ry", _S.prop(_v9, 3))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "rx")))
	_S.define(_e, "ny", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ry")))
	_S.define(_e, "r2", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "nx")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "ny"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "r2"), 1)):
		return null
	_S.define(_e, "nz", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_e, "r2"))]))
	_S.define(_e, "depth", _S.binary("+", _S.binary("*", _S.read(_e, "nz"), _S.read(_e, "ry")), (_S.unary("-", 6) if _S.truth(_S.binary("===", _S.read(_e, "k"), 5)) else (_S.unary("-", 3) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else (_S.unary("-", 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 2)) else 0)))))
	if _S.truth(_S.binary(">", _S.read(_e, "depth"), _S.read(_e, "z"))):
		_S.last([_S.write(_e, "z", _S.read(_e, "depth"), "=", false), _S.write(_e, "best", _S.read(_e, "k"), "=", false), _S.write(_e, "l", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "Lx")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "Ly"))), _S.binary("*", _S.read(_e, "nz"), _S.read(_e, "Lz"))), "=", false)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", _S.unary("-", 0.72))
	_S.define(_e, "Lz", 0.42)
	_S.define(_e, "lumps", [[_S.binary("-", _S.unary("-", _S.read(_e, "W")), 11), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 4), 13, 10], [_S.binary("+", _S.read(_e, "W"), 8), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), 9, 7.5], [0, _S.binary("+", _S.unary("-", _S.read(_e, "H")), 3.5), _S.binary("+", _S.read(_e, "W"), 3), 4.2], [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 21), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 4), 7, 5.5], [_S.binary("+", _S.read(_e, "W"), 15), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 4.5), 5, 4], [_S.unary("-", 2), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 5), _S.binary("+", _S.read(_e, "W"), 7), 6.5]])
	_S.define(_e, "x0", _S.binary("-", _S.unary("-", _S.read(_e, "W")), 29))
	_S.define(_e, "x1", _S.binary("+", _S.read(_e, "W"), 21))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", _S.read(_e, "H")), 15))
	_S.define(_e, "y1", _S.binary("+", _S.unary("-", _S.read(_e, "H")), 10))
	_S.define(_e, "w", _S.binary("+", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), 1))
	_S.define(_e, "hgt", _S.binary("+", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), 1))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "W")) + "|" + _S.string(_S.read(_e, "H")) + "|" + _S.string(_S.read(_e, "S")) + ""))
	_S.define(_e, "map", _S.invoke(_S.read(_e, "ROCKS"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "map"))):
		_S.invoke(_S.read(_e, "ROCKS"), "set", [_S.read(_e, "key"), _S.write(_e, "map", _S.call_value(_S.read(_e, "rockMap"), [_S.read(_e, "lumps"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "w"), _S.read(_e, "hgt"), _S.read(_e, "Lx"), _S.read(_e, "Ly"), _S.read(_e, "Lz"), _S.read(_e, "S")]), "=", false)])
	var _v10 = _S.read(_e, "map")
	_S.define(_e, "id", _S.prop(_v10, "id"))
	_S.define(_e, "lit", _S.prop(_v10, "lit"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 26), _S.unary("-", _S.read(_e, "H")), _S.binary("+", _S.read(_e, "W"), 18), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 20), _S.function_value(_e, "_f6")])
	_S.define(_e, "at", _S.function_value(_e, "_f7"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "j"), _S.read(_v11, "hgt"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "w"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "k", _S.prop(_S.read(_v13, "id"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "w")), _S.read(_v13, "i"))))
			_S.define(_v13, "x", _S.binary("+", _S.read(_v13, "x0"), _S.read(_v13, "i")))
			_S.define(_v13, "y", _S.binary("+", _S.read(_v13, "y0"), _S.read(_v13, "j")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v13, "k"), 2), func(): return _S.binary("===", _S.read(_v13, "k"), 5)), func(): return _S.binary("<", _S.read(_v13, "k"), 0)), func(): return _S.binary(">=", _S.read(_v13, "y"), _S.binary("-", _S.unary("-", _S.read(_v13, "H")), 5))), func(): return _S.binary("<", _S.read(_v13, "y"), _S.binary("+", _S.unary("-", _S.read(_v13, "H")), 1))), func(): return _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("+", _S.read(_v13, "x"), 0.5)]), _S.binary("+", _S.read(_v13, "W"), 1.5)))):
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			if _S.truth(_S.binary("<", _S.read(_v13, "k"), 0)):
				var _v14 = _S.scope(_v13)
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.binary("-", _S.read(_v14, "i"), 1), _S.read(_v14, "j")]), 0), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.binary("+", _S.read(_v14, "i"), 1), _S.read(_v14, "j")]), 0)), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.read(_v14, "i"), _S.binary("-", _S.read(_v14, "j"), 1)]), 0)), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.read(_v14, "i"), _S.binary("+", _S.read(_v14, "j"), 1)]), 0))):
					_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "ST"), 0)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "r", _S.call_value(_S.read(_v13, "at"), [_S.binary("+", _S.read(_v13, "i"), 1), _S.read(_v13, "j")]))
			_S.define(_v13, "b", _S.call_value(_S.read(_v13, "at"), [_S.read(_v13, "i"), _S.binary("+", _S.read(_v13, "j"), 1)]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v13, "r"), 0), func(): return _S.binary("!==", _S.read(_v13, "r"), _S.read(_v13, "k"))), func(): return _S.binary("<", _S.read(_v13, "r"), _S.read(_v13, "k"))), func(): return _S.logical("&&", _S.binary(">=", _S.read(_v13, "b"), 0), func(): return _S.binary("!==", _S.read(_v13, "b"), _S.read(_v13, "k"))))):
				var _v15 = _S.scope(_v13)
				_S.invoke(_S.read(_v15, "p"), "px", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.prop(_S.read(_v15, "ST"), 1)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "l", _S.prop(_S.read(_v13, "lit"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "w")), _S.read(_v13, "i"))))
			_S.define(_v13, "wet", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("+", _S.read(_v13, "x"), 0.5)]), _S.binary("+", _S.read(_v13, "W"), 6)), func(): return _S.binary(">", _S.read(_v13, "y"), _S.binary("-", _S.unary("-", _S.read(_v13, "H")), 9))))
			_S.define(_v13, "c", (_S.prop(_S.read(_v13, "ST"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.9)) else (_S.prop(_S.read(_v13, "ST"), 4) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.64)) else (_S.prop(_S.read(_v13, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.3)) else (_S.prop(_S.read(_v13, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "l"), _S.unary("-", 0.05))) else _S.prop(_S.read(_v13, "ST"), 1))))))
			if _S.truth(_S.binary("===", _S.read(_v13, "k"), 5)):
				_S.write(_v13, "c", (_S.prop(_S.read(_v13, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.7)) else (_S.prop(_S.read(_v13, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.2)) else _S.prop(_S.read(_v13, "ST"), 1))), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v13, "at"), [_S.read(_v13, "i"), _S.binary("-", _S.read(_v13, "j"), 1)]), 0), func(): return _S.binary(">", _S.read(_v13, "l"), 0.25))):
				_S.write(_v13, "c", _S.prop(_S.read(_v13, "ST"), 5), "=", false)
			if _S.truth(_S.read(_v13, "wet")):
				var _v16 = _S.scope(_v13)
				_S.write(_v16, "c", (_S.prop(_S.read(_v16, "ST"), 4) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.9)) else (_S.prop(_S.read(_v16, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.64)) else (_S.prop(_S.read(_v16, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.3)) else _S.prop(_S.read(_v16, "ST"), 1)))), "=", false)
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "l"), 0.3), func(): return _S.binary(">", _S.call_value(_S.read(_v16, "tileNoise"), [_S.binary("*", _S.read(_v16, "x"), 0.9), _S.binary("-", _S.binary("*", _S.read(_v16, "y"), 0.6), _S.binary("*", _S.read(_v16, "ph"), 8)), 0, 8, _S.binary("+", _S.read(_v16, "S"), 71)]), 0.42))):
					_S.write(_v16, "c", (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.6)) else _S.prop(_S.read(_v16, "C"), 4)), "=", false)
			_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "j", 1, "+=", true)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "q", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "q"), 3)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "L", _S.prop(_S.read(_v18, "lumps"), _S.binary("%", _S.read(_v18, "q"), 2)))
		_S.define(_v18, "cx", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v18, "L"), 0), _S.binary("*", (_S.unary("-", 0.5) if _S.truth(_S.binary("===", _S.read(_v18, "q"), 2)) else 0.15), _S.prop(_S.read(_v18, "L"), 2)))]))
		_S.define(_v18, "cy", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v18, "L"), 1), _S.binary("*", _S.prop(_S.read(_v18, "L"), 3), (0.1 if _S.truth(_S.binary("===", _S.read(_v18, "q"), 2)) else _S.unary("-", 0.25))))]))
		_S.define(_v18, "len", _S.binary("+", 3, _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "q"), _S.binary("+", _S.read(_v18, "S"), 74)]), 4)])))
		_S.define(_v18, "dx", (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "q"), _S.binary("+", _S.read(_v18, "S"), 75)]), 0.5)) else _S.unary("-", 1)))
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "n", 0)
		while _S.truth(_S.binary("<=", _S.read(_v19, "n"), _S.read(_v19, "len"))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "x", _S.binary("+", _S.read(_v20, "cx"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "round", [_S.binary("*", _S.read(_v20, "n"), 0.6)]), _S.read(_v20, "dx"))))
			_S.define(_v20, "y", _S.binary("+", _S.read(_v20, "cy"), _S.read(_v20, "n")))
			_S.define(_v20, "i", _S.binary("-", _S.read(_v20, "x"), _S.read(_v20, "x0")))
			_S.define(_v20, "j", _S.binary("-", _S.read(_v20, "y"), _S.read(_v20, "y0")))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.read(_v20, "j")]), 0), func(): return _S.binary(">", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.read(_v20, "j")]), 1)), func(): return _S.binary("<", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.binary("+", _S.read(_v20, "j"), 1)]), 0))):
				break
			_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.prop(_S.read(_v20, "ST"), 1) if _S.truth(_S.binary("===", _S.read(_v20, "n"), _S.read(_v20, "len"))) else _S.prop(_S.read(_v20, "ST"), 0))])
			if _S.truth(_S.binary("===", _S.read(_v20, "n"), 0)):
				_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("-", _S.read(_v20, "x"), _S.read(_v20, "dx")), _S.binary("-", _S.read(_v20, "y"), 1), _S.prop(_S.read(_v20, "ST"), 4)])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "n", 1, "+=", true)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "q", 1, "+=", true)
	for _v21 in _S.array([_S.binary("-", _S.unary("-", _S.read(_e, "W")), 3), _S.binary("+", _S.read(_e, "W"), 3)]):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "sx", _v21)
		var _v23 = _S.scope(_v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "y", _S.binary("-", _S.unary("-", _S.read(_v24, "H")), 2))
		while _S.truth(_S.binary("<", _S.read(_v24, "y"), _S.binary("+", _S.unary("-", _S.read(_v24, "H")), 7))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "g", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_v25, "y"), 0.35), _S.binary("*", _S.read(_v25, "ph"), 6)), 1), 1), 1))
			_S.define(_v25, "i", _S.binary("-", _S.invoke(_S.read(_v25, "Math"), "floor", [_S.read(_v25, "sx")]), _S.read(_v25, "x0")))
			_S.define(_v25, "j", _S.binary("-", _S.invoke(_S.read(_v25, "Math"), "floor", [_S.read(_v25, "y")]), _S.read(_v25, "y0")))
			if _S.truth(_S.binary(">=", _S.call_value(_S.read(_v25, "at"), [_S.read(_v25, "i"), _S.read(_v25, "j")]), 0)):
				_S.invoke(_S.read(_v25, "p"), "px", [_S.read(_v25, "sx"), _S.read(_v25, "y"), (_S.prop(_S.read(_v25, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v25, "g"), 0.3)) else _S.prop(_S.read(_v25, "C"), 3))])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "y", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "k", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_e, "x"), 4), _S.binary("+", _S.read(_e, "W"), 22)), _S.binary("/", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "H")), 20)])))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "ST"), 0), _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 3)]))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return (_S.unary("-", 1) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "j"), 0)), func(): return _S.binary(">=", _S.read(_e, "i"), _S.read(_e, "w"))), func(): return _S.binary(">=", _S.read(_e, "j"), _S.read(_e, "hgt")))) else _S.prop(_S.read(_e, "id"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.read(_e, "w")), _S.read(_e, "i"))))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	_S.define(_e, "top", _S.binary("-", _S.unary("-", _S.read(_e, "H")), 6))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 3), _S.read(_e, "top"), _S.binary("+", _S.read(_e, "W"), 3), _S.unary("-", _S.read(_e, "H")), _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "back", _S.binary("+", _S.binary("+", _S.read(_e, "top"), 1.5), _S.binary("*", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.3), 4, 0, 0, _S.binary("+", _S.read(_e, "S"), 62)]), 1.5)))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "back")), _S.binary("-", _S.unary("-", _S.read(_e, "H")), _S.read(_e, "back"))))
	_S.define(_e, "hw", _S.binary("-", _S.binary("+", _S.read(_e, "W"), 2), _S.binary("*", _S.binary("-", 1, _S.read(_e, "v")), 3)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "y"), _S.read(_e, "back")), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "hw")))):
		return null
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.32), _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), 0.7), _S.binary("*", _S.read(_e, "ph"), 8)), 0, 8, _S.binary("+", _S.read(_e, "S"), 3)]))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "n"), 0.66)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "n"), 0.4)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 4)))), "=", false)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "x", _S.unary("-", _S.read(_v26, "W")))
	while _S.truth(_S.binary("<=", _S.read(_v26, "x"), _S.read(_v26, "W"))):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "g", _S.call_value(_S.read(_v27, "tileNoise"), [_S.binary("*", _S.read(_v27, "x"), 0.45), _S.binary("*", _S.read(_v27, "ph"), 4), 0, 4, _S.binary("+", _S.read(_v27, "S"), 4)]))
		_S.invoke(_S.read(_v27, "p"), "px", [_S.read(_v27, "x"), _S.binary("-", _S.unary("-", _S.read(_v27, "H")), 1), _S.prop(_S.read(_v27, "C"), 4)])
		_S.invoke(_S.read(_v27, "p"), "px", [_S.read(_v27, "x"), _S.unary("-", _S.read(_v27, "H")), _S.read(_v27, "WHITE")])
		_S.invoke(_S.read(_v27, "p"), "px", [_S.read(_v27, "x"), _S.binary("+", _S.unary("-", _S.read(_v27, "H")), 1), (_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v27, "g"), 0.2)) else _S.prop(_S.read(_v27, "C"), 5))])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", _S.read(_e, "W")), _S.unary("-", _S.read(_e, "H")), _S.read(_e, "W"), _S.unary("-", _S.read(_e, "H")), 6, _S.prop(_S.read(_e, "C"), 6), 0.18])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", _S.read(_e, "H")), 34, _S.prop(_S.read(_e, "C"), 5), 0.2])
	_S.call_value(_S.read(_e, "cycle"), [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")), _S.read(_e, "D"), 4, _S.binary("+", _S.read(_e, "S"), 5), 0.36, _S.function_value(_e, "_f11")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "life"))]))
	_S.define(_e, "x", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "W")), _S.read(_e, "W")]))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)):
		for _v28 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v29 = _S.scope(_e)
			var _v30 = _v28
			_S.define(_v29, "dx", _S.prop(_v30, 0))
			_S.define(_v29, "dy", _S.prop(_v30, 1))
			_S.invoke(_S.read(_v29, "p"), "px", [_S.binary("+", _S.read(_v29, "x"), _S.read(_v29, "dx")), _S.binary("+", _S.unary("-", _S.read(_v29, "H")), _S.read(_v29, "dy")), _S.prop(_S.read(_v29, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.unary("-", _S.read(_e, "H")), 6, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "W", _S.arg(_args, 3))
	_S.define(_e, "S", _S.arg(_args, 4))
	var _v31 = _S.read(_e, "POOL")
	_S.define(_e, "RX", _S.prop(_v31, 0))
	_S.define(_e, "RY", _S.prop(_v31, 1))
	_S.define(_e, "cy", 2)
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	_S.define(_e, "cols", [])
	var _v32 = _S.scope(_e)
	_S.define(_v32, "X", _S.unary("-", _S.read(_v32, "RX")))
	while _S.truth(_S.binary("<", _S.read(_v32, "X"), _S.read(_v32, "RX"))):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "x", _S.binary("+", _S.read(_v33, "X"), 0.5))
		_S.invoke(_S.read(_v33, "cols"), "push", [[_S.invoke(_S.read(_v33, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v33, "x"), 0.11), _S.binary("*", _S.read(_v33, "T"), 2))]), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.binary("+", _S.read(_v33, "T"), _S.binary("*", _S.read(_v33, "x"), 0.05))]), 1.4), _S.binary("*", _S.read(_v33, "x"), 0.13))]])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "X", 1, "+=", true)
	var _v34 = _S.scope(_e)
	_S.define(_v34, "Y", _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("-", _S.read(_v34, "cy"), _S.read(_v34, "RY"))]))
	while _S.truth(_S.binary("<", _S.read(_v34, "Y"), _S.binary("+", _S.read(_v34, "cy"), _S.read(_v34, "RY")))):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "y", _S.binary("+", _S.read(_v35, "Y"), 0.5))
		_S.define(_v35, "dy", _S.binary("/", _S.binary("-", _S.read(_v35, "y"), _S.read(_v35, "cy")), _S.read(_v35, "RY")))
		_S.define(_v35, "sy", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v35, "y"), 0.5), _S.read(_v35, "T"))]))
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "X", _S.unary("-", _S.read(_v36, "RX")))
		while _S.truth(_S.binary("<", _S.read(_v36, "X"), _S.read(_v36, "RX"))):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "x", _S.binary("+", _S.read(_v37, "X"), 0.5))
			_S.define(_v37, "dx", _S.binary("/", _S.read(_v37, "x"), _S.read(_v37, "RX")))
			_S.define(_v37, "d", _S.binary("+", _S.binary("*", _S.read(_v37, "dx"), _S.read(_v37, "dx")), _S.binary("*", _S.read(_v37, "dy"), _S.read(_v37, "dy"))))
			if _S.truth(_S.binary(">", _S.read(_v37, "d"), 1)):
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "X", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v37, "p"), "blend", [_S.read(_v37, "x"), _S.read(_v37, "y"), (_S.prop(_S.read(_v37, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v37, "d"), 0.12)) else _S.prop(_S.read(_v37, "C"), 1)), _S.binary("*", 0.62, _S.invoke(_S.read(_v37, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v37, "d")), 4)]))])
			var _v38 = _S.prop(_S.read(_v37, "cols"), _S.binary("+", _S.read(_v37, "X"), _S.read(_v37, "RX")))
			_S.define(_v37, "cx1", _S.prop(_v38, 0))
			_S.define(_v37, "cx2", _S.prop(_v38, 1))
			_S.define(_v37, "u", _S.binary("+", _S.binary("*", _S.read(_v37, "x"), 0.2), _S.binary("*", 1.8, _S.read(_v37, "sy"))))
			_S.define(_v37, "w", _S.binary("+", _S.binary("*", _S.read(_v37, "y"), 0.55), _S.binary("*", 1.8, _S.read(_v37, "cx1"))))
			_S.define(_v37, "f", _S.binary("*", _S.binary("+", _S.invoke(_S.read(_v37, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "abs", [_S.binary("+", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "u")]), _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "w")]))]), 2.6))]), _S.binary("*", 0.6, _S.invoke(_S.read(_v37, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "abs", [_S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("+", _S.read(_v37, "cx2"), _S.binary("*", _S.read(_v37, "y"), 0.3))])]), 3))]))), _S.binary("-", 1, _S.read(_v37, "d"))))
			if _S.truth(_S.binary(">", _S.read(_v37, "f"), 0.5)):
				_S.invoke(_S.read(_v37, "p"), "light", [_S.read(_v37, "x"), _S.read(_v37, "y"), _S.prop(_S.read(_v37, "C"), 5), _S.binary("*", 0.18, _S.read(_v37, "f"))])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "X", 1, "+=", true)
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "Y", 1, "+=", true)
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), 7)):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "a", _S.binary("*", _S.prop(_S.read(_v40, "Math"), "PI"), _S.binary("+", 1.12, _S.binary("*", 0.76, _S.binary("/", _S.binary("+", _S.read(_v40, "i"), 0.5), 7)))))
		_S.define(_v40, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a")]), _S.read(_v40, "RX")), 0.96))
		_S.define(_v40, "y", _S.binary("+", _S.read(_v40, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a")]), _S.read(_v40, "RY")), 0.96)))
		_S.define(_v40, "g", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v40, "ph"), _S.read(_v40, "TAU")), 2), _S.binary("*", _S.read(_v40, "i"), 2.4))]))
		if _S.truth(_S.binary(">", _S.read(_v40, "g"), 0.2)):
			_S.invoke(_S.read(_v40, "p"), "px", [_S.read(_v40, "x"), _S.read(_v40, "y"), (_S.prop(_S.read(_v40, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v40, "g"), 0.8)) else _S.prop(_S.read(_v40, "C"), 4))])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 3), 3, _S.binary("+", _S.read(_e, "W"), 3), 10, _S.function_value(_e, "_f13")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.9), _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "y"), 3), 0.35), _S.binary("*", _S.read(_e, "ph"), 6)), 0, 6, _S.binary("+", _S.read(_e, "S"), 6)]))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "y"), 3), 7)))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.binary("+", _S.read(_e, "W"), 2), _S.binary("*", _S.binary("-", _S.read(_e, "y"), 3), 0.4))), func(): return _S.binary("<", _S.read(_e, "n"), _S.binary("+", 0.25, _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 0.4))))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "n"), 0.6), func(): return _S.binary(">", _S.read(_e, "k"), 0.6))) else _S.prop(_S.read(_e, "C"), 5)), "=", false)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	_S.define(_e, "R", _S.binary("+", _S.read(_e, "W"), 10))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "R")), _S.unary("-", 13), _S.read(_e, "R"), 3, _S.function_value(_e, "_f15")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 10), 0.7, _S.function_value(_e, "_f16")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.read(_e, "S"), 11), 1, _S.function_value(_e, "_f17")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "ax", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]))
	_S.define(_e, "lump", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.22), _S.binary("*", _S.read(_e, "ph"), 6), 0, 6, _S.binary("+", _S.read(_e, "S"), 7)]), 3), _S.binary("*", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.55), 9), _S.binary("*", _S.read(_e, "ph"), 12), 0, 12, _S.binary("+", _S.read(_e, "S"), 8)]), 1.5)))
	_S.define(_e, "top", _S.binary("+", _S.binary("+", _S.unary("-", 8), _S.read(_e, "lump")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "ax"), _S.read(_e, "R")), 2]), 7)))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "ax"), _S.binary("-", _S.read(_e, "R"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.unary("-", _S.read(_e, "y")), 1)]), 0.6))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "top")))):
		return null
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.5), _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), 0.5), _S.binary("*", _S.read(_e, "ph"), 10)), 0, 10, _S.binary("+", _S.read(_e, "S"), 9)]))
	_S.define(_e, "boil", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.42), 3), _S.binary("-", _S.binary("*", _S.read(_e, "y"), 0.42), _S.binary("*", _S.read(_e, "ph"), 8)), 0, 8, _S.binary("+", _S.read(_e, "S"), 12)]))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), 1)):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "n"), 0)) else _S.prop(_S.read(_e, "C"), 4)), "=", false)
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "u"), 1.2)):
			_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "WHITE"), "=", false)
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "boil"), _S.unary("-", 0.3))):
				_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "u"), 4)) else _S.prop(_S.read(_e, "C"), 5)), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.read(_e, "boil"), _S.unary("-", 0.05))):
					_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 6), "=", false)
				else:
					_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "n"), _S.unary("-", 0.2))) else _S.prop(_S.read(_e, "C"), 6)), "=", false)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "x0", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "W")), _S.read(_e, "W")]), 0.9))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "r"), "range", [2, 8]))
	_S.define(_e, "up", _S.invoke(_S.read(_e, "r"), "range", [2, 8]))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), _S.read(_e, "sp"))))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [2, 5])), _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]), _S.read(_e, "up"))))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1.4, 3]), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "k"))]), 0.7])))
	if _S.truth(_S.binary(">", _S.read(_e, "rad"), 0.6)):
		_S.call_value(_S.read(_e, "billow"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.read(_e, "C")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "x0", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [2, _S.binary("+", _S.read(_e, "W"), 4)])))
	_S.define(_e, "vx", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [12, 60])))
	_S.define(_e, "vy", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [70, 150])))
	_S.define(_e, "z", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 9]))
	_S.define(_e, "s", (2 if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.3)) else 1))
	_S.define(_e, "land", _S.binary("*", _S.read(_e, "z"), _S.read(_e, "SY")))
	_S.define(_e, "tl", _S.binary("/", _S.binary("+", _S.unary("-", _S.read(_e, "vy")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "vy")), _S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.binary("+", _S.read(_e, "land"), 5)))])), _S.read(_e, "G")))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "tl"))):
		_S.call_value(_S.read(_e, "bead"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "age"))), _S.binary("+", _S.binary("+", _S.unary("-", 5), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "G")), _S.read(_e, "age")), _S.read(_e, "age"))), _S.read(_e, "vx"), _S.binary("+", _S.read(_e, "vy"), _S.binary("*", _S.read(_e, "G"), _S.read(_e, "age"))), _S.read(_e, "s"), _S.read(_e, "C")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.binary("+", _S.read(_e, "tl"), 0.35))):
			_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "tl"))), _S.read(_e, "land"), _S.binary("+", 1, _S.binary("*", _S.binary("-", _S.read(_e, "age"), _S.read(_e, "tl")), 12)), _S.read(_e, "SY"), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.read(_e, "tl")), 0.35)), _S.read(_e, "C"), _S.merge([{"n": 1}])])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "n", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.read(_e, "n"), _S.binary("+", _S.read(_e, "S"), _S.read(_e, "seed")), _S.function_value(_e, "_f19"), _S.function_value(_e, "_f20")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.8, 2.8])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "drift", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "side"), _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [3, 12]), _S.binary("*", _S.read(_e, "drift"), _S.invoke(_S.read(_e, "r"), "range", [24, 48])))))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [2, 7])), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [3, 12]))))
	_S.define(_e, "rad", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [4, 6]), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [5, 9]))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.2, 0.3]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "k"), 0.12)])), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "k")), 1.7])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.prop(_S.read(_e, "C"), 6), _S.function_value(_e, "_f21")])
	if _S.truth(_S.binary(">", _S.read(_e, "a"), 0.05)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 1.2), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "a"))])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "W"), _S.prop(_S.read(_e, "o"), "seed")])
	var _v41 = _S.scope(_e)
	_S.define(_v41, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v41, "i"), 3)):
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "f", _S.binary("%", _S.binary("+", _S.read(_v42, "ph"), _S.binary("/", _S.read(_v42, "i"), 3)), 1))
		_S.call_value(_S.read(_v42, "ring"), [_S.read(_v42, "p"), 0, 1, _S.binary("+", _S.binary("+", _S.read(_v42, "W"), 6), _S.binary("*", _S.read(_v42, "f"), 38)), _S.read(_v42, "SY"), _S.binary("*", 0.95, _S.invoke(_S.read(_v42, "Math"), "pow", [_S.binary("-", 1, _S.read(_v42, "f")), 1.5])), _S.read(_v42, "C"), _S.merge([{"n": 1}, {"half": _S.unary("-", 1)}, {"seed": _S.binary("+", _S.read(_v42, "i"), 1)}])])
		_v41 = _S.iteration(_v41)
		_S.write(_v41, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "mist"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), 7, 20])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	var _v43 = _S.scope(_e)
	_S.define(_v43, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "i"), 3)):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "f", _S.binary("%", _S.binary("+", _S.read(_v44, "ph"), _S.binary("/", _S.read(_v44, "i"), 3)), 1))
		_S.call_value(_S.read(_v44, "ring"), [_S.read(_v44, "p"), 0, 1, _S.binary("+", _S.binary("+", _S.read(_v44, "W"), 6), _S.binary("*", _S.read(_v44, "f"), 38)), _S.read(_v44, "SY"), _S.binary("*", 0.95, _S.invoke(_S.read(_v44, "Math"), "pow", [_S.binary("-", 1, _S.read(_v44, "f")), 1.5])), _S.read(_v44, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": _S.binary("+", _S.read(_v44, "i"), 1)}, {"glint": (_S.binary("-", 1, _S.binary("*", _S.read(_v44, "f"), 2.5)) if _S.truth(_S.binary("<", _S.read(_v44, "f"), 0.4)) else 0)}])])
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "river"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "H"), _S.read(_e, "W"), _S.read(_e, "S")])
	if _S.truth(_S.prop(_S.read(_e, "o"), "ledge")):
		_S.call_value(_S.read(_e, "outcrop"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "H"), _S.read(_e, "W"), _S.read(_e, "S")])
	_S.call_value(_S.read(_e, "sheet"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "H"), _S.read(_e, "W"), _S.read(_e, "S")])
	_S.call_value(_S.read(_e, "curl"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "H"), _S.read(_e, "W"), _S.read(_e, "S")])
	_S.call_value(_S.read(_e, "foam"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "ph"), _S.read(_e, "W"), _S.read(_e, "S")])
	_S.call_value(_S.read(_e, "mist"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "S"), 5, 21])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.read(_e, "S"), 50), _S.function_value(_e, "_f24"), _S.function_value(_e, "_f25")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 34, _S.binary("+", _S.read(_e, "S"), 51), _S.function_value(_e, "_f26"), _S.function_value(_e, "_f27")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.binary("+", _S.unary("-", _S.read(_e, "H")), 6), 0, _S.unary("-", 8), 26, _S.prop(_S.read(_e, "C"), 4), 0.12])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 5), 40, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.32, _S.binary("*", 0.05, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "T"), 2)])))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 4, 50, _S.prop(_S.read(_e, "C"), 3), 0.14])
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.2, 0.4])

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "life"))]))
	_S.define(_e, "low", _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.45))
	_S.define(_e, "d", (_S.binary("-", _S.read(_e, "H"), _S.invoke(_S.read(_e, "r"), "range", [4, 16])) if _S.truth(_S.read(_e, "low")) else _S.invoke(_S.read(_e, "r"), "range", [12, _S.binary("-", _S.read(_e, "H"), 16)])))
	_S.define(_e, "x", (_S.invoke(_S.read(_e, "r"), "range", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 10), _S.binary("+", _S.read(_e, "W"), 10)]) if _S.truth(_S.read(_e, "low")) else _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.8), 0.8]), _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "W"), _S.read(_e, "d"), _S.read(_e, "H")]))))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_e, "H")), _S.read(_e, "d")), _S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), (6 if _S.truth(_S.read(_e, "low")) else _S.unary("-", 10)))))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.55)):
		for _v45 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v46 = _S.scope(_e)
			var _v47 = _v45
			_S.define(_v46, "dx", _S.prop(_v47, 0))
			_S.define(_v46, "dy", _S.prop(_v47, 1))
			_S.invoke(_S.read(_v46, "p"), "px", [_S.binary("+", _S.read(_v46, "x"), _S.read(_v46, "dx")), _S.binary("+", _S.read(_v46, "y"), _S.read(_v46, "dy")), _S.prop(_S.read(_v46, "C"), 6)])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.85), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5))):
		for _v48 in _S.array([[2, 0], [_S.unary("-", 2), 0], [0, 2], [0, _S.unary("-", 2)]]):
			var _v49 = _S.scope(_e)
			var _v50 = _v48
			_S.define(_v49, "dx", _S.prop(_v50, 0))
			_S.define(_v49, "dy", _S.prop(_v50, 1))
			_S.invoke(_S.read(_v49, "p"), "px", [_S.binary("+", _S.read(_v49, "x"), _S.read(_v49, "dx")), _S.binary("+", _S.read(_v49, "y"), _S.read(_v49, "dy")), _S.prop(_S.read(_v49, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.9, 1.6])

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.read(_e, "side"), _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.binary("+", _S.read(_e, "W"), 6)]), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [6, 22])))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 5), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 1.2)))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [3, 10])), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [10, 34]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.7), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.7), 3.3)))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "k"), 0.4), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5))) else _S.prop(_S.read(_e, "C"), 6))])
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "W", _S.arg(_args, 0))
	_S.define(_e, "d", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	return _S.binary("+", _S.read(_e, "W"), _S.binary("*", 3.2, _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "d"), _S.read(_e, "H"))]), 1.6])))
