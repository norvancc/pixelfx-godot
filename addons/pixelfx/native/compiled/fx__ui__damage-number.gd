@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/damage-number.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Damage number"}, {"desc": "A red -27 punches out of a hit spark, white for a frame, arcs up, lands with a squash and a little hop, then fades as it lifts away."}, {"tags": ["ui", "damage", "number", "combat", "text", "hit", "one-shot"]}, {"size": [76, 68]}, {"origin": [30, 52]}, {"duration": 1.05}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0508", "#4a0b12", "#8c1420", "#d42a2e", "#ff5a4a", "#ff9a86", "#ffd8cc", "#ffffff"]}, {"text": "-27"}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "LAND", _S.unary("-", 8))
	_S.define(_e, "FADE", 0.84)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "word", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "n", _S.merge([{"x": 0}, {"y": _S.read(_e, "LAND")}, {"vx": 34}, {"vy": _S.unary("-", 175)}, {"sq": 0}, {"hops": 0}]))
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 9), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.2), 0.2])), _S.invoke(_S.read(_e, "R"), "range", [8, 14])]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "hit", true, "=", false)
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 4), 30, _S.prop(_S.read(_v0, "C"), 5), 0.7, 0.25])
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 4), 14, _S.read(_v0, "WHITE"), 0.6, 0.08])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 9)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "an", _S.binary("+", _S.invoke(_S.read(_v2, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v2, "Math"), "PI")), 0.95), _S.unary("-", 0.05)]), (_S.binary("*", _S.prop(_S.read(_v2, "Math"), "PI"), 0.08) if _S.truth(_S.binary("%", _S.read(_v2, "i"), 2)) else 0)))
			_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "R"), "range", [90, 200]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), 0, _S.unary("-", 4), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), _S.invoke(_S.read(_v2, "R"), "range", [0.1, 0.25])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "n"), "hops"), 2)):
		var _v3 = _S.scope(_e)
		_S.set_prop(_S.read(_v3, "n"), "vy", _S.binary("*", 900, _S.read(_v3, "dt")), "+=", false)
		_S.set_prop(_S.read(_v3, "n"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v3, "n"), "vx"), 2), _S.read(_v3, "dt")), "-=", false)
		_S.set_prop(_S.read(_v3, "n"), "x", _S.binary("*", _S.prop(_S.read(_v3, "n"), "vx"), _S.read(_v3, "dt")), "+=", false)
		_S.set_prop(_S.read(_v3, "n"), "y", _S.binary("*", _S.prop(_S.read(_v3, "n"), "vy"), _S.read(_v3, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v3, "n"), "y"), _S.read(_v3, "LAND")), func(): return _S.binary(">", _S.prop(_S.read(_v3, "n"), "vy"), 0))):
			var _v4 = _S.scope(_v3)
			_S.set_prop(_S.read(_v4, "n"), "y", _S.read(_v4, "LAND"), "=", false)
			_S.set_prop(_S.read(_v4, "n"), "sq", 1, "=", false)
			_S.set_prop(_S.read(_v4, "n"), "hops", 1, "+=", true)
			_S.set_prop(_S.read(_v4, "n"), "vy", (_S.binary("*", _S.unary("-", _S.prop(_S.read(_v4, "n"), "vy")), 0.36) if _S.truth(_S.binary("<", _S.prop(_S.read(_v4, "n"), "hops"), 2)) else 0), "=", false)
			if _S.truth(_S.binary("===", _S.prop(_S.read(_v4, "n"), "hops"), 1)):
				for _v5 in _S.array([_S.unary("-", 1), 1]):
					var _v6 = _S.scope(_v4)
					_S.define(_v6, "s", _v5)
					_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v6, "n"), "x"), _S.binary("*", _S.read(_v6, "s"), 14)), _S.binary("+", _S.read(_v6, "LAND"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 2), 1])), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "R"), "range", [15, 35])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [5, 20])), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.35]), _S.prop(_S.read(_v6, "C"), 6), _S.invoke(_S.read(_v6, "R"), "range", [0.5, 1.2])])
	_S.set_prop(_S.read(_e, "n"), "sq", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_e, "n"), "sq"), _S.binary("/", _S.read(_e, "dt"), 0.09))]), "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "big", _S.binary("<", _S.read(_v7, "t"), 0.035))
		_S.invoke(_S.read(_v7, "spikes"), "forEach", [_S.function_value(_v7, "_f4")])
		if _S.truth(_S.read(_v7, "big")):
			_S.invoke(_S.read(_v7, "p"), "circle", [0, _S.unary("-", 4), 3.2, _S.read(_v7, "WHITE")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.16)):
			_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 4), _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.07), 0.09))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.define(_e, "rk", _S.binary("/", _S.read(_e, "t"), 0.22))
	if _S.truth(_S.binary("<", _S.read(_e, "rk"), 1)):
		_S.invoke(_S.read(_e, "p"), "ring", [0, _S.unary("-", 4), _S.binary("+", 3, _S.binary("*", 10, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "rk")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "rk")))]), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "rk"), 0.4)) else _S.prop(_S.read(_e, "C"), 5)), _S.binary("-", 1.2, _S.read(_e, "rk"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "out", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "FADE"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.04)]))
	if _S.truth(_S.binary("<", _S.read(_e, "out"), 1)):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _S.binary("+", 2, _S.binary("*", _S.binary("*", 1.4, _S.invoke(_S.read(_v10, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v10, "t")), 22)])), _S.invoke(_S.read(_v10, "Math"), "cos", [_S.binary("*", _S.read(_v10, "t"), 30)]))))
		_S.define(_v10, "sx", _S.read(_v10, "s"))
		_S.define(_v10, "sy", _S.read(_v10, "s"))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v10, "n"), "sq"), 0)):
			_S.last([_S.write(_v10, "sx", _S.binary("*", _S.read(_v10, "s"), _S.binary("+", 1, _S.binary("*", 0.18, _S.prop(_S.read(_v10, "n"), "sq")))), "=", false), _S.write(_v10, "sy", _S.binary("*", _S.read(_v10, "s"), _S.binary("-", 1, _S.binary("*", 0.2, _S.prop(_S.read(_v10, "n"), "sq")))), "=", false)])
		else:
			if _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v10, "n"), "hops"), 2), func(): return _S.binary(">", _S.invoke(_S.read(_v10, "Math"), "abs", [_S.prop(_S.read(_v10, "n"), "vy")]), 120))):
				_S.last([_S.write(_v10, "sx", _S.binary("*", _S.read(_v10, "s"), 0.92), "=", false), _S.write(_v10, "sy", _S.binary("*", _S.read(_v10, "s"), 1.1), "=", false)])
		_S.define(_v10, "W", _S.binary("*", _S.prop(_S.read(_v10, "word"), "w"), _S.read(_v10, "sx")))
		_S.define(_v10, "H", _S.binary("*", 7, _S.read(_v10, "sy")))
		_S.define(_v10, "x0", _S.binary("-", _S.prop(_S.read(_v10, "n"), "x"), _S.binary("/", _S.read(_v10, "W"), 2)))
		_S.define(_v10, "y0", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v10, "n"), "y"), _S.read(_v10, "H")), _S.binary("*", 6, _S.invoke(_S.read(_v10, "ease"), "inQuad", [_S.read(_v10, "out")]))))
		_S.define(_v10, "flash", (1 if _S.truth(_S.binary("<", _S.read(_v10, "t"), 0.035)) else (0.4 if _S.truth(_S.binary("<", _S.read(_v10, "t"), 0.07)) else 0)))
		_S.define(_v10, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v10, "word"), "letters"), "filter", [_S.function_value(_v10, "_f5")]), "map", [_S.function_value(_v10, "_f6")]))
		_S.call_value(_S.read(_v10, "drawWord"), [_S.read(_v10, "p"), _S.read(_v10, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v10, "C"), 3), _S.prop(_S.read(_v10, "C"), 3), _S.prop(_S.read(_v10, "C"), 4), _S.prop(_S.read(_v10, "C"), 5)]}, {"edge": _S.prop(_S.read(_v10, "C"), 6)}, {"under": _S.prop(_S.read(_v10, "C"), 2)}, {"outline": _S.prop(_S.read(_v10, "C"), 0)}, {"shadow": _S.call_value(_S.read(_v10, "scale"), [_S.prop(_S.read(_v10, "C"), 0), 0.5])}])])
		_S.invoke(_S.read(_v10, "p"), "glow", [_S.prop(_S.read(_v10, "n"), "x"), _S.binary("+", _S.read(_v10, "y0"), _S.binary("/", _S.read(_v10, "H"), 2)), 18, _S.prop(_S.read(_v10, "C"), 4), _S.binary("+", _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v10, "out"))), (_S.binary("*", 0.4, _S.binary("-", 1, _S.binary("/", _S.read(_v10, "t"), 0.1))) if _S.truth(_S.binary("<", _S.read(_v10, "t"), 0.1)) else 0))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v8 = _S.arg(_args, 0)
	_S.define(_e, "an", _S.prop(_v8, 0))
	_S.define(_e, "L", _S.prop(_v8, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "l", _S.binary("*", _S.read(_e, "L"), (1 if _S.truth(_S.read(_e, "big")) else 1.3)))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "an")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "an")]))
	if _S.truth(_S.read(_e, "big")):
		var _v9 = _S.scope(_e)
		_S.invoke(_S.read(_v9, "p"), "line", [_S.unary("-", _S.read(_v9, "sa")), _S.binary("+", _S.unary("-", 4), _S.read(_v9, "ca")), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v9, "ca"), _S.read(_v9, "l")), 0.7), _S.read(_v9, "sa")), _S.binary("+", _S.binary("+", _S.unary("-", 4), _S.binary("*", _S.binary("*", _S.read(_v9, "sa"), _S.read(_v9, "l")), 0.7)), _S.read(_v9, "ca")), _S.prop(_S.read(_v9, "C"), 4)])
		_S.invoke(_S.read(_v9, "p"), "line", [_S.read(_v9, "sa"), _S.binary("-", _S.unary("-", 4), _S.read(_v9, "ca")), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v9, "ca"), _S.read(_v9, "l")), 0.7), _S.read(_v9, "sa")), _S.binary("-", _S.binary("+", _S.unary("-", 4), _S.binary("*", _S.binary("*", _S.read(_v9, "sa"), _S.read(_v9, "l")), 0.7)), _S.read(_v9, "ca")), _S.prop(_S.read(_v9, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("*", _S.read(_e, "ca"), (0 if _S.truth(_S.read(_e, "big")) else _S.binary("*", _S.read(_e, "l"), 0.45))), _S.binary("+", _S.unary("-", 4), _S.binary("*", _S.read(_e, "sa"), (0 if _S.truth(_S.read(_e, "big")) else _S.binary("*", _S.read(_e, "l"), 0.45)))), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "l")), _S.binary("+", _S.unary("-", 4), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "l"))), (_S.read(_e, "WHITE") if _S.truth(_S.read(_e, "big")) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "C"), 5)))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "sx")))}, {"y": _S.read(_e, "y0")}, {"sx": _S.read(_e, "sx")}, {"sy": _S.read(_e, "sy")}, {"flash": _S.read(_e, "flash")}, {"a": _S.binary("-", 1, _S.read(_e, "out"))}])
