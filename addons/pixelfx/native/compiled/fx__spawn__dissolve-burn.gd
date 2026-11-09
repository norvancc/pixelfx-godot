@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/dissolve-burn.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Dissolve burn"}, {"desc": "An ember seam lights at the feet and climbs the body: above it the body scorches and smoulders, at it flames lick up, below it there's only falling ash, embers and smoke."}, {"tags": ["spawn", "death", "burn", "fire", "ash", "dissolve", "embers", "one-shot"]}, {"size": [96, 112]}, {"origin": [48, 100]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0e08", "#5a1a0c", "#a8320f", "#e8601a", "#ff9a2e", "#ffd25a", "#fff3c0", "#ffffff"]}, {"ash": ["#2a2428", "#4a4248", "#6e6670"]}, {"seed": 16}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WRITHE", _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 35)}, {"bx": 13}, {"by": _S.unary("-", 26)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.16), _S.read(_e, "READY")], [0.4, _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 22)}, {"bx": 10}, {"by": _S.unary("-", 22)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.8, _S.read(_e, "WRITHE")], [1.2, _S.merge([_S.read(_e, "WRITHE"), {"lean": 2}, {"fy": _S.unary("-", 26)}, {"by": _S.unary("-", 36)}])], [1.6, _S.merge([_S.read(_e, "WRITHE"), {"lean": _S.unary("-", 2)}, {"fy": _S.unary("-", 36)}, {"by": _S.unary("-", 26)}])], [2.1, _S.merge([_S.read(_e, "WRITHE"), {"crouch": 5}, {"lean": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 38)}, {"bx": 9}, {"by": _S.unary("-", 38)}])], [3.6, _S.merge([_S.read(_e, "WRITHE"), {"crouch": 6}, {"lean": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 36)}, {"bx": 9}, {"by": _S.unary("-", 36)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "IGNITE", 0.15)
	_S.define(_e, "BURN", 1.9)
	_S.define(_e, "CHAR", [_S.call_value(_S.read(_e, "hex"), ["#100908"]), _S.call_value(_S.read(_e, "hex"), ["#22130e"]), _S.call_value(_S.read(_e, "hex"), ["#3a2016"])])
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f9"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "tongue", _S.function_value(_e, "_f1"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ash"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "cx", 0)
	for _v7 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "b", _v7)
		var _v9 = _S.scope(_v8)
		_S.set_prop(_S.read(_v9, "b"), "key", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("/", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v9, "body"), "h"), 1), _S.prop(_S.read(_v9, "b"), "my")), _S.read(_v9, "H")), _S.binary("*", 0.08, _S.binary("-", _S.call_value(_S.read(_v9, "rand"), [_S.prop(_S.read(_v9, "b"), "mx"), _S.prop(_S.read(_v9, "b"), "my"), 3]), 0.5))), _S.binary("*", 0.06, _S.call_value(_S.read(_v9, "noise"), [_S.binary("*", _S.prop(_S.read(_v9, "b"), "mx"), 0.35), 4]))), (0.02 if _S.truth(_S.prop(_S.read(_v9, "b"), "edge")) else 0)), "=", false)
		_S.set_prop(_S.read(_v9, "b"), "gone", false, "=", false)
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "left", _S.function_value(_e, "_f4"))
	_S.define(_e, "tongues", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f5")]))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "n", _S.arg(_args, 4))
	for _v0 in _S.array([[1, 1, _S.prop(_S.read(_e, "C"), 3)], [0.7, 0.8, _S.prop(_S.read(_e, "C"), 4)], [0.45, 0.6, _S.prop(_S.read(_e, "C"), 5)], [0.25, 0.35, _S.prop(_S.read(_e, "C"), 6)]]):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "lw", _S.prop(_v2, 0))
		_S.define(_v1, "lh", _S.prop(_v2, 1))
		_S.define(_v1, "c", _S.prop(_v2, 2))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "Hh", _S.binary("*", _S.read(_v3, "h"), _S.read(_v3, "lh")))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v4, "r"), _S.read(_v4, "Hh"))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "u", _S.binary("/", _S.read(_v5, "r"), _S.invoke(_S.read(_v5, "Math"), "max", [1, _S.read(_v5, "Hh")])))
			_S.define(_v5, "half", _S.binary("+", _S.binary("*", _S.binary("*", 1.8, _S.read(_v5, "lw")), _S.invoke(_S.read(_v5, "Math"), "pow", [_S.binary("-", 1, _S.read(_v5, "u")), 0.9])), _S.binary("*", _S.call_value(_S.read(_v5, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v5, "t"), 9), _S.binary("*", _S.read(_v5, "r"), 0.5)), _S.read(_v5, "n")]), 0.4)))
			_S.define(_v5, "cxr", _S.binary("+", _S.read(_v5, "x"), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v5, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v5, "t"), 4), _S.binary("*", _S.read(_v5, "r"), 0.25)), _S.binary("+", _S.read(_v5, "n"), 7)]), _S.read(_v5, "u")), 1.6)))
			if _S.truth(_S.binary("<", _S.read(_v5, "half"), 0.3)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "r", 1, "+=", true)
				continue
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "px", _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("-", _S.read(_v6, "cxr"), _S.read(_v6, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v6, "px"), _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", _S.read(_v6, "cxr"), _S.read(_v6, "half"))]))):
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "px"), _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("-", _S.read(_v6, "y"), _S.read(_v6, "r"))]), _S.read(_v6, "c")])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "px", 1, "+=", true)
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "r", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.unary("-", 0.04), _S.binary("*", 1.1, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IGNITE")), _S.read(_e, "BURN"))])])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "max", [0.05, _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [_S.read(_e, "a"), _S.read(_e, "b")]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t"))])])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.binary("+", _S.binary("+", _S.unary("-", 9), _S.binary("*", _S.read(_e, "i"), 3.6)), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 1]), 1.5))}, {"h": _S.binary("+", 6, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 2]), 6))}, {"s": _S.binary("*", _S.read(_e, "i"), 13)}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	for _v10 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "b", _v10)
		var _v12 = _S.scope(_v11)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v12, "b"), "gone"), func(): return _S.binary(">=", _S.prop(_S.read(_v12, "b"), "key"), _S.read(_v12, "f")))):
			continue
		_S.set_prop(_S.read(_v12, "b"), "gone", true, "=", false)
		_S.define(_v12, "r", _S.invoke(_S.read(_v12, "R"), "next", []))
		if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.2)):
			var _v13 = _S.scope(_v12)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v13, "b"), "y"), _S.unary("-", 7))):
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "GRIT"), _S.prop(_S.read(_v13, "b"), "x"), _S.prop(_S.read(_v13, "b"), "y"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 20), 0]), _S.call_value(_S.read(_v13, "left"), [0.6, 1.2]), _S.invoke(_S.read(_v13, "R"), "pick", [_S.read(_v13, "A")]), 1])
			else:
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "FLAKE"), _S.prop(_S.read(_v13, "b"), "x"), _S.prop(_S.read(_v13, "b"), "y"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 8), 4]), _S.call_value(_S.read(_v13, "left"), [0.5, _S.invoke(_S.read(_v13, "Math"), "min", [1.5, _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "b"), "y")), 18)])]), _S.invoke(_S.read(_v13, "R"), "pick", [_S.read(_v13, "A")]), (1.4 if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.2])) else 1)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.32)):
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "EMBER"), _S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "b"), "y"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [15, 45])), _S.call_value(_S.read(_v12, "left"), [0.6, 1.4]), _S.prop(_S.read(_v12, "C"), 5), _S.invoke(_S.read(_v12, "R"), "range", [1, 1.6])])
			else:
				if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.46)):
					_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "FIRE"), _S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "b"), "y"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [14, 30])), _S.invoke(_S.read(_v12, "R"), "range", [0.2, 0.42]), 0, _S.invoke(_S.read(_v12, "R"), "range", [1.2, 2.2]), 0, (_S.prop(_S.read(_v12, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.5])) else 0)])
				else:
					if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.5)):
						_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SMOKE"), _S.prop(_S.read(_v12, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v12, "b"), "y"), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [14, 26])), _S.call_value(_S.read(_v12, "left"), [1.2, 2]), _S.call_value(_S.read(_v12, "mix"), [_S.prop(_S.read(_v12, "A"), 1), _S.prop(_S.read(_v12, "C"), 1), 0.3]), _S.invoke(_S.read(_v12, "R"), "range", [2, 3.4])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IGNITE")), func(): return _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt")), _S.read(_e, "IGNITE")))):
		var _v14 = _S.scope(_e)
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 4), 34, _S.prop(_S.read(_v14, "C"), 4), 0.8, 0.4])
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 10)):
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [40, 150])), _S.invoke(_S.read(_v15, "R"), "range", [0.2, 0.5])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1.02))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "fy", _S.binary("+", _S.prop(_S.read(_v16, "body"), "y"), _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v16, "clamp"), [_S.read(_v16, "f")])), _S.read(_v16, "H"))))
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.34])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 7), 7]), _S.binary("-", _S.read(_v16, "fy"), 5), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [16, 30])), _S.call_value(_S.read(_v16, "left"), [1.4, 2.4]), _S.call_value(_S.read(_v16, "mix"), [_S.prop(_S.read(_v16, "A"), 1), _S.prop(_S.read(_v16, "C"), 3), 0.35]), _S.invoke(_S.read(_v16, "R"), "range", [2.6, 4.2])])
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "FIRE"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v16, "fy"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [18, 34])), _S.invoke(_S.read(_v16, "R"), "range", [0.18, 0.36]), 0, _S.invoke(_S.read(_v16, "R"), "range", [1.2, 2.4]), 0, (_S.prop(_S.read(_v16, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.35])) else 0)])
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.15])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "EMBER"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v16, "fy"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [30, 70])), _S.call_value(_S.read(_v16, "left"), [0.8, 1.6]), _S.prop(_S.read(_v16, "C"), 5), 1.4])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.binary("+", _S.read(_e, "IGNITE"), 0.2), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "IGNITE"), _S.binary("*", _S.read(_e, "BURN"), 0.6)), _S.binary("+", _S.binary("+", _S.read(_e, "IGNITE"), _S.read(_e, "BURN")), 0.4), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 30, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	for _v17 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "b", _v17)
		var _v19 = _S.scope(_v18)
		if _S.truth(_S.prop(_S.read(_v19, "b"), "gone")):
			continue
		_S.define(_v19, "d", _S.binary("-", _S.prop(_S.read(_v19, "b"), "key"), _S.read(_v19, "f")))
		_S.define(_v19, "c", null)
		if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.025)):
			_S.write(_v19, "c", (_S.read(_v19, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "b"), "mx"), _S.prop(_S.read(_v19, "b"), "my"), _S.read(_v19, "fr")]), 0.35)) else _S.prop(_S.read(_v19, "C"), 6)), "=", false)
		else:
			if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.05)):
				_S.write(_v19, "c", (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "b"), "mx"), _S.prop(_S.read(_v19, "b"), "my"), _S.binary("+", _S.read(_v19, "fr"), 7)]), 0.5)) else _S.prop(_S.read(_v19, "C"), 4)), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.11)):
					_S.write(_v19, "c", (_S.prop(_S.read(_v19, "C"), 3) if _S.truth(_S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "b"), "mx"), _S.prop(_S.read(_v19, "b"), "my"), 13]), 0.15), func(): return _S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "b"), "mx"), _S.read(_v19, "fr"), 2]), 0.6))) else _S.prop(_S.read(_v19, "CHAR"), (0 if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.075)) else 1))), "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.16)):
						_S.write(_v19, "c", _S.call_value(_S.read(_v19, "mix"), [_S.prop(_S.read(_v19, "b"), "c"), _S.prop(_S.read(_v19, "CHAR"), 2), 0.6]), "=", false)
					else:
						if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.26)):
							_S.write(_v19, "c", _S.call_value(_S.read(_v19, "mix"), [_S.prop(_S.read(_v19, "b"), "c"), _S.prop(_S.read(_v19, "C"), 2), 0.18]), "=", false)
						else:
							_S.write(_v19, "c", _S.prop(_S.read(_v19, "b"), "c"), "=", false)
		_S.invoke(_S.read(_v19, "p"), "px", [_S.prop(_S.read(_v19, "b"), "x"), _S.prop(_S.read(_v19, "b"), "y"), _S.read(_v19, "c")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), _S.unary("-", 0.02)), func(): return _S.binary("<", _S.read(_e, "f"), 1.05))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "fy", _S.binary("+", _S.prop(_S.read(_v20, "body"), "y"), _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v20, "clamp"), [_S.read(_v20, "f")])), _S.read(_v20, "H"))))
		_S.define(_v20, "k", _S.binary("-", 1, _S.call_value(_S.read(_v20, "smooth"), [0.95, 1.05, _S.read(_v20, "f")])))
		for _v21 in _S.array(_S.read(_v20, "tongues")):
			var _v22 = _S.scope(_v20)
			_S.define(_v22, "g", _v21)
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "row", _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("-", _S.read(_v23, "fy"), _S.prop(_S.read(_v23, "body"), "y"))]))
			_S.define(_v23, "mx", _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("-", _S.prop(_S.read(_v23, "g"), "x"), _S.prop(_S.read(_v23, "body"), "x"))]))
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v23, "body"), "on", [_S.read(_v23, "mx"), _S.invoke(_S.read(_v23, "Math"), "min", [_S.binary("-", _S.read(_v23, "H"), 1), _S.invoke(_S.read(_v23, "Math"), "max", [0, _S.read(_v23, "row")])])]))):
				continue
			_S.define(_v23, "h", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v23, "g"), "h"), _S.read(_v23, "k")), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v23, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v23, "t"), 2.6), _S.prop(_S.read(_v23, "g"), "s")), _S.prop(_S.read(_v23, "g"), "s")]), 0.5), 0.5)))), _S.call_value(_S.read(_v23, "smooth"), [_S.unary("-", 0.02), 0.06, _S.read(_v23, "f")])))
			if _S.truth(_S.binary(">=", _S.read(_v23, "h"), 1)):
				_S.call_value(_S.read(_v23, "tongue"), [_S.read(_v23, "p"), _S.prop(_S.read(_v23, "g"), "x"), _S.binary("+", _S.read(_v23, "fy"), 1), _S.read(_v23, "h"), _S.prop(_S.read(_v23, "g"), "s")])
		_S.define(_v20, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_v20, "noise"), [_S.binary("*", _S.read(_v20, "t"), 11), 9]))))
		_S.invoke(_S.read(_v20, "p"), "glowLine", [_S.unary("-", 11), _S.read(_v20, "fy"), 11, _S.read(_v20, "fy"), 9, _S.prop(_S.read(_v20, "C"), 4), _S.binary("*", 0.45, _S.read(_v20, "k"))])
		_S.invoke(_S.read(_v20, "p"), "glow", [0, _S.binary("-", _S.read(_v20, "fy"), 6), 56, _S.prop(_S.read(_v20, "C"), 4), _S.binary("*", _S.binary("*", 0.38, _S.read(_v20, "k")), _S.read(_v20, "fl"))])
		_S.invoke(_S.read(_v20, "p"), "glow", [0, _S.binary("-", _S.read(_v20, "fy"), 2), 18, _S.prop(_S.read(_v20, "C"), 5), _S.binary("*", _S.binary("*", 0.28, _S.read(_v20, "k")), _S.read(_v20, "fl"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0
