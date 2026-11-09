@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/confetti.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "popper", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Confetti"}, {"desc": "Two party poppers bang one after the other: paper bits and curly streamers burst out, stall, then tumble and flutter down, flipping, and settle on the floor."}, {"tags": ["ui", "celebration", "confetti", "party", "reward", "one-shot"]}, {"size": [200, 140]}, {"origin": [100, 126]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#ff4a5a", "#ff9a2a", "#ffe03c", "#5ad84a", "#3cc8ff", "#7a6cff", "#f53cd1"]}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POPPERS", [_S.merge([{"x": _S.unary("-", 74)}, {"y": _S.unary("-", 1)}, {"a": _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 0.62)}, {"t": 0.1}]), _S.merge([{"x": 74}, {"y": _S.unary("-", 1)}, {"a": _S.binary("-", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 0.62)}, {"t": 0.26}])])
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#141019"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "alpha", _S.arg(_args, 6))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "bx", _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "k"))))
	_S.define(_e, "by", _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "bx"), 12), _S.binary("-", _S.read(_e, "by"), 12), _S.binary("+", _S.read(_e, "bx"), 12), _S.binary("+", _S.read(_e, "by"), 12), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "bx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "by")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 11))):
		return null
	_S.define(_e, "hw", _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "u"), 0.32)))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.binary("+", _S.read(_e, "hw"), 0.6))):
		return null
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "alpha"), "=", false)
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.binary("-", _S.read(_e, "hw"), 0.4)), func(): return _S.binary(">", _S.read(_e, "u"), 10.2)), func(): return _S.binary("<", _S.read(_e, "u"), 0.8))):
		return _S.read(_e, "INK")
	_S.define(_e, "stripe", _S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "u"), _S.binary("*", _S.read(_e, "v"), 0.6)), 2.2)]), 2), 0))
	return ((_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 2), 0.75])) if _S.truth(_S.read(_e, "stripe")) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.call_value(_S.read(_e, "hex"), ["#c8c0d8"])))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "fire", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f5")}, {"sparks": ["#ffffff", "#fff3a6", "#ffc23d", "#ff8a2a"]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", [])
	_S.define(_e, "ribbons", [])
	_S.define(_e, "fired", [false, false])
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "kick", _S.function_value(_e, "_f6"))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pp", _S.arg(_args, 0))
	_S.define(_e, "mx", _S.binary("+", _S.prop(_S.read(_e, "pp"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "pp"), "a")]), 11)))
	_S.define(_e, "my", _S.binary("+", _S.prop(_S.read(_e, "pp"), "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "pp"), "a")]), 11)))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "mx"), _S.read(_e, "my"), 34, _S.read(_e, "WHITE"), 0.6, 0.12])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "mx"), _S.read(_e, "my"), 50, _S.prop(_S.read(_e, "C"), 2), 0.4, 0.4])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 6)):
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "SMOKE"), _S.read(_v0, "mx"), _S.read(_v0, "my"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.prop(_S.read(_v0, "pp"), "a")]), _S.invoke(_S.read(_v0, "R"), "range", [20, 60])), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 10), 10])), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.prop(_S.read(_v0, "pp"), "a")]), _S.invoke(_S.read(_v0, "R"), "range", [20, 60])), _S.invoke(_S.read(_v0, "R"), "range", [0.6, 1]), _S.call_value(_S.read(_v0, "hex"), ["#5d5660"]), _S.invoke(_S.read(_v0, "R"), "range", [2.5, 4])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 12)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "an", _S.binary("+", _S.prop(_S.read(_v2, "pp"), "a"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.5), 0.5])))
		_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "R"), "range", [120, 260]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.read(_v2, "mx"), _S.read(_v2, "my"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), _S.invoke(_S.read(_v2, "R"), "range", [0.1, 0.25])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 46)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "an", _S.binary("+", _S.prop(_S.read(_v4, "pp"), "a"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.38), 0.38])))
		_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "R"), "range", [200, 380]))
		_S.invoke(_S.read(_v4, "bits"), "push", [_S.merge([{"x": _S.read(_v4, "mx")}, {"y": _S.read(_v4, "my")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "an")]), _S.read(_v4, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "an")]), _S.read(_v4, "sp"))}, {"c": _S.invoke(_S.read(_v4, "R"), "pick", [_S.read(_v4, "C")])}, {"w": _S.invoke(_S.read(_v4, "R"), "range", [2, 3])}, {"h": _S.invoke(_S.read(_v4, "R"), "range", [3, 4.6])}, {"ang": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"spin": _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 14), 14])}, {"flip": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"fs": _S.invoke(_S.read(_v4, "R"), "range", [5, 13])}, {"ph": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"amp": _S.invoke(_S.read(_v4, "R"), "range", [5, 12])}, {"fw": _S.invoke(_S.read(_v4, "R"), "range", [2, 3.4])}, {"x0": 0}, {"mode": 0}, {"rest": 0}, {"fall": _S.invoke(_S.read(_v4, "R"), "range", [26, 40])}])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 4)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "an", _S.binary("+", _S.prop(_S.read(_v6, "pp"), "a"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [220, 330]))
		_S.define(_v6, "n", 11)
		_S.invoke(_S.read(_v6, "ribbons"), "push", [_S.merge([{"pts": _S.invoke(_S.read(_v6, "Array"), "from", [_S.merge([{"length": _S.read(_v6, "n")}]), _S.function_value(_v6, "_f4")])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"c": _S.invoke(_S.read(_v6, "R"), "pick", [_S.read(_v6, "C")])}, {"ph": _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")])}, {"amp": _S.invoke(_S.read(_v6, "R"), "range", [6, 12])}, {"fw": _S.invoke(_S.read(_v6, "R"), "range", [1.5, 2.4])}, {"mode": 0}, {"x0": 0}, {"curl": _S.invoke(_S.read(_v6, "R"), "range", [0.7, 1.1])}, {"fall": _S.invoke(_S.read(_v6, "R"), "range", [22, 32])}])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return [_S.read(_e, "mx"), _S.read(_e, "my")]

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "pp", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "pp"), "t"))) else _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "pp"), "t"))), 14)])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "POPPERS"), "forEach", [_S.function_value(_e, "_f8")])
	for _v7 in _S.array(_S.read(_e, "bits")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "b", _v7)
		var _v9 = _S.scope(_v8)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v9, "b"), "mode"), 2)):
			var _v10 = _S.scope(_v9)
			_S.set_prop(_S.read(_v10, "b"), "rest", _S.read(_v10, "dt"), "+=", false)
			continue
		_S.set_prop(_S.read(_v9, "b"), "flip", _S.binary("*", _S.prop(_S.read(_v9, "b"), "fs"), _S.read(_v9, "dt")), "+=", false)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v9, "b"), "mode"), 0)):
			var _v11 = _S.scope(_v9)
			_S.set_prop(_S.read(_v11, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vx"), 3.4), _S.read(_v11, "dt")), "-=", false)
			_S.set_prop(_S.read(_v11, "b"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vy"), 3.4), _S.read(_v11, "dt")), _S.binary("*", 140, _S.read(_v11, "dt"))), "-=", false)
			_S.set_prop(_S.read(_v11, "b"), "x", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vx"), _S.read(_v11, "dt")), "+=", false)
			_S.set_prop(_S.read(_v11, "b"), "y", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vy"), _S.read(_v11, "dt")), "+=", false)
			_S.set_prop(_S.read(_v11, "b"), "ang", _S.binary("*", _S.prop(_S.read(_v11, "b"), "spin"), _S.read(_v11, "dt")), "+=", false)
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.prop(_S.read(_v11, "b"), "vx"), _S.prop(_S.read(_v11, "b"), "vy")]), 40)):
				_S.last([_S.set_prop(_S.read(_v11, "b"), "mode", 1, "=", false), _S.set_prop(_S.read(_v11, "b"), "x0", _S.binary("-", _S.prop(_S.read(_v11, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.prop(_S.read(_v11, "b"), "ph")]), _S.prop(_S.read(_v11, "b"), "amp"))), "=", false)])
		else:
			var _v12 = _S.scope(_v9)
			_S.set_prop(_S.read(_v12, "b"), "ph", _S.binary("*", _S.prop(_S.read(_v12, "b"), "fw"), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "x0", _S.binary("*", _S.prop(_S.read(_v12, "b"), "vx"), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v12, "b"), "vx"), 2), _S.read(_v12, "dt")), "-=", false)
			_S.set_prop(_S.read(_v12, "b"), "x", _S.binary("+", _S.prop(_S.read(_v12, "b"), "x0"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.prop(_S.read(_v12, "b"), "ph")]), _S.prop(_S.read(_v12, "b"), "amp"))), "=", false)
			_S.set_prop(_S.read(_v12, "b"), "y", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v12, "b"), "fall"), _S.binary("+", 0.4, _S.binary("*", 0.9, _S.invoke(_S.read(_v12, "Math"), "abs", [_S.invoke(_S.read(_v12, "Math"), "cos", [_S.prop(_S.read(_v12, "b"), "ph")])])))), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "ang", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.prop(_S.read(_v12, "b"), "ph")]), 0.9), "=", false)
			if _S.truth(_S.binary(">=", _S.prop(_S.read(_v12, "b"), "y"), _S.unary("-", 1))):
				_S.last([_S.set_prop(_S.read(_v12, "b"), "y", _S.unary("-", 0.5), "=", false), _S.set_prop(_S.read(_v12, "b"), "mode", 2, "=", false), _S.set_prop(_S.read(_v12, "b"), "ang", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 0.3), 0.3]), "=", false), _S.set_prop(_S.read(_v12, "b"), "flip", 0, "=", false)])
	for _v13 in _S.array(_S.read(_e, "ribbons")):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "r", _v13)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "h", _S.prop(_S.prop(_S.read(_v15, "r"), "pts"), 0))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v15, "r"), "mode"), 0)):
			var _v16 = _S.scope(_v15)
			_S.set_prop(_S.read(_v16, "r"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "r"), "vx"), 3), _S.read(_v16, "dt")), "-=", false)
			_S.set_prop(_S.read(_v16, "r"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "r"), "vy"), 3), _S.read(_v16, "dt")), _S.binary("*", 120, _S.read(_v16, "dt"))), "-=", false)
			_S.set_prop(_S.read(_v16, "h"), 0, _S.binary("*", _S.prop(_S.read(_v16, "r"), "vx"), _S.read(_v16, "dt")), "+=", false)
			_S.set_prop(_S.read(_v16, "h"), 1, _S.binary("*", _S.prop(_S.read(_v16, "r"), "vy"), _S.read(_v16, "dt")), "+=", false)
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.prop(_S.read(_v16, "r"), "vx"), _S.prop(_S.read(_v16, "r"), "vy")]), 35)):
				_S.last([_S.set_prop(_S.read(_v16, "r"), "mode", 1, "=", false), _S.set_prop(_S.read(_v16, "r"), "x0", _S.binary("-", _S.prop(_S.read(_v16, "h"), 0), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.prop(_S.read(_v16, "r"), "ph")]), _S.prop(_S.read(_v16, "r"), "amp"))), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v15, "h"), 1), _S.unary("-", 1))):
				var _v17 = _S.scope(_v15)
				_S.set_prop(_S.read(_v17, "r"), "ph", _S.binary("*", _S.prop(_S.read(_v17, "r"), "fw"), _S.read(_v17, "dt")), "+=", false)
				_S.set_prop(_S.read(_v17, "r"), "x0", _S.binary("*", _S.prop(_S.read(_v17, "r"), "vx"), _S.read(_v17, "dt")), "+=", false)
				_S.set_prop(_S.read(_v17, "r"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "r"), "vx"), 2), _S.read(_v17, "dt")), "-=", false)
				_S.set_prop(_S.read(_v17, "h"), 0, _S.binary("+", _S.prop(_S.read(_v17, "r"), "x0"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.prop(_S.read(_v17, "r"), "ph")]), _S.prop(_S.read(_v17, "r"), "amp"))), "=", false)
				_S.set_prop(_S.read(_v17, "h"), 1, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "r"), "fall"), _S.binary("+", 0.5, _S.binary("*", 0.7, _S.invoke(_S.read(_v17, "Math"), "abs", [_S.invoke(_S.read(_v17, "Math"), "cos", [_S.prop(_S.read(_v17, "r"), "ph")])])))), _S.read(_v17, "dt")), "+=", false)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.prop(_S.prop(_S.read(_v18, "r"), "pts"), "length"))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.prop(_S.prop(_S.read(_v19, "r"), "pts"), _S.binary("-", _S.read(_v19, "i"), 1)))
			_S.define(_v19, "b", _S.prop(_S.prop(_S.read(_v19, "r"), "pts"), _S.read(_v19, "i")))
			_S.set_prop(_S.read(_v19, "b"), 1, _S.invoke(_S.read(_v19, "Math"), "min", [_S.unary("-", 0.5), _S.binary("+", _S.prop(_S.read(_v19, "b"), 1), _S.binary("*", 20, _S.read(_v19, "dt")))]), "=", false)
			_S.define(_v19, "dx", _S.binary("-", _S.prop(_S.read(_v19, "b"), 0), _S.prop(_S.read(_v19, "a"), 0)))
			_S.define(_v19, "dy", _S.binary("-", _S.prop(_S.read(_v19, "b"), 1), _S.prop(_S.read(_v19, "a"), 1)))
			_S.define(_v19, "d", _S.logical("||", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.read(_v19, "dx"), _S.read(_v19, "dy")]), func(): return 1))
			if _S.truth(_S.binary(">", _S.read(_v19, "d"), 2.6)):
				_S.last([_S.set_prop(_S.read(_v19, "b"), 0, _S.binary("+", _S.prop(_S.read(_v19, "a"), 0), _S.binary("*", _S.binary("/", _S.read(_v19, "dx"), _S.read(_v19, "d")), 2.6)), "=", false), _S.set_prop(_S.read(_v19, "b"), 1, _S.binary("+", _S.prop(_S.read(_v19, "a"), 1), _S.binary("*", _S.binary("/", _S.read(_v19, "dy"), _S.read(_v19, "d")), 2.6)), "=", false)])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pp", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "fired"), _S.read(_e, "i"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "pp"), "t"))), func(): return _S.last([_S.set_prop(_S.read(_e, "fired"), _S.read(_e, "i"), true, "=", false), _S.call_value(_S.read(_e, "fire"), [_S.read(_e, "pp")])]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "end"), 0.45), _S.binary("-", _S.read(_e, "end"), 0.05)])))
	for _v20 in _S.array(_S.read(_e, "POPPERS")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "pp", _v20)
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "k", _S.call_value(_S.read(_v22, "kick"), [_S.read(_v22, "t"), _S.read(_v22, "pp")]))
		_S.call_value(_S.read(_v22, "popper"), [_S.read(_v22, "p"), _S.prop(_S.read(_v22, "pp"), "x"), _S.prop(_S.read(_v22, "pp"), "y"), _S.prop(_S.read(_v22, "pp"), "a"), _S.read(_v22, "k"), _S.read(_v22, "C"), _S.binary("-", 1, _S.call_value(_S.read(_v22, "seg"), [_S.read(_v22, "t"), 2.5, 2.9]))])
		_S.define(_v22, "ft", _S.binary("-", _S.read(_v22, "t"), _S.prop(_S.read(_v22, "pp"), "t")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v22, "ft"), 0), func(): return _S.binary("<", _S.read(_v22, "ft"), 0.12))):
			_S.call_value(_S.read(_v22, "sparkle"), [_S.read(_v22, "p"), _S.binary("+", _S.prop(_S.read(_v22, "pp"), "x"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.prop(_S.read(_v22, "pp"), "a")]), 13)), _S.binary("+", _S.prop(_S.read(_v22, "pp"), "y"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.prop(_S.read(_v22, "pp"), "a")]), 13)), _S.binary("*", 7, _S.binary("-", 1, _S.binary("/", _S.read(_v22, "ft"), 0.12))), _S.read(_v22, "WHITE"), _S.prop(_S.read(_v22, "C"), 2), 0.7])
	for _v23 in _S.array(_S.read(_e, "ribbons")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "r", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "pts", _S.invoke(_S.prop(_S.read(_v25, "r"), "pts"), "map", [_S.function_value(_v25, "_f11")]))
		var _v27 = _S.scope(_v25)
		_S.define(_v27, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), _S.prop(_S.read(_v27, "pts"), "length"))):
			var _v28 = _S.scope(_v27)
			var _v29 = _S.prop(_S.read(_v28, "pts"), _S.binary("-", _S.read(_v28, "i"), 1))
			_S.define(_v28, "x0", _S.prop(_v29, 0))
			_S.define(_v28, "y0", _S.prop(_v29, 1))
			var _v30 = _S.prop(_S.read(_v28, "pts"), _S.read(_v28, "i"))
			_S.define(_v28, "x1", _S.prop(_v30, 0))
			_S.define(_v28, "y1", _S.prop(_v30, 1))
			_S.define(_v28, "front", _S.binary(">", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v28, "i"), _S.prop(_S.read(_v28, "r"), "curl")), _S.binary("*", _S.read(_v28, "t"), 9)), _S.prop(_S.read(_v28, "r"), "ph"))]), 0))
			_S.invoke(_S.read(_v28, "p"), "line", [_S.read(_v28, "x0"), _S.read(_v28, "y0"), _S.read(_v28, "x1"), _S.read(_v28, "y1"), (_S.prop(_S.read(_v28, "r"), "c") if _S.truth(_S.read(_v28, "front")) else _S.call_value(_S.read(_v28, "scale"), [_S.prop(_S.read(_v28, "r"), "c"), 0.6])), _S.read(_v28, "fade")])
			_S.invoke(_S.read(_v28, "p"), "line", [_S.binary("+", _S.read(_v28, "x0"), 1), _S.read(_v28, "y0"), _S.binary("+", _S.read(_v28, "x1"), 1), _S.read(_v28, "y1"), (_S.call_value(_S.read(_v28, "mix"), [_S.prop(_S.read(_v28, "r"), "c"), _S.read(_v28, "WHITE"), 0.35]) if _S.truth(_S.read(_v28, "front")) else _S.call_value(_S.read(_v28, "scale"), [_S.prop(_S.read(_v28, "r"), "c"), 0.45])), _S.read(_v28, "fade")])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
	for _v31 in _S.array(_S.read(_e, "bits")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "b", _v31)
		var _v33 = _S.scope(_v32)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v33, "b"), "y"), 1)):
			continue
		_S.define(_v33, "fw", (1 if _S.truth(_S.binary("===", _S.prop(_S.read(_v33, "b"), "mode"), 2)) else _S.invoke(_S.read(_v33, "Math"), "cos", [_S.prop(_S.read(_v33, "b"), "flip")])))
		_S.define(_v33, "w", _S.invoke(_S.read(_v33, "Math"), "max", [0.5, _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "abs", [_S.read(_v33, "fw")]), _S.prop(_S.read(_v33, "b"), "w"))]))
		_S.define(_v33, "ca", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.prop(_S.read(_v33, "b"), "ang")]))
		_S.define(_v33, "sa", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.prop(_S.read(_v33, "b"), "ang")]))
		_S.define(_v33, "c", (_S.prop(_S.read(_v33, "b"), "c") if _S.truth(_S.binary(">=", _S.read(_v33, "fw"), 0)) else _S.call_value(_S.read(_v33, "scale"), [_S.prop(_S.read(_v33, "b"), "c"), 0.62])))
		_S.define(_v33, "a", _S.read(_v33, "fade"))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v33, "b"), "mode"), 2)):
			var _v34 = _S.scope(_v33)
			_S.invoke(_S.read(_v34, "p"), "dot", [_S.prop(_S.read(_v34, "b"), "x"), _S.prop(_S.read(_v34, "b"), "y"), _S.call_value(_S.read(_v34, "scale"), [_S.prop(_S.read(_v34, "b"), "c"), 0.8]), _S.read(_v34, "a")])
			_S.invoke(_S.read(_v34, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v34, "b"), "x"), 1), _S.prop(_S.read(_v34, "b"), "y"), _S.call_value(_S.read(_v34, "scale"), [_S.prop(_S.read(_v34, "b"), "c"), 0.6]), _S.read(_v34, "a")])
			continue
		_S.invoke(_S.read(_v33, "p"), "shade", [_S.binary("-", _S.prop(_S.read(_v33, "b"), "x"), 4), _S.binary("-", _S.prop(_S.read(_v33, "b"), "y"), 4), _S.binary("+", _S.prop(_S.read(_v33, "b"), "x"), 4), _S.binary("+", _S.prop(_S.read(_v33, "b"), "y"), 4), _S.function_value(_v33, "_f12")])
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v33, "Math"), "abs", [_S.read(_v33, "fw")]), 0.97)):
			_S.invoke(_S.read(_v33, "p"), "glow", [_S.prop(_S.read(_v33, "b"), "x"), _S.prop(_S.read(_v33, "b"), "y"), 5, _S.call_value(_S.read(_v33, "mix"), [_S.prop(_S.read(_v33, "b"), "c"), _S.read(_v33, "WHITE"), 0.5]), _S.binary("*", 0.35, _S.read(_v33, "fade"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v26 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v26, 0))
	_S.define(_e, "y", _S.prop(_v26, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "i"), _S.prop(_S.read(_e, "r"), "curl")), _S.binary("*", _S.read(_e, "t"), 9)), _S.prop(_S.read(_e, "r"), "ph"))]), (1.6 if _S.truth(_S.read(_e, "i")) else 0))), _S.read(_e, "y")]

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), _S.binary("+", _S.binary("/", _S.read(_e, "w"), 2), 0.2)), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.binary("/", _S.prop(_S.read(_e, "b"), "h"), 2)))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fw")]), 0.92), func(): return _S.binary("<", _S.read(_e, "v"), _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "b"), "h")), 2), 1)))) else _S.read(_e, "c"))
