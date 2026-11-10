@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/double-slash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "through", _S.import_value("fx/melee/_lib.js", "through"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "shavings", _S.import_value("fx/melee/_lib.js", "shavings"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Double slash"}, {"desc": "A down cut, then an up cut that crosses it: the moment the X closes both strokes flash white, the crossing bursts with light and sparks, and a dotted X lingers."}, {"tags": ["melee", "slash", "combo", "sword", "cross", "combat", "directional", "one-shot"]}, {"size": [164, 108]}, {"origin": [44, 92]}, {"duration": 0.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0a22", "#5e1238", "#a01f4e", "#e0386a", "#ff86a6", "#ffd2dd", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.85)}]))
	_S.define(_e, "HIGH", _S.merge([_S.read(_e, "STANCE"), {"x": _S.unary("-", 7)}, {"crouch": 4}, {"lean": _S.unary("-", 4)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 35)}, {"sa": _S.unary("-", 2.65)}, {"bx": 9}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "LOW", _S.merge([_S.read(_e, "STANCE"), {"x": 3}, {"crouch": 6}, {"lean": 6}, {"fx": 22}, {"fy": _S.unary("-", 20)}, {"sa": 0.62}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 62}])}, {"poses": [[_S.unary("-", 0.42), _S.merge([_S.read(_e, "STANCE"), {"x": _S.unary("-", 7)}])], [_S.unary("-", 0.18), _S.read(_e, "HIGH")], [_S.unary("-", 0.04), _S.merge([_S.read(_e, "HIGH"), {"crouch": 5}])], [0, _S.merge([_S.read(_e, "STANCE"), {"x": 0}, {"crouch": 2}, {"lean": 3}, {"fx": 16}, {"fy": _S.unary("-", 37)}, {"sa": _S.unary("-", 1.45)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}, {"ghost": 1}]), "snap"], [0.06, _S.read(_e, "LOW"), "snap"], [0.14, _S.merge([_S.read(_e, "LOW"), {"x": 4}, {"crouch": 6}, {"lean": 5}, {"fx": 20}, {"fy": _S.unary("-", 17)}, {"sa": 0.85}, {"ghost": 1}])], [0.17, _S.merge([_S.read(_e, "LOW"), {"x": 5}, {"crouch": 3}, {"lean": 5}, {"fx": 22}, {"fy": _S.unary("-", 28)}, {"sa": 0.1}, {"by": _S.unary("-", 18)}, {"toeB": true}, {"ghost": 1}]), "snap"], [0.21, _S.merge([_S.read(_e, "LOW"), {"x": 6}, {"crouch": 1}, {"lean": 6}, {"fx": 19}, {"fy": _S.unary("-", 37)}, {"sa": _S.unary("-", 0.95)}, {"by": _S.unary("-", 18)}, {"ffx": 13}, {"fby": _S.unary("-", 6)}]), "snap"], [0.5, _S.merge([_S.read(_e, "LOW"), {"x": 6}, {"crouch": 3}, {"lean": 3}, {"fx": 18}, {"fy": _S.unary("-", 36)}, {"sa": _S.unary("-", 1.05)}, {"by": _S.unary("-", 19)}, {"ffx": 12}])], [0.92, _S.merge([_S.read(_e, "STANCE"), {"x": _S.unary("-", 7)}])]]}, {"hits": [_S.merge([{"t": 0.06}, {"stop": 0.05}, {"shake": 0.08}, {"amp": 1}, {"push": 1.4}, {"straw": 8}]), _S.merge([{"t": 0.16}, {"stop": 0.14}, {"shake": 0.2}, {"amp": 2}, {"push": 2.8}, {"straw": 18}, {"y": _S.unary("-", 28)}])]}, {"dust": [_S.merge([{"t": 0.06}, {"x": 16}, {"n": 5}, {"dir": 1}]), _S.merge([{"t": 0.17}, {"x": _S.unary("-", 8)}, {"n": 4}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "UP", 0.14)
	_S.define(_e, "R0", 62)
	_S.define(_e, "cut", _S.function_value(_e, "_f5"))
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
	_S.define(_e, "X", 34)
	_S.define(_e, "Y", _S.unary("-", 23))
	_S.define(_e, "down", _S.call_value(_S.read(_e, "cut"), [_S.read(_e, "X"), _S.read(_e, "Y"), 0.72, 1, 0.84, _S.merge([{"W": 10}, {"t0": 0}, {"sweep": 0.06}, {"hold": 0.07}, {"trail": 0.24}, {"ramp": _S.read(_e, "C")}, {"lens": true}])]))
	_S.define(_e, "up", _S.call_value(_S.read(_e, "cut"), [_S.read(_e, "X"), _S.read(_e, "Y"), _S.unary("-", 0.66), _S.unary("-", 1), 0.84, _S.merge([{"W": 11}, {"t0": _S.read(_e, "UP")}, {"sweep": 0.06}, {"hold": 0.06}, {"trail": 0.26}, {"ramp": _S.read(_e, "C")}, {"lens": true}])]))
	_S.define(_e, "ends", [_S.call_value(_S.read(_e, "slashEnd"), [_S.read(_e, "down")]), _S.call_value(_S.read(_e, "slashEnd"), [_S.read(_e, "up")])])
	_S.define(_e, "slivers", _S.invoke([_S.unary("-", 2.4), _S.unary("-", 1.1), 0.2, 1.6], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "CLOSE", _S.binary("+", _S.read(_e, "UP"), 0.012))
	_S.define(_e, "t", 0)
	_S.define(_e, "cut1", false)
	_S.define(_e, "cut2", false)
	_S.define(_e, "closed", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_a_b0 = _S.arg(_args,0)
	return {"a":(_n_a_b0 + _S.invoke(_n_Rg,"range",[(-0.2), 0.2])),"r":_S.invoke(_n_Rg,"range",[5, 8]),"v":_S.invoke(_n_Rg,"range",[70, 120]),"arc":_S.invoke(_n_Rg,"range",[0.4, 0.7])}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cut1")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "down"), "sweep")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "cut1", true, "=", false)
		_S.call_value(_S.read(_v0, "shavings"), [_S.read(_v0, "ps"), _S.read(_v0, "Rg"), _S.read(_v0, "down"), 10, [_S.prop(_S.read(_v0, "C"), 4), _S.prop(_S.read(_v0, "C"), 5)]])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 6)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "a", _S.binary("+", _S.invoke(_S.read(_v2, "Math"), "atan2", [_S.prop(_S.prop(_S.read(_v2, "ends"), 0), "dy"), _S.prop(_S.prop(_S.read(_v2, "ends"), 0), "dx")]), _S.invoke(_S.read(_v2, "Rg"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "Rg"), "range", [120, 300]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.prop(_S.prop(_S.read(_v2, "ends"), 0), "x"), _S.prop(_S.prop(_S.read(_v2, "ends"), 0), "y"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.invoke(_S.read(_v2, "Rg"), "range", [0.12, 0.3])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "closed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLOSE")))):
		var _v3 = _S.scope(_e)
		_S.write(_v3, "closed", true, "=", false)
		_S.invoke(_S.read(_v3, "lights"), "add", [_S.read(_v3, "X"), _S.read(_v3, "Y"), 56, _S.prop(_S.read(_v3, "C"), 3), 0.45, 0.4])
		_S.invoke(_S.read(_v3, "lights"), "add", [_S.read(_v3, "X"), _S.read(_v3, "Y"), 18, _S.read(_v3, "WHITE"), 0.6, 0.08])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 18)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.binary("*", _S.invoke(_S.read(_v5, "Rg"), "range", [_S.unary("-", _S.prop(_S.read(_v5, "Math"), "PI")), _S.prop(_S.read(_v5, "Math"), "PI")]), 0.8))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "Rg"), "range", [140, 360]))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.read(_v5, "X"), _S.read(_v5, "Y"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 40), _S.invoke(_S.read(_v5, "Rg"), "range", [0.14, 0.4])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 5)):
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("+", _S.read(_v6, "X"), _S.invoke(_S.read(_v6, "Rg"), "range", [_S.unary("-", 14), 14])), _S.binary("+", _S.read(_v6, "Y"), _S.invoke(_S.read(_v6, "Rg"), "range", [_S.unary("-", 12), 12])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v6, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.invoke(_S.read(_v6, "Rg"), "chance", [0.5])) else _S.read(_v6, "WHITE")), _S.invoke(_S.read(_v6, "Rg"), "range", [1, 2.2]), _S.invoke(_S.read(_v6, "Rg"), "range", [0.05, 0.2])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cut2")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "UP"), _S.prop(_S.read(_e, "up"), "sweep"))))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "cut2", true, "=", false)
		_S.call_value(_S.read(_v7, "shavings"), [_S.read(_v7, "ps"), _S.read(_v7, "Rg"), _S.read(_v7, "up"), 12, [_S.prop(_S.read(_v7, "C"), 4), _S.prop(_S.read(_v7, "C"), 5)]])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "flash", (1 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLOSE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CLOSE"), 0.07)))) else 0))
	_S.set_prop(_S.read(_e, "down"), "hot", _S.set_prop(_S.read(_e, "up"), "hot", _S.read(_e, "flash"), "=", false), "=", false)
	_S.call_value(_S.read(_e, "slash"), [_S.read(_e, "p"), _S.read(_e, "down"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "slash"), [_S.read(_e, "p"), _S.read(_e, "up"), _S.read(_e, "t")])
	for _v8 in _S.array([[_S.read(_e, "down"), _S.prop(_S.read(_e, "ends"), 0)], [_S.read(_e, "up"), _S.prop(_S.read(_e, "ends"), 1)]]):
		var _v9 = _S.scope(_e)
		var _v10 = _v8
		_S.define(_v9, "s", _S.prop(_v10, 0))
		_S.define(_v9, "e", _S.prop(_v10, 1))
		var _v11 = _S.scope(_v9)
		_S.define(_v11, "g", _S.binary("-", _S.binary("-", _S.read(_v11, "t"), _S.prop(_S.read(_v11, "s"), "t0")), _S.binary("*", _S.prop(_S.read(_v11, "s"), "sweep"), 0.6)))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v11, "g"), 0), func(): return _S.binary("<", _S.read(_v11, "g"), 0.2))):
			_S.call_value(_S.read(_v11, "sparkle"), [_S.read(_v11, "p"), _S.prop(_S.read(_v11, "e"), "x"), _S.prop(_S.read(_v11, "e"), "y"), _S.binary("*", _S.binary("*", 7, _S.invoke(_S.read(_v11, "ease"), "outBack", [_S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("/", _S.read(_v11, "g"), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.read(_v11, "g"), 0.2))), _S.prop(_S.read(_v11, "C"), 5), _S.prop(_S.read(_v11, "C"), 3), 0.5])
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLOSE")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.26))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "k", _S.binary("/", _S.read(_v12, "q"), 0.26))
		_S.call_value(_S.read(_v12, "flare"), [_S.read(_v12, "p"), _S.read(_v12, "X"), _S.read(_v12, "Y"), _S.binary("*", 22, _S.invoke(_S.read(_v12, "Math"), "pow", [_S.binary("-", 1, _S.read(_v12, "k")), 1.4])), _S.binary("-", 1, _S.read(_v12, "k")), _S.read(_v12, "C")])
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "X"), _S.read(_v12, "Y"), 34, _S.prop(_S.read(_v12, "C"), 4), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v12, "k")))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.03), func(): return _S.binary("<", _S.read(_e, "q"), 0.15))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "k", _S.binary("/", _S.binary("-", _S.read(_v13, "q"), 0.03), 0.12))
		for _v14 in _S.array(_S.read(_v13, "slivers")):
			var _v15 = _S.scope(_v13)
			_S.define(_v15, "s", _v14)
			_S.call_value(_S.read(_v15, "sliver"), [_S.read(_v15, "p"), _S.read(_v15, "X"), _S.read(_v15, "Y"), _S.prop(_S.read(_v15, "s"), "a"), _S.binary("+", _S.prop(_S.read(_v15, "s"), "r"), _S.binary("*", _S.prop(_S.read(_v15, "s"), "v"), _S.binary("-", _S.read(_v15, "q"), 0.03))), _S.binary("*", _S.prop(_S.read(_v15, "s"), "arc"), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v15, "k")))), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v15, "k"), 0.4)) else (_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v15, "k"), 0.7)) else _S.prop(_S.read(_v15, "C"), 4))), _S.binary("-", 1, _S.read(_v15, "k"))])
	for _v16 in _S.array([_S.read(_e, "down"), _S.read(_e, "up")]):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "s", _v16)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "u", _S.binary("-", _S.read(_v18, "t"), _S.prop(_S.read(_v18, "s"), "t0")))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v18, "u"), 0), func(): return _S.binary(">=", _S.read(_v18, "u"), 0.25))):
			continue
		_S.define(_v18, "e", _S.call_value(_S.read(_v18, "slashEnd"), [_S.merge([_S.read(_v18, "s"), {"span": _S.binary("*", _S.prop(_S.read(_v18, "s"), "span"), _S.invoke(_S.read(_v18, "ease"), "outExpo", [_S.call_value(_S.read(_v18, "clamp"), [_S.binary("/", _S.read(_v18, "u"), _S.prop(_S.read(_v18, "s"), "sweep"))])]))}])]))
		_S.invoke(_S.read(_v18, "p"), "glow", [_S.prop(_S.read(_v18, "e"), "x"), _S.prop(_S.read(_v18, "e"), "y"), 40, _S.prop(_S.read(_v18, "C"), 3), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v18, "u"), 0.25)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_through = _S.read(_parent,"through")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_th_b2 = _S.arg(_args,2)
	var _n_dir_b3 = _S.arg(_args,3)
	var _n_span_b4 = _S.arg(_args,4)
	var _n_extra_b5 = _S.arg(_args,5)
	return _S.call_value(_n_through,[_n_x_b0, _n_y_b1, _n_th_b2, _n_dir_b3, _n_R0, _n_span_b4, 0.55, _n_extra_b5])
	return null
