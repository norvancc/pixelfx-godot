@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/homing-missile.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "turnSprite", _S.import_value("fx/projectiles/_lib.js", "turnSprite"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Homing missile"}, {"desc": "A missile kicks off, arcs up, rolls over and dives onto its target (the origin), its smoke trail left hanging in the air, and hits in a fiery blast of flame, sparks and rocks."}, {"tags": ["projectile", "missile", "rocket", "homing", "smoke", "explosion", "one-shot"]}, {"size": [248, 140]}, {"origin": [160, 120]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"metal": ["#25243a", "#3e4058", "#61667f", "#8e97b0", "#c4cce0"]}, {"smoke": ["#26222e", "#3b3644", "#544e5e", "#6f6979", "#8c8596", "#aca5b5", "#cbc4d2"]}, {"stone": "#4a3f69"}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FLY", 1.15)
	_S.define(_e, "PATH", [[_S.unary("-", 130), _S.unary("-", 22)], [_S.unary("-", 114), _S.unary("-", 110)], [_S.unary("-", 30), _S.unary("-", 120)], [0, 0]])
	_S.define(_e, "at", _S.function_value(_e, "_f10"))
	_S.define(_e, "heading", _S.function_value(_e, "_f11"))
	_S.define(_e, "progress", _S.function_value(_e, "_f13"))
	_S.define(_e, "MISSILE", ["ff..........", ".fhhhhhhhre.", "nmmmmmmmmrrw", ".fsssssssrd.", "ff.........."])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 5]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "stone", _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "st")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 1.2]), _S.call_value(_S.read(_e, "hex"), ["#968c96"]), 0.3])}]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pal", _S.merge([{"f": _S.prop(_S.read(_e, "M"), 1)}, {"h": _S.prop(_S.read(_e, "M"), 4)}, {"m": _S.prop(_S.read(_e, "M"), 3)}, {"s": _S.prop(_S.read(_e, "M"), 1)}, {"n": _S.prop(_S.read(_e, "M"), 0)}, {"r": _S.prop(_S.read(_e, "F"), 2)}, {"e": _S.prop(_S.read(_e, "F"), 3)}, {"d": _S.prop(_S.read(_e, "F"), 1)}, {"w": _S.read(_e, "WHITE")}]))
	_S.define(_e, "t", 0)
	_S.define(_e, "emit", 0)
	_S.define(_e, "hit", false)
	_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.prop(_S.read(_e, "PATH"), 0), 0), _S.prop(_S.prop(_S.read(_e, "PATH"), 0), 1), 30, _S.prop(_S.read(_e, "F"), 4), 0.7, 0.25])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 6)):
		_S.invoke(_S.read(_v0, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.prop(_S.prop(_S.read(_v0, "PATH"), 0), 0), 2)}, {"y": _S.binary("+", _S.prop(_S.prop(_S.read(_v0, "PATH"), 0), 1), 2)}, {"vx": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 30), 20])}, {"vy": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 10), 15])}, {"r0": 2}, {"r1": _S.invoke(_S.read(_v0, "R"), "range", [5, 7.5])}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [1.2, 1.8])}, {"a": 0.6}, {"warm": 1}, {"rise": 8}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "blast", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "Y", _S.unary("-", 6))
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("-", _S.read(_e, "Y"), 2), 52, _S.call_value(_S.read(_e, "hex"), ["#ffb060"]), 0.8, 0.8])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("-", _S.read(_e, "Y"), 2), 30, _S.read(_e, "WHITE"), 0.75, 0.1])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 26)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
		_S.define(_v2, "d", _S.invoke(_S.read(_v2, "R"), "range", [0, 6]))
		_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "R"), "range", [30, 170]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "d")), _S.binary("+", _S.read(_v2, "Y"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "d"))), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), 0.75), 40), _S.invoke(_S.read(_v2, "R"), "range", [0.45, 0.95]), 0, _S.invoke(_S.read(_v2, "R"), "range", [3.2, 6.5])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 5)):
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "FIRE"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 3), 3]), _S.read(_v3, "Y"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v3, "R"), "range", [90, 150])), _S.invoke(_S.read(_v3, "R"), "range", [0.7, 1.1]), 0, _S.invoke(_S.read(_v3, "R"), "range", [4, 5.5]), _S.invoke(_S.read(_v3, "R"), "range", [0, 0.08])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 70)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [_S.binary("+", _S.prop(_S.read(_v5, "Math"), "PI"), 0.12), _S.binary("-", _S.read(_v5, "TAU"), 0.12)]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [110, 280]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), 0, _S.read(_v5, "Y"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 40), _S.invoke(_S.read(_v5, "R"), "range", [0.2, 0.65])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 22)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.prop(_S.read(_v7, "Math"), "PI"), _S.read(_v7, "TAU")]))
		_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 110]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 4), _S.binary("+", _S.read(_v7, "Y"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 50), _S.invoke(_S.read(_v7, "R"), "range", [0.9, 1.6]), _S.prop(_S.read(_v7, "F"), 4)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 16)):
		_S.invoke(_S.read(_v8, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v8, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 5), 5])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 110), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [140, 290]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v8, "R"), "range", [1.5, 2.2])}, {"a": _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")])}, {"va": _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v8, "R"), "int", [1, 2])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 60)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "u", _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v10, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.binary("*", _S.read(_v10, "u"), 0.55)))
		_S.define(_v10, "sp", _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [80, 220]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "u")])))))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "GRIT"), _S.binary("*", _S.read(_v10, "u"), 4), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.prop(_S.read(_v10, "stone"), "light"), _S.prop(_S.read(_v10, "stone"), "body"), _S.prop(_S.read(_v10, "stone"), "body"), _S.prop(_S.read(_v10, "stone"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.4])) else 1)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 18)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.invoke(_S.read(_v12, "R"), "range", [_S.binary("*", _S.prop(_S.read(_v12, "Math"), "PI"), 1.15), _S.binary("*", _S.prop(_S.read(_v12, "Math"), "PI"), 1.85)]))
		_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [20, 90]))
		_S.invoke(_S.read(_v12, "smoke"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), 4)}, {"y": _S.binary("+", _S.read(_v12, "Y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), 4))}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 0.7)}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", 45, _S.binary("/", _S.read(_v12, "i"), 18)))}, {"r0": 3}, {"r1": _S.invoke(_S.read(_v12, "R"), "range", [8, 14])}, {"life": _S.invoke(_S.read(_v12, "R"), "range", [1.7, 2.2])}, {"a": 0.62}, {"b": 0.88}, {"warm": 1}, {"rise": _S.binary("+", 30, _S.binary("*", _S.read(_v12, "i"), 2))}, {"drag": 1.8}, {"delay": _S.invoke(_S.read(_v12, "R"), "range", [0.05, 0.35])}])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "s", _S.invoke(_S.read(_v14, "R"), "sign", []))
		_S.invoke(_S.read(_v14, "smoke"), "add", [_S.merge([{"x": _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [0, 6]))}, {"y": _S.unary("-", 3)}, {"vx": _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [60, 150]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [3, 12]))}, {"r0": 2.5}, {"r1": _S.invoke(_S.read(_v14, "R"), "range", [6, 9])}, {"life": _S.invoke(_S.read(_v14, "R"), "range", [1.1, 1.7])}, {"a": 0.5}, {"b": 0.75}, {"warm": 0.3}, {"rise": 6}, {"drag": 3}])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLY"))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "u", _S.call_value(_S.read(_v15, "progress"), [_S.read(_v15, "t")]))
		var _v16 = _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "u")])
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.define(_v15, "h", _S.call_value(_S.read(_v15, "heading"), [_S.read(_v15, "u")]))
		_S.define(_v15, "cx", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "h")]))
		_S.define(_v15, "cy", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "h")]))
		var _v17 = _S.call_value(_S.read(_v15, "at"), [_S.call_value(_S.read(_v15, "progress"), [_S.invoke(_S.read(_v15, "Math"), "max", [0, _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "dt"))])])])
		_S.define(_v15, "px", _S.prop(_v17, 0))
		_S.define(_v15, "py", _S.prop(_v17, 1))
		var _v18 = _S.scope(_v15)
		_S.write(_v18, "emit", _S.binary("/", _S.invoke(_S.read(_v18, "Math"), "hypot", [_S.binary("-", _S.read(_v18, "x"), _S.read(_v18, "px")), _S.binary("-", _S.read(_v18, "y"), _S.read(_v18, "py"))]), 1.5), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v18, "emit"), 1)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "f", _S.binary("/", _S.binary("-", _S.read(_v19, "emit"), 1), _S.invoke(_S.read(_v19, "Math"), "max", [0.000001, _S.binary("/", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x"), _S.read(_v19, "px")), _S.binary("-", _S.read(_v19, "y"), _S.read(_v19, "py"))]), 1.5)])))
			_S.define(_v19, "ex", _S.binary("+", _S.read(_v19, "x"), _S.binary("*", _S.binary("-", _S.read(_v19, "px"), _S.read(_v19, "x")), _S.read(_v19, "f"))))
			_S.define(_v19, "ey", _S.binary("+", _S.read(_v19, "y"), _S.binary("*", _S.binary("-", _S.read(_v19, "py"), _S.read(_v19, "y")), _S.read(_v19, "f"))))
			_S.invoke(_S.read(_v19, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.binary("-", _S.read(_v19, "ex"), _S.binary("*", _S.read(_v19, "cx"), 7)), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.6), 0.6]))}, {"y": _S.binary("+", _S.binary("-", _S.read(_v19, "ey"), _S.binary("*", _S.read(_v19, "cy"), 7)), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.6), 0.6]))}, {"vx": _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v19, "cx")), _S.invoke(_S.read(_v19, "R"), "range", [10, 30])), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 6), 6]))}, {"vy": _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v19, "cy")), _S.invoke(_S.read(_v19, "R"), "range", [10, 30])), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 6), 6]))}, {"r0": 1.4}, {"r1": _S.invoke(_S.read(_v19, "R"), "range", [3.5, 6])}, {"life": _S.invoke(_S.read(_v19, "R"), "range", [1.5, 2.3])}, {"a": 0.5}, {"b": 0.9}, {"warm": 0.8}, {"rise": 4}, {"drag": 3}, {"grow": 1.2}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "emit", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.35])):
			var _v20 = _S.scope(_v15)
			_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.read(_v20, "h"), _S.prop(_S.read(_v20, "Math"), "PI")), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 140]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.binary("-", _S.read(_v20, "x"), _S.binary("*", _S.read(_v20, "cx"), 7)), _S.binary("-", _S.read(_v20, "y"), _S.binary("*", _S.read(_v20, "cy"), 7)), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.15, 0.35])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
			var _v21 = _S.scope(_e)
			_S.write(_v21, "hit", true, "=", false)
			_S.call_value(_S.read(_v21, "blast"), [])
	for _v22 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _v22)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v23, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v23, "b"), "dusted")))):
			var _v24 = _S.scope(_v23)
			_S.set_prop(_S.read(_v24, "b"), "dusted", true, "=", false)
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "i"), 2)):
				_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v25, "b"), "x"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 1), 1])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v25, "R"), "sign", []), _S.invoke(_S.read(_v25, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [2, 14])), _S.invoke(_S.read(_v25, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v25, "stone"), "dust"), _S.invoke(_S.read(_v25, "R"), "range", [1.2, 2.2])])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.read(_e, "hit")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "k", _S.binary("-", _S.read(_v26, "t"), _S.read(_v26, "FLY")))
		_S.define(_v26, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v26, "smooth"), [_S.binary("-", _S.prop(_S.read(_v26, "meta"), "duration"), 1), _S.binary("-", _S.prop(_S.read(_v26, "meta"), "duration"), 0.2), _S.read(_v26, "t")])))
		_S.define(_v26, "rx", _S.binary("*", 16, _S.invoke(_S.read(_v26, "Math"), "min", [1, _S.binary("/", _S.read(_v26, "k"), 0.06)])))
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "y", 0)
		while _S.truth(_S.binary("<=", _S.read(_v27, "y"), 2)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "x", _S.invoke(_S.read(_v28, "Math"), "floor", [_S.unary("-", _S.read(_v28, "rx"))]))
			while _S.truth(_S.binary("<=", _S.read(_v28, "x"), _S.invoke(_S.read(_v28, "Math"), "ceil", [_S.read(_v28, "rx")]))):
				var _v29 = _S.scope(_v28)
				_S.define(_v29, "d", _S.invoke(_S.read(_v29, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_v29, "x"), 0.5), _S.read(_v29, "rx")), _S.binary("/", _S.binary("+", _S.read(_v29, "y"), 0.5), 4)]))
				if _S.truth(_S.binary(">", _S.read(_v29, "d"), 1)):
					_v28 = _S.iteration(_v28)
					_S.write(_v28, "x", 1, "+=", true)
					continue
				_S.define(_v29, "T", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "pow", [_S.call_value(_S.read(_v29, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v29, "k"), 1.4))]), 1.4]), _S.binary("-", 1.25, _S.read(_v29, "d"))), _S.binary("*", _S.call_value(_S.read(_v29, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v29, "x"), 31), _S.read(_v29, "y")), 3]), 0.35)))
				_S.invoke(_S.read(_v29, "p"), "dot", [_S.read(_v29, "x"), _S.read(_v29, "y"), (_S.prop(_S.read(_v29, "F"), _S.invoke(_S.read(_v29, "Math"), "max", [1, _S.invoke(_S.read(_v29, "Math"), "min", [8, _S.invoke(_S.read(_v29, "Math"), "round", [_S.binary("*", _S.read(_v29, "T"), 8)])])])) if _S.truth(_S.binary(">", _S.read(_v29, "T"), 0.06)) else (_S.call_value(_S.read(_v29, "hex"), ["#0d0a12"]) if _S.truth(_S.binary("<", _S.read(_v29, "d"), 0.5)) else _S.call_value(_S.read(_v29, "hex"), ["#17121d"]))), _S.read(_v29, "fade")])
				_v28 = _S.iteration(_v28)
				_S.write(_v28, "x", 1, "+=", true)
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "y", 1, "+=", true)
		_S.define(_v26, "q", _S.binary("/", _S.read(_v26, "k"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v26, "q"), 1)):
			_S.call_value(_S.read(_v26, "band"), [_S.read(_v26, "p"), 0, 0.5, _S.binary("*", 60, _S.binary("-", 1, _S.invoke(_S.read(_v26, "Math"), "pow", [_S.binary("-", 1, _S.read(_v26, "q")), 3]))), 0.16, _S.invoke(_S.read(_v26, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_v26, "q")))]), _S.binary("-", 1.15, _S.read(_v26, "q")), [_S.prop(_S.read(_v26, "stone"), "body"), _S.prop(_S.read(_v26, "stone"), "light"), _S.prop(_S.read(_v26, "F"), 4), _S.prop(_S.read(_v26, "F"), 7)], _S.function_value(_v26, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "smoke"), "puffs", []))
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.4]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.4}, {"max": 0.82}, {"lit": 1.4}])])
	if _S.truth(_S.read(_e, "hit")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "q", _S.binary("/", _S.binary("-", _S.read(_v30, "t"), _S.read(_v30, "FLY")), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v30, "q"), 1)):
			_S.call_value(_S.read(_v30, "band"), [_S.read(_v30, "p"), 0, 0.5, _S.binary("*", 60, _S.binary("-", 1, _S.invoke(_S.read(_v30, "Math"), "pow", [_S.binary("-", 1, _S.read(_v30, "q")), 3]))), 0.16, _S.invoke(_S.read(_v30, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_v30, "q")))]), _S.binary("-", 1.15, _S.read(_v30, "q")), [_S.prop(_S.read(_v30, "stone"), "body"), _S.prop(_S.read(_v30, "stone"), "light"), _S.prop(_S.read(_v30, "F"), 4), _S.prop(_S.read(_v30, "F"), 7)], _S.function_value(_v30, "_f7")])
	for _v31 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "b", _v31)
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_v33, "b"), "s"), 0.75)))
		_S.define(_v33, "fade", _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v33, "b"), "life"), 0.5)]))
		_S.define(_v33, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.prop(_S.read(_v33, "b"), "a")]), _S.read(_v33, "r")), 0.4))
		_S.define(_v33, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.prop(_S.read(_v33, "b"), "a")]), _S.read(_v33, "r")), 0.4))
		_S.invoke(_S.read(_v33, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v33, "b"), "x"), _S.read(_v33, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v33, "b"), "y"), _S.read(_v33, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v33, "b"), "x"), _S.read(_v33, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v33, "b"), "y"), _S.read(_v33, "r")), 1), _S.function_value(_v33, "_f8")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLY"))):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "u", _S.call_value(_S.read(_v34, "progress"), [_S.read(_v34, "t")]))
		var _v35 = _S.call_value(_S.read(_v34, "at"), [_S.read(_v34, "u")])
		_S.define(_v34, "x", _S.prop(_v35, 0))
		_S.define(_v34, "y", _S.prop(_v35, 1))
		_S.define(_v34, "h", _S.call_value(_S.read(_v34, "heading"), [_S.read(_v34, "u")]))
		_S.define(_v34, "cx", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "h")]))
		_S.define(_v34, "cy", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "h")]))
		_S.define(_v34, "fr", _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("*", _S.read(_v34, "t"), 30)]))
		_S.define(_v34, "J", _S.binary("+", 5, _S.binary("*", 3, _S.call_value(_S.read(_v34, "rand"), [_S.read(_v34, "fr"), 7]))))
		var _v36 = _S.scope(_v34)
		_S.define(_v36, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v36, "d"), _S.read(_v36, "J"))):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "v", _S.binary("/", _S.read(_v37, "d"), _S.read(_v37, "J")))
			_S.define(_v37, "c", (_S.read(_v37, "WHITE") if _S.truth(_S.binary("<", _S.read(_v37, "v"), 0.3)) else (_S.prop(_S.read(_v37, "F"), 6) if _S.truth(_S.binary("<", _S.read(_v37, "v"), 0.6)) else _S.prop(_S.read(_v37, "F"), 4))))
			_S.invoke(_S.read(_v37, "p"), "dot", [_S.binary("-", _S.read(_v37, "x"), _S.binary("*", _S.read(_v37, "cx"), _S.binary("+", 6.5, _S.read(_v37, "d")))), _S.binary("-", _S.read(_v37, "y"), _S.binary("*", _S.read(_v37, "cy"), _S.binary("+", 6.5, _S.read(_v37, "d")))), _S.read(_v37, "c")])
			if _S.truth(_S.binary("<", _S.read(_v37, "v"), 0.5)):
				_S.invoke(_S.read(_v37, "p"), "dot", [_S.binary("-", _S.binary("-", _S.read(_v37, "x"), _S.binary("*", _S.read(_v37, "cx"), _S.binary("+", 6.5, _S.read(_v37, "d")))), _S.binary("*", _S.read(_v37, "cy"), 0.8)), _S.binary("+", _S.binary("-", _S.read(_v37, "y"), _S.binary("*", _S.read(_v37, "cy"), _S.binary("+", 6.5, _S.read(_v37, "d")))), _S.binary("*", _S.read(_v37, "cx"), 0.8)), _S.prop(_S.read(_v37, "F"), 5)])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "d", 0.5, "+=", false)
		_S.call_value(_S.read(_v34, "turnSprite"), [_S.read(_v34, "p"), _S.read(_v34, "MISSILE"), _S.read(_v34, "pal"), _S.read(_v34, "x"), _S.read(_v34, "y"), _S.read(_v34, "h"), 6, 2.5])
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.binary("-", _S.read(_v34, "x"), _S.binary("*", _S.read(_v34, "cx"), 8)), _S.binary("-", _S.read(_v34, "y"), _S.binary("*", _S.read(_v34, "cy"), 8)), 18, _S.prop(_S.read(_v34, "F"), 4), 0.5])
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.binary("-", _S.read(_v34, "x"), _S.binary("*", _S.read(_v34, "cx"), 7)), _S.binary("-", _S.read(_v34, "y"), _S.binary("*", _S.read(_v34, "cy"), 7)), 6, _S.prop(_S.read(_v34, "F"), 7), 0.5])
	_S.define(_e, "k", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLY")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 0.07))):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "r", _S.binary("*", 14, _S.binary("+", 0.8, _S.binary("*", 0.2, _S.binary("-", 1, _S.binary("/", _S.read(_v38, "k"), 0.07))))))
		_S.invoke(_S.read(_v38, "p"), "circle", [0, _S.unary("-", 6), _S.binary("+", _S.read(_v38, "r"), 1.2), _S.prop(_S.read(_v38, "F"), 3)])
		_S.invoke(_S.read(_v38, "p"), "circle", [0, _S.unary("-", 6), _S.read(_v38, "r"), (_S.prop(_S.read(_v38, "F"), 7) if _S.truth(_S.binary("<", _S.read(_v38, "k"), 0.035)) else _S.prop(_S.read(_v38, "F"), 6))])
		_S.invoke(_S.read(_v38, "p"), "circle", [0, _S.unary("-", 6), _S.binary("*", _S.read(_v38, "r"), 0.6), (_S.read(_v38, "WHITE") if _S.truth(_S.binary("<", _S.read(_v38, "k"), 0.035)) else _S.prop(_S.read(_v38, "F"), 7))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 0.3))):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "rr", _S.binary("+", 8, _S.binary("*", 30, _S.binary("-", 1, _S.invoke(_S.read(_v39, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_v39, "k"), 0.3)), 3])))))
		_S.invoke(_S.read(_v39, "p"), "ring", [0, _S.unary("-", 6), _S.read(_v39, "rr"), _S.invoke(_S.read(_v39, "Math"), "max", [1, _S.binary("+", _S.binary("*", 2.5, _S.binary("-", 1, _S.binary("/", _S.read(_v39, "k"), 0.3))), 0.4)]), _S.prop(_S.read(_v39, "F"), 5), _S.function_value(_v39, "_f9")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
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
	_S.set_prop(_S.read(_e, "out"), "c", (_S.call_value(_S.read(_e, "hex"), ["#1a1422"]) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))) else (_S.prop(_S.read(_e, "stone"), "light") if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.4))) else (_S.prop(_S.read(_e, "stone"), "shade") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.6)) else _S.prop(_S.read(_e, "stone"), "body")))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "ang", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.binary("+", _S.unary("-", 6), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "rr"))), 0)) else _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_e, "k"), 0.3)), 1.6)]))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.binary("-", 1, _S.read(_e, "u")))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), _S.read(_e, "v")))
	_S.define(_e, "b", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "v")), _S.read(_e, "v")), _S.read(_e, "u")))
	_S.define(_e, "c", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "v")), _S.read(_e, "u")), _S.read(_e, "u")))
	_S.define(_e, "d", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.read(_e, "u")))
	return [_S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "a"), _S.prop(_S.prop(_S.read(_e, "PATH"), 0), 0)), _S.binary("*", _S.read(_e, "b"), _S.prop(_S.prop(_S.read(_e, "PATH"), 1), 0))), _S.binary("*", _S.read(_e, "c"), _S.prop(_S.prop(_S.read(_e, "PATH"), 2), 0))), _S.binary("*", _S.read(_e, "d"), _S.prop(_S.prop(_S.read(_e, "PATH"), 3), 0))), _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "a"), _S.prop(_S.prop(_S.read(_e, "PATH"), 0), 1)), _S.binary("*", _S.read(_e, "b"), _S.prop(_S.prop(_S.read(_e, "PATH"), 1), 1))), _S.binary("*", _S.read(_e, "c"), _S.prop(_S.prop(_S.read(_e, "PATH"), 2), 1))), _S.binary("*", _S.read(_e, "d"), _S.prop(_S.prop(_S.read(_e, "PATH"), 3), 1)))]

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.binary("-", 1, _S.read(_e, "u")))
	_S.define(_e, "d", _S.function_value(_e, "_f12"))
	return _S.invoke(_S.read(_e, "Math"), "atan2", [_S.call_value(_S.read(_e, "d"), [1]), _S.call_value(_S.read(_e, "d"), [0])])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "v")), _S.read(_e, "v")), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "PATH"), 1), _S.read(_e, "i")), _S.prop(_S.prop(_S.read(_e, "PATH"), 0), _S.read(_e, "i")))), _S.binary("*", _S.binary("*", _S.binary("*", 6, _S.read(_e, "v")), _S.read(_e, "u")), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "PATH"), 2), _S.read(_e, "i")), _S.prop(_S.prop(_S.read(_e, "PATH"), 1), _S.read(_e, "i"))))), _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "u")), _S.read(_e, "u")), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "PATH"), 3), _S.read(_e, "i")), _S.prop(_S.prop(_S.read(_e, "PATH"), 2), _S.read(_e, "i")))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "FLY"))]), 1.45])
