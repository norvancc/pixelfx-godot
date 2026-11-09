@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/whip-crack.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Whip crack"}, {"desc": "A whip rolls out to the right as a loop running down its length, faster and faster, until the tip flips over and cracks: a white pop, a ring of air, sparks and a puff of smoke."}, {"tags": ["melee", "whip", "crack", "lash", "combat", "directional", "one-shot"]}, {"size": [192, 80]}, {"origin": [30, 68]}, {"duration": 0.85}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1a10", "#5c3a1e", "#9c6a34", "#d8a45a", "#ffd890", "#fff4d6", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"length": 76}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "handle"}, {"x": _S.unary("-", 7)}, {"sa": _S.unary("-", 0.3)}, {"fx": 13}, {"fy": _S.unary("-", 21)}, {"bx": 7}, {"by": _S.unary("-", 18)}]))
	_S.define(_e, "COCK", _S.merge([_S.read(_e, "STANCE"), {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 38)}, {"sa": _S.unary("-", 2.2)}, {"bx": 9}, {"by": _S.unary("-", 23)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "CRACK_", _S.merge([_S.read(_e, "STANCE"), {"crouch": 4}, {"lean": 5}, {"fx": 18}, {"fy": _S.unary("-", 21)}, {"sa": 0}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 23)}, {"ffx": 12}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 94}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "STANCE")], [_S.unary("-", 0.22), _S.read(_e, "COCK")], [0.02, _S.merge([_S.read(_e, "COCK"), {"lean": _S.unary("-", 4)}])], [0.06, _S.merge([_S.read(_e, "CRACK_"), {"fx": 15}, {"fy": _S.unary("-", 34)}, {"sa": _S.unary("-", 0.7)}, {"lean": 2}, {"ghost": 1}]), "snap"], [0.12, _S.read(_e, "CRACK_"), "snap"], [0.21, _S.read(_e, "CRACK_")], [0.26, _S.merge([_S.read(_e, "CRACK_"), {"fx": 15}, {"fy": _S.unary("-", 27)}, {"sa": _S.unary("-", 0.3)}, {"lean": 2}, {"crouch": 3}]), "snap"], [0.44, _S.merge([_S.read(_e, "CRACK_"), {"fx": 17}, {"fy": _S.unary("-", 22)}, {"sa": 0.1}, {"lean": 3}, {"crouch": 3}])], [0.92, _S.read(_e, "STANCE")]]}, {"hits": [_S.merge([{"t": 0.21}, {"stop": 0.1}, {"shake": 0.14}, {"amp": 2}, {"push": 2.4}, {"straw": 14}, {"y": _S.unary("-", 28)}])]}, {"dust": [_S.merge([{"t": 0.06}, {"x": 2}, {"n": 4}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "ROLL0", 0.02)
	_S.define(_e, "ROLL", 0.19)
	_S.define(_e, "CRACK", _S.binary("+", _S.read(_e, "ROLL0"), _S.read(_e, "ROLL")))
	_S.define(_e, "RECOIL", 0.16)
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
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "HX", 11)
	_S.define(_e, "HY", _S.unary("-", 21))
	_S.define(_e, "TIP", [_S.binary("+", _S.read(_e, "HX"), _S.read(_e, "L")), _S.binary("-", _S.read(_e, "HY"), 1)])
	_S.define(_e, "lam", _S.function_value(_e, "_f2"))
	_S.define(_e, "shape", _S.function_value(_e, "_f3"))
	_S.define(_e, "spikes", _S.invoke([0, 0.8, 1.6, 2.4, 3.14, 3.9, 4.7, 5.5], "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "slivers", _S.invoke([_S.unary("-", 1.2), _S.unary("-", 0.3), 0.5, 1.3], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "cracked", false)
	_S.define(_e, "tipTrail", [])
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "L"), _S.binary("+", 0.34, _S.binary("*", 0.66, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ROLL0")), _S.read(_e, "ROLL"))])]))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "l", _S.call_value(_S.read(_e, "lam"), [_S.read(_e, "t")]))
	_S.define(_e, "r", _S.binary("-", 6.5, _S.binary("*", 3.5, _S.binary("/", _S.read(_e, "l"), _S.read(_e, "L")))))
	_S.define(_e, "pts", [])
	_S.define(_e, "recoil", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "CRACK"), 0.04), _S.binary("+", _S.binary("+", _S.read(_e, "CRACK"), 0.04), _S.read(_e, "RECOIL")), _S.read(_e, "t")]))
	_S.define(_e, "len", _S.binary("*", _S.read(_e, "L"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "recoil"), 0.85))))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "s"), _S.read(_v0, "len"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", null)
		_S.define(_v1, "y", null)
		if _S.truth(_S.binary("<=", _S.read(_v1, "s"), _S.read(_v1, "l"))):
			_S.last([_S.write(_v1, "x", _S.binary("+", _S.read(_v1, "HX"), _S.read(_v1, "s")), "=", false), _S.write(_v1, "y", _S.binary("-", _S.read(_v1, "HY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "s")), _S.invoke(_S.read(_v1, "Math"), "max", [_S.read(_v1, "l"), 1]))]), 2.5), _S.binary("-", 1, _S.binary("/", _S.read(_v1, "l"), _S.read(_v1, "L"))))), "=", false)])
		else:
			if _S.truth(_S.binary("<=", _S.read(_v1, "s"), _S.binary("+", _S.read(_v1, "l"), _S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "r"))))):
				var _v2 = _S.scope(_v1)
				_S.define(_v2, "th", _S.binary("/", _S.binary("-", _S.read(_v2, "s"), _S.read(_v2, "l")), _S.read(_v2, "r")))
				_S.last([_S.write(_v2, "x", _S.binary("+", _S.binary("+", _S.read(_v2, "HX"), _S.read(_v2, "l")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "th")]), _S.read(_v2, "r"))), "=", false), _S.write(_v2, "y", _S.binary("-", _S.binary("+", _S.read(_v2, "HY"), _S.read(_v2, "r")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "th")]), _S.read(_v2, "r"))), "=", false)])
			else:
				_S.last([_S.write(_v1, "x", _S.binary("-", _S.binary("+", _S.read(_v1, "HX"), _S.read(_v1, "l")), _S.binary("-", _S.binary("-", _S.read(_v1, "s"), _S.read(_v1, "l")), _S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "r")))), "=", false), _S.write(_v1, "y", _S.binary("+", _S.read(_v1, "HY"), _S.binary("*", 2, _S.read(_v1, "r"))), "=", false)])
		if _S.truth(_S.binary(">", _S.read(_v1, "recoil"), 0)):
			_S.write(_v1, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "s")), _S.read(_v1, "L"))]), 6), _S.read(_v1, "recoil")), "+=", false)
		_S.invoke(_S.read(_v1, "pts"), "push", [[_S.read(_v1, "x"), _S.read(_v1, "y")]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "s", 1, "+=", false)
	return _S.read(_e, "pts")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.15), 0.15]))}, {"len": _S.binary("+", (13 if _S.truth(_S.binary("===", _S.read(_e, "i"), 0)) else (6 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 9)), _S.invoke(_S.read(_e, "Rg"), "range", [0, 3]))}, {"w": _S.binary("+", 1.4, _S.invoke(_S.read(_e, "Rg"), "range", [0, 0.5]))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.merge([{"a": _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.2), 0.2]))}, {"r": _S.invoke(_S.read(_e, "Rg"), "range", [4, 6])}, {"v": _S.invoke(_S.read(_e, "Rg"), "range", [80, 120])}, {"arc": _S.invoke(_S.read(_e, "Rg"), "range", [0.4, 0.7])}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CRACK"), 0.05)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRACK"), 0.01)))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "pts", _S.call_value(_S.read(_v3, "shape"), [_S.read(_v3, "t")]))
		_S.invoke(_S.read(_v3, "tipTrail"), "push", [_S.merge([{"p": _S.prop(_S.read(_v3, "pts"), _S.binary("-", _S.prop(_S.read(_v3, "pts"), "length"), 1))}, {"t": _S.read(_v3, "t")}])])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", _S.binary("-", _S.prop(_S.read(_v4, "tipTrail"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v4, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v4, "t"), _S.prop(_S.prop(_S.read(_v4, "tipTrail"), _S.read(_v4, "i")), "t")), 0.06)):
			_S.invoke(_S.read(_v4, "tipTrail"), "splice", [_S.read(_v4, "i"), 1])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cracked")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "cracked", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.prop(_S.read(_v5, "TIP"), 0), _S.prop(_S.read(_v5, "TIP"), 1), 46, _S.prop(_S.read(_v5, "C"), 4), 0.6, 0.3])
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.prop(_S.read(_v5, "TIP"), 0), _S.prop(_S.read(_v5, "TIP"), 1), 14, _S.read(_v5, "WHITE"), 0.8, 0.07])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 16)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "Rg"), "range", [_S.unary("-", 1.3), 1.2]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "Rg"), "range", [130, 300]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.prop(_S.read(_v7, "TIP"), 0), _S.prop(_S.read(_v7, "TIP"), 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 40), _S.invoke(_S.read(_v7, "Rg"), "range", [0.12, 0.36])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)):
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v8, "TIP"), 0), _S.invoke(_S.read(_v8, "Rg"), "range", [_S.unary("-", 2), 3])), _S.binary("+", _S.prop(_S.read(_v8, "TIP"), 1), _S.invoke(_S.read(_v8, "Rg"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v8, "Rg"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_v8, "Rg"), "range", [6, 18])), _S.invoke(_S.read(_v8, "Rg"), "range", [0.5, 0.8]), _S.prop(_S.read(_v8, "C"), 2), _S.invoke(_S.read(_v8, "Rg"), "range", [2.5, 4]), _S.invoke(_S.read(_v8, "Rg"), "range", [0.02, 0.06])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v9 = _S.scope(_v5)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 4)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v9, "TIP"), 0), _S.invoke(_S.read(_v9, "Rg"), "range", [_S.unary("-", 8), 10])), _S.binary("+", _S.prop(_S.read(_v9, "TIP"), 1), _S.invoke(_S.read(_v9, "Rg"), "range", [_S.unary("-", 8), 8])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v9, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.invoke(_S.read(_v9, "Rg"), "chance", [0.5])) else _S.read(_v9, "WHITE")), _S.invoke(_S.read(_v9, "Rg"), "range", [0.8, 1.8]), _S.invoke(_S.read(_v9, "Rg"), "range", [0.05, 0.2])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "end", _S.binary("+", _S.binary("+", _S.read(_e, "CRACK"), 0.04), _S.read(_e, "RECOIL")))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "end"))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v10, "smooth"), [_S.binary("-", _S.read(_v10, "end"), 0.06), _S.read(_v10, "end"), _S.read(_v10, "t")])))
		if _S.truth(_S.binary("<", _S.read(_v10, "t"), _S.read(_v10, "CRACK"))):
			for _v11 in _S.array([[0.03, _S.prop(_S.read(_v10, "C"), 1), 0.5], [0.015, _S.prop(_S.read(_v10, "C"), 2), 0.7]]):
				var _v12 = _S.scope(_v10)
				var _v13 = _v11
				_S.define(_v12, "lag", _S.prop(_v13, 0))
				_S.define(_v12, "c", _S.prop(_v13, 1))
				_S.define(_v12, "a", _S.prop(_v13, 2))
				var _v14 = _S.scope(_v12)
				_S.define(_v14, "old", _S.call_value(_S.read(_v14, "shape"), [_S.invoke(_S.read(_v14, "Math"), "max", [0, _S.binary("-", _S.read(_v14, "t"), _S.read(_v14, "lag"))])]))
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "i", 1)
				while _S.truth(_S.binary("<", _S.read(_v15, "i"), _S.prop(_S.read(_v15, "old"), "length"))):
					_S.invoke(_S.read(_v15, "p"), "dot", [_S.prop(_S.prop(_S.read(_v15, "old"), _S.read(_v15, "i")), 0), _S.prop(_S.prop(_S.read(_v15, "old"), _S.read(_v15, "i")), 1), _S.read(_v15, "c"), _S.read(_v15, "a")])
					_v15 = _S.iteration(_v15)
					_S.write(_v15, "i", 2, "+=", false)
		_S.define(_v10, "pts", _S.call_value(_S.read(_v10, "shape"), [_S.read(_v10, "t")]))
		_S.define(_v10, "n", _S.prop(_S.read(_v10, "pts"), "length"))
		_S.define(_v10, "l", _S.call_value(_S.read(_v10, "lam"), [_S.read(_v10, "t")]))
		_S.define(_v10, "r", _S.binary("-", 6.5, _S.binary("*", 3.5, _S.binary("/", _S.read(_v10, "l"), _S.read(_v10, "L")))))
		var _v16 = _S.scope(_v10)
		_S.define(_v16, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.read(_v16, "n"))):
			var _v17 = _S.scope(_v16)
			var _v18 = _S.prop(_S.read(_v17, "pts"), _S.binary("-", _S.read(_v17, "i"), 1))
			_S.define(_v17, "x0", _S.prop(_v18, 0))
			_S.define(_v17, "y0", _S.prop(_v18, 1))
			var _v19 = _S.prop(_S.read(_v17, "pts"), _S.read(_v17, "i"))
			_S.define(_v17, "x1", _S.prop(_v19, 0))
			_S.define(_v17, "y1", _S.prop(_v19, 1))
			_S.define(_v17, "u", _S.binary("/", _S.read(_v17, "i"), _S.read(_v17, "n")))
			_S.define(_v17, "s", _S.read(_v17, "i"))
			_S.define(_v17, "inLoop", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v17, "t"), _S.read(_v17, "CRACK")), func(): return _S.binary(">", _S.read(_v17, "s"), _S.read(_v17, "l"))), func(): return _S.binary("<", _S.read(_v17, "s"), _S.binary("+", _S.read(_v17, "l"), _S.binary("*", _S.prop(_S.read(_v17, "Math"), "PI"), _S.read(_v17, "r"))))))
			_S.define(_v17, "lead", _S.logical("&&", _S.read(_v17, "inLoop"), func(): return _S.binary("<", _S.invoke(_S.read(_v17, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_v17, "s"), _S.read(_v17, "l")), _S.binary("/", _S.binary("*", _S.prop(_S.read(_v17, "Math"), "PI"), _S.read(_v17, "r")), 2))]), _S.binary("*", _S.read(_v17, "r"), 0.9))))
			_S.invoke(_S.read(_v17, "p"), "line", [_S.read(_v17, "x0"), _S.read(_v17, "y0"), _S.read(_v17, "x1"), _S.read(_v17, "y1"), (_S.read(_v17, "WHITE") if _S.truth(_S.read(_v17, "lead")) else (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.read(_v17, "inLoop")) else (_S.prop(_S.read(_v17, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.5)) else _S.prop(_S.read(_v17, "C"), 3)))), _S.read(_v17, "fade")])
			if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.4)):
				_S.invoke(_S.read(_v17, "p"), "line", [_S.read(_v17, "x0"), _S.binary("+", _S.read(_v17, "y0"), 1), _S.read(_v17, "x1"), _S.binary("+", _S.read(_v17, "y1"), 1), _S.prop(_S.read(_v17, "C"), 2), _S.read(_v17, "fade")])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		if _S.truth(_S.binary("<", _S.read(_v10, "t"), _S.read(_v10, "CRACK"))):
			var _v20 = _S.scope(_v10)
			_S.define(_v20, "l", _S.call_value(_S.read(_v20, "lam"), [_S.read(_v20, "t")]))
			_S.define(_v20, "r", _S.binary("-", 6.5, _S.binary("*", 3.5, _S.binary("/", _S.read(_v20, "l"), _S.read(_v20, "L")))))
			_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("+", _S.binary("+", _S.read(_v20, "HX"), _S.read(_v20, "l")), _S.read(_v20, "r")), _S.binary("+", _S.read(_v20, "HY"), _S.read(_v20, "r")), 12, _S.prop(_S.read(_v20, "C"), 4), 0.4])
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), _S.prop(_S.read(_v21, "tipTrail"), "length"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v22, "t"), _S.prop(_S.prop(_S.read(_v22, "tipTrail"), _S.read(_v22, "i")), "t")), 0.06)))
		_S.invoke(_S.read(_v22, "p"), "line", [_S.prop(_S.prop(_S.prop(_S.read(_v22, "tipTrail"), _S.binary("-", _S.read(_v22, "i"), 1)), "p"), 0), _S.prop(_S.prop(_S.prop(_S.read(_v22, "tipTrail"), _S.binary("-", _S.read(_v22, "i"), 1)), "p"), 1), _S.prop(_S.prop(_S.prop(_S.read(_v22, "tipTrail"), _S.read(_v22, "i")), "p"), 0), _S.prop(_S.prop(_S.prop(_S.read(_v22, "tipTrail"), _S.read(_v22, "i")), "p"), 1), (_S.read(_v22, "WHITE") if _S.truth(_S.binary(">", _S.read(_v22, "k"), 0.6)) else _S.prop(_S.read(_v22, "C"), 5)), _S.read(_v22, "k")])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRACK")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.035))):
		_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "TIP"), 0), _S.prop(_S.read(_e, "TIP"), 1), _S.read(_e, "spikes"), 1, 1, _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4)])
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.035), func(): return _S.binary("<", _S.read(_e, "q"), 0.07))):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "TIP"), 0), _S.prop(_S.read(_e, "TIP"), 1), _S.read(_e, "spikes"), 1.3, 0.5, _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.02), func(): return _S.binary("<", _S.read(_e, "q"), 0.2))):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "k", _S.binary("/", _S.binary("-", _S.read(_v23, "q"), 0.02), 0.18))
		_S.define(_v23, "r", _S.binary("+", 4, _S.binary("*", 16, _S.invoke(_S.read(_v23, "ease"), "outCubic", [_S.read(_v23, "k")]))))
		_S.define(_v23, "th", _S.invoke(_S.read(_v23, "Math"), "max", [1, _S.binary("*", 2.2, _S.binary("-", 1, _S.read(_v23, "k")))]))
		_S.define(_v23, "col", (_S.read(_v23, "WHITE") if _S.truth(_S.binary("<", _S.read(_v23, "k"), 0.25)) else (_S.prop(_S.read(_v23, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v23, "k"), 0.5)) else (_S.prop(_S.read(_v23, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v23, "k"), 0.75)) else _S.prop(_S.read(_v23, "C"), 3)))))
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "a"), _S.read(_v24, "TAU"))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "o", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "o"), _S.read(_v25, "th"))):
				_S.invoke(_S.read(_v25, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v25, "TIP"), 0), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.binary("-", _S.read(_v25, "r"), _S.read(_v25, "o")))), _S.binary("+", _S.prop(_S.read(_v25, "TIP"), 1), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.binary("-", _S.read(_v25, "r"), _S.read(_v25, "o"))), 0.8)), _S.read(_v25, "col"), _S.binary("-", 1.15, _S.read(_v25, "k"))])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "o", 0.5, "+=", false)
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "a", _S.binary("/", 0.6, _S.read(_v24, "r")), "+=", false)
		_S.invoke(_S.read(_v23, "p"), "glow", [_S.prop(_S.read(_v23, "TIP"), 0), _S.prop(_S.read(_v23, "TIP"), 1), _S.binary("+", _S.read(_v23, "r"), 6), _S.prop(_S.read(_v23, "C"), 4), _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_v23, "k")))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.04), func(): return _S.binary("<", _S.read(_e, "q"), 0.16))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "k", _S.binary("/", _S.binary("-", _S.read(_v26, "q"), 0.04), 0.12))
		for _v27 in _S.array(_S.read(_v26, "slivers")):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "s", _v27)
			_S.call_value(_S.read(_v28, "sliver"), [_S.read(_v28, "p"), _S.prop(_S.read(_v28, "TIP"), 0), _S.prop(_S.read(_v28, "TIP"), 1), _S.prop(_S.read(_v28, "s"), "a"), _S.binary("+", _S.prop(_S.read(_v28, "s"), "r"), _S.binary("*", _S.prop(_S.read(_v28, "s"), "v"), _S.binary("-", _S.read(_v28, "q"), 0.04))), _S.binary("*", _S.prop(_S.read(_v28, "s"), "arc"), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v28, "k")))), (_S.prop(_S.read(_v28, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v28, "k"), 0.4)) else _S.prop(_S.read(_v28, "C"), 5)), _S.binary("-", 1, _S.read(_v28, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.15))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "TIP"), 0), _S.prop(_S.read(_e, "TIP"), 1), 26, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "q")), 0.04)]))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
