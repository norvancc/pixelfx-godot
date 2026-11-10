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

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_y_b1 * _S.named_value(_n_A,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BREAK0 = _S.read(_parent,"BREAK0")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_GONE = _S.read(_parent,"GONE")
	return (0 if _S.truth((_n_t < _n_BREAK0)) else ((2 + (7 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_BREAK0))/0.35),0.0,1.0)]))) if _S.truth((_n_t < _n_LIFT)) else _S.numeric_lerp(9,0.6,_S.invoke(_n_ease,"inCubic",[clampf((float((_n_t - _n_LIFT))/(_n_GONE - _n_LIFT)),0.0,1.0)]))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_GONE = _S.read(_parent,"GONE")
	return (0 if _S.truth((_n_t < _n_LIFT)) else _S.numeric_lerp(0,_n_TOP,_S.invoke(_n_ease,"inQuad",[clampf((float((_n_t - _n_LIFT))/(_n_GONE - _n_LIFT)),0.0,1.0)])))
	return null

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

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_width = _S.read(_parent,"width")
	var _n_foot = _S.read(_parent,"foot")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = clampf((float(_n_t)/_n_FLASH),0.0,1.0)
	var _n_fade_b2 = (1 - _S.MathFX.smooth(_n_LIFT,(_n_LIFT + 0.6),_n_t))
	if _S.truth((_n_fade_b2 > 0)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, _S.numeric_lerp(30,14,_S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, 1.5, ((0.4 + (0.6 * _n_k_b1)) * _n_fade_b2), [_S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	var _n_w_b3 = _S.call_value(_n_width,[])
	var _n_f_b4 = _S.call_value(_n_foot,[])
	if _S.truth(((_n_t < _n_GONE) if _S.truth((_n_w_b3 > 0.3)) else (_n_w_b3 > 0.3))):
		if true:
			var _n_y_b5 = floori(_n_TOP)
			while _S.truth((_n_y_b5 < (_n_f_b4 + (0 if _S.truth((_n_t < _n_LIFT)) else 0)))):
				if _S.truth(((_n_t >= _n_LIFT) if _S.truth((_n_y_b5 >= _n_f_b4)) else (_n_y_b5 >= _n_f_b4))):
					break
				if true:
					var _n_x_b6 = (floori((-_n_w_b3)) - 1)
					while _S.truth((_n_x_b6 <= ceili(_n_w_b3))):
						var _n_q_b7 = (float(absf((_n_x_b6 + 0.5)))/_n_w_b3)
						if _S.truth((_n_q_b7 > (1 + (float(1)/_n_w_b3)))):
							_n_x_b6 += 1.0
							continue
						if _S.truth((_n_w_b3 < 2.2)):
							_S.invoke(_n_p_b0,"px",[_n_x_b6, _n_y_b5, (_n_WHITE if _S.truth((_n_q_b7 < 0.7)) else _S.index_value(_n_C,6))])
						else:
							if _S.truth((_n_q_b7 > 1)):
								_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b5, _S.index_value(_n_C,4), 0.5])
							else:
								if _S.truth((_n_q_b7 > (1 - (float(1.2)/_n_w_b3)))):
									_S.invoke(_n_p_b0,"px",[_n_x_b6, _n_y_b5, _S.index_value(_n_C,6)])
								else:
									_S.invoke(_n_p_b0,"blend",[(_n_x_b6 + 0.5), (_n_y_b5 + 0.5), _S.index_value(_n_C,5), (0.12 + ((0.25 * _n_q_b7) * _n_q_b7))])
						_n_x_b6 += 1.0
				if _S.truth(_S.binary("===",_S.binary("&",_n_y_b5,7),0)):
					_S.invoke(_n_p_b0,"glow",[0, _n_y_b5, minf(((_n_w_b3 * 2.5) + 6),((_n_y_b5 - _n_TOP) + 2)), _S.index_value(_n_C,4), 0.28])
				_n_y_b5 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_edge = _S.read(_parent,"edge")
	var _n_bits = _S.read(_parent,"bits")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = clampf((float(_n_t)/_n_FLASH),0.0,1.0)
	var _n_fade_b2 = (1 - _S.MathFX.smooth(_n_LIFT,(_n_LIFT + 0.6),_n_t))
	if _S.truth((_n_fade_b2 > 0)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, _S.numeric_lerp(30,14,_S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, 1.5, ((0.4 + (0.6 * _n_k_b1)) * _n_fade_b2), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	if _S.truth((_n_t < _n_FLASH)):
		var _n_fr_b3 = floori((_n_t * 24))
		for _iter_0 in _S.array(_n_edge):
			var _tuple_1 = _iter_0
			var _n_x_b4 = _S.prop(_tuple_1,0)
			var _n_y_b5 = _S.prop(_tuple_1,1)
			if _S.truth((_S.MathFX.rand([_n_x_b4,_n_y_b5,_n_fr_b3]) < (0.25 + (0.7 * _n_k_b1)))):
				_S.invoke(_n_p_b0,"px",[_n_x_b4, _n_y_b5, (_n_WHITE if _S.truth(((_S.MathFX.rand([_n_x_b4,_n_y_b5,_n_fr_b3,1]) < 0.5) if _S.truth((_n_k_b1 > 0.7)) else (_n_k_b1 > 0.7))) else _S.index_value(_n_C,5))])
		_S.invoke(_n_p_b0,"glow",[0, (-20), 26, _S.index_value(_n_C,4), (0.4 * _n_k_b1)])
	for _iter_2 in _S.array(_n_bits):
		var _n_b_b6 = _iter_2
		if _S.truth((_S.named_value(_n_b_b6,"free") if _S.truth(_S.named_value(_n_b_b6,"free")) else (_n_t < _n_FLASH))):
			continue
		var _n_a_b7 = (_n_t - _n_FLASH)
		var _n_scan_b8 = _S.binary("===",fmod((fmod((_S.named_value(_n_b_b6,"y") + floori((_n_t * 40))),4) + 4),4),0)
		var _n_c_b9 = (_n_WHITE if _S.truth((_n_a_b7 < 0.07)) else (_S.index_value(_n_C,6) if _S.truth((_n_a_b7 < 0.16)) else (_S.index_value(_n_C,6) if _S.truth(_S.named_value(_n_b_b6,"rim")) else _S.ColorFX.mix(_S.named_value(_n_b_b6,"c"),(_S.index_value(_n_C,6) if _S.truth(_n_scan_b8) else _S.index_value(_n_C,5)),(0.6 if _S.truth(_n_scan_b8) else 0.45)))))
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b6,"x"), _S.named_value(_n_b_b6,"y"), (_n_WHITE if _S.truth(((_S.named_value(_n_b_b6,"tr") - _n_t) < 0.06)) else _n_c_b9)])
	for _iter_3 in _S.array(_n_bits):
		var _n_b_b10 = _iter_3
		if _S.truth(not _S.truth(_S.named_value(_n_b_b10,"free"))):
			continue
		var _n_sp_b11 = absf(_S.named_value(_n_b_b10,"vy"))
		var _n_L_b12 = minf(8,(_n_sp_b11 * 0.02))
		var _n_u_b13 = clampf((float((_S.named_value(_n_b_b10,"y") - _n_TOP))/(_S.named_value(_n_b_b10,"y0") - _n_TOP)),0.0,1.0)
		var _n_head_b14 = (_n_WHITE if _S.truth((_n_u_b13 > 0.75)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b13 > 0.4)) else _S.index_value(_n_C,5)))
		if _S.truth(((_S.named_value(_n_b_b10,"j") < 0.33) if _S.truth((_n_L_b12 >= 1)) else (_n_L_b12 >= 1))):
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_b_b10,"x"), _S.named_value(_n_b_b10,"y"), (_S.named_value(_n_b_b10,"x") - (_S.named_value(_n_b_b10,"vx") * 0.01)), (_S.named_value(_n_b_b10,"y") + _n_L_b12), _S.function_value(_S.capture(_parent,{"head":_n_head_b14,"this":_this}),"_f10")])
		else:
			if _S.truth(((_S.named_value(_n_b_b10,"j") < 0.75) if _S.truth((_S.named_value(_n_b_b10,"j") < 0.75)) else (_n_u_b13 > 0.6))):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b10,"x"), _S.named_value(_n_b_b10,"y"), (_n_WHITE if _S.truth((_S.named_value(_n_b_b10,"j") > 0.9)) else _n_head_b14)])
	if _S.truth(((_n_t < (_n_FLASH + 0.12)) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-20), (10 * (1 - (float((_n_t - _n_FLASH))/0.12))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.6])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_head = _S.read(_parent,"head")
	var _n_C = _S.read(_parent,"C")
	var _n_s_b0 = _S.arg(_args,0)
	return (_n_head if _S.truth((_n_s_b0 < 0.25)) else (_S.index_value(_n_C,5) if _S.truth((_n_s_b0 < 0.6)) else _S.index_value(_n_C,3)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_t_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_t_b0 < _n_FLASH)) else 0)
	return null
