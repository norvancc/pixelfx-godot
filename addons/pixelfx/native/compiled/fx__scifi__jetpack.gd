@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/jetpack.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f0"))
	_S.define(_e, "pack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Jetpack"}, {"desc": "Twin thrusters fire straight down: white-hot cores with shock diamonds inside ragged flames, puffs that cool into smoke billowing below, lit by the fire."}, {"tags": ["scifi", "jetpack", "thrust", "rocket", "fire", "smoke", "flight", "loop"]}, {"size": [96, 116]}, {"origin": [48, 30]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a0e12", "#5c1818", "#a02818", "#e0501a", "#ff8a2a", "#ffc23d", "#fff3a6", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"length": 26}, {"seed": 30}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GAP", 8)
	_S.define(_e, "FR", 30)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.arg(_args, 1))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ":" + _S.string(_S.prop(_S.read(_e, "o"), "length")) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 4)]}, {"box": [_S.unary("-", 46), _S.unary("-", 28), 46, 84]}])]))
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 26)):
			_S.invoke(_S.read(_v3, "g"), "add", [_S.invoke(_S.read(_v3, "rn"), "range", [0, _S.read(_v3, "D")]), _S.prop(_S.read(_v3, "P"), "FIRE"), _S.binary("+", _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "GAP")), _S.invoke(_S.read(_v3, "rn"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("*", _S.read(_v3, "L"), _S.invoke(_S.read(_v3, "rn"), "range", [0.55, 0.85])), _S.invoke(_S.read(_v3, "rn"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v3, "rn"), "range", [70, 130]), _S.invoke(_S.read(_v3, "rn"), "range", [0.22, 0.4]), 0, _S.invoke(_S.read(_v3, "rn"), "range", [2.2, 3.4]), _S.binary("|", _S.prop(_S.read(_v3, "PF"), "SMOKES"), (_S.prop(_S.read(_v3, "PF"), "BIG") if _S.truth(_S.invoke(_S.read(_v3, "rn"), "chance", [0.5])) else 0))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v4 = _S.scope(_v2)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 10)):
			_S.invoke(_S.read(_v4, "g"), "add", [_S.invoke(_S.read(_v4, "rn"), "range", [0, _S.read(_v4, "D")]), _S.prop(_S.read(_v4, "P"), "SMOKE"), _S.binary("+", _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "GAP")), _S.invoke(_S.read(_v4, "rn"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v4, "L"), _S.invoke(_S.read(_v4, "rn"), "range", [2, 8])), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "rn"), "range", [0, 14])), _S.invoke(_S.read(_v4, "rn"), "range", [40, 80]), _S.invoke(_S.read(_v4, "rn"), "range", [1.1, 1.6]), 0, _S.invoke(_S.read(_v4, "rn"), "range", [3, 5]), _S.prop(_S.read(_v4, "PF"), "BIG")])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 10)):
			_S.invoke(_S.read(_v5, "g"), "add", [_S.invoke(_S.read(_v5, "rn"), "range", [0, _S.read(_v5, "D")]), _S.prop(_S.read(_v5, "P"), "SPARK"), _S.binary("+", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "GAP")), _S.invoke(_S.read(_v5, "rn"), "range", [_S.unary("-", 1), 1])), _S.binary("*", _S.read(_v5, "L"), _S.invoke(_S.read(_v5, "rn"), "range", [0.3, 0.7])), _S.binary("*", _S.read(_v5, "s"), _S.invoke(_S.read(_v5, "rn"), "range", [_S.unary("-", 40), 60])), _S.invoke(_S.read(_v5, "rn"), "range", [80, 200]), _S.invoke(_S.read(_v5, "rn"), "range", [0.2, 0.45])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v6 = _S.scope(_v2)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 5)):
			_S.invoke(_S.read(_v6, "g"), "add", [_S.invoke(_S.read(_v6, "rn"), "range", [0, _S.read(_v6, "D")]), _S.prop(_S.read(_v6, "P"), "EMBER"), _S.binary("+", _S.binary("*", _S.read(_v6, "s"), _S.read(_v6, "GAP")), _S.invoke(_S.read(_v6, "rn"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.read(_v6, "L"), _S.invoke(_S.read(_v6, "rn"), "range", [0.6, 1])), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "rn"), "range", [10, 40])), _S.invoke(_S.read(_v6, "rn"), "range", [20, 60]), _S.invoke(_S.read(_v6, "rn"), "range", [0.6, 1.1]), _S.prop(_S.read(_v6, "F"), 4), _S.invoke(_S.read(_v6, "rn"), "range", [0.8, 1.6])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "key"), _S.read(_e, "g")])
	return _S.read(_e, "g")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "F", _S.arg(_args, 2))
	_S.define(_e, "dy", _S.arg(_args, 3))
	for _v7 in _S.array([_S.unary("-", 1), 1]):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "s", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "cx", _S.binary("*", _S.read(_v9, "s"), _S.read(_v9, "GAP")))
		_S.invoke(_S.read(_v9, "p"), "shade", [_S.binary("-", _S.read(_v9, "cx"), 5), _S.binary("+", _S.unary("-", 24), _S.read(_v9, "dy")), _S.binary("+", _S.read(_v9, "cx"), 5), _S.binary("+", _S.unary("-", 3), _S.read(_v9, "dy")), _S.function_value(_v9, "_f2")])
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "y", _S.unary("-", 3))
		while _S.truth(_S.binary("<=", _S.read(_v10, "y"), 0)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "w", _S.binary("+", 2, _S.binary("*", _S.binary("+", _S.read(_v11, "y"), 3), 0.7)))
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.read(_v12, "cx"), _S.read(_v12, "w"))]))
			while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.binary("+", _S.read(_v12, "cx"), _S.read(_v12, "w"))]))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "inner", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.read(_v13, "cx"))]), _S.binary("-", _S.read(_v13, "w"), 1.2)), func(): return _S.binary(">=", _S.read(_v13, "y"), _S.unary("-", 1))))
				_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.binary("+", _S.read(_v13, "y"), _S.read(_v13, "dy")), ((_S.prop(_S.read(_v13, "F"), 6) if _S.truth(_S.binary("===", _S.read(_v13, "y"), 0)) else _S.prop(_S.read(_v13, "F"), 4)) if _S.truth(_S.read(_v13, "inner")) else (_S.prop(_S.read(_v13, "H"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.read(_v13, "cx"))]), _S.binary("-", _S.read(_v13, "w"), 0.6))) else (_S.prop(_S.read(_v13, "H"), 3) if _S.truth(_S.binary("<", _S.read(_v13, "x"), _S.read(_v13, "cx"))) else _S.prop(_S.read(_v13, "H"), 1))))])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "x", 1, "+=", true)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "y", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "y", _S.unary("-", 20))
	while _S.truth(_S.binary("<=", _S.read(_v14, "y"), _S.unary("-", 6))):
		_S.last([_S.invoke(_S.read(_v14, "p"), "px", [_S.unary("-", 1), _S.binary("+", _S.read(_v14, "y"), _S.read(_v14, "dy")), _S.prop(_S.read(_v14, "H"), 1)]), _S.invoke(_S.read(_v14, "p"), "px", [0, _S.binary("+", _S.read(_v14, "y"), _S.read(_v14, "dy")), _S.prop(_S.read(_v14, "H"), 2)]), _S.invoke(_S.read(_v14, "p"), "px", [1, _S.binary("+", _S.read(_v14, "y"), _S.read(_v14, "dy")), _S.prop(_S.read(_v14, "H"), 0)])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [0, _S.binary("+", _S.unary("-", 16), _S.read(_e, "dy")), _S.prop(_S.read(_e, "F"), 5)])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), 4.5))
	_S.define(_e, "top", _S.binary("+", _S.unary("-", 19), _S.read(_e, "dy")))
	_S.define(_e, "v", (_S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), 4.5) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.read(_e, "top"))) else 0))
	if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v"))), 1)):
		return null
	_S.define(_e, "l", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "u")), 0.8), _S.binary("*", _S.read(_e, "v"), 0.6)))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v"))), 0.78)) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.binary("+", _S.unary("-", 12), _S.read(_e, "dy")))]), 0.6)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.55)) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.15)) else (_S.prop(_S.read(_e, "H"), 3) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.35))) else _S.prop(_S.read(_e, "H"), 2)))))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), _S.read(_e, "FR"))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "D"), _S.read(_e, "FR"))])))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "dy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 12), _S.read(_e, "ph"))]), 0.6)]))
	_S.define(_e, "g", _S.invoke(_S.call_value(_S.read(_e, "ghosts"), [_S.read(_e, "o"), _S.read(_e, "F")]), "at", [_S.read(_e, "t")]))
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), "back"])
	for _v15 in _S.array([_S.unary("-", 1), 1]):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "s", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "cx", _S.binary("+", _S.binary("*", _S.read(_v17, "s"), _S.read(_v17, "GAP")), (_S.binary("*", _S.read(_v17, "s"), 0.5) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v17, "rand"), [_S.read(_v17, "S"), _S.read(_v17, "f"), _S.read(_v17, "s")]), 0.15)) else 0)))
		_S.define(_v17, "L", _S.binary("*", _S.prop(_S.read(_v17, "o"), "length"), _S.binary("+", _S.binary("+", 0.92, _S.binary("*", 0.08, _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v17, "TAU"), 7), _S.read(_v17, "ph")), _S.read(_v17, "s"))]))), _S.binary("*", 0.06, _S.binary("-", _S.call_value(_S.read(_v17, "rand"), [_S.read(_v17, "S"), _S.read(_v17, "f"), _S.read(_v17, "s"), 1]), 0.5)))))
		_S.invoke(_S.read(_v17, "p"), "shade", [_S.binary("-", _S.read(_v17, "cx"), 7), _S.read(_v17, "dy"), _S.binary("+", _S.read(_v17, "cx"), 7), _S.binary("+", _S.binary("+", _S.read(_v17, "dy"), _S.read(_v17, "L")), 4), _S.function_value(_v17, "_f4")])
		var _v19 = _S.scope(_v17)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 3)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "y", _S.invoke(_S.read(_v20, "Math"), "round", [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v20, "dy"), 5), _S.binary("*", _S.read(_v20, "i"), 6.5)), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v20, "TAU"), 4), _S.read(_v20, "ph")), _S.read(_v20, "i"))]), 0.5))]))
			_S.define(_v20, "r", _S.invoke(_S.read(_v20, "Math"), "round", [_S.binary("+", _S.binary("-", 2.2, _S.binary("*", _S.read(_v20, "i"), 0.45)), _S.binary("*", 0.4, _S.invoke(_S.read(_v20, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v20, "TAU"), 8), _S.read(_v20, "ph")), _S.binary("*", _S.read(_v20, "i"), 2))])))]))
			if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v20, "y"), _S.binary("+", _S.read(_v20, "dy"), _S.binary("*", _S.read(_v20, "L"), 0.75))), func(): return _S.binary("<", _S.read(_v20, "r"), 1))):
				break
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "yy", _S.unary("-", _S.read(_v21, "r")))
			while _S.truth(_S.binary("<=", _S.read(_v21, "yy"), _S.read(_v21, "r"))):
				var _v22 = _S.scope(_v21)
				_S.define(_v22, "xx", _S.unary("-", _S.read(_v22, "r")))
				while _S.truth(_S.binary("<=", _S.read(_v22, "xx"), _S.read(_v22, "r"))):
					var _v23 = _S.scope(_v22)
					_S.define(_v23, "d", _S.binary("+", _S.invoke(_S.read(_v23, "Math"), "abs", [_S.read(_v23, "xx")]), _S.invoke(_S.read(_v23, "Math"), "abs", [_S.read(_v23, "yy")])))
					if _S.truth(_S.binary("<=", _S.read(_v23, "d"), _S.read(_v23, "r"))):
						_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.read(_v23, "cx"), _S.read(_v23, "xx")), _S.binary("+", _S.read(_v23, "y"), _S.read(_v23, "yy")), (_S.read(_v23, "WHITE") if _S.truth(_S.binary("<", _S.read(_v23, "d"), _S.read(_v23, "r"))) else (_S.prop(_S.read(_v23, "F"), 6) if _S.truth(_S.binary("===", _S.read(_v23, "i"), 0)) else _S.prop(_S.read(_v23, "F"), 5)))])
					_v22 = _S.iteration(_v22)
					_S.write(_v22, "xx", 1, "+=", true)
				_v21 = _S.iteration(_v21)
				_S.write(_v21, "yy", 1, "+=", true)
			_S.invoke(_S.read(_v20, "p"), "glow", [_S.read(_v20, "cx"), _S.read(_v20, "y"), 6, _S.prop(_S.read(_v20, "F"), 6), 0.35])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "cx"), _S.binary("+", _S.read(_v17, "dy"), 2), 9, _S.read(_v17, "WHITE"), 0.45])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "cx"), _S.binary("+", _S.read(_v17, "dy"), _S.binary("*", _S.read(_v17, "L"), 0.45)), _S.binary("*", _S.read(_v17, "L"), 0.8), _S.prop(_S.read(_v17, "F"), 4), 0.35])
	_S.call_value(_S.read(_e, "pack"), [_S.read(_e, "p"), _S.read(_e, "H"), _S.read(_e, "F"), _S.read(_e, "dy")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "o"), "length"), 14), 34, _S.prop(_S.read(_e, "F"), 4), 0.16])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("*", _S.prop(_S.read(_e, "o"), "length"), 0.4), 30, _S.prop(_S.read(_e, "F"), 5), 0.18])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "dy")), _S.read(_e, "L")))
	_S.define(_e, "w", _S.binary("+", _S.call_value(_S.read(_e, "lerp"), [3.4, 0.6, _S.read(_e, "v")]), _S.binary("*", _S.binary("*", 1.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "v"), _S.prop(_S.read(_e, "Math"), "PI"))])), (1 if _S.truth(_S.binary("<", _S.read(_e, "v"), 1)) else 0))))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("+", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), 3), _S.binary("*", _S.read(_e, "s"), 5)), _S.binary("-", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "dy")), 4), _S.binary("*", _S.read(_e, "ph"), 20)), 0, 10, _S.binary("+", _S.read(_e, "S"), (9 if _S.truth(_S.binary(">", _S.read(_e, "s"), 0)) else 0)), 2]))
	_S.define(_e, "q", _S.binary("+", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx"))]), _S.read(_e, "w")), _S.binary("*", _S.read(_e, "n"), 0.45)))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "v"), 1.15), func(): return _S.binary(">", _S.read(_e, "q"), 1.2))):
		return null
	_S.define(_e, "heat", _S.binary("+", _S.binary("-", _S.binary("*", _S.binary("-", 1, _S.read(_e, "v")), 1.15), _S.binary("*", _S.read(_e, "q"), 0.9)), _S.binary("*", _S.read(_e, "n"), 0.25)))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.95)):
		var _v18 = _S.scope(_e)
		_S.set_prop(_S.read(_v18, "out"), "c", (_S.prop(_S.read(_v18, "F"), 3) if _S.truth(_S.binary(">", _S.read(_v18, "heat"), 0.2)) else _S.prop(_S.read(_v18, "F"), 2)), "=", false)
		if _S.truth(_S.binary("<", _S.read(_v18, "heat"), _S.unary("-", 0.3))):
			_S.set_prop(_S.read(_v18, "out"), "a", 0.5, "=", false)
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.82)) else (_S.prop(_S.read(_e, "F"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.62)) else (_S.prop(_S.read(_e, "F"), 5) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.42)) else (_S.prop(_S.read(_e, "F"), 4) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.22)) else (_S.prop(_S.read(_e, "F"), 3) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.02)) else _S.prop(_S.read(_e, "F"), 2)))))), "=", false)
	return null
