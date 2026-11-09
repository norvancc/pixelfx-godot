@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/meteor.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Blazes", _S.import_value("core/index.js", "Blazes"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
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
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "simDraw", _S.import_value("fx/fire/_lib.js", "simDraw"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "rock", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Meteor"}, {"desc": "A burning rock streaks in from the upper left in a comet of fire and smashes into the floor: a white flash, a fireball, rocks and brands thrown, a glowing crater that cools."}, {"tags": ["fire", "meteor", "impact", "explosion", "spell", "debris", "one-shot"]}, {"size": [272, 232]}, {"origin": [150, 208]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"rock": ["#120e16", "#2a2230", "#463a4a", "#6a5a66"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.62)
	_S.define(_e, "FROM", [_S.unary("-", 112), _S.unary("-", 142)])
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#17121d"]))
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
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "RK", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "rock"), 4]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "S", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)]}, {"onLand": _S.function_value(_e, "_f5")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "FROM"), 0), _S.prop(_S.read(_e, "FROM"), 1)]))
	_S.define(_e, "ux", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "FROM"), 0)), _S.read(_e, "len")))
	_S.define(_e, "uy", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "FROM"), 1)), _S.read(_e, "len")))
	_S.define(_e, "pos", _S.function_value(_e, "_f6"))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "last", _S.call_value(_S.read(_e, "pos"), [0]))
	_S.define(_e, "meteor", _S.function_value(_e, "_f7"))
	_S.define(_e, "crater", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "blazes"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.25), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.6]), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.85])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "HIT"))])]), 0.35), _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "HIT"))]), 0.65)))
	return [_S.binary("*", _S.prop(_S.read(_e, "FROM"), 0), _S.binary("-", 1, _S.read(_e, "k"))), _S.binary("*", _S.prop(_S.read(_e, "FROM"), 1), _S.binary("-", 1, _S.read(_e, "k")))]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "R0", _S.arg(_args, 3))
	_S.define(_e, "cool", _S.arg(_args, 4))
	_S.define(_e, "alpha", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "R0")), 2), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "R0")), 2), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "R0")), 2), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "R0")), 2), _S.function_value(_e, "_f8")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "alpha"), "=", false)
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "rr", _S.binary("*", _S.read(_e, "R0"), _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.18, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 2.2), 3), _S.read(_e, "S")]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "a"), 5), _S.binary("+", _S.read(_e, "S"), 1)])))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "rr"), 1))):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "rr"))):
		return _S.read(_e, "OUTLINE")
	_S.define(_e, "face", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ux")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "uy"))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.read(_e, "d")])))
	_S.define(_e, "heat", _S.binary("*", _S.binary("-", 1, _S.read(_e, "cool")), _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_e, "face"), 0.6), 0.5), _S.binary("*", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "rr")), 0.25))))
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.62)):
		return (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.85)) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.74)) else _S.prop(_S.read(_e, "H"), 2)))
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.42)):
		return _S.prop(_S.read(_e, "H"), 4)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x"))]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "py"), _S.read(_e, "y"))]), _S.binary("+", _S.read(_e, "S"), 3)]))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), _S.binary("*", 0.22, _S.binary("-", 1, _S.binary("*", _S.read(_e, "cool"), 0.7))))):
		return (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary(">", _S.binary("-", 1, _S.read(_e, "cool")), 0.5)) else _S.prop(_S.read(_e, "H"), 6))
	return (_S.prop(_S.read(_e, "RK"), 2) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_e, "dy"), _S.unary("-", 0.8))), 0)) else (_S.prop(_S.read(_e, "RK"), 0) if _S.truth(_S.binary(">", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "rr")), 0.6)) else _S.prop(_S.read(_e, "RK"), 1)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		return null
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	_S.define(_e, "end", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 1), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.15), _S.read(_e, "t")])))
	_S.define(_e, "rx", _S.binary("*", 36, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "a"), 0.08)])))
	_S.define(_e, "ry", 6)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), 3)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.unary("-", _S.read(_v1, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.read(_v1, "rx")]))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "dx", _S.binary("/", _S.binary("+", _S.read(_v2, "x"), 0.5), _S.read(_v2, "rx")))
			_S.define(_v2, "dy", _S.binary("/", _S.binary("+", _S.read(_v2, "y"), 0.5), _S.read(_v2, "ry")))
			_S.define(_v2, "d", _S.invoke(_S.read(_v2, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v2, "dx"), _S.read(_v2, "dx")), _S.binary("*", _S.read(_v2, "dy"), _S.read(_v2, "dy")))]))
			if _S.truth(_S.binary(">", _S.read(_v2, "d"), 1)):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "x", 1, "+=", true)
				continue
			_S.define(_v2, "k", _S.call_value(_S.read(_v2, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v2, "x"), 31), _S.read(_v2, "y")), _S.binary("+", _S.read(_v2, "S"), 5)]))
			_S.define(_v2, "T", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "pow", [_S.call_value(_S.read(_v2, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v2, "a"), 2.6))]), 1.3]), _S.binary("-", 1.25, _S.read(_v2, "d"))), _S.binary("*", _S.read(_v2, "k"), 0.35)))
			if _S.truth(_S.binary(">", _S.read(_v2, "T"), 0.06)):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "ramp", [_S.prop(_S.read(_v3, "H"), 0), _S.prop(_S.read(_v3, "H"), 1), _S.prop(_S.read(_v3, "H"), 2), _S.prop(_S.read(_v3, "H"), 3), _S.prop(_S.read(_v3, "H"), 4), _S.prop(_S.read(_v3, "H"), 5), _S.prop(_S.read(_v3, "H"), 6), _S.prop(_S.read(_v3, "H"), 7), _S.prop(_S.read(_v3, "H"), 8)])
				_S.define(_v3, "c", _S.prop(_S.read(_v3, "ramp"), _S.invoke(_S.read(_v3, "Math"), "min", [8, _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.read(_v3, "T")])), 8)])])))
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "c"), _S.read(_v3, "end")])
				if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v3, "x"), 3), 0)):
					_S.invoke(_S.read(_v3, "p"), "glow", [_S.binary("+", _S.read(_v3, "x"), 0.5), _S.read(_v3, "y"), 7, _S.read(_v3, "c"), _S.binary("*", _S.binary("*", 0.2, _S.read(_v3, "T")), _S.read(_v3, "end"))])
			else:
				_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.read(_v2, "SOOT") if _S.truth(_S.binary("<", _S.read(_v2, "d"), 0.55)) else _S.read(_v2, "SOOT2")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v2, "d"), _S.binary("-", 0.95, _S.binary("*", _S.read(_v2, "k"), 0.3)))) else _S.binary("-", 1, _S.read(_v2, "d"))), _S.read(_v2, "end"))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "x", _S.unary("-", 40))
	while _S.truth(_S.binary("<=", _S.read(_v4, "x"), 40)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "e", _S.binary("/", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.read(_v5, "x")]), 40))
		_S.define(_v5, "hh", (0 if _S.truth(_S.binary("<", _S.read(_v5, "e"), 0.7)) else _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("*", _S.binary("*", 2.4, _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v5, "e"), 0.7), 0.3), _S.prop(_S.read(_v5, "Math"), "PI"))])), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "x"), _S.binary("+", _S.read(_v5, "S"), 7)]))))])))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "j"), _S.read(_v6, "hh"))):
			_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.binary("-", _S.unary("-", 1), _S.read(_v6, "j")), (_S.call_value(_S.read(_v6, "mix"), [_S.prop(_S.read(_v6, "st"), "light"), _S.prop(_S.read(_v6, "H"), 4), _S.binary("*", 0.5, _S.call_value(_S.read(_v6, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v6, "a"), 2))]))]) if _S.truth(_S.binary("===", _S.read(_v6, "j"), _S.binary("-", _S.read(_v6, "hh"), 1))) else _S.prop(_S.read(_v6, "st"), "shade")), _S.read(_v6, "end")])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "j", 1, "+=", true)
		if _S.truth(_S.read(_v5, "hh")):
			_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), 0, _S.read(_v5, "OUTLINE"), _S.read(_v5, "end")])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "x", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v7 = _S.scope(_e)
		var _v8 = _S.call_value(_S.read(_v7, "pos"), [_S.read(_v7, "t")])
		_S.define(_v7, "x", _S.prop(_v8, 0))
		_S.define(_v7, "y", _S.prop(_v8, 1))
		_S.define(_v7, "vx", _S.binary("/", _S.binary("-", _S.read(_v7, "x"), _S.prop(_S.read(_v7, "last"), 0)), _S.read(_v7, "dt")))
		_S.define(_v7, "vy", _S.binary("/", _S.binary("-", _S.read(_v7, "y"), _S.prop(_S.read(_v7, "last"), 1)), _S.read(_v7, "dt")))
		_S.write(_v7, "last", [_S.read(_v7, "x"), _S.read(_v7, "y")], "=", false)
		var _v9 = _S.scope(_v7)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 3)):
			var _v10 = _S.scope(_v9)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v10, "R"), "chance", [_S.binary("*", _S.binary("*", 0.8, _S.read(_v10, "dt")), 60)]))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "FIRE"), _S.binary("+", _S.binary("-", _S.read(_v10, "x"), _S.binary("*", _S.read(_v10, "ux"), _S.invoke(_S.read(_v10, "R"), "range", [2, 8]))), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.binary("-", _S.read(_v10, "y"), _S.binary("*", _S.read(_v10, "uy"), _S.invoke(_S.read(_v10, "R"), "range", [2, 8]))), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.binary("*", _S.read(_v10, "vx"), 0.15), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 20), 20])), _S.binary("+", _S.binary("*", _S.read(_v10, "vy"), 0.15), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 30), 10])), _S.invoke(_S.read(_v10, "R"), "range", [0.3, 0.6]), 0, _S.invoke(_S.read(_v10, "R"), "range", [3, 6]), 0, (_S.binary("|", _S.prop(_S.read(_v10, "PF"), "SMOKES"), _S.prop(_S.read(_v10, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.65])) else 0)])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [_S.binary("*", _S.binary("*", 0.6, _S.read(_v7, "dt")), 60)])):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", _S.binary("*", _S.read(_v7, "vx"), 0.35), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 80), 80])), _S.binary("+", _S.binary("*", _S.read(_v7, "vy"), 0.35), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 80), 40])), _S.invoke(_S.read(_v7, "R"), "range", [0.2, 0.5])])
		if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [_S.binary("*", _S.binary("*", 0.3, _S.read(_v7, "dt")), 60)])):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", _S.binary("*", _S.read(_v7, "vx"), 0.1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 30), 30])), _S.binary("+", _S.binary("*", _S.read(_v7, "vy"), 0.1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 40), 0])), _S.invoke(_S.read(_v7, "R"), "range", [0.8, 1.6]), _S.prop(_S.read(_v7, "H"), 3), (2 if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.2])) else 1)])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
			var _v11 = _S.scope(_e)
			_S.write(_v11, "hit", true, "=", false)
			_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 40), 100, _S.read(_v11, "WARM"), 0.95, 0.9])
			_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 20), 46, _S.read(_v11, "WHITE"), 0.9, 0.12])
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), 34)):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 1.3), 1.3])), 0.25))
				_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [50, 210]))
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "FIRE"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [2, 10])), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 0.75), 30), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 1.1]), 0, _S.invoke(_S.read(_v13, "R"), "range", [5, 9]), 0, (_S.binary("|", _S.prop(_S.read(_v13, "PF"), "SMOKES"), _S.prop(_S.read(_v13, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.5])) else 0)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
			var _v14 = _S.scope(_v11)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), 9)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "FIRE"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 6), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [130, 220])), _S.invoke(_S.read(_v14, "R"), "range", [0.8, 1.2]), 0, _S.invoke(_S.read(_v14, "R"), "range", [6, 8.5]), _S.invoke(_S.read(_v14, "R"), "range", [0, 0.12]), _S.binary("|", _S.prop(_S.read(_v14, "PF"), "SMOKES"), _S.prop(_S.read(_v14, "PF"), "BIG"))])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
			var _v15 = _S.scope(_v11)
			_S.define(_v15, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v15, "i"), 20)):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), 0]))
				_S.define(_v16, "d", _S.invoke(_S.read(_v16, "R"), "range", [4, 18]))
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "d")), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [6, 24])), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.invoke(_S.read(_v16, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [30, 110])), _S.invoke(_S.read(_v16, "R"), "range", [1.8, 2.8]), 0, _S.invoke(_S.read(_v16, "R"), "range", [8, 12]), _S.invoke(_S.read(_v16, "R"), "range", [0.15, 0.5]), _S.prop(_S.read(_v16, "PF"), "BIG")])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "i", 1, "+=", true)
			var _v17 = _S.scope(_v11)
			_S.define(_v17, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v17, "i"), 16)):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "s", _S.invoke(_S.read(_v18, "R"), "sign", []))
				_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [4, 18])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [1, 5])), _S.binary("+", _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [60, 130])), 10), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, 12])), _S.invoke(_S.read(_v18, "R"), "range", [1.2, 2]), _S.prop(_S.read(_v18, "st"), "dust"), _S.invoke(_S.read(_v18, "R"), "range", [5, 8]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v18, "PF"), "BIG")])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "i", 1, "+=", true)
			var _v19 = _S.scope(_v11)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 90)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 1.3), 1.3])), 0.15))
				_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [100, 300]))
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), 0, _S.unary("-", 4), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.2, 0.7])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
			var _v21 = _S.scope(_v11)
			_S.define(_v21, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v21, "i"), 36)):
				var _v22 = _S.scope(_v21)
				_S.define(_v22, "a", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
				_S.define(_v22, "sp", _S.invoke(_S.read(_v22, "R"), "range", [40, 150]))
				_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), 8), _S.binary("+", _S.unary("-", 8), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), 70), _S.invoke(_S.read(_v22, "R"), "range", [1.2, 2.6]), _S.prop(_S.read(_v22, "H"), 3)])
				_v21 = _S.iteration(_v21)
				_S.write(_v21, "i", 1, "+=", true)
			var _v23 = _S.scope(_v11)
			_S.define(_v23, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v23, "i"), 10)):
				var _v24 = _S.scope(_v23)
				_S.define(_v24, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v24, "Math"), "PI")), 2), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 1), 1.05])))
				_S.define(_v24, "sp", _S.invoke(_S.read(_v24, "R"), "range", [130, 240]))
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "BRAND"), 0, _S.unary("-", 6), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.invoke(_S.read(_v24, "R"), "range", [0.7, 1.3])])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "i", 1, "+=", true)
			var _v25 = _S.scope(_v11)
			_S.define(_v25, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "i"), 28)):
				_S.invoke(_S.read(_v25, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v25, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 8), 8])}, {"y": _S.unary("-", 3)}, {"vx": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 80), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [140, 340]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v25, "R"), "range", [1.8, 2.8])}, {"a": _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")])}, {"va": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v25, "R"), "int", [1, 3])}, {"ramp": [_S.read(_v25, "OUTLINE"), _S.prop(_S.read(_v25, "st"), "shade"), _S.prop(_S.read(_v25, "st"), "body"), _S.prop(_S.read(_v25, "st"), "light"), _S.call_value(_S.read(_v25, "mix"), [_S.prop(_S.read(_v25, "st"), "light"), _S.read(_v25, "WHITE"), 0.3])]}])])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "+=", true)
			var _v26 = _S.scope(_v11)
			_S.define(_v26, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v26, "i"), 80)):
				var _v27 = _S.scope(_v26)
				_S.define(_v27, "u", _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 1), 1]))
				_S.define(_v27, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v27, "Math"), "PI")), 2), _S.binary("*", _S.read(_v27, "u"), 0.7)), 0.15))
				_S.define(_v27, "sp", _S.binary("*", _S.invoke(_S.read(_v27, "R"), "range", [90, 270]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "u")])))))
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "GRIT"), _S.binary("*", _S.read(_v27, "u"), 6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.invoke(_S.read(_v27, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.prop(_S.read(_v27, "st"), "light"), _S.prop(_S.read(_v27, "st"), "body"), _S.prop(_S.read(_v27, "st"), "body"), _S.prop(_S.read(_v27, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.45])) else 1)])
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v28 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "b", _v28)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v29, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v29, "b"), "dusted")))):
			var _v30 = _S.scope(_v29)
			_S.set_prop(_S.read(_v30, "b"), "dusted", true, "=", false)
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "i"), 3)):
				_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v31, "b"), "x"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v31, "R"), "sign", []), _S.invoke(_S.read(_v31, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [2, 18])), _S.invoke(_S.read(_v31, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v31, "st"), "dust"), _S.invoke(_S.read(_v31, "R"), "range", [1.3, 2.6])])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "crater"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "simDraw"), [_S.read(_e, "p"), _S.read(_e, "ps"), _S.read(_e, "H"), "back"])
	_S.invoke(_S.read(_e, "blazes"), "drawBack", [_S.read(_e, "p")])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 110, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 1)], _S.function_value(_e, "_f12")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 110, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 1)], _S.function_value(_e, "_f14"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	for _v32 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "b", _v32)
		_S.call_value(_S.read(_v33, "rock"), [_S.read(_v33, "p"), _S.read(_v33, "b"), _S.read(_v33, "st")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v34 = _S.scope(_e)
		var _v35 = _S.call_value(_S.read(_v34, "pos"), [_S.read(_v34, "t")])
		_S.define(_v34, "x", _S.prop(_v35, 0))
		_S.define(_v34, "y", _S.prop(_v35, 1))
		_S.define(_v34, "NZ", _S.function_value(_v34, "_f15"))
		_S.call_value(_S.read(_v34, "floorLight"), [_S.read(_v34, "p"), 0, 0.5, _S.binary("+", 30, _S.binary("*", 40, _S.binary("/", _S.read(_v34, "t"), _S.read(_v34, "HIT")))), 7, _S.read(_v34, "GLOW"), _S.binary("*", 0.5, _S.binary("**", _S.binary("/", _S.read(_v34, "t"), _S.read(_v34, "HIT")), 2))])
		_S.invoke([[36, 7, 0], [26, 7.5, _S.unary("-", 2.5)], [26, 7.5, 2.5], [16, 8, 0]], "forEach", [_S.function_value(_v34, "_f16")])
		_S.call_value(_S.read(_v34, "meteor"), [_S.read(_v34, "p"), _S.read(_v34, "x"), _S.read(_v34, "y"), 6.5, 0])
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.read(_v34, "x"), _S.read(_v34, "y"), 46, _S.read(_v34, "GLOW"), 0.55])
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.read(_v34, "x"), _S.read(_v34, "y"), 12, _S.prop(_S.read(_v34, "H"), 1), 0.4])
	else:
		var _v37 = _S.scope(_e)
		_S.define(_v37, "a", _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "HIT")))
		_S.define(_v37, "cool", _S.call_value(_S.read(_v37, "clamp"), [_S.binary("/", _S.read(_v37, "a"), 2.8)]))
		_S.define(_v37, "end", _S.binary("-", 1, _S.call_value(_S.read(_v37, "smooth"), [_S.binary("-", _S.prop(_S.read(_v37, "meta"), "duration"), 1.1), _S.binary("-", _S.prop(_S.read(_v37, "meta"), "duration"), 0.2), _S.read(_v37, "t")])))
		if _S.truth(_S.binary(">", _S.read(_v37, "end"), 0)):
			var _v38 = _S.scope(_v37)
			_S.call_value(_S.read(_v38, "meteor"), [_S.read(_v38, "p"), 0, 0, 5.5, _S.read(_v38, "cool"), _S.read(_v38, "end")])
			_S.invoke(_S.read(_v38, "p"), "glow", [0, _S.unary("-", 2), 22, _S.read(_v38, "GLOW"), _S.binary("*", _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v38, "cool"))), _S.read(_v38, "end"))])
	_S.call_value(_S.read(_e, "simDraw"), [_S.read(_e, "p"), _S.read(_e, "ps"), _S.read(_e, "H"), "front"])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.08))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1))):
		var _v39 = _S.scope(_e)
		_S.invoke(_S.read(_v39, "p"), "circle", [0, _S.unary("-", 6), _S.binary("+", _S.binary("*", 11, _S.binary("-", 1, _S.binary("*", _S.read(_v39, "f"), 0.3))), 1.5), _S.prop(_S.read(_v39, "H"), 3)])
		_S.invoke(_S.read(_v39, "p"), "circle", [0, _S.unary("-", 6), _S.binary("*", 11, _S.binary("-", 1, _S.binary("*", _S.read(_v39, "f"), 0.3))), (_S.prop(_S.read(_v39, "H"), 1) if _S.truth(_S.binary("<", _S.read(_v39, "f"), 0.5)) else _S.prop(_S.read(_v39, "H"), 2))])
		_S.invoke(_S.read(_v39, "p"), "circle", [0, _S.unary("-", 6), _S.binary("*", 7, _S.binary("-", 1, _S.binary("*", _S.read(_v39, "f"), 0.3))), (_S.read(_v39, "WHITE") if _S.truth(_S.binary("<", _S.read(_v39, "f"), 0.5)) else _S.prop(_S.read(_v39, "H"), 1))])
	_S.define(_e, "fr", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.24))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "fr"), 0), func(): return _S.binary("<", _S.read(_e, "fr"), 1))):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, _S.unary("-", 6), _S.binary("*", 44, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "fr")), 1.4])), _S.binary("-", 1, _S.read(_e, "fr")), [_S.prop(_S.read(_e, "H"), 6), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 1)]])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "rate")), _S.read(_e, "off")), _S.read(_e, "seed")])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v36 = _S.arg(_args, 0)
	_S.define(_e, "L", _S.prop(_v36, 0))
	_S.define(_e, "w", _S.prop(_v36, 1))
	_S.define(_e, "off", _S.prop(_v36, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "n", _S.binary("*", _S.binary("+", _S.read(_e, "S"), _S.read(_e, "i")), 13))
	_S.call_value(_S.read(_e, "flameBlade"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "off"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "off"))), _S.unary("-", _S.read(_e, "ux")), _S.unary("-", _S.read(_e, "uy")), _S.binary("*", _S.read(_e, "L"), _S.binary("+", 0.85, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "NZ"), [5, _S.read(_e, "n")])))), _S.read(_e, "w"), _S.binary("*", _S.call_value(_S.read(_e, "NZ"), [3, _S.binary("+", _S.read(_e, "n"), 3)]), 3), _S.read(_e, "NZ"), _S.read(_e, "n"), _S.read(_e, "H"), _S.read(_e, "LAYERS"), 0.5, 1.6])
	return null
