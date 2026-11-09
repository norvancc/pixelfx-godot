@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/holy-pillar.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "Feathers", _S.import_value("fx/holy/_lib.js", "Feathers"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Holy pillar"}, {"desc": "Light breaks through from above: a sun opens at the top and a fan of shafts converges on the mark, pulsing, while a sigil burns on the floor; then the fan folds shut."}, {"tags": ["holy", "pillar", "light", "rays", "aoe", "sigil", "ground", "one-shot"]}, {"size": [192, 232]}, {"origin": [96, 204]}, {"duration": 3.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"shafts": 7}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TOP", _S.unary("-", 204))
	_S.define(_e, "PY", _S.unary("-", 1))
	_S.define(_e, "SUN", _S.binary("+", _S.read(_e, "TOP"), 38))
	_S.define(_e, "SY", 0.24)
	_S.define(_e, "RX", 26)
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "HIT", 0.66)
	_S.define(_e, "FOLD", 2.05)
	_S.define(_e, "SHUT", 2.45)
	_S.define(_e, "LIFT", 2.75)
	_S.define(_e, "frac", _S.function_value(_e, "_f28"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "fan", _S.function_value(_e, "_f1"))
	_S.define(_e, "sun", _S.function_value(_e, "_f2"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f6"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "N", _S.invoke(_S.read(_e, "Math"), "max", [3, _S.binary("|", _S.prop(_S.read(_e, "o"), "shafts"), 0)]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "mid", _S.binary("/", _S.binary("-", _S.read(_e, "N"), 1), 2))
	_S.define(_e, "WING", [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f15")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "feathers", _S.construct(_S.read(_e, "Feathers"), [_S.read(_e, "R"), 0]))
	_S.define(_e, "shafts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f16")]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 72}]), _S.function_value(_e, "_f17")]))
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 6)):
		_S.invoke(_S.read(_v16, "feathers"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 46), 46])}, {"y": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 150), _S.unary("-", 100)])}, {"vx": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.invoke(_S.read(_v16, "R"), "range", [0, 8])}, {"a": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.4), 0.4])}, {"len": _S.invoke(_S.read(_v16, "R"), "range", [7, 9])}, {"wid": _S.invoke(_S.read(_v16, "R"), "range", [1.9, 2.3])}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1.4, 1.7])}, {"sink": _S.invoke(_S.read(_v16, "R"), "range", [26, 36])}, {"back": _S.binary("===", _S.binary("%", _S.read(_v16, "i"), 3), 0)}, {"delay": _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v16, "HIT"), 0.1), _S.binary("*", _S.read(_v16, "i"), 0.16)), _S.invoke(_S.read(_v16, "R"), "range", [0, 0.08]))}])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.define(_e, "DMAX", _S.binary("-", _S.read(_e, "PY"), _S.read(_e, "TOP")))
	_S.define(_e, "row", _S.construct(_S.read(_e, "Float32Array"), [192]))
	_S.define(_e, "core", _S.construct(_S.read(_e, "Uint8Array"), [192]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "shut", false)
	_S.define(_e, "glinted", false)
	_S.define(_e, "angle", _S.function_value(_e, "_f18"))
	_S.define(_e, "frontD", _S.function_value(_e, "_f19"))
	_S.define(_e, "liftD", _S.function_value(_e, "_f20"))
	_S.define(_e, "fade", _S.function_value(_e, "_f21"))
	_S.define(_e, "width", _S.function_value(_e, "_f22"))
	_S.define(_e, "pulse", _S.function_value(_e, "_f23"))
	_S.define(_e, "lightAt", _S.function_value(_e, "_f24"))
	return _S.merge([{"update": _S.function_value(_e, "_f25")}, {"drawBack": _S.function_value(_e, "_f26")}, {"draw": _S.function_value(_e, "_f27")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "fade"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	_S.define(_e, "lift", _S.call_value(_S.read(_e, "liftD"), [_S.read(_e, "t")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.read(_v0, "TOP")]))
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "PY"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "dy", _S.binary("-", _S.read(_v1, "PY"), _S.binary("+", _S.read(_v1, "y"), 0.5)))
		_S.invoke(_S.read(_v1, "row"), "fill", [0])
		_S.invoke(_S.read(_v1, "core"), "fill", [0])
		_S.define(_v1, "any", false)
		for _v2 in _S.array(_S.read(_v1, "shafts")):
			var _v3 = _S.scope(_v1)
			_S.define(_v3, "s", _v2)
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "a", _S.call_value(_S.read(_v4, "angle"), [_S.read(_v4, "s"), _S.read(_v4, "t")]))
			_S.define(_v4, "ca", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]))
			_S.define(_v4, "d", _S.binary("/", _S.read(_v4, "dy"), _S.read(_v4, "ca")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v4, "d"), _S.read(_v4, "lift")), func(): return _S.binary("<", _S.read(_v4, "d"), _S.binary("-", _S.call_value(_S.read(_v4, "frontD"), [_S.read(_v4, "s"), _S.read(_v4, "t")]), 6)))):
				continue
			_S.define(_v4, "xc", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "tan", [_S.read(_v4, "a")]), _S.read(_v4, "dy")))
			_S.define(_v4, "hw", _S.binary("/", _S.binary("/", _S.call_value(_S.read(_v4, "width"), [_S.read(_v4, "s"), _S.read(_v4, "d"), _S.read(_v4, "t")]), 2), _S.read(_v4, "ca")))
			_S.define(_v4, "soft", _S.binary("*", _S.call_value(_S.read(_v4, "smooth"), [_S.binary("-", _S.call_value(_S.read(_v4, "frontD"), [_S.read(_v4, "s"), _S.read(_v4, "t")]), 6), _S.binary("+", _S.call_value(_S.read(_v4, "frontD"), [_S.read(_v4, "s"), _S.read(_v4, "t")]), 4), _S.read(_v4, "d")]), _S.call_value(_S.read(_v4, "smooth"), [_S.read(_v4, "lift"), _S.binary("+", _S.read(_v4, "lift"), 6), _S.read(_v4, "d")])))
			_S.define(_v4, "I0", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v4, "s"), "b"), _S.call_value(_S.read(_v4, "pulse"), [_S.read(_v4, "s"), _S.read(_v4, "d"), _S.read(_v4, "t")])), _S.read(_v4, "soft")), _S.read(_v4, "k")))
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.read(_v5, "xc"), _S.read(_v5, "hw"))]))
			while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("+", _S.read(_v5, "xc"), _S.read(_v5, "hw"))]))):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "v", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v6, "x"), 0.5), _S.read(_v6, "xc")), _S.read(_v6, "hw")))
				_S.define(_v6, "i", _S.binary("+", _S.read(_v6, "x"), 96))
				if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v6, "i"), 0), func(): return _S.binary(">=", _S.read(_v6, "i"), 192)), func(): return _S.binary(">=", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "v")]), 1))):
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "x", 1, "+=", true)
					continue
				_S.set_prop(_S.read(_v6, "row"), _S.read(_v6, "i"), _S.binary("*", _S.read(_v6, "I0"), _S.invoke(_S.read(_v6, "Math"), "pow", [_S.binary("-", 1, _S.binary("*", _S.read(_v6, "v"), _S.read(_v6, "v"))), 1.3])), "+=", false)
				_S.write(_v6, "any", true, "=", false)
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
			_S.define(_v4, "ci", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "round", [_S.binary("-", _S.read(_v4, "xc"), 0.5)]), 96))
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v4, "ci"), 0), func(): return _S.binary("<", _S.read(_v4, "ci"), 192))):
				_S.set_prop(_S.read(_v4, "core"), _S.read(_v4, "ci"), _S.invoke(_S.read(_v4, "Math"), "max", [_S.prop(_S.read(_v4, "core"), _S.read(_v4, "ci")), _S.invoke(_S.read(_v4, "Math"), "min", [255, _S.binary("*", _S.read(_v4, "I0"), 200)])]), "=", false)
		if _S.truth(_S.unary("!", _S.read(_v1, "any"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "y", 1, "+=", true)
			continue
		var _v7 = _S.scope(_v1)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 192)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "I", _S.prop(_S.read(_v8, "row"), _S.read(_v8, "i")))
			if _S.truth(_S.binary("<", _S.read(_v8, "I"), 0.02)):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "i", 1, "+=", true)
				continue
			_S.define(_v8, "x", _S.binary("-", _S.read(_v8, "i"), 96))
			_S.invoke(_S.read(_v8, "p"), "blend", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 6), _S.invoke(_S.read(_v8, "Math"), "min", [0.6, _S.binary("*", _S.read(_v8, "I"), 0.38)])])
			_S.invoke(_S.read(_v8, "p"), "light", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 4), _S.invoke(_S.read(_v8, "Math"), "min", [0.9, _S.binary("*", _S.read(_v8, "I"), 0.32)])])
			if _S.truth(_S.prop(_S.read(_v8, "core"), _S.read(_v8, "i"))):
				_S.invoke(_S.read(_v8, "p"), "dot", [_S.read(_v8, "x"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.binary(">", _S.prop(_S.read(_v8, "core"), _S.read(_v8, "i")), 150)) else _S.prop(_S.read(_v8, "C"), 6)), _S.invoke(_S.read(_v8, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v8, "core"), _S.read(_v8, "i")), 180)])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "HIT"), 0.05))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "PY"), 3), 20, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.read(_e, "k"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.binary("*", _S.binary("*", 15, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.02, 0.45]), 1.8])), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "SHUT"), _S.binary("+", _S.read(_e, "LIFT"), 0.1)]), 1.5]))))
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 0.5)):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "spin", _S.binary("*", _S.read(_v9, "t"), 0.6))
		_S.invoke(_S.read(_v9, "p"), "glow", [0, _S.read(_v9, "SUN"), _S.invoke(_S.read(_v9, "Math"), "min", [32, _S.binary("*", _S.read(_v9, "r"), 3)]), _S.prop(_S.read(_v9, "C"), 4), 0.5])
		_S.invoke(_S.read(_v9, "p"), "glow", [0, _S.read(_v9, "SUN"), _S.binary("*", _S.read(_v9, "r"), 1.4), _S.read(_v9, "WHITE"), 0.35])
		_S.invoke(_S.read(_v9, "p"), "circle", [0, _S.read(_v9, "SUN"), _S.binary("*", _S.read(_v9, "r"), 0.45), _S.read(_v9, "WHITE")])
		_S.call_value(_S.read(_v9, "oval"), [_S.read(_v9, "p"), 0, _S.read(_v9, "SUN"), _S.binary("*", _S.read(_v9, "r"), 0.62), _S.binary("*", _S.read(_v9, "r"), 0.62), _S.prop(_S.read(_v9, "C"), 6), 1])
		_S.call_value(_S.read(_v9, "oval"), [_S.read(_v9, "p"), 0, _S.read(_v9, "SUN"), _S.read(_v9, "r"), _S.read(_v9, "r"), _S.function_value(_v9, "_f3"), 1])
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "j"), 16)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "g", _S.binary("+", _S.read(_v11, "spin"), _S.binary("/", _S.binary("*", _S.read(_v11, "j"), _S.read(_v11, "TAU")), 16)))
			_S.define(_v11, "l", (3 if _S.truth(_S.binary("%", _S.read(_v11, "j"), 2)) else 6))
			_S.invoke(_S.read(_v11, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "g")]), _S.binary("+", _S.read(_v11, "r"), 2)), _S.binary("+", _S.read(_v11, "SUN"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "g")]), _S.binary("+", _S.read(_v11, "r"), 2))), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "g")]), _S.binary("+", _S.binary("+", _S.read(_v11, "r"), 2), _S.read(_v11, "l"))), _S.binary("+", _S.read(_v11, "SUN"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "g")]), _S.binary("+", _S.binary("+", _S.read(_v11, "r"), 2), _S.read(_v11, "l")))), _S.function_value(_v11, "_f4"), _S.function_value(_v11, "_f5")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LIFT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT"), 0.3)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.read(_e, "SUN"), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), 0.3))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.6])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "g"), 6), _S.binary("*", _S.read(_e, "spin"), 4))]), 0.5)) else _S.prop(_S.read(_e, "C"), 5))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else _S.prop(_S.read(_e, "C"), 4))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("-", 1.1, _S.read(_e, "u"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		return null
	_S.define(_e, "u", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.2)]))
	_S.define(_e, "heat", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SHUT"), _S.binary("+", _S.read(_e, "SHUT"), 0.8), _S.read(_e, "t")])))
	_S.define(_e, "out", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "SHUT"), 0.4), _S.binary("+", _S.read(_e, "SHUT"), 1), _S.read(_e, "t")])))
	if _S.truth(_S.binary("<=", _S.read(_e, "out"), 0)):
		return null
	_S.define(_e, "keep", (_S.function_value(_e, "_f7") if _S.truth(_S.read(_e, "back")) else _S.function_value(_e, "_f8")))
	_S.define(_e, "burnt", _S.function_value(_e, "_f9"))
	_S.define(_e, "col", _S.function_value(_e, "_f10"))
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "RX"), _S.binary("*", _S.read(_e, "RX"), _S.read(_e, "SY")), _S.function_value(_e, "_f11"), _S.read(_e, "out"), _S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, 0, _S.binary("*", _S.read(_e, "RX"), 0.72), _S.binary("*", _S.binary("*", _S.read(_e, "RX"), 0.72), _S.read(_e, "SY")), _S.function_value(_e, "_f13"), _S.read(_e, "out"), _S.function_value(_e, "_f14")])
	var _v12 = _S.scope(_e)
	_S.define(_v12, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "j"), 12)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "g", _S.binary("+", _S.binary("*", _S.read(_v13, "t"), 0.35), _S.binary("/", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "TAU")), 12)))
		if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v13, "keep"), [_S.read(_v13, "g")])), func(): return _S.unary("!", _S.call_value(_S.read(_v13, "burnt"), [_S.read(_v13, "g")])))):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "j", 1, "+=", true)
			continue
		_S.define(_v13, "c", _S.call_value(_S.read(_v13, "col"), [_S.read(_v13, "g"), _S.binary("===", _S.binary("%", _S.read(_v13, "j"), 2), 0)]))
		_S.define(_v13, "r0", _S.binary("*", _S.read(_v13, "RX"), 0.78))
		_S.define(_v13, "r1", _S.binary("*", _S.read(_v13, "RX"), (0.95 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v13, "j"), 3), 0)) else 0.88)))
		if _S.truth(_S.read(_v13, "c")):
			_S.invoke(_S.read(_v13, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "g")]), _S.read(_v13, "r0")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "g")]), _S.read(_v13, "r0")), _S.read(_v13, "SY")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "g")]), _S.read(_v13, "r1")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "g")]), _S.read(_v13, "r1")), _S.read(_v13, "SY")), _S.read(_v13, "c"), _S.read(_v13, "out")])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "j", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		var _v14 = _S.scope(_e)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v15, "i"), 2)):
			_S.invoke(_S.read(_v15, "p"), "glow", [_S.binary("*", _S.binary("*", _S.read(_v15, "i"), _S.read(_v15, "RX")), 0.45), _S.unary("-", 2), 16, _S.prop(_S.read(_v15, "C"), 4), _S.binary("*", _S.binary("*", _S.binary("-", 0.34, _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "abs", [_S.read(_v15, "i")]), 0.05)), _S.read(_v15, "out")), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_v15, "heat"))))])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		_S.invoke(_S.read(_v14, "p"), "glow", [0, _S.unary("-", 1), 10, _S.read(_v14, "WHITE"), _S.binary("*", _S.binary("*", 0.3, _S.read(_v14, "heat")), _S.read(_v14, "out"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_e, "g"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI")), 0.01))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "hot", _S.arg(_args, 1))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "burnt"), [_S.read(_e, "g")]))):
		return 0
	_S.define(_e, "flick", _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "g"), 40)]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 20)])]), 0.18))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.08)), func(): return _S.logical("&&", _S.read(_e, "flick"), func(): return _S.binary(">", _S.read(_e, "heat"), 0.4)))) else ((_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "hot")) else _S.prop(_S.read(_e, "C"), 5)) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.6)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.3)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.1)) else _S.prop(_S.read(_e, "C"), 2)))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "col"), [_S.read(_e, "g"), true])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.logical("&&", _S.call_value(_S.read(_e, "keep"), [_S.read(_e, "g")]), func(): return _S.call_value(_S.read(_e, "burnt"), [_S.read(_e, "g")]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "col"), [_S.read(_e, "g"), false])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.logical("&&", _S.call_value(_S.read(_e, "keep"), [_S.read(_e, "g")]), func(): return _S.call_value(_S.read(_e, "burnt"), [_S.read(_e, "g")]))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "off", _S.binary("-", _S.read(_e, "i"), _S.read(_e, "mid")))
	_S.define(_e, "far", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "off")]), _S.read(_e, "mid")))
	return _S.merge([{"th": _S.binary("+", _S.binary("*", _S.read(_e, "off"), _S.binary("/", 0.4, _S.read(_e, "mid"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.02), 0.02]))}, {"spread": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.05, 0.085]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "far"), 0.25)))}, {"b": _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_e, "far"), 0.35)), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1]))}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, 1])}, {"far": _S.read(_e, "far")}])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"x": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 80), 80])}, {"y": _S.invoke(_S.read(_e, "R"), "range", [0, 1])}, {"v": _S.invoke(_S.read(_e, "R"), "range", [7, 18])}, {"amp": _S.invoke(_S.read(_e, "R"), "range", [0.5, 2.5])}, {"f": _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.5])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "st", _S.binary("*", _S.prop(_S.read(_e, "s"), "far"), 0.1))
	_S.define(_e, "open", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("+", _S.read(_e, "OPEN"), _S.read(_e, "st")), _S.binary("+", _S.binary("+", _S.read(_e, "OPEN"), _S.read(_e, "st")), 0.42)]), 1.5]))
	_S.define(_e, "fold", _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("-", _S.read(_e, "FOLD"), _S.binary("*", _S.prop(_S.read(_e, "s"), "far"), 0.1)), _S.read(_e, "SHUT")])]))
	return _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "s"), "th"), _S.read(_e, "open")), _S.binary("-", 1, _S.read(_e, "fold")))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	return _S.binary("*", _S.read(_e, "DMAX"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("+", _S.read(_e, "OPEN"), _S.binary("*", _S.prop(_S.read(_e, "s"), "far"), 0.06)), _S.binary("+", _S.read(_e, "HIT"), _S.binary("*", _S.prop(_S.read(_e, "s"), "far"), 0.06))])])))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "DMAX"), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("+", _S.read(_e, "SHUT"), 0.05), _S.read(_e, "LIFT")])]))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "OPEN"), _S.binary("+", _S.read(_e, "OPEN"), 0.1), _S.read(_e, "tt")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "LIFT"), 0.05), _S.binary("+", _S.read(_e, "LIFT"), 0.05), _S.read(_e, "tt")])))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "d", _S.arg(_args, 1))
	_S.define(_e, "tt", _S.arg(_args, 2))
	return _S.binary("*", _S.binary("+", 1.4, _S.binary("*", _S.read(_e, "d"), _S.prop(_S.read(_e, "s"), "spread"))), _S.call_value(_S.read(_e, "lerp"), [1, 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SHUT"), _S.read(_e, "LIFT"), _S.read(_e, "tt")])]))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "d", _S.arg(_args, 1))
	_S.define(_e, "tt", _S.arg(_args, 2))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "tt"), _S.read(_e, "HIT")), func(): return _S.binary(">", _S.read(_e, "tt"), _S.read(_e, "SHUT")))):
		return 1
	_S.define(_e, "D", _S.binary("*", _S.read(_e, "DMAX"), _S.binary("-", 1, _S.call_value(_S.read(_e, "frac"), [_S.binary("+", _S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "HIT")), 0.6), _S.prop(_S.read(_e, "s"), "ph"))]))))
	return _S.binary("+", 1, _S.binary("*", 0.9, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "d"), _S.read(_e, "D")), 12), 2))])))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "PY"), _S.read(_e, "y")))
	if _S.truth(_S.binary("<=", _S.read(_e, "dy"), 0)):
		return 0
	_S.define(_e, "I", 0)
	for _v17 in _S.array(_S.read(_e, "shafts")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "s", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "a", _S.call_value(_S.read(_v19, "angle"), [_S.read(_v19, "s"), _S.read(_v19, "t")]))
		_S.define(_v19, "d", _S.binary("/", _S.read(_v19, "dy"), _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")])))
		_S.define(_v19, "xc", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "tan", [_S.read(_v19, "a")]), _S.read(_v19, "dy")))
		_S.define(_v19, "hw", _S.binary("/", _S.binary("/", _S.call_value(_S.read(_v19, "width"), [_S.read(_v19, "s"), _S.read(_v19, "d"), _S.read(_v19, "t")]), 2), _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")])))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v19, "d"), _S.call_value(_S.read(_v19, "liftD"), [_S.read(_v19, "t")])), func(): return _S.binary("<", _S.read(_v19, "d"), _S.call_value(_S.read(_v19, "frontD"), [_S.read(_v19, "s"), _S.read(_v19, "t")])))):
			continue
		_S.define(_v19, "v", _S.binary("/", _S.binary("-", _S.read(_v19, "x"), _S.read(_v19, "xc")), _S.read(_v19, "hw")))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "v")]), 1)):
			_S.write(_v19, "I", _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_v19, "v"), _S.read(_v19, "v"))), _S.prop(_S.read(_v19, "s"), "b")), "+=", false)
	return _S.binary("*", _S.read(_e, "I"), _S.call_value(_S.read(_e, "fade"), [_S.read(_e, "t")]))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.1)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
		_S.define(_v20, "D", _S.invoke(_S.read(_v20, "R"), "range", [22, 34]))
		_S.define(_v20, "x", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "D")))
		_S.define(_v20, "y", _S.binary("+", _S.read(_v20, "SUN"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "D"))))
		_S.define(_v20, "T", _S.invoke(_S.read(_v20, "R"), "range", [0.18, 0.28]))
		_S.define(_v20, "v", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v20, "D"), 10), 3), _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "exp", [_S.binary("*", 3, _S.read(_v20, "T"))]), 1)))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STREAK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v20, "x")), _S.read(_v20, "D")), _S.read(_v20, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v20, "SUN"), _S.read(_v20, "y")), _S.read(_v20, "D")), _S.read(_v20, "v")), _S.read(_v20, "T"), (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v21 = _S.scope(_e)
		_S.write(_v21, "hit", true, "=", false)
		_S.invoke(_S.read(_v21, "lights"), "add", [0, _S.unary("-", 30), 64, _S.prop(_S.read(_v21, "C"), 5), 0.85, 0.5])
		_S.invoke(_S.read(_v21, "lights"), "add", [0, _S.unary("-", 6), 30, _S.read(_v21, "WHITE"), 0.8, 0.12])
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 26)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v23, "Math"), "PI")), 2), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [70, 190]))
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SPARK"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.6])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHUT"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "g", _S.invoke(_S.read(_v24, "R"), "range", [0, _S.read(_v24, "TAU")]))
		_S.define(_v24, "r", _S.binary("*", _S.read(_v24, "RX"), (1 if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else 0.72)))
		_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "g")]), _S.read(_v24, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "g")]), _S.read(_v24, "r")), _S.read(_v24, "SY")), 1), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [12, 30])), _S.invoke(_S.read(_v24, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v24, "C"), 5), 1, 0, (4 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "g")]), 0)) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FOLD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), 40), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [20, 160])), 0, _S.invoke(_S.read(_e, "R"), "range", [2, 8]), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.6]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shut")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHUT")))):
		var _v25 = _S.scope(_e)
		_S.write(_v25, "shut", true, "=", false)
		_S.invoke(_S.read(_v25, "lights"), "add", [0, _S.unary("-", 60), 70, _S.prop(_S.read(_v25, "C"), 5), 0.7, 0.35])
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 12)):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STAR"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [10, 170])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v26, "R"), "range", [0.4, 0.8]), (_S.read(_v26, "WHITE") if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.5])) else _S.prop(_S.read(_v26, "C"), 6)), _S.invoke(_S.read(_v26, "R"), "range", [0.8, 2])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "glinted")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT")))):
		var _v27 = _S.scope(_e)
		_S.write(_v27, "glinted", true, "=", false)
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.read(_v27, "SUN"), 40, _S.read(_v27, "WHITE"), 0.6, 0.2])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "feathers"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "fan"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "sigil"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "feathers"), "draw", [_S.read(_e, "p"), _S.read(_e, "WING"), "back"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "sigil"), [_S.read(_e, "p"), false])
	for _v28 in _S.array(_S.read(_e, "motes")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "m", _v28)
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "y", _S.binary("+", _S.read(_v30, "TOP"), _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v30, "m"), "y"), _S.read(_v30, "DMAX")), _S.binary("*", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "m"), "v"))), _S.read(_v30, "DMAX")), _S.read(_v30, "DMAX")), _S.read(_v30, "DMAX"))))
		_S.define(_v30, "x", _S.binary("+", _S.prop(_S.read(_v30, "m"), "x"), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "m"), "f")), _S.prop(_S.read(_v30, "m"), "ph"))]), _S.prop(_S.read(_v30, "m"), "amp"))))
		_S.define(_v30, "I", _S.call_value(_S.read(_v30, "lightAt"), [_S.read(_v30, "x"), _S.read(_v30, "y")]))
		if _S.truth(_S.binary("<", _S.read(_v30, "I"), 0.2)):
			continue
		_S.invoke(_S.read(_v30, "p"), "dot", [_S.read(_v30, "x"), _S.read(_v30, "y"), (_S.read(_v30, "WHITE") if _S.truth(_S.binary(">", _S.read(_v30, "I"), 0.7)) else _S.prop(_S.read(_v30, "C"), 6)), _S.invoke(_S.read(_v30, "Math"), "min", [1, _S.binary("*", _S.read(_v30, "I"), 1.3)])])
		_S.invoke(_S.read(_v30, "p"), "light", [_S.read(_v30, "x"), _S.read(_v30, "y"), _S.prop(_S.read(_v30, "C"), 5), _S.binary("*", 0.4, _S.invoke(_S.read(_v30, "Math"), "min", [1, _S.read(_v30, "I")]))])
	_S.call_value(_S.read(_e, "sun"), [_S.read(_e, "p")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "HIT"), 0.02)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.25)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.binary("-", _S.read(_e, "PY"), 2), _S.binary("*", 12, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.25))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.7])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SHUT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHUT"), 0.2)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.binary("-", _S.read(_e, "PY"), 2), _S.binary("*", 8, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHUT")), 0.2))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.5])
	_S.invoke(_S.read(_e, "feathers"), "draw", [_S.read(_e, "p"), _S.read(_e, "WING"), "front"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
