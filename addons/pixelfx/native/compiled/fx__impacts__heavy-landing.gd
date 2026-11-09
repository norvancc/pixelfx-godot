@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/heavy-landing.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "makeCracks", _S.import_value("fx/impacts/_lib.js", "makeCracks"))
	_S.define(_e, "drawCracks", _S.import_value("fx/impacts/_lib.js", "drawCracks"))
	_S.define(_e, "dustRing", _S.import_value("fx/impacts/_lib.js", "dustRing"))
	_S.define(_e, "rock", _S.import_value("fx/impacts/_lib.js", "rock"))
	_S.define(_e, "rockShape", _S.import_value("fx/impacts/_lib.js", "rockShape"))
	_S.define(_e, "SOOT", _S.import_value("fx/impacts/_lib.js", "SOOT"))
	_S.define(_e, "dent", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Heavy landing"}, {"desc": "A character lands hard: the floor dents and cracks under their feet, two rings of dust roll out along the floor one after the other, and pebbles hop away."}, {"tags": ["impact", "landing", "ground", "stomp", "dust", "rocks", "actor", "one-shot"]}, {"size": [176, 80]}, {"origin": [88, 60]}, {"duration": 1.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1c1a24", "#2f2a3a", "#4a4258", "#6b6280", "#9088a4", "#bdb6cc", "#e6e1ee"]}, {"stone": "#4a3f69"}, {"seed": 14}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FALL", _S.merge([{"turn": 0.8}, {"y": _S.unary("-", 46)}, {"crouch": _S.unary("-", 1)}, {"lean": _S.unary("-", 1)}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 42)}, {"bx": 10}, {"by": _S.unary("-", 42)}, {"ffx": 6}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 3)}, {"fby": _S.unary("-", 3)}, {"toeB": true}, {"ghost": 1}]))
	_S.define(_e, "HERO_", _S.merge([{"y": 0}, {"crouch": 8}, {"lean": 5}, {"fx": 13}, {"fy": _S.unary("-", 8)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.26), _S.read(_e, "FALL")], [_S.unary("-", 0.01), _S.merge([_S.read(_e, "FALL"), {"y": _S.unary("-", 6)}]), "in"], [0, _S.read(_e, "HERO_"), "snap"], [0.55, _S.merge([_S.read(_e, "HERO_"), {"crouch": 7}])], [0.95, _S.merge([_S.read(_e, "HERO_"), {"crouch": 5}, {"lean": 3}, {"fx": 13}, {"fy": _S.unary("-", 15)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 20)}])], [1.3, _S.read(_e, "READY")], [1.6, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.005}, {"stop": 0.13}, {"shake": 0.32}, {"amp": 3}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "st", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.unary("-", 10))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), 9)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "q", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("+", _S.read(_v1, "x"), 0.5)]), 10))
		_S.define(_v1, "dep", _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", 1.8, _S.binary("-", 1, _S.binary("*", _S.read(_v1, "q"), _S.read(_v1, "q"))))]))
		if _S.truth(_S.binary("<", _S.read(_v1, "q"), 0.82)):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "y", 0)
			while _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "dep"))):
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "SOOT"), _S.read(_v3, "k")])
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "y", 1, "+=", true)
			_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "dep"), _S.prop(_S.read(_v2, "st"), "lip"), _S.read(_v2, "k")])
		else:
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "x"), _S.unary("-", 1), (_S.prop(_S.read(_v1, "st"), "light") if _S.truth(_S.binary(">", _S.read(_v1, "q"), 0.92)) else _S.prop(_S.read(_v1, "st"), "lip")), _S.read(_v1, "k")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "back", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "front", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "cracks", _S.call_value(_S.read(_e, "makeCracks"), [_S.read(_e, "R"), 6, _S.merge([{"len": [8, 20]}, {"dive": 0.7}, {"maxY": 12}, {"forks": 0.4}, {"x0": [2, 6]}])]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "st"), "dust"), _S.prop(_S.read(_e, "C"), 5), 0.4]))
	_S.define(_e, "LIT", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "DUST"), _S.read(_e, "WHITE"), 0.3]))
	_S.define(_e, "PH", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "ring", _S.function_value(_e, "_f3"))
	_S.call_value(_S.read(_e, "ring"), [20, 140, 190, [2.2, 3.4], 0.01])
	_S.call_value(_S.read(_e, "ring"), [18, 70, 110, [3.4, 5.4], 0.12])
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 12)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "s", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.define(_v7, "up", _S.binary("<", _S.read(_v7, "i"), 6))
		_S.invoke((_S.read(_v7, "front") if _S.truth(_S.binary("%", _S.read(_v7, "i"), 2)) else _S.read(_v7, "back")), "spawn", [_S.prop(_S.read(_v7, "P"), "DUST"), _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [2, 10])), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [1, 4])), _S.binary("*", _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [10, 35])), (0.6 if _S.truth(_S.read(_v7, "up")) else 1)), _S.unary("-", (_S.invoke(_S.read(_v7, "R"), "range", [25, 60]) if _S.truth(_S.read(_v7, "up")) else _S.invoke(_S.read(_v7, "R"), "range", [4, 12]))), _S.invoke(_S.read(_v7, "R"), "range", [0.55, 0.9]), (_S.read(_v7, "LIT") if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.5])) else _S.read(_v7, "DUST")), _S.invoke(_S.read(_v7, "R"), "range", [3, 5]), _S.invoke(_S.read(_v7, "R"), "range", [0.02, 0.1])])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 12)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "s", _S.invoke(_S.read(_v9, "R"), "sign", []))
		_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [50, 130]))
		_S.invoke(_S.read(_v9, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v9, "B"), "CHUNK")}, {"x": _S.binary("*", _S.read(_v9, "s"), _S.invoke(_S.read(_v9, "R"), "range", [3, 8]))}, {"y": _S.unary("-", 1)}, {"vx": _S.binary("*", _S.read(_v9, "s"), _S.read(_v9, "v"))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [140, 230]))}, {"g": 1}, {"drag": 0.5}, {"bounce": 0.55}, {"life": _S.invoke(_S.read(_v9, "R"), "range", [1, 1.45])}, {"a": _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")])}, {"va": _S.binary("*", _S.read(_v9, "s"), _S.invoke(_S.read(_v9, "R"), "range", [8, 16]))}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.3])) else 1)}, {"pts": _S.call_value(_S.read(_v9, "rockShape"), [_S.read(_v9, "R")])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 24)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "s", _S.invoke(_S.read(_v11, "R"), "sign", []))
		_S.define(_v11, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v11, "Math"), "PI")), 2), _S.binary("*", _S.read(_v11, "s"), _S.invoke(_S.read(_v11, "R"), "range", [0.3, 1.2]))))
		_S.define(_v11, "v", _S.invoke(_S.read(_v11, "R"), "range", [60, 170]))
		_S.invoke(_S.read(_v11, "front"), "spawn", [_S.prop(_S.read(_v11, "P"), "GRIT"), _S.binary("*", _S.read(_v11, "s"), _S.invoke(_S.read(_v11, "R"), "range", [2, 7])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.invoke(_S.read(_v11, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "st"), "light"), _S.prop(_S.read(_v11, "st"), "body"), _S.prop(_S.read(_v11, "st"), "lip")]]), (2 if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.3])) else 1)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "rings", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "v0", _S.arg(_args, 1))
	_S.define(_e, "v1", _S.arg(_args, 2))
	_S.define(_e, "size", _S.arg(_args, 3))
	_S.define(_e, "delay", _S.arg(_args, 4))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.read(_v4, "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "g", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v5, "i"), _S.read(_v5, "n")), _S.read(_v5, "TAU")), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 0.1), 0.1])))
		_S.define(_v5, "v", _S.invoke(_S.read(_v5, "R"), "range", [_S.read(_v5, "v0"), _S.read(_v5, "v1")]))
		_S.define(_v5, "far", _S.binary("<", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), 0))
		_S.invoke((_S.read(_v5, "back") if _S.truth(_S.read(_v5, "far")) else _S.read(_v5, "front")), "spawn", [_S.prop(_S.read(_v5, "P"), "DUST"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "g")]), 4), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), 0.7), 1), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "g")]), _S.read(_v5, "v")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), _S.read(_v5, "v")), 0.16), _S.invoke(_S.read(_v5, "R"), "range", [2, 10])), _S.invoke(_S.read(_v5, "R"), "range", [0.45, 0.8]), (_S.read(_v5, "LIT") if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.45])) else _S.read(_v5, "DUST")), _S.invoke(_S.read(_v5, "R"), "range", [_S.prop(_S.read(_v5, "size"), 0), _S.prop(_S.read(_v5, "size"), 1)]), _S.binary("+", _S.read(_v5, "delay"), _S.invoke(_S.read(_v5, "R"), "range", [0, 0.03]))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "far", _S.arg(_args, 1))
	for _v12 in _S.array([[0.01, 0.45, 58, 4.5, 0.75, 1], [0.12, 0.85, 42, 6, 0.8, 0]]):
		var _v13 = _S.scope(_e)
		var _v14 = _v12
		_S.define(_v13, "t0", _S.prop(_v14, 0))
		_S.define(_v13, "dur", _S.prop(_v14, 1))
		_S.define(_v13, "r1", _S.prop(_v14, 2))
		_S.define(_v13, "w", _S.prop(_v14, 3))
		_S.define(_v13, "k0", _S.prop(_v14, 4))
		_S.define(_v13, "edge", _S.prop(_v14, 5))
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "g", _S.binary("/", _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "t0")), _S.read(_v15, "dur")))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v15, "g"), 0), func(): return _S.binary(">=", _S.read(_v15, "g"), 1))):
			continue
		_S.define(_v15, "r", _S.binary("+", 6, _S.binary("*", _S.read(_v15, "r1"), _S.invoke(_S.read(_v15, "ease"), "outCubic", [_S.read(_v15, "g")]))))
		_S.call_value(_S.read(_v15, "dustRing"), [_S.read(_v15, "p"), 0, 0, _S.read(_v15, "r"), _S.binary("*", _S.read(_v15, "w"), _S.binary("+", 1, _S.read(_v15, "g"))), _S.binary("*", _S.binary("*", _S.read(_v15, "k0"), _S.invoke(_S.read(_v15, "Math"), "pow", [_S.binary("-", 1, _S.read(_v15, "g")), 1.2])), _S.invoke(_S.read(_v15, "Math"), "min", [1, _S.binary("/", _S.read(_v15, "g"), 0.06)])), _S.read(_v15, "DUST"), _S.merge([{"sy": 0.2}, {"ph": _S.binary("+", _S.read(_v15, "PH"), _S.binary("*", _S.read(_v15, "t0"), 10))}, {"brk": _S.binary("*", _S.read(_v15, "g"), 0.8)}, {"half": (_S.unary("-", 1) if _S.truth(_S.read(_v15, "far")) else 1)}])])
		if _S.truth(_S.logical("&&", _S.read(_v15, "edge"), func(): return _S.binary("<", _S.read(_v15, "g"), 0.75))):
			_S.call_value(_S.read(_v15, "band"), [_S.read(_v15, "p"), 0, 0.5, _S.binary("+", _S.read(_v15, "r"), 2), 0.2, _S.invoke(_S.read(_v15, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_v15, "g")))]), _S.binary("-", 1.1, _S.binary("/", _S.read(_v15, "g"), 0.75)), [_S.prop(_S.read(_v15, "st"), "body"), _S.prop(_S.read(_v15, "st"), "light"), _S.read(_v15, "LIT"), _S.read(_v15, "WHITE")], _S.function_value(_v15, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0), _S.read(_e, "far"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v16 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "b", _v16)
		_S.set_prop(_S.read(_v17, "b"), "pvy", _S.prop(_S.read(_v17, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v18 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "b", _v18)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v19, "b"), "pvy"), 80), func(): return _S.binary("<=", _S.prop(_S.read(_v19, "b"), "vy"), 0))):
			var _v20 = _S.scope(_v19)
			_S.invoke(_S.read(_v20, "front"), "spawn", [_S.prop(_S.read(_v20, "P"), "DUST"), _S.prop(_S.read(_v20, "b"), "x"), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "sign", []), _S.invoke(_S.read(_v20, "R"), "range", [6, 20])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 10])), _S.invoke(_S.read(_v20, "R"), "range", [0.25, 0.45]), _S.read(_v20, "DUST"), _S.invoke(_S.read(_v20, "R"), "range", [1, 1.8])])
			_S.set_prop(_S.read(_v20, "b"), "pvy", 0, "=", false)
	_S.invoke(_S.read(_e, "back"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "front"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "D"), 0.5), _S.binary("-", _S.read(_e, "D"), 0.1), _S.read(_e, "t")])))
	_S.call_value(_S.read(_e, "dent"), [_S.read(_e, "p"), _S.read(_e, "st"), _S.read(_e, "fade")])
	_S.call_value(_S.read(_e, "drawCracks"), [_S.read(_e, "p"), _S.read(_e, "cracks"), _S.function_value(_e, "_f8"), _S.function_value(_e, "_f9"), [_S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE")], _S.read(_e, "SOOT"), _S.prop(_S.read(_e, "st"), "light"), _S.read(_e, "fade")])
	_S.call_value(_S.read(_e, "rings"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "back"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("*", _S.prop(_S.read(_e, "c"), "len"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "c"), "t0")), 0.08)])]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "rings"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "front"), "draw", [_S.read(_e, "p")])
	for _v21 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "b", _v21)
		_S.call_value(_S.read(_v22, "rock"), [_S.read(_v22, "p"), _S.read(_v22, "b"), _S.read(_v22, "st")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)):
		_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0, 15, 2.5, _S.function_value(_e, "_f11")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
			var _v23 = _S.scope(_e)
			_S.define(_v23, "x", _S.unary("-", 22))
			while _S.truth(_S.binary("<=", _S.read(_v23, "x"), 22)):
				_S.invoke(_S.read(_v23, "p"), "dot", [_S.read(_v23, "x"), 0, (_S.read(_v23, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v23, "Math"), "abs", [_S.read(_v23, "x")]), 10)) else _S.prop(_S.read(_v23, "C"), 5)), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v23, "Math"), "abs", [_S.read(_v23, "x")]), 24))])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "x", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.12)):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", 20), 0, 20, 0, 8, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.12)))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.55)) else _S.prop(_S.read(_e, "C"), 6))
