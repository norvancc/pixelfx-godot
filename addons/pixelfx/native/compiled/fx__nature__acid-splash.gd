@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/acid-splash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Drops", _S.import_value("fx/nature/_lib.js", "Drops"))
	_S.define(_e, "wisp", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Acid splash"}, {"desc": "A gob of acid bursts into a crown and spatters; it eats a glowing, smoking pit into the floor and boils down into it, spitting bright beads, pale steam curling off."}, {"tags": ["nature", "acid", "poison", "splash", "liquid", "ground", "one-shot"]}, {"size": [184, 116]}, {"origin": [92, 100]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e140a", "#1c3010", "#2c5214", "#457e18", "#6aae1c", "#a0dc2a", "#dcff6a", "#f8ffd0"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.3)
	_S.define(_e, "Y0", _S.unary("-", 62))
	_S.define(_e, "V0", 60)
	_S.define(_e, "SPREAD", 0.4)
	_S.define(_e, "DRY", 0.7)
	_S.define(_e, "GONE", 2.2)
	_S.define(_e, "W", 30)
	_S.define(_e, "PIT", 5)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "col", _S.arg(_args, 3))
	_S.define(_e, "age", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "q"), "t0")))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "head", _S.binary("*", _S.prop(_S.read(_e, "q"), "rise"), _S.read(_e, "age")))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "head"), _S.prop(_S.read(_e, "q"), "len"))]))
	_S.define(_e, "fade", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.15, _S.read(_e, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.4, 1, _S.read(_e, "u")]))))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "h", _S.read(_v0, "tail"))
	while _S.truth(_S.binary("<=", _S.read(_v0, "h"), _S.read(_v0, "head"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "s", _S.binary("/", _S.binary("-", _S.read(_v1, "h"), _S.read(_v1, "tail")), _S.invoke(_S.read(_v1, "Math"), "max", [1, _S.binary("-", _S.read(_v1, "head"), _S.read(_v1, "tail"))])))
		_S.define(_v1, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v1, "q"), "x"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v1, "q"), "amp"), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v1, "h"), _S.prop(_S.read(_v1, "q"), "k")), _S.prop(_S.read(_v1, "q"), "ph"))])), _S.binary("+", 0.2, _S.read(_v1, "s")))), _S.binary("*", _S.prop(_S.read(_v1, "q"), "drift"), _S.read(_v1, "age"))))
		_S.invoke(_S.read(_v1, "p"), "blend", [_S.read(_v1, "x"), _S.binary("-", _S.prop(_S.read(_v1, "q"), "y"), _S.read(_v1, "h")), _S.read(_v1, "col"), _S.binary("*", _S.binary("*", _S.read(_v1, "fade"), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "s"))])), 0.42)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "h", 0.5, "+=", false)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "SCORCH", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 0), _S.call_value(_S.read(_e, "hex"), ["#140f0c"]), 0.6]))
	_S.define(_e, "BURNT", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.call_value(_S.read(_e, "hex"), ["#2a1a10"]), 0.6]))
	_S.define(_e, "STEAM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 7), _S.call_value(_S.read(_e, "hex"), ["#e8ece6"]), 0.75]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.read(_e, "floor")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "stains", [])
	_S.define(_e, "wisps", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 13}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "rag", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 80}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "pw", _S.function_value(_e, "_f5"))
	_S.define(_e, "pitD", _S.function_value(_e, "_f6"))
	_S.define(_e, "depth", _S.function_value(_e, "_f7"))
	_S.define(_e, "level", _S.function_value(_e, "_f8"))
	_S.define(_e, "width", _S.function_value(_e, "_f9"))
	_S.define(_e, "heat", _S.function_value(_e, "_f10"))
	_S.define(_e, "gobY", _S.function_value(_e, "_f11"))
	_S.define(_e, "crownR", _S.function_value(_e, "_f12"))
	_S.define(_e, "crownH", _S.function_value(_e, "_f13"))
	_S.define(_e, "spikeK", _S.function_value(_e, "_f14"))
	_S.define(_e, "tipOf", _S.function_value(_e, "_f15"))
	_S.define(_e, "steam", _S.function_value(_e, "_f16"))
	_S.define(_e, "crown", _S.function_value(_e, "_f17"))
	return _S.merge([{"update": _S.function_value(_e, "_f18")}, {"drawBack": _S.function_value(_e, "_f20")}, {"draw": _S.function_value(_e, "_f21")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 13), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.18), 0.18]))}, {"h": _S.invoke(_S.read(_e, "R"), "range", [4, 10])}, {"r": _S.invoke(_S.read(_e, "R"), "range", [0.85, 1.12])}, {"shed": false}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.prop(_S.read(_e, "o"), "seed"), 5]), 0.5)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), _S.read(_e, "SPREAD"))])])), 1.02)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.read(_e, "PIT"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 1.1)])]))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "pw"), []))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.read(_e, "w")])))
	return (_S.unary("-", 1) if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)) else _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "pitD"), []), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d")))])), _S.binary("*", _S.prop(_S.read(_e, "rag"), _S.binary("%", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 200), 80)), 0.9)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))) else _S.binary("+", _S.unary("-", 1.6), _S.binary("*", _S.binary("+", _S.read(_e, "PIT"), 1.6), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "DRY"), _S.read(_e, "GONE"), _S.read(_e, "t")])]))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "pw"), []))
	return (_S.read(_e, "w") if _S.truth(_S.binary("<=", _S.read(_e, "L"), 0)) else _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "L"), _S.invoke(_S.read(_e, "Math"), "max", [0.1, _S.call_value(_S.read(_e, "pitD"), [])])), 2))])])))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.3), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "GONE"), 0.3), _S.binary("+", _S.read(_e, "GONE"), 0.25), _S.read(_e, "t")])))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", _S.binary("+", _S.read(_e, "Y0"), _S.binary("*", _S.read(_e, "V0"), _S.read(_e, "t"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, 950), _S.read(_e, "t")), _S.read(_e, "t")))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", 4, _S.binary("*", 11, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.16)])])))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.26)]))]))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.015), 0.26)]))
	return _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 0.6]))])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "r", _S.binary("*", _S.call_value(_S.read(_e, "crownR"), []), _S.prop(_S.read(_e, "s"), "r")))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "crownH"), []))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "a")]))
	_S.define(_e, "sh", _S.binary("*", _S.prop(_S.read(_e, "s"), "h"), _S.call_value(_S.read(_e, "spikeK"), [])))
	_S.define(_e, "bx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "a")]), _S.read(_e, "r")))
	_S.define(_e, "by", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "sn"), _S.read(_e, "r")), 0.3), _S.binary("*", _S.read(_e, "h"), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sn")]))))))
	return [_S.read(_e, "bx"), _S.read(_e, "by"), _S.binary("+", _S.read(_e, "bx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "a")]), _S.read(_e, "sh")), 0.55)), _S.binary("-", _S.read(_e, "by"), _S.read(_e, "sh"))]

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "big", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "wisps"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"t0": _S.read(_e, "t")}, {"life": _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]), (1.3 if _S.truth(_S.read(_e, "big")) else 1)), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))])}, {"rise": _S.invoke(_S.read(_e, "R"), "range", [22, 32])}, {"len": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [5, 10]), (1.4 if _S.truth(_S.read(_e, "big")) else 1))}, {"amp": _S.invoke(_S.read(_e, "R"), "range", [1, 2.5])}, {"k": _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.6])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"drift": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4])}])])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.27)))):
		return null
	_S.define(_e, "r", _S.call_value(_S.read(_e, "crownR"), []))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "crownH"), []))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "r"), 0.3))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "x", _S.invoke(_S.read(_v2, "Math"), "floor", [_S.unary("-", _S.read(_v2, "r"))]))
	while _S.truth(_S.binary("<=", _S.read(_v2, "x"), _S.invoke(_S.read(_v2, "Math"), "ceil", [_S.read(_v2, "r")]))):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "c", _S.binary("/", _S.binary("+", _S.read(_v3, "x"), 0.5), _S.read(_v3, "r")))
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "c")]), 1)):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "x", 1, "+=", true)
			continue
		_S.define(_v3, "e", _S.invoke(_S.read(_v3, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v3, "c"), _S.read(_v3, "c")))]))
		_S.define(_v3, "yb", _S.binary("*", (_S.unary("-", _S.read(_v3, "ry")) if _S.truth(_S.read(_v3, "back")) else _S.read(_v3, "ry")), _S.read(_v3, "e")))
		_S.define(_v3, "hh", _S.binary("*", _S.read(_v3, "h"), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.read(_v3, "e")))))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "y", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("-", _S.read(_v4, "yb"), _S.read(_v4, "hh"))]))
		while _S.truth(_S.binary("<=", _S.read(_v4, "y"), _S.invoke(_S.read(_v4, "Math"), "round", [_S.read(_v4, "yb")]))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "rim", _S.binary("===", _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.read(_v5, "yb"), _S.read(_v5, "hh"))])))
			if _S.truth(_S.read(_v5, "rim")):
				_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.prop(_S.read(_v5, "C"), 5) if _S.truth(_S.read(_v5, "back")) else (_S.prop(_S.read(_v5, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v5, "c"), 0.1)) else _S.prop(_S.read(_v5, "C"), 6)))])
			else:
				_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), _S.binary("-", (5 if _S.truth(_S.binary("<", _S.read(_v5, "c"), _S.unary("-", 0.25))) else (3 if _S.truth(_S.binary(">", _S.read(_v5, "c"), 0.45)) else 4)), (1 if _S.truth(_S.read(_v5, "back")) else 0))), (0.55 if _S.truth(_S.read(_v5, "back")) else 0.7)])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "y", 1, "+=", true)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "x", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "spikes")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.prop(_S.read(_v8, "s"), "a")]), 0), _S.read(_v8, "back"))):
			continue
		var _v9 = _S.call_value(_S.read(_v8, "tipOf"), [_S.read(_v8, "s")])
		_S.define(_v8, "bx", _S.prop(_v9, 0))
		_S.define(_v8, "by", _S.prop(_v9, 1))
		_S.define(_v8, "tx", _S.prop(_v9, 2))
		_S.define(_v8, "ty", _S.prop(_v9, 3))
		_S.invoke(_S.read(_v8, "p"), "line", [_S.read(_v8, "bx"), _S.read(_v8, "by"), _S.read(_v8, "tx"), _S.read(_v8, "ty"), (_S.prop(_S.read(_v8, "C"), 4) if _S.truth(_S.read(_v8, "back")) else _S.prop(_S.read(_v8, "C"), 6))])
		_S.invoke(_S.read(_v8, "p"), "line", [_S.binary("+", _S.read(_v8, "bx"), 1), _S.read(_v8, "by"), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v8, "bx"), _S.read(_v8, "tx")), 2), 0.5), _S.binary("/", _S.binary("+", _S.read(_v8, "by"), _S.read(_v8, "ty")), 2), (_S.prop(_S.read(_v8, "C"), 3) if _S.truth(_S.read(_v8, "back")) else _S.prop(_S.read(_v8, "C"), 5))])
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v8, "s"), "shed"))):
			_S.last([_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "tx"), _S.binary("-", _S.read(_v8, "ty"), 1), (_S.prop(_S.read(_v8, "C"), 5) if _S.truth(_S.read(_v8, "back")) else _S.prop(_S.read(_v8, "C"), 7))]), _S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.read(_v8, "tx"), 1), _S.binary("-", _S.read(_v8, "ty"), 1), _S.prop(_S.read(_v8, "C"), 5)])])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), []))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "hit", true, "=", false)
		_S.invoke(_S.read(_v10, "lights"), "add", [0, _S.unary("-", 4), 28, _S.read(_v10, "WHITE"), 0.6, 0.08])
		_S.invoke(_S.read(_v10, "lights"), "add", [0, _S.unary("-", 10), 56, _S.prop(_S.read(_v10, "C"), 5), 0.5, 0.6])
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 26)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.35), 1.35])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [60, 250]))
			_S.invoke(_S.read(_v12, "drops"), "add", [_S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), (2 if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.3])) else 1)])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v10)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 10)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "R"), "range", [0.12, 0.3])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v10)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 5)):
			_S.call_value(_S.read(_v15, "steam"), [_S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [2, 6])), true])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "hit")):
		for _v16 in _S.array(_S.read(_e, "spikes")):
			var _v17 = _S.scope(_e)
			_S.define(_v17, "s", _v16)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "s"), "shed")), func(): return _S.binary(">", _S.read(_v17, "t"), _S.binary("+", _S.read(_v17, "HIT"), 0.09)))):
				var _v18 = _S.scope(_v17)
				_S.set_prop(_S.read(_v18, "s"), "shed", true, "=", false)
				var _v19 = _S.call_value(_S.read(_v18, "tipOf"), [_S.read(_v18, "s")])
				_S.define(_v18, "tx", _S.prop(_v19, 2))
				_S.define(_v18, "ty", _S.prop(_v19, 3))
				_S.invoke(_S.read(_v18, "drops"), "add", [_S.read(_v18, "tx"), _S.binary("-", _S.read(_v18, "ty"), 1), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.prop(_S.read(_v18, "s"), "a")]), _S.invoke(_S.read(_v18, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [50, 130])), (2 if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.4])) else 1)])
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt"), _S.function_value(_e, "_f19")])
	_S.define(_e, "lv", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "w2", _S.call_value(_S.read(_e, "width"), []))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.15)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))), func(): return _S.binary(">", _S.read(_e, "w2"), 2))):
		var _v20 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [_S.binary("*", 0.3, _S.read(_v20, "f"))])):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "x", _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.85), 0.85]), _S.read(_v21, "w2")))
			_S.define(_v21, "y", _S.binary("-", _S.invoke(_S.read(_v21, "Math"), "min", [_S.read(_v21, "lv"), _S.call_value(_S.read(_v21, "depth"), [_S.read(_v21, "x")])]), 1))
			_S.invoke(_S.read(_v21, "pops"), "push", [_S.merge([{"x": _S.read(_v21, "x")}, {"y": _S.read(_v21, "y")}, {"t0": _S.read(_v21, "t")}])])
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "j"), _S.invoke(_S.read(_v22, "R"), "int", [1, 3]))):
				_S.invoke(_S.read(_v22, "drops"), "add", [_S.read(_v22, "x"), _S.invoke(_S.read(_v22, "Math"), "min", [_S.binary("-", _S.read(_v22, "y"), 1), _S.unary("-", 1)]), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [50, 110])), 1])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "j", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [_S.binary("*", 0.14, _S.read(_v20, "f"))])):
			_S.call_value(_S.read(_v20, "steam"), [_S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.9), 0.9]), _S.read(_v20, "w2")), _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "min", [_S.read(_v20, "lv"), 0]), 1), _S.invoke(_S.read(_v20, "R"), "chance", [0.25])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "GONE"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.5))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.08, _S.read(_e, "f"))]))):
		_S.call_value(_S.read(_e, "steam"), [_S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.call_value(_S.read(_e, "pw"), [])), 0, false])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", _S.binary("-", _S.prop(_S.read(_v23, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v23, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v23, "t"), _S.prop(_S.prop(_S.read(_v23, "pops"), _S.read(_v23, "i")), "t0")), 0.1)):
			_S.invoke(_S.read(_v23, "pops"), "splice", [_S.read(_v23, "i"), 1])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "-=", true)
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", _S.binary("-", _S.prop(_S.read(_v24, "wisps"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v24, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v24, "t"), _S.prop(_S.prop(_S.read(_v24, "wisps"), _S.read(_v24, "i")), "t0")), _S.prop(_S.prop(_S.read(_v24, "wisps"), _S.read(_v24, "i")), "life"))):
			_S.invoke(_S.read(_v24, "wisps"), "splice", [_S.read(_v24, "i"), 1])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.read(_e, "d"), "x")]), _S.call_value(_S.read(_e, "pw"), []))):
		_S.invoke(_S.read(_e, "stains"), "push", [_S.merge([{"x": _S.prop(_S.read(_e, "d"), "x")}, {"t0": _S.read(_e, "t")}, {"w": _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 0.8), _S.invoke(_S.read(_e, "R"), "range", [0.3, 1.2]))}])])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))):
		_S.call_value(_S.read(_e, "steam"), [_S.prop(_S.read(_e, "d"), "x"), _S.unary("-", 1), false])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.6), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.08), _S.read(_e, "t")])))
	_S.define(_e, "hk", _S.call_value(_S.read(_e, "heat"), []))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "pw"), []))
	_S.define(_e, "lv", _S.call_value(_S.read(_e, "level"), []))
	for _v25 in _S.array(_S.read(_e, "stains")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "s", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "age", _S.binary("-", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "t0")))
		_S.define(_v27, "k", _S.binary("-", 1, _S.call_value(_S.read(_v27, "smooth"), [1, 1.8, _S.read(_v27, "age")])))
		_S.define(_v27, "c", (_S.prop(_S.read(_v27, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v27, "age"), 0.15)) else (_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v27, "age"), 0.5)) else (_S.prop(_S.read(_v27, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v27, "age"), 0.9)) else _S.read(_v27, "BURNT")))))
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "x", _S.invoke(_S.read(_v28, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v28, "s"), "x"), _S.prop(_S.read(_v28, "s"), "w"))]))
		while _S.truth(_S.binary("<=", _S.read(_v28, "x"), _S.invoke(_S.read(_v28, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v28, "s"), "x"), _S.prop(_S.read(_v28, "s"), "w"))]))):
			_S.invoke(_S.read(_v28, "p"), "dot", [_S.read(_v28, "x"), 0, (_S.read(_v28, "SCORCH") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v28, "Math"), "abs", [_S.binary("-", _S.read(_v28, "x"), _S.prop(_S.read(_v28, "s"), "x"))]), _S.binary("*", _S.prop(_S.read(_v28, "s"), "w"), 0.5))) else _S.read(_v28, "c")), _S.binary("*", _S.read(_v28, "k"), _S.read(_v28, "fade"))])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "x", 1, "+=", true)
		if _S.truth(_S.binary("<", _S.read(_v27, "age"), 0.5)):
			_S.invoke(_S.read(_v27, "p"), "glow", [_S.prop(_S.read(_v27, "s"), "x"), _S.unary("-", 1), 5, _S.prop(_S.read(_v27, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v27, "age"), 0.5)))])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), true])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary(">", _S.read(_e, "w"), 1))):
		var _v29 = _S.scope(_e)
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "x", _S.binary("-", _S.invoke(_S.read(_v30, "Math"), "floor", [_S.unary("-", _S.read(_v30, "w"))]), 1))
		while _S.truth(_S.binary("<=", _S.read(_v30, "x"), _S.binary("+", _S.invoke(_S.read(_v30, "Math"), "ceil", [_S.read(_v30, "w")]), 1))):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "dp", _S.call_value(_S.read(_v31, "depth"), [_S.binary("+", _S.read(_v31, "x"), 0.5)]))
			if _S.truth(_S.binary("<", _S.read(_v31, "dp"), 0)):
				_v30 = _S.iteration(_v30)
				_S.write(_v30, "x", 1, "+=", true)
				continue
			_S.define(_v31, "bottom", _S.invoke(_S.read(_v31, "Math"), "max", [0, _S.invoke(_S.read(_v31, "Math"), "round", [_S.read(_v31, "dp")])]))
			_S.define(_v31, "edge", _S.binary(">", _S.binary("/", _S.invoke(_S.read(_v31, "Math"), "abs", [_S.binary("+", _S.read(_v31, "x"), 0.5)]), _S.read(_v31, "w")), 0.88))
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "y", 0)
			while _S.truth(_S.binary("<=", _S.read(_v32, "y"), _S.read(_v32, "bottom"))):
				_S.invoke(_S.read(_v32, "p"), "dot", [_S.read(_v32, "x"), _S.read(_v32, "y"), ((_S.prop(_S.read(_v32, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v32, "hk"), 0.5)) else (_S.prop(_S.read(_v32, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v32, "hk"), 0.15)) else _S.read(_v32, "BURNT"))) if _S.truth(_S.binary("===", _S.read(_v32, "y"), _S.read(_v32, "bottom"))) else _S.read(_v32, "SCORCH")), _S.read(_v32, "fade")])
				_v32 = _S.iteration(_v32)
				_S.write(_v32, "y", 1, "+=", true)
			_S.invoke(_S.read(_v31, "p"), "dot", [_S.read(_v31, "x"), _S.binary("+", _S.read(_v31, "bottom"), 1), (_S.prop(_S.read(_v31, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v31, "hk"), 0.5)) else (_S.prop(_S.read(_v31, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v31, "hk"), 0.15)) else _S.read(_v31, "SCORCH"))), _S.binary("*", _S.read(_v31, "fade"), 0.8)])
			if _S.truth(_S.read(_v31, "edge")):
				_S.invoke(_S.read(_v31, "p"), "dot", [_S.read(_v31, "x"), _S.unary("-", 1), (_S.prop(_S.read(_v31, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v31, "hk"), 0.4)) else (_S.prop(_S.read(_v31, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v31, "hk"), 0.1)) else _S.read(_v31, "BURNT"))), _S.read(_v31, "fade")])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "x", 1, "+=", true)
		for _v33 in _S.array([_S.unary("-", 1), 1]):
			var _v34 = _S.scope(_v29)
			_S.define(_v34, "sd", _v33)
			_S.invoke(_S.read(_v34, "p"), "glow", [_S.binary("*", _S.read(_v34, "sd"), _S.read(_v34, "w")), _S.unary("-", 1), 8, _S.prop(_S.read(_v34, "C"), 6), _S.binary("*", 0.45, _S.read(_v34, "hk"))])
		if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.read(_v29, "GONE"))):
			var _v35 = _S.scope(_v29)
			_S.define(_v35, "x", _S.invoke(_S.read(_v35, "Math"), "floor", [_S.unary("-", _S.read(_v35, "w"))]))
			while _S.truth(_S.binary("<=", _S.read(_v35, "x"), _S.invoke(_S.read(_v35, "Math"), "ceil", [_S.read(_v35, "w")]))):
				var _v36 = _S.scope(_v35)
				_S.define(_v36, "dp", _S.call_value(_S.read(_v36, "depth"), [_S.binary("+", _S.read(_v36, "x"), 0.5)]))
				if _S.truth(_S.binary("<", _S.read(_v36, "dp"), 0)):
					_v35 = _S.iteration(_v35)
					_S.write(_v35, "x", 1, "+=", true)
					continue
				_S.define(_v36, "d", _S.binary("/", _S.invoke(_S.read(_v36, "Math"), "abs", [_S.binary("+", _S.read(_v36, "x"), 0.5)]), _S.read(_v36, "w")))
				_S.define(_v36, "dome", (_S.invoke(_S.read(_v36, "Math"), "round", [_S.binary("*", _S.read(_v36, "lv"), _S.invoke(_S.read(_v36, "Math"), "sqrt", [_S.invoke(_S.read(_v36, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_v36, "d"), _S.read(_v36, "d")))])]))]) if _S.truth(_S.binary("<", _S.read(_v36, "lv"), 0)) else _S.invoke(_S.read(_v36, "Math"), "round", [_S.read(_v36, "lv")])))
				_S.define(_v36, "bottom", _S.invoke(_S.read(_v36, "Math"), "round", [_S.read(_v36, "dp")]))
				if _S.truth(_S.binary(">", _S.read(_v36, "dome"), _S.read(_v36, "bottom"))):
					_v35 = _S.iteration(_v35)
					_S.write(_v35, "x", 1, "+=", true)
					continue
				_S.define(_v36, "n", _S.binary("+", _S.call_value(_S.read(_v36, "noise"), [_S.binary("-", _S.binary("*", _S.read(_v36, "x"), 0.25), _S.binary("*", _S.read(_v36, "t"), 2.4)), 3]), _S.binary("*", _S.call_value(_S.read(_v36, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v36, "x"), 0.1), _S.binary("*", _S.read(_v36, "t"), 1.4)), 5]), 0.6)))
				var _v37 = _S.scope(_v36)
				_S.define(_v37, "y", _S.read(_v37, "dome"))
				while _S.truth(_S.binary("<=", _S.read(_v37, "y"), _S.read(_v37, "bottom"))):
					_S.invoke(_S.read(_v37, "p"), "px", [_S.read(_v37, "x"), _S.read(_v37, "y"), ((_S.prop(_S.read(_v37, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v37, "n"), 0.7)) else _S.prop(_S.read(_v37, "C"), 6)) if _S.truth(_S.binary("===", _S.read(_v37, "y"), _S.read(_v37, "dome"))) else ((_S.prop(_S.read(_v37, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v37, "n"), 0.2)) else _S.prop(_S.read(_v37, "C"), 4)) if _S.truth(_S.binary("===", _S.read(_v37, "y"), _S.binary("+", _S.read(_v37, "dome"), 1))) else (_S.prop(_S.read(_v37, "C"), 3) if _S.truth(_S.binary(">=", _S.read(_v37, "y"), _S.read(_v37, "bottom"))) else _S.prop(_S.read(_v37, "C"), 4))))])
					_v37 = _S.iteration(_v37)
					_S.write(_v37, "y", 1, "+=", true)
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "x", 1, "+=", true)
		_S.invoke(_S.read(_v29, "p"), "glow", [0, _S.unary("-", 6), _S.binary("+", _S.binary("*", _S.read(_v29, "w"), 1.4), 10), _S.prop(_S.read(_v29, "C"), 4), _S.binary("*", _S.binary("*", 0.3, _S.read(_v29, "hk")), _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_v29, "Math"), "sin", [_S.binary("*", _S.read(_v29, "t"), 9)]))))])
		_S.invoke(_S.read(_v29, "p"), "glow", [0, 1, _S.binary("*", _S.read(_v29, "w"), 0.9), _S.prop(_S.read(_v29, "C"), 6), _S.binary("*", 0.2, _S.read(_v29, "hk"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "y", _S.call_value(_S.read(_v38, "gobY"), []))
		_S.define(_v38, "v", _S.binary("+", _S.read(_v38, "V0"), _S.binary("*", 950, _S.read(_v38, "t"))))
		_S.define(_v38, "st", _S.binary("+", 1, _S.binary("*", _S.read(_v38, "v"), 0.0022)))
		_S.define(_v38, "rx", _S.binary("/", 2.6, _S.invoke(_S.read(_v38, "Math"), "sqrt", [_S.read(_v38, "st")])))
		_S.define(_v38, "ry", _S.binary("*", 2.8, _S.read(_v38, "st")))
		_S.invoke(_S.read(_v38, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v38, "rx")), 1), _S.binary("-", _S.binary("-", _S.read(_v38, "y"), _S.read(_v38, "ry")), 4), _S.binary("+", _S.read(_v38, "rx"), 1), _S.binary("+", _S.binary("+", _S.read(_v38, "y"), _S.read(_v38, "ry")), 1), _S.function_value(_v38, "_f22")])
		_S.invoke(_S.read(_v38, "p"), "px", [_S.unary("-", 1), _S.binary("-", _S.read(_v38, "y"), _S.binary("*", _S.read(_v38, "ry"), 0.3)), _S.read(_v38, "WHITE")])
		var _v39 = _S.scope(_v38)
		_S.define(_v39, "i", 1)
		while _S.truth(_S.binary("<=", _S.read(_v39, "i"), 3)):
			_S.invoke(_S.read(_v39, "p"), "dot", [0, _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v39, "y"), _S.read(_v39, "ry")), 2), _S.binary("*", _S.read(_v39, "i"), 4)), _S.prop(_S.read(_v39, "C"), 5), _S.binary("-", 1, _S.binary("*", _S.read(_v39, "i"), 0.25))])
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
		_S.invoke(_S.read(_v38, "p"), "glow", [0, _S.read(_v38, "y"), 10, _S.prop(_S.read(_v38, "C"), 5), 0.45])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), false])
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "e"), 0), func(): return _S.binary("<", _S.read(_e, "e"), 0.07))):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v40, "e"), 0.07)))
		_S.invoke(_S.read(_v40, "p"), "ellipse", [0, _S.unary("-", 2), _S.binary("+", 6, _S.binary("*", 6, _S.binary("-", 1, _S.read(_v40, "k")))), 2.5, (_S.read(_v40, "WHITE") if _S.truth(_S.binary(">", _S.read(_v40, "k"), 0.5)) else _S.prop(_S.read(_v40, "C"), 7))])
		_S.call_value(_S.read(_v40, "sparkle"), [_S.read(_v40, "p"), 0, _S.unary("-", 4), _S.binary("*", 8, _S.read(_v40, "k")), _S.prop(_S.read(_v40, "C"), 7), _S.prop(_S.read(_v40, "C"), 6), 0.6])
	for _v41 in _S.array(_S.read(_e, "pops")):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "q", _v41)
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "k", _S.binary("/", _S.binary("-", _S.read(_v43, "t"), _S.prop(_S.read(_v43, "q"), "t0")), 0.1))
		_S.invoke(_S.read(_v43, "p"), "px", [_S.prop(_S.read(_v43, "q"), "x"), _S.prop(_S.read(_v43, "q"), "y"), _S.read(_v43, "WHITE")])
		for _v44 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, _S.unary("-", 1)]]):
			var _v45 = _S.scope(_v43)
			var _v46 = _v44
			_S.define(_v45, "dx", _S.prop(_v46, 0))
			_S.define(_v45, "dy", _S.prop(_v46, 1))
			_S.invoke(_S.read(_v45, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v45, "q"), "x"), _S.binary("*", _S.read(_v45, "dx"), _S.binary("+", 1, _S.binary("*", _S.read(_v45, "k"), 2)))), _S.binary("+", _S.prop(_S.read(_v45, "q"), "y"), _S.binary("*", _S.read(_v45, "dy"), _S.binary("+", 1, _S.binary("*", _S.read(_v45, "k"), 2)))), _S.prop(_S.read(_v45, "C"), 7), _S.binary("-", 1, _S.read(_v45, "k"))])
		_S.invoke(_S.read(_v43, "p"), "glow", [_S.prop(_S.read(_v43, "q"), "x"), _S.prop(_S.read(_v43, "q"), "y"), 4, _S.prop(_S.read(_v43, "C"), 6), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v43, "k")))])
	for _v47 in _S.array(_S.read(_e, "wisps")):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "q", _v47)
		_S.call_value(_S.read(_v48, "wisp"), [_S.read(_v48, "p"), _S.read(_v48, "q"), _S.read(_v48, "t"), _S.read(_v48, "STEAM")])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "yy", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "yy"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "tail", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "dy"), 0), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.binary("*", _S.read(_e, "rx"), _S.binary("+", 1, _S.binary("*", _S.read(_e, "dy"), 0.9))), 0.4))), func(): return _S.binary(">", _S.read(_e, "dy"), _S.unary("-", 1.7))))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "d"), 1.25), func(): return _S.unary("!", _S.read(_e, "tail")))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "d"), 1), func(): return _S.unary("!", _S.read(_e, "tail")))) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dx"), _S.unary("-", 0.2)), func(): return _S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.1)))) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "dy"), 0.45)) else _S.prop(_S.read(_e, "C"), 5)))), "=", false)
	return null
