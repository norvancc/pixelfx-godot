@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fire-tornado.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "pnoise", _S.import_value("fx/fire/_lib.js", "pnoise"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Fire tornado"}, {"desc": "A spinning funnel of fire: spiral bands turning round it, licks flung off its sides, a ring of flame whirling at its foot, embers orbiting it in and out of view."}, {"tags": ["fire", "tornado", "vortex", "spell", "aoe", "loop"]}, {"size": [120, 152]}, {"origin": [60, 136]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"height": 80}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "SPIN", 3)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "HT", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "N", _S.function_value(_e, "_f1"))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.25]))
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "cx", _S.function_value(_e, "_f2"))
	_S.define(_e, "rad", _S.function_value(_e, "_f3"))
	_S.define(_e, "spin", _S.function_value(_e, "_f4"))
	_S.define(_e, "orbit", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 500), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.define(_e, "embers", _S.function_value(_e, "_f7"))
	_S.define(_e, "ring", _S.function_value(_e, "_f9"))
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 20, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "floorLight"), [_S.read(_e, "p"), 0, 0.5, 40, 8, _S.read(_e, "GLOW"), 0.4])
	_S.call_value(_S.read(_e, "embers"), [false])
	_S.call_value(_S.read(_e, "ring"), [false])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "N"), [7, _S.binary("+", _S.read(_e, "S"), 1)]))))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "y", 0)
	while _S.truth(_S.binary(">=", _S.read(_v5, "y"), _S.binary("*", _S.unary("-", _S.read(_v5, "HT")), 1.2))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "v", _S.binary("/", _S.unary("-", _S.read(_v6, "y")), _S.read(_v6, "HT")))
		_S.define(_v6, "vv", _S.invoke(_S.read(_v6, "Math"), "min", [1, _S.read(_v6, "v")]))
		_S.define(_v6, "c", _S.call_value(_S.read(_v6, "cx"), [_S.read(_v6, "vv")]))
		_S.define(_v6, "r", _S.binary("*", _S.call_value(_S.read(_v6, "rad"), [_S.read(_v6, "vv")]), _S.binary("+", 1, _S.binary("*", 0.08, _S.call_value(_S.read(_v6, "N"), [3, _S.binary("+", _S.read(_v6, "S"), 2), _S.binary("*", _S.read(_v6, "y"), 0.1)])))))
		_S.define(_v6, "sp", _S.call_value(_S.read(_v6, "spin"), [_S.read(_v6, "v")]))
		_S.define(_v6, "cut", _S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v6, "v"), 0.72), 0.42)]))
		_S.define(_v6, "lickL", _S.binary("*", 0.3, _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.call_value(_S.read(_v6, "pnoise"), [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v6, "y")), 0.22), _S.binary("*", _S.read(_v6, "ph"), 18)), 18, _S.binary("+", _S.read(_v6, "S"), 3)])])))
		_S.define(_v6, "lickR", _S.binary("*", 0.3, _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.call_value(_S.read(_v6, "pnoise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v6, "y")), 0.22), _S.binary("*", _S.read(_v6, "ph"), 18)), 9), 18, _S.binary("+", _S.read(_v6, "S"), 4)])])))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "x", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("-", _S.read(_v7, "c"), _S.binary("*", _S.read(_v7, "r"), 1.35))]))
		while _S.truth(_S.binary("<=", _S.read(_v7, "x"), _S.invoke(_S.read(_v7, "Math"), "ceil", [_S.binary("+", _S.read(_v7, "c"), _S.binary("*", _S.read(_v7, "r"), 1.35))]))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v8, "x"), 0.5), _S.read(_v8, "c")), _S.read(_v8, "r")))
			_S.define(_v8, "edge", _S.binary("+", 1, (_S.read(_v8, "lickL") if _S.truth(_S.binary("<", _S.read(_v8, "dx"), 0)) else _S.read(_v8, "lickR"))))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.read(_v8, "dx")]), _S.read(_v8, "edge"))):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "x", 1, "+=", true)
				continue
			_S.define(_v8, "th", _S.invoke(_S.read(_v8, "Math"), "asin", [_S.call_value(_S.read(_v8, "clamp"), [_S.read(_v8, "dx"), _S.unary("-", 1), 1])]))
			_S.define(_v8, "depth", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "th")]))
			_S.define(_v8, "tear", _S.binary("*", 0.18, _S.call_value(_S.read(_v8, "pnoise"), [_S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v8, "y"), 0.45), _S.binary("*", _S.read(_v8, "dx"), 2)), _S.binary("*", _S.read(_v8, "ph"), 30)), 30, _S.binary("+", _S.read(_v8, "S"), 6)])))
			_S.define(_v8, "band", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("*", _S.binary("+", _S.binary("+", _S.read(_v8, "th"), _S.read(_v8, "sp")), _S.read(_v8, "tear")), 3)]))))
			_S.define(_v8, "streak", _S.binary("*", _S.binary("*", _S.read(_v8, "band"), _S.read(_v8, "band")), _S.read(_v8, "band")))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v8, "cut"), 0), func(): return _S.binary("<", _S.read(_v8, "band"), _S.binary("+", _S.binary("+", 0.35, _S.binary("*", _S.read(_v8, "cut"), 0.6)), _S.binary("*", 0.1, _S.call_value(_S.read(_v8, "pnoise"), [_S.binary("+", _S.binary("*", _S.read(_v8, "x"), 0.7), _S.binary("*", _S.read(_v8, "ph"), 20)), 20, _S.binary("+", _S.read(_v8, "S"), 5)])))))):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "x", 1, "+=", true)
				continue
			_S.define(_v8, "heat", _S.binary("-", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", 0.22, _S.binary("*", 0.36, _S.read(_v8, "depth"))), _S.binary("*", 0.5, _S.read(_v8, "streak"))), _S.binary("*", 0.22, _S.read(_v8, "vv"))), _S.binary("*", 0.1, _S.binary("-", 1, _S.read(_v8, "vv")))), _S.binary("*", 0.25, _S.read(_v8, "cut"))))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.read(_v8, "dx")]), 1)):
				_S.write(_v8, "heat", _S.binary("-", 0.3, _S.binary("*", _S.binary("-", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.read(_v8, "dx")]), 1), 1.5)), "=", false)
			_S.write(_v8, "heat", _S.read(_v8, "fl"), "*=", false)
			_S.define(_v8, "col", (_S.prop(_S.read(_v8, "H"), 0) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.95)) else (_S.prop(_S.read(_v8, "H"), 1) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.82)) else (_S.prop(_S.read(_v8, "H"), 2) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.7)) else (_S.prop(_S.read(_v8, "H"), 3) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.58)) else (_S.prop(_S.read(_v8, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.46)) else (_S.prop(_S.read(_v8, "H"), 5) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.34)) else (_S.prop(_S.read(_v8, "H"), 6) if _S.truth(_S.binary(">", _S.read(_v8, "heat"), 0.2)) else _S.prop(_S.read(_v8, "H"), 7)))))))))
			_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.read(_v8, "col")])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "x", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_v6, "y"), 10), 0), func(): return _S.binary("<=", _S.read(_v6, "v"), 1))):
			_S.invoke(_S.read(_v6, "p"), "glow", [_S.read(_v6, "c"), _S.read(_v6, "y"), _S.binary("+", _S.binary("*", _S.read(_v6, "r"), 2), 8), _S.read(_v6, "GLOW"), _S.binary("*", 0.22, _S.read(_v6, "fl"))])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "y", 1, "-=", true)
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 70, _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	_S.call_value(_S.read(_e, "ring"), [true])
	_S.call_value(_S.read(_e, "embers"), [true])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("*", _S.unary("-", _S.read(_e, "HT")), 0.5), 80, _S.read(_e, "GLOW"), _S.binary("*", 0.28, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 6), 18, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.coalesce(_S.arg(_args, 1), func(): return _S.read(_e, "t")))
	return _S.binary("+", _S.binary("*", _S.binary("*", 3.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "v"), 4.2), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2))])), _S.read(_e, "v")), _S.binary("*", _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), _S.read(_e, "TAU"))])), _S.read(_e, "v")))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("+", 3.5, _S.binary("*", 15, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), 1.35])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.coalesce(_S.arg(_args, 1), func(): return _S.read(_e, "t")))
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), _S.read(_e, "TAU")), _S.read(_e, "SPIN")), _S.binary("*", _S.read(_e, "v"), 5.5))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"v0": _S.invoke(_S.read(_e, "r"), "range", [0.02, 0.7])}, {"rise": _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.3])}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])}, {"w": _S.invoke(_S.read(_e, "r"), "range", [4, 7])}, {"out": _S.invoke(_S.read(_e, "r"), "range", [4, 12])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1.2, 2.4])}, {"big": _S.invoke(_S.read(_e, "r"), "chance", [0.2])}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("+", _S.prop(_S.read(_e, "q"), "v0"), _S.binary("*", _S.prop(_S.read(_e, "q"), "rise"), _S.read(_e, "age"))))
	_S.define(_e, "R", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "rad"), [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "v")])]), _S.prop(_S.read(_e, "q"), "out")), _S.binary("*", _S.read(_e, "age"), 4)))
	_S.define(_e, "a", _S.binary("+", _S.prop(_S.read(_e, "q"), "a"), _S.binary("*", _S.prop(_S.read(_e, "q"), "w"), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "cx"), [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "v")]), _S.read(_e, "t")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "v")), _S.read(_e, "HT")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "R")), 0.28)))
	_S.define(_e, "z", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.invoke(_S.read(_e, "orbit"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"z": _S.read(_e, "z")}, {"k": _S.read(_e, "k")}, {"vx": _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])), _S.read(_e, "R")), _S.prop(_S.read(_e, "q"), "w"))}, {"vy": _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R")), _S.prop(_S.read(_e, "q"), "w")), 0.28)}, {"big": _S.prop(_S.read(_e, "q"), "big")}])])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "front", _S.arg(_args, 0))
	for _v0 in _S.array(_S.read(_e, "orbit")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "e", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.logical("||", _S.binary("!==", _S.binary(">=", _S.prop(_S.read(_v2, "e"), "z"), 0), _S.read(_v2, "front")), func(): return _S.binary("<=", _S.prop(_S.read(_v2, "e"), "k"), 0))):
			continue
		_S.define(_v2, "sp", _S.logical("||", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.prop(_S.read(_v2, "e"), "vx"), _S.prop(_S.read(_v2, "e"), "vy")]), func(): return 1))
		_S.define(_v2, "L", _S.invoke(_S.read(_v2, "Math"), "min", [5, _S.binary("+", 1, _S.binary("*", _S.read(_v2, "sp"), 0.025))]))
		_S.define(_v2, "c", (_S.prop(_S.read(_v2, "EMB"), 0) if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "e"), "k"), 0.6)) else (_S.prop(_S.read(_v2, "EMB"), 1) if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "e"), "k"), 0.3)) else _S.prop(_S.read(_v2, "EMB"), 2))))
		_S.invoke(_S.read(_v2, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v2, "e"), "x"), _S.binary("*", _S.binary("/", _S.prop(_S.read(_v2, "e"), "vx"), _S.read(_v2, "sp")), _S.read(_v2, "L"))), _S.binary("-", _S.prop(_S.read(_v2, "e"), "y"), _S.binary("*", _S.binary("/", _S.prop(_S.read(_v2, "e"), "vy"), _S.read(_v2, "sp")), _S.read(_v2, "L"))), _S.prop(_S.read(_v2, "e"), "x"), _S.prop(_S.read(_v2, "e"), "y"), _S.function_value(_v2, "_f8")])
		if _S.truth(_S.read(_v2, "front")):
			_S.invoke(_S.read(_v2, "p"), "glow", [_S.prop(_S.read(_v2, "e"), "x"), _S.prop(_S.read(_v2, "e"), "y"), 4, _S.read(_v2, "c"), _S.binary("*", 0.4, _S.prop(_S.read(_v2, "e"), "k"))])
		else:
			_S.invoke(_S.read(_v2, "p"), "glow", [_S.prop(_S.read(_v2, "e"), "x"), _S.prop(_S.read(_v2, "e"), "y"), 3, _S.read(_v2, "c"), _S.binary("*", 0.15, _S.prop(_S.read(_v2, "e"), "k"))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "c") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else (_S.prop(_S.read(_e, "EMB"), 3) if _S.truth(_S.read(_e, "front")) else _S.prop(_S.read(_e, "H"), 7)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "front", _S.arg(_args, 0))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 12)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v4, "i"), 12), _S.read(_v4, "TAU")), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v4, "t"), _S.read(_v4, "D")), _S.read(_v4, "TAU")), 2)))
		_S.define(_v4, "z", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]))
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v4, "z"), 0), _S.read(_v4, "front"))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
			continue
		_S.define(_v4, "n", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v4, "S"), 3), _S.read(_v4, "i")), 19))
		_S.define(_v4, "R", _S.binary("+", 12, _S.binary("*", 2, _S.call_value(_S.read(_v4, "N"), [2, _S.read(_v4, "n")]))))
		_S.define(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "R")))
		_S.define(_v4, "y", _S.binary("*", _S.binary("*", _S.read(_v4, "z"), _S.read(_v4, "R")), 0.25))
		_S.define(_v4, "h", _S.binary("*", _S.binary("+", 5, _S.binary("*", 5, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v4, "N"), [5, _S.binary("+", _S.read(_v4, "n"), 1)]))))), (1 if _S.truth(_S.read(_v4, "front")) else 0.8)))
		_S.call_value(_S.read(_v4, "flameTongue"), [_S.read(_v4, "p"), _S.read(_v4, "x"), _S.read(_v4, "y"), _S.read(_v4, "h"), 1.6, _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.binary("+", _S.read(_v4, "a"), _S.binary("/", _S.prop(_S.read(_v4, "Math"), "PI"), 2))])), 3), _S.read(_v4, "N"), _S.read(_v4, "n"), _S.read(_v4, "H"), (_S.read(_v4, "LAYERS") if _S.truth(_S.read(_v4, "front")) else _S.read(_v4, "BACK_LAYERS"))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"a": _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1.2, 2])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [2.5, 4])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [12, 22]))}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "R", _S.binary("*", _S.call_value(_S.read(_e, "rad"), [1]), _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "age"), 0.5))))
	_S.define(_e, "a", _S.binary("+", _S.prop(_S.read(_e, "q"), "a"), _S.binary("*", _S.read(_e, "age"), 3)))
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "cx"), [1, _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "HT")), 2), _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "R")), 0.25)))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "SMOKE")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"v": _S.invoke(_S.read(_e, "r"), "range", [0.05, 0.95])}, {"side": _S.invoke(_S.read(_e, "r"), "sign", [])}, {"sp": _S.invoke(_S.read(_e, "r"), "range", [20, 50])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.5])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.8])}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "tb", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")))
	_S.define(_e, "x0", _S.binary("+", _S.call_value(_S.read(_e, "cx"), [_S.prop(_S.read(_e, "q"), "v"), _S.read(_e, "tb")]), _S.binary("*", _S.prop(_S.read(_e, "q"), "side"), _S.call_value(_S.read(_e, "rad"), [_S.prop(_S.read(_e, "q"), "v")]))))
	_S.define(_e, "y0", _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "q"), "v")), _S.read(_e, "HT")))
	var _v9 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.prop(_S.read(_e, "q"), "side"), _S.prop(_S.read(_e, "q"), "sp")), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "q"), "sp")), 0.6), _S.read(_e, "age"), 0, _S.unary("-", 60), 3, 3])
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	_S.call_value(_S.read(_e, "firePuff"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.prop(_S.read(_e, "q"), "f"), _S.read(_e, "H"), 0.1, _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "q"), "side")), 0.6), _S.unary("-", 0.8)])
	return null
