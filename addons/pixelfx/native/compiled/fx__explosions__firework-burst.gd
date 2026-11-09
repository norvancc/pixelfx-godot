@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/firework-burst.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "flareRays", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Firework burst"}, {"desc": "A shell climbs, slows and bursts into a sphere of coloured trailing stars round a gold core; they droop, crackle into white pops and fade, leaving glitter."}, {"tags": ["firework", "celebration", "sparkle", "sky", "burst", "one-shot"]}, {"size": [240, 248]}, {"origin": [120, 100]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"core": ["#4a2c08", "#86520c", "#c48412", "#f0b424", "#ffe066", "#fff6c4", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RISE", 0.42)
	_S.define(_e, "Y0", 72)
	_S.define(_e, "DRAG", 2.6)
	_S.define(_e, "G", 88)
	_S.define(_e, "TRAIL", 0.34)
	_S.define(_e, "TURN", 0.22)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "core"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "K"), 6), _S.prop(_S.read(_e, "K"), 5), _S.prop(_S.read(_e, "K"), 4), _S.prop(_S.read(_e, "K"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "stars", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "shell", _S.function_value(_e, "_f1"))
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"drawBack": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "speed", _S.arg(_args, 1))
	_S.define(_e, "ramp", _S.arg(_args, 2))
	_S.define(_e, "life", _S.arg(_args, 3))
	_S.define(_e, "first", _S.arg(_args, 4))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "z", _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "s", _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v1, "z"), _S.read(_v1, "z")))]))
		_S.define(_v1, "v", _S.binary("*", _S.read(_v1, "speed"), _S.invoke(_S.read(_v1, "R"), "range", [0.93, 1.05])))
		_S.invoke(_S.read(_v1, "stars"), "push", [_S.merge([{"x": 0}, {"y": 0}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "s")), _S.read(_v1, "v"))}, {"vy": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "s")), _S.read(_v1, "v"))}, {"life": _S.invoke(_S.read(_v1, "R"), "range", [_S.prop(_S.read(_v1, "life"), 0), _S.prop(_S.read(_v1, "life"), 1)])}, {"age": 0}, {"ramp": _S.read(_v1, "ramp")}, {"first": _S.read(_v1, "first")}, {"big": _S.invoke(_S.read(_v1, "R"), "chance", [0.2])}, {"pts": []}, {"acc": _S.invoke(_S.read(_v1, "R"), "next", [])}, {"seed": _S.invoke(_S.read(_v1, "R"), "range", [0, 100])}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "RISE"))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "y", _S.binary("*", _S.read(_v2, "Y0"), _S.binary("-", 1, _S.invoke(_S.read(_v2, "ease"), "outCubic", [_S.binary("/", _S.read(_v2, "t"), _S.read(_v2, "RISE"))]))))
		if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", 50, _S.read(_v2, "dt"))])):
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.5), 0.5]), _S.binary("+", _S.read(_v2, "y"), 2), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v2, "R"), "range", [20, 70]), _S.invoke(_S.read(_v2, "R"), "range", [0.15, 0.35])])
		if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", 14, _S.read(_v2, "dt"))])):
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "VAPOUR"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 1), 1]), _S.binary("+", _S.read(_v2, "y"), 3), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3]), _S.invoke(_S.read(_v2, "R"), "range", [5, 15]), _S.invoke(_S.read(_v2, "R"), "range", [0.5, 0.8]), _S.call_value(_S.read(_v2, "hex"), ["#4a4458"]), _S.invoke(_S.read(_v2, "R"), "range", [1.5, 2.5])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "RISE")))):
		var _v3 = _S.scope(_e)
		_S.write(_v3, "burst", true, "=", false)
		_S.invoke(_S.read(_v3, "lights"), "add", [0, 0, 110, _S.prop(_S.read(_v3, "C"), 4), 0.6, 1.5])
		_S.invoke(_S.read(_v3, "lights"), "add", [0, 0, 30, _S.read(_v3, "WHITE"), 0.5, 0.07])
		_S.call_value(_S.read(_v3, "shell"), [66, 236, _S.read(_v3, "C"), [1.35, 1.9], _S.read(_v3, "K")])
		_S.call_value(_S.read(_v3, "shell"), [26, 120, _S.read(_v3, "K"), [1, 1.4], _S.read(_v3, "K")])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 7)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "d", _S.invoke(_S.read(_v5, "R"), "range", [0, 8]))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.invoke(_S.read(_v5, "R"), "range", [10, 30])), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.invoke(_S.read(_v5, "R"), "range", [10, 30])), _S.invoke(_S.read(_v5, "R"), "range", [2.2, 3]), _S.call_value(_S.read(_v5, "hex"), ["#4a4458"]), _S.invoke(_S.read(_v5, "R"), "range", [6, 11])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 24)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [40, 140]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), 0, 0, _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.35])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", _S.binary("-", _S.prop(_S.read(_v8, "stars"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v8, "i"), 0)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "s", _S.prop(_S.read(_v9, "stars"), _S.read(_v9, "i")))
		_S.set_prop(_S.read(_v9, "s"), "age", _S.read(_v9, "dt"), "+=", false)
		_S.define(_v9, "k", _S.binary("/", _S.prop(_S.read(_v9, "s"), "age"), _S.prop(_S.read(_v9, "s"), "life")))
		if _S.truth(_S.binary(">=", _S.read(_v9, "k"), 1)):
			var _v10 = _S.scope(_v9)
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "j"), _S.binary("+", 2, (1 if _S.truth(_S.prop(_S.read(_v11, "s"), "big")) else 0)))):
				_S.invoke(_S.read(_v11, "pops"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v11, "s"), "x"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.binary("+", _S.prop(_S.read(_v11, "s"), "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 3), 3]))}, {"t0": _S.binary("+", _S.read(_v11, "t"), _S.invoke(_S.read(_v11, "R"), "range", [0, 0.18]))}, {"life": _S.invoke(_S.read(_v11, "R"), "range", [0.06, 0.12])}, {"c": (_S.read(_v11, "WHITE") if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.6])) else _S.prop(_S.prop(_S.read(_v11, "s"), "ramp"), 5))}])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "j", 1, "+=", true)
			_S.invoke(_S.read(_v10, "stars"), "splice", [_S.read(_v10, "i"), 1])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v9, "s"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "s"), "vx"), _S.read(_v9, "DRAG")), _S.read(_v9, "dt")), "-=", false)
		_S.set_prop(_S.read(_v9, "s"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "s"), "vy"), _S.read(_v9, "DRAG")), _S.read(_v9, "dt")), _S.binary("*", _S.read(_v9, "G"), _S.read(_v9, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v9, "s"), "x", _S.binary("*", _S.prop(_S.read(_v9, "s"), "vx"), _S.read(_v9, "dt")), "+=", false)
		_S.set_prop(_S.read(_v9, "s"), "y", _S.binary("*", _S.prop(_S.read(_v9, "s"), "vy"), _S.read(_v9, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v9, "s"), "pts"), "push", [_S.prop(_S.read(_v9, "s"), "x"), _S.prop(_S.read(_v9, "s"), "y"), _S.read(_v9, "t")])
		while _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.prop(_S.read(_v9, "s"), "pts"), "length"), 3), func(): return _S.binary(">", _S.binary("-", _S.read(_v9, "t"), _S.prop(_S.prop(_S.read(_v9, "s"), "pts"), 2)), _S.read(_v9, "TRAIL")))):
			_S.invoke(_S.prop(_S.read(_v9, "s"), "pts"), "splice", [0, 3])
		var _v12 = _S.scope(_v9)
		_S.set_prop(_S.read(_v12, "s"), "acc", _S.binary("*", _S.read(_v12, "dt"), (4 if _S.truth(_S.binary("<", _S.read(_v12, "k"), 0.25)) else 11)), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v12, "s"), "acc"), 1)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), _S.prop(_S.read(_v12, "s"), "x"), _S.prop(_S.read(_v12, "s"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v12, "s"), "vx"), 0.15), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 6), 6])), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v12, "s"), "vy"), 0.15), _S.invoke(_S.read(_v12, "R"), "range", [0, 10])), _S.invoke(_S.read(_v12, "R"), "range", [0.35, 0.8]), (_S.prop(_S.read(_v12, "K"), 5) if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.5])) else _S.read(_v12, "WHITE")), (_S.invoke(_S.read(_v12, "R"), "range", [1, 1.6]) if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.15])) else 0.5)])
			_v12 = _S.iteration(_v12)
			_S.set_prop(_S.read(_v12, "s"), "acc", 1, "-=", true)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "-=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.read(_v13, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		if _S.truth(_S.binary(">", _S.read(_v13, "t"), _S.binary("+", _S.prop(_S.prop(_S.read(_v13, "pops"), _S.read(_v13, "i")), "t0"), _S.prop(_S.prop(_S.read(_v13, "pops"), _S.read(_v13, "i")), "life")))):
			_S.invoke(_S.read(_v13, "pops"), "splice", [_S.read(_v13, "i"), 1])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "RISE"))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "u", _S.binary("/", _S.read(_v14, "t"), _S.read(_v14, "RISE")))
		_S.define(_v14, "y", _S.binary("*", _S.read(_v14, "Y0"), _S.binary("-", 1, _S.invoke(_S.read(_v14, "ease"), "outCubic", [_S.read(_v14, "u")]))))
		_S.invoke(_S.read(_v14, "p"), "line", [0, _S.read(_v14, "y"), 0, _S.binary("+", _S.binary("+", _S.read(_v14, "y"), 3), _S.binary("*", 6, _S.binary("-", 1, _S.read(_v14, "u")))), _S.function_value(_v14, "_f5")])
		_S.invoke(_S.read(_v14, "p"), "px", [0, _S.read(_v14, "y"), _S.read(_v14, "WHITE")])
		_S.invoke(_S.read(_v14, "p"), "glow", [0, _S.read(_v14, "y"), 7, _S.prop(_S.read(_v14, "K"), 4), 0.5])
	for _v15 in _S.array(_S.read(_e, "stars")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "s", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "k", _S.binary("/", _S.prop(_S.read(_v17, "s"), "age"), _S.prop(_S.read(_v17, "s"), "life")))
		_S.define(_v17, "P2", _S.prop(_S.read(_v17, "s"), "pts"))
		_S.define(_v17, "n", _S.binary("/", _S.prop(_S.read(_v17, "P2"), "length"), 3))
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "j", _S.binary("-", _S.read(_v18, "n"), 1))
		while _S.truth(_S.binary(">", _S.read(_v18, "j"), 0)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "u", _S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.prop(_S.read(_v19, "P2"), _S.binary("+", _S.binary("*", _S.read(_v19, "j"), 3), 2))), _S.read(_v19, "TRAIL")))
			if _S.truth(_S.binary(">=", _S.read(_v19, "u"), 1)):
				break
			_S.define(_v19, "ramp", (_S.prop(_S.read(_v19, "s"), "first") if _S.truth(_S.binary("<", _S.binary("-", _S.prop(_S.read(_v19, "s"), "age"), _S.binary("-", _S.read(_v19, "t"), _S.prop(_S.read(_v19, "P2"), _S.binary("+", _S.binary("*", _S.read(_v19, "j"), 3), 2)))), _S.read(_v19, "TURN"))) else _S.prop(_S.read(_v19, "s"), "ramp")))
			_S.define(_v19, "c", (_S.prop(_S.read(_v19, "ramp"), 5) if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.3)) else (_S.prop(_S.read(_v19, "ramp"), 4) if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.6)) else _S.prop(_S.read(_v19, "ramp"), 3))))
			_S.invoke(_S.read(_v19, "p"), "line", [_S.prop(_S.read(_v19, "P2"), _S.binary("*", _S.read(_v19, "j"), 3)), _S.prop(_S.read(_v19, "P2"), _S.binary("+", _S.binary("*", _S.read(_v19, "j"), 3), 1)), _S.prop(_S.read(_v19, "P2"), _S.binary("-", _S.binary("*", _S.read(_v19, "j"), 3), 3)), _S.prop(_S.read(_v19, "P2"), _S.binary("-", _S.binary("*", _S.read(_v19, "j"), 3), 2)), _S.read(_v19, "c"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "pow", [_S.binary("-", 1, _S.read(_v19, "u")), 0.8]), _S.binary("-", 1.3, _S.binary("*", _S.read(_v19, "k"), 0.6)))])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "j", 1, "-=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v17, "k"), 0.72), func(): return _S.binary("<", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v17, "t"), 60), _S.prop(_S.read(_v17, "s"), "seed"))]), _S.unary("-", 0.2)))):
			continue
		_S.define(_v17, "ramp", (_S.prop(_S.read(_v17, "s"), "first") if _S.truth(_S.binary("<", _S.prop(_S.read(_v17, "s"), "age"), _S.read(_v17, "TURN"))) else _S.prop(_S.read(_v17, "s"), "ramp")))
		_S.define(_v17, "head", (_S.read(_v17, "WHITE") if _S.truth(_S.binary("<", _S.prop(_S.read(_v17, "s"), "age"), 0.04)) else (_S.prop(_S.read(_v17, "ramp"), (5 if _S.truth(_S.binary("<", _S.prop(_S.read(_v17, "s"), "age"), _S.read(_v17, "TURN"))) else 6)) if _S.truth(_S.binary("<", _S.read(_v17, "k"), 0.55)) else _S.prop(_S.read(_v17, "ramp"), 5))))
		_S.invoke(_S.read(_v17, "p"), "px", [_S.prop(_S.read(_v17, "s"), "x"), _S.prop(_S.read(_v17, "s"), "y"), _S.read(_v17, "head")])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v17, "s"), "big"), func(): return _S.binary("<", _S.read(_v17, "k"), 0.6)), func(): return _S.binary(">", _S.prop(_S.read(_v17, "s"), "age"), 0.06))):
			for _v20 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v21 = _S.scope(_v17)
				var _v22 = _v20
				_S.define(_v21, "dx", _S.prop(_v22, 0))
				_S.define(_v21, "dy", _S.prop(_v22, 1))
				_S.invoke(_S.read(_v21, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v21, "s"), "x"), _S.read(_v21, "dx")), _S.binary("+", _S.prop(_S.read(_v21, "s"), "y"), _S.read(_v21, "dy")), _S.prop(_S.read(_v21, "ramp"), 5)])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.prop(_S.read(_v17, "s"), "x"), _S.prop(_S.read(_v17, "s"), "y"), (7 if _S.truth(_S.prop(_S.read(_v17, "s"), "big")) else 5), _S.prop(_S.read(_v17, "ramp"), 4), _S.binary("*", _S.binary("*", (0.7 if _S.truth(_S.prop(_S.read(_v17, "s"), "big")) else 0.5), _S.binary("-", 1, _S.binary("*", _S.read(_v17, "k"), 0.6))), _S.invoke(_S.read(_v17, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v17, "s"), "age"), 0.2)]))])
	for _v23 in _S.array(_S.read(_e, "pops")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "q", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "u", _S.binary("/", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "q"), "t0")), _S.prop(_S.read(_v25, "q"), "life")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v25, "u"), 0), func(): return _S.binary(">", _S.read(_v25, "u"), 1))):
			continue
		_S.call_value(_S.read(_v25, "sparkle"), [_S.read(_v25, "p"), _S.prop(_S.read(_v25, "q"), "x"), _S.prop(_S.read(_v25, "q"), "y"), _S.binary("*", 2.6, _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v25, "Math"), "PI"), _S.read(_v25, "u"))])), _S.prop(_S.read(_v25, "q"), "c"), _S.call_value(_S.read(_v25, "mix"), [_S.prop(_S.read(_v25, "q"), "c"), _S.prop(_S.read(_v25, "C"), 3), 0.5]), 0.5])
	_S.define(_e, "b", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "RISE")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "b"), 0), func(): return _S.binary("<", _S.read(_e, "b"), 0.28))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "u", _S.binary("/", _S.read(_v26, "b"), 0.28))
		_S.define(_v26, "L", _S.binary("*", 32, _S.invoke(_S.read(_v26, "Math"), "pow", [_S.binary("-", 1, _S.read(_v26, "u")), 1.3])))
		_S.call_value(_S.read(_v26, "flareRays"), [_S.read(_v26, "p"), 0, 0, _S.read(_v26, "L"), _S.binary("*", _S.read(_v26, "u"), 0.6), _S.read(_v26, "C"), _S.read(_v26, "K")])
		if _S.truth(_S.binary("<", _S.read(_v26, "b"), 0.07)):
			_S.invoke(_S.read(_v26, "p"), "circle", [0, 0, _S.binary("-", 2.6, _S.binary("*", _S.read(_v26, "b"), 20)), _S.read(_v26, "WHITE")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "K"), 5) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.3)) else _S.prop(_S.read(_e, "K"), 3))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "ang", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "K", _S.arg(_args, 6))
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 1)):
		return null
	var _v27 = _S.scope(_e)
	_S.define(_v27, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v27, "i"), 8)):
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "diag", _S.binary("===", _S.binary("%", _S.read(_v28, "i"), 2), 1))
		_S.define(_v28, "an", _S.binary("+", _S.read(_v28, "ang"), _S.binary("/", _S.binary("*", _S.read(_v28, "i"), _S.read(_v28, "TAU")), 8)))
		_S.define(_v28, "len", (_S.binary("*", _S.read(_v28, "L"), 0.42) if _S.truth(_S.read(_v28, "diag")) else _S.read(_v28, "L")))
		_S.define(_v28, "ca", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "an")]))
		_S.define(_v28, "sa", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "an")]))
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v29, "d"), _S.read(_v29, "len"))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "u", _S.binary("/", _S.read(_v30, "d"), _S.read(_v30, "len")))
			_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("+", _S.read(_v30, "x"), _S.binary("*", _S.read(_v30, "ca"), _S.read(_v30, "d"))), _S.binary("+", _S.read(_v30, "y"), _S.binary("*", _S.read(_v30, "sa"), _S.read(_v30, "d"))), ((_S.prop(_S.read(_v30, "K"), 5) if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.5)) else _S.prop(_S.read(_v30, "K"), 4)) if _S.truth(_S.read(_v30, "diag")) else (_S.read(_v30, "WHITE") if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.3)) else (_S.prop(_S.read(_v30, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.65)) else _S.prop(_S.read(_v30, "C"), 4)))), (1 if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.7)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v30, "u"), 0.7), 0.35)))])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "d", 0.5, "+=", false)
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 4, _S.binary("*", _S.read(_e, "L"), 1.2)), _S.prop(_S.read(_e, "C"), 4), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 2, _S.binary("*", _S.read(_e, "L"), 0.3)), _S.read(_e, "WHITE"), 0.25])
	return null
