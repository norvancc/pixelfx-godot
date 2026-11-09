@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/dagger-flurry.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "shavings", _S.import_value("fx/melee/_lib.js", "shavings"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Dagger flurry"}, {"desc": "A flurry of small quick crescents at every angle in front of the fighter, each with a flick of sparks, finished by one big cut that glints and bursts."}, {"tags": ["melee", "slash", "dagger", "combo", "flurry", "fast", "combat", "directional", "one-shot"]}, {"size": [148, 104]}, {"origin": [36, 86]}, {"duration": 0.95}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1b1630", "#3a2f63", "#6150a3", "#9480d8", "#c7b8f5", "#efe9ff", "#ffffff"]}, {"sparks": ["#ffffff", "#efe9ff", "#c7b8f5", "#9480d8"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BASE", _S.merge([_S.read(_e, "READY"), {"weapon": "dagger"}, {"offWeapon": "dagger"}, {"sa": _S.unary("-", 0.5)}, {"sb": _S.unary("-", 0.9)}, {"crouch": 4}, {"lean": 3}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}, {"fx": 12}, {"fy": _S.unary("-", 24)}, {"bx": 9}, {"by": _S.unary("-", 24)}]))
	_S.define(_e, "near", _S.function_value(_e, "_f9"))
	_S.define(_e, "far", _S.function_value(_e, "_f10"))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 60}])}, {"poses": [[_S.unary("-", 0.4), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 4)}])], [_S.unary("-", 0.14), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 6)}, {"lean": _S.unary("-", 2)}, {"crouch": 5}, {"fx": 2}, {"fy": _S.unary("-", 22)}, {"sa": _S.unary("-", 1.2)}, {"bx": 2}, {"by": _S.unary("-", 26)}, {"sb": _S.unary("-", 1.5)}])], [_S.unary("-", 0.03), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 6)}, {"lean": _S.unary("-", 3)}, {"crouch": 6}, {"fx": 1}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 1.2)}, {"bx": 1}, {"by": _S.unary("-", 25)}, {"sb": _S.unary("-", 1.5)}])], [0, _S.call_value(_S.read(_e, "near"), [20, _S.unary("-", 31), _S.unary("-", 0.5), _S.merge([{"x": 2}, {"ghost": 1}])]), "snap"], [0.055, _S.call_value(_S.read(_e, "far"), [21, _S.unary("-", 23), 0.5, _S.merge([{"x": 3}])]), "snap"], [0.11, _S.call_value(_S.read(_e, "near"), [18, _S.unary("-", 36), _S.unary("-", 1), _S.merge([{"x": 4}])]), "snap"], [0.165, _S.call_value(_S.read(_e, "far"), [22, _S.unary("-", 31), _S.unary("-", 0.6), _S.merge([{"x": 5}])]), "snap"], [0.22, _S.call_value(_S.read(_e, "near"), [20, _S.unary("-", 22), 0.2, _S.merge([{"x": 5}])]), "snap"], [0.275, _S.call_value(_S.read(_e, "far"), [21, _S.unary("-", 27), 0.05, _S.merge([{"x": 6}])]), "snap"], [0.33, _S.merge([_S.read(_e, "BASE"), {"x": 4}, {"lean": _S.unary("-", 3)}, {"crouch": 5}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 33)}, {"sa": _S.unary("-", 2.5)}, {"bx": 2}, {"by": _S.unary("-", 23)}, {"sb": _S.unary("-", 1.2)}]), "snap"], [0.37, _S.merge([_S.read(_e, "BASE"), {"x": 7}, {"lean": 2}, {"crouch": 4}, {"fx": 16}, {"fy": _S.unary("-", 34)}, {"sa": _S.unary("-", 1)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.4)}, {"ghost": 1}]), "snap"], [0.43, _S.merge([_S.read(_e, "BASE"), {"x": 9}, {"lean": 6}, {"crouch": 6}, {"fx": 22}, {"fy": _S.unary("-", 23)}, {"sa": 0.15}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.6)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]), "snap"], [0.68, _S.merge([_S.read(_e, "BASE"), {"x": 9}, {"lean": 5}, {"crouch": 5}, {"fx": 21}, {"fy": _S.unary("-", 22)}, {"sa": 0.2}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.6)}])], [1.05, _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 4)}])]]}, {"hits": [_S.merge([{"t": 0.05}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.105}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.16}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.215}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.27}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.325}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.42}, {"stop": 0.12}, {"shake": 0.18}, {"amp": 2}, {"push": 2.6}, {"straw": 16}])]}, {"dust": [_S.merge([{"t": 0.43}, {"x": 20}, {"n": 7}, {"dir": 1}]), _S.merge([{"t": 0}, {"x": _S.unary("-", 6)}, {"n": 3}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "EVERY", 0.055)
	_S.define(_e, "CUTS", [[21, _S.unary("-", 27), _S.unary("-", 0.5), 1], [33, _S.unary("-", 16), 0.9, _S.unary("-", 1)], [26, _S.unary("-", 38), 2.4, 1], [37, _S.unary("-", 30), _S.unary("-", 1.8), _S.unary("-", 1)], [19, _S.unary("-", 17), 0.2, 1], [30, _S.unary("-", 24), 1.4, _S.unary("-", 1)]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "small", _S.invoke(_S.read(_e, "CUTS"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "big", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 24}, {"cy": _S.unary("-", 26)}, {"R": 30}, {"sy": 0.36}, {"k": 0.24}, {"rot": 0.12}, {"a0": 3}, {"dir": _S.unary("-", 1)}, {"span": 2.85}, {"W": 11}, {"t0": _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "small"), "length"), _S.read(_e, "EVERY")), 0.04)}, {"sweep": 0.055}, {"hold": 0.06}, {"trail": 0.24}, {"ramp": _S.read(_e, "C")}])]))
	_S.define(_e, "all", _S.concat([_S.array(_S.read(_e, "small")), [_S.read(_e, "big")]]))
	_S.define(_e, "ends", _S.invoke(_S.read(_e, "all"), "map", [_S.read(_e, "slashEnd")]))
	_S.define(_e, "done", _S.invoke(_S.read(_e, "all"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "slivers", _S.invoke([_S.unary("-", 2.6), _S.unary("-", 1.5), _S.unary("-", 0.4), 0.7], "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "rot", _S.prop(_v0, 2))
	_S.define(_e, "dir", _S.prop(_v0, 3))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": _S.read(_e, "x")}, {"cy": _S.read(_e, "y")}, {"R": _S.invoke(_S.read(_e, "Rg"), "range", [12, 15])}, {"sy": _S.invoke(_S.read(_e, "Rg"), "range", [0.55, 0.75])}, {"rot": _S.read(_e, "rot")}, {"a0": _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 2.8), _S.unary("-", 2.2)])}, {"dir": _S.read(_e, "dir")}, {"span": _S.invoke(_S.read(_e, "Rg"), "range", [2.3, 2.8])}, {"W": _S.invoke(_S.read(_e, "Rg"), "range", [5.2, 6.4])}, {"t0": _S.binary("*", _S.read(_e, "i"), _S.read(_e, "EVERY"))}, {"sweep": 0.035}, {"hold": 0.03}, {"trail": 0.13}, {"ramp": _S.read(_e, "C")}])])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return false

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.merge([{"a": _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.2), 0.2]))}, {"r": _S.invoke(_S.read(_e, "Rg"), "range", [4, 7])}, {"v": _S.invoke(_S.read(_e, "Rg"), "range", [70, 110])}, {"arc": _S.invoke(_S.read(_e, "Rg"), "range", [0.4, 0.7])}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "all"), "forEach", [_S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.prop(_S.read(_e, "done"), _S.read(_e, "i")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.read(_e, "s"), "t0"), _S.prop(_S.read(_e, "s"), "sweep"))))):
		return null
	_S.set_prop(_S.read(_e, "done"), _S.read(_e, "i"), true, "=", false)
	_S.define(_e, "e", _S.prop(_S.read(_e, "ends"), _S.read(_e, "i")))
	_S.define(_e, "last", _S.binary("===", _S.read(_e, "s"), _S.read(_e, "big")))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.read(_e, "e"), "x"), _S.prop(_S.read(_e, "e"), "y"), (56 if _S.truth(_S.read(_e, "last")) else 26), _S.prop(_S.read(_e, "C"), 3), (0.6 if _S.truth(_S.read(_e, "last")) else 0.4), (0.4 if _S.truth(_S.read(_e, "last")) else 0.14)])
	if _S.truth(_S.read(_e, "last")):
		_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.read(_e, "e"), "x"), _S.prop(_S.read(_e, "e"), "y"), 16, _S.read(_e, "WHITE"), 0.7, 0.08])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), (12 if _S.truth(_S.read(_v1, "last")) else 3))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", _S.binary("+", _S.invoke(_S.read(_v2, "Math"), "atan2", [_S.prop(_S.read(_v2, "e"), "dy"), _S.prop(_S.read(_v2, "e"), "dx")]), _S.invoke(_S.read(_v2, "Rg"), "range", [_S.unary("-", 0.5), 0.5])))
		_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "Rg"), "range", [100, (340 if _S.truth(_S.read(_v2, "last")) else 220)]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.prop(_S.read(_v2, "e"), "x"), _S.prop(_S.read(_v2, "e"), "y"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.invoke(_S.read(_v2, "Rg"), "range", [0.1, (0.35 if _S.truth(_S.read(_v2, "last")) else 0.22)])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "shavings"), [_S.read(_e, "ps"), _S.read(_e, "Rg"), _S.read(_e, "s"), (14 if _S.truth(_S.read(_e, "last")) else 4), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)]])
	if _S.truth(_S.read(_e, "last")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "k"), 5)):
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v3, "s"), "cx"), _S.invoke(_S.read(_v3, "Rg"), "range", [_S.unary("-", 22), 22])), _S.binary("+", _S.prop(_S.read(_v3, "s"), "cy"), _S.invoke(_S.read(_v3, "Rg"), "range", [_S.unary("-", 14), 14])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v3, "Rg"), "range", [0.2, 0.45]), (_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.invoke(_S.read(_v3, "Rg"), "chance", [0.5])) else _S.read(_v3, "WHITE")), _S.invoke(_S.read(_v3, "Rg"), "range", [1, 2.2]), _S.invoke(_S.read(_v3, "Rg"), "range", [0.05, 0.25])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "k", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v4 in _S.array(_S.read(_e, "all")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "s", _v4)
		_S.call_value(_S.read(_v5, "slash"), [_S.read(_v5, "p"), _S.read(_v5, "s"), _S.read(_v5, "t")])
	_S.invoke(_S.read(_e, "all"), "forEach", [_S.function_value(_e, "_f8")])
	_S.define(_e, "q", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "big"), "t0")), _S.prop(_S.read(_e, "big"), "sweep")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "q"), 0.02), func(): return _S.binary("<", _S.read(_e, "q"), 0.14))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "k", _S.binary("/", _S.binary("-", _S.read(_v7, "q"), 0.02), 0.12))
		_S.define(_v7, "e", _S.prop(_S.read(_v7, "ends"), _S.binary("-", _S.prop(_S.read(_v7, "ends"), "length"), 1)))
		for _v8 in _S.array(_S.read(_v7, "slivers")):
			var _v9 = _S.scope(_v7)
			_S.define(_v9, "s", _v8)
			_S.call_value(_S.read(_v9, "sliver"), [_S.read(_v9, "p"), _S.prop(_S.read(_v9, "e"), "x"), _S.prop(_S.read(_v9, "e"), "y"), _S.binary("+", _S.prop(_S.read(_v9, "s"), "a"), _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.prop(_S.read(_v9, "e"), "dy"), _S.prop(_S.read(_v9, "e"), "dx")])), _S.binary("+", _S.prop(_S.read(_v9, "s"), "r"), _S.binary("*", _S.prop(_S.read(_v9, "s"), "v"), _S.binary("-", _S.read(_v9, "q"), 0.02))), _S.binary("*", _S.prop(_S.read(_v9, "s"), "arc"), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v9, "k")))), (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.4)) else (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.7)) else _S.prop(_S.read(_v9, "C"), 4))), _S.binary("-", 1, _S.read(_v9, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "e", _S.prop(_S.read(_e, "ends"), _S.read(_e, "i")))
	_S.define(_e, "g", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")), _S.binary("*", _S.prop(_S.read(_e, "s"), "sweep"), 0.6)))
	_S.define(_e, "last", _S.binary("===", _S.read(_e, "s"), _S.read(_e, "big")))
	_S.define(_e, "life", (0.24 if _S.truth(_S.read(_e, "last")) else 0.12))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), _S.read(_e, "life")))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "e"), "x"), _S.prop(_S.read(_e, "e"), "y"), _S.binary("*", _S.binary("*", (10 if _S.truth(_S.read(_e, "last")) else 4), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "g"), 0.04)])])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), _S.read(_e, "life")))), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), (0.6 if _S.truth(_S.read(_e, "last")) else 0.35)])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), _S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), 0.1)))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "h", _S.call_value(_S.read(_v6, "slashEnd"), [_S.merge([_S.read(_v6, "s"), {"span": _S.binary("*", _S.prop(_S.read(_v6, "s"), "span"), _S.invoke(_S.read(_v6, "ease"), "outExpo", [_S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.read(_v6, "u"), _S.prop(_S.read(_v6, "s"), "sweep"))])]))}])]))
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.prop(_S.read(_v6, "h"), "x"), _S.prop(_S.read(_v6, "h"), "y"), (40 if _S.truth(_S.read(_v6, "last")) else 22), _S.prop(_S.read(_v6, "C"), 3), _S.binary("*", (0.5 if _S.truth(_S.read(_v6, "last")) else 0.35), _S.binary("-", 1, _S.binary("/", _S.read(_v6, "u"), _S.binary("+", _S.prop(_S.read(_v6, "s"), "sweep"), 0.1))))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "fx", _S.arg(_args, 0))
	_S.define(_e, "fy", _S.arg(_args, 1))
	_S.define(_e, "sa", _S.arg(_args, 2))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([])))
	return _S.merge([_S.read(_e, "BASE"), {"fx": _S.read(_e, "fx")}, {"fy": _S.read(_e, "fy")}, {"sa": _S.read(_e, "sa")}, {"bx": 4}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 1)}, _S.read(_e, "o")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "bx", _S.arg(_args, 0))
	_S.define(_e, "by", _S.arg(_args, 1))
	_S.define(_e, "sb", _S.arg(_args, 2))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([])))
	return _S.merge([_S.read(_e, "BASE"), {"bx": _S.read(_e, "bx")}, {"by": _S.read(_e, "by")}, {"sb": _S.read(_e, "sb")}, {"fx": 1}, {"fy": _S.unary("-", 23)}, {"sa": _S.unary("-", 1)}, _S.read(_e, "o")])
