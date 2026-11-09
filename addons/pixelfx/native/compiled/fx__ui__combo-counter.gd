@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/combo-counter.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "speedLines", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Combo counter"}, {"desc": "x5 COMBO rockets in on streaming speed lines, smearing, and slams to a stop: a white flash, a ring, sparks; it pulses while a timer bar drains, then whooshes out."}, {"tags": ["ui", "combo", "counter", "combat", "text", "one-shot"]}, {"size": [208, 100]}, {"origin": [104, 50]}, {"duration": 1.45}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"count": 5}, {"label": "COMBO"}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.1)
	_S.define(_e, "BEAT", 0.5)
	_S.define(_e, "OUT", 1.1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "dir", _S.arg(_args, 4))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.02)):
		return null
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 18)):
		var _v1 = _S.scope(_v0)
		if _S.truth(_S.binary(">", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "f"), _S.read(_v1, "i"), 3]), _S.read(_v1, "k"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "y", _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "f"), _S.read(_v1, "i"), 1]), 0.5), 60)]))
		_S.define(_v1, "L", _S.binary("+", 16, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "f"), _S.read(_v1, "i"), 2]), 50)))
		_S.define(_v1, "x", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "f"), _S.read(_v1, "i"), 4]), 0.5), 190))
		_S.define(_v1, "x0", _S.invoke(_S.read(_v1, "Math"), "max", [_S.unary("-", 100), _S.binary("-", _S.read(_v1, "x"), _S.binary("/", _S.read(_v1, "L"), 2))]))
		_S.define(_v1, "x1", _S.invoke(_S.read(_v1, "Math"), "min", [100, _S.binary("+", _S.read(_v1, "x"), _S.binary("/", _S.read(_v1, "L"), 2))]))
		_S.invoke(_S.read(_v1, "p"), "line", [_S.read(_v1, "x0"), _S.read(_v1, "y"), _S.read(_v1, "x1"), _S.read(_v1, "y"), _S.function_value(_v1, "_f1"), _S.function_value(_v1, "_f2")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", (_S.read(_e, "u") if _S.truth(_S.binary(">", _S.read(_e, "dir"), 0)) else _S.binary("-", 1, _S.read(_e, "u"))), 0.75)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", (_S.read(_e, "u") if _S.truth(_S.binary(">", _S.read(_e, "dir"), 0)) else _S.binary("-", 1, _S.read(_e, "u"))), 0.35)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (0.6 if _S.truth(_S.binary("<", (_S.read(_e, "u") if _S.truth(_S.binary(">", _S.read(_e, "dir"), 0)) else _S.binary("-", 1, _S.read(_e, "u"))), 0.25)) else 1)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 0), 0.5]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "big", _S.call_value(_S.read(_e, "spell"), [_S.binary("+", "x", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "o"), "count")]))]))
	_S.define(_e, "lab", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "label")]))
	_S.define(_e, "BS", 4)
	_S.define(_e, "LS", 2)
	_S.define(_e, "W", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "big"), "w"), _S.read(_e, "BS")), 4), _S.binary("*", _S.prop(_S.read(_e, "lab"), "w"), _S.read(_e, "LS"))))
	_S.define(_e, "X0", _S.binary("/", _S.unary("-", _S.read(_e, "W")), 2))
	_S.define(_e, "BASE", 12)
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "out", false)
	_S.define(_e, "xAt", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 10), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.15), 0.15])), _S.invoke(_S.read(_e, "R"), "range", [14, 24])]

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "t")]), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		return _S.binary("*", _S.unary("-", 32), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), _S.read(_e, "HIT"))), 2]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))):
		return _S.binary("*", _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT"))), 18)])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 34)]))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "OUT"), _S.binary("+", _S.read(_e, "OUT"), 0.2)]))
	return (_S.binary("*", _S.unary("-", 4), _S.invoke(_S.read(_e, "ease"), "outQuad", [_S.binary("/", _S.read(_e, "u"), 0.3)])) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.binary("+", _S.unary("-", 4), _S.binary("*", 24, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.3), 0.7)]))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "hit", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [0, 0, 70, _S.prop(_S.read(_v2, "C"), 5), 0.7, 0.4])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.unary("-", 20), 0, 34, _S.read(_v2, "WHITE"), 0.8, 0.1])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 26)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "an", _S.binary("+", _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 1.2), 1.2]), (_S.prop(_S.read(_v4, "Math"), "PI") if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.3])) else 0)))
			_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "R"), "range", [120, 300]))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SPARK"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "an")]), _S.read(_v4, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "an")]), _S.read(_v4, "sp")), 0.6), 20), _S.invoke(_S.read(_v4, "R"), "range", [0.12, 0.3])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BEAT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "X0"), _S.invoke(_S.read(_v5, "R"), "range", [0, _S.binary("*", _S.prop(_S.read(_v5, "big"), "w"), _S.read(_v5, "BS"))])))
		_S.define(_v5, "y", _S.binary("-", _S.read(_v5, "BASE"), _S.invoke(_S.read(_v5, "R"), "range", [0, 30])))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "STAR"), _S.read(_v5, "x"), _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [5, 20])), _S.invoke(_S.read(_v5, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.prop(_S.read(_v5, "C"), 7), _S.prop(_S.read(_v5, "C"), 6)]]), (1.6 if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.3])) else 0.6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "out")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.06)))):
		var _v6 = _S.scope(_e)
		_S.write(_v6, "out", true, "=", false)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 10)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "MOTE"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 50), 30]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 14), 10]), _S.invoke(_S.read(_v7, "R"), "range", [220, 320]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v7, "R"), "range", [0.06, 0.14]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.prop(_S.read(_v7, "C"), 7), _S.prop(_S.read(_v7, "C"), 6)]]), 1])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v8 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 3, _S.read(_e, "HIT"), 0.25, _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "sx", _S.prop(_v8, 0))
	_S.define(_e, "sy", _S.prop(_v8, 1))
	_S.call_value(_S.read(_e, "speedLines"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))) else (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.35))]), 0.9) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))) else _S.binary("*", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.04), _S.binary("+", _S.read(_e, "OUT"), 0.12)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.18), _S.binary("+", _S.read(_e, "OUT"), 0.3)]))))), (_S.unary("-", 1) if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT"))) else 1)])
	_S.define(_e, "hk", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "hk"), 0), func(): return _S.binary("<", _S.read(_e, "hk"), 0.07))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "cx", _S.binary("+", _S.read(_v9, "X0"), _S.binary("/", _S.binary("*", _S.prop(_S.read(_v9, "big"), "w"), _S.read(_v9, "BS")), 2)))
		_S.define(_v9, "k", (1 if _S.truth(_S.binary("<", _S.read(_v9, "hk"), 0.035)) else 1.3))
		for _v10 in _S.array(_S.read(_v9, "spikes")):
			var _v11 = _S.scope(_v9)
			var _v12 = _v10
			_S.define(_v11, "an", _S.prop(_v12, 0))
			_S.define(_v11, "L", _S.prop(_v12, 1))
			var _v13 = _S.scope(_v11)
			_S.define(_v13, "ca", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "an")]), 1.4))
			_S.define(_v13, "sa", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "an")]))
			if _S.truth(_S.binary("===", _S.read(_v13, "k"), 1)):
				_S.invoke(_S.read(_v13, "p"), "beam", [_S.read(_v13, "cx"), 0, _S.binary("+", _S.read(_v13, "cx"), _S.binary("*", _S.read(_v13, "ca"), _S.read(_v13, "L"))), _S.binary("*", _S.read(_v13, "sa"), _S.read(_v13, "L")), 3, _S.function_value(_v13, "_f8")])
			else:
				_S.invoke(_S.read(_v13, "p"), "line", [_S.binary("+", _S.read(_v13, "cx"), _S.binary("*", _S.binary("*", _S.read(_v13, "ca"), _S.read(_v13, "L")), 0.5)), _S.binary("*", _S.binary("*", _S.read(_v13, "sa"), _S.read(_v13, "L")), 0.5), _S.binary("+", _S.read(_v13, "cx"), _S.binary("*", _S.binary("*", _S.read(_v13, "ca"), _S.read(_v13, "L")), _S.read(_v13, "k"))), _S.binary("*", _S.binary("*", _S.read(_v13, "sa"), _S.read(_v13, "L")), _S.read(_v13, "k")), _S.prop(_S.read(_v13, "C"), 5)])
	_S.define(_e, "rk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.32))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rk"), 0), func(): return _S.binary("<", _S.read(_e, "rk"), 1))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "r", _S.binary("+", 20, _S.binary("*", 34, _S.invoke(_S.read(_v14, "ease"), "outCubic", [_S.read(_v14, "rk")]))))
		_S.invoke(_S.read(_v14, "p"), "ellipse", [_S.read(_v14, "sx"), _S.read(_v14, "sy"), _S.binary("*", _S.read(_v14, "r"), 1.5), _S.binary("*", _S.read(_v14, "r"), 0.75), (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.read(_v14, "rk"), 0.3)) else _S.prop(_S.read(_v14, "C"), 5)), _S.function_value(_v14, "_f9")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "x", _S.call_value(_S.read(_e, "xAt"), [_S.read(_e, "t")]))
	_S.define(_e, "moving", _S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.06))))
	_S.define(_e, "stretch", ((1.22 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))) else 1.12) if _S.truth(_S.read(_e, "moving")) else 1))
	_S.define(_e, "pulse", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BEAT")), 0.05), 2))]))
	_S.define(_e, "flash", (1 if _S.truth(_S.logical("||", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.07))), func(): return _S.binary(">", _S.read(_e, "pulse"), 0.6))) else 0))
	_S.define(_e, "a", (_S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.08), _S.binary("+", _S.read(_e, "OUT"), 0.2)])) if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "OUT"))) else (0.5 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)) else 1)))
	_S.define(_e, "layout", _S.function_value(_e, "_f10"))
	if _S.truth(_S.logical("&&", _S.read(_e, "moving"), func(): return _S.binary(">", _S.read(_e, "a"), 0))):
		var _v15 = _S.scope(_e)
		for _v16 in _S.array([[0.03, _S.prop(_S.read(_v15, "C"), 2)], [0.015, _S.prop(_S.read(_v15, "C"), 3)]]):
			var _v17 = _S.scope(_v15)
			var _v18 = _v16
			_S.define(_v17, "lag", _S.prop(_v18, 0))
			_S.define(_v17, "c", _S.prop(_v18, 1))
			var _v19 = _S.scope(_v17)
			_S.define(_v19, "items", _S.call_value(_S.read(_v19, "layout"), [_S.binary("+", _S.call_value(_S.read(_v19, "xAt"), [_S.binary("-", _S.read(_v19, "t"), (_S.read(_v19, "lag") if _S.truth(_S.binary("<", _S.read(_v19, "t"), _S.read(_v19, "HIT"))) else _S.unary("-", _S.read(_v19, "lag"))))]), _S.read(_v19, "sx"))]))
			_S.call_value(_S.read(_v19, "drawWord"), [_S.read(_v19, "p"), _S.invoke(_S.read(_v19, "items"), "map", [_S.function_value(_v19, "_f13")]), _S.merge([{"fill": [_S.read(_v19, "c")]}, {"edge": _S.read(_v19, "c")}, {"under": _S.read(_v19, "c")}, {"outline": 0}, {"shadow": 0}])])
	if _S.truth(_S.binary(">", _S.read(_e, "a"), 0)):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "sh", _S.call_value(_S.read(_v20, "seg"), [_S.read(_v20, "t"), 0.62, 0.86]))
		_S.define(_v20, "items", _S.call_value(_S.read(_v20, "layout"), [_S.binary("+", _S.read(_v20, "x"), _S.read(_v20, "sx"))]))
		_S.call_value(_S.read(_v20, "drawWord"), [_S.read(_v20, "p"), _S.invoke(_S.read(_v20, "items"), "map", [_S.function_value(_v20, "_f14")]), _S.merge([{"fill": [_S.prop(_S.read(_v20, "C"), 4), _S.prop(_S.read(_v20, "C"), 5), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 7)]}, {"edge": _S.read(_v20, "WHITE")}, {"under": _S.prop(_S.read(_v20, "C"), 3)}, {"outline": _S.prop(_S.read(_v20, "C"), 0)}, {"ow": 2}, {"shadow": _S.read(_v20, "SHADOW")}, {"shine": (_S.binary("+", _S.binary("-", _S.read(_v20, "X0"), 10), _S.binary("*", _S.binary("+", _S.read(_v20, "W"), 24), _S.read(_v20, "sh"))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v20, "sh"), 0), func(): return _S.binary("<", _S.read(_v20, "sh"), 1))) else null)}, {"shineY": _S.binary("-", _S.read(_v20, "BASE"), 28)}, {"glint": _S.prop(_S.read(_v20, "C"), 6)}])])
		_S.define(_v20, "bk", _S.binary("*", _S.call_value(_S.read(_v20, "seg"), [_S.read(_v20, "t"), _S.binary("+", _S.read(_v20, "HIT"), 0.1), _S.binary("+", _S.read(_v20, "HIT"), 0.2)]), (0 if _S.truth(_S.binary(">", _S.read(_v20, "t"), _S.read(_v20, "OUT"))) else 1)))
		if _S.truth(_S.binary(">", _S.read(_v20, "bk"), 0)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "bw", _S.binary("*", _S.read(_v21, "W"), _S.read(_v21, "bk")))
			_S.define(_v21, "left", _S.binary("-", 1, _S.call_value(_S.read(_v21, "seg"), [_S.read(_v21, "t"), _S.binary("+", _S.read(_v21, "HIT"), 0.2), _S.read(_v21, "OUT")])))
			_S.define(_v21, "bx", _S.binary("+", _S.binary("+", _S.read(_v21, "X0"), _S.read(_v21, "x")), _S.read(_v21, "sx")))
			_S.define(_v21, "by", _S.binary("+", _S.binary("+", _S.read(_v21, "BASE"), 5), _S.read(_v21, "sy")))
			_S.invoke(_S.read(_v21, "p"), "rect", [_S.binary("-", _S.read(_v21, "bx"), 1), _S.binary("-", _S.read(_v21, "by"), 1), _S.binary("+", _S.read(_v21, "bw"), 2), 4, _S.prop(_S.read(_v21, "C"), 0)])
			_S.invoke(_S.read(_v21, "p"), "rect", [_S.read(_v21, "bx"), _S.read(_v21, "by"), _S.read(_v21, "bw"), 2, _S.prop(_S.read(_v21, "C"), 1)])
			if _S.truth(_S.binary(">", _S.read(_v21, "left"), 0)):
				_S.last([_S.invoke(_S.read(_v21, "p"), "rect", [_S.read(_v21, "bx"), _S.read(_v21, "by"), _S.binary("*", _S.read(_v21, "bw"), _S.read(_v21, "left")), 2, _S.prop(_S.read(_v21, "C"), 5)]), _S.invoke(_S.read(_v21, "p"), "rect", [_S.read(_v21, "bx"), _S.read(_v21, "by"), _S.binary("*", _S.read(_v21, "bw"), _S.read(_v21, "left")), 1, _S.prop(_S.read(_v21, "C"), 6)]), _S.invoke(_S.read(_v21, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v21, "bx"), _S.binary("*", _S.read(_v21, "bw"), _S.read(_v21, "left"))), 1), _S.read(_v21, "by"), _S.read(_v21, "WHITE")])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "sx"), 20), 0, 60, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", _S.binary("+", _S.binary("*", 0.2, _S.read(_e, "a")), (_S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 0.15))) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.15)))) else 0)), _S.binary("*", 0.25, _S.read(_e, "pulse")))])
	_S.define(_e, "g", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.86), 0.22))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("-", _S.binary("+", _S.read(_e, "X0"), _S.read(_e, "W")), 2), _S.binary("-", _S.read(_e, "BASE"), 14), _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "g"), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 5), 0.5])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.binary("-", 1.25, _S.read(_e, "rk")) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", 1, _S.binary("/", 1.5, _S.binary("*", _S.read(_e, "r"), 0.75))))) else 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "bs", _S.binary("*", _S.read(_e, "BS"), _S.binary("+", 1, _S.binary("*", 0.12, _S.read(_e, "pulse")))))
	_S.define(_e, "items", [])
	_S.define(_e, "bx", _S.binary("-", _S.binary("+", _S.read(_e, "X0"), _S.read(_e, "dx")), _S.binary("/", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "big"), "w"), _S.read(_e, "BS")), _S.binary("-", _S.read(_e, "stretch"), 1)), 2)))
	_S.define(_e, "by", _S.binary("-", _S.read(_e, "BASE"), _S.binary("*", 7, _S.read(_e, "bs"))))
	_S.invoke(_S.prop(_S.read(_e, "big"), "letters"), "forEach", [_S.function_value(_e, "_f11")])
	_S.define(_e, "lx", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "X0"), _S.read(_e, "dx")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "big"), "w"), _S.read(_e, "BS")), _S.read(_e, "stretch"))), 4))
	_S.invoke(_S.prop(_S.read(_e, "lab"), "letters"), "forEach", [_S.function_value(_e, "_f12")])
	return _S.read(_e, "items")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.logical("&&", _S.prop(_S.read(_e, "L"), "g"), func(): return _S.invoke(_S.read(_e, "items"), "push", [_S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "bx"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "BS")), _S.read(_e, "stretch")))}, {"y": _S.read(_e, "by")}, {"sx": _S.binary("*", _S.read(_e, "BS"), _S.read(_e, "stretch"))}, {"sy": _S.read(_e, "bs")}, {"slant": 1}, {"flash": _S.read(_e, "flash")}, {"a": _S.read(_e, "a")}])]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.logical("&&", _S.prop(_S.read(_e, "L"), "g"), func(): return _S.invoke(_S.read(_e, "items"), "push", [_S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "lx"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "LS")), _S.read(_e, "stretch")))}, {"y": _S.binary("-", _S.read(_e, "BASE"), _S.binary("*", 7, _S.read(_e, "LS")))}, {"sx": _S.binary("*", _S.read(_e, "LS"), _S.read(_e, "stretch"))}, {"sy": _S.read(_e, "LS")}, {"slant": 0.5}, {"flash": _S.read(_e, "flash")}, {"a": _S.read(_e, "a")}])]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "it"), {"flash": 0}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "it"), {"y": _S.binary("+", _S.prop(_S.read(_e, "it"), "y"), _S.read(_e, "sy"))}])
