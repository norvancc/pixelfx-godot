@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/snowflake-burst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flakeDesign", _S.import_value("fx/ice/_lib.js", "flakeDesign"))
	_S.define(_e, "snowflake", _S.import_value("fx/ice/_lib.js", "snowflake"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Snowflake burst"}, {"desc": "A cold pop: frost gathers and flashes white in a ring, then crisp six-armed snowflakes spin out, slow, twinkle and drift down to settle and melt."}, {"tags": ["ice", "snow", "snowflake", "burst", "magic", "one-shot"]}, {"size": [140, 120]}, {"origin": [70, 106]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"count": 9}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.16)
	_S.define(_e, "CY", _S.unary("-", 48))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flakes", [])
	_S.define(_e, "SIZES", [2, 0, 1, 0, 2, 0, 1, 0, 1])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "o"), "count"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "z", _S.prop(_S.read(_v1, "SIZES"), _S.binary("%", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "SIZES"), "length"))))
		_S.define(_v1, "r", (_S.invoke(_S.read(_v1, "R"), "range", [9.5, 11.5]) if _S.truth(_S.binary("===", _S.read(_v1, "z"), 2)) else (_S.invoke(_S.read(_v1, "R"), "range", [6, 7.5]) if _S.truth(_S.binary("===", _S.read(_v1, "z"), 1)) else _S.invoke(_S.read(_v1, "R"), "range", [3, 4.5]))))
		_S.define(_v1, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "o"), "count")), _S.read(_v1, "TAU")), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.3), 0.3])), 0.4))
		_S.define(_v1, "sp", _S.binary("*", _S.invoke(_S.read(_v1, "R"), "range", [80, 120]), _S.binary("-", 1.4, _S.binary("/", _S.read(_v1, "r"), 14))))
		_S.invoke(_S.read(_v1, "flakes"), "push", [_S.merge([{"x": 0}, {"y": _S.read(_v1, "CY")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.85), 20)}, {"r": _S.read(_v1, "r")}, {"rot": _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")])}, {"w0": _S.binary("*", _S.invoke(_S.read(_v1, "R"), "sign", []), _S.invoke(_S.read(_v1, "R"), "range", [7, 12]))}, {"w1": _S.binary("*", _S.invoke(_S.read(_v1, "R"), "sign", []), _S.invoke(_S.read(_v1, "R"), "range", [0.4, 1]))}, {"d": _S.call_value(_S.read(_v1, "flakeDesign"), [_S.read(_v1, "R")])}, {"life": _S.invoke(_S.read(_v1, "R"), "range", [2.1, 2.8])}, {"age": 0}, {"ph": _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")])}, {"tw": _S.invoke(_S.read(_v1, "R"), "range", [0.5, 0.85])}, {"tw0": _S.invoke(_S.read(_v1, "R"), "range", [0.15, 0.6])}, {"rest": false}, {"popped": false}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "sz", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "f"), "r"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.prop(_S.read(_e, "f"), "age"), 0.18)]), 2])])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "f"), "life"), _S.prop(_S.read(_e, "f"), "age")), 0.35)]))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "POP"), 0.03)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.8]))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
		_S.define(_v2, "D", _S.invoke(_S.read(_v2, "R"), "range", [22, 44]))
		_S.define(_v2, "T", _S.invoke(_S.read(_v2, "R"), "range", [0.12, 0.16]))
		_S.define(_v2, "v", _S.binary("/", _S.binary("*", _S.read(_v2, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "exp", [_S.binary("*", 3, _S.read(_v2, "T"))]), 1)))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "D")), _S.binary("+", _S.read(_v2, "CY"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.read(_v2, "T"), (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v3 = _S.scope(_e)
		_S.write(_v3, "popped", true, "=", false)
		_S.invoke(_S.read(_v3, "lights"), "add", [0, _S.read(_v3, "CY"), 44, _S.read(_v3, "WHITE"), 0.8, 0.1])
		_S.invoke(_S.read(_v3, "lights"), "add", [0, _S.read(_v3, "CY"), 72, _S.prop(_S.read(_v3, "C"), 4), 0.5, 0.6])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 22)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [80, 150]))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "MOTE"), 0, _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.5])) else _S.prop(_S.read(_v5, "C"), 5)), _S.invoke(_S.read(_v5, "R"), "range", [0.6, 1])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 18)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 0.2]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "FLAKE"), 0, _S.read(_v7, "CY"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [1, 1.6]), (_S.read(_v7, "WHITE") if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.6])) else _S.prop(_S.read(_v7, "C"), 6)), _S.invoke(_S.read(_v7, "R"), "range", [0.5, 1.5])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v3)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 12)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "d", _S.invoke(_S.read(_v9, "R"), "range", [10, 44]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "d")), _S.binary("+", _S.read(_v9, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "d")), 0.85)), 0, _S.invoke(_S.read(_v9, "R"), "range", [2, 6]), _S.invoke(_S.read(_v9, "R"), "range", [0.3, 0.6]), (_S.read(_v9, "WHITE") if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.5])) else _S.prop(_S.read(_v9, "C"), 6)), _S.invoke(_S.read(_v9, "R"), "range", [0.8, 2.2]), _S.invoke(_S.read(_v9, "R"), "range", [0.08, 1.6])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "popped")):
		for _v10 in _S.array(_S.read(_e, "flakes")):
			var _v11 = _S.scope(_e)
			_S.define(_v11, "f", _v10)
			var _v12 = _S.scope(_v11)
			_S.set_prop(_S.read(_v12, "f"), "age", _S.read(_v12, "dt"), "+=", false)
			if _S.truth(_S.binary(">=", _S.prop(_S.read(_v12, "f"), "age"), _S.prop(_S.read(_v12, "f"), "life"))):
				continue
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v12, "f"), "rest"))):
				var _v13 = _S.scope(_v12)
				_S.set_prop(_S.read(_v13, "f"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v13, "f"), "vx"), 2.8), _S.read(_v13, "dt")), "-=", false)
				_S.set_prop(_S.read(_v13, "f"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v13, "f"), "vy"), 2.8), _S.read(_v13, "dt")), _S.binary("*", 26, _S.read(_v13, "dt"))), "-=", false)
				_S.set_prop(_S.read(_v13, "f"), "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v13, "f"), "vx"), _S.read(_v13, "dt")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v13, "t"), 1.8), _S.prop(_S.read(_v13, "f"), "ph"))]), 5), _S.read(_v13, "dt"))), "+=", false)
				_S.set_prop(_S.read(_v13, "f"), "y", _S.binary("*", _S.prop(_S.read(_v13, "f"), "vy"), _S.read(_v13, "dt")), "+=", false)
				_S.set_prop(_S.read(_v13, "f"), "rot", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v13, "f"), "w1"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v13, "f"), "w0"), _S.prop(_S.read(_v13, "f"), "w1")), _S.invoke(_S.read(_v13, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "f"), "age")), 2.5)]))), _S.read(_v13, "dt")), "+=", false)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v13, "f"), "y"), _S.binary("*", _S.unary("-", _S.call_value(_S.read(_v13, "sz"), [_S.read(_v13, "f")])), 0.3))):
					var _v14 = _S.scope(_v13)
					_S.set_prop(_S.read(_v14, "f"), "rest", true, "=", false)
					_S.set_prop(_S.read(_v14, "f"), "y", _S.unary("-", 1), "=", false)
					_S.set_prop(_S.read(_v14, "f"), "life", _S.invoke(_S.read(_v14, "Math"), "min", [_S.prop(_S.read(_v14, "f"), "life"), _S.binary("+", _S.prop(_S.read(_v14, "f"), "age"), 0.6)]), "=", false)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "f"), "popped")), func(): return _S.binary("<", _S.binary("-", _S.prop(_S.read(_v12, "f"), "life"), _S.prop(_S.read(_v12, "f"), "age")), 0.1))):
				var _v15 = _S.scope(_v12)
				_S.set_prop(_S.read(_v15, "f"), "popped", true, "=", false)
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v16, "i"), 2)):
					_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v16, "f"), "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.prop(_S.read(_v16, "f"), "y"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [2, 8])), _S.invoke(_S.read(_v16, "R"), "range", [0.2, 0.4]), (_S.read(_v16, "WHITE") if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 6)), _S.invoke(_S.read(_v16, "R"), "range", [0.8, 1.6])])
					_v16 = _S.iteration(_v16)
					_S.write(_v16, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "k", _S.binary("/", _S.read(_v17, "t"), _S.read(_v17, "POP")))
		_S.call_value(_S.read(_v17, "snowflake"), [_S.read(_v17, "p"), 0, _S.read(_v17, "CY"), _S.binary("+", 1, _S.binary("*", _S.binary("*", 3.2, _S.read(_v17, "k")), _S.read(_v17, "k"))), _S.binary("*", _S.read(_v17, "t"), 20), _S.prop(_S.prop(_S.read(_v17, "flakes"), 0), "d"), _S.read(_v17, "C"), _S.merge([{"hot": _S.read(_v17, "k")}])])
		_S.invoke(_S.read(_v17, "p"), "glow", [0, _S.read(_v17, "CY"), _S.binary("+", 8, _S.binary("*", 14, _S.read(_v17, "k"))), _S.prop(_S.read(_v17, "C"), 5), _S.binary("+", 0.3, _S.binary("*", 0.4, _S.read(_v17, "k")))])
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.4))):
		var _v18 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v18, "q"), 0.07)):
			_S.invoke(_S.read(_v18, "p"), "circle", [0, _S.read(_v18, "CY"), _S.binary("+", _S.binary("*", 6, _S.binary("-", 1, _S.binary("/", _S.read(_v18, "q"), 0.07))), 1), _S.read(_v18, "WHITE")])
		_S.call_value(_S.read(_v18, "flare"), [_S.read(_v18, "p"), 0, _S.read(_v18, "CY"), _S.binary("*", 28, _S.invoke(_S.read(_v18, "Math"), "pow", [_S.invoke(_S.read(_v18, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v18, "q"), 0.26))]), 1.5])), _S.binary("-", 1, _S.binary("/", _S.read(_v18, "q"), 0.26)), _S.read(_v18, "C")])
		_S.define(_v18, "e", _S.invoke(_S.read(_v18, "ease"), "outCubic", [_S.binary("/", _S.read(_v18, "q"), 0.4)]))
		_S.define(_v18, "r", _S.binary("+", 5, _S.binary("*", 34, _S.read(_v18, "e"))))
		_S.invoke(_S.read(_v18, "p"), "ring", [0, _S.read(_v18, "CY"), _S.read(_v18, "r"), _S.invoke(_S.read(_v18, "Math"), "max", [1, _S.binary("*", 2.4, _S.binary("-", 1, _S.read(_v18, "e")))]), (_S.read(_v18, "WHITE") if _S.truth(_S.binary("<", _S.read(_v18, "q"), 0.08)) else (_S.prop(_S.read(_v18, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v18, "q"), 0.2)) else _S.prop(_S.read(_v18, "C"), 5))), _S.binary("-", 1.15, _S.read(_v18, "e"))])
		_S.invoke(_S.read(_v18, "p"), "glowRing", [0, _S.read(_v18, "CY"), _S.read(_v18, "r"), 5, _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v18, "e")))])
	if _S.truth(_S.read(_e, "popped")):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "POP"), _S.binary("+", _S.read(_e, "POP"), 1.6), _S.read(_e, "t")])))])
	for _v19 in _S.array(_S.read(_e, "flakes")):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "f", _v19)
		var _v21 = _S.scope(_v20)
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v21, "popped")), func(): return _S.binary(">=", _S.prop(_S.read(_v21, "f"), "age"), _S.prop(_S.read(_v21, "f"), "life")))):
			continue
		_S.define(_v21, "r", _S.call_value(_S.read(_v21, "sz"), [_S.read(_v21, "f")]))
		_S.define(_v21, "tw", _S.binary("*", _S.binary("**", _S.invoke(_S.read(_v21, "Math"), "max", [0, _S.invoke(_S.read(_v21, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v21, "f"), "age"), _S.prop(_S.read(_v21, "f"), "tw0")), _S.prop(_S.read(_v21, "f"), "tw")), _S.read(_v21, "TAU"))])]), 8), (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_v21, "f"), "age"), _S.prop(_S.read(_v21, "f"), "tw0"))) else 0)))
		if _S.truth(_S.prop(_S.read(_v21, "f"), "rest")):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "L", _S.invoke(_S.read(_v22, "Math"), "max", [1, _S.invoke(_S.read(_v22, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_v22, "r"), 1.2), _S.binary("/", _S.binary("-", _S.prop(_S.read(_v22, "f"), "life"), _S.prop(_S.read(_v22, "f"), "age")), 0.6))])]))
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "i", _S.unary("-", _S.read(_v23, "L")))
			while _S.truth(_S.binary("<=", _S.read(_v23, "i"), _S.read(_v23, "L"))):
				_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v23, "f"), "x"), _S.read(_v23, "i")), _S.unary("-", 1), (_S.prop(_S.read(_v23, "C"), 5) if _S.truth(_S.binary("===", _S.invoke(_S.read(_v23, "Math"), "abs", [_S.read(_v23, "i")]), _S.read(_v23, "L"))) else (_S.read(_v23, "WHITE") if _S.truth(_S.binary("===", _S.read(_v23, "i"), 0)) else _S.prop(_S.read(_v23, "C"), 6)))])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "i", 1, "+=", true)
			_S.invoke(_S.read(_v22, "p"), "glow", [_S.prop(_S.read(_v22, "f"), "x"), _S.unary("-", 1), _S.binary("+", 3, _S.read(_v22, "L")), _S.prop(_S.read(_v22, "C"), 4), 0.3])
			continue
		_S.call_value(_S.read(_v21, "snowflake"), [_S.read(_v21, "p"), _S.prop(_S.read(_v21, "f"), "x"), _S.prop(_S.read(_v21, "f"), "y"), _S.read(_v21, "r"), _S.prop(_S.read(_v21, "f"), "rot"), _S.prop(_S.read(_v21, "f"), "d"), _S.read(_v21, "C"), _S.merge([{"hot": _S.invoke(_S.read(_v21, "Math"), "max", [_S.read(_v21, "tw"), _S.binary("-", 1, _S.call_value(_S.read(_v21, "clamp"), [_S.binary("/", _S.prop(_S.read(_v21, "f"), "age"), 0.12)]))])}])])
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.prop(_S.read(_v21, "f"), "x"), _S.prop(_S.read(_v21, "f"), "y"), _S.binary("+", 6, _S.binary("*", _S.read(_v21, "r"), 1.4)), _S.prop(_S.read(_v21, "C"), 4), 0.12])
		if _S.truth(_S.binary(">", _S.read(_v21, "tw"), 0.5)):
			_S.call_value(_S.read(_v21, "flare"), [_S.read(_v21, "p"), _S.prop(_S.read(_v21, "f"), "x"), _S.prop(_S.read(_v21, "f"), "y"), _S.binary("*", _S.binary("+", 3, _S.binary("*", _S.read(_v21, "r"), 0.7)), _S.read(_v21, "tw")), _S.read(_v21, "tw"), _S.read(_v21, "C")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
