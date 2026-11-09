@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/heal-aoe.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GREEN", _S.import_value("fx/holy/_lib.js", "GREEN"))
	_S.define(_e, "plus", _S.import_value("fx/holy/_lib.js", "plus"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Healing ring"}, {"desc": "A seed of green light sinks into the floor and a soft ring rolls out from it; the floor glows where it passes and plus signs sprout and float up."}, {"tags": ["holy", "heal", "aoe", "ring", "plus", "ground", "one-shot"]}, {"size": [256, 136]}, {"origin": [128, 104]}, {"duration": 2.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GREEN")}, {"reach": 104}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.2)
	_S.define(_e, "SEED", 0.3)
	_S.define(_e, "ROLL", 1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "wash", _S.function_value(_e, "_f1"))
	_S.define(_e, "ring", _S.function_value(_e, "_f3"))
	_S.define(_e, "sprouts", _S.function_value(_e, "_f7"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f8")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "front", _S.function_value(_e, "_f9"))
	_S.define(_e, "passed", _S.function_value(_e, "_f10"))
	_S.define(_e, "sites", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 26}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "riders", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "fr"), 2), func(): return _S.binary(">", _S.read(_e, "t"), 2.6))):
		return null
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "fr")), 1), _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "fr")), _S.read(_e, "SY")), 1), _S.binary("+", _S.read(_e, "fr"), 1), _S.binary("+", _S.binary("*", _S.read(_e, "fr"), _S.read(_e, "SY")), 1), _S.function_value(_e, "_f2")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.binary("/", _S.read(_e, "y"), _S.read(_e, "SY"))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "fr"))):
		return null
	_S.define(_e, "age", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "passed"), [_S.read(_e, "d")])))
	_S.define(_e, "k", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "age")), 0.35)]), _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "fr"), _S.binary("-", _S.read(_e, "fr"), 6), _S.read(_e, "d")])), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [1.4, 1.9, _S.read(_e, "t")]))))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.04)):
		return null
	_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 4), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.32, _S.read(_e, "k")), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SEED"))):
		return null
	_S.define(_e, "u", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "SEED"), _S.binary("+", _S.binary("+", _S.read(_e, "SEED"), _S.read(_e, "ROLL")), 0.25)]))
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	_S.define(_e, "k", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "u")), 0.3)))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	_S.define(_e, "keep", (_S.function_value(_e, "_f4") if _S.truth(_S.read(_e, "back")) else _S.function_value(_e, "_f5")))
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "fr"), _S.read(_e, "SY"), _S.invoke(_S.read(_e, "Math"), "max", [2, _S.binary("*", 7, _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 0.7)))]), _S.read(_e, "k"), _S.invoke(_S.read(_e, "C"), "slice", [2]), _S.read(_e, "keep"), _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SEED"), 0.08))])
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, 0, _S.binary("+", _S.read(_e, "fr"), 1), _S.binary("*", _S.binary("+", _S.read(_e, "fr"), 1), _S.read(_e, "SY")), _S.function_value(_e, "_f6"), _S.binary("*", _S.read(_e, "k"), (0.7 if _S.truth(_S.read(_e, "back")) else 1)), _S.read(_e, "keep")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	_S.define(_v0, "n", _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("*", _S.read(_v0, "fr"), 0.9)]))
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "g", _S.binary("*", _S.binary("/", _S.read(_v1, "j"), _S.read(_v1, "n")), _S.read(_v1, "TAU")))
		_S.define(_v1, "near", _S.binary(">=", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "g")]), 0))
		if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v1, "near"), _S.read(_v1, "back")), func(): return _S.binary(">", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "j"), _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.read(_v1, "t"), 20)])]), 0.45))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "j", 1, "+=", true)
			continue
		_S.define(_v1, "x", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "g")]), _S.read(_v1, "fr")))
		_S.define(_v1, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "g")]), _S.read(_v1, "fr")), _S.read(_v1, "SY")))
		_S.define(_v1, "h", _S.binary("*", _S.binary("*", _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "j"), 7]), 4)), _S.read(_v1, "k")), (1 if _S.truth(_S.read(_v1, "near")) else 0.6)))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 1)
		while _S.truth(_S.binary("<=", _S.read(_v2, "i"), _S.read(_v2, "h"))):
			_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "i")), (_S.read(_v2, "WHITE") if _S.truth(_S.binary(">", _S.read(_v2, "i"), _S.binary("-", _S.read(_v2, "h"), 1))) else _S.prop(_S.read(_v2, "C"), 6)), _S.binary("*", _S.read(_v2, "k"), _S.binary("-", 1.2, _S.binary("/", _S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "h"), 1))))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	for _v3 in _S.array(_S.read(_e, "riders")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "r", _v3)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "g", _S.binary("+", _S.prop(_S.read(_v5, "r"), "a"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v5, "r"), "w"), _S.binary("-", _S.read(_v5, "t"), _S.read(_v5, "SEED"))), 2.2)))
		_S.define(_v5, "near", _S.binary(">=", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), 0))
		if _S.truth(_S.binary("===", _S.read(_v5, "near"), _S.read(_v5, "back"))):
			continue
		_S.define(_v5, "x", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "g")]), _S.read(_v5, "fr")))
		_S.define(_v5, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), _S.read(_v5, "fr")), _S.read(_v5, "SY")))
		if _S.truth(_S.read(_v5, "near")):
			_S.call_value(_S.read(_v5, "sparkle"), [_S.read(_v5, "p"), _S.read(_v5, "x"), _S.binary("-", _S.read(_v5, "y"), 1), _S.binary("+", 2, (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v5, "t"), 9), _S.binary("*", _S.prop(_S.read(_v5, "r"), "a"), 5))]), 0.3)) else 0)), _S.read(_v5, "WHITE"), _S.prop(_S.read(_v5, "C"), 6), _S.binary("*", 0.35, _S.read(_v5, "k"))])
		else:
			_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 6), _S.read(_v5, "k")])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 8)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "g", _S.binary("*", _S.binary("/", _S.read(_v7, "i"), 8), _S.read(_v7, "TAU")))
			_S.invoke(_S.read(_v7, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "g")]), _S.read(_v7, "fr")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "g")]), _S.read(_v7, "fr")), _S.read(_v7, "SY")), 2), 16, _S.prop(_S.read(_v7, "C"), 4), _S.binary("*", 0.22, _S.read(_v7, "k"))])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0.3)) else _S.prop(_S.read(_e, "C"), 6))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	for _v8 in _S.array(_S.read(_e, "sites")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "s", _v8)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", _S.binary("-", _S.read(_v10, "t"), _S.prop(_S.read(_v10, "s"), "t0")))
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v10, "a"), 0), func(): return _S.binary(">", _S.read(_v10, "a"), _S.prop(_S.read(_v10, "s"), "life"))), func(): return _S.binary("!==", _S.binary("<", _S.prop(_S.read(_v10, "s"), "z"), 0), _S.read(_v10, "back")))):
			continue
		_S.define(_v10, "u", _S.binary("/", _S.read(_v10, "a"), _S.prop(_S.read(_v10, "s"), "life")))
		_S.define(_v10, "h", _S.binary("*", _S.prop(_S.read(_v10, "s"), "rise"), _S.invoke(_S.read(_v10, "ease"), "outCubic", [_S.read(_v10, "u")])))
		_S.define(_v10, "x", _S.binary("+", _S.prop(_S.read(_v10, "s"), "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v10, "a"), 4), _S.prop(_S.read(_v10, "s"), "sway"))]), 1.5), _S.read(_v10, "u"))))
		_S.define(_v10, "y", _S.binary("-", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v10, "s"), "z"), _S.read(_v10, "SY")), 2), _S.read(_v10, "h")))
		_S.define(_v10, "pop", _S.invoke(_S.read(_v10, "ease"), "outBack", [_S.call_value(_S.read(_v10, "clamp"), [_S.binary("/", _S.read(_v10, "a"), 0.12)]), 2.6]))
		_S.define(_v10, "end", _S.binary("-", _S.prop(_S.read(_v10, "s"), "life"), 0.15))
		_S.define(_v10, "L", _S.invoke(_S.read(_v10, "Math"), "max", [1, _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("-", _S.binary("*", _S.prop(_S.read(_v10, "s"), "L"), _S.read(_v10, "pop")), (1 if _S.truth(_S.read(_v10, "back")) else 0))])]))
		if _S.truth(_S.binary("<", _S.read(_v10, "a"), 0.04)):
			_S.call_value(_S.read(_v10, "sparkle"), [_S.read(_v10, "p"), _S.read(_v10, "x"), _S.read(_v10, "y"), 3, _S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 6), 0.5])
		else:
			if _S.truth(_S.binary("<", _S.read(_v10, "a"), _S.read(_v10, "end"))):
				_S.call_value(_S.read(_v10, "plus"), [_S.read(_v10, "p"), _S.read(_v10, "x"), _S.read(_v10, "y"), _S.read(_v10, "L"), (1 if _S.truth(_S.logical("&&", _S.read(_v10, "back"), func(): return _S.binary("<", _S.read(_v10, "L"), 3))) else _S.prop(_S.read(_v10, "s"), "thick")), (_S.invoke(_S.read(_v10, "C"), "slice", [0, 7]) if _S.truth(_S.read(_v10, "back")) else _S.read(_v10, "C")), (0.8 if _S.truth(_S.read(_v10, "back")) else 1), _S.logical("&&", _S.unary("!", _S.read(_v10, "back")), func(): return _S.binary(">", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v10, "a"), 12), _S.binary("*", _S.prop(_S.read(_v10, "s"), "sway"), 3))]), 0.8))])
			else:
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "v", _S.binary("/", _S.binary("-", _S.read(_v11, "a"), _S.read(_v11, "end")), 0.15))
				for _v12 in _S.array([[1, 1], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1], [_S.unary("-", 1), _S.unary("-", 1)]]):
					var _v13 = _S.scope(_v11)
					var _v14 = _v12
					_S.define(_v13, "dx", _S.prop(_v14, 0))
					_S.define(_v13, "dy", _S.prop(_v14, 1))
					_S.invoke(_S.read(_v13, "p"), "dot", [_S.binary("+", _S.read(_v13, "x"), _S.binary("*", _S.read(_v13, "dx"), _S.binary("+", 2, _S.binary("*", _S.read(_v13, "v"), 5)))), _S.binary("-", _S.binary("+", _S.read(_v13, "y"), _S.binary("*", _S.read(_v13, "dy"), _S.binary("+", 2, _S.binary("*", _S.read(_v13, "v"), 5)))), _S.binary("*", _S.read(_v13, "v"), 2)), (_S.read(_v13, "WHITE") if _S.truth(_S.binary("<", _S.read(_v13, "v"), 0.4)) else _S.prop(_S.read(_v13, "C"), 6)), _S.binary("-", 1, _S.read(_v13, "v"))])
		if _S.truth(_S.binary("<", _S.read(_v10, "u"), 0.5)):
			var _v15 = _S.scope(_v10)
			_S.define(_v15, "j", 1)
			while _S.truth(_S.binary("<", _S.read(_v15, "j"), _S.binary("*", _S.read(_v15, "h"), _S.binary("-", 1, _S.binary("*", _S.read(_v15, "u"), 2))))):
				_S.invoke(_S.read(_v15, "p"), "dot", [_S.prop(_S.read(_v15, "s"), "x"), _S.binary("+", _S.binary("+", _S.binary("-", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v15, "s"), "z"), _S.read(_v15, "SY")), 2), _S.read(_v15, "h")), _S.read(_v15, "j")), 3), _S.prop(_S.read(_v15, "C"), 5), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v15, "j"), _S.read(_v15, "h"))), _S.binary("-", 1, _S.binary("*", _S.read(_v15, "u"), 2))), (0.5 if _S.truth(_S.read(_v15, "back")) else 0.8))])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "j", 1.5, "+=", false)
		_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("+", 7, _S.binary("*", _S.read(_v10, "L"), 2)), _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", (0.2 if _S.truth(_S.read(_v10, "back")) else 0.34), (1 if _S.truth(_S.binary("<", _S.read(_v10, "a"), _S.read(_v10, "end"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v10, "a"), _S.read(_v10, "end")), 0.15))))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "SEED"))) else _S.binary("*", _S.read(_e, "REACH"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "SEED"), _S.binary("+", _S.read(_e, "SEED"), _S.read(_e, "ROLL"))])])))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "SEED"), _S.binary("*", _S.read(_e, "ROLL"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "cbrt", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [0.999, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "REACH"))]))]))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.binary("*", _S.read(_e, "REACH"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "R"), "range", [0.04, 0.92])])))
	_S.define(_e, "big", _S.binary("<", _S.binary("%", _S.read(_e, "i"), 5), 2))
	return _S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))}, {"z": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d"))}, {"t0": _S.binary("+", _S.call_value(_S.read(_e, "passed"), [_S.read(_e, "d")]), _S.invoke(_S.read(_e, "R"), "range", [0, 0.06]))}, {"rise": _S.invoke(_S.read(_e, "R"), "range", [18, 34])}, {"life": _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.3])}, {"sway": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"L": (_S.binary("+", 3, (1 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "i"), 5), 0)) else 0)) if _S.truth(_S.read(_e, "big")) else (1 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "i"), 5), 2)) else 2))}, {"thick": (3 if _S.truth(_S.read(_e, "big")) else 1)}, {"popped": false}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 14), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.2), 0.2]))}, {"w": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.1]), (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)))}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SEED"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "D", _S.invoke(_S.read(_v16, "R"), "range", [24, 48]))
		_S.define(_v16, "x", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "D")))
		_S.define(_v16, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "D")), _S.read(_v16, "SY")), _S.invoke(_S.read(_v16, "R"), "range", [1, 8])))
		_S.define(_v16, "T", _S.invoke(_S.read(_v16, "R"), "range", [0.16, 0.24]))
		_S.define(_v16, "l", _S.logical("||", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), 3)]), func(): return 1))
		_S.define(_v16, "v", _S.binary("/", _S.binary("*", _S.read(_v16, "l"), 3), _S.binary("-", _S.invoke(_S.read(_v16, "Math"), "exp", [_S.binary("*", 3, _S.read(_v16, "T"))]), 1)))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STREAK"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v16, "x")), _S.read(_v16, "l")), _S.read(_v16, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.unary("-", 3), _S.read(_v16, "y")), _S.read(_v16, "l")), _S.read(_v16, "v")), _S.read(_v16, "T"), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "released")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SEED")))):
		var _v17 = _S.scope(_e)
		_S.write(_v17, "released", true, "=", false)
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 16), 76, _S.prop(_S.read(_v17, "C"), 5), 0.85, 0.55])
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 6), 28, _S.read(_v17, "WHITE"), 0.8, 0.12])
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 10)):
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "MOTE"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, 10])), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [80, 170])), _S.invoke(_S.read(_v18, "R"), "range", [0.3, 0.6]), (_S.read(_v18, "WHITE") if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.5])) else _S.prop(_S.read(_v18, "C"), 6)), _S.invoke(_S.read(_v18, "R"), "range", [0.6, 1])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v19 = _S.scope(_v17)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 16)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [_S.binary("*", _S.prop(_S.read(_v20, "Math"), "PI"), 1.05), _S.binary("*", _S.prop(_S.read(_v20, "Math"), "PI"), 1.95)]))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 120]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STAR"), 0, _S.unary("-", 3), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.4, 0.8]), (_S.read(_v20, "WHITE") if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 6)), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 2])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
	for _v21 in _S.array(_S.read(_e, "sites")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "s", _v21)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v22, "s"), "popped")), func(): return _S.binary(">=", _S.read(_v22, "t"), _S.prop(_S.read(_v22, "s"), "t0")))):
			var _v23 = _S.scope(_v22)
			_S.set_prop(_S.read(_v23, "s"), "popped", true, "=", false)
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v24, "i"), 3)):
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v24, "s"), "x"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v24, "s"), "z"), _S.read(_v24, "SY")), 1), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [15, 40])), _S.invoke(_S.read(_v24, "R"), "range", [0.3, 0.6]), (_S.read(_v24, "WHITE") if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.prop(_S.read(_v24, "C"), 6)), _S.invoke(_S.read(_v24, "R"), "range", [0.5, 1.2]), 0, (4 if _S.truth(_S.binary("<", _S.prop(_S.read(_v24, "s"), "z"), 0)) else 0)])
				_v24 = _S.iteration(_v24)
				_S.write(_v24, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SEED"), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), 1.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "fr", _S.call_value(_S.read(_v25, "front"), [_S.read(_v25, "t")]))
		_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
		_S.define(_v25, "d", _S.binary("*", _S.read(_v25, "fr"), _S.invoke(_S.read(_v25, "Math"), "sqrt", [_S.invoke(_S.read(_v25, "R"), "next", [])])))
		_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "d")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "d")), _S.read(_v25, "SY")), 1), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [10, 30])), _S.invoke(_S.read(_v25, "R"), "range", [0.5, 1]), _S.prop(_S.read(_v25, "C"), 5), 1, 0, (4 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), 0)) else 0)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "wash"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "sprouts"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), false])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SEED"))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "k", _S.binary("/", _S.read(_v26, "t"), _S.read(_v26, "SEED")))
		_S.call_value(_S.read(_v26, "sparkle"), [_S.read(_v26, "p"), 0, _S.unary("-", 3), _S.binary("+", 2, _S.binary("*", _S.binary("*", 4, _S.read(_v26, "k")), _S.read(_v26, "k"))), _S.read(_v26, "WHITE"), _S.prop(_S.read(_v26, "C"), 6), _S.binary("+", 0.3, _S.binary("*", 0.4, _S.read(_v26, "k")))])
		_S.invoke(_S.read(_v26, "p"), "glow", [0, _S.unary("-", 3), _S.binary("+", 10, _S.binary("*", 16, _S.read(_v26, "k"))), _S.prop(_S.read(_v26, "C"), 4), _S.binary("*", 0.5, _S.read(_v26, "k"))])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SEED"), 0.2))):
			_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, _S.unary("-", 3), _S.binary("*", 22, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SEED")), 0.2)), 1.5])), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SEED")), 0.2)), _S.invoke(_S.read(_e, "C"), "slice", [3])])
	_S.define(_e, "g", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "SEED"), _S.binary("+", _S.read(_e, "SEED"), 0.5)]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 1))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "top", _S.binary("-", _S.binary("-", _S.unary("-", 4), _S.binary("*", 46, _S.invoke(_S.read(_v27, "ease"), "outCubic", [_S.invoke(_S.read(_v27, "Math"), "min", [1, _S.binary("*", _S.read(_v27, "g"), 2.2)])]))), _S.binary("*", 10, _S.read(_v27, "g"))))
		_S.define(_v27, "bot", _S.binary("-", _S.unary("-", 2), _S.binary("*", 50, _S.invoke(_S.read(_v27, "ease"), "inQuad", [_S.call_value(_S.read(_v27, "seg"), [_S.read(_v27, "g"), 0.35, 1])]))))
		_S.define(_v27, "w", _S.binary("+", 1, _S.binary("*", 2.4, _S.binary("-", 1, _S.read(_v27, "g")))))
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v27, "bot"), _S.read(_v27, "top")), 2)):
			var _v28 = _S.scope(_v27)
			_S.invoke(_S.read(_v28, "p"), "beam", [0, _S.read(_v28, "bot"), 0, _S.read(_v28, "top"), _S.binary("*", _S.read(_v28, "w"), 2), _S.function_value(_v28, "_f16")])
			_S.invoke(_S.read(_v28, "p"), "glowLine", [0, _S.read(_v28, "bot"), 0, _S.read(_v28, "top"), 12, _S.prop(_S.read(_v28, "C"), 5), _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_v28, "g")))])
			_S.call_value(_S.read(_v28, "sparkle"), [_S.read(_v28, "p"), 0, _S.read(_v28, "top"), _S.binary("+", _S.binary("*", 4, _S.binary("-", 1, _S.read(_v28, "g"))), 1), _S.read(_v28, "WHITE"), _S.prop(_S.read(_v28, "C"), 6), _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v28, "g")))])
	_S.call_value(_S.read(_e, "sprouts"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.45)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.8)) else _S.prop(_S.read(_e, "C"), 6)))
