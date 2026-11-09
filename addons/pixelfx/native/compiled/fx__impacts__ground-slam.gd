@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/ground-slam.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "makeCracks", _S.import_value("fx/impacts/_lib.js", "makeCracks"))
	_S.define(_e, "drawCracks", _S.import_value("fx/impacts/_lib.js", "drawCracks"))
	_S.define(_e, "frontCrescent", _S.import_value("fx/impacts/_lib.js", "frontCrescent"))
	_S.define(_e, "rock", _S.import_value("fx/impacts/_lib.js", "rock"))
	_S.define(_e, "rockShape", _S.import_value("fx/impacts/_lib.js", "rockShape"))
	_S.define(_e, "SOOT", _S.import_value("fx/impacts/_lib.js", "SOOT"))
	_S.define(_e, "crater", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Ground slam"}, {"desc": "Something lands hard: the floor flashes and cracks, two crescent shock waves race out along it, a dust wave and a tall dust cloud rise, rocks erupt, bounce and settle."}, {"tags": ["impact", "ground", "slam", "shockwave", "quake", "rocks", "dust", "one-shot"]}, {"size": [288, 208]}, {"origin": [144, 164]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1712", "#5e2c1c", "#a4502a", "#e8893a", "#ffc764", "#fff0b4", "#ffffff"]}, {"stone": "#4a3f69"}, {"reach": 104}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WAVE", 0.6)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "st", _S.arg(_args, 1))
	_S.define(_e, "hot", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.unary("-", 12))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), 11)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "q", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("+", _S.read(_v1, "x"), 0.5)]), 12))
		_S.define(_v1, "dep", _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", 2.6, _S.binary("-", 1, _S.binary("*", _S.read(_v1, "q"), _S.read(_v1, "q"))))]))
		if _S.truth(_S.binary("<", _S.read(_v1, "q"), 0.84)):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "y", 0)
			while _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "dep"))):
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "SOOT"), _S.read(_v3, "k")])
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "y", 1, "+=", true)
			_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "dep"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v2, "hot"), 0.5)) else (_S.prop(_S.read(_v2, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v2, "hot"), 0.2)) else _S.prop(_S.read(_v2, "st"), "lip"))), _S.read(_v2, "k")])
		else:
			var _v4 = _S.scope(_v1)
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.unary("-", 1), (_S.prop(_S.read(_v4, "st"), "light") if _S.truth(_S.binary(">", _S.read(_v4, "q"), 0.93)) else _S.prop(_S.read(_v4, "st"), "lip")), _S.read(_v4, "k")])
			if _S.truth(_S.binary("<", _S.read(_v4, "q"), 0.9)):
				_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.unary("-", 2), _S.prop(_S.read(_v4, "st"), "light"), _S.binary("*", _S.read(_v4, "k"), 0.8)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "HOT", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)])
	_S.define(_e, "dustLit", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "st"), "dust"), _S.read(_e, "WHITE"), 0.2]))
	_S.define(_e, "cracks", _S.call_value(_S.read(_e, "makeCracks"), [_S.read(_e, "R"), 10, _S.merge([{"len": [22, 58]}, {"dive": 0.55}, {"maxY": 22}, {"forks": 0.7}, {"x0": [2, 9]}])]))
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "heat", _S.function_value(_e, "_f4"))
	_S.define(_e, "crest", _S.function_value(_e, "_f5"))
	_S.define(_e, "burst", [_S.merge([{"a": _S.unary("-", 0.07)}, {"len": _S.invoke(_S.read(_e, "R"), "range", [34, 40])}, {"w": 1.9}]), _S.merge([{"a": _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.07)}, {"len": _S.invoke(_S.read(_e, "R"), "range", [34, 40])}, {"w": 1.9}]), _S.merge([{"a": _S.binary("+", _S.unary("-", 0.42), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [15, 20])}, {"w": 1.5}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 0.42), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [15, 20])}, {"w": 1.5}]), _S.merge([{"a": _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.15), 0.15]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [18, 24])}, {"w": 1.7}]), _S.merge([{"a": _S.binary("+", _S.unary("-", 1.05), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.1), 0.1]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [10, 14])}, {"w": 1.2}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 1.05), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.1), 0.1]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [10, 14])}, {"w": 1.2}])])
	_S.define(_e, "embers", [])
	for _v5 in _S.array(_S.read(_e, "cracks")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "c", _v5)
		for _v7 in _S.array(_S.prop(_S.read(_v6, "c"), "pts")):
			var _v8 = _S.scope(_v6)
			var _v9 = _v7
			_S.define(_v8, "x", _S.prop(_v9, 0))
			_S.define(_v8, "y", _S.prop(_v9, 1))
			_S.define(_v8, "d", _S.prop(_v9, 2))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v8, "d"), 3), func(): return _S.binary("<", _S.read(_v8, "d"), 32)), func(): return _S.invoke(_S.read(_v8, "R"), "chance", [0.25]))):
				_S.invoke(_S.read(_v8, "embers"), "push", [_S.merge([{"x": _S.read(_v8, "x")}, {"y": _S.read(_v8, "y")}, {"d": _S.read(_v8, "d")}, {"life": _S.invoke(_S.read(_v8, "R"), "range", [0.8, 2.2])}, {"ph": _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")])}])])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 12), 96, _S.prop(_S.read(_e, "C"), 4), 0.6, 0.6])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 50, _S.read(_e, "WHITE"), 0.9, 0.14])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 56)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "low", _S.binary("<", _S.read(_v11, "i"), 14))
		_S.define(_v11, "s", _S.invoke(_S.read(_v11, "R"), "sign", []))
		_S.define(_v11, "a", ((_S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [0.04, 0.6])) if _S.truth(_S.binary(">", _S.read(_v11, "s"), 0)) else _S.binary("+", _S.prop(_S.read(_v11, "Math"), "PI"), _S.invoke(_S.read(_v11, "R"), "range", [0.04, 0.6]))) if _S.truth(_S.read(_v11, "low")) else _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v11, "Math"), "PI")), 2), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 1.15), 1.15]))))
		_S.define(_v11, "sp", (_S.invoke(_S.read(_v11, "R"), "range", [150, 380]) if _S.truth(_S.read(_v11, "low")) else _S.invoke(_S.read(_v11, "R"), "range", [200, 500])))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), (_S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.5]) if _S.truth(_S.read(_v11, "low")) else _S.invoke(_S.read(_v11, "R"), "range", [0.25, 0.65])), _S.read(_v11, "WHITE"), 1, (0 if _S.truth(_S.read(_v11, "low")) else _S.invoke(_S.read(_v11, "R"), "range", [0, 0.05]))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 20)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "s", (4 if _S.truth(_S.binary("<", _S.read(_v13, "i"), 3)) else _S.invoke(_S.read(_v13, "R"), "int", [1, 3])))
		_S.define(_v13, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 0.5), 0.5])))
		_S.define(_v13, "sp", (_S.invoke(_S.read(_v13, "R"), "range", [110, 190]) if _S.truth(_S.binary(">", _S.read(_v13, "s"), 3)) else _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [170, 380]), (0.8 if _S.truth(_S.binary(">", _S.read(_v13, "s"), 2)) else 1))))
		_S.invoke(_S.read(_v13, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v13, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 7), 7])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp"))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.38}, {"life": _S.invoke(_S.read(_v13, "R"), "range", [1.9, 2.7])}, {"a": _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")])}, {"va": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.read(_v13, "s")}, {"pts": _S.call_value(_S.read(_v13, "rockShape"), [_S.read(_v13, "R")])}, {"pvy": 0}])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 110)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "u", _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.binary("*", _S.read(_v15, "u"), 0.65)))
		_S.define(_v15, "sp", _S.binary("*", _S.invoke(_S.read(_v15, "R"), "range", [110, 380]), _S.binary("-", 1, _S.binary("*", 0.35, _S.invoke(_S.read(_v15, "Math"), "abs", [_S.read(_v15, "u")])))))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "GRIT"), _S.binary("*", _S.read(_v15, "u"), 6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.invoke(_S.read(_v15, "R"), "range", [1, 2.2]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "st"), "light"), _S.prop(_S.read(_v15, "st"), "body"), _S.prop(_S.read(_v15, "st"), "body"), _S.prop(_S.read(_v15, "st"), "shade"), _S.prop(_S.read(_v15, "st"), "shade"), _S.prop(_S.read(_v15, "st"), "lip")]]), (2 if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.35])) else 1)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 28)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "core", _S.binary("<", _S.read(_v17, "i"), 14))
		_S.define(_v17, "s", _S.invoke(_S.read(_v17, "R"), "sign", []))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SMOKE"), (_S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 5), 5]) if _S.truth(_S.read(_v17, "core")) else _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [4, 12]))), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [2, 10])), (_S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 12), 12]) if _S.truth(_S.read(_v17, "core")) else _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [14, 38]))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [50, 130])), (1 if _S.truth(_S.read(_v17, "core")) else _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.6]))), _S.invoke(_S.read(_v17, "R"), "range", [1.9, 2.7]), (_S.read(_v17, "dustLit") if _S.truth(_S.invoke(_S.read(_v17, "R"), "chance", [0.35])) else _S.prop(_S.read(_v17, "st"), "dust")), (_S.invoke(_S.read(_v17, "R"), "range", [4.5, 9]) if _S.truth(_S.read(_v17, "core")) else _S.invoke(_S.read(_v17, "R"), "range", [4, 7.5])), _S.invoke(_S.read(_v17, "R"), "range", [0.02, 0.22]), _S.prop(_S.read(_v17, "PF"), "BIG")])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 10)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "s", _S.invoke(_S.read(_v19, "R"), "sign", []))
		_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SMOKE"), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [2, 14])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 6])), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [20, 70])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [4, 20])), _S.invoke(_S.read(_v19, "R"), "range", [1.4, 2.3]), _S.prop(_S.read(_v19, "st"), "dust"), _S.invoke(_S.read(_v19, "R"), "range", [6, 9]), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.08]), _S.prop(_S.read(_v19, "PF"), "BIG")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 26)):
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "FLAKE"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 22), 22]), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [14, 80])), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 10), 4]), _S.invoke(_S.read(_v20, "R"), "range", [1.2, 2]), (_S.prop(_S.read(_v20, "st"), "lip") if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.read(_v20, "dustLit")), _S.invoke(_S.read(_v20, "R"), "range", [0.5, 1.2]), _S.invoke(_S.read(_v20, "R"), "range", [0.25, 1])])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", [_S.invoke(_S.read(_e, "R"), "next", []), _S.invoke(_S.read(_e, "R"), "next", [])])
	_S.define(_e, "ring", _S.function_value(_e, "_f6"))
	_S.define(_e, "fronts", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f10")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 7, _S.binary("*", _S.binary("-", _S.read(_e, "REACH"), 7), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.015), _S.read(_e, "WAVE"))])])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.8))]), 1.4])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return [_S.binary("+", 6, _S.binary("*", 28, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.75]))), _S.binary("+", 1.5, _S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.9])))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.015), _S.binary("+", _S.read(_e, "WAVE"), 0.1))]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), 0.015), func(): return _S.binary(">=", _S.read(_e, "u"), 0.9))):
		return null
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("+", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]), 1), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 4, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.8]))]), (1.1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else _S.binary("/", _S.binary("-", 0.9, _S.read(_e, "u")), 0.35)), ([_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)] if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.35)) else [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)]), _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "t"), 0.09)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "back"))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.03), _S.binary("+", _S.read(_e, "WAVE"), 0.16))]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), 0.03), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	var _v21 = _S.call_value(_S.read(_e, "crest"), [_S.read(_e, "u")])
	_S.define(_e, "h", _S.prop(_v21, 0))
	_S.define(_e, "w", _S.prop(_v21, 1))
	_S.define(_e, "k", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "u")), 0.3)))
	_S.define(_e, "cols", ([_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)] if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.14)) else ([_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)] if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.34)) else ([_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "st"), "lip")] if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else [_S.prop(_S.read(_e, "st"), "lip"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "st"), "dust")]))))
	for _v22 in _S.array([_S.unary("-", 1), 1]):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "s", _v22)
		var _v24 = _S.scope(_v23)
		_S.call_value(_S.read(_v24, "frontCrescent"), [_S.read(_v24, "p"), _S.binary("*", _S.read(_v24, "s"), _S.read(_v24, "fr")), _S.read(_v24, "s"), _S.read(_v24, "h"), _S.read(_v24, "w"), _S.read(_v24, "cols"), _S.read(_v24, "k")])
		_S.invoke(_S.read(_v24, "p"), "glow", [_S.binary("*", _S.read(_v24, "s"), _S.read(_v24, "fr")), _S.binary("*", _S.unary("-", _S.read(_v24, "h")), 0.3), _S.binary("+", 8, _S.binary("*", _S.read(_v24, "h"), 0.7)), _S.prop(_S.read(_v24, "C"), 4), _S.binary("*", _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v24, "u"))), _S.read(_v24, "k"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.015), _S.read(_e, "WAVE"))]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "fr", _S.call_value(_S.read(_v25, "front"), [_S.read(_v25, "t")]))
		var _v26 = _S.call_value(_S.read(_v25, "crest"), [_S.read(_v25, "u")])
		_S.define(_v25, "h", _S.prop(_v26, 0))
		var _v27 = _S.scope(_v25)
		_S.define(_v27, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "k"), 2)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "s", (1 if _S.truth(_S.read(_v28, "k")) else _S.unary("-", 1)))
			var _v29 = _S.scope(_v28)
			_S.set_prop(_S.read(_v29, "acc"), _S.read(_v29, "k"), _S.binary("*", _S.binary("*", _S.read(_v29, "dt"), 120), _S.binary("-", 1, _S.binary("*", _S.read(_v29, "u"), 0.7))), "+=", false)
			while _S.truth(_S.binary(">", _S.prop(_S.read(_v29, "acc"), _S.read(_v29, "k")), 1)):
				var _v30 = _S.scope(_v29)
				_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SMOKE"), _S.binary("*", _S.read(_v30, "s"), _S.binary("-", _S.read(_v30, "fr"), _S.invoke(_S.read(_v30, "R"), "range", [1, 7]))), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0.5, 3])), _S.binary("*", _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [15, 70])), _S.binary("-", 1, _S.read(_v30, "u"))), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 12])), _S.invoke(_S.read(_v30, "R"), "range", [1, 2.1]), (_S.read(_v30, "dustLit") if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.3])) else _S.prop(_S.read(_v30, "st"), "dust")), _S.binary("*", _S.invoke(_S.read(_v30, "R"), "range", [2.5, 6.5]), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v30, "u")))), 0, _S.prop(_S.read(_v30, "PF"), "BIG")])
				if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])):
					_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "DUST"), _S.binary("*", _S.read(_v30, "s"), _S.binary("-", _S.read(_v30, "fr"), _S.invoke(_S.read(_v30, "R"), "range", [0, 3]))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0.3, 0.9])), _S.read(_v30, "h")), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 15), 25])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [8, 35])), _S.invoke(_S.read(_v30, "R"), "range", [0.3, 0.6]), (_S.read(_v30, "dustLit") if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "st"), "dust")), _S.invoke(_S.read(_v30, "R"), "range", [1.2, 2.4])])
				if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.4])):
					_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "GRIT"), _S.binary("*", _S.read(_v30, "s"), _S.read(_v30, "fr")), _S.unary("-", 1), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [10, 60])), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [40, 140])), _S.binary("-", 1, _S.read(_v30, "u"))), _S.invoke(_S.read(_v30, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v30, "R"), "pick", [[_S.prop(_S.read(_v30, "st"), "light"), _S.prop(_S.read(_v30, "st"), "body"), _S.prop(_S.read(_v30, "st"), "lip")]]), 1])
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v30, "u"), 0.45), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [0.2]))):
					_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SPARK"), _S.binary("*", _S.read(_v30, "s"), _S.read(_v30, "fr")), _S.unary("-", 1), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [60, 200])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [30, 160])), _S.invoke(_S.read(_v30, "R"), "range", [0.12, 0.3])])
				_v29 = _S.iteration(_v29)
				_S.set_prop(_S.read(_v29, "acc"), _S.read(_v29, "k"), 1, "-=", true)
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "k", 1, "+=", true)
	for _v31 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "b", _v31)
		_S.set_prop(_S.read(_v32, "b"), "pvy", _S.prop(_S.read(_v32, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v33 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "b", _v33)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v34, "b"), "pvy"), 70), func(): return _S.binary("<=", _S.prop(_S.read(_v34, "b"), "vy"), 0))):
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "n", (3 if _S.truth(_S.binary(">", _S.prop(_S.read(_v35, "b"), "pvy"), 200)) else 2))
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v36, "i"), _S.read(_v36, "n"))):
				_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v36, "b"), "x"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v36, "R"), "sign", []), _S.invoke(_S.read(_v36, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [2, 16])), _S.invoke(_S.read(_v36, "R"), "range", [0.3, 0.65]), _S.prop(_S.read(_v36, "st"), "dust"), _S.binary("*", _S.invoke(_S.read(_v36, "R"), "range", [1.3, 2.4]), _S.binary("+", 0.7, _S.binary("*", _S.prop(_S.read(_v36, "b"), "s"), 0.25)))])
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "i", 1, "+=", true)
			_S.set_prop(_S.read(_v35, "b"), "pvy", 0, "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "D"), 0.9), _S.binary("-", _S.read(_e, "D"), 0.15), _S.read(_e, "t")])))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "t"), 0.02)):
		_S.call_value(_S.read(_e, "crater"), [_S.read(_e, "p"), _S.read(_e, "st"), _S.read(_e, "H"), _S.read(_e, "C"), _S.read(_e, "fade")])
	_S.call_value(_S.read(_e, "drawCracks"), [_S.read(_e, "p"), _S.read(_e, "cracks"), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12"), _S.read(_e, "HOT"), _S.read(_e, "SOOT"), _S.prop(_S.read(_e, "st"), "light"), _S.read(_e, "fade")])
	for _v37 in _S.array(_S.read(_e, "embers")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "e", _v37)
		var _v39 = _S.scope(_v38)
		_S.define(_v39, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v39, "t"), 0.1), _S.prop(_S.read(_v39, "e"), "life"))))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v39, "t"), 0.1), func(): return _S.binary("<=", _S.read(_v39, "k"), 0))):
			continue
		_S.define(_v39, "f", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v39, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v39, "t"), 23), _S.prop(_S.read(_v39, "e"), "ph"))]))))
		_S.invoke(_S.read(_v39, "p"), "px", [_S.prop(_S.read(_v39, "e"), "x"), _S.prop(_S.read(_v39, "e"), "y"), (_S.prop(_S.read(_v39, "C"), 5) if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v39, "k"), _S.read(_v39, "f")), 0.55)) else (_S.prop(_S.read(_v39, "C"), 4) if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v39, "k"), _S.read(_v39, "f")), 0.25)) else _S.prop(_S.read(_v39, "C"), 3)))])
		_S.invoke(_S.read(_v39, "p"), "glow", [_S.prop(_S.read(_v39, "e"), "x"), _S.prop(_S.read(_v39, "e"), "y"), 4, _S.prop(_S.read(_v39, "C"), 4), _S.binary("*", _S.binary("*", 0.35, _S.read(_v39, "k")), _S.read(_v39, "f"))])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("*", _S.prop(_S.read(_e, "c"), "len"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "c"), "t0")), 0.1)])]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "H"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1.2, _S.binary("/", _S.read(_e, "d"), 40))]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "fronts"), [_S.read(_e, "p")])
	for _v40 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "b", _v40)
		_S.call_value(_S.read(_v41, "rock"), [_S.read(_v41, "p"), _S.read(_v41, "b"), _S.read(_v41, "st")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)):
		var _v42 = _S.scope(_e)
		_S.invoke(_S.read(_v42, "p"), "ellipse", [0, 0, 30, 4.5, _S.function_value(_v42, "_f14")])
		_S.call_value(_S.read(_v42, "star"), [_S.read(_v42, "p"), 0, _S.unary("-", 1), _S.read(_v42, "burst"), 1, 1, [_S.prop(_S.read(_v42, "C"), 4), _S.prop(_S.read(_v42, "C"), 6), _S.read(_v42, "WHITE"), _S.read(_v42, "WHITE")]])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), 0, _S.unary("-", 1), _S.read(_e, "burst"), 1.25, 0.5, [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")]])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.14)):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", 80), 0, 80, 0, 10, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.14)))])
	_S.define(_e, "H", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "H"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, 1, 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "H"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.8)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.5)) else _S.read(_e, "WHITE")))
