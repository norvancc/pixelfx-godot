@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/warp-out.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Warp out"}, {"desc": "The hero's outline flickers on, they flash white and break into light from the head down, streaming up a beam that lifts off the floor and pinches shut."}, {"tags": ["scifi", "teleport", "warp", "beam", "despawn", "leave", "one-shot"]}, {"size": [128, 168]}, {"origin": [64, 128]}, {"duration": 2.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0b1030", "#152a63", "#1d4f9e", "#2582d2", "#36b9ee", "#8ae8ff", "#d4fbff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SET", _S.merge([{"turn": 1}, {"crouch": 3}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 15)}, {"bx": 10}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "RAISED", _S.merge([_S.read(_e, "SET"), {"crouch": 0}, {"fx": _S.unary("-", 11)}, {"fy": _S.unary("-", 29)}, {"bx": 12}, {"by": _S.unary("-", 29)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.3), _S.read(_e, "READY")], [0.1, _S.read(_e, "SET")], [0.42, _S.read(_e, "RAISED"), "snap"], [2.6, _S.read(_e, "RAISED")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "FLASH", 0.42)
	_S.define(_e, "BREAK0", 0.5)
	_S.define(_e, "BREAK1", 1.1)
	_S.define(_e, "LIFT", 1.3)
	_S.define(_e, "GONE", 1.62)
	_S.define(_e, "TOP", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f11"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", [])
	_S.define(_e, "on", _S.function_value(_e, "_f2"))
	_S.define(_e, "edge", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "my", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "my"), _S.prop(_S.read(_v0, "A"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "mx", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "mx"), _S.prop(_S.read(_v1, "A"), "w"))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.read(_v2, "my")])):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "x", _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "mx")))
				_S.define(_v3, "y", _S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "my")))
				_S.define(_v3, "tr", _S.binary("+", _S.binary("+", _S.read(_v3, "BREAK0"), _S.binary("*", _S.binary("/", _S.read(_v3, "my"), _S.prop(_S.read(_v3, "A"), "h")), _S.binary("-", _S.binary("-", _S.read(_v3, "BREAK1"), _S.read(_v3, "BREAK0")), 0.12))), _S.invoke(_S.read(_v3, "R"), "range", [0, 0.12])))
				_S.define(_v3, "rim", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v3, "on"), [_S.binary("-", _S.read(_v3, "mx"), 1), _S.read(_v3, "my")])), func(): return _S.unary("!", _S.call_value(_S.read(_v3, "on"), [_S.binary("+", _S.read(_v3, "mx"), 1), _S.read(_v3, "my")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v3, "on"), [_S.read(_v3, "mx"), _S.binary("-", _S.read(_v3, "my"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v3, "on"), [_S.read(_v3, "mx"), _S.binary("+", _S.read(_v3, "my"), 1)]))))
				_S.invoke(_S.read(_v3, "bits"), "push", [_S.merge([{"x": _S.read(_v3, "x")}, {"y": _S.read(_v3, "y")}, {"x0": _S.read(_v3, "x")}, {"y0": _S.read(_v3, "y")}, {"vx": 0}, {"vy": 0}, {"tr": _S.read(_v3, "tr")}, {"c": _S.logical("||", _S.prop(_S.prop(_S.read(_v3, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v3, "my"), _S.prop(_S.read(_v3, "A"), "w")), _S.read(_v3, "mx"))), func(): return _S.prop(_S.read(_v3, "C"), 3))}, {"free": false}, {"j": _S.invoke(_S.read(_v3, "R"), "next", [])}, {"rim": _S.read(_v3, "rim")}])])
			else:
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")]), func(): return _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 1)])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("+", _S.read(_v2, "my"), 1)]))):
					_S.invoke(_S.read(_v2, "edge"), "push", [[_S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "mx")), _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "my"))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "mx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "my", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "flashed", false)
	_S.define(_e, "lifted", false)
	_S.define(_e, "width", _S.function_value(_e, "_f3"))
	_S.define(_e, "foot", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "A"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "h"))), func(): return _S.prop(_S.prop(_S.prop(_S.read(_e, "A"), "mask"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "w")), _S.read(_e, "x"))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK0"))) else (_S.binary("+", 2, _S.binary("*", 7, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK0")), 0.35)])]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT"))) else _S.call_value(_S.read(_e, "lerp"), [9, 0.6, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), _S.binary("-", _S.read(_e, "GONE"), _S.read(_e, "LIFT")))])])])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT"))) else _S.call_value(_S.read(_e, "lerp"), [0, _S.read(_e, "TOP"), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), _S.binary("-", _S.read(_e, "GONE"), _S.read(_e, "LIFT")))])])]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.05)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
		_S.define(_v4, "D", _S.invoke(_S.read(_v4, "R"), "range", [26, 48]))
		_S.define(_v4, "T", _S.invoke(_S.read(_v4, "R"), "range", [0.16, 0.26]))
		_S.define(_v4, "v", _S.binary("/", _S.binary("*", _S.read(_v4, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v4, "Math"), "exp", [_S.binary("*", 3, _S.read(_v4, "T"))]), 1)))
		_S.define(_v4, "cy", _S.unary("-", 19))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "D")), _S.binary("+", _S.read(_v4, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "D")), 0.8)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")])), _S.read(_v4, "v")), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")])), _S.read(_v4, "v")), 0.8), _S.read(_v4, "T"), (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.5])) else _S.prop(_S.read(_v4, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.unary("!", _S.read(_e, "flashed")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "flashed", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 20), 80, _S.prop(_S.read(_v5, "C"), 4), 0.9, 0.5])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 20), 30, _S.read(_v5, "WHITE"), 0.8, 0.12])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 14)):
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [2, 40])), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [10, 40])), _S.invoke(_S.read(_v6, "R"), "range", [0.3, 0.6]), (_S.read(_v6, "WHITE") if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.5])) else _S.prop(_S.read(_v6, "C"), 6)), _S.invoke(_S.read(_v6, "R"), "range", [0.8, 1.8])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", _S.binary("-", _S.prop(_S.read(_v7, "bits"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v7, "i"), 0)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "b", _S.prop(_S.read(_v8, "bits"), _S.read(_v8, "i")))
		if _S.truth(_S.binary("<", _S.read(_v8, "t"), _S.prop(_S.read(_v8, "b"), "tr"))):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "-=", true)
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v8, "b"), "free"))):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "b"), "free", true, "=", false)
			_S.define(_v9, "ox", _S.binary("+", _S.prop(_S.read(_v9, "b"), "x"), 0.5))
			_S.define(_v9, "oy", _S.binary("+", _S.prop(_S.read(_v9, "b"), "y"), 19))
			_S.set_prop(_S.read(_v9, "b"), "vx", _S.binary("+", _S.binary("*", _S.read(_v9, "ox"), _S.invoke(_S.read(_v9, "R"), "range", [1.5, 4])), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 10), 10])), "=", false)
			_S.set_prop(_S.read(_v9, "b"), "vy", _S.binary("-", _S.binary("*", _S.read(_v9, "oy"), _S.invoke(_S.read(_v9, "R"), "range", [0.5, 1.5])), _S.invoke(_S.read(_v9, "R"), "range", [10, 40])), "=", false)
		_S.set_prop(_S.read(_v8, "b"), "vy", _S.binary("*", 560, _S.read(_v8, "dt")), "-=", false)
		_S.set_prop(_S.read(_v8, "b"), "vx", _S.binary("*", _S.binary("-", _S.binary("*", _S.unary("-", _S.binary("+", _S.prop(_S.read(_v8, "b"), "x"), 0.5)), 14), _S.binary("*", _S.prop(_S.read(_v8, "b"), "vx"), 3)), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "b"), "x", _S.binary("*", _S.prop(_S.read(_v8, "b"), "vx"), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "b"), "y", _S.binary("*", _S.prop(_S.read(_v8, "b"), "vy"), _S.read(_v8, "dt")), "+=", false)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "b"), "y"), _S.binary("+", _S.read(_v8, "TOP"), 2))):
			_S.invoke(_S.read(_v8, "bits"), "splice", [_S.read(_v8, "i"), 1])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT")), func(): return _S.unary("!", _S.read(_e, "lifted")))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "lifted", true, "=", false)
		_S.invoke(_S.read(_v10, "lights"), "add", [0, _S.unary("-", 2), 40, _S.prop(_S.read(_v10, "C"), 4), 0.7, 0.3])
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 22)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [80, 220]))
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SPARK"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.invoke(_S.read(_v12, "R"), "range", [0.2, 0.55])])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v10)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 16)):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STAR"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [4, 70])), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [10, 30])), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 0.95]), (_S.read(_v13, "WHITE") if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.4])) else _S.prop(_S.read(_v13, "C"), 6)), _S.invoke(_S.read(_v13, "R"), "range", [0.6, 1.6]), _S.invoke(_S.read(_v13, "R"), "range", [0, 0.3])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "FLASH"))]))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "LIFT"), _S.binary("+", _S.read(_e, "LIFT"), 0.6), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "fade"), 0)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.call_value(_S.read(_e, "lerp"), [30, 14, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])]), 0.16, 1.5, _S.binary("*", _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_e, "k"))), _S.read(_e, "fade")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)], _S.function_value(_e, "_f7")])
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), []))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "foot"), []))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "w"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE")))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "y", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.read(_v14, "TOP")]))
		while _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.binary("+", _S.read(_v14, "f"), (0 if _S.truth(_S.binary("<", _S.read(_v14, "t"), _S.read(_v14, "LIFT"))) else 0)))):
			var _v15 = _S.scope(_v14)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v15, "y"), _S.read(_v15, "f")), func(): return _S.binary(">=", _S.read(_v15, "t"), _S.read(_v15, "LIFT")))):
				break
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "x", _S.binary("-", _S.invoke(_S.read(_v16, "Math"), "floor", [_S.unary("-", _S.read(_v16, "w"))]), 1))
			while _S.truth(_S.binary("<=", _S.read(_v16, "x"), _S.invoke(_S.read(_v16, "Math"), "ceil", [_S.read(_v16, "w")]))):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "q", _S.binary("/", _S.invoke(_S.read(_v17, "Math"), "abs", [_S.binary("+", _S.read(_v17, "x"), 0.5)]), _S.read(_v17, "w")))
				if _S.truth(_S.binary(">", _S.read(_v17, "q"), _S.binary("+", 1, _S.binary("/", 1, _S.read(_v17, "w"))))):
					_v16 = _S.iteration(_v16)
					_S.write(_v16, "x", 1, "+=", true)
					continue
				if _S.truth(_S.binary("<", _S.read(_v17, "w"), 2.2)):
					_S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "x"), _S.read(_v17, "y"), (_S.read(_v17, "WHITE") if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.7)) else _S.prop(_S.read(_v17, "C"), 6))])
				else:
					if _S.truth(_S.binary(">", _S.read(_v17, "q"), 1)):
						_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.prop(_S.read(_v17, "C"), 4), 0.5])
					else:
						if _S.truth(_S.binary(">", _S.read(_v17, "q"), _S.binary("-", 1, _S.binary("/", 1.2, _S.read(_v17, "w"))))):
							_S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.prop(_S.read(_v17, "C"), 6)])
						else:
							_S.invoke(_S.read(_v17, "p"), "blend", [_S.binary("+", _S.read(_v17, "x"), 0.5), _S.binary("+", _S.read(_v17, "y"), 0.5), _S.prop(_S.read(_v17, "C"), 5), _S.binary("+", 0.12, _S.binary("*", _S.binary("*", 0.25, _S.read(_v17, "q")), _S.read(_v17, "q")))])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "x", 1, "+=", true)
			if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v15, "y"), 7), 0)):
				_S.invoke(_S.read(_v15, "p"), "glow", [0, _S.read(_v15, "y"), _S.invoke(_S.read(_v15, "Math"), "min", [_S.binary("+", _S.binary("*", _S.read(_v15, "w"), 2.5), 6), _S.binary("+", _S.binary("-", _S.read(_v15, "y"), _S.read(_v15, "TOP")), 2)]), _S.prop(_S.read(_v15, "C"), 4), 0.28])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "y", 1, "+=", true)
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
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "FLASH"))]))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "LIFT"), _S.binary("+", _S.read(_e, "LIFT"), 0.6), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "fade"), 0)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.call_value(_S.read(_e, "lerp"), [30, 14, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])]), 0.16, 1.5, _S.binary("*", _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_e, "k"))), _S.read(_e, "fade")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f9")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "fr", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.read(_v18, "t"), 24)]))
		for _v19 in _S.array(_S.read(_v18, "edge")):
			var _v20 = _S.scope(_v18)
			var _v21 = _v19
			_S.define(_v20, "x", _S.prop(_v21, 0))
			_S.define(_v20, "y", _S.prop(_v21, 1))
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.read(_v20, "fr")]), _S.binary("+", 0.25, _S.binary("*", 0.7, _S.read(_v20, "k"))))):
				_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.read(_v20, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v20, "k"), 0.7), func(): return _S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.read(_v20, "fr"), 1]), 0.5))) else _S.prop(_S.read(_v20, "C"), 5))])
		_S.invoke(_S.read(_v18, "p"), "glow", [0, _S.unary("-", 20), 26, _S.prop(_S.read(_v18, "C"), 4), _S.binary("*", 0.4, _S.read(_v18, "k"))])
	for _v22 in _S.array(_S.read(_e, "bits")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _v22)
		var _v24 = _S.scope(_v23)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v24, "b"), "free"), func(): return _S.binary("<", _S.read(_v24, "t"), _S.read(_v24, "FLASH")))):
			continue
		_S.define(_v24, "a", _S.binary("-", _S.read(_v24, "t"), _S.read(_v24, "FLASH")))
		_S.define(_v24, "scan", _S.binary("===", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.prop(_S.read(_v24, "b"), "y"), _S.invoke(_S.read(_v24, "Math"), "floor", [_S.binary("*", _S.read(_v24, "t"), 40)])), 4), 4), 4), 0))
		_S.define(_v24, "c", (_S.read(_v24, "WHITE") if _S.truth(_S.binary("<", _S.read(_v24, "a"), 0.07)) else (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v24, "a"), 0.16)) else (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.prop(_S.read(_v24, "b"), "rim")) else _S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "b"), "c"), (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.read(_v24, "scan")) else _S.prop(_S.read(_v24, "C"), 5)), (0.6 if _S.truth(_S.read(_v24, "scan")) else 0.45)])))))
		_S.invoke(_S.read(_v24, "p"), "px", [_S.prop(_S.read(_v24, "b"), "x"), _S.prop(_S.read(_v24, "b"), "y"), (_S.read(_v24, "WHITE") if _S.truth(_S.binary("<", _S.binary("-", _S.prop(_S.read(_v24, "b"), "tr"), _S.read(_v24, "t")), 0.06)) else _S.read(_v24, "c"))])
	for _v25 in _S.array(_S.read(_e, "bits")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "b", _v25)
		var _v27 = _S.scope(_v26)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v27, "b"), "free"))):
			continue
		_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.prop(_S.read(_v27, "b"), "vy")]))
		_S.define(_v27, "L", _S.invoke(_S.read(_v27, "Math"), "min", [8, _S.binary("*", _S.read(_v27, "sp"), 0.02)]))
		_S.define(_v27, "u", _S.call_value(_S.read(_v27, "clamp"), [_S.binary("/", _S.binary("-", _S.prop(_S.read(_v27, "b"), "y"), _S.read(_v27, "TOP")), _S.binary("-", _S.prop(_S.read(_v27, "b"), "y0"), _S.read(_v27, "TOP")))]))
		_S.define(_v27, "head", (_S.read(_v27, "WHITE") if _S.truth(_S.binary(">", _S.read(_v27, "u"), 0.75)) else (_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v27, "u"), 0.4)) else _S.prop(_S.read(_v27, "C"), 5))))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v27, "L"), 1), func(): return _S.binary("<", _S.prop(_S.read(_v27, "b"), "j"), 0.33))):
			_S.invoke(_S.read(_v27, "p"), "line", [_S.prop(_S.read(_v27, "b"), "x"), _S.prop(_S.read(_v27, "b"), "y"), _S.binary("-", _S.prop(_S.read(_v27, "b"), "x"), _S.binary("*", _S.prop(_S.read(_v27, "b"), "vx"), 0.01)), _S.binary("+", _S.prop(_S.read(_v27, "b"), "y"), _S.read(_v27, "L")), _S.function_value(_v27, "_f10")])
		else:
			if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v27, "b"), "j"), 0.75), func(): return _S.binary(">", _S.read(_v27, "u"), 0.6))):
				_S.invoke(_S.read(_v27, "p"), "px", [_S.prop(_S.read(_v27, "b"), "x"), _S.prop(_S.read(_v27, "b"), "y"), (_S.read(_v27, "WHITE") if _S.truth(_S.binary(">", _S.prop(_S.read(_v27, "b"), "j"), 0.9)) else _S.read(_v27, "head"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FLASH"), 0.12)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 20), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.12))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return (_S.read(_e, "head") if _S.truth(_S.binary("<", _S.read(_e, "s"), 0.25)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "s"), 0.6)) else _S.prop(_S.read(_e, "C"), 3)))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))) else 0)
