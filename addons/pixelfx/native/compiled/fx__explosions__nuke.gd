@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/nuke.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "fireRamp", _S.import_value("fx/explosions/_lib.js", "fireRamp"))
	_S.define(_e, "drawPs", _S.import_value("fx/explosions/_lib.js", "drawPs"))
	_S.define(_e, "draft", _S.import_value("fx/explosions/_lib.js", "draft"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "haze", _S.import_value("fx/explosions/_lib.js", "haze"))
	_S.define(_e, "glowDome", _S.import_value("fx/explosions/_lib.js", "glowDome"))
	_S.define(_e, "Plume", _S.import_value("fx/explosions/_lib.js", "Plume"))
	_S.define(_e, "Column", _S.import_value("fx/explosions/_lib.js", "Column"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "wash", _S.function_value(_e, "_f16"))
	_S.define(_e, "skirtDraw", _S.function_value(_e, "_f18"))
	_S.define(_e, "meta", _S.merge([{"name": "Nuke"}, {"desc": "A blinding white frame, then a fireball lifts on a thin stem into a wide rolling cap that glows from inside; a white skirt flashes and a dust surge sweeps the floor."}, {"tags": ["explosion", "nuke", "mushroom", "cloud", "big", "ground", "one-shot"]}, {"size": [400, 320]}, {"origin": [200, 284]}, {"duration": 9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"dust": "#8a7466"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FLASH", 0.05)
	_S.define(_e, "LIFT", 0.07)
	_S.define(_e, "SKIRT", [0.55, 1.75])
	_S.define(_e, "CAP", _S.invoke(["#a0918c", "#7c6f6e", "#5f5458", "#40373f", "#271f27"], "map", [_S.read(_e, "hex")]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "FR", _S.call_value(_S.read(_e, "fireRamp"), [_S.read(_e, "F")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "dust", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "dust")]))
	_S.define(_e, "DUST", [_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.read(_e, "WHITE"), 0.22]), _S.read(_e, "dust"), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#3a3040"]), 0.35]), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#2a2330"]), 0.6]), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#1c1720"]), 0.8])])
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	_S.define(_e, "X0", _S.binary("+", _S.unary("-", _S.read(_e, "OX")), 3))
	_S.define(_e, "X1", _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 3))
	_S.define(_e, "Y0", _S.binary("+", _S.unary("-", _S.read(_e, "OY")), 3))
	_S.define(_e, "Y1", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 3))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "plume", _S.construct(_S.read(_e, "Plume"), [_S.read(_e, "R"), _S.merge([{"x": 0}, {"y": _S.unary("-", 26)}, {"rise": 152}, {"tau": 1.7}, {"drift": 3}, {"tube": [14, 26]}, {"ring": [4, 46]}, {"grow": 1.6}, {"n": 50}, {"size": [9.5, 14.5]}, {"swell": 0.45}, {"spin": 2.4}, {"spinTau": 2.4}, {"heat": 1.25}, {"cool": 0.42}, {"under": 0.6}, {"tilt": 0.16}, {"squash": 0.48}, {"fade": [6, 8.3]}, {"spread": 26}, {"style": 1}, {"inner": true}, {"hollow": true}, {"fray": [4, 1.6, 6.4]}])]))
	_S.set_prop(_S.read(_e, "plume"), "onFray", _S.function_value(_e, "_f2"), "=", false)
	_S.define(_e, "column", _S.construct(_S.read(_e, "Column"), [_S.read(_e, "R"), _S.merge([{"w": 3.5}, {"foot": 22}, {"speed": 125}, {"size": [5.5, 7]}, {"n": 84}, {"sway": 1.4}, {"style": 1}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f3"))
	_S.define(_e, "veil", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 72}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "skirt", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 110}]), _S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "boomed", false)
	_S.define(_e, "boom", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "ux", _S.arg(_args, 3))
	_S.define(_e, "uy", _S.arg(_args, 4))
	return _S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "ux"), _S.invoke(_S.read(_e, "R"), "range", [10, 26])), _S.binary("-", _S.binary("*", _S.read(_e, "uy"), _S.invoke(_S.read(_e, "R"), "range", [4, 12])), _S.invoke(_S.read(_e, "R"), "range", [2, 8])), _S.invoke(_S.read(_e, "R"), "range", [1, 1.7]), _S.prop(_S.read(_e, "CAP"), _S.invoke(_S.read(_e, "R"), "int", [0, 1])), _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.45]))])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	return _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.3))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), _S.binary("/", _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.8])), 72))}, {"s": _S.invoke(_S.read(_e, "R"), "range", [6, 10])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [0.97, 1.06])}, {"e": _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.3])}, {"dx": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"dy": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 0.2])}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"v": _S.invoke(_S.read(_e, "R"), "range", [0, 1])}, {"s": _S.invoke(_S.read(_e, "R"), "range", [5, 9])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.06])}, {"e": _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.3])}, {"dx": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"dy": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 0.4])}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 60), 150, _S.prop(_S.read(_e, "F"), 4), 0.7, 1.6])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 26)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v3, "Math"), "PI")), 0]))
		_S.define(_v3, "d", _S.invoke(_S.read(_v3, "R"), "range", [4, 22]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [40, 160]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "d")), _S.binary("+", _S.unary("-", 26), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "d"))), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 0.7), 30), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 1.1]), 0, _S.invoke(_S.read(_v3, "R"), "range", [7, 12]), 0, (_S.binary("|", _S.prop(_S.read(_v3, "PF"), "SMOKES"), _S.prop(_S.read(_v3, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.5])) else 0)])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 90)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v5, "Math"), "PI")), 0.3), 0.3]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [200, 420]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), 18), _S.binary("+", _S.unary("-", 26), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), 18)), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 60), _S.invoke(_S.read(_v5, "R"), "range", [0.3, 0.8])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 50)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 0]))
		_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 140]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 20), _S.binary("+", _S.unary("-", 26), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), 20)), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 60), _S.invoke(_S.read(_v7, "R"), "range", [1.6, 3.4]), _S.prop(_S.read(_v7, "F"), 3)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 120)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "slow", _S.binary(">=", _S.read(_v9, "i"), 92))
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
		_S.define(_v9, "c", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]))
		_S.define(_v9, "s", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]))
		_S.define(_v9, "sp", (_S.invoke(_S.read(_v9, "R"), "range", [110, 200]) if _S.truth(_S.read(_v9, "slow")) else _S.invoke(_S.read(_v9, "R"), "range", [240, 440])))
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SMOKE"), _S.binary("*", _S.read(_v9, "c"), 14), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v9, "s"), 14), 0.16), _S.invoke(_S.read(_v9, "R"), "range", [1, 3])), _S.binary("*", _S.read(_v9, "c"), _S.read(_v9, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v9, "s"), _S.read(_v9, "sp")), (0.06 if _S.truth(_S.binary(">", _S.read(_v9, "s"), 0)) else 0.14)), _S.invoke(_S.read(_v9, "R"), "range", [0, (6 if _S.truth(_S.read(_v9, "slow")) else 3)])), _S.invoke(_S.read(_v9, "R"), "range", [1.8, 3]), _S.read(_v9, "dust"), (_S.invoke(_S.read(_v9, "R"), "range", [8, 11]) if _S.truth(_S.read(_v9, "slow")) else _S.invoke(_S.read(_v9, "R"), "range", [5, 9])), _S.invoke(_S.read(_v9, "R"), "range", [0.05, 0.2])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 40)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "u", _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v11, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v11, "Math"), "PI")), 2), _S.binary("*", _S.read(_v11, "u"), 0.7)))
		_S.define(_v11, "sp", _S.binary("*", _S.invoke(_S.read(_v11, "R"), "range", [150, 380]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "u")])))))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "GRIT"), _S.binary("*", _S.read(_v11, "u"), 12), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.invoke(_S.read(_v11, "R"), "range", [1.2, 2]), _S.invoke(_S.read(_v11, "R"), "pick", [_S.invoke(_S.read(_v11, "DUST"), "slice", [0, 3])]), (2 if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.4])) else 1)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "boomed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT")))):
		_S.last([_S.write(_e, "boomed", true, "=", false), _S.call_value(_S.read(_e, "boom"), [])])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT"))):
		_S.invoke(_S.read(_e, "plume"), "update", [_S.read(_e, "dt")])
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "plume"), "hot", []))
	_S.invoke(_S.read(_e, "column"), "update", [_S.read(_e, "dt"), _S.call_value(_S.read(_e, "top"), []), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.35), func(): return _S.binary("<", _S.read(_e, "t"), 4.9))) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.9), func(): return _S.binary("<", _S.read(_e, "t"), 4.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 9, _S.read(_e, "dt"))]))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "s", _S.invoke(_S.read(_v12, "R"), "sign", []))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "VAPOUR"), _S.binary("*", _S.read(_v12, "s"), _S.invoke(_S.read(_v12, "R"), "range", [50, 160])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [2, 6])), _S.binary("*", _S.unary("-", _S.read(_v12, "s")), _S.invoke(_S.read(_v12, "R"), "range", [20, 45])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [0, 6])), _S.invoke(_S.read(_v12, "R"), "range", [1.2, 1.8]), _S.prop(_S.read(_v12, "DUST"), 1), _S.invoke(_S.read(_v12, "R"), "range", [5, 8])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 3.4)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 14, _S.read(_e, "hot")), _S.read(_e, "dt"))]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v13, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.binary("+", _S.prop(_S.read(_v13, "S"), "ring"), _S.prop(_S.read(_v13, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_v13, "S"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.prop(_S.read(_v13, "S"), "tube")), 0.5)), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.invoke(_S.read(_v13, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [10, 50])), _S.invoke(_S.read(_v13, "R"), "range", [1.4, 2.6]), _S.prop(_S.read(_v13, "F"), 3)])
	_S.call_value(_S.read(_e, "draft"), [_S.read(_e, "ps"), _S.read(_e, "dt"), _S.merge([{"x": 0}, {"top": _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.3))}, {"w": 9}, {"up": 160}, {"pull": 120}, {"low": 14}, {"reach": 170}, {"k": _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [4.4, 5.4, _S.read(_e, "t")]))}])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 34, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		return null
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), 0.8))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 196, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "DUST"), 2), _S.prop(_S.read(_e, "DUST"), 0), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.function_value(_e, "_f9")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "back", _S.read(_e, "FR")])
	_S.call_value(_S.read(_e, "skirtDraw"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "veil"), _S.read(_e, "skirt"), true])
	_S.invoke(_S.read(_e, "plume"), "draw", [_S.read(_e, "p"), _S.read(_e, "FR"), _S.read(_e, "CAP")])
	_S.define(_e, "E", _S.invoke(_S.read(_e, "plume"), "ember", []))
	_S.define(_e, "gone", _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.prop(_S.prop(_S.read(_e, "plume"), "o"), "fade"), 0), _S.binary("-", _S.prop(_S.prop(_S.prop(_S.read(_e, "plume"), "o"), "fade"), 1), 0.6), _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "gone"), 1)):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "hy", _S.binary("+", _S.prop(_S.read(_v14, "S"), "y"), _S.binary("*", _S.prop(_S.read(_v14, "S"), "tube"), 0.42)))
		_S.define(_v14, "rx", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v14, "S"), "ring"), 0.7), 5))
		_S.define(_v14, "ry", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v14, "S"), "tube"), 0.28), 2))
		_S.call_value(_S.read(_v14, "haze"), [_S.read(_v14, "p"), 0, _S.read(_v14, "hy"), _S.read(_v14, "rx"), _S.read(_v14, "ry"), _S.function_value(_v14, "_f10"), _S.function_value(_v14, "_f11")])
	_S.invoke(_S.read(_e, "column"), "draw", [_S.read(_e, "p"), _S.call_value(_S.read(_e, "top"), []), _S.read(_e, "FR"), _S.read(_e, "DUST"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 1.8))]), _S.binary("*", _S.read(_e, "E"), 0.8)])
	_S.call_value(_S.read(_e, "skirtDraw"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "veil"), _S.read(_e, "skirt"), false])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0, 1, 140, 16, _S.prop(_S.read(_e, "F"), 3), _S.binary("*", 0.3, _S.invoke(_S.read(_e, "plume"), "hot", []))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "CAP"), 4), _S.prop(_S.read(_e, "FR"), (5 if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("*", 0.3, _S.read(_e, "E")))) else 6)), _S.binary("*", 0.75, _S.read(_e, "E"))]) if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("*", 0.55, _S.read(_e, "E")))) else _S.prop(_S.read(_e, "CAP"), 4))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", (0.8 if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else (0.5 if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.85)) else 0.22)), _S.binary("-", 1, _S.read(_e, "gone")))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		var _v15 = _S.scope(_e)
		_S.call_value(_S.read(_v15, "wash"), [_S.read(_v15, "p"), _S.read(_v15, "OX"), _S.read(_v15, "OY"), _S.read(_v15, "W"), _S.read(_v15, "H"), 0, _S.unary("-", 40), _S.read(_v15, "WHITE"), 1.6])
		return _S.invoke(_S.read(_v15, "p"), "circle", [0, _S.unary("-", 40), 64, _S.read(_v15, "WHITE")])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), 0.8))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 196, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "DUST"), 2), _S.prop(_S.read(_e, "DUST"), 0), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.function_value(_e, "_f13")])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.13))
	if _S.truth(_S.binary("<", _S.read(_e, "f"), 1)):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "r", _S.binary("+", 22, _S.binary("*", 8, _S.read(_v16, "f"))))
		_S.invoke(_S.read(_v16, "p"), "circle", [0, _S.unary("-", 26), _S.binary("+", _S.read(_v16, "r"), 1.5), _S.prop(_S.read(_v16, "F"), 2)])
		_S.invoke(_S.read(_v16, "p"), "circle", [0, _S.unary("-", 26), _S.read(_v16, "r"), (_S.prop(_S.read(_v16, "F"), 6) if _S.truth(_S.binary("<", _S.read(_v16, "f"), 0.5)) else _S.prop(_S.read(_v16, "F"), 5))])
		_S.invoke(_S.read(_v16, "p"), "circle", [0, _S.unary("-", 26), _S.binary("*", _S.read(_v16, "r"), 0.62), (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "f"), 0.5)) else _S.prop(_S.read(_v16, "F"), 6))])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "front", _S.read(_e, "FR")])
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.7))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 1)):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "r", _S.binary("+", 30, _S.binary("*", 250, _S.invoke(_S.read(_v17, "ease"), "outCubic", [_S.read(_v17, "u")]))))
		_S.define(_v17, "cy", _S.unary("-", 26))
		_S.define(_v17, "out", _S.function_value(_v17, "_f14"))
		_S.invoke(_S.read(_v17, "p"), "ring", [0, _S.read(_v17, "cy"), _S.read(_v17, "r"), _S.invoke(_S.read(_v17, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_v17, "u")))]), (_S.read(_v17, "WHITE") if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.3)) else _S.prop(_S.read(_v17, "F"), 6)), _S.function_value(_v17, "_f15")])
		_S.call_value(_S.read(_v17, "glowDome"), [_S.read(_v17, "p"), 0, _S.read(_v17, "cy"), _S.read(_v17, "r"), 7, _S.prop(_S.read(_v17, "F"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v17, "u"))), [_S.binary("-", 3, _S.read(_v17, "OX")), _S.binary("-", 3, _S.read(_v17, "OY")), _S.binary("-", _S.binary("-", _S.read(_v17, "W"), _S.read(_v17, "OX")), 4), 0]])
	_S.define(_e, "w", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH"))), 0.13)]))
	if _S.truth(_S.binary(">", _S.read(_e, "w"), 0.02)):
		_S.call_value(_S.read(_e, "wash"), [_S.read(_e, "p"), _S.read(_e, "OX"), _S.read(_e, "OY"), _S.read(_e, "W"), _S.read(_e, "H"), 0, _S.unary("-", 40), _S.read(_e, "WHITE"), _S.binary("*", 0.9, _S.read(_e, "w"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.logical("||", _S.logical("||", _S.binary(">", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "r"))), 0), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "r"))]), _S.binary("-", _S.read(_e, "OX"), 3))), func(): return _S.binary("<", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "r"))), _S.binary("-", 3, _S.read(_e, "OY"))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (0 if _S.truth(_S.call_value(_S.read(_e, "out"), [_S.read(_e, "a")])) else _S.binary("-", 1.1, _S.read(_e, "u")))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "OX", _S.arg(_args, 1))
	_S.define(_e, "OY", _S.arg(_args, 2))
	_S.define(_e, "W", _S.arg(_args, 3))
	_S.define(_e, "H", _S.arg(_args, 4))
	_S.define(_e, "cx", _S.arg(_args, 5))
	_S.define(_e, "cy", _S.arg(_args, 6))
	_S.define(_e, "c", _S.arg(_args, 7))
	_S.define(_e, "k", _S.arg(_args, 8))
	_S.define(_e, "rx", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("+", _S.read(_e, "OX"), _S.read(_e, "cx")), _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), _S.read(_e, "cx"))]), 4))
	_S.define(_e, "up", _S.binary("-", _S.binary("+", _S.read(_e, "OY"), _S.read(_e, "cy")), 4))
	_S.define(_e, "down", _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), _S.read(_e, "cy")), 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "OX")), _S.unary("-", _S.read(_e, "OY")), _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 1), _S.function_value(_e, "_f17")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "rx")), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), (_S.read(_e, "up") if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.read(_e, "cy"))) else _S.read(_e, "down")))]))
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.read(_e, "k"), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0, 1, _S.read(_e, "d")]))), "=", false)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "veil", _S.arg(_args, 3))
	_S.define(_e, "skirt", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "SKIRT"), 0)), _S.binary("-", _S.prop(_S.read(_e, "SKIRT"), 1), _S.prop(_S.read(_e, "SKIRT"), 0))))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "u"), 0), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "u"), 0.06)]), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 1.5])), 0.6))
	_S.define(_e, "capR", _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "S"), "ring"), _S.prop(_S.read(_e, "S"), "tube")), 1.1))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.3)))
	_S.define(_e, "y1", _S.binary("*", _S.prop(_S.read(_e, "S"), "y"), 0.55))
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		var _v18 = _S.scope(_e)
		for _v19 in _S.array(_S.read(_v18, "veil")):
			var _v20 = _S.scope(_v18)
			_S.define(_v20, "q", _v19)
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "ev", _S.binary("*", _S.binary("*", _S.read(_v21, "u"), _S.read(_v21, "u")), _S.prop(_S.read(_v21, "q"), "e")))
			_S.define(_v21, "R", _S.binary("*", _S.binary("*", _S.read(_v21, "capR"), _S.prop(_S.read(_v21, "q"), "w")), _S.binary("+", 1, _S.binary("*", _S.read(_v21, "ev"), 0.2))))
			_S.invoke(_S.read(_v21, "p"), "disc", [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.prop(_S.read(_v21, "q"), "a")]), _S.read(_v21, "R")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v21, "q"), "dx"), _S.read(_v21, "ev")), 10)), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v21, "S"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.prop(_S.read(_v21, "q"), "a")]), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v21, "S"), "tube"), 1.15), 6)), _S.prop(_S.read(_v21, "q"), "w"))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v21, "q"), "dy"), _S.read(_v21, "ev")), 8)), _S.binary("*", _S.prop(_S.read(_v21, "q"), "s"), _S.binary("-", 1, _S.binary("*", 0.5, _S.read(_v21, "u")))), _S.read(_v21, "WHITE"), _S.binary("*", _S.read(_v21, "a"), 0.38)])
	for _v22 in _S.array(_S.read(_e, "skirt")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "q", _v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "z", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.prop(_S.read(_v24, "q"), "ph")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v24, "z"), 0), _S.read(_v24, "back"))):
			continue
		_S.define(_v24, "R", _S.binary("*", _S.call_value(_S.read(_v24, "lerp"), [_S.binary("*", _S.read(_v24, "capR"), 0.82), 13, _S.invoke(_S.read(_v24, "Math"), "pow", [_S.prop(_S.read(_v24, "q"), "v"), 0.6])]), _S.prop(_S.read(_v24, "q"), "w")))
		_S.define(_v24, "ev", _S.binary("*", _S.binary("*", _S.read(_v24, "u"), _S.read(_v24, "u")), _S.prop(_S.read(_v24, "q"), "e")))
		_S.define(_v24, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.prop(_S.read(_v24, "q"), "ph")]), _S.read(_v24, "R")), _S.binary("+", 1, _S.binary("*", _S.read(_v24, "ev"), 0.25))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v24, "q"), "dx"), _S.read(_v24, "ev")), 10)))
		_S.define(_v24, "y", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_v24, "lerp"), [_S.read(_v24, "y0"), _S.read(_v24, "y1"), _S.prop(_S.read(_v24, "q"), "v")]), _S.binary("*", _S.binary("*", _S.read(_v24, "z"), _S.read(_v24, "R")), 0.18)), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v24, "q"), "dy"), _S.read(_v24, "ev")), 8)))
		_S.invoke(_S.read(_v24, "p"), "disc", [_S.read(_v24, "x"), _S.read(_v24, "y"), _S.binary("*", _S.prop(_S.read(_v24, "q"), "s"), _S.binary("-", 1, _S.binary("*", 0.55, _S.read(_v24, "u")))), _S.read(_v24, "WHITE"), _S.binary("*", _S.binary("*", _S.read(_v24, "a"), (0.3 if _S.truth(_S.read(_v24, "back")) else 0.55)), _S.binary("-", 1, _S.binary("*", _S.prop(_S.read(_v24, "q"), "v"), 0.3)))])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "R", _S.binary("*", 13, 1.25))
		_S.define(_v25, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v25, "u"), 0.7)))
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 64)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "g", _S.binary("*", _S.binary("/", _S.read(_v27, "i"), 64), _S.read(_v27, "TAU")))
			_S.define(_v27, "z", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "g")]))
			if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v27, "z"), 0), _S.read(_v27, "back"))):
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v27, "p"), "dot", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "g")]), _S.read(_v27, "R")), _S.binary("+", 1, _S.binary("*", _S.read(_v27, "u"), 0.6))), _S.binary("+", _S.binary("+", _S.read(_v27, "y1"), 2), _S.binary("*", _S.binary("*", _S.read(_v27, "z"), _S.read(_v27, "R")), 0.22)), _S.read(_v27, "WHITE"), _S.binary("*", _S.read(_v27, "k"), (0.6 if _S.truth(_S.read(_v27, "back")) else 1))])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	return null
