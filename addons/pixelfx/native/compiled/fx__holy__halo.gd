@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/halo.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Halo"}, {"desc": "A ring of gold light floats over the head with a glint running round it; fine dust sifts down from it and the head catches its light."}, {"tags": ["holy", "halo", "saint", "buff", "glow", "character", "loop"]}, {"size": [56, 80]}, {"origin": [28, 70]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "PRAY", _S.merge([{"turn": 1.1}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 26)}, {"bx": 2}, {"by": _S.unary("-", 26)}, {"armsFront": true}, {"hy": 1}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "PRAY")], [0.5, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}])], [1, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}, {"hy": 2}])], [1.5, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}])], [2, _S.read(_e, "PRAY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "HY", _S.unary("-", 46))
	_S.define(_e, "RX", 9.5)
	_S.define(_e, "RY", 2.6)
	_S.define(_e, "apart", _S.function_value(_e, "_f5"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.read(_e, "TAU")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "y0", _S.binary("+", _S.read(_e, "HY"), (_S.unary("-", 1) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ph")]), 0.55)) else 0)))
	_S.define(_e, "gl", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.read(_e, "ph")))
	if _S.truth(_S.read(_e, "A")):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "m", _S.prop(_S.read(_v0, "A"), "mask"))
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "m"), "w"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v2, "j"), _S.invoke(_S.read(_v2, "Math"), "min", [_S.prop(_S.read(_v2, "m"), "h"), 9]))):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "c", _S.prop(_S.prop(_S.read(_v3, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v3, "j"), _S.prop(_S.read(_v3, "m"), "w")), _S.read(_v3, "i"))))
				if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v3, "c")), func(): return _S.binary("<", _S.call_value(_S.read(_v3, "luma"), [_S.read(_v3, "c")]), 0.15))):
					_v2 = _S.iteration(_v2)
					_S.write(_v2, "j", 1, "+=", true)
					continue
				_S.define(_v3, "x", _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "i")))
				_S.define(_v3, "y", _S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "j")))
				_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "c"), _S.prop(_S.read(_v3, "C"), 6), 0.45])])
				_S.define(_v3, "c2", _S.prop(_S.prop(_S.read(_v3, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v3, "j"), 1), _S.prop(_S.read(_v3, "m"), "w")), _S.read(_v3, "i"))))
				if _S.truth(_S.logical("&&", _S.read(_v3, "c2"), func(): return _S.binary(">=", _S.call_value(_S.read(_v3, "luma"), [_S.read(_v3, "c2")]), 0.15))):
					_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.binary("+", _S.read(_v3, "y"), 1), _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "c2"), _S.prop(_S.read(_v3, "C"), 5), 0.18])])
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "d", 0)
				while _S.truth(_S.binary("<=", _S.read(_v4, "d"), 4)):
					_S.invoke(_S.read(_v4, "p"), "light", [_S.read(_v4, "x"), _S.binary("+", _S.read(_v4, "y"), _S.read(_v4, "d")), _S.prop(_S.read(_v4, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "d"), 5)))])
					_v4 = _S.iteration(_v4)
					_S.write(_v4, "d", 1, "+=", true)
				break
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "j", 1, "+=", true)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "j", 0)
	_S.define(_v5, "n", 92)
	while _S.truth(_S.binary("<", _S.read(_v5, "j"), _S.read(_v5, "n"))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "g", _S.binary("*", _S.binary("/", _S.read(_v6, "j"), _S.read(_v6, "n")), _S.read(_v6, "TAU")))
		_S.define(_v6, "x", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "g")]), _S.read(_v6, "RX")))
		_S.define(_v6, "y", _S.binary("+", _S.read(_v6, "y0"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "g")]), _S.read(_v6, "RY"))))
		_S.define(_v6, "near", _S.binary(">=", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "g")]), 0))
		_S.define(_v6, "shimmer", _S.binary(">", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v6, "g"), 3), _S.binary("*", _S.read(_v6, "ph"), 2))]), 0.7))
		_S.define(_v6, "hot", _S.binary("<", _S.call_value(_S.read(_v6, "apart"), [_S.read(_v6, "g"), _S.read(_v6, "gl")]), 0.3))
		if _S.truth(_S.read(_v6, "near")):
			var _v7 = _S.scope(_v6)
			_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.read(_v7, "WHITE") if _S.truth(_S.read(_v7, "hot")) else (_S.read(_v7, "WHITE") if _S.truth(_S.read(_v7, "shimmer")) else _S.prop(_S.read(_v7, "C"), 6)))])
			_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "y"), 1), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.read(_v7, "hot")) else _S.prop(_S.read(_v7, "C"), 4))])
		else:
			_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.read(_v6, "WHITE") if _S.truth(_S.read(_v6, "hot")) else (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.read(_v6, "shimmer")) else _S.prop(_S.read(_v6, "C"), 5))), 0.9])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y0"), 20, _S.prop(_S.read(_e, "C"), 4), 0.4])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "y0"), 1), 9, _S.read(_e, "WHITE"), 0.16])
	_S.define(_e, "gx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "gl")]), _S.read(_e, "RX")))
	_S.define(_e, "gy", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")]), _S.read(_e, "RY"))))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")]), _S.unary("-", 0.2))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "gx"), _S.binary("+", _S.read(_e, "gy"), 0.5), _S.binary("+", 1.5, _S.binary("*", 2.5, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")])]))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), 0.45])
	else:
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "gx"), _S.read(_e, "gy"), 5, _S.prop(_S.read(_e, "C"), 6), 0.3])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.binary("+", _S.read(_e, "y0"), 2), 0, _S.binary("+", _S.read(_e, "y0"), 9), 9, _S.prop(_S.read(_e, "C"), 4), 0.16])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 6, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 16, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.3, 0.5])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "R"), "range", [1.1, 1.5]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.read(_e, "RX")), _S.read(_e, "d")), _S.binary("-", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "RY")), _S.read(_e, "d"))), _S.invoke(_S.read(_e, "R"), "range", [1, 4])), _S.binary("+", 1, _S.binary("*", 2, _S.read(_e, "k"))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.8, 1.5])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.read(_e, "RX")), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 5), _S.read(_e, "g"))]), 1.2)))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "RY"))), 1), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "R"), "range", [7, 14]))))
	_S.define(_e, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 18), _S.binary("*", _S.read(_e, "g"), 7))]))))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.read(_e, "tw")))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.85)) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 1.5)])])
	_S.invoke(_S.read(_e, "p"), "light", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.read(_e, "k"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_e, "a"), _S.read(_e, "b")), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "Math"), "PI"))])
