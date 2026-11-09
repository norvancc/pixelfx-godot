@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/smite.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "chip", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Smite"}, {"desc": "A glint marks the spot, then a bolt of light drops like a hammer: a white flash, a shockwave over the floor, stone chips flying and cracks that glow and cool."}, {"tags": ["holy", "smite", "strike", "impact", "light", "ground", "one-shot"]}, {"size": [224, 176]}, {"origin": [112, 148]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"stone": "#5a5066"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TOP", _S.unary("-", 148))
	_S.define(_e, "SY", 0.38)
	_S.define(_e, "MARK", 0.42)
	_S.define(_e, "HIT", 0.54)
	_S.define(_e, "LEN", 44)
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.7)))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.2), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.9))):
		return null
	_S.define(_e, "lit", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "lx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ly"))))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "OUTLINE") if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))) else (_S.prop(_S.read(_e, "st"), 3) if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.3))) else (_S.prop(_S.read(_e, "st"), 1) if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.5)) else _S.prop(_S.read(_e, "st"), 2)))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "hammer", _S.function_value(_e, "_f3"))
	_S.define(_e, "crack", _S.function_value(_e, "_f8"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "s0", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "st", [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 0.5]), _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 0.75]), _S.read(_e, "s0"), _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 1.4]), _S.read(_e, "WHITE"), 0.1])])
	_S.define(_e, "dust", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "s0"), _S.call_value(_S.read(_e, "hex"), ["#8a8094"]), 0.4]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f9")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "chips", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.function_value(_e, "_f10")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "cracks", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "tipY", _S.function_value(_e, "_f13"))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f15")}, {"draw": _S.function_value(_e, "_f17")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "MARK")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.06)))):
		return null
	_S.define(_e, "y1", (0 if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT"))) else _S.call_value(_S.read(_e, "tipY"), [_S.read(_e, "t")])))
	_S.define(_e, "y0", _S.invoke(_S.read(_e, "Math"), "max", [_S.binary("+", _S.read(_e, "TOP"), 5), _S.binary("-", _S.read(_e, "y1"), _S.binary("*", _S.read(_e, "LEN"), (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.06)) if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT"))) else 1)))]))
	_S.define(_e, "white", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.binary("<", _S.read(_e, "y1"), _S.binary("+", _S.read(_e, "TOP"), 12))):
		return null
	for _v0 in _S.array([[_S.unary("-", 5), 0.6], [_S.unary("-", 2), 0.9], [2, 0.8], [5, 0.5]]):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "dx", _S.prop(_v2, 0))
		_S.define(_v1, "k", _S.prop(_v2, 1))
		if _S.truth(_S.binary(">", _S.read(_v1, "y0"), _S.binary("+", _S.read(_v1, "TOP"), 2))):
			_S.invoke(_S.read(_v1, "p"), "line", [_S.read(_v1, "dx"), _S.invoke(_S.read(_v1, "Math"), "max", [_S.read(_v1, "TOP"), _S.binary("-", _S.read(_v1, "y0"), 70)]), _S.read(_v1, "dx"), _S.read(_v1, "y0"), _S.function_value(_v1, "_f4"), _S.function_value(_v1, "_f5")])
	if _S.truth(_S.binary(">", _S.binary("-", _S.read(_e, "y1"), 3), _S.read(_e, "y0"))):
		_S.invoke(_S.read(_e, "p"), "beam", [0, _S.read(_e, "y0"), 0, _S.binary("-", _S.read(_e, "y1"), 3), 9, _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "beam", [0, _S.binary("-", _S.read(_e, "y1"), 6), 0, _S.binary("-", _S.read(_e, "y1"), 1), 13, _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.binary("+", _S.read(_e, "y0"), 10), 0, _S.read(_e, "y1"), 16, _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "y1"), 4), _S.invoke(_S.read(_e, "Math"), "min", [22, _S.binary("-", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "TOP")), 6)]), _S.read(_e, "WHITE"), 0.5])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 4))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "u"), _S.read(_e, "k"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.read(_e, "white"), func(): return _S.binary("<", _S.read(_e, "v"), 0.35))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.7)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "v"), 0.6), func(): return _S.read(_e, "white"))) else _S.prop(_S.read(_e, "C"), 6))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		return null
	_S.define(_e, "grow", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.1)])]))
	for _v3 in _S.array(_S.read(_e, "cracks")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "c", _v3)
		var _v5 = _S.scope(_v4)
		for _v6 in _S.array(([_S.prop(_S.read(_v5, "c"), "pts"), _S.prop(_S.read(_v5, "c"), "fork")] if _S.truth(_S.prop(_S.read(_v5, "c"), "fork")) else [_S.prop(_S.read(_v5, "c"), "pts")])):
			var _v7 = _S.scope(_v5)
			_S.define(_v7, "path", _v6)
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "n", _S.invoke(_S.read(_v8, "Math"), "max", [1, _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("*", _S.binary("-", _S.prop(_S.read(_v8, "path"), "length"), 1), _S.read(_v8, "grow"))])]))
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.read(_v9, "n"))):
				var _v10 = _S.scope(_v9)
				var _v11 = _S.prop(_S.read(_v10, "path"), _S.read(_v10, "i"))
				_S.define(_v10, "x0", _S.prop(_v11, 0))
				_S.define(_v10, "y0", _S.prop(_v11, 1))
				var _v12 = _S.prop(_S.read(_v10, "path"), _S.binary("+", _S.read(_v10, "i"), 1))
				_S.define(_v10, "x1", _S.prop(_v12, 0))
				_S.define(_v10, "y1", _S.prop(_v12, 1))
				_S.define(_v10, "d", _S.binary("/", _S.invoke(_S.read(_v10, "Math"), "hypot", [_S.read(_v10, "x0"), _S.binary("/", _S.read(_v10, "y0"), _S.read(_v10, "SY"))]), _S.prop(_S.read(_v10, "c"), "L")))
				_S.define(_v10, "heat", _S.call_value(_S.read(_v10, "clamp"), [_S.binary("-", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v10, "t"), _S.read(_v10, "HIT")), _S.prop(_S.read(_v10, "c"), "cool"))), _S.binary("*", _S.read(_v10, "d"), 0.5))]))
				if _S.truth(_S.binary("<=", _S.read(_v10, "heat"), 0)):
					_v9 = _S.iteration(_v9)
					_S.write(_v9, "i", 1, "+=", true)
					continue
				_S.define(_v10, "col", (_S.read(_v10, "WHITE") if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.85)) else (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.65)) else (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.45)) else (_S.prop(_S.read(_v10, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.3)) else (_S.prop(_S.read(_v10, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.18)) else _S.prop(_S.read(_v10, "C"), 2)))))))
				_S.invoke(_S.read(_v10, "p"), "line", [_S.read(_v10, "x0"), _S.read(_v10, "y0"), _S.read(_v10, "x1"), _S.read(_v10, "y1"), _S.read(_v10, "col"), (_S.binary("/", _S.read(_v10, "heat"), 0.12) if _S.truth(_S.binary("<", _S.read(_v10, "heat"), 0.12)) else 1)])
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v10, "d"), 0.45), func(): return _S.binary("===", _S.read(_v10, "path"), _S.prop(_S.read(_v10, "c"), "pts")))):
					_S.invoke(_S.read(_v10, "p"), "line", [_S.read(_v10, "x0"), _S.binary("+", _S.read(_v10, "y0"), 1), _S.read(_v10, "x1"), _S.binary("+", _S.read(_v10, "y1"), 1), (_S.prop(_S.read(_v10, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.5)) else _S.prop(_S.read(_v10, "C"), 2)), (_S.binary("/", _S.read(_v10, "heat"), 0.12) if _S.truth(_S.binary("<", _S.read(_v10, "heat"), 0.12)) else 1)])
				if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v10, "i"), 2), 0)):
					_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x0"), _S.read(_v10, "y0"), 10, _S.prop(_S.read(_v10, "C"), 4), _S.binary("*", 0.45, _S.read(_v10, "heat"))])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 1.6))]))
	if _S.truth(_S.binary(">", _S.read(_e, "h"), 0)):
		var _v13 = _S.scope(_e)
		_S.call_value(_S.read(_v13, "oval"), [_S.read(_v13, "p"), 0, 0, 5, 1.6, (_S.read(_v13, "WHITE") if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.6)) else (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.3)) else _S.prop(_S.read(_v13, "C"), 3))), _S.invoke(_S.read(_v13, "Math"), "min", [1, _S.binary("*", _S.read(_v13, "h"), 3)])])
		_S.invoke(_S.read(_v13, "p"), "glow", [0, 0, 18, _S.prop(_S.read(_v13, "C"), 4), _S.binary("*", 0.45, _S.read(_v13, "h"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("+", 0.12, _S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), 0.24))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.12), 0.12])))
	_S.define(_e, "L", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [30, 54]), (0.6 if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])]), 0.7)) else 1)))
	_S.define(_e, "pts", _S.invoke(_S.call_value(_S.read(_e, "bolt"), [_S.read(_e, "R"), 0, 0, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "L")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "L")), _S.merge([{"jag": 0.28}, {"depth": 4}])]), "map", [_S.function_value(_e, "_f12")]))
	_S.define(_e, "fork", (_S.call_value(_S.read(_e, "bolt"), _S.concat([[_S.read(_e, "R")], _S.array(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)]))), [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)])), 0), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), 0.7))]), _S.read(_e, "L")), 0.35))], [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)])), 1), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), 0.7))]), _S.read(_e, "L")), 0.35), _S.read(_e, "SY")))], [_S.merge([{"jag": 0.3}, {"depth": 3}])]])) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "pts"), "length"), 6)) else null))
	return _S.merge([{"pts": _S.read(_e, "pts")}, {"fork": _S.read(_e, "fork")}, {"L": _S.read(_e, "L")}, {"cool": _S.invoke(_S.read(_e, "R"), "range", [1.6, 2.1])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "z", _S.prop(_v14, 1))
	return [_S.read(_e, "x"), _S.binary("*", _S.read(_e, "z"), _S.read(_e, "SY"))]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.read(_e, "TOP"), 6), 0, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "MARK"), _S.read(_e, "HIT")])])])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "MARK")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.25]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 18])), 0, _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 12])), _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.4]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.5, 1.2])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "MARK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))), func(): return _S.binary(">", _S.call_value(_S.read(_e, "tipY"), [_S.read(_e, "t")]), _S.binary("+", _S.read(_e, "TOP"), 50))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [4, 7])), _S.binary("-", _S.call_value(_S.read(_e, "tipY"), [_S.read(_e, "t")]), _S.invoke(_S.read(_e, "R"), "range", [4, 30])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [10, 40])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3]), _S.prop(_S.read(_e, "C"), 6), 0.7])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "hit", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 24), 92, _S.prop(_S.read(_v15, "C"), 5), 1, 0.6])
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 8), 40, _S.read(_v15, "WHITE"), 0.9, 0.12])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 60)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.25), 1.25])))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [110, 280]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "R"), "range", [0.25, 0.75])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 16)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1])))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [60, 160]))
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "STAR"), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 4), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.4, 0.9]), (_S.read(_v19, "WHITE") if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.5])) else _S.prop(_S.read(_v19, "C"), 6)), _S.invoke(_S.read(_v19, "R"), "range", [0.8, 2.4])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v15)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 14)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [90, 230]))
			_S.invoke(_S.read(_v21, "chips"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp"))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [1.2, 1.8])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v21, "R"), "int", [1, 3])}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v15)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 34)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v23, "Math"), "PI")), 2), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1), 1])))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [60, 220]))
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "GRIT"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.invoke(_S.read(_v23, "R"), "range", [0.9, 1.5]), _S.invoke(_S.read(_v23, "R"), "pick", [_S.invoke(_S.read(_v23, "st"), "slice", [1])]), (2 if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.4])) else 1)])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v24 = _S.scope(_v15)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 9)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "s", _S.invoke(_S.read(_v25, "R"), "sign", []))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SMOKE"), _S.binary("*", _S.read(_v25, "s"), _S.invoke(_S.read(_v25, "R"), "range", [2, 10])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v25, "s"), _S.invoke(_S.read(_v25, "R"), "range", [50, 130])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [2, 12])), _S.invoke(_S.read(_v25, "R"), "range", [0.7, 1.2]), _S.call_value(_S.read(_v25, "mix"), [_S.read(_v25, "dust"), _S.prop(_S.read(_v25, "C"), 4), 0.18]), _S.invoke(_S.read(_v25, "R"), "range", [3.5, 6]), _S.invoke(_S.read(_v25, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v25, "PF"), "BIG")])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v15)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 4)):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "SMOKE"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [2, 8])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [20, 45])), _S.invoke(_S.read(_v26, "R"), "range", [1.2, 1.8]), _S.call_value(_S.read(_v26, "mix"), [_S.read(_v26, "dust"), _S.prop(_S.read(_v26, "C"), 5), 0.25]), _S.invoke(_S.read(_v26, "R"), "range", [4, 6]), _S.invoke(_S.read(_v26, "R"), "range", [0.05, 0.3])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 1.3))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "c", _S.invoke(_S.read(_v27, "R"), "pick", [_S.read(_v27, "cracks")]))
		_S.define(_v27, "q", _S.invoke(_S.read(_v27, "R"), "pick", [_S.prop(_S.read(_v27, "c"), "pts")]))
		if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.75])):
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "EMBER"), _S.prop(_S.read(_v27, "q"), 0), _S.binary("-", _S.prop(_S.read(_v27, "q"), 1), 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [15, 35])), _S.invoke(_S.read(_v27, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v27, "C"), 5)])
		else:
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "STAR"), _S.prop(_S.read(_v27, "q"), 0), _S.binary("-", _S.prop(_S.read(_v27, "q"), 1), 2), 0, _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [4, 12])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), (_S.read(_v27, "WHITE") if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.5])) else _S.prop(_S.read(_v27, "C"), 6)), _S.invoke(_S.read(_v27, "R"), "range", [0.8, 1.8])])
	_S.invoke(_S.read(_e, "chips"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "crack"), [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.define(_e, "k", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.42)]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 6, _S.binary("*", 84, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), _S.binary("*", _S.read(_e, "SY"), 0.8), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.invoke(_S.read(_e, "C"), "slice", [3]), _S.function_value(_e, "_f16"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "u", _S.call_value(_S.read(_v28, "seg"), [_S.read(_v28, "t"), 0, _S.read(_v28, "MARK")]))
		_S.define(_v28, "k", _S.call_value(_S.read(_v28, "smooth"), [0, 0.08, _S.read(_v28, "t")]))
		_S.define(_v28, "spin", _S.binary("*", _S.read(_v28, "t"), 3))
		_S.define(_v28, "rr", _S.call_value(_S.read(_v28, "lerp"), [26, 8, _S.invoke(_S.read(_v28, "ease"), "inOutCubic", [_S.read(_v28, "u")])]))
		_S.call_value(_S.read(_v28, "oval"), [_S.read(_v28, "p"), 0, 0, _S.read(_v28, "rr"), _S.binary("*", _S.read(_v28, "rr"), _S.read(_v28, "SY")), _S.function_value(_v28, "_f18"), _S.binary("*", _S.read(_v28, "k"), _S.binary("+", 0.65, _S.binary("*", 0.35, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "t"), 40)]))))])
		_S.call_value(_S.read(_v28, "oval"), [_S.read(_v28, "p"), 0, 1, _S.read(_v28, "rr"), _S.binary("*", _S.read(_v28, "rr"), _S.read(_v28, "SY")), _S.prop(_S.read(_v28, "C"), 3), _S.binary("*", _S.read(_v28, "k"), 0.6), _S.function_value(_v28, "_f19")])
		_S.define(_v28, "L", _S.binary("*", _S.binary("+", 3, _S.binary("*", 8, _S.invoke(_S.read(_v28, "ease"), "outBack", [_S.call_value(_S.read(_v28, "clamp"), [_S.binary("/", _S.read(_v28, "t"), 0.2)]), 2]))), (_S.binary("+", 1, _S.binary("*", 0.6, _S.call_value(_S.read(_v28, "seg"), [_S.read(_v28, "t"), _S.read(_v28, "MARK"), _S.read(_v28, "HIT")]))) if _S.truth(_S.binary(">", _S.read(_v28, "t"), _S.read(_v28, "MARK"))) else 1)))
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 4)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.binary("+", _S.binary("*", _S.read(_v30, "spin"), 0.3), _S.binary("/", _S.binary("*", _S.read(_v30, "i"), _S.prop(_S.read(_v30, "Math"), "PI")), 2)))
			_S.define(_v30, "len", (_S.binary("*", _S.read(_v30, "L"), 0.6) if _S.truth(_S.binary("%", _S.read(_v30, "i"), 2)) else _S.read(_v30, "L")))
			_S.invoke(_S.read(_v30, "p"), "line", [0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "len")), _S.binary("+", _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "len"))), _S.function_value(_v30, "_f20"), _S.function_value(_v30, "_f21")])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		_S.invoke(_S.read(_v28, "p"), "px", [0, _S.unary("-", 2), _S.read(_v28, "WHITE")])
		_S.invoke(_S.read(_v28, "p"), "glow", [0, _S.unary("-", 2), _S.binary("+", 14, _S.binary("*", 10, _S.read(_v28, "u"))), _S.prop(_S.read(_v28, "C"), 5), _S.binary("*", 0.5, _S.read(_v28, "k"))])
		_S.invoke(_S.read(_v28, "p"), "glowLine", [0, _S.binary("+", _S.read(_v28, "TOP"), 6), 0, _S.unary("-", 2), 5, _S.prop(_S.read(_v28, "C"), 4), _S.binary("*", 0.12, _S.read(_v28, "u"))])
	_S.call_value(_S.read(_e, "hammer"), [_S.read(_e, "p")])
	_S.define(_e, "ai", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.04), _S.binary("+", _S.read(_e, "HIT"), 0.55)]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.04)), func(): return _S.binary("<", _S.read(_e, "ai"), 1))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "w", _S.binary("+", 1, _S.binary("*", 4, _S.invoke(_S.read(_v31, "Math"), "pow", [_S.binary("-", 1, _S.read(_v31, "ai")), 2]))))
		_S.invoke(_S.read(_v31, "p"), "beam", [0, _S.binary("+", _S.read(_v31, "TOP"), 4), 0, _S.unary("-", 4), _S.read(_v31, "w"), _S.function_value(_v31, "_f22"), _S.function_value(_v31, "_f23")])
		_S.invoke(_S.read(_v31, "p"), "glowLine", [0, _S.binary("+", _S.read(_v31, "TOP"), 16), 0, _S.unary("-", 6), 10, _S.prop(_S.read(_v31, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v31, "ai")))])
	_S.define(_e, "k", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.42)]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 6, _S.binary("*", 84, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), _S.binary("*", _S.read(_e, "SY"), 0.8), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.invoke(_S.read(_e, "C"), "slice", [3]), _S.function_value(_e, "_f24"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	_S.define(_e, "d", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "HIT"), _S.binary("+", _S.read(_e, "HIT"), 0.28)]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "d"), 1))):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "r", _S.binary("+", 8, _S.binary("*", 40, _S.invoke(_S.read(_v32, "ease"), "outCubic", [_S.read(_v32, "d")]))))
		_S.invoke(_S.read(_v32, "p"), "arc", [0, 0, _S.read(_v32, "r"), _S.invoke(_S.read(_v32, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v32, "d")))]), _S.prop(_S.read(_v32, "Math"), "PI"), _S.read(_v32, "TAU"), _S.function_value(_v32, "_f25"), _S.binary("-", 1.1, _S.read(_v32, "d"))])
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "g", _S.binary("*", _S.prop(_S.read(_v33, "Math"), "PI"), 1.1))
		while _S.truth(_S.binary("<", _S.read(_v33, "g"), _S.binary("-", _S.read(_v33, "TAU"), 0.2))):
			_S.invoke(_S.read(_v33, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "g")]), _S.read(_v33, "r")), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "g")]), _S.read(_v33, "r")), 8, _S.prop(_S.read(_v33, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v33, "d")))])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "g", 0.5, "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.07)))):
		var _v34 = _S.scope(_e)
		_S.invoke(_S.read(_v34, "p"), "circle", [0, _S.unary("-", 6), 16, _S.read(_v34, "WHITE")])
		_S.invoke(_S.read(_v34, "p"), "circle", [0, _S.unary("-", 6), 19, _S.prop(_S.read(_v34, "C"), 6), 0.6])
	for _v35 in _S.array(_S.prop(_S.read(_e, "chips"), "list")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "b", _v35)
		_S.call_value(_S.read(_v36, "chip"), [_S.read(_v36, "p"), _S.read(_v36, "b"), _S.read(_v36, "st")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.25)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 8), _S.binary("*", 16, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.25))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.7])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "g"), 4), _S.read(_e, "spin"))]), 0)) else _S.prop(_S.read(_e, "C"), 5))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.4)) else _S.prop(_S.read(_e, "C"), 5))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("-", 1.2, _S.read(_e, "v"))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 5))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_e, "u"))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "ai"), 0.5)))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "d"), 0.2), func(): return _S.binary(">", _S.read(_e, "v"), 0.6))) else _S.prop(_S.read(_e, "C"), 5))
