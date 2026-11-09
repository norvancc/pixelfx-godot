@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/small-explosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f1"))
	_S.define(_e, "rock", _S.function_value(_e, "_f2"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Explosion"}, {"desc": "A ground blast: a white flash and shock rings, fire that cools into a rolling smoke column, sparks, burning brands that land and keep burning, tumbling rocks and a glowing scorch."}, {"tags": ["explosion", "fire", "smoke", "debris", "impact", "one-shot"]}, {"size": [300, 240]}, {"origin": [150, 196]}, {"duration": 5.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"size": 1}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
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
	_S.define(_e, "F", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "rx0", _S.arg(_args, 3))
	_S.define(_e, "cool", _S.arg(_args, 4))
	_S.define(_e, "fade", _S.arg(_args, 5))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	_S.define(_e, "rx", _S.binary("*", _S.read(_e, "rx0"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "t"), 0.08)])))
	_S.define(_e, "ry", 4)
	_S.define(_e, "heat", _S.invoke(_S.concat([_S.array(_S.read(_e, "F"))]), "reverse", []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), 2)):
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
			_S.define(_v2, "k", _S.call_value(_S.read(_v2, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v2, "x"), 31), _S.read(_v2, "y")), 3]))
			_S.define(_v2, "T", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "pow", [_S.call_value(_S.read(_v2, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v2, "t"), _S.read(_v2, "cool")))]), 1.4]), _S.binary("-", 1.25, _S.read(_v2, "d"))), _S.binary("*", _S.read(_v2, "k"), 0.35)))
			if _S.truth(_S.binary(">", _S.read(_v2, "T"), 0.06)):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "c", _S.prop(_S.read(_v3, "heat"), _S.invoke(_S.read(_v3, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v3, "heat"), "length"), 1), _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.read(_v3, "T")])), _S.binary("-", _S.prop(_S.read(_v3, "heat"), "length"), 1))])])))
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "c"), _S.read(_v3, "fade")])
				if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v3, "x"), 3), 0)):
					_S.invoke(_S.read(_v3, "p"), "glow", [_S.binary("+", _S.read(_v3, "x"), 0.5), _S.read(_v3, "y"), 6, _S.read(_v3, "c"), _S.binary("*", _S.binary("*", 0.18, _S.read(_v3, "T")), _S.read(_v3, "fade"))])
			else:
				_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.read(_v2, "SOOT") if _S.truth(_S.binary("<", _S.read(_v2, "d"), 0.5)) else _S.read(_v2, "SOOT2")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v2, "d"), _S.binary("-", 0.95, _S.binary("*", _S.read(_v2, "k"), 0.3)))) else _S.binary("-", 1, _S.read(_v2, "d"))), _S.read(_v2, "fade"))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.75)))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f3")])
	return null

static func _f3(_parent, _args: Array, _this=null):
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

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "size"))
	_S.define(_e, "RAD", _S.binary("*", 18, _S.read(_e, "S")))
	_S.define(_e, "POWER", _S.binary("*", 0.9, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "S"), 0.8])))
	_S.define(_e, "EARTH", 1.6)
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}, {"onLand": _S.function_value(_e, "_f6")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flashes", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "Y", _S.binary("*", _S.unary("-", _S.read(_e, "RAD")), 0.3))
	_S.define(_e, "t", 0)
	_S.invoke(_S.read(_e, "flashes"), "push", [_S.merge([{"r": _S.binary("*", _S.read(_e, "RAD"), 1.05)}, {"life": 0.06}, {"max": 0.06}])])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": _S.binary("*", _S.read(_e, "RAD"), 0.45)}, {"r1": _S.binary("*", _S.read(_e, "RAD"), 2.7)}, {"life": 0.34}, {"max": 0.34}, {"thick": 3}, {"c": _S.prop(_S.read(_e, "F"), 5)}]), _S.merge([{"r0": _S.binary("*", _S.read(_e, "RAD"), 0.3)}, {"r1": _S.binary("*", _S.read(_e, "RAD"), 1.6)}, {"life": 0.22}, {"max": 0.22}, {"thick": 1.8}, {"c": _S.prop(_S.read(_e, "F"), 3)}])])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "RAD"), 3.4), _S.read(_e, "WARM"), _S.binary("*", 0.6, _S.read(_e, "POWER")), 0.7])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "RAD"), 1.6), _S.read(_e, "WHITE"), 0.6, 0.08])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 5)):
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "FIRE"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 2.5), 2.5]), _S.binary("+", _S.read(_v4, "Y"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 2.5), 2.5])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v4, "R"), "range", [0.18, 0.3]), 0, _S.invoke(_S.read(_v4, "R"), "range", [_S.binary("*", _S.read(_v4, "RAD"), 0.4), _S.binary("*", _S.read(_v4, "RAD"), 0.55)])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("*", 28, _S.read(_v5, "POWER"))]))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
		_S.define(_v6, "d", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.binary("*", _S.read(_v6, "RAD"), 0.55)]))
		_S.define(_v6, "sp", _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [40, 210]), _S.read(_v6, "POWER")))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "d")), _S.binary("+", _S.read(_v6, "Y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 0.8), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.55, 1.15]), 0, _S.invoke(_S.read(_v6, "R"), "range", [_S.binary("*", _S.read(_v6, "RAD"), 0.22), _S.binary("*", _S.read(_v6, "RAD"), 0.46)]), 0, (_S.binary("|", _S.prop(_S.read(_v6, "PF"), "SMOKES"), _S.prop(_S.read(_v6, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.45])) else 0)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 5)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "R"), "range", [_S.binary("*", _S.read(_v8, "RAD"), 0.1), _S.binary("*", _S.read(_v8, "RAD"), 0.5)]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d")), _S.binary("+", _S.read(_v8, "Y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d"))), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), 30), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 20), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.9, 1.5]), _S.call_value(_S.read(_v8, "rgb"), [34, 29, 38]), _S.invoke(_S.read(_v8, "R"), "range", [_S.binary("*", _S.read(_v8, "RAD"), 0.15), _S.binary("*", _S.read(_v8, "RAD"), 0.26)]), _S.invoke(_S.read(_v8, "R"), "range", [0.06, 0.2]), _S.prop(_S.read(_v8, "PF"), "BIG")])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 5)):
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "FIRE"), _S.invoke(_S.read(_v9, "R"), "range", [_S.binary("*", _S.unary("-", _S.read(_v9, "RAD")), 0.25), _S.binary("*", _S.read(_v9, "RAD"), 0.25)]), _S.read(_v9, "Y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 180), _S.unary("-", 100)]), _S.invoke(_S.read(_v9, "R"), "range", [0.8, 1.3]), 0, _S.invoke(_S.read(_v9, "R"), "range", [_S.binary("*", _S.read(_v9, "RAD"), 0.24), _S.binary("*", _S.read(_v9, "RAD"), 0.36)]), _S.invoke(_S.read(_v9, "R"), "range", [0, 0.1]), (_S.binary("|", _S.prop(_S.read(_v9, "PF"), "SMOKES"), _S.prop(_S.read(_v9, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.6])) else 0)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("*", 10, _S.read(_v10, "POWER"))]))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
		_S.define(_v11, "d", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.binary("*", _S.read(_v11, "RAD"), 0.7)]))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [15, 100]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "d")), _S.binary("+", _S.read(_v11, "Y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "d"))), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 0.6), 35), _S.invoke(_S.read(_v11, "R"), "range", [1.8, 2.8]), 0, _S.invoke(_S.read(_v11, "R"), "range", [_S.binary("*", _S.read(_v11, "RAD"), 0.26), _S.binary("*", _S.read(_v11, "RAD"), 0.44)]), _S.invoke(_S.read(_v11, "R"), "range", [0.12, 0.45]), _S.prop(_S.read(_v11, "PF"), "BIG")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", 80, _S.read(_v12, "POWER"))]))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "sp", _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [140, 380]), _S.read(_v13, "POWER")))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), 0, _S.read(_v13, "Y"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 70), _S.invoke(_S.read(_v13, "R"), "range", [0.18, 0.6])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.invoke(_S.read(_v14, "Math"), "round", [_S.binary("*", 40, _S.read(_v14, "POWER"))]))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.invoke(_S.read(_v15, "R"), "range", [0, _S.read(_v15, "TAU")]))
		_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [30, 150]))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "EMBER"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "RAD")), 0.4), _S.binary("+", _S.read(_v15, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "RAD")), 0.4)), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), 75), _S.invoke(_S.read(_v15, "R"), "range", [1.2, 2.6]), _S.prop(_S.read(_v15, "F"), 3)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.invoke(_S.read(_v16, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v16, "R"), "range", [9, 14]), _S.invoke(_S.read(_v16, "Math"), "max", [0, _S.binary("-", _S.read(_v16, "POWER"), 0.55)]))]))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.35), 1.35])))
		_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [170, 330]))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "BRAND"), 0, _S.read(_v17, "Y"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.3])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("*", _S.read(_v18, "RAD"), 0.5)]))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "s", _S.invoke(_S.read(_v19, "R"), "sign", []))
		_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SMOKE"), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [0, _S.binary("*", _S.read(_v19, "RAD"), 0.6)])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [1, _S.binary("+", 5, _S.binary("*", _S.read(_v19, "RAD"), 0.04))])), _S.binary("*", _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [3, 9.5])), _S.read(_v19, "RAD")), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 15])), _S.invoke(_S.read(_v19, "R"), "range", [1.1, 2]), _S.prop(_S.read(_v19, "st"), "dust"), _S.binary("+", _S.invoke(_S.read(_v19, "R"), "range", [4, 7]), _S.binary("/", _S.read(_v19, "RAD"), 6)), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v19, "PF"), "BIG")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.binary("*", 26, _S.invoke(_S.read(_v20, "Math"), "min", [1.5, _S.read(_v20, "S")])))):
		_S.invoke(_S.read(_v20, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v20, "B"), "CHUNK")}, {"x": _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.read(_v20, "RAD"))}, {"y": _S.unary("-", 3)}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v20, "RAD")), 0.25)}, {"vy": _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [7, 16])), _S.read(_v20, "RAD")), 0.9)}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [1.8, 2.6])}, {"a": _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")])}, {"va": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v20, "R"), "int", [1, 3])}])])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), _S.invoke(_S.read(_v21, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_v21, "EARTH"), _S.read(_v21, "RAD")), 4)]))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "u", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v22, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v22, "Math"), "PI")), 2), _S.binary("*", _S.read(_v22, "u"), 0.5)))
		_S.define(_v22, "sp", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [5, 15]), _S.read(_v22, "RAD")), _S.binary("-", 1, _S.binary("*", 0.45, _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "u")])))))
		_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "GRIT"), _S.binary("*", _S.binary("*", _S.read(_v22, "u"), 0.25), _S.read(_v22, "RAD")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.invoke(_S.read(_v22, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.prop(_S.read(_v22, "st"), "light"), _S.prop(_S.read(_v22, "st"), "body"), _S.prop(_S.read(_v22, "st"), "body"), _S.prop(_S.read(_v22, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.45])) else 1)])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "i"), _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("*", _S.read(_v23, "EARTH"), 12)]))):
		_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v23, "RAD")), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, _S.binary("*", _S.read(_v23, "RAD"), 0.6)])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 15), 15]), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [60, 190])), _S.read(_v23, "EARTH")), 0.6), _S.invoke(_S.read(_v23, "R"), "range", [1.6, 2.6]), _S.prop(_S.read(_v23, "st"), "dust"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [5, 9]), _S.invoke(_S.read(_v23, "Math"), "sqrt", [_S.read(_v23, "S")])), _S.binary("/", _S.read(_v23, "RAD"), 7)), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.15]), _S.prop(_S.read(_v23, "PF"), "BIG")])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "+=", true)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "blazes"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.25), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5]), _S.invoke(_S.read(_e, "R"), "range", [0.55, 0.85])])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v24 in _S.array([_S.read(_e, "flashes"), _S.read(_e, "rings")]):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
			if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "life", _S.read(_v26, "dt"), "-=", false), 0)):
				_S.invoke(_S.read(_v26, "a"), "splice", [_S.read(_v26, "i"), 1])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v27 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "b", _v27)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v28, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v28, "b"), "dusted")))):
			var _v29 = _S.scope(_v28)
			_S.set_prop(_S.read(_v29, "b"), "dusted", true, "=", false)
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v30, "i"), 3)):
				_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v30, "b"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "R"), "sign", []), _S.invoke(_S.read(_v30, "R"), "range", [10, 55])), 0.6), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 22])), _S.invoke(_S.read(_v30, "R"), "range", [0.3, 0.65]), _S.prop(_S.read(_v30, "st"), "dust"), _S.invoke(_S.read(_v30, "R"), "range", [1.3, 2.8])])
				_v30 = _S.iteration(_v30)
				_S.write(_v30, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "scorch"), [_S.read(_e, "p"), _S.read(_e, "F"), _S.read(_e, "t"), _S.binary("*", 22, _S.read(_e, "S")), _S.binary("+", 1.2, _S.binary("/", _S.read(_e, "RAD"), 14)), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 1.2), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.2), _S.read(_e, "t")]))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.invoke(_S.read(_e, "blazes"), "drawBack", [_S.read(_e, "p")])
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", _S.binary("*", 80, _S.read(_e, "S")), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", _S.binary("+", 2, _S.binary("/", _S.read(_e, "RAD"), 9)), _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6)], _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", _S.binary("*", 80, _S.read(_e, "S")), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", _S.binary("+", 2, _S.binary("/", _S.read(_e, "RAD"), 9)), _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6)], _S.function_value(_e, "_f11")])
	for _v31 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "b", _v31)
		_S.call_value(_S.read(_v32, "rock"), [_S.read(_v32, "p"), _S.read(_v32, "b"), _S.read(_v32, "st")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	for _v33 in _S.array(_S.read(_e, "flashes")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "f", _v33)
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "k2", _S.binary("/", _S.prop(_S.read(_v35, "f"), "life"), _S.prop(_S.read(_v35, "f"), "max")))
		_S.define(_v35, "r", _S.binary("*", _S.prop(_S.read(_v35, "f"), "r"), _S.binary("+", 0.8, _S.binary("*", 0.2, _S.read(_v35, "k2")))))
		_S.invoke(_S.read(_v35, "p"), "circle", [0, _S.read(_v35, "Y"), _S.binary("+", _S.read(_v35, "r"), 1.2), _S.prop(_S.read(_v35, "F"), 2)])
		_S.invoke(_S.read(_v35, "p"), "circle", [0, _S.read(_v35, "Y"), _S.read(_v35, "r"), (_S.prop(_S.read(_v35, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v35, "k2"), 0.45)) else _S.prop(_S.read(_v35, "F"), 5))])
		_S.invoke(_S.read(_v35, "p"), "circle", [0, _S.read(_v35, "Y"), _S.binary("*", _S.read(_v35, "r"), 0.6), (_S.read(_v35, "WHITE") if _S.truth(_S.binary(">", _S.read(_v35, "k2"), 0.45)) else _S.prop(_S.read(_v35, "F"), 6))])
	for _v36 in _S.array(_S.read(_e, "rings")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "r", _v36)
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "k2", _S.binary("/", _S.prop(_S.read(_v38, "r"), "life"), _S.prop(_S.read(_v38, "r"), "max")))
		_S.define(_v38, "e", _S.binary("-", 1, _S.invoke(_S.read(_v38, "Math"), "pow", [_S.read(_v38, "k2"), 3])))
		_S.invoke(_S.read(_v38, "p"), "ring", [0, _S.read(_v38, "Y"), _S.binary("+", _S.prop(_S.read(_v38, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v38, "r"), "r1"), _S.prop(_S.read(_v38, "r"), "r0")), _S.read(_v38, "e"))), _S.invoke(_S.read(_v38, "Math"), "max", [1, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v38, "r"), "thick"), _S.read(_v38, "k2")), 0.4)]), _S.prop(_S.read(_v38, "r"), "c"), _S.invoke(_S.read(_v38, "Math"), "min", [1, _S.binary("*", _S.read(_v38, "k2"), 1.6)])])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)
