@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/dark-explosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "ringLight", _S.import_value("fx/shadow/_lib.js", "ringLight"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "blackStar", _S.import_value("fx/shadow/_lib.js", "blackStar"))
	_S.define(_e, "attract", _S.import_value("fx/shadow/_lib.js", "attract"))
	_S.define(_e, "shard", _S.import_value("fx/shadow/_lib.js", "shard"))
	_S.define(_e, "sphere", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "floorRing", _S.function_value(_e, "_f25"))
	_S.define(_e, "meta", _S.merge([{"name": "Dark explosion"}, {"desc": "Motes swirl into a pulsing core, a black star cuts across a violet-white flash, and a black sphere burns at the rim, throws lit shards and smoke, then collapses."}, {"tags": ["shadow", "explosion", "void", "dark", "magic", "impact", "one-shot"]}, {"size": [280, 248]}, {"origin": [140, 206]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 54))
	_S.define(_e, "RS", 16)
	_S.define(_e, "REL", 0.52)
	_S.define(_e, "BURN", 1.62)
	_S.define(_e, "POP", 1.84)
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "hex"), ["#5d5468"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "heat", _S.arg(_args, 4))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.6)):
		return null
	_S.define(_e, "E", _S.binary("+", _S.binary("+", _S.read(_e, "r"), _S.binary("*", 12, _S.read(_e, "heat"))), 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "E")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "E")), _S.read(_e, "E"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "E")), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy")))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "E"))):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "r"), 0.5))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "e", _S.binary("-", _S.read(_v0, "r"), _S.read(_v0, "d")))
		_S.define(_v0, "ang", _S.invoke(_S.read(_v0, "Math"), "atan2", [_S.read(_v0, "dy"), _S.read(_v0, "dx")]))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v0, "e"), 1.4), func(): return _S.binary(">", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.binary("-", _S.read(_v0, "ang"), 0.8)]), 0.55))):
			return _S.prop(_S.read(_v0, "C"), 2)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v0, "r"), 8), func(): return _S.binary("<", _S.binary("+", _S.binary("**", _S.binary("+", _S.read(_v0, "dx"), _S.binary("*", _S.read(_v0, "r"), 0.45)), 2), _S.binary("**", _S.binary("+", _S.read(_v0, "dy"), _S.binary("*", _S.read(_v0, "r"), 0.45)), 2)), 1.6))):
			return _S.prop(_S.read(_v0, "C"), 3)
		return _S.prop(_S.read(_v0, "C"), 0)
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "r"), 0.5)))
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 1)):
		var _v1 = _S.scope(_e)
		_S.set_prop(_S.read(_v1, "out"), "c", (_S.read(_v1, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "atan2", [_S.read(_v1, "dy"), _S.read(_v1, "dx")]), 7), _S.binary("*", _S.read(_v1, "t"), 9))]), _S.unary("-", 0.6))) else _S.prop(_S.read(_v1, "C"), 7)), "=", false)
		_S.set_prop(_S.read(_v1, "out"), "k", 0.4, "=", false)
		return null
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("+", _S.read(_e, "dy"), _S.binary("*", _S.read(_e, "e"), 0.6)), _S.read(_e, "dx")]))
	_S.define(_e, "top", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))]))
	_S.define(_e, "a1", _S.binary("-", _S.read(_e, "ang"), _S.binary("*", _S.read(_e, "t"), 0.9)))
	_S.define(_e, "a2", _S.binary("+", _S.read(_e, "ang"), _S.binary("*", _S.read(_e, "t"), 1.7)))
	_S.define(_e, "i1", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("*", _S.read(_e, "a1"), 9), _S.read(_e, "TAU"))]))
	_S.define(_e, "i2", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("*", _S.read(_e, "a2"), 15), _S.read(_e, "TAU"))]))
	_S.define(_e, "T1", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "a1"), 9)]))), 3]), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 7), _S.binary("*", _S.read(_e, "i1"), 3.7)), 1])))))
	_S.define(_e, "T2", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "a2"), 15)]))), 4]), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 11), _S.binary("*", _S.read(_e, "i2"), 5.1)), 2])))))
	_S.define(_e, "h", _S.binary("*", _S.binary("*", _S.read(_e, "heat"), _S.binary("+", 0.3, _S.binary("*", 0.95, _S.read(_e, "top")))), _S.binary("+", _S.binary("+", 1.5, _S.binary("*", 12, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "T1")]))), _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "T2")])))))
	if _S.truth(_S.binary(">", _S.read(_e, "e"), _S.binary("+", _S.read(_e, "h"), 1))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "e"), 1), _S.read(_e, "h")))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.18)) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.62)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.84)) else _S.prop(_S.read(_e, "C"), 4))))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.8)) else _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 5)), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "u"), 0.6), func(): return _S.binary("===", _S.binary("&", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])), 1), 0))):
		_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_e, "u"))), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "release", _S.function_value(_e, "_f3"))
	_S.define(_e, "pop", _S.function_value(_e, "_f5"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}])]))
	_S.define(_e, "embers", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 1), 0.3]), _S.read(_e, "SMOKE"), 0.45]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.read(_e, "SMOKE"), 0.3])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.read(_e, "SMOKE"), 0.4])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "collapsing", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "acc", 0)
	_S.define(_e, "dustAcc", 0)
	_S.define(_e, "flick", 1)
	_S.define(_e, "coreR", _S.function_value(_e, "_f7"))
	_S.define(_e, "sphereR", _S.function_value(_e, "_f8"))
	_S.define(_e, "starL", _S.function_value(_e, "_f9"))
	_S.define(_e, "starRot", _S.function_value(_e, "_f10"))
	_S.define(_e, "burning", _S.function_value(_e, "_f11"))
	_S.define(_e, "light", _S.function_value(_e, "_f12"))
	_S.define(_e, "rim", _S.function_value(_e, "_f13"))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f18")}, {"draw": _S.function_value(_e, "_f19")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.call_value(_S.read(_e, "light"), [0, _S.read(_e, "Y"), 100, _S.prop(_S.read(_e, "C"), 4), 1.25, 0.85])
	_S.call_value(_S.read(_e, "light"), [0, _S.read(_e, "Y"), 86, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE"), 0.5]), 1.3, 0.22])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": _S.read(_e, "RS")}, {"r1": 104}, {"life": 0.46}, {"max": 0.46}, {"th": 3.6}, {"hot": true}, {"delay": 0}])])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": _S.binary("*", _S.read(_e, "RS"), 0.8)}, {"r1": 62}, {"life": 0.3}, {"max": 0.3}, {"th": 1.6}, {"hot": true}, {"delay": 0.02}])])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": _S.read(_e, "RS")}, {"r1": 124}, {"life": 0.62}, {"max": 0.62}, {"th": 1.2}, {"hot": false}, {"delay": 0.07}])])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 34)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "big", _S.binary("<", _S.read(_v3, "i"), 20))
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		var _v4 = _S.call_value(_S.read(_v3, "rim"), [_S.read(_v3, "a"), _S.binary("*", _S.read(_v3, "RS"), 0.7)])
		_S.define(_v3, "x", _S.prop(_v4, 0))
		_S.define(_v3, "y", _S.prop(_v4, 1))
		_S.define(_v3, "sp", (_S.invoke(_S.read(_v3, "R"), "range", [80, 170]) if _S.truth(_S.read(_v3, "big")) else _S.invoke(_S.read(_v3, "R"), "range", [130, 220])))
		_S.invoke(_S.read(_v3, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v3, "B"), "SHARD")}, {"x": _S.read(_v3, "x")}, {"y": _S.read(_v3, "y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [40, 110]))}, {"g": 0.75}, {"drag": (1.3 if _S.truth(_S.read(_v3, "big")) else 1.7)}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v3, "R"), "range", [1.6, 2.6])}, {"a": _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")])}, {"va": _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 16), 16])}, {"s": (_S.invoke(_S.read(_v3, "R"), "range", [6, 11]) if _S.truth(_S.read(_v3, "big")) else _S.invoke(_S.read(_v3, "R"), "range", [3, 4.5]))}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 84)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
		var _v7 = _S.call_value(_S.read(_v6, "rim"), [_S.read(_v6, "a"), _S.binary("*", _S.read(_v6, "RS"), 0.8)])
		_S.define(_v6, "x", _S.prop(_v7, 0))
		_S.define(_v6, "y", _S.prop(_v7, 1))
		_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [120, 235]))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.read(_v6, "x"), _S.read(_v6, "y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 50), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.7])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 28)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
		var _v10 = _S.call_value(_S.read(_v9, "rim"), [_S.read(_v9, "a"), _S.binary("*", _S.read(_v9, "RS"), 0.9)])
		_S.define(_v9, "x", _S.prop(_v10, 0))
		_S.define(_v9, "y", _S.prop(_v10, 1))
		_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [30, 130]))
		_S.invoke(_S.read(_v9, "embers"), "spawn", [_S.prop(_S.read(_v9, "P"), "EMBER"), _S.read(_v9, "x"), _S.read(_v9, "y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), 40), _S.invoke(_S.read(_v9, "R"), "range", [1.3, 2.5])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 24)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")]))
		var _v13 = _S.call_value(_S.read(_v12, "rim"), [_S.read(_v12, "a"), _S.binary("*", _S.read(_v12, "RS"), 0.9)])
		_S.define(_v12, "x", _S.prop(_v13, 0))
		_S.define(_v12, "y", _S.prop(_v13, 1))
		_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [15, 70]))
		_S.invoke(_S.read(_v12, "puffs"), "spawn", [_S.prop(_S.read(_v12, "PK"), "SOOT"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 0.8), 14), _S.invoke(_S.read(_v12, "R"), "range", [2, 2.8]), _S.invoke(_S.read(_v12, "R"), "range", [7, 12]), _S.invoke(_S.read(_v12, "R"), "range", [0.02, 0.3])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 12)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "s", (1 if _S.truth(_S.binary("%", _S.read(_v15, "i"), 2)) else _S.unary("-", 1)))
		_S.invoke(_S.read(_v15, "puffs"), "spawn", [_S.prop(_S.read(_v15, "PK"), "SOOT"), _S.binary("*", _S.read(_v15, "s"), _S.invoke(_S.read(_v15, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [2, 5])), _S.binary("*", _S.read(_v15, "s"), _S.invoke(_S.read(_v15, "R"), "range", [50, 120])), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [0, 10])), _S.invoke(_S.read(_v15, "R"), "range", [1.6, 2.4]), _S.invoke(_S.read(_v15, "R"), "range", [5, 9]), _S.invoke(_S.read(_v15, "R"), "range", [0.08, 0.2])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 10)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.6), 1.6])))
		var _v18 = _S.call_value(_S.read(_v17, "rim"), [_S.read(_v17, "a"), _S.read(_v17, "RS")])
		_S.define(_v17, "x", _S.prop(_v18, 0))
		_S.define(_v17, "y", _S.prop(_v18, 1))
		_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [30, 80]))
		_S.invoke(_S.read(_v17, "puffs"), "spawn", [_S.prop(_S.read(_v17, "PK"), "FLAME"), _S.read(_v17, "x"), _S.read(_v17, "y"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 30), _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v17, "R"), "range", [2, 3.6]), 0, _S.invoke(_S.read(_v17, "R"), "chance", [0.5])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.set_prop(_S.prop(_S.read(_e, "ps"), "list"), "length", 0, "=", false)
	_S.set_prop(_S.read(_e, "puffs"), "list", _S.invoke(_S.prop(_S.read(_e, "puffs"), "list"), "filter", [_S.function_value(_e, "_f4")]), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary(">", _S.prop(_S.read(_e, "q"), "delay"), 0)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.call_value(_S.read(_e, "light"), [0, _S.read(_e, "Y"), 56, _S.read(_e, "WHITE"), 0.9, 0.18])
	_S.call_value(_S.read(_e, "light"), [0, _S.read(_e, "Y"), 120, _S.prop(_S.read(_e, "C"), 5), 0.8, 0.5])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": 2}, {"r1": 40}, {"life": 0.28}, {"max": 0.28}, {"th": 2}, {"hot": true}, {"delay": 0}])])
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), 26)):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
		_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [120, 250]))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), 0, _S.read(_v20, "Y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 40), _S.invoke(_S.read(_v20, "R"), "range", [0.2, 0.6])])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), 14)):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "a", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
		_S.define(_v22, "sp", _S.invoke(_S.read(_v22, "R"), "range", [20, 90]))
		_S.invoke(_S.read(_v22, "embers"), "spawn", [_S.prop(_S.read(_v22, "P"), "EMBER"), 0, _S.read(_v22, "Y"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), 30), _S.invoke(_S.read(_v22, "R"), "range", [0.9, 1.6])])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "i"), 10)):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "a", _S.invoke(_S.read(_v24, "R"), "range", [0, _S.read(_v24, "TAU")]))
		_S.define(_v24, "sp", _S.invoke(_S.read(_v24, "R"), "range", [20, 70]))
		_S.invoke(_S.read(_v24, "puffs"), "spawn", [_S.prop(_S.read(_v24, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), 3), _S.binary("+", _S.read(_v24, "Y"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), 3)), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), 15), _S.invoke(_S.read(_v24, "R"), "range", [1.1, 1.7]), _S.invoke(_S.read(_v24, "R"), "range", [3, 6]), _S.invoke(_S.read(_v24, "R"), "range", [0, 0.08])])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "+=", true)
	for _v25 in _S.array(_S.concat([_S.array(_S.prop(_S.read(_e, "embers"), "list")), _S.array(_S.prop(_S.read(_e, "puffs"), "list"))])):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "q", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "dx", _S.prop(_S.read(_v27, "q"), "x"))
		_S.define(_v27, "dy", _S.binary("-", _S.prop(_S.read(_v27, "q"), "y"), _S.read(_v27, "Y")))
		_S.define(_v27, "d", _S.logical("||", _S.invoke(_S.read(_v27, "Math"), "hypot", [_S.read(_v27, "dx"), _S.read(_v27, "dy")]), func(): return 1))
		_S.define(_v27, "f", _S.binary("*", 90, _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v27, "d"), 70))])))
		_S.set_prop(_S.read(_v27, "q"), "vx", _S.binary("*", _S.binary("/", _S.read(_v27, "dx"), _S.read(_v27, "d")), _S.read(_v27, "f")), "+=", false)
		_S.set_prop(_S.read(_v27, "q"), "vy", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v27, "dy"), _S.read(_v27, "d")), _S.read(_v27, "f")), _S.binary("*", _S.read(_v27, "f"), 0.3)), "+=", false)
	var _v28 = _S.scope(_e)
	_S.define(_v28, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v28, "i"), 12)):
		_S.invoke(_S.read(_v28, "puffs"), "spawn", [_S.prop(_S.read(_v28, "PK"), "SOOT"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_v28, "Y"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 4), 6])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [20, 55])), _S.invoke(_S.read(_v28, "R"), "range", [1.3, 1.8]), _S.invoke(_S.read(_v28, "R"), "range", [7, 12]), _S.invoke(_S.read(_v28, "R"), "range", [0.02, 0.2])])
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "i", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (_S.binary("+", 1.5, _S.binary("*", 5, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "REL"))]))) if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.binary("-", _S.read(_e, "REL"), 0.07))) else 1)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "REL"))):
		return 0
	if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "BURN"))):
		return _S.binary("*", _S.binary("*", _S.read(_e, "RS"), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "REL")), 0.14)]), 2.4])), _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.06, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "REL"), 0.3), _S.read(_e, "BURN"), _S.read(_e, "tt")]))), _S.binary("*", 0.02, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "tt"), 11)]))))
	if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "POP"))):
		return _S.binary("*", _S.binary("*", _S.read(_e, "RS"), 1.08), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "BURN")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "BURN")))])))
	return 0

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (0 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "tt"), _S.read(_e, "REL")), func(): return _S.binary(">", _S.read(_e, "tt"), _S.binary("+", _S.read(_e, "REL"), 0.26)))) else _S.binary("*", 60, _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "REL")), 0.05), 0.21)])]))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("+", 0.32, _S.binary("*", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "REL")), 2.2))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return (_S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "REL"))]), 0.7) if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "REL"))) else (1 if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "BURN"))) else (1.2 if _S.truth(_S.binary("<", _S.read(_e, "tt"), _S.read(_e, "POP"))) else _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "POP")), 0.35))]))))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "c", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	return _S.invoke(_S.read(_e, "lights"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.read(_e, "r")}, {"c": _S.read(_e, "c")}, {"k": _S.read(_e, "k")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "r")), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "r")))]

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.write(_e, "flick", _S.binary("+", 0.88, _S.binary("*", _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 37)])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 23)]))), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "REL"), 0.06))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "k", _S.binary("/", _S.read(_v29, "t"), _S.read(_v29, "REL")))
		var _v30 = _S.scope(_v29)
		_S.write(_v30, "acc", _S.binary("*", _S.read(_v30, "dt"), _S.binary("+", 90, _S.binary("*", 150, _S.read(_v30, "k")))), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v30, "acc"), 1)):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.invoke(_S.read(_v31, "R"), "range", [0, _S.read(_v31, "TAU")]))
			_S.define(_v31, "D", _S.invoke(_S.read(_v31, "R"), "range", [36, 84]))
			_S.define(_v31, "x", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "D")))
			_S.define(_v31, "y", _S.invoke(_S.read(_v31, "Math"), "min", [_S.unary("-", 3), _S.binary("+", _S.read(_v31, "Y"), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "D")))]))
			_S.define(_v31, "vt", _S.invoke(_S.read(_v31, "R"), "range", [50, 110]))
			_S.define(_v31, "vi", _S.invoke(_S.read(_v31, "R"), "range", [10, 40]))
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "MOTE"), _S.read(_v31, "x"), _S.read(_v31, "y"), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")])), _S.read(_v31, "vt")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "vi"))), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "vt")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "vi"))), 0.9, _S.invoke(_S.read(_v31, "R"), "pick", [[_S.read(_v31, "WHITE"), _S.prop(_S.read(_v31, "C"), 6), _S.prop(_S.read(_v31, "C"), 6), _S.prop(_S.read(_v31, "C"), 5)]]), _S.invoke(_S.read(_v31, "R"), "range", [0.7, 1.2])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.75])):
			var _v32 = _S.scope(_v29)
			_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [0, _S.read(_v32, "TAU")]))
			_S.define(_v32, "D", _S.invoke(_S.read(_v32, "R"), "range", [28, 70]))
			_S.define(_v32, "T", _S.invoke(_S.read(_v32, "R"), "range", [0.18, 0.28]))
			_S.define(_v32, "v", _S.binary("/", _S.binary("*", _S.read(_v32, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v32, "Math"), "exp", [_S.binary("*", 3, _S.read(_v32, "T"))]), 1)))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "D")), _S.binary("+", _S.read(_v32, "Y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")])), _S.read(_v32, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")])), _S.read(_v32, "v")), _S.read(_v32, "T"), (_S.prop(_S.read(_v32, "C"), 7) if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.5])) else _S.prop(_S.read(_v32, "C"), 6))])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v29, "t"), _S.binary("-", _S.read(_v29, "REL"), 0.2)), func(): return _S.invoke(_S.read(_v29, "R"), "chance", [0.16]))):
			var _v33 = _S.scope(_v29)
			_S.define(_v33, "a", _S.invoke(_S.read(_v33, "R"), "range", [0, _S.read(_v33, "TAU")]))
			_S.define(_v33, "D", _S.invoke(_S.read(_v33, "R"), "range", [34, 60]))
			_S.invoke(_S.read(_v33, "puffs"), "spawn", [_S.prop(_S.read(_v33, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")]), _S.read(_v33, "D")), _S.binary("+", _S.read(_v33, "Y"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")]), _S.read(_v33, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")])), 40), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")]), 40), _S.invoke(_S.read(_v33, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v33, "R"), "range", [3, 6])])
		_S.call_value(_S.read(_v29, "attract"), [_S.prop(_S.read(_v29, "ps"), "list"), 0, _S.read(_v29, "Y"), _S.binary("*", 2200000, _S.binary("+", 0.3, _S.read(_v29, "k"))), 110, 0.55, 2.5, _S.read(_v29, "dt"), _S.function_value(_v29, "_f15"), 420])
		_S.call_value(_S.read(_v29, "attract"), [_S.prop(_S.read(_v29, "puffs"), "list"), 0, _S.read(_v29, "Y"), _S.binary("*", 1200000, _S.binary("+", 0.3, _S.read(_v29, "k"))), 90, 0.7, 4, _S.read(_v29, "dt"), _S.function_value(_v29, "_f16"), 160])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "REL")), func(): return _S.unary("!", _S.read(_e, "released")))):
		var _v34 = _S.scope(_e)
		_S.write(_v34, "released", true, "=", false)
		_S.call_value(_S.read(_v34, "release"), [])
	if _S.truth(_S.logical("&&", _S.read(_e, "released"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURN")))):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "sr", _S.call_value(_S.read(_v35, "sphereR"), [_S.read(_v35, "t")]))
		var _v36 = _S.scope(_v35)
		_S.write(_v36, "acc", _S.binary("*", _S.read(_v36, "dt"), 34), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v36, "acc"), 1)):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v37, "Math"), "PI")), 2), _S.binary("*", _S.invoke(_S.read(_v37, "R"), "gauss", []), 1.1)))
			var _v38 = _S.call_value(_S.read(_v37, "rim"), [_S.read(_v37, "a"), _S.binary("+", _S.read(_v37, "sr"), 1)])
			_S.define(_v37, "x", _S.prop(_v38, 0))
			_S.define(_v37, "y", _S.prop(_v38, 1))
			_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "R"), "range", [10, 35]))
			_S.invoke(_S.read(_v37, "puffs"), "spawn", [_S.prop(_S.read(_v37, "PK"), "FLAME"), _S.read(_v37, "x"), _S.read(_v37, "y"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.invoke(_S.read(_v37, "R"), "range", [10, 30])), _S.invoke(_S.read(_v37, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v37, "R"), "range", [1.2, 2.2]), 0, _S.invoke(_S.read(_v37, "R"), "chance", [0.2])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 10)])):
			var _v39 = _S.scope(_v35)
			_S.define(_v39, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 2), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			var _v40 = _S.call_value(_S.read(_v39, "rim"), [_S.read(_v39, "a"), _S.binary("*", _S.read(_v39, "sr"), 0.9)])
			_S.define(_v39, "x", _S.prop(_v40, 0))
			_S.define(_v39, "y", _S.prop(_v40, 1))
			_S.invoke(_S.read(_v39, "puffs"), "spawn", [_S.prop(_S.read(_v39, "PK"), "SOOT"), _S.read(_v39, "x"), _S.read(_v39, "y"), _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "cos", [_S.read(_v39, "a")]), 20), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [15, 35])), _S.invoke(_S.read(_v39, "R"), "range", [1.2, 1.7]), _S.invoke(_S.read(_v39, "R"), "range", [5, 9])])
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 8)])):
			var _v41 = _S.scope(_v35)
			_S.define(_v41, "a", _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")]))
			var _v42 = _S.call_value(_S.read(_v41, "rim"), [_S.read(_v41, "a"), _S.read(_v41, "sr")])
			_S.define(_v41, "x", _S.prop(_v42, 0))
			_S.define(_v41, "y", _S.prop(_v42, 1))
			_S.define(_v41, "sp", _S.invoke(_S.read(_v41, "R"), "range", [110, 200]))
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "SPARK"), _S.read(_v41, "x"), _S.read(_v41, "y"), _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "a")]), _S.read(_v41, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "a")]), _S.read(_v41, "sp")), 40), _S.invoke(_S.read(_v41, "R"), "range", [0.2, 0.5])])
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 7)])):
			var _v43 = _S.scope(_v35)
			_S.define(_v43, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v43, "Math"), "PI")), 2), _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			var _v44 = _S.call_value(_S.read(_v43, "rim"), [_S.read(_v43, "a"), _S.read(_v43, "sr")])
			_S.define(_v43, "x", _S.prop(_v44, 0))
			_S.define(_v43, "y", _S.prop(_v44, 1))
			_S.invoke(_S.read(_v43, "embers"), "spawn", [_S.prop(_S.read(_v43, "P"), "EMBER"), _S.read(_v43, "x"), _S.read(_v43, "y"), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "cos", [_S.read(_v43, "a")]), 30), _S.unary("-", _S.invoke(_S.read(_v43, "R"), "range", [20, 50])), _S.invoke(_S.read(_v43, "R"), "range", [0.9, 1.6])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURN")), func(): return _S.unary("!", _S.read(_e, "collapsing")))):
		var _v45 = _S.scope(_e)
		_S.write(_v45, "collapsing", true, "=", false)
		var _v46 = _S.scope(_v45)
		_S.define(_v46, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), 14)):
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "a", _S.invoke(_S.read(_v47, "R"), "range", [0, _S.read(_v47, "TAU")]))
			_S.define(_v47, "D", _S.invoke(_S.read(_v47, "R"), "range", [26, 48]))
			_S.define(_v47, "T", _S.invoke(_S.read(_v47, "R"), "range", [0.14, 0.2]))
			_S.define(_v47, "v", _S.binary("/", _S.binary("*", _S.read(_v47, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v47, "Math"), "exp", [_S.binary("*", 3, _S.read(_v47, "T"))]), 1)))
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")]), _S.read(_v47, "D")), _S.binary("+", _S.read(_v47, "Y"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")]), _S.read(_v47, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")])), _S.read(_v47, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")])), _S.read(_v47, "v")), _S.read(_v47, "T"), (_S.read(_v47, "WHITE") if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 6))])
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "collapsing"), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v48 = _S.scope(_e)
		_S.call_value(_S.read(_v48, "attract"), [_S.prop(_S.read(_v48, "puffs"), "list"), 0, _S.read(_v48, "Y"), 1400000, 64, 0.6, 3, _S.read(_v48, "dt"), _S.function_value(_v48, "_f17"), 200])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v49 = _S.scope(_e)
		_S.write(_v49, "popped", true, "=", false)
		_S.call_value(_S.read(_v49, "pop"), [])
	for _v50 in _S.array(_S.read(_e, "rings")):
		var _v51 = _S.scope(_e)
		_S.define(_v51, "r", _v50)
		var _v52 = _S.scope(_v51)
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_v52, "r"), "delay"), 0), func(): return _S.unary("!", _S.prop(_S.read(_v52, "r"), "hot"))), func(): return _S.binary("<", _S.prop(_S.read(_v52, "r"), "th"), 3))):
			continue
		_S.define(_v52, "rr", _S.binary("+", _S.prop(_S.read(_v52, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v52, "r"), "r1"), _S.prop(_S.read(_v52, "r"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_v52, "Math"), "pow", [_S.binary("/", _S.prop(_S.read(_v52, "r"), "life"), _S.prop(_S.read(_v52, "r"), "max")), 3])))))
		_S.define(_v52, "rf", (_S.invoke(_S.read(_v52, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v52, "rr"), _S.read(_v52, "rr")), _S.binary("*", _S.read(_v52, "Y"), _S.read(_v52, "Y")))]) if _S.truth(_S.binary(">", _S.read(_v52, "rr"), _S.unary("-", _S.read(_v52, "Y")))) else 0))
		if _S.truth(_S.binary(">", _S.read(_v52, "rf"), 0)):
			var _v53 = _S.scope(_v52)
			_S.write(_v53, "dustAcc", _S.binary("*", _S.read(_v53, "dt"), 60), "+=", false)
			while _S.truth(_S.binary(">", _S.read(_v53, "dustAcc"), 1)):
				var _v54 = _S.scope(_v53)
				_S.define(_v54, "s", _S.invoke(_S.read(_v54, "R"), "sign", []))
				_S.invoke(_S.read(_v54, "ps"), "spawn", [_S.prop(_S.read(_v54, "P"), "DUST"), _S.binary("+", _S.binary("*", _S.read(_v54, "s"), _S.read(_v54, "rf")), _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [1, 3])), _S.binary("*", _S.read(_v54, "s"), _S.invoke(_S.read(_v54, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [4, 14])), _S.invoke(_S.read(_v54, "R"), "range", [0.4, 0.8]), _S.call_value(_S.read(_v54, "mix"), [_S.prop(_S.read(_v54, "C"), 2), _S.prop(_S.read(_v54, "C"), 3), _S.invoke(_S.read(_v54, "R"), "next", [])]), _S.invoke(_S.read(_v54, "R"), "range", [1.5, 3])])
				_v53 = _S.iteration(_v53)
				_S.write(_v53, "dustAcc", 1, "-=", true)
	for _v55 in _S.array([_S.read(_e, "lights"), _S.read(_e, "rings")]):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "a", _v55)
		var _v57 = _S.scope(_v56)
		_S.define(_v57, "i", _S.binary("-", _S.prop(_S.read(_v57, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v57, "i"), 0)):
			var _v58 = _S.scope(_v57)
			_S.define(_v58, "q", _S.prop(_S.read(_v58, "a"), _S.read(_v58, "i")))
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v58, "q"), "delay"), 0)):
				_S.set_prop(_S.read(_v58, "q"), "delay", _S.read(_v58, "dt"), "-=", false)
			else:
				if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v58, "q"), "life", _S.read(_v58, "dt"), "-=", false), 0)):
					_S.invoke(_S.read(_v58, "a"), "splice", [_S.read(_v58, "i"), 1])
			_v57 = _S.iteration(_v57)
			_S.write(_v57, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v59 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v60 = _S.scope(_e)
		_S.define(_v60, "b", _v59)
		var _v61 = _S.scope(_v60)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v61, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v61, "b"), "flat")))):
			var _v62 = _S.scope(_v61)
			_S.set_prop(_S.read(_v62, "b"), "flat", true, "=", false)
			_S.set_prop(_S.read(_v62, "b"), "a", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v62, "b"), "a"), _S.prop(_S.read(_v62, "Math"), "PI"))]), _S.prop(_S.read(_v62, "Math"), "PI")), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 0.2), 0.2])), "=", false)
			_S.set_prop(_S.read(_v62, "b"), "y", _S.unary("-", 1), "=", false)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v61, "b"), "life"), 0.45), func(): return _S.unary("!", _S.prop(_S.read(_v61, "b"), "wisp")))):
			var _v63 = _S.scope(_v61)
			_S.set_prop(_S.read(_v63, "b"), "wisp", true, "=", false)
			_S.invoke(_S.read(_v63, "puffs"), "spawn", [_S.prop(_S.read(_v63, "PK"), "SOOT"), _S.prop(_S.read(_v63, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v63, "b"), "y"), 1), _S.invoke(_S.read(_v63, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v63, "R"), "range", [8, 16])), _S.invoke(_S.read(_v63, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v63, "R"), "range", [1.4, 2.4])])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "embers"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "q"), "k"), _S.prop(_S.read(_e, "P"), "MOTE"))) else 0)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 1

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "q"), "k"), _S.prop(_S.read(_e, "PK"), "FLAME"))) else 0.35)

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "burning"), [_S.read(_e, "t")]))
	for _v64 in _S.array(_S.read(_e, "rings")):
		var _v65 = _S.scope(_e)
		_S.define(_v65, "r", _v64)
		_S.call_value(_S.read(_v65, "floorRing"), [_S.read(_v65, "p"), _S.read(_v65, "C"), _S.read(_v65, "r"), true])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT"), _S.merge([{"x": 0}, {"y": _S.read(_e, "Y")}, {"k": _S.binary("*", _S.read(_e, "k"), _S.read(_e, "flick"))}, {"reach": 84}])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 3), 74, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.24, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "k")])), _S.read(_e, "flick"))])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "sr", _S.call_value(_S.read(_e, "sphereR"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "burning"), [_S.read(_e, "t")]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "starL"), [_S.read(_e, "t")]))
	for _v66 in _S.array(_S.read(_e, "rings")):
		var _v67 = _S.scope(_e)
		_S.define(_v67, "r", _v66)
		_S.call_value(_S.read(_v67, "floorRing"), [_S.read(_v67, "p"), _S.read(_v67, "C"), _S.read(_v67, "r"), false])
	_S.define(_e, "cr", 0)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v68 = _S.scope(_e)
		_S.define(_v68, "q", _S.binary("/", _S.read(_v68, "t"), _S.read(_v68, "REL")))
		_S.define(_v68, "ring", _S.binary("+", 3, _S.binary("*", 74, _S.binary("-", 1, _S.invoke(_S.read(_v68, "ease"), "inQuad", [_S.read(_v68, "q")])))))
		_S.define(_v68, "beat", _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_v68, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v68, "t"), _S.binary("*", _S.read(_v68, "REL"), 0.5)), 2)), 0.0015)]))), _S.binary("*", 0.4, _S.invoke(_S.read(_v68, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v68, "t"), _S.binary("*", _S.read(_v68, "REL"), 0.8)), 2)), 0.0015)]))))
		_S.write(_v68, "cr", _S.binary("*", _S.call_value(_S.read(_v68, "coreR"), [_S.read(_v68, "t")]), _S.read(_v68, "beat")), "=", false)
		_S.call_value(_S.read(_v68, "ringFast"), [_S.read(_v68, "p"), 0, _S.read(_v68, "Y"), _S.read(_v68, "ring"), 1, (_S.prop(_S.read(_v68, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v68, "q"), 0.7)) else _S.prop(_S.read(_v68, "C"), 5)), _S.binary("+", 0.2, _S.binary("*", 0.7, _S.read(_v68, "q")))])
		if _S.truth(_S.binary(">", _S.read(_v68, "t"), _S.binary("-", _S.read(_v68, "REL"), 0.07))):
			_S.invoke(_S.read(_v68, "p"), "circle", [0, _S.read(_v68, "Y"), 1.6, _S.read(_v68, "WHITE")])
		else:
			_S.call_value(_S.read(_v68, "sphere"), [_S.read(_v68, "p"), _S.read(_v68, "C"), _S.read(_v68, "cr"), _S.read(_v68, "t"), _S.binary("+", 0.3, _S.binary("*", 0.3, _S.read(_v68, "q")))])
		_S.call_value(_S.read(_v68, "halo"), [_S.read(_v68, "p"), 0, _S.read(_v68, "Y"), _S.read(_v68, "cr"), _S.binary("+", _S.binary("+", _S.read(_v68, "cr"), 14), _S.binary("*", 30, _S.read(_v68, "q"))), _S.prop(_S.read(_v68, "C"), 5), _S.binary("*", _S.binary("+", 0.45, _S.binary("*", 0.7, _S.read(_v68, "q"))), _S.read(_v68, "beat"))])
		_S.invoke(_S.read(_v68, "p"), "glow", [0, _S.read(_v68, "Y"), _S.binary("+", 60, _S.binary("*", 30, _S.read(_v68, "q"))), _S.prop(_S.read(_v68, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.3, _S.read(_v68, "q")))])
	_S.define(_e, "fu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "REL")), 0.12))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "fu"), 0), func(): return _S.binary("<", _S.read(_e, "fu"), 1))):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "r", _S.binary("*", 36, _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v69, "fu")))))
		_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.binary("+", _S.read(_v69, "r"), 1.5), _S.prop(_S.read(_v69, "C"), 5), _S.binary("-", 1.2, _S.read(_v69, "fu"))])
		_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.read(_v69, "r"), (_S.read(_v69, "WHITE") if _S.truth(_S.binary("<", _S.read(_v69, "fu"), 0.35)) else _S.prop(_S.read(_v69, "C"), 6)), _S.binary("-", 1.1, _S.read(_v69, "fu"))])
		if _S.truth(_S.binary("<", _S.read(_v69, "fu"), 0.6)):
			_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.binary("*", _S.read(_v69, "r"), 0.62), _S.read(_v69, "WHITE")])
	for _v70 in _S.array(_S.read(_e, "rings")):
		var _v71 = _S.scope(_e)
		_S.define(_v71, "r", _v70)
		var _v72 = _S.scope(_v71)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v72, "r"), "delay"), 0)):
			continue
		_S.define(_v72, "q", _S.binary("/", _S.prop(_S.read(_v72, "r"), "life"), _S.prop(_S.read(_v72, "r"), "max")))
		_S.define(_v72, "rr", _S.binary("+", _S.prop(_S.read(_v72, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v72, "r"), "r1"), _S.prop(_S.read(_v72, "r"), "r0")), _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_v72, "q"), _S.read(_v72, "q")), _S.read(_v72, "q"))))))
		_S.define(_v72, "th", _S.invoke(_S.read(_v72, "Math"), "max", [1, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v72, "r"), "th"), _S.read(_v72, "q")), 0.4)]))
		_S.call_value(_S.read(_v72, "ringFast"), [_S.read(_v72, "p"), 0, _S.read(_v72, "Y"), _S.read(_v72, "rr"), _S.read(_v72, "th"), _S.function_value(_v72, "_f20"), _S.function_value(_v72, "_f21")])
		if _S.truth(_S.prop(_S.read(_v72, "r"), "hot")):
			_S.call_value(_S.read(_v72, "ringLight"), [_S.read(_v72, "p"), 0, _S.read(_v72, "Y"), _S.read(_v72, "rr"), 4, _S.prop(_S.read(_v72, "C"), 5), _S.binary("*", 0.4, _S.read(_v72, "q")), _S.function_value(_v72, "_f22")])
	_S.call_value(_S.read(_e, "sphere"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sr"), _S.read(_e, "t"), (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURN"))) else _S.binary("+", 1, _S.binary("*", 0.5, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURN")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "BURN")))]))))])
	_S.define(_e, "star", (_S.call_value(_S.read(_e, "blackStar"), [_S.read(_e, "Y"), _S.read(_e, "L"), _S.call_value(_S.read(_e, "starRot"), [_S.read(_e, "t")]), 0.5, 0.4]) if _S.truth(_S.binary(">", _S.read(_e, "L"), 0)) else null))
	if _S.truth(_S.read(_e, "star")):
		var _v73 = _S.scope(_e)
		_S.define(_v73, "age", _S.binary("-", _S.read(_v73, "t"), _S.read(_v73, "REL")))
		_S.define(_v73, "fr", (_S.binary("+", _S.binary("*", 36, _S.binary("-", 1, _S.binary("*", 0.3, _S.binary("/", _S.read(_v73, "age"), 0.12)))), 1.5) if _S.truth(_S.binary("<", _S.read(_v73, "age"), 0.12)) else 0))
		_S.define(_v73, "cut", _S.invoke(_S.read(_v73, "Math"), "max", [_S.read(_v73, "fr"), _S.read(_v73, "sr")]))
		_S.invoke(_S.read(_v73, "star"), "draw", [_S.read(_v73, "p"), _S.prop(_S.read(_v73, "C"), 0), (_S.prop(_S.read(_v73, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v73, "age"), 0.1)) else _S.prop(_S.read(_v73, "C"), 4)), _S.function_value(_v73, "_f23")])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "FLAME")])
	for _v74 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v75 = _S.scope(_e)
		_S.define(_v75, "b", _v74)
		_S.call_value(_S.read(_v75, "shard"), [_S.read(_v75, "p"), _S.read(_v75, "b"), _S.read(_v75, "C"), 0, _S.read(_v75, "Y"), _S.binary("*", _S.invoke(_S.read(_v75, "Math"), "min", [1, _S.read(_v75, "k")]), 0.9)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "embers"), "draw", [_S.read(_e, "p"), "front"])
	_S.define(_e, "pu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.2))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "pu"), 0), func(): return _S.binary("<", _S.read(_e, "pu"), 1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.read(_e, "Y"), _S.binary("*", 12, _S.binary("-", 1, _S.read(_e, "pu"))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.binary("-", 1, _S.read(_e, "pu")))])
	for _v76 in _S.array(_S.read(_e, "lights")):
		var _v77 = _S.scope(_e)
		_S.define(_v77, "l", _v76)
		var _v78 = _S.scope(_v77)
		_S.define(_v78, "q", _S.binary("/", _S.prop(_S.read(_v78, "l"), "life"), _S.prop(_S.read(_v78, "l"), "max")))
		_S.invoke(_S.read(_v78, "p"), "glow", [_S.prop(_S.read(_v78, "l"), "x"), _S.prop(_S.read(_v78, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v78, "l"), "r"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_v78, "q")))), _S.prop(_S.read(_v78, "l"), "c"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v78, "l"), "k"), _S.read(_v78, "q")), _S.read(_v78, "q"))])
	if _S.truth(_S.binary(">", _S.read(_e, "sr"), 1)):
		var _v79 = _S.scope(_e)
		_S.call_value(_S.read(_v79, "halo"), [_S.read(_v79, "p"), 0, _S.read(_v79, "Y"), _S.binary("-", _S.read(_v79, "sr"), 0.5), _S.binary("+", _S.read(_v79, "sr"), 16), _S.prop(_S.read(_v79, "C"), 6), _S.binary("*", _S.binary("*", 0.5, _S.read(_v79, "flick")), _S.invoke(_S.read(_v79, "Math"), "min", [1, _S.read(_v79, "k")]))])
		_S.invoke(_S.read(_v79, "p"), "glow", [0, _S.read(_v79, "Y"), _S.binary("+", _S.read(_v79, "sr"), 54), _S.prop(_S.read(_v79, "C"), 4), _S.binary("*", _S.binary("*", 0.5, _S.read(_v79, "flick")), _S.invoke(_S.read(_v79, "Math"), "min", [1, _S.read(_v79, "k")]))])
	_S.define(_e, "B0", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "sr"), _S.read(_e, "cr")]), 1))
	if _S.truth(_S.binary(">", _S.read(_e, "B0"), 2)):
		_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", _S.read(_e, "B0")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B0")), _S.read(_e, "B0"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "B0")), _S.function_value(_e, "_f24")])
	if _S.truth(_S.read(_e, "star")):
		_S.invoke(_S.read(_e, "star"), "unlight", [_S.read(_e, "p")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.6)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))) if _S.truth(_S.prop(_S.read(_e, "r"), "hot")) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "rr"))), 0.5)) else _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 1.6)]))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<", _S.read(_e, "y"), 0.5)

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("**", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")), 2)), _S.binary("*", _S.read(_e, "cut"), _S.read(_e, "cut")))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("**", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")), 2)), _S.binary("**", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "sr"), _S.read(_e, "cr")]), 0.5), 2))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_e, "r"), "delay"), 0), func(): return _S.unary("!", _S.prop(_S.read(_e, "r"), "hot"))), func(): return _S.binary("<", _S.prop(_S.read(_e, "r"), "th"), 3))):
		return null
	_S.define(_e, "q", _S.binary("/", _S.prop(_S.read(_e, "r"), "life"), _S.prop(_S.read(_e, "r"), "max")))
	_S.define(_e, "rr", _S.binary("+", _S.prop(_S.read(_e, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "r"), "r1"), _S.prop(_S.read(_e, "r"), "r0")), _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.read(_e, "q")), _S.read(_e, "q"))))))
	if _S.truth(_S.binary("<=", _S.read(_e, "rr"), _S.unary("-", _S.read(_e, "Y")))):
		return null
	_S.define(_e, "rf", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_e, "rr"), _S.read(_e, "rr")), _S.binary("*", _S.read(_e, "Y"), _S.read(_e, "Y")))]))
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.read(_e, "rf"), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.read(_e, "q"))]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 1.5)]), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)], _S.function_value(_e, "_f26")])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		for _v80 in _S.array([_S.unary("-", 1), 1]):
			var _v81 = _S.scope(_e)
			_S.define(_v81, "s", _v80)
			_S.invoke(_S.read(_v81, "p"), "glow", [_S.binary("*", _S.read(_v81, "s"), _S.read(_v81, "rf")), _S.unary("-", 2), 16, _S.prop(_S.read(_v81, "C"), 5), _S.binary("*", 0.4, _S.read(_v81, "q"))])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "back"))
