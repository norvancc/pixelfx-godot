@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/hammer-smash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "stone", _S.import_value("fx/melee/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/melee/_lib.js", "rock"))
	_S.define(_e, "cracks", _S.import_value("fx/melee/_lib.js", "cracks"))
	_S.define(_e, "along", _S.import_value("fx/melee/_lib.js", "along"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hammer smash"}, {"desc": "A hammer drops in front in a wedge of motion: a white slam with rays, a dome of force, a dent with cracks, rocks thrown up that bounce and settle, and dust."}, {"tags": ["melee", "smash", "hammer", "heavy", "ground", "shockwave", "debris", "combat", "directional", "one-shot"]}, {"size": [208, 112]}, {"origin": [80, 92]}, {"duration": 2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#141834", "#242c5c", "#38479a", "#5a72d0", "#8fa8f0", "#c4d4ff", "#eef3ff", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "hammer"}, {"two": true}, {"sa": 0.62}, {"fx": 11}, {"fy": _S.unary("-", 21)}, {"crouch": 3}]))
	_S.define(_e, "TOP", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 0}, {"lean": _S.unary("-", 3)}, {"fx": 3}, {"fy": _S.unary("-", 41)}, {"sa": _S.unary("-", 2.1)}, {"ffx": 8}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 5)}, {"toeB": true}]))
	_S.define(_e, "SLAM", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 1)}, {"crouch": 7}, {"lean": 6}, {"fx": 14}, {"fy": _S.unary("-", 19)}, {"sa": 0.62}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 66}])}, {"poses": [[_S.unary("-", 0.72), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.44), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 5}, {"lean": _S.unary("-", 1)}, {"fx": 16}, {"fy": _S.unary("-", 28)}, {"sa": _S.unary("-", 0.9)}])], [_S.unary("-", 0.2), _S.read(_e, "TOP")], [_S.unary("-", 0.03), _S.merge([_S.read(_e, "TOP"), {"y": _S.unary("-", 2)}])], [0.06, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 3)}, {"crouch": _S.unary("-", 1)}, {"lean": 2}, {"fx": 13}, {"fy": _S.unary("-", 41)}, {"sa": _S.unary("-", 1.2)}, {"ffx": 11}, {"ffy": _S.unary("-", 8)}, {"ghost": 1}]), "snap"], [0.11, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 1)}, {"crouch": 3}, {"lean": 5}, {"fx": 19}, {"fy": _S.unary("-", 30)}, {"sa": _S.unary("-", 0.15)}, {"ffx": 13}, {"ghost": 1}]), "snap"], [0.15, _S.read(_e, "SLAM"), "snap"], [0.62, _S.merge([_S.read(_e, "SLAM"), {"crouch": 6}, {"lean": 5}])], [1.02, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 2)}, {"crouch": 5}, {"lean": 2}, {"fx": 14}, {"fy": _S.unary("-", 24)}, {"sa": 0.3}])], [1.4, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": 0.15}, {"stop": 0.2}, {"shake": 0.34}, {"amp": 3}, {"push": 3}, {"straw": 26}, {"y": _S.unary("-", 8)}])]}, {"dust": [_S.merge([{"t": 0.15}, {"x": 10}, {"n": 8}]), _S.merge([{"t": 0.15}, {"x": _S.unary("-", 12)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "HOT", _S.invoke(["#fff3a6", "#ffc23d", "#ff8a2a", "#c9281f"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DROP", 0.15)
	_S.define(_e, "head", _S.function_value(_e, "_f13"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "chips", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 5}, {"cy": _S.unary("-", 25)}, {"R": 32}, {"sy": 1}, {"rot": 0}, {"a0": _S.unary("-", 2.25)}, {"dir": 1}])]))
	_S.define(_e, "U1", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.prop(_S.read(_e, "A"), "R"), _S.read(_e, "U1")]), 1), _S.unary("-", 0.5)), func(): return _S.binary("<", _S.read(_e, "U1"), 4))):
		_S.write(_e, "U1", 0.005, "+=", false)
	_S.define(_e, "HW", 13)
	var _v0 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), _S.binary("/", _S.read(_e, "HW"), 2)), _S.read(_e, "U1")])
	_S.define(_e, "X", _S.prop(_v0, 0))
	_S.define(_e, "lines", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R"), _S.read(_e, "X"), 5, 24, 6, 0]))
	_S.define(_e, "rays", _S.invoke([_S.unary("-", 0.95), _S.unary("-", 0.6), _S.unary("-", 0.3), _S.unary("-", 0.05), 0.22, 0.5, 0.85], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "Rm", _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), _S.binary("/", _S.read(_e, "HW"), 2)))
	_S.define(_e, "wedge", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.read(_e, "d")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.06), 0.06]))}, {"L": _S.binary("*", (34 if _S.truth(_S.binary("===", _S.read(_e, "i"), 3)) else (26 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "i"), 2), func(): return _S.binary("===", _S.read(_e, "i"), 4))) else (18 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "i"), 1), func(): return _S.binary("===", _S.read(_e, "i"), 5))) else 12))), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.1]))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]))
	_S.define(_e, "U", _S.binary("*", _S.read(_e, "U1"), _S.read(_e, "h")))
	_S.define(_e, "after", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "DROP"), _S.binary("+", _S.read(_e, "DROP"), 0.07), _S.read(_e, "t")]))
	_S.define(_e, "lagU", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "U"), _S.binary("+", 0.3, _S.binary("*", 1.05, _S.read(_e, "h"))))]))
	_S.define(_e, "T", _S.binary("+", _S.read(_e, "lagU"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "lagU")), _S.read(_e, "after")), 0.8)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T")), 0.03), func(): return _S.binary(">=", _S.read(_e, "after"), 1))):
		return null
	_S.define(_e, "len", _S.binary("*", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T")), _S.read(_e, "Rm")))
	_S.call_value(_S.read(_e, "smear"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "T"), _S.read(_e, "U"), _S.binary("+", _S.read(_e, "HW"), 1), _S.function_value(_e, "_f4")])
	if _S.truth(_S.binary("<", _S.read(_e, "after"), 0.6)):
		for _v1 in _S.array([[_S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "HW")), 2), 2), 3, 26], [_S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "HW")), 2), 5), 9, 16], [_S.binary("+", _S.binary("/", _S.read(_e, "HW"), 2), 2), 2, 30], [_S.binary("+", _S.binary("/", _S.read(_e, "HW"), 2), 5), 8, 18], [_S.unary("-", 1), _S.binary("+", _S.read(_e, "len"), 2), 14], [3, _S.binary("+", _S.read(_e, "len"), 4), 9]]):
			var _v2 = _S.scope(_e)
			var _v3 = _v1
			_S.define(_v2, "dr", _S.prop(_v3, 0))
			_S.define(_v2, "l0", _S.prop(_v3, 1))
			_S.define(_v2, "L", _S.prop(_v3, 2))
			var _v4 = _S.scope(_v2)
			_S.define(_v4, "r", _S.binary("+", _S.read(_v4, "Rm"), _S.read(_v4, "dr")))
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "d", _S.read(_v5, "l0"))
			while _S.truth(_S.binary("<", _S.read(_v5, "d"), _S.binary("+", _S.read(_v5, "l0"), _S.binary("*", _S.read(_v5, "L"), _S.binary("-", 1, _S.read(_v5, "after")))))):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "u", _S.binary("-", _S.read(_v6, "U"), _S.binary("/", _S.read(_v6, "d"), _S.read(_v6, "r"))))
				_S.define(_v6, "k", _S.binary("/", _S.binary("-", _S.read(_v6, "d"), _S.read(_v6, "l0")), _S.read(_v6, "L")))
				if _S.truth(_S.binary("<", _S.read(_v6, "u"), 0)):
					break
				_S.invoke(_S.read(_v6, "p"), "dot", _S.concat([_S.array(_S.call_value(_S.read(_v6, "onSwing"), [_S.read(_v6, "A"), _S.read(_v6, "r"), _S.read(_v6, "u")])), [(_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v6, "k"), 0.25)) else (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v6, "k"), 0.6)) else _S.prop(_S.read(_v6, "C"), 4)))], [_S.binary("*", _S.binary("-", 1, _S.read(_v6, "k")), _S.binary("-", 1, _S.read(_v6, "after")))]]))
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "d", 0.5, "+=", false)
	var _v7 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.read(_e, "Rm"), _S.read(_e, "U")])
	_S.define(_e, "hx", _S.prop(_v7, 0))
	_S.define(_e, "hy", _S.prop(_v7, 1))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), 34, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.5, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "DROP"), 0.03), _S.read(_e, "DROP"), _S.read(_e, "t")])))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "lead", _S.binary("*", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "u")), _S.read(_e, "Rm")))
	_S.define(_e, "f", _S.binary("/", _S.read(_e, "lead"), _S.read(_e, "len")))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.read(_e, "HW"), (1 if _S.truth(_S.binary("<", _S.read(_e, "lead"), 3)) else _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "lead"), 3), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("-", _S.read(_e, "len"), 3)]))), 0.85]))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "after"), 0.5))))
	_S.define(_e, "off", _S.binary("/", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "Rm")), _S.binary("+", _S.binary("/", _S.read(_e, "w"), 2), 0.01)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "w"), 0.6), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "off")]), 1))):
		return null
	_S.define(_e, "ci", (0 if _S.truth(_S.binary("<", _S.read(_e, "lead"), 2)) else _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", 1, _S.binary("*", _S.read(_e, "f"), 3.4)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "off")]), 1.4)), (1 if _S.truth(_S.binary(">", _S.read(_e, "off"), 0.55)) else 0)), _S.binary("*", _S.read(_e, "after"), 3))])))
	if _S.truth(_S.binary(">", _S.read(_e, "ci"), _S.binary("-", _S.read(_e, "n"), 3))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "ci")]))), "=", false)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DROP")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "hit", true, "=", false)
		_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "X"), _S.unary("-", 5), 16, _S.read(_v8, "WHITE"), 0.35, 0.08])
		_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "X"), _S.unary("-", 10), 64, _S.prop(_S.read(_v8, "C"), 4), 0.42, 0.6])
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 15)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "s", _S.invoke(_S.read(_v10, "R"), "sign", []))
			_S.invoke(_S.read(_v10, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v10, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "s"), _S.invoke(_S.read(_v10, "R"), "range", [0, 5])))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.read(_v10, "s"), _S.invoke(_S.read(_v10, "R"), "range", [20, 105]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [110, 300]))}, {"g": 1}, {"drag": 0.35}, {"bounce": 0.38}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [1.25, 1.65])}, {"a": _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")])}, {"va": _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v10, "R"), "pick", [[1, 1, 2, 2, 3]])}])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v11 = _S.scope(_v8)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 11)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [90, 230]))
			_S.invoke(_S.read(_v12, "chips"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v12, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v12, "X"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 4), 4]))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp"))}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v12, "R"), "range", [0.9, 1.5])}, {"s": 1}])])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v8)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 40)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [50, 210]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "GRIT"), _S.binary("+", _S.read(_v14, "X"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "R"), "range", [0.9, 1.5]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "st"), "light"), _S.prop(_S.read(_v14, "st"), "body"), _S.prop(_S.read(_v14, "st"), "body"), _S.prop(_S.read(_v14, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.4])) else 1)])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v8)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 14)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v16, "i"), 2)) else 1))
			_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "MOTE"), _S.binary("+", _S.read(_v16, "X"), _S.binary("*", _S.read(_v16, "s"), 6)), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "sp")), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [0, 30])), _S.invoke(_S.read(_v16, "R"), "range", [0.18, 0.34]), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 5)), 0.8, _S.invoke(_S.read(_v16, "R"), "range", [0.02, 0.05])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v8)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 24)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v18, "Math"), "PI")), 2), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v18, "sp", _S.invoke(_S.read(_v18, "R"), "range", [150, 380]))
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SPARK"), _S.binary("+", _S.read(_v18, "X"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), 6)), _S.binary("+", _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), 30), _S.invoke(_S.read(_v18, "R"), "range", [0.12, 0.42]), 0, 1, _S.invoke(_S.read(_v18, "R"), "range", [0.035, 0.08])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
		var _v19 = _S.scope(_v8)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 20)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v20, "i"), 2)) else 1))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SMOKE"), _S.binary("+", _S.read(_v20, "X"), _S.binary("*", _S.read(_v20, "s"), _S.invoke(_S.read(_v20, "R"), "range", [2, 10]))), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 7])), _S.binary("*", _S.read(_v20, "s"), _S.invoke(_S.read(_v20, "R"), "range", [40, 125])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 14])), _S.invoke(_S.read(_v20, "R"), "range", [0.95, 1.5]), _S.prop(_S.read(_v20, "st"), "dust"), _S.invoke(_S.read(_v20, "R"), "range", [6, 9]), _S.invoke(_S.read(_v20, "R"), "range", [0.02, 0.08]), _S.prop(_S.read(_v20, "PF"), "BIG")])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v8)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 7)):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "SMOKE"), _S.binary("+", _S.read(_v21, "X"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [3, 9])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 80])), _S.invoke(_S.read(_v21, "R"), "range", [1, 1.4]), _S.prop(_S.read(_v21, "st"), "dust"), _S.invoke(_S.read(_v21, "R"), "range", [5, 7.5]), _S.invoke(_S.read(_v21, "R"), "range", [0.04, 0.14]), _S.prop(_S.read(_v21, "PF"), "BIG")])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v22 = _S.scope(_v8)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 8)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "DUST"), _S.binary("+", _S.read(_v22, "X"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [1, 4])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [8, 30])), _S.invoke(_S.read(_v22, "R"), "range", [0.35, 0.7]), _S.prop(_S.read(_v22, "st"), "dust"), _S.invoke(_S.read(_v22, "R"), "range", [2, 3.5])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "chips"), "update", [_S.read(_e, "dt")])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "hit"), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DROP"), 0.4))), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DROP"), 1.2))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08]))):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _S.invoke(_S.read(_v23, "R"), "pick", [_S.prop(_S.read(_v23, "bits"), "list")]))
		if _S.truth(_S.logical("&&", _S.read(_v23, "b"), func(): return _S.prop(_S.read(_v23, "b"), "rest"))):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v23, "b"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v23, "b"), "y"), 1.5), _S.prop(_S.read(_v23, "b"), "s")), 0, _S.unary("-", 2), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v23, "HOT"), 0) if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else _S.read(_v23, "WHITE")), _S.invoke(_S.read(_v23, "R"), "range", [0.6, 1.6])])
	for _v24 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "b", _v24)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v25, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v25, "b"), "dusted")))):
			var _v26 = _S.scope(_v25)
			_S.set_prop(_S.read(_v26, "b"), "dusted", true, "=", false)
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v27, "i"), 3)):
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v27, "b"), "x"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v27, "R"), "sign", []), _S.invoke(_S.read(_v27, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [2, 14])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v27, "st"), "dust"), _S.invoke(_S.read(_v27, "R"), "range", [1.3, 2.6])])
				_v27 = _S.iteration(_v27)
				_S.write(_v27, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "DROP")))
	if _S.truth(_S.binary(">=", _S.read(_e, "q"), 0)):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v28, "smooth"), [1.3, 1.7, _S.read(_v28, "q")])))
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "x", _S.unary("-", 11))
		while _S.truth(_S.binary("<=", _S.read(_v29, "x"), 11)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "u", _S.binary("/", _S.read(_v30, "x"), 10))
			_S.define(_v30, "d", (0 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 10)) else _S.invoke(_S.read(_v30, "Math"), "round", [_S.binary("+", _S.binary("*", 3.2, _S.binary("-", 1, _S.binary("*", _S.read(_v30, "u"), _S.read(_v30, "u")))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "x"), 4]), 0.5), 0.8))])))
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "y", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "y"), _S.read(_v31, "d"))):
				_S.invoke(_S.read(_v31, "p"), "dot", [_S.binary("+", _S.read(_v31, "X"), _S.read(_v31, "x")), _S.read(_v31, "y"), (_S.read(_v31, "SOOT") if _S.truth(_S.binary("===", _S.read(_v31, "y"), 0)) else _S.prop(_S.read(_v31, "st"), "dark")), _S.read(_v31, "fade")])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "y", 1, "+=", true)
			if _S.truth(_S.binary(">", _S.read(_v30, "d"), 0)):
				_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("+", _S.read(_v30, "X"), _S.read(_v30, "x")), _S.read(_v30, "d"), (_S.prop(_S.read(_v30, "st"), "light") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 7)) else _S.prop(_S.read(_v30, "st"), "body")), _S.read(_v30, "fade")])
			if _S.truth(_S.binary(">=", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 8)):
				_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("+", _S.read(_v30, "X"), _S.read(_v30, "x")), _S.unary("-", 1), (_S.prop(_S.read(_v30, "st"), "body") if _S.truth(_S.binary(">=", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 10)) else _S.prop(_S.read(_v30, "st"), "light")), _S.read(_v30, "fade")])
			if _S.truth(_S.logical("&&", _S.binary("===", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 9), func(): return _S.binary("<", _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "x"), 7]), 0.7))):
				_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("+", _S.read(_v30, "X"), _S.read(_v30, "x")), _S.unary("-", 2), _S.prop(_S.read(_v30, "st"), "body"), _S.read(_v30, "fade")])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "x", 1, "+=", true)
		_S.define(_v28, "k", _S.binary("/", _S.read(_v28, "q"), 0.5))
		if _S.truth(_S.binary("<", _S.read(_v28, "k"), 1)):
			_S.call_value(_S.read(_v28, "band"), [_S.read(_v28, "p"), _S.read(_v28, "X"), 0.5, _S.binary("+", 6, _S.binary("*", 50, _S.invoke(_S.read(_v28, "ease"), "outCubic", [_S.read(_v28, "k")]))), 0.16, _S.invoke(_S.read(_v28, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v28, "k")))]), _S.binary("-", 1.15, _S.read(_v28, "k")), [_S.prop(_S.read(_v28, "st"), "body"), _S.prop(_S.read(_v28, "C"), 3), _S.prop(_S.read(_v28, "C"), 5), _S.prop(_S.read(_v28, "C"), 7)], _S.function_value(_v28, "_f7")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "DROP")))
	_S.call_value(_S.read(_e, "wedge"), [_S.read(_e, "p")])
	if _S.truth(_S.binary(">=", _S.read(_e, "q"), 0)):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v32, "smooth"), [1.3, 1.7, _S.read(_v32, "q")])))
		for _v33 in _S.array(_S.read(_v32, "lines")):
			var _v34 = _S.scope(_v32)
			_S.define(_v34, "c", _v33)
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "reach", _S.binary("*", _S.binary("*", 30, _S.invoke(_S.read(_v35, "ease"), "outCubic", [_S.call_value(_S.read(_v35, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v35, "q"), _S.binary("*", _S.prop(_S.read(_v35, "c"), "at"), 0.06)), 0.08)])])), (0.3 if _S.truth(_S.prop(_S.read(_v35, "c"), "fork")) else 1)))
			if _S.truth(_S.binary(">", _S.read(_v35, "reach"), 0)):
				_S.call_value(_S.read(_v35, "along"), [_S.prop(_S.read(_v35, "c"), "pts"), _S.read(_v35, "reach"), _S.function_value(_v35, "_f9")])
		_S.define(_v32, "k", _S.binary("/", _S.read(_v32, "q"), 0.5))
		if _S.truth(_S.binary("<", _S.read(_v32, "k"), 1)):
			_S.call_value(_S.read(_v32, "band"), [_S.read(_v32, "p"), _S.read(_v32, "X"), 0.5, _S.binary("+", 6, _S.binary("*", 50, _S.invoke(_S.read(_v32, "ease"), "outCubic", [_S.read(_v32, "k")]))), 0.16, _S.invoke(_S.read(_v32, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v32, "k")))]), _S.binary("-", 1.15, _S.read(_v32, "k")), [_S.prop(_S.read(_v32, "st"), "body"), _S.prop(_S.read(_v32, "C"), 3), _S.prop(_S.read(_v32, "C"), 5), _S.prop(_S.read(_v32, "C"), 7)], _S.function_value(_v32, "_f10")])
		_S.define(_v32, "d", _S.binary("/", _S.binary("-", _S.read(_v32, "q"), 0.045), 0.4))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v32, "d"), 0), func(): return _S.binary("<", _S.read(_v32, "d"), 1))):
			var _v36 = _S.scope(_v32)
			_S.define(_v36, "r", _S.binary("+", 12, _S.binary("*", 30, _S.invoke(_S.read(_v36, "ease"), "outCubic", [_S.read(_v36, "d")]))))
			_S.define(_v36, "th", _S.invoke(_S.read(_v36, "Math"), "max", [1, _S.binary("*", 3.6, _S.invoke(_S.read(_v36, "Math"), "pow", [_S.binary("-", 1, _S.read(_v36, "d")), 0.8]))]))
			_S.define(_v36, "a", (1 if _S.truth(_S.binary("<", _S.read(_v36, "d"), 0.6)) else _S.binary("/", _S.binary("-", 1, _S.read(_v36, "d")), 0.4)))
			_S.invoke(_S.read(_v36, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_v36, "X"), _S.read(_v36, "r")), 1), _S.binary("-", _S.unary("-", _S.read(_v36, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_v36, "X"), _S.read(_v36, "r")), 1), 0, _S.function_value(_v36, "_f11")])
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v37, "i"), 7)):
				var _v38 = _S.scope(_v37)
				_S.define(_v38, "g", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v38, "Math"), "PI")), _S.binary("+", 0.08, _S.binary("*", _S.binary("/", _S.read(_v38, "i"), 6), 0.84))))
				_S.invoke(_S.read(_v38, "p"), "glow", [_S.binary("+", _S.read(_v38, "X"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "g")]), _S.read(_v38, "r"))), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "g")]), _S.read(_v38, "r")), 14, _S.prop(_S.read(_v38, "C"), 4), _S.binary("*", 0.36, _S.binary("-", 1, _S.read(_v38, "d")))])
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "i", 1, "+=", true)
		if _S.truth(_S.binary("<", _S.read(_v32, "q"), 0.2)):
			for _v39 in _S.array(_S.read(_v32, "rays")):
				var _v40 = _S.scope(_v32)
				_S.define(_v40, "ry", _v39)
				var _v41 = _S.scope(_v40)
				_S.define(_v41, "d1", _S.binary("*", _S.prop(_S.read(_v41, "ry"), "L"), _S.invoke(_S.read(_v41, "ease"), "outCubic", [_S.invoke(_S.read(_v41, "Math"), "min", [1, _S.binary("/", _S.read(_v41, "q"), 0.05)])])))
				_S.define(_v41, "d0", _S.binary("*", _S.prop(_S.read(_v41, "ry"), "L"), _S.call_value(_S.read(_v41, "smooth"), [0.04, 0.2, _S.read(_v41, "q")])))
				_S.define(_v41, "ca", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.prop(_S.read(_v41, "ry"), "a")]))
				_S.define(_v41, "sa", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.prop(_S.read(_v41, "ry"), "a")]))
				if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v41, "d1"), _S.read(_v41, "d0")), 1)):
					continue
				_S.invoke(_S.read(_v41, "p"), "line", [_S.binary("+", _S.read(_v41, "X"), _S.binary("*", _S.read(_v41, "ca"), _S.binary("+", 2, _S.read(_v41, "d0")))), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_v41, "sa"), _S.binary("+", 2, _S.read(_v41, "d0")))), _S.binary("+", _S.read(_v41, "X"), _S.binary("*", _S.read(_v41, "ca"), _S.read(_v41, "d1"))), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_v41, "sa"), _S.read(_v41, "d1"))), _S.function_value(_v41, "_f12")])
				_S.invoke(_S.read(_v41, "p"), "glowLine", [_S.binary("+", _S.read(_v41, "X"), _S.binary("*", _S.read(_v41, "ca"), _S.read(_v41, "d0"))), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_v41, "sa"), _S.read(_v41, "d0"))), _S.binary("+", _S.read(_v41, "X"), _S.binary("*", _S.read(_v41, "ca"), _S.read(_v41, "d1"))), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_v41, "sa"), _S.read(_v41, "d1"))), 4, _S.prop(_S.read(_v41, "C"), 5), _S.binary("*", 0.18, _S.binary("-", 1, _S.binary("/", _S.read(_v41, "q"), 0.2)))])
		if _S.truth(_S.binary("<", _S.read(_v32, "q"), 0.07)):
			var _v42 = _S.scope(_v32)
			_S.define(_v42, "hot", _S.binary("<", _S.read(_v42, "q"), 0.035))
			_S.define(_v42, "rx", (16 if _S.truth(_S.read(_v42, "hot")) else 12))
			_S.define(_v42, "ry", (3 if _S.truth(_S.read(_v42, "hot")) else 2))
			_S.invoke(_S.read(_v42, "p"), "ellipse", [_S.read(_v42, "X"), 0, _S.binary("+", _S.read(_v42, "rx"), 2), _S.binary("+", _S.read(_v42, "ry"), 1), (_S.prop(_S.read(_v42, "C"), 6) if _S.truth(_S.read(_v42, "hot")) else _S.prop(_S.read(_v42, "C"), 5))])
			_S.invoke(_S.read(_v42, "p"), "ellipse", [_S.read(_v42, "X"), 0, _S.read(_v42, "rx"), _S.read(_v42, "ry"), (_S.read(_v42, "WHITE") if _S.truth(_S.read(_v42, "hot")) else _S.prop(_S.read(_v42, "C"), 7))])
		if _S.truth(_S.binary("<", _S.read(_v32, "q"), 0.2)):
			var _v43 = _S.scope(_v32)
			_S.define(_v43, "pop", _S.invoke(_S.read(_v43, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v43, "q")), 0.05)]))
			_S.invoke(_S.read(_v43, "p"), "glow", [_S.read(_v43, "X"), _S.unary("-", 5), 26, _S.prop(_S.read(_v43, "C"), 5), _S.binary("*", 0.3, _S.read(_v43, "pop"))])
		_S.invoke(_S.read(_v32, "p"), "glow", [_S.read(_v32, "X"), _S.unary("-", 1), 16, _S.prop(_S.read(_v32, "HOT"), 2), _S.binary("*", 0.28, _S.invoke(_S.read(_v32, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v32, "q")), 0.35)]))])
	for _v44 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v45 = _S.scope(_e)
		_S.define(_v45, "b", _v44)
		_S.call_value(_S.read(_v45, "rock"), [_S.read(_v45, "p"), _S.read(_v45, "b"), _S.read(_v45, "st")])
	for _v46 in _S.array(_S.prop(_S.read(_e, "chips"), "list")):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "b", _v46)
		var _v48 = _S.scope(_v47)
		_S.define(_v48, "k", _S.binary("/", _S.prop(_S.read(_v48, "b"), "life"), _S.prop(_S.read(_v48, "b"), "max")))
		_S.define(_v48, "c", (_S.prop(_S.read(_v48, "HOT"), 0) if _S.truth(_S.binary(">", _S.read(_v48, "k"), 0.7)) else (_S.prop(_S.read(_v48, "HOT"), 1) if _S.truth(_S.binary(">", _S.read(_v48, "k"), 0.45)) else (_S.prop(_S.read(_v48, "HOT"), 2) if _S.truth(_S.binary(">", _S.read(_v48, "k"), 0.25)) else _S.prop(_S.read(_v48, "HOT"), 3)))))
		_S.invoke(_S.read(_v48, "p"), "dot", [_S.prop(_S.read(_v48, "b"), "x"), _S.prop(_S.read(_v48, "b"), "y"), _S.read(_v48, "c"), _S.invoke(_S.read(_v48, "Math"), "min", [1, _S.binary("*", _S.read(_v48, "k"), 4)])])
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v48, "b"), "rest"))):
			_S.invoke(_S.read(_v48, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v48, "b"), "x"), _S.binary("*", _S.prop(_S.read(_v48, "b"), "vx"), 0.012)), _S.binary("-", _S.prop(_S.read(_v48, "b"), "y"), _S.binary("*", _S.prop(_S.read(_v48, "b"), "vy"), 0.012)), _S.prop(_S.read(_v48, "HOT"), 3), _S.invoke(_S.read(_v48, "Math"), "min", [1, _S.binary("*", _S.read(_v48, "k"), 4)])])
		_S.invoke(_S.read(_v48, "p"), "glow", [_S.prop(_S.read(_v48, "b"), "x"), _S.prop(_S.read(_v48, "b"), "y"), 4, _S.read(_v48, "c"), _S.binary("*", 0.35, _S.read(_v48, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	if _S.truth(_S.binary(">=", _S.read(_e, "q"), 0.12)):
		_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.binary("+", _S.read(_e, "y0"), 3), _S.read(_e, "x1"), _S.binary("+", _S.read(_e, "y1"), 3), _S.prop(_S.read(_e, "st"), "shade"), _S.read(_e, "fade")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.binary("+", _S.read(_e, "y0"), 2), _S.read(_e, "x1"), _S.binary("+", _S.read(_e, "y1"), 2), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.05)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.12)) else _S.read(_e, "SOOT"))), _S.read(_e, "fade")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "X")), _S.read(_e, "y")])))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "e"), 0), func(): return _S.binary(">", _S.read(_e, "e"), _S.read(_e, "th"))), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 0.5)))):
		return null
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "e"), _S.read(_e, "th")))
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.6)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.1)) else ((_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.45)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.34)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.67)) else _S.prop(_S.read(_e, "C"), 4)))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.8)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "x", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_e, "t"), 0.03), _S.binary("+", _S.read(_e, "DROP"), 0.03))]))
	return _S.binary("+", _S.binary("*", 0.28, _S.read(_e, "x")), _S.binary("*", _S.binary("*", 0.72, _S.read(_e, "x")), _S.read(_e, "x")))
