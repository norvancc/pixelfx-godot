@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/flame-pillar.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "simDraw", _S.import_value("fx/fire/_lib.js", "simDraw"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "rock", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Flame pillar"}, {"desc": "The floor cracks and glows, a column of fire erupts white-hot and roars, spewing embers and shedding flame, then collapses into rolling smoke."}, {"tags": ["fire", "pillar", "eruption", "spell", "ground", "one-shot"]}, {"size": [184, 256]}, {"origin": [92, 232]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"height": 140}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "ERUPT", 0.55)
	_S.define(_e, "RISE", 0.12)
	_S.define(_e, "FALL", 1.95)
	_S.define(_e, "GONE", 2.45)
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "rgb"), [255, 176, 96]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.write(_e, "c", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]), "=", false)
	return _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "c")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.2]), _S.call_value(_S.read(_e, "rgb"), [150, 140, 150]), 0.3])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.75)))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f2")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.15), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.9))):
		return null
	_S.define(_e, "lit", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "lx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ly"))))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "OUTLINE") if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))) else (_S.prop(_S.read(_e, "st"), "light") if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.4))) else (_S.prop(_S.read(_e, "st"), "shade") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.6)) else _S.prop(_S.read(_e, "st"), "body")))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "column", _S.function_value(_e, "_f4"))
	_S.define(_e, "cracksDraw", _S.function_value(_e, "_f6"))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "HMAX", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "S", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13))
	_S.define(_e, "cracks", [])
	_S.define(_e, "crack", _S.function_value(_e, "_f8"))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 9)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v19, "i"), 9), _S.read(_v19, "TAU")), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v19, "pts", _S.call_value(_S.read(_v19, "crack"), [_S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1]), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v19, "a"), _S.invoke(_S.read(_v19, "R"), "range", [20, 40]), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.16]), 1]))
		_S.define(_v19, "j", _S.binary("+", 3, _S.invoke(_S.read(_v19, "R"), "int", [0, _S.binary("-", _S.prop(_S.read(_v19, "pts"), "length"), 6)])))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v19, "pts"), "length"), 8)):
			_S.call_value(_S.read(_v19, "crack"), [_S.prop(_S.prop(_S.read(_v19, "pts"), _S.read(_v19, "j")), 0), _S.prop(_S.prop(_S.read(_v19, "pts"), _S.read(_v19, "j")), 1), _S.binary("+", _S.read(_v19, "a"), _S.binary("*", _S.invoke(_S.read(_v19, "R"), "sign", []), _S.invoke(_S.read(_v19, "R"), "range", [0.5, 1]))), _S.invoke(_S.read(_v19, "R"), "range", [6, 14]), _S.binary("+", 0.18, _S.invoke(_S.read(_v19, "R"), "range", [0, 0.15])), 0])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f9")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "erupted", false)
	_S.define(_e, "fell", false)
	_S.define(_e, "height", _S.function_value(_e, "_f10"))
	_S.define(_e, "width", _S.function_value(_e, "_f11"))
	_S.define(_e, "heat", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "t")]))
	_S.define(_e, "w0", _S.call_value(_S.read(_e, "width"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "h"), 1), func(): return _S.binary("<", _S.read(_e, "w0"), 0.3))):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FALL"), 0.25))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "k", _S.call_value(_S.read(_v0, "clamp"), [_S.binary("/", _S.read(_v0, "w0"), 12)]))
		_S.define(_v0, "NZ", _S.function_value(_v0, "_f5"))
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 5)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "n", _S.binary("*", _S.binary("+", _S.read(_v2, "S"), _S.read(_v2, "i")), 17))
			_S.define(_v2, "dx", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v2, "i"), 2), _S.read(_v2, "w0")), 0.4))
			_S.define(_v2, "th", _S.binary("*", _S.binary("*", _S.binary("+", 12, _S.binary("*", 12, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v2, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v2, "t"), 3.3), _S.read(_v2, "i")), _S.read(_v2, "n")]))))), _S.read(_v2, "k")), (1.2 if _S.truth(_S.binary("===", _S.read(_v2, "i"), 2)) else (0.6 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v2, "i"), 4), 0)) else 0.9))))
			_S.call_value(_S.read(_v2, "flameTongue"), [_S.read(_v2, "p"), _S.binary("+", _S.read(_v2, "dx"), _S.binary("*", _S.call_value(_S.read(_v2, "noise"), [_S.binary("*", _S.read(_v2, "t"), 2), _S.binary("+", _S.read(_v2, "n"), 2)]), 1.5)), _S.binary("+", _S.unary("-", _S.read(_v2, "h")), 12), _S.read(_v2, "th"), _S.binary("*", _S.binary("*", 3.4, _S.read(_v2, "k")), (0.7 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v2, "i"), 4), 0)) else 1)), _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v2, "dx")), 0.3), _S.binary("*", _S.call_value(_S.read(_v2, "noise"), [_S.binary("*", _S.read(_v2, "t"), 2.2), _S.binary("+", _S.read(_v2, "n"), 1)]), 3)), _S.read(_v2, "NZ"), _S.read(_v2, "n"), _S.read(_v2, "H"), _S.read(_v2, "LAYERS")])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "lvlC", [_S.prop(_S.read(_e, "H"), 0), _S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5), _S.prop(_S.read(_e, "H"), 6), _S.prop(_S.read(_e, "H"), 7)])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", 0)
	while _S.truth(_S.binary(">=", _S.read(_v3, "y"), _S.unary("-", _S.read(_v3, "h")))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "v", _S.binary("/", _S.unary("-", _S.read(_v4, "y")), _S.read(_v4, "h")))
		_S.define(_v4, "cx", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v4, "noise"), [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v4, "y")), 0.04), _S.binary("*", _S.read(_v4, "t"), 1.6)), _S.binary("+", _S.read(_v4, "S"), 2)]), 1.6), _S.read(_v4, "v")))
		_S.define(_v4, "foot", _S.binary("+", 1, _S.binary("*", 0.7, _S.binary("**", _S.invoke(_S.read(_v4, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.unary("-", _S.read(_v4, "y")), 12))]), 2))))
		_S.define(_v4, "top", _S.binary("-", 1, _S.binary("*", _S.call_value(_S.read(_v4, "smooth"), [0.82, 1, _S.read(_v4, "v")]), 0.7)))
		_S.define(_v4, "wl", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v4, "w0"), _S.read(_v4, "foot")), _S.read(_v4, "top")), _S.binary("+", 1, _S.binary("*", 0.65, _S.binary("**", _S.invoke(_S.read(_v4, "Math"), "max", [0, _S.call_value(_S.read(_v4, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v4, "y"), 0.2), _S.binary("*", _S.read(_v4, "t"), 8)), _S.binary("+", _S.read(_v4, "S"), 3)])]), 1.5)))))
		_S.define(_v4, "wr", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v4, "w0"), _S.read(_v4, "foot")), _S.read(_v4, "top")), _S.binary("+", 1, _S.binary("*", 0.65, _S.binary("**", _S.invoke(_S.read(_v4, "Math"), "max", [0, _S.call_value(_S.read(_v4, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v4, "y"), 0.2), _S.binary("*", _S.read(_v4, "t"), 8)), _S.binary("+", _S.read(_v4, "S"), 4)])]), 1.5)))))
		_S.define(_v4, "pulse", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v4, "y")), 0.032), _S.binary("*", _S.read(_v4, "t"), 3.6)), 1), 0.09)) else 0))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.read(_v5, "cx"), _S.binary("*", _S.read(_v5, "wl"), 1.15))]))
		while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("+", _S.read(_v5, "cx"), _S.binary("*", _S.read(_v5, "wr"), 1.15))]))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "dx", _S.binary("-", _S.binary("+", _S.read(_v6, "x"), 0.5), _S.read(_v6, "cx")))
			_S.define(_v6, "q", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "dx")]), (_S.read(_v6, "wl") if _S.truth(_S.binary("<", _S.read(_v6, "dx"), 0)) else _S.read(_v6, "wr"))))
			if _S.truth(_S.binary(">", _S.read(_v6, "q"), 1.15)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			_S.define(_v6, "lvl", (0 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.12)) else (1 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.26)) else (2 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.42)) else (3 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.56)) else (4 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.7)) else (5 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.84)) else (6 if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.96)) else 7))))))))
			for _v7 in _S.array(_S.read(_v6, "strands")):
				var _v8 = _S.scope(_v6)
				_S.define(_v8, "s", _v7)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.read(_v8, "dx"), _S.read(_v8, "w0")), _S.prop(_S.read(_v8, "s"), "o")), _S.binary("*", 0.06, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v8, "t"), _S.prop(_S.read(_v8, "s"), "f")), 3), _S.binary("*", _S.prop(_S.read(_v8, "s"), "o"), 9))])))]), _S.prop(_S.read(_v8, "s"), "w"))):
					_S.write(_v8, "lvl", _S.invoke(_S.read(_v8, "Math"), "max", [0, _S.binary("-", _S.read(_v8, "lvl"), 1)]), "=", false)
			_S.write(_v6, "lvl", _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.binary("-", _S.read(_v6, "lvl"), _S.read(_v6, "pulse"))]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v6, "lvl"), 7), func(): return _S.binary("<", _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("*", _S.read(_v6, "t"), 20)])]), 0.5))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "lvlC"), _S.read(_v6, "lvl"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v4, "y"), 12), 0)):
			_S.invoke(_S.read(_v4, "p"), "glow", [_S.read(_v4, "cx"), _S.read(_v4, "y"), _S.binary("+", _S.binary("*", _S.read(_v4, "w0"), 2.4), 8), _S.read(_v4, "GLOW"), _S.binary("*", 0.28, _S.call_value(_S.read(_v4, "clamp"), [_S.binary("/", _S.read(_v4, "w0"), 12)]))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "-=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("*", _S.unary("-", _S.read(_e, "h")), 0.45), 92, _S.read(_e, "GLOW"), _S.binary("*", 0.3, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "w0"), 12)]))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "off", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "rate")), _S.read(_e, "off")), _S.read(_e, "seed")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), _S.unary("-", 0.05))):
		return null
	for _v9 in _S.array(_S.read(_e, "cracks")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "c", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "n", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.prop(_S.prop(_S.read(_v11, "c"), "pts"), "length"), _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v11, "t"), _S.prop(_S.read(_v11, "c"), "t0")), _S.prop(_S.read(_v11, "c"), "grow"))]))]))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "n"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "u", _S.binary("/", _S.read(_v13, "i"), _S.prop(_S.prop(_S.read(_v13, "c"), "pts"), "length")))
			_S.define(_v13, "hot", _S.binary("*", _S.read(_v13, "k"), _S.binary("-", 1, _S.binary("*", 0.45, _S.read(_v13, "u")))))
			var _v14 = _S.prop(_S.prop(_S.read(_v13, "c"), "pts"), _S.binary("-", _S.read(_v13, "i"), 1))
			_S.define(_v13, "x0", _S.prop(_v14, 0))
			_S.define(_v13, "y0", _S.prop(_v14, 1))
			var _v15 = _S.prop(_S.prop(_S.read(_v13, "c"), "pts"), _S.read(_v13, "i"))
			_S.define(_v13, "x1", _S.prop(_v15, 0))
			_S.define(_v13, "y1", _S.prop(_v15, 1))
			if _S.truth(_S.binary("<", _S.read(_v13, "hot"), 0)):
				var _v16 = _S.scope(_v13)
				_S.define(_v16, "a", _S.binary("+", 1, _S.binary("*", _S.read(_v16, "hot"), 3)))
				if _S.truth(_S.binary(">", _S.read(_v16, "a"), 0)):
					_S.invoke(_S.read(_v16, "p"), "line", [_S.read(_v16, "x0"), _S.read(_v16, "y0"), _S.read(_v16, "x1"), _S.read(_v16, "y1"), _S.read(_v16, "SOOT"), _S.read(_v16, "a")])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "col", (_S.prop(_S.read(_v13, "H"), 1) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.85)) else (_S.prop(_S.read(_v13, "H"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.65)) else (_S.prop(_S.read(_v13, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.45)) else (_S.prop(_S.read(_v13, "H"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.25)) else (_S.prop(_S.read(_v13, "H"), 6) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.1)) else _S.prop(_S.read(_v13, "H"), 7)))))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v13, "c"), "w"), func(): return _S.binary("<", _S.read(_v13, "i"), _S.binary("*", _S.prop(_S.prop(_S.read(_v13, "c"), "pts"), "length"), 0.5))), func(): return _S.binary(">", _S.read(_v13, "hot"), 0.2))):
				_S.last([_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.binary("+", _S.read(_v13, "y0"), 1), _S.read(_v13, "x1"), _S.binary("+", _S.read(_v13, "y1"), 1), (_S.prop(_S.read(_v13, "H"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "hot"), 0.6)) else _S.prop(_S.read(_v13, "H"), 6))]), _S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.binary("-", _S.read(_v13, "y0"), 1), _S.read(_v13, "x1"), _S.binary("-", _S.read(_v13, "y1"), 1), _S.prop(_S.read(_v13, "H"), 7)])])
			_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.read(_v13, "y0"), _S.read(_v13, "x1"), _S.read(_v13, "y1"), _S.read(_v13, "col")])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v13, "i"), 2), 0)):
				_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x1"), _S.read(_v13, "y1"), _S.binary("+", 5, _S.binary("*", 7, _S.read(_v13, "hot"))), _S.read(_v13, "GLOW"), _S.binary("*", 0.3, _S.read(_v13, "hot"))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.call_value(_S.read(_e, "floorLight"), [_S.read(_e, "p"), 0, 0.5, 44, 8, _S.read(_e, "GLOW"), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "t0", _S.arg(_args, 4))
	_S.define(_e, "w", _S.arg(_args, 5))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y")]])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "d", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "d"), _S.read(_v17, "len"))):
		_S.last([_S.write(_v17, "a", _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 0.55), 0.55]), "+=", false), _S.write(_v17, "x", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 2), "+=", false), _S.write(_v17, "y", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), 0.76), "+=", false), _S.invoke(_S.read(_v17, "pts"), "push", [[_S.read(_v17, "x"), _S.read(_v17, "y")]])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "d", 2, "+=", false)
	_S.invoke(_S.read(_e, "cracks"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"t0": _S.read(_e, "t0")}, {"grow": _S.invoke(_S.read(_e, "R"), "range", [0.22, 0.36])}, {"w": _S.read(_e, "w")}])])
	return _S.read(_e, "pts")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"o": _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "S"), 1]), 0.5), 1.4)}, {"w": _S.binary("+", 0.05, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "S"), 2]), 0.06))}, {"f": _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "S"), 3]), 2))}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "ERUPT"))) else (_S.binary("*", _S.read(_e, "HMAX"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "ERUPT")), _S.read(_e, "RISE"))])) if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.binary("+", _S.read(_e, "ERUPT"), _S.read(_e, "RISE")))) else (_S.binary("*", _S.read(_e, "HMAX"), _S.binary("+", 1, _S.binary("*", 0.05, _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "tt"), 3), _S.read(_e, "S")])))) if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "FALL"))) else _S.binary("*", _S.read(_e, "HMAX"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "FALL")), _S.binary("-", _S.read(_e, "GONE"), _S.read(_e, "FALL")))])]))))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "ERUPT"))) else (_S.binary("*", _S.binary("*", 12, _S.binary("+", 1, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "ERUPT"))), 7)])))), _S.binary("+", 0.94, _S.binary("*", 0.06, _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "tt"), 9), _S.binary("+", _S.read(_e, "S"), 1)])))) if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "FALL"))) else _S.binary("+", _S.binary("*", 12, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "FALL"), _S.read(_e, "GONE"), _S.read(_e, "tt")]))), _S.binary("*", 1.5, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "GONE"), 0.1), _S.read(_e, "GONE"), _S.read(_e, "tt")]))))))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("-", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "ERUPT"), _S.read(_e, "tt")]), 0.75), _S.binary("*", 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "ERUPT"), 0.05), _S.binary("+", _S.read(_e, "ERUPT"), 0.1), _S.read(_e, "tt")]))), _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "GONE"), 0.3), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.6), _S.read(_e, "tt")]), 1.05))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", _S.binary("*", 0.6, _S.read(_e, "dt")), 60), _S.call_value(_S.read(_e, "smooth"), [0.15, _S.read(_e, "ERUPT"), _S.read(_e, "t")]))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FIRE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [20, 45])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3]), 0, _S.invoke(_S.read(_e, "R"), "range", [1, 2.2])])
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "dt")), 60), _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "ERUPT"), _S.read(_e, "t")]))]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "c", _S.invoke(_S.read(_v20, "R"), "pick", [_S.read(_v20, "cracks")]))
		_S.define(_v20, "i", _S.invoke(_S.read(_v20, "R"), "int", [0, _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("*", _S.prop(_S.prop(_S.read(_v20, "c"), "pts"), "length"), _S.call_value(_S.read(_v20, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.prop(_S.read(_v20, "c"), "t0")), _S.prop(_S.read(_v20, "c"), "grow"))]))]), 1)]))
		if _S.truth(_S.binary(">=", _S.read(_v20, "i"), 0)):
			var _v21 = _S.scope(_v20)
			var _v22 = _S.prop(_S.prop(_S.read(_v21, "c"), "pts"), _S.read(_v21, "i"))
			_S.define(_v21, "x", _S.prop(_v22, 0))
			_S.define(_v21, "y", _S.prop(_v22, 1))
			if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])):
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "FIRE"), _S.read(_v21, "x"), _S.binary("-", _S.read(_v21, "y"), 1), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [15, 35])), _S.invoke(_S.read(_v21, "R"), "range", [0.15, 0.3]), 0, _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.6])])
			else:
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "EMBER"), _S.read(_v21, "x"), _S.binary("-", _S.read(_v21, "y"), 1), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 70])), _S.invoke(_S.read(_v21, "R"), "range", [0.5, 1]), _S.prop(_S.read(_v21, "H"), 3), 1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "erupted")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ERUPT")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "erupted", true, "=", false)
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 40), 90, _S.read(_v23, "WARM"), 0.7, 0.6])
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 8), 44, _S.read(_v23, "WHITE"), 0.7, 0.1])
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 70)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v25, "Math"), "PI")), 2), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [100, 260]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SPARK"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.invoke(_S.read(_v25, "R"), "range", [0.25, 0.7])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v23)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 18)):
			_S.invoke(_S.read(_v26, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v26, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 110), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [150, 330]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [1.6, 2.4])}, {"a": _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")])}, {"va": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v26, "R"), "int", [1, 3])}])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v27 = _S.scope(_v23)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 60)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v28, "Math"), "PI")), 2), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v28, "sp", _S.invoke(_S.read(_v28, "R"), "range", [80, 260]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "GRIT"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.invoke(_S.read(_v28, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v28, "R"), "pick", [[_S.prop(_S.read(_v28, "st"), "light"), _S.prop(_S.read(_v28, "st"), "body"), _S.prop(_S.read(_v28, "st"), "body"), _S.prop(_S.read(_v28, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v28, "R"), "chance", [0.4])) else 1)])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 14)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "s", _S.invoke(_S.read(_v30, "R"), "sign", []))
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SMOKE"), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [2, 10])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [40, 110])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 10])), _S.invoke(_S.read(_v30, "R"), "range", [1, 1.8]), _S.prop(_S.read(_v30, "st"), "dust"), _S.invoke(_S.read(_v30, "R"), "range", [4, 7]), _S.invoke(_S.read(_v30, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v30, "PF"), "BIG")])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "t")]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))), func(): return _S.binary(">", _S.read(_e, "h"), 4))):
		var _v31 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.9, _S.read(_v31, "dt")), 60)])):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "s", _S.invoke(_S.read(_v32, "R"), "sign", []))
			_S.define(_v32, "y", _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [4, _S.binary("*", _S.read(_v32, "h"), 0.9)])))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "FIRE"), _S.binary("*", _S.binary("*", _S.read(_v32, "s"), _S.read(_v32, "w")), _S.invoke(_S.read(_v32, "R"), "range", [0.7, 1.1])), _S.read(_v32, "y"), _S.binary("*", _S.read(_v32, "s"), _S.invoke(_S.read(_v32, "R"), "range", [15, 40])), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [30, 70])), _S.invoke(_S.read(_v32, "R"), "range", [0.25, 0.5]), 0, _S.invoke(_S.read(_v32, "R"), "range", [1.6, 3.2]), 0, (_S.prop(_S.read(_v32, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.35])) else 0)])
		if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.7, _S.read(_v31, "dt")), 60)])):
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "FIRE"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", _S.read(_v31, "w")), _S.read(_v31, "w")]), _S.binary("+", _S.unary("-", _S.read(_v31, "h")), _S.invoke(_S.read(_v31, "R"), "range", [0, 6])), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [30, 80])), _S.invoke(_S.read(_v31, "R"), "range", [0.35, 0.7]), 0, _S.invoke(_S.read(_v31, "R"), "range", [3, 5.5]), 0, (_S.binary("|", _S.prop(_S.read(_v31, "PF"), "SMOKES"), (_S.prop(_S.read(_v31, "PF"), "BIG") if _S.truth(_S.binary("<", _S.read(_v31, "t"), _S.binary("-", _S.read(_v31, "FALL"), 0.3))) else 0)) if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.6])) else 0)])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v31, "t"), _S.read(_v31, "FALL")), func(): return _S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.5, _S.read(_v31, "dt")), 60)]))):
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", _S.read(_v31, "w")), _S.read(_v31, "w")]), 0.6), _S.binary("+", _S.unary("-", _S.read(_v31, "h")), 4), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [50, 110])), _S.invoke(_S.read(_v31, "R"), "range", [0.7, 1.3]), _S.prop(_S.read(_v31, "H"), 3), (2 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.2])) else 1)])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FALL")), func(): return _S.unary("!", _S.read(_e, "fell")))):
		_S.write(_e, "fell", true, "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "fell"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "GONE"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 1.6, _S.read(_e, "dt")), 60)]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FIRE"), _S.invoke(_S.read(_e, "R"), "range", [_S.binary("-", _S.unary("-", _S.read(_e, "w")), 2), _S.binary("+", _S.read(_e, "w"), 2)]), _S.binary("-", _S.unary("-", _S.read(_e, "h")), _S.invoke(_S.read(_e, "R"), "range", [0, 8])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [10, 50])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.75]), 0, _S.invoke(_S.read(_e, "R"), "range", [3.5, 6.5]), 0, _S.prop(_S.read(_e, "PF"), "SMOKES")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v33 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "b", _v33)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v34, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v34, "b"), "dusted")))):
			var _v35 = _S.scope(_v34)
			_S.set_prop(_S.read(_v35, "b"), "dusted", true, "=", false)
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v36, "i"), 3)):
				_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v36, "b"), "x"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v36, "R"), "sign", []), _S.invoke(_S.read(_v36, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [2, 18])), _S.invoke(_S.read(_v36, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v36, "st"), "dust"), _S.invoke(_S.read(_v36, "R"), "range", [1.3, 2.6])])
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "cracksDraw"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "simDraw"), [_S.read(_e, "p"), _S.read(_e, "ps"), _S.read(_e, "H"), "back"])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.45))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 84, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 1)], _S.function_value(_e, "_f15")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p")])
	for _v37 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "b", _v37)
		_S.call_value(_S.read(_v38, "rock"), [_S.read(_v38, "p"), _S.read(_v38, "b"), _S.read(_v38, "st")])
	_S.call_value(_S.read(_e, "simDraw"), [_S.read(_e, "p"), _S.read(_e, "ps"), _S.read(_e, "H"), "front"])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.45))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 84, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 1)], _S.function_value(_e, "_f17"), _S.binary("<", _S.read(_e, "k"), 0.15)])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.08))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1))):
		var _v39 = _S.scope(_e)
		_S.invoke(_S.read(_v39, "p"), "ellipse", [0, _S.unary("-", 2), _S.binary("*", 16, _S.binary("-", 1, _S.binary("*", _S.read(_v39, "f"), 0.3))), 6, _S.prop(_S.read(_v39, "H"), 2)])
		_S.invoke(_S.read(_v39, "p"), "ellipse", [0, _S.unary("-", 3), _S.binary("*", 11, _S.binary("-", 1, _S.binary("*", _S.read(_v39, "f"), 0.3))), 4, (_S.read(_v39, "WHITE") if _S.truth(_S.binary("<", _S.read(_v39, "f"), 0.5)) else _S.prop(_S.read(_v39, "H"), 1))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)
