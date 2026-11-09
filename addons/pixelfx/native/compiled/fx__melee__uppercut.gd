@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/uppercut.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Uppercut"}, {"desc": "A crescent rises from the floor past the face, and at the top a comic impact star bursts: bold outline, hot core, burst lines, twinkles and sparks."}, {"tags": ["melee", "uppercut", "punch", "rising", "launcher", "comic", "combat", "directional", "one-shot"]}, {"size": [132, 128]}, {"origin": [48, 110]}, {"duration": 0.85}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a1408", "#7a2a10", "#c4501a", "#f08a2a", "#ffc94a", "#fff2a8", "#ffffff"]}, {"outline": "#2a0a08"}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FISTS", _S.merge([_S.read(_e, "READY"), {"fx": 12}, {"fy": _S.unary("-", 25)}, {"bx": 9}, {"by": _S.unary("-", 27)}, {"crouch": 3}, {"lean": 1}]))
	_S.define(_e, "COIL", _S.merge([_S.read(_e, "FISTS"), {"crouch": 7}, {"lean": 3}, {"fx": 8}, {"fy": _S.unary("-", 11)}, {"bx": 8}, {"by": _S.unary("-", 27)}, {"ffx": 10}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "TOP", _S.merge([_S.read(_e, "FISTS"), {"x": 1}, {"y": _S.unary("-", 11)}, {"crouch": _S.unary("-", 1)}, {"lean": 2}, {"fx": 12}, {"fy": _S.unary("-", 42)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 21)}, {"ffx": 8}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 3)}, {"fby": _S.unary("-", 2)}, {"toeB": true}, {"ghost": 1}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 44}])}, {"poses": [[_S.unary("-", 0.42), _S.read(_e, "FISTS")], [_S.unary("-", 0.16), _S.read(_e, "COIL")], [0, _S.merge([_S.read(_e, "COIL"), {"crouch": 8}])], [0.03, _S.merge([_S.read(_e, "FISTS"), {"y": _S.unary("-", 4)}, {"crouch": 1}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 27)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 23)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}, {"toeB": true}, {"ghost": 1}]), "snap"], [0.076, _S.read(_e, "TOP"), "snap"], [0.3, _S.merge([_S.read(_e, "TOP"), {"y": _S.unary("-", 13)}, {"ghost": null}])], [0.56, _S.merge([_S.read(_e, "TOP"), {"y": 0}, {"crouch": 2}, {"fx": 13}, {"fy": _S.unary("-", 31)}, {"ffx": 7}, {"ffy": _S.unary("-", 6)}, {"fbx": _S.unary("-", 5)}, {"fby": _S.unary("-", 5)}, {"ghost": null}]), "in"], [0.6, _S.merge([_S.read(_e, "FISTS"), {"y": 0}, {"crouch": 7}, {"lean": 3}, {"fx": 12}, {"fy": _S.unary("-", 14)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 16)}, {"ffx": 10}, {"fbx": _S.unary("-", 9)}]), "snap"], [0.98, _S.read(_e, "FISTS")]]}, {"hits": [_S.merge([{"t": 0.076}, {"stop": 0.13}, {"shake": 0.18}, {"amp": 2}, {"push": _S.unary("-", 2.6)}, {"straw": 18}, {"y": _S.unary("-", 34)}])]}, {"dust": [_S.merge([{"t": 0.03}, {"x": 8}, {"n": 6}]), _S.merge([{"t": 0.6}, {"x": 0}, {"n": 6}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "outline")]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 8}, {"cy": _S.unary("-", 25)}, {"R": 27}, {"sy": 1}, {"rot": 0}, {"a0": 1.08}, {"dir": _S.unary("-", 1)}, {"span": 2.5}, {"W": 13}, {"t0": 0.02}, {"sweep": 0.07}, {"hold": 0.05}, {"trail": 0.22}, {"ramp": _S.read(_e, "C")}])]))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "slashEnd"), [_S.read(_e, "A")]))
	_S.define(_e, "SX", _S.binary("+", _S.prop(_S.read(_e, "top"), "x"), 3))
	_S.define(_e, "SY", _S.binary("-", _S.prop(_S.read(_e, "top"), "y"), 5))
	_S.define(_e, "HIT", _S.binary("+", _S.prop(_S.read(_e, "A"), "t0"), _S.binary("*", _S.prop(_S.read(_e, "A"), "sweep"), 0.8)))
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "bursts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "kicked", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 10), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.12), 0.12])), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))}, {"len": _S.binary("+", (7 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 13), _S.invoke(_S.read(_e, "Rg"), "range", [0, 4]))}, {"w": (2.2 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 3)}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 8), _S.read(_e, "TAU")), 0.2), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.15), 0.15]))}, {"r0": _S.invoke(_S.read(_e, "Rg"), "range", [15, 18])}, {"L": _S.invoke(_S.read(_e, "Rg"), "range", [5, 9])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "kicked"))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "kicked", true, "=", false)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 4)):
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "DUST"), _S.binary("+", 18, _S.invoke(_S.read(_v1, "Rg"), "range", [_S.unary("-", 4), 4])), _S.unary("-", 1), _S.invoke(_S.read(_v1, "Rg"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v1, "Rg"), "range", [5, 20])), _S.invoke(_S.read(_v1, "Rg"), "range", [0.3, 0.55]), "#6a6080", _S.invoke(_S.read(_v1, "Rg"), "range", [1.5, 2.6])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "hit", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "SX"), _S.read(_v2, "SY"), 56, _S.prop(_S.read(_v2, "C"), 4), 0.6, 0.4])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "SX"), _S.read(_v2, "SY"), 18, _S.read(_v2, "WHITE"), 0.7, 0.08])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 16)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 2), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 1.6), 1.6])))
			_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "Rg"), "range", [120, 320]))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SPARK"), _S.read(_v4, "SX"), _S.read(_v4, "SY"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.invoke(_S.read(_v4, "Rg"), "range", [0.15, 0.45])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 6)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "Rg"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "d", _S.invoke(_S.read(_v6, "Rg"), "range", [14, 24]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("+", _S.read(_v6, "SX"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("+", _S.read(_v6, "SY"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), 20), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), 20), 10), _S.invoke(_S.read(_v6, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.invoke(_S.read(_v6, "Rg"), "chance", [0.5])) else _S.read(_v6, "WHITE")), _S.invoke(_S.read(_v6, "Rg"), "range", [1.4, 2.6]), _S.invoke(_S.read(_v6, "Rg"), "range", [0.04, 0.18])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "slash"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "t")])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "t0")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.16))):
		for _v7 in _S.array([[_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "A"), "cx"), _S.prop(_S.read(_e, "A"), "R")), 7), _S.unary("-", 16), 18], [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "A"), "cx"), _S.prop(_S.read(_e, "A"), "R")), 11), _S.unary("-", 30), 12], [_S.binary("-", _S.prop(_S.read(_e, "A"), "cx"), 4), _S.unary("-", 40), 10]]):
			var _v8 = _S.scope(_e)
			var _v9 = _v7
			_S.define(_v8, "dx", _S.prop(_v9, 0))
			_S.define(_v8, "y0", _S.prop(_v9, 1))
			_S.define(_v8, "L", _S.prop(_v9, 2))
			var _v10 = _S.scope(_v8)
			_S.define(_v10, "k", _S.binary("/", _S.read(_v10, "u"), 0.16))
			_S.define(_v10, "y", _S.binary("-", _S.read(_v10, "y0"), _S.binary("*", 30, _S.read(_v10, "k"))))
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "d", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "d"), _S.read(_v11, "L"))):
				_S.invoke(_S.read(_v11, "p"), "dot", [_S.read(_v11, "dx"), _S.binary("+", _S.read(_v11, "y"), _S.read(_v11, "d")), (_S.read(_v11, "WHITE") if _S.truth(_S.binary("<", _S.read(_v11, "d"), 3)) else (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v11, "d"), _S.binary("*", _S.read(_v11, "L"), 0.5))) else _S.prop(_S.read(_v11, "C"), 3))), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v11, "d"), _S.read(_v11, "L"))), _S.binary("-", 1, _S.read(_v11, "k")))])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "d", 1, "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), _S.binary("+", _S.prop(_S.read(_e, "A"), "sweep"), 0.06)))):
		var _v12 = _S.scope(_e)
		var _v13 = _S.call_value(_S.read(_v12, "onSwing"), [_S.read(_v12, "A"), _S.binary("-", _S.prop(_S.read(_v12, "A"), "R"), 5), _S.binary("*", _S.prop(_S.read(_v12, "A"), "span"), _S.invoke(_S.read(_v12, "ease"), "outExpo", [_S.call_value(_S.read(_v12, "clamp"), [_S.binary("/", _S.read(_v12, "u"), _S.prop(_S.read(_v12, "A"), "sweep"))])]))])
		_S.define(_v12, "x", _S.prop(_v13, 0))
		_S.define(_v12, "y", _S.prop(_v13, 1))
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "x"), _S.read(_v12, "y"), 34, _S.prop(_S.read(_v12, "C"), 3), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "u"), _S.binary("+", _S.prop(_S.read(_v12, "A"), "sweep"), 0.06))))])
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.36))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "pop", _S.invoke(_S.read(_v14, "ease"), "outBack", [_S.call_value(_S.read(_v14, "clamp"), [_S.binary("/", _S.read(_v14, "q"), 0.05)]), 2.6]))
		_S.define(_v14, "out", _S.binary("-", 1, _S.call_value(_S.read(_v14, "smooth"), [0.16, 0.36, _S.read(_v14, "q")])))
		_S.define(_v14, "sc", _S.binary("*", _S.read(_v14, "pop"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v14, "out")))))
		_S.define(_v14, "turn", _S.binary("*", _S.read(_v14, "q"), 1.2))
		_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "spikes"), "map", [_S.function_value(_v14, "_f6")]))
		if _S.truth(_S.binary(">", _S.read(_v14, "sc"), 0.08)):
			var _v15 = _S.scope(_v14)
			_S.call_value(_S.read(_v15, "star"), [_S.read(_v15, "p"), _S.read(_v15, "SX"), _S.read(_v15, "SY"), _S.read(_v15, "sp"), _S.binary("*", _S.read(_v15, "sc"), 1.12), 1, _S.read(_v15, "INK"), _S.read(_v15, "INK"), _S.read(_v15, "INK"), _S.read(_v15, "INK")])
			_S.call_value(_S.read(_v15, "star"), [_S.read(_v15, "p"), _S.read(_v15, "SX"), _S.read(_v15, "SY"), _S.read(_v15, "sp"), _S.read(_v15, "sc"), 1, (_S.read(_v15, "WHITE") if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.05)) else _S.prop(_S.read(_v15, "C"), 6)), _S.prop(_S.read(_v15, "C"), 4), _S.prop(_S.read(_v15, "C"), 3), _S.prop(_S.read(_v15, "C"), 2)])
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "SX"), _S.read(_v14, "SY"), 30, _S.prop(_S.read(_v14, "C"), 4), _S.binary("*", 0.45, _S.read(_v14, "out"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.02), func(): return _S.binary("<", _S.read(_e, "q"), 0.24))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "k", _S.binary("/", _S.binary("-", _S.read(_v16, "q"), 0.02), 0.22))
		_S.define(_v16, "r", _S.binary("+", 7, _S.binary("*", 17, _S.invoke(_S.read(_v16, "ease"), "outCubic", [_S.read(_v16, "k")]))))
		_S.define(_v16, "th", _S.invoke(_S.read(_v16, "Math"), "max", [1, _S.binary("*", 2.2, _S.binary("-", 1, _S.read(_v16, "k")))]))
		_S.define(_v16, "col", (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.25)) else (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.5)) else (_S.prop(_S.read(_v16, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.75)) else _S.prop(_S.read(_v16, "C"), 3)))))
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "a"), _S.read(_v17, "TAU"))):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "o", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "o"), _S.read(_v18, "th"))):
				_S.invoke(_S.read(_v18, "p"), "dot", [_S.binary("+", _S.read(_v18, "SX"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.binary("-", _S.read(_v18, "r"), _S.read(_v18, "o")))), _S.binary("+", _S.read(_v18, "SY"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.binary("-", _S.read(_v18, "r"), _S.read(_v18, "o")))), _S.read(_v18, "col"), _S.binary("-", 1.15, _S.read(_v18, "k"))])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "o", 0.5, "+=", false)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "a", _S.binary("/", 0.6, _S.read(_v17, "r")), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.02), func(): return _S.binary("<", _S.read(_e, "q"), 0.2))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "k", _S.binary("/", _S.binary("-", _S.read(_v19, "q"), 0.02), 0.18))
		for _v20 in _S.array(_S.read(_v19, "bursts")):
			var _v21 = _S.scope(_v19)
			_S.define(_v21, "b", _v20)
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "r0", _S.binary("+", _S.prop(_S.read(_v22, "b"), "r0"), _S.binary("*", 10, _S.invoke(_S.read(_v22, "ease"), "outCubic", [_S.read(_v22, "k")]))))
			_S.define(_v22, "ca", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.prop(_S.read(_v22, "b"), "a")]))
			_S.define(_v22, "sa", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.prop(_S.read(_v22, "b"), "a")]))
			_S.invoke(_S.read(_v22, "p"), "line", [_S.binary("+", _S.read(_v22, "SX"), _S.binary("*", _S.read(_v22, "ca"), _S.read(_v22, "r0"))), _S.binary("+", _S.read(_v22, "SY"), _S.binary("*", _S.read(_v22, "sa"), _S.read(_v22, "r0"))), _S.binary("+", _S.read(_v22, "SX"), _S.binary("*", _S.read(_v22, "ca"), _S.binary("+", _S.read(_v22, "r0"), _S.binary("*", _S.prop(_S.read(_v22, "b"), "L"), _S.binary("-", 1, _S.read(_v22, "k")))))), _S.binary("+", _S.read(_v22, "SY"), _S.binary("*", _S.read(_v22, "sa"), _S.binary("+", _S.read(_v22, "r0"), _S.binary("*", _S.prop(_S.read(_v22, "b"), "L"), _S.binary("-", 1, _S.read(_v22, "k")))))), (_S.read(_v22, "WHITE") if _S.truth(_S.binary("<", _S.read(_v22, "k"), 0.4)) else _S.prop(_S.read(_v22, "C"), 5)), _S.binary("-", 1.1, _S.read(_v22, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "s"), {"a": _S.binary("+", _S.prop(_S.read(_e, "s"), "a"), _S.read(_e, "turn"))}])
