@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/energy-core.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "strokeArc", _S.import_value("fx/scifi/_lib.js", "strokeArc"))
	_S.define(_e, "ringPt", _S.function_value(_e, "_f0"))
	_S.define(_e, "setup", _S.function_value(_e, "_f1"))
	_S.define(_e, "plinth", _S.function_value(_e, "_f5"))
	_S.define(_e, "barDraw", _S.function_value(_e, "_f7"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f8"))
	_S.define(_e, "core", _S.function_value(_e, "_f9"))
	_S.define(_e, "ring", _S.function_value(_e, "_f13"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Energy core"}, {"desc": "A plasma core beating in a steel cage: it swells and throws a shock ring on each beat, two tilted rings orbit it, and arcs jump to the bars and spark."}, {"tags": ["scifi", "reactor", "core", "power", "plasma", "machine", "prop", "ground", "loop"]}, {"size": [112, 100]}, {"origin": [56, 88]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 35}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "CY", _S.unary("-", 36))
	_S.define(_e, "R0", 11)
	_S.define(_e, "RC", 24)
	_S.define(_e, "TOPY", _S.unary("-", 64))
	_S.define(_e, "BOTY", _S.unary("-", 9))
	_S.define(_e, "SLOT", 0.1)
	_S.define(_e, "NS", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.read(_e, "D"), _S.read(_e, "SLOT"))]))
	_S.define(_e, "BEATS", [[0.05, 1, true], [0.25, 0.5, false], [1.25, 1, true], [1.45, 0.5, false]])
	_S.define(_e, "env", _S.function_value(_e, "_f17"))
	_S.define(_e, "pulseAt", _S.function_value(_e, "_f18"))
	_S.define(_e, "BARS", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f20")]))
	_S.define(_e, "RINGS", [_S.merge([{"r": 17}, {"tilt": 1.15}, {"spin": _S.function_value(_e, "_f21")}]), _S.merge([{"r": 19}, {"tilt": _S.unary("-", 0.9)}, {"spin": _S.function_value(_e, "_f22")}])])
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "tilt", _S.arg(_args, 1))
	_S.define(_e, "spin", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])))
	_S.define(_e, "z0", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])))
	_S.define(_e, "y", _S.binary("*", _S.unary("-", _S.read(_e, "z0")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")])))
	_S.define(_e, "z", _S.binary("*", _S.read(_e, "z0"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")])))
	return [_S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))), _S.binary("-", _S.read(_e, "CY"), _S.read(_e, "y")), _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")])))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"ground": _S.function_value(_e, "_f2")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}, {"box": [_S.unary("-", 54), _S.unary("-", 98), 54, 11]}])]))
	_S.define(_e, "arcs", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "s"), _S.read(_v0, "NS"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "ts", _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "SLOT")))
		_S.define(_v1, "hot", _S.invoke(_S.read(_v1, "BEATS"), "some", [_S.function_value(_v1, "_f3")]))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "n"), (2 if _S.truth(_S.read(_v3, "hot")) else 1))):
			var _v4 = _S.scope(_v3)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v4, "hot")), func(): return _S.unary("!", _S.invoke(_S.read(_v4, "rn"), "chance", [0.4])))):
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "n", 1, "+=", true)
				continue
			_S.define(_v4, "bar", _S.invoke(_S.read(_v4, "rn"), "pick", [_S.invoke(_S.read(_v4, "BARS"), "filter", [_S.function_value(_v4, "_f4")])]))
			_S.define(_v4, "ty", _S.invoke(_S.read(_v4, "rn"), "range", [_S.binary("+", _S.read(_v4, "TOPY"), 8), _S.binary("-", _S.read(_v4, "BOTY"), 6)]))
			_S.define(_v4, "ang", _S.invoke(_S.read(_v4, "Math"), "atan2", [_S.binary("-", _S.read(_v4, "ty"), _S.read(_v4, "CY")), _S.prop(_S.read(_v4, "bar"), "x")]))
			_S.define(_v4, "sx", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "ang")]), _S.read(_v4, "R0")))
			_S.define(_v4, "sy", _S.binary("+", _S.read(_v4, "CY"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "ang")]), _S.read(_v4, "R0"))))
			_S.define(_v4, "path", _S.call_value(_S.read(_v4, "bolt"), [_S.read(_v4, "rn"), _S.read(_v4, "sx"), _S.read(_v4, "sy"), _S.binary("-", _S.prop(_S.read(_v4, "bar"), "x"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sign", [_S.prop(_S.read(_v4, "bar"), "x")]), 1.5)), _S.read(_v4, "ty"), _S.merge([{"jag": 0.3}, {"depth": 4}])]))
			_S.invoke(_S.read(_v4, "arcs"), "push", [_S.merge([{"s": _S.read(_v4, "s")}, {"path": _S.read(_v4, "path")}, {"fk": _S.call_value(_S.read(_v4, "forks"), [_S.read(_v4, "rn"), _S.read(_v4, "path"), _S.merge([{"count": _S.invoke(_S.read(_v4, "rn"), "int", [0, 1])}, {"len": 7}, {"jag": 0.35}])])}])])
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v5, "i"), 5)):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "a", _S.binary("+", _S.binary("+", _S.invoke(_S.read(_v6, "Math"), "atan2", [_S.binary("-", _S.read(_v6, "ty"), _S.read(_v6, "sy")), _S.binary("-", _S.prop(_S.read(_v6, "bar"), "x"), _S.read(_v6, "sx"))]), _S.prop(_S.read(_v6, "Math"), "PI")), _S.invoke(_S.read(_v6, "rn"), "range", [_S.unary("-", 1.2), 1.2])))
				_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "rn"), "range", [60, 170]))
				_S.invoke(_S.read(_v6, "g"), "add", [_S.read(_v6, "ts"), _S.prop(_S.read(_v6, "P"), "SPARK"), _S.prop(_S.read(_v6, "bar"), "x"), _S.read(_v6, "ty"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 40), _S.invoke(_S.read(_v6, "rn"), "range", [0.2, 0.5])])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "i", 1, "+=", true)
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "n", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "s", 1, "+=", true)
	for _v7 in _S.array(_S.read(_e, "BEATS")):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "b", _S.prop(_v9, 0))
		_S.define(_v8, "strong", _S.prop(_v9, 2))
		var _v10 = _S.scope(_v8)
		if _S.truth(_S.unary("!", _S.read(_v10, "strong"))):
			continue
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 12)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.invoke(_S.read(_v12, "rn"), "range", [0, _S.read(_v12, "TAU")]))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "rn"), "range", [40, 110]))
			_S.invoke(_S.read(_v12, "g"), "add", [_S.binary("+", _S.read(_v12, "b"), 0.02), _S.prop(_S.read(_v12, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "R0")), _S.binary("+", _S.read(_v12, "CY"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "R0"))), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.invoke(_S.read(_v12, "rn"), "range", [0.25, 0.5]), _S.invoke(_S.read(_v12, "rn"), "pick", [[_S.read(_v12, "WHITE"), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 5)]]), 0.7])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
	_S.define(_e, "v", _S.merge([{"C": _S.read(_e, "C")}, {"arcs": _S.read(_e, "arcs")}, {"g": _S.read(_e, "g")}]))
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "key"), _S.read(_e, "v")])
	return _S.read(_e, "v")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v2 = _S.arg(_args, 0)
	_S.define(_e, "b", _S.prop(_v2, 0))
	_S.define(_e, "strong", _S.prop(_v2, 2))
	return _S.logical("&&", _S.read(_e, "strong"), func(): return _S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "ts"), _S.read(_e, "b"), _S.read(_e, "D")]), 0.16))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary(">", _S.prop(_S.read(_e, "b"), "z"), _S.unary("-", 0.2))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "pulse", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 30), _S.unary("-", 10), 30, 2, _S.function_value(_e, "_f6")])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 7)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "x", _S.binary("+", _S.unary("-", 18), _S.binary("*", _S.read(_v14, "i"), 6)))
		_S.define(_v14, "k", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v14, "Math"), "cos", [_S.binary("*", _S.read(_v14, "TAU"), _S.binary("-", _S.binary("*", 2, _S.binary("/", _S.read(_v14, "t"), _S.read(_v14, "D"))), _S.binary("/", _S.read(_v14, "i"), 7)))]))))
		_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.unary("-", 3), (_S.read(_v14, "WHITE") if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.75)) else (_S.prop(_S.read(_v14, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.4)) else _S.prop(_S.read(_v14, "C"), 2)))])
		if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.6)):
			_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.unary("-", 3), 4, _S.prop(_S.read(_v14, "C"), 4), _S.binary("*", 0.3, _S.read(_v14, "k"))])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 8), 26, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.25, _S.binary("*", 0.3, _S.read(_e, "pulse")))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "top", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 29), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 7), 4), 2)), 1))
	_S.define(_e, "side", _S.logical("&&", _S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 29), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 7))), func(): return _S.binary("<=", _S.read(_e, "y"), 0)))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "top")), func(): return _S.unary("!", _S.read(_e, "side")))):
		return null
	if _S.truth(_S.read(_e, "top")):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 29), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 7), 4), 2)), 0.82)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 8))) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "H"), 3)))), "=", false)
	else:
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 28), func(): return _S.binary("===", _S.read(_e, "y"), 0))) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary("===", _S.read(_e, "y"), _S.unary("-", 6))) else (_S.prop(_S.read(_e, "H"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 14))) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "x"), 14)) else _S.prop(_S.read(_e, "H"), 2))))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "pulse", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "lit", (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.read(_e, "back")) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "pulse"), 0.5)) else _S.prop(_S.read(_e, "C"), 5))))
	_S.define(_e, "inward", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sign", [_S.prop(_S.read(_e, "b"), "x")])))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "y", _S.binary("+", _S.read(_v15, "TOPY"), 2))
	while _S.truth(_S.binary("<", _S.read(_v15, "y"), _S.read(_v15, "BOTY"))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v16, "i"), 1)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "face", _S.binary("===", _S.read(_v17, "i"), _S.read(_v17, "inward")))
			_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v17, "b"), "x"), _S.read(_v17, "i")), _S.read(_v17, "y"), ((_S.read(_v17, "lit") if _S.truth(_S.read(_v17, "face")) else _S.prop(_S.read(_v17, "H"), 1)) if _S.truth(_S.read(_v17, "back")) else (_S.read(_v17, "lit") if _S.truth(_S.read(_v17, "face")) else (_S.prop(_S.read(_v17, "H"), 3) if _S.truth(_S.binary("===", _S.read(_v17, "i"), 0)) else _S.prop(_S.read(_v17, "H"), 1))))])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "y", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "near", _S.arg(_args, 5))
	_S.define(_e, "pulse", _S.arg(_args, 6))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	_S.define(_v18, "n", _S.invoke(_S.read(_v18, "Math"), "ceil", [_S.binary("*", _S.read(_v18, "rx"), 8)]))
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.read(_v18, "n"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "g", _S.binary("*", _S.binary("/", _S.read(_v19, "i"), _S.read(_v19, "n")), _S.read(_v19, "TAU")))
		_S.define(_v19, "s", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "g")]))
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v19, "s"), 0), _S.read(_v19, "near"))):
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
			continue
		_S.define(_v19, "x", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "g")]), _S.read(_v19, "rx")))
		_S.define(_v19, "yy", _S.binary("+", _S.read(_v19, "y"), _S.binary("*", _S.read(_v19, "s"), 4)))
		_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.read(_v19, "yy"), ((_S.prop(_S.read(_v19, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v19, "s"), 0.6)) else _S.prop(_S.read(_v19, "H"), 3)) if _S.truth(_S.read(_v19, "near")) else _S.prop(_S.read(_v19, "H"), 1))])
		_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.binary("+", _S.read(_v19, "yy"), 1), (_S.prop(_S.read(_v19, "H"), 1) if _S.truth(_S.read(_v19, "near")) else _S.prop(_S.read(_v19, "H"), 0))])
		if _S.truth(_S.logical("&&", _S.read(_v19, "near"), func(): return _S.binary("<", _S.read(_v19, "s"), 0.3))):
			_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.binary("-", _S.read(_v19, "yy"), 1), (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v19, "pulse"), 0.5)) else _S.prop(_S.read(_v19, "C"), 3))])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "R", _S.arg(_args, 3))
	_S.define(_e, "pulse", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "R")), 2), _S.binary("-", _S.binary("-", _S.read(_e, "CY"), _S.read(_e, "R")), 2), _S.binary("+", _S.read(_e, "R"), 2), _S.binary("+", _S.binary("+", _S.read(_e, "CY"), _S.read(_e, "R")), 2), _S.function_value(_e, "_f10")])
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 15)]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), _S.read(_e, "f"), 5]))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 3)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v21, "i"), 3), _S.read(_v21, "TAU")), _S.binary("*", _S.read(_v21, "f"), 0.7)), _S.invoke(_S.read(_v21, "r"), "range", [_S.unary("-", 0.4), 0.4])))
		_S.define(_v21, "pts", _S.call_value(_S.read(_v21, "bolt"), [_S.read(_v21, "r"), 0, _S.read(_v21, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "R")), 0.88), _S.binary("+", _S.read(_v21, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "R")), 0.88)), _S.merge([{"jag": 0.32}, {"depth": 3}])]))
		_S.invoke(_S.read(_v21, "p"), "polyline", [_S.read(_v21, "pts"), _S.function_value(_v21, "_f11")])
		var _v22 = _S.prop(_S.read(_v21, "pts"), _S.binary("-", _S.prop(_S.read(_v21, "pts"), "length"), 1))
		_S.define(_v21, "ex", _S.prop(_v22, 0))
		_S.define(_v21, "ey", _S.prop(_v22, 1))
		_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "ex"), _S.read(_v21, "ey"), _S.read(_v21, "WHITE")])
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.read(_v21, "ex"), _S.read(_v21, "ey"), 4, _S.prop(_S.read(_v21, "C"), 5), 0.4])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "CY"), _S.binary("+", 1.8, _S.binary("*", _S.read(_e, "pulse"), 2)), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "CY"), _S.binary("+", 3, _S.binary("*", _S.read(_e, "pulse"), 2)), _S.function_value(_e, "_f12"), 0.0001])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.45), _S.binary("-", _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "R"), 0.55)), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.45), 1), _S.binary("-", _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "R"), 0.55)), _S.prop(_S.read(_e, "C"), 6)])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY")))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy")))]), _S.read(_e, "R")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1.1)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return _S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 2), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.9)):
		return _S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dy"), _S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.3)), func(): return _S.binary("<", _S.read(_e, "dx"), _S.binary("*", _S.read(_e, "R"), 0.3)))) else _S.prop(_S.read(_e, "C"), 4)), "=", false)
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "n", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "a"), _S.read(_e, "TAU")), 6), _S.binary("*", _S.read(_e, "ph"), 6)), _S.binary("*", _S.read(_e, "d"), 1.5)), _S.binary("-", _S.binary("*", _S.read(_e, "d"), 2.2), _S.binary("*", _S.read(_e, "ph"), 4)), 6, 4, _S.read(_e, "seed"), 2]))))
	_S.define(_e, "band", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "n"), 0.5)]), _S.binary("+", 0.05, _S.binary("*", 0.05, _S.read(_e, "pulse")))))
	_S.define(_e, "heat", _S.binary("+", _S.binary("**", _S.binary("-", 1, _S.read(_e, "d")), 2), _S.binary("*", _S.read(_e, "pulse"), 0.45)))
	if _S.truth(_S.read(_e, "band")):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.5)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.2)) else _S.prop(_S.read(_e, "C"), 5))), "=", false)
	else:
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.7)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.42)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.2)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "n"), 0.5)) else _S.prop(_S.read(_e, "C"), 1))))), "=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else _S.prop(_S.read(_e, "C"), 6))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.6)) else _S.read(_e, "WHITE"))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "rg", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.define(_e, "pulse", _S.arg(_args, 5))
	_S.define(_e, "spin", _S.invoke(_S.read(_e, "rg"), "spin", [_S.read(_e, "t")]))
	_S.define(_e, "bead", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 3))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", 0)
	_S.define(_v23, "n", _S.invoke(_S.read(_v23, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v23, "rg"), "r"), 9)]))
	while _S.truth(_S.binary("<", _S.read(_v23, "i"), _S.read(_v23, "n"))):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "a", _S.binary("*", _S.binary("/", _S.read(_v24, "i"), _S.read(_v24, "n")), _S.read(_v24, "TAU")))
		var _v25 = _S.call_value(_S.read(_v24, "ringPt"), [_S.prop(_S.read(_v24, "rg"), "r"), _S.prop(_S.read(_v24, "rg"), "tilt"), _S.read(_v24, "spin"), _S.read(_v24, "a")])
		_S.define(_v24, "x", _S.prop(_v25, 0))
		_S.define(_v24, "y", _S.prop(_v25, 1))
		_S.define(_v24, "z", _S.prop(_v25, 2))
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v24, "z"), 0), _S.read(_v24, "front"))):
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
			continue
		_S.define(_v24, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("/", _S.binary("-", _S.read(_v24, "a"), _S.read(_v24, "bead")), _S.read(_v24, "TAU")), 1), 1), 1))
		_S.define(_v24, "head", _S.binary(">", _S.read(_v24, "u"), 0.9))
		_S.invoke(_S.read(_v24, "p"), "px", [_S.read(_v24, "x"), _S.read(_v24, "y"), (_S.read(_v24, "WHITE") if _S.truth(_S.read(_v24, "head")) else (_S.prop(_S.read(_v24, "C"), 3) if _S.truth(_S.unary("!", _S.read(_v24, "front"))) else (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v24, "z"), _S.binary("*", 0.5, _S.prop(_S.read(_v24, "rg"), "r"))), func(): return _S.binary(">", _S.read(_v24, "pulse"), 0.6))) else _S.prop(_S.read(_v24, "C"), 5))))])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "front")):
		var _v26 = _S.scope(_e)
		var _v27 = _S.call_value(_S.read(_v26, "ringPt"), [_S.prop(_S.read(_v26, "rg"), "r"), _S.prop(_S.read(_v26, "rg"), "tilt"), _S.read(_v26, "spin"), _S.read(_v26, "bead")])
		_S.define(_v26, "x", _S.prop(_v27, 0))
		_S.define(_v26, "y", _S.prop(_v27, 1))
		_S.invoke(_S.read(_v26, "p"), "glow", [_S.read(_v26, "x"), _S.read(_v26, "y"), 6, _S.prop(_S.read(_v26, "C"), 5), 0.5])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "pulse", _S.call_value(_S.read(_e, "pulseAt"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), _S.read(_e, "BOTY"), _S.read(_e, "RC"), _S.read(_e, "H"), _S.read(_e, "C"), false, _S.read(_e, "pulse")])
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), _S.read(_e, "TOPY"), _S.read(_e, "RC"), _S.read(_e, "H"), _S.read(_e, "C"), false, _S.read(_e, "pulse")])
	for _v28 in _S.array(_S.read(_e, "BARS")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "b", _v28)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v29, "b"), "z"), 0)):
			_S.call_value(_S.read(_v29, "barDraw"), [_S.read(_v29, "p"), _S.read(_v29, "b"), _S.read(_v29, "C"), _S.read(_v29, "H"), _S.read(_v29, "pulse"), true])
	for _v30 in _S.array(_S.read(_e, "RINGS")):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "rg", _v30)
		_S.call_value(_S.read(_v31, "ring"), [_S.read(_v31, "p"), _S.read(_v31, "t"), _S.read(_v31, "rg"), _S.read(_v31, "C"), false, _S.read(_v31, "pulse")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	var _v32 = _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "o")])
	_S.define(_e, "C", _S.prop(_v32, "C"))
	_S.define(_e, "arcs", _S.prop(_v32, "arcs"))
	_S.define(_e, "g", _S.prop(_v32, "g"))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "pulse", _S.call_value(_S.read(_e, "pulseAt"), [_S.read(_e, "t")]))
	_S.define(_e, "R", _S.binary("*", _S.read(_e, "R0"), _S.binary("+", 1, _S.binary("*", 0.14, _S.read(_e, "pulse")))))
	_S.call_value(_S.read(_e, "plinth"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "H"), _S.read(_e, "t"), _S.read(_e, "pulse")])
	_S.call_value(_S.read(_e, "core"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "R"), _S.read(_e, "pulse"), _S.prop(_S.read(_e, "o"), "seed")])
	for _v33 in _S.array(_S.read(_e, "RINGS")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "rg", _v33)
		_S.call_value(_S.read(_v34, "ring"), [_S.read(_v34, "p"), _S.read(_v34, "t"), _S.read(_v34, "rg"), _S.read(_v34, "C"), true, _S.read(_v34, "pulse")])
	for _v35 in _S.array(_S.read(_e, "BARS")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "b", _v35)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v36, "b"), "z"), 0)):
			_S.call_value(_S.read(_v36, "barDraw"), [_S.read(_v36, "p"), _S.read(_v36, "b"), _S.read(_v36, "C"), _S.read(_v36, "H"), _S.read(_v36, "pulse"), false])
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), _S.read(_e, "BOTY"), _S.read(_e, "RC"), _S.read(_e, "H"), _S.read(_e, "C"), true, _S.read(_e, "pulse")])
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), _S.read(_e, "TOPY"), _S.read(_e, "RC"), _S.read(_e, "H"), _S.read(_e, "C"), true, _S.read(_e, "pulse")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 15), _S.binary("-", _S.read(_e, "TOPY"), 7), 15, _S.read(_e, "TOPY"), _S.function_value(_e, "_f16")])
	_S.invoke(_S.read(_e, "p"), "px", [0, _S.binary("-", _S.read(_e, "TOPY"), 7), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "pulse"), 0.4)) else _S.prop(_S.read(_e, "C"), 5))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "TOPY"), 7), 5, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.4, _S.binary("*", 0.4, _S.read(_e, "pulse")))])
	_S.define(_e, "s", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SLOT"))]), _S.read(_e, "NS")))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SLOT"))]), _S.read(_e, "SLOT"))), _S.read(_e, "SLOT"))))
	for _v37 in _S.array(_S.read(_e, "arcs")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "a", _v37)
		var _v39 = _S.scope(_v38)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v39, "a"), "s"), _S.read(_v39, "s"))):
			continue
		_S.call_value(_S.read(_v39, "strokeArc"), [_S.read(_v39, "p"), _S.prop(_S.read(_v39, "a"), "path"), [_S.prop(_S.read(_v39, "C"), 2), _S.prop(_S.read(_v39, "C"), 5), _S.prop(_S.read(_v39, "C"), 4)], _S.read(_v39, "k")])
		for _v40 in _S.array(_S.prop(_S.read(_v39, "a"), "fk")):
			var _v41 = _S.scope(_v39)
			_S.define(_v41, "f", _v40)
			_S.call_value(_S.read(_v41, "strokeArc"), [_S.read(_v41, "p"), _S.read(_v41, "f"), [_S.prop(_S.read(_v41, "C"), 2), _S.prop(_S.read(_v41, "C"), 5), _S.prop(_S.read(_v41, "C"), 4)], _S.read(_v41, "k"), 0.6])
		var _v42 = _S.prop(_S.prop(_S.read(_v39, "a"), "path"), _S.binary("-", _S.prop(_S.prop(_S.read(_v39, "a"), "path"), "length"), 1))
		_S.define(_v39, "ex", _S.prop(_v42, 0))
		_S.define(_v39, "ey", _S.prop(_v42, 1))
		_S.invoke(_S.read(_v39, "p"), "glow", [_S.read(_v39, "ex"), _S.read(_v39, "ey"), 8, _S.prop(_S.read(_v39, "C"), 5), _S.binary("*", 0.6, _S.read(_v39, "k"))])
	for _v43 in _S.array(_S.read(_e, "BEATS")):
		var _v44 = _S.scope(_e)
		var _v45 = _v43
		_S.define(_v44, "b", _S.prop(_v45, 0))
		_S.define(_v44, "strong", _S.prop(_v45, 2))
		var _v46 = _S.scope(_v44)
		_S.define(_v46, "a", _S.call_value(_S.read(_v46, "since"), [_S.read(_v46, "t"), _S.read(_v46, "b"), _S.read(_v46, "D")]))
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v46, "strong")), func(): return _S.binary(">", _S.read(_v46, "a"), 0.45))):
			continue
		_S.define(_v46, "q", _S.binary("/", _S.read(_v46, "a"), 0.45))
		_S.define(_v46, "r", _S.binary("+", _S.read(_v46, "R0"), _S.binary("*", 34, _S.invoke(_S.read(_v46, "ease"), "outCubic", [_S.read(_v46, "q")]))))
		_S.invoke(_S.read(_v46, "p"), "ring", [0, _S.read(_v46, "CY"), _S.read(_v46, "r"), _S.invoke(_S.read(_v46, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v46, "q")))]), (_S.read(_v46, "WHITE") if _S.truth(_S.binary("<", _S.read(_v46, "q"), 0.25)) else (_S.prop(_S.read(_v46, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v46, "q"), 0.5)) else _S.prop(_S.read(_v46, "C"), 5))), _S.binary("-", 1.1, _S.read(_v46, "q"))])
		_S.invoke(_S.read(_v46, "p"), "glowRing", [0, _S.read(_v46, "CY"), _S.read(_v46, "r"), 6, _S.prop(_S.read(_v46, "C"), 4), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v46, "q")))])
	_S.invoke(_S.invoke(_S.read(_e, "g"), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.2, _S.binary("*", 0.3, _S.read(_e, "pulse")))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), 9, _S.read(_e, "WHITE"), _S.binary("+", 0.35, _S.binary("*", 0.4, _S.read(_e, "pulse")))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 14.5), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "TOPY")), 6.5), 2)))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "l", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "x")), 0.05), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "TOPY")), 0.12)))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.8)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.55)) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.3)) else _S.prop(_S.read(_e, "H"), 3)))), "=", false)
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return (_S.binary("/", _S.read(_e, "a"), 0.03) if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.03)) else _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "a"), 0.03)), 0.12)]))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "BEATS"), "reduce", [_S.function_value(_e, "_f19"), 0])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "m", _S.arg(_args, 0))
	var _v47 = _S.arg(_args, 1)
	_S.define(_e, "b", _S.prop(_v47, 0))
	_S.define(_e, "k", _S.prop(_v47, 1))
	return _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "m"), _S.binary("*", _S.read(_e, "k"), _S.call_value(_S.read(_e, "env"), [_S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.read(_e, "b"), _S.read(_e, "D")])]))])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.read(_e, "TAU")), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 6)))
	return _S.merge([{"x": _S.binary("*", _S.read(_e, "RC"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"z": _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])}])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "TAU"), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.unary("-", _S.read(_e, "TAU")), 2), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D"))), 1)
