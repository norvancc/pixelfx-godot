@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/icicle-fall.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "centroid", _S.import_value("fx/ice/_lib.js", "centroid"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "icicle", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Icicle fall"}, {"desc": "An icicle drips and trembles, snaps off its frosted root, drops, stabs the floor and bursts into skidding shards, splinters and rolling frost."}, {"tags": ["ice", "icicle", "fall", "trap", "shatter", "one-shot"]}, {"size": [152, 120]}, {"origin": [76, 100]}, {"duration": 2.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "ROOT", _S.unary("-", 80))
	_S.define(_e, "LEN", 36)
	_S.define(_e, "W", 12)
	_S.define(_e, "DRIP", 0.16)
	_S.define(_e, "TREMBLE", 0.3)
	_S.define(_e, "SNAP", 0.6)
	_S.define(_e, "FREE", _S.binary("+", _S.read(_e, "SNAP"), 0.04))
	_S.define(_e, "FALL_T", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.binary("-", _S.unary("-", _S.read(_e, "ROOT")), _S.read(_e, "LEN"))), _S.read(_e, "GRAVITY"))]))
	_S.define(_e, "IMPACT", _S.binary("+", _S.read(_e, "FREE"), _S.read(_e, "FALL_T")))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "top", _S.arg(_args, 3))
	_S.define(_e, "len", _S.arg(_args, 4))
	_S.define(_e, "w", _S.arg(_args, 5))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 6), func(): return _S.merge([])))
	_S.define(_e, "hw", _S.function_value(_e, "_f1"))
	_S.define(_e, "tilt", _S.logical("??", _S.prop(_S.read(_e, "opts"), "tilt"), func(): return 0))
	_S.define(_e, "cut", _S.logical("??", _S.prop(_S.read(_e, "opts"), "cut"), func(): return 0))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "w"), 2)), 4), _S.binary("-", _S.read(_e, "top"), 1), _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "w"), 2)), 4), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "tilt")]), _S.read(_e, "len"))), _S.binary("+", _S.binary("+", _S.read(_e, "top"), _S.read(_e, "len")), 1), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "w"), 2), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.75])), _S.binary("+", 1, _S.binary("*", 0.14, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 13), 0.5)])))), (1.15 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.08)) else 1)), 0.3)

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "top")), _S.read(_e, "len")))
	_S.define(_e, "cx", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "tilt"), _S.read(_e, "len")), _S.read(_e, "u"))), _S.binary("*", 0.7, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 6), 1)]))))
	_S.define(_e, "s", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "cx")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), _S.read(_e, "cut")), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "h", _S.call_value(_S.read(_e, "hw"), [_S.read(_e, "u")]))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "s")]), _S.binary("+", _S.read(_e, "h"), 1))):
		return null
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "s")]), _S.read(_e, "h"))):
		var _v0 = _S.scope(_e)
		_S.set_prop(_S.read(_v0, "o"), "c", _S.prop(_S.read(_v0, "C"), 1), "=", false)
		return null
	if _S.truth(_S.prop(_S.read(_e, "opts"), "white")):
		return _S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "WHITE"), "=", false)
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "s"), _S.read(_e, "h")))
	_S.define(_e, "ring", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 13), 0.5)]), 0.7))
	_S.define(_e, "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.88)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.72))) else ((_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.read(_e, "ring")) else _S.prop(_S.read(_e, "C"), 5)) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.2))) else ((_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.72)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.18)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.8)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), 0.45)]), 0.1), func(): return _S.binary(">", _S.read(_e, "u"), 0.15)), func(): return _S.binary("<", _S.read(_e, "u"), 0.6))) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.6)) else _S.prop(_S.read(_e, "C"), 3)))))))))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.prop(_S.read(_e, "opts"), "glint"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.25)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), _S.prop(_S.read(_e, "opts"), "glint"))]), 0.06))):
		_S.write(_e, "c", _S.read(_e, "WHITE"), "=", false)
	_S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "c"), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "splinter", _S.function_value(_e, "_f5"))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onLand": _S.function_value(_e, "_f6")}, {"onCrumble": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "rime", [])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "x", _S.unary("-", 18))
	while _S.truth(_S.binary("<=", _S.read(_v2, "x"), 18)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "h", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "x"), _S.prop(_S.read(_v3, "o"), "seed"), 2]))
		_S.define(_v3, "d", _S.binary("/", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 18))
		_S.invoke(_S.read(_v3, "rime"), "push", [_S.merge([{"x": _S.read(_v3, "x")}, {"h": _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", _S.binary("+", 0.6, _S.binary("*", _S.read(_v3, "h"), 1.8)), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "d"), 0.7)))]))}, {"stub": (_S.binary("+", 2, _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", _S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "x"), 5]), 5), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "d"), 0.5)))])) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v3, "h"), 0.3), func(): return _S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 7))) else 0)}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "x", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "snapped", false)
	_S.define(_e, "landed", false)
	_S.define(_e, "dripped", false)
	_S.define(_e, "y", 0)
	_S.define(_e, "top", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "n", _S.arg(_args, 3))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "n"))):
		_S.invoke(_S.read(_v1, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v1, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v1, "x"), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 2), 2]))}, {"y": _S.binary("-", _S.read(_v1, "y"), 1)}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v1, "vx"), 0.5), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 45), 45]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v1, "R"), "range", [30, 100]))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v1, "R"), "range", [0.4, 0.75])}, {"a": _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")])}, {"va": _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v1, "R"), "range", [1.2, 2.4])}, {"c": _S.prop(_S.read(_v1, "C"), _S.invoke(_S.read(_v1, "R"), "int", [4, 7]))}])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "v", _S.arg(_args, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), 100)):
		return null
	_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 8])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.6]), _S.prop(_S.read(_e, "C"), 6), _S.invoke(_S.read(_e, "R"), "range", [1.4, 2.2])])
	_S.call_value(_S.read(_e, "splinter"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "q"), "vx"), 2])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "splinter"), [_S.prop(_S.read(_e, "q"), "x"), 0, _S.prop(_S.read(_e, "q"), "vx"), 3])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", _S.read(_e, "ROOT"), (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FREE"))) else _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "GRAVITY")), _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FREE")), 2))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "dripped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DRIP")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "dripped", true, "=", false)
		_S.invoke(_S.read(_v4, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v4, "B"), "DRIP")}, {"x": 0.5}, {"y": _S.binary("+", _S.binary("+", _S.read(_v4, "ROOT"), _S.read(_v4, "LEN")), 1)}, {"vy": 20}, {"g": 0.9}, {"life": 1.2}, {"c": _S.prop(_S.read(_v4, "C"), 6)}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "TREMBLE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.25]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_e, "ROOT"), _S.invoke(_S.read(_e, "R"), "range", [0, 3])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_e, "R"), "range", [5, 20]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.1]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.5, 1.1])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "snapped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "snapped", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.binary("+", _S.read(_v5, "ROOT"), 4), 24, _S.read(_v5, "WHITE"), 0.6, 0.1])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.binary("+", _S.read(_v5, "ROOT"), 4), 32, _S.prop(_S.read(_v5, "C"), 5), 0.4, 0.3])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 7)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v7, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v7, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 4), 4])}, {"y": _S.binary("+", _S.read(_v7, "ROOT"), 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 20)}, {"g": 0.8}, {"drag": 0.8}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v7, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")])}, {"va": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v7, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v7, "C"), _S.invoke(_S.read(_v7, "R"), "int", [5, 7]))}])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)):
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "VAPOUR"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 5), 5]), _S.binary("+", _S.read(_v8, "ROOT"), 2), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 5), 5]), _S.invoke(_S.read(_v8, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v8, "C"), 6), _S.invoke(_S.read(_v8, "R"), "range", [1.6, 2.6])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v9 = _S.scope(_v5)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 5)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "FLAKE"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_v9, "ROOT"), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 1.2]), (_S.read(_v9, "WHITE") if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.5])) else _S.prop(_S.read(_v9, "C"), 6)), _S.invoke(_S.read(_v9, "R"), "range", [0.5, 1.3])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "FREE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "IMPACT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "tp", _S.call_value(_S.read(_v10, "top"), []))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "MOTE"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("+", _S.read(_v10, "tp"), _S.invoke(_S.read(_v10, "R"), "range", [0, _S.binary("*", _S.read(_v10, "LEN"), 0.6)])), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.35]), (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 5)), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "landed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IMPACT")))):
		var _v11 = _S.scope(_e)
		_S.write(_v11, "landed", true, "=", false)
		_S.define(_v11, "tp", _S.unary("-", _S.read(_v11, "LEN")))
		_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 16), 46, _S.read(_v11, "WHITE"), 0.85, 0.12])
		_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 16), 58, _S.prop(_S.read(_v11, "C"), 4), 0.5, 0.5])
		_S.define(_v11, "parts", [[[_S.binary("/", _S.unary("-", _S.read(_v11, "W")), 2), _S.read(_v11, "tp")], [_S.binary("/", _S.read(_v11, "W"), 2), _S.read(_v11, "tp")], [0.5, 0]]])
		for _v12 in _S.array([0.3, 0.58, 0.8]):
			var _v13 = _S.scope(_v11)
			_S.define(_v13, "v", _v12)
			_S.write(_v13, "parts", _S.invoke(_S.read(_v13, "parts"), "flatMap", [_S.function_value(_v13, "_f10")]), "=", false)
		_S.write(_v11, "parts", _S.invoke(_S.read(_v11, "parts"), "flatMap", [_S.function_value(_v11, "_f11")]), "=", false)
		for _v14 in _S.array(_S.read(_v11, "parts")):
			var _v15 = _S.scope(_v11)
			_S.define(_v15, "part", _v14)
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "m", _S.call_value(_S.read(_v16, "centroid"), [_S.read(_v16, "part")]))
			_S.define(_v16, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v16, "m"), "x"), 0.5)) else 1))
			_S.define(_v16, "low", _S.call_value(_S.read(_v16, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v16, "m"), "y")), _S.read(_v16, "LEN"))]))
			_S.invoke(_S.read(_v16, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v16, "part"), "map", [_S.function_value(_v16, "_f12")])}, {"x": _S.prop(_S.read(_v16, "m"), "x")}, {"y": _S.prop(_S.read(_v16, "m"), "y")}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v16, "side"), _S.invoke(_S.read(_v16, "R"), "range", [30, 110])), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]))}, {"vy": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [70, 200])), _S.binary("+", 0.4, _S.read(_v16, "low")))}, {"a": 0}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 12), 12])}, {"f": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.7), 0.7])}, {"vf": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 8), 8])}, {"lit": 0.75}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.35}, {"solid": true}, {"ridge": _S.binary("/", _S.prop(_S.read(_v16, "Math"), "PI"), 2)}, {"brittle": 2}, {"crumble": _S.invoke(_S.read(_v16, "R"), "range", [0.15, 0.45])}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1, 1.4])}])])
		var _v18 = _S.scope(_v11)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 52)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1.25), 1.25])))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [60, 230]))
			_S.invoke(_S.read(_v19, "bits"), "add", [_S.merge([{"kind": (_S.prop(_S.read(_v19, "B"), "CHUNK") if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.15])) else _S.prop(_S.read(_v19, "B"), "SHARD"))}, {"x": _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [1, 10]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp"))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v19, "R"), "range", [0.6, 1.2])}, {"a": _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")])}, {"va": _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v19, "R"), "range", [1.2, 3])}, {"c": _S.prop(_S.read(_v19, "C"), _S.invoke(_S.read(_v19, "R"), "int", [4, 7]))}, {"ramp": [_S.prop(_S.read(_v19, "C"), 1), _S.prop(_S.read(_v19, "C"), 3), _S.prop(_S.read(_v19, "C"), 4), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 7)]}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v11)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 10)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "s", _S.invoke(_S.read(_v21, "R"), "sign", []))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "VAPOUR"), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [0, 8])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [25, 90])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [2, 14])), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v21, "C"), 6), _S.invoke(_S.read(_v21, "R"), "range", [2.2, 3.8])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v11)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 12)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "FLAKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 16])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [30, 110])), _S.invoke(_S.read(_v22, "R"), "range", [1, 1.5]), (_S.read(_v22, "WHITE") if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.6])) else _S.prop(_S.read(_v22, "C"), 6)), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1.5])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v11)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 6)):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "STAR"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 24), 24]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 34])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 14])), _S.invoke(_S.read(_v23, "R"), "range", [0.4, 0.8]), (_S.read(_v23, "WHITE") if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else _S.prop(_S.read(_v23, "C"), 6)), _S.invoke(_S.read(_v23, "R"), "range", [1, 2.2])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "landed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "IMPACT"), 0.9))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08])), func(): return _S.prop(_S.prop(_S.read(_e, "bits"), "list"), "length"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "b", _S.invoke(_S.read(_v24, "R"), "pick", [_S.prop(_S.read(_v24, "bits"), "list")]))
		_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "STAR"), _S.prop(_S.read(_v24, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v24, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v24, "R"), "range", [0.2, 0.4]), (_S.read(_v24, "WHITE") if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.prop(_S.read(_v24, "C"), 6)), _S.invoke(_S.read(_v24, "R"), "range", [0.6, 1.4])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "poly", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "splitPoly"), [_S.read(_e, "poly"), 0, _S.binary("+", _S.binary("+", _S.read(_e, "tp"), _S.binary("*", _S.read(_e, "LEN"), _S.read(_e, "v"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.4), 0.4])])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "poly", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "splitPoly"), [_S.read(_e, "poly"), _S.prop(_S.call_value(_S.read(_e, "centroid"), [_S.read(_e, "poly")]), "x"), _S.prop(_S.call_value(_S.read(_e, "centroid"), [_S.read(_e, "poly")]), "y"), _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.5), 0.5]))]) if _S.truth(_S.binary(">", _S.prop(_S.call_value(_S.read(_e, "centroid"), [_S.read(_e, "poly")]), "area"), 22)) else [_S.read(_e, "poly")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v17 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v17, 0))
	_S.define(_e, "y", _S.prop(_v17, 1))
	return [_S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "m"), "x")), _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "y"))]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "TREMBLE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "IMPACT"), 0.05)))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "k", (_S.binary("*", _S.call_value(_S.read(_v25, "seg"), [_S.read(_v25, "t"), _S.read(_v25, "TREMBLE"), _S.read(_v25, "FREE")]), 0.35) if _S.truth(_S.binary("<", _S.read(_v25, "t"), _S.read(_v25, "FREE"))) else _S.binary("+", 0.35, _S.binary("*", 0.65, _S.call_value(_S.read(_v25, "seg"), [_S.read(_v25, "t"), _S.read(_v25, "FREE"), _S.read(_v25, "IMPACT")])))))
		_S.define(_v25, "rx", _S.binary("+", 3, _S.binary("*", 7, _S.read(_v25, "k"))))
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "x", _S.invoke(_S.read(_v26, "Math"), "floor", [_S.unary("-", _S.read(_v26, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v26, "x"), _S.read(_v26, "rx"))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "f", _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_v27, "x"), _S.read(_v27, "rx")), 2)))
			_S.invoke(_S.read(_v27, "p"), "blend", [_S.binary("+", _S.read(_v27, "x"), 0.5), 0, _S.prop(_S.read(_v27, "C"), 0), _S.binary("*", _S.binary("*", 0.7, _S.read(_v27, "k")), _S.read(_v27, "f"))])
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "x")]), _S.binary("*", _S.read(_v27, "rx"), 0.7))):
				_S.invoke(_S.read(_v27, "p"), "blend", [_S.binary("+", _S.read(_v27, "x"), 0.5), 1, _S.prop(_S.read(_v27, "C"), 0), _S.binary("*", _S.binary("*", 0.45, _S.read(_v27, "k")), _S.read(_v27, "f"))])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "x", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IMPACT"))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "g", _S.invoke(_S.read(_v28, "ease"), "outCubic", [_S.call_value(_S.read(_v28, "seg"), [_S.read(_v28, "t"), _S.read(_v28, "IMPACT"), _S.binary("+", _S.read(_v28, "IMPACT"), 0.25)])]))
		_S.define(_v28, "out", _S.binary("-", 1, _S.call_value(_S.read(_v28, "smooth"), [_S.binary("+", _S.read(_v28, "IMPACT"), 0.8), _S.binary("+", _S.read(_v28, "IMPACT"), 1.5), _S.read(_v28, "t")])))
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "x", _S.unary("-", 26))
		while _S.truth(_S.binary("<=", _S.read(_v29, "x"), 26)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "d", _S.binary("/", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.binary("+", _S.read(_v30, "x"), 0.5)]), 26))
			_S.define(_v30, "h", _S.call_value(_S.read(_v30, "rand"), [_S.read(_v30, "x"), 23]))
			_S.define(_v30, "a", _S.binary("*", _S.read(_v30, "out"), _S.call_value(_S.read(_v30, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("*", _S.read(_v30, "g"), 1.15), _S.read(_v30, "d")), 0.15)])))
			if _S.truth(_S.binary("<=", _S.read(_v30, "a"), 0)):
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v30, "p"), "dot", [_S.read(_v30, "x"), 0, (_S.read(_v30, "WHITE") if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v30, "h"), 0.35), func(): return _S.binary(">", _S.read(_v30, "d"), _S.binary("-", _S.read(_v30, "g"), 0.12)))) else _S.prop(_S.read(_v30, "C"), 6)), _S.read(_v30, "a")])
			if _S.truth(_S.binary("<", _S.read(_v30, "h"), 0.4)):
				var _v31 = _S.scope(_v30)
				_S.define(_v31, "j", 1)
				while _S.truth(_S.binary("<=", _S.read(_v31, "j"), _S.invoke(_S.read(_v31, "Math"), "round", [_S.binary("*", _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_v31, "rand"), [_S.read(_v31, "x"), 3]), 2.5)), _S.binary("-", 1, _S.read(_v31, "d")))]))):
					_S.invoke(_S.read(_v31, "p"), "dot", [_S.binary("+", _S.read(_v31, "x"), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sign", [_S.read(_v31, "x")]), (1 if _S.truth(_S.binary(">", _S.read(_v31, "j"), 1)) else 0))), _S.unary("-", _S.read(_v31, "j")), (_S.read(_v31, "WHITE") if _S.truth(_S.binary(">", _S.read(_v31, "j"), 1)) else _S.prop(_S.read(_v31, "C"), 5)), _S.read(_v31, "a")])
					_v31 = _S.iteration(_v31)
					_S.write(_v31, "j", 1, "+=", true)
			var _v32 = _S.scope(_v30)
			_S.define(_v32, "j", 1)
			while _S.truth(_S.binary("<=", _S.read(_v32, "j"), _S.invoke(_S.read(_v32, "Math"), "round", [_S.binary("*", _S.binary("+", 2, _S.binary("*", _S.call_value(_S.read(_v32, "rand"), [_S.read(_v32, "x"), 7]), 3)), _S.binary("-", 1, _S.binary("*", _S.read(_v32, "d"), 0.6)))]))):
				_S.invoke(_S.read(_v32, "p"), "dot", [_S.read(_v32, "x"), _S.read(_v32, "j"), (_S.prop(_S.read(_v32, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v32, "j"), 2)) else _S.prop(_S.read(_v32, "C"), 4)), _S.binary("*", _S.read(_v32, "a"), _S.binary("-", 1.1, _S.binary("/", _S.read(_v32, "j"), 6)))])
				_v32 = _S.iteration(_v32)
				_S.write(_v32, "j", 1, "+=", true)
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "x", 1, "+=", true)
		_S.define(_v28, "k", _S.call_value(_S.read(_v28, "seg"), [_S.read(_v28, "t"), _S.read(_v28, "IMPACT"), _S.binary("+", _S.read(_v28, "IMPACT"), 0.35)]))
		if _S.truth(_S.binary("<", _S.read(_v28, "k"), 1)):
			_S.call_value(_S.read(_v28, "band"), [_S.read(_v28, "p"), 0, 0.5, _S.binary("+", 6, _S.binary("*", 34, _S.invoke(_S.read(_v28, "ease"), "outCubic", [_S.read(_v28, "k")]))), 0.18, _S.invoke(_S.read(_v28, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_v28, "k")))]), _S.binary("-", 1.1, _S.read(_v28, "k")), [_S.prop(_S.read(_v28, "C"), 3), _S.prop(_S.read(_v28, "C"), 4), _S.prop(_S.read(_v28, "C"), 5), _S.prop(_S.read(_v28, "C"), 6)], _S.function_value(_v28, "_f14")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ra", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.7), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.2), _S.read(_e, "t")])))
	for _v33 in _S.array(_S.read(_e, "rime")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "r", _v33)
		var _v35 = _S.scope(_v34)
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "j"), _S.binary("+", _S.prop(_S.read(_v36, "r"), "h"), 1))):
			_S.invoke(_S.read(_v36, "p"), "dot", [_S.prop(_S.read(_v36, "r"), "x"), _S.binary("-", _S.binary("-", _S.read(_v36, "ROOT"), 1), _S.read(_v36, "j")), (_S.read(_v36, "WHITE") if _S.truth(_S.binary("===", _S.read(_v36, "j"), _S.prop(_S.read(_v36, "r"), "h"))) else (_S.prop(_S.read(_v36, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v36, "j"), _S.binary("-", _S.prop(_S.read(_v36, "r"), "h"), 1))) else (_S.prop(_S.read(_v36, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v36, "j"), 0)) else _S.prop(_S.read(_v36, "C"), 5)))), _S.read(_v36, "ra")])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "j", 1, "+=", true)
		var _v37 = _S.scope(_v35)
		_S.define(_v37, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "j"), _S.prop(_S.read(_v37, "r"), "stub"))):
			_S.invoke(_S.read(_v37, "p"), "dot", [_S.prop(_S.read(_v37, "r"), "x"), _S.binary("+", _S.read(_v37, "ROOT"), _S.read(_v37, "j")), (_S.read(_v37, "WHITE") if _S.truth(_S.binary("===", _S.read(_v37, "j"), _S.binary("-", _S.prop(_S.read(_v37, "r"), "stub"), 1))) else (_S.prop(_S.read(_v37, "C"), 5) if _S.truth(_S.binary("===", _S.read(_v37, "j"), 0)) else _S.prop(_S.read(_v37, "C"), 4))), _S.read(_v37, "ra")])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "j", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v35, "r"), "stub"), 4)):
			_S.invoke(_S.read(_v35, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v35, "r"), "x"), 1), _S.read(_v35, "ROOT"), _S.prop(_S.read(_v35, "C"), 3), _S.read(_v35, "ra")])
	if _S.truth(_S.read(_e, "snapped")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "x", _S.binary("+", _S.binary("/", _S.unary("-", _S.read(_v38, "W")), 2), 1))
		while _S.truth(_S.binary("<=", _S.read(_v38, "x"), _S.binary("-", _S.binary("/", _S.read(_v38, "W"), 2), 1))):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "L", _S.binary("+", 1, _S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("*", _S.call_value(_S.read(_v39, "rand"), [_S.read(_v39, "x"), 77]), 2.5)])))
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v40, "j"), _S.read(_v40, "L"))):
				_S.invoke(_S.read(_v40, "p"), "dot", [_S.read(_v40, "x"), _S.binary("+", _S.read(_v40, "ROOT"), _S.read(_v40, "j")), ((_S.read(_v40, "WHITE") if _S.truth(_S.binary("<", _S.read(_v40, "t"), _S.binary("+", _S.read(_v40, "SNAP"), 0.15))) else _S.prop(_S.read(_v40, "C"), 6)) if _S.truth(_S.binary("===", _S.read(_v40, "j"), _S.binary("-", _S.read(_v40, "L"), 1))) else (_S.prop(_S.read(_v40, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v40, "x"), 0)) else _S.prop(_S.read(_v40, "C"), 3))), _S.read(_v40, "ra")])
				_v40 = _S.iteration(_v40)
				_S.write(_v40, "j", 1, "+=", true)
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "ROOT"), 18, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "ra"))])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IMPACT"))):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "k", _S.call_value(_S.read(_v41, "seg"), [_S.read(_v41, "t"), _S.read(_v41, "IMPACT"), _S.binary("+", _S.read(_v41, "IMPACT"), 0.35)]))
		if _S.truth(_S.binary("<", _S.read(_v41, "k"), 1)):
			_S.call_value(_S.read(_v41, "band"), [_S.read(_v41, "p"), 0, 0.5, _S.binary("+", 6, _S.binary("*", 34, _S.invoke(_S.read(_v41, "ease"), "outCubic", [_S.read(_v41, "k")]))), 0.18, _S.invoke(_S.read(_v41, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_v41, "k")))]), _S.binary("-", 1.1, _S.read(_v41, "k")), [_S.prop(_S.read(_v41, "C"), 3), _S.prop(_S.read(_v41, "C"), 4), _S.prop(_S.read(_v41, "C"), 5), _S.prop(_S.read(_v41, "C"), 6)], _S.function_value(_v41, "_f16"), _S.binary("<", _S.read(_v41, "k"), 0.15)])
		if _S.truth(_S.binary("<", _S.read(_v41, "t"), _S.binary("+", _S.read(_v41, "IMPACT"), 0.22))):
			_S.call_value(_S.read(_v41, "sparkle"), [_S.read(_v41, "p"), 0.5, _S.unary("-", 3), _S.binary("*", _S.binary("*", 10, _S.invoke(_S.read(_v41, "ease"), "outBack", [_S.invoke(_S.read(_v41, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_v41, "t"), _S.read(_v41, "IMPACT")), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v41, "t"), _S.read(_v41, "IMPACT")), 0.22))), _S.prop(_S.read(_v41, "C"), 6), _S.prop(_S.read(_v41, "C"), 4), 0.7])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "IMPACT"))):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "tp", _S.call_value(_S.read(_v42, "top"), []))
		_S.define(_v42, "jx", (_S.binary("*", (1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_v42, "Math"), "floor", [_S.binary("*", _S.read(_v42, "t"), 36)]), 2)) else 0), _S.invoke(_S.read(_v42, "Math"), "round", [_S.binary("+", _S.binary("*", _S.call_value(_S.read(_v42, "seg"), [_S.read(_v42, "t"), _S.read(_v42, "TREMBLE"), _S.read(_v42, "SNAP")]), 1.4), 0.4)])) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v42, "t"), _S.read(_v42, "TREMBLE")), func(): return _S.binary("<", _S.read(_v42, "t"), _S.read(_v42, "SNAP")))) else 0))
		_S.define(_v42, "falling", _S.binary(">=", _S.read(_v42, "t"), _S.read(_v42, "FREE")))
		_S.define(_v42, "sp", (_S.binary("*", _S.read(_v42, "GRAVITY"), _S.binary("-", _S.read(_v42, "t"), _S.read(_v42, "FREE"))) if _S.truth(_S.read(_v42, "falling")) else 0))
		if _S.truth(_S.read(_v42, "falling")):
			for _v43 in _S.array([[_S.unary("-", 3), 0.7], [0.5, 1], [4, 0.6]]):
				var _v44 = _S.scope(_v42)
				var _v45 = _v43
				_S.define(_v44, "dx", _S.prop(_v45, 0))
				_S.define(_v44, "k", _S.prop(_v45, 1))
				var _v46 = _S.scope(_v44)
				_S.define(_v46, "L", _S.binary("*", _S.invoke(_S.read(_v46, "Math"), "min", [30, _S.binary("*", _S.read(_v46, "sp"), 0.07)]), _S.read(_v46, "k")))
				if _S.truth(_S.binary(">", _S.read(_v46, "L"), 2)):
					_S.invoke(_S.read(_v46, "p"), "line", [_S.read(_v46, "dx"), _S.binary("-", _S.read(_v46, "tp"), _S.read(_v46, "L")), _S.read(_v46, "dx"), _S.binary("+", _S.read(_v46, "tp"), 3), _S.function_value(_v46, "_f17")])
		_S.define(_v42, "gl", _S.binary("/", _S.binary("-", _S.read(_v42, "t"), 0.04), 0.3))
		_S.call_value(_S.read(_v42, "icicle"), [_S.read(_v42, "p"), _S.read(_v42, "C"), _S.binary("+", _S.read(_v42, "jx"), 0.5), _S.read(_v42, "tp"), _S.read(_v42, "LEN"), _S.read(_v42, "W"), _S.merge([{"white": _S.logical("||", _S.binary(">=", _S.read(_v42, "t"), _S.binary("-", _S.read(_v42, "IMPACT"), 0.025)), func(): return _S.logical("&&", _S.binary(">=", _S.read(_v42, "t"), _S.read(_v42, "SNAP")), func(): return _S.binary("<", _S.read(_v42, "t"), _S.binary("+", _S.read(_v42, "SNAP"), 0.03))))}, {"glint": (_S.read(_v42, "gl") if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v42, "gl"), 0), func(): return _S.binary("<=", _S.read(_v42, "gl"), 1))) else _S.unary("-", 1))}])])
		if _S.truth(_S.logical("&&", _S.read(_v42, "snapped"), func(): return _S.binary("<", _S.read(_v42, "t"), _S.binary("+", _S.read(_v42, "SNAP"), 0.12)))):
			_S.invoke(_S.read(_v42, "p"), "line", [_S.binary("-", _S.binary("/", _S.unary("-", _S.read(_v42, "W")), 2), 1), _S.binary("+", _S.read(_v42, "ROOT"), 1), _S.binary("+", _S.binary("/", _S.read(_v42, "W"), 2), 1), _S.binary("+", _S.read(_v42, "ROOT"), 1), _S.read(_v42, "WHITE")])
		_S.invoke(_S.read(_v42, "p"), "glow", [0.5, _S.binary("+", _S.read(_v42, "tp"), _S.binary("*", _S.read(_v42, "LEN"), 0.5)), 20, _S.prop(_S.read(_v42, "C"), 4), 0.28])
		if _S.truth(_S.binary("<", _S.read(_v42, "t"), _S.read(_v42, "DRIP"))):
			var _v47 = _S.scope(_v42)
			_S.define(_v47, "s", _S.call_value(_S.read(_v47, "seg"), [_S.read(_v47, "t"), 0, _S.read(_v47, "DRIP")]))
			_S.invoke(_S.read(_v47, "p"), "dot", [0.5, _S.binary("+", _S.binary("+", _S.read(_v47, "ROOT"), _S.read(_v47, "LEN")), 1), _S.prop(_S.read(_v47, "C"), 6), _S.read(_v47, "s")])
			if _S.truth(_S.binary(">", _S.read(_v47, "s"), 0.6)):
				_S.invoke(_S.read(_v47, "p"), "px", [0.5, _S.binary("+", _S.binary("+", _S.read(_v47, "ROOT"), _S.read(_v47, "LEN")), 2), _S.read(_v47, "WHITE")])
	_S.invoke(_S.read(_e, "panes"), "draw", [_S.read(_e, "p"), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.75)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.4)) else _S.prop(_S.read(_e, "C"), 3)))
