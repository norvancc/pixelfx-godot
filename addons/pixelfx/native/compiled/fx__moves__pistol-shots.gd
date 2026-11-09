@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/pistol-shots.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "muzzle", _S.import_value("fx/projectiles/muzzle-pistol.js", null))
	_S.define(_e, "tracer", _S.import_value("fx/projectiles/bullet-tracer.js", null))
	_S.define(_e, "spark", _S.import_value("fx/impacts/hit-spark.js", null))
	_S.define(_e, "SHOTS", [0.14, 0.42, 0.7])
	_S.define(_e, "FLY", 0.12)
	_S.define(_e, "TX", 180)
	_S.define(_e, "BY", _S.unary("-", 32))
	_S.define(_e, "MX", 28)
	_S.define(_e, "meta", _S.merge([{"name": "Pistol shots"}, {"desc": "Three aimed shots: the gun kicks up each time and settles, tracers cross the floor, and the target staggers under each hit."}, {"tags": ["move", "gun", "pistol", "projectile", "ranged", "one-shot"]}, {"size": [378, 76]}, {"origin": [111, 72]}, {"duration": 2.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "pistol"}, {"sa": 0.9}, {"fx": 10}, {"fy": _S.unary("-", 17)}, {"bx": 7}, {"by": _S.unary("-", 16)}]))
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "REST_"), {"crouch": 3}, {"lean": 2}, {"fx": 18}, {"fy": _S.unary("-", 28)}, {"sa": 0}, {"bx": 12}, {"by": _S.unary("-", 25)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "KICK", _S.merge([_S.read(_e, "AIM"), {"lean": 0}, {"fx": 16}, {"fy": _S.unary("-", 33)}, {"sa": _S.unary("-", 0.45)}, {"by": _S.unary("-", 28)}]))
	_S.define(_e, "keys", _S.invoke(_S.read(_e, "SHOTS"), "flatMap", [_S.function_value(_e, "_f0")]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": _S.concat([[[_S.unary("-", 0.36), _S.read(_e, "REST_")]], [[_S.unary("-", 0.06), _S.read(_e, "AIM")]], _S.array(_S.read(_e, "keys")), [[1.2, _S.merge([_S.read(_e, "AIM"), {"crouch": 1}])]], [[1.7, _S.read(_e, "REST_")]], [[2.6, _S.read(_e, "REST_")]]])}, {"hits": _S.invoke(_S.read(_e, "SHOTS"), "map", [_S.function_value(_e, "_f1")])}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [_S.concat([_S.array(_S.invoke(_S.read(_e, "SHOTS"), "flatMap", [_S.function_value(_e, "_f2")]))])]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return [[_S.read(_e, "t"), _S.read(_e, "AIM")], [_S.binary("+", _S.read(_e, "t"), 0.001), _S.read(_e, "KICK"), "snap"], [_S.binary("+", _S.read(_e, "t"), 0.14), _S.read(_e, "AIM")]]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"t": _S.binary("+", _S.read(_e, "t"), _S.read(_e, "FLY"))}, {"stop": (0.08 if _S.truth(_S.binary("===", _S.read(_e, "i"), 2)) else 0.04)}, {"shake": 0.1}, {"amp": _S.binary("+", 1, (1 if _S.truth(_S.binary("===", _S.read(_e, "i"), 2)) else 0))}, {"push": (_S.unary("-", 1.8) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 2)}, {"straw": 10}, {"y": _S.unary("-", 30)}, {"kick": 1}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return [_S.merge([{"fx": _S.read(_e, "muzzle")}, {"t": _S.read(_e, "t")}, {"x": _S.read(_e, "MX")}, {"height": _S.unary("-", _S.read(_e, "BY"))}]), _S.merge([{"fx": _S.read(_e, "tracer")}, {"t": _S.read(_e, "t")}, {"until": _S.binary("+", _S.read(_e, "t"), _S.read(_e, "FLY"))}, {"x": _S.function_value(_e, "_f3")}, {"y": _S.read(_e, "BY")}]), _S.merge([{"fx": _S.read(_e, "spark")}, {"t": _S.binary("+", _S.read(_e, "t"), _S.read(_e, "FLY"))}, {"x": _S.binary("-", _S.read(_e, "TX"), 10)}, {"height": 28}])]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.read(_e, "MX"), 4), _S.binary("*", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "t")), _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "TX"), _S.read(_e, "MX")), 14), _S.read(_e, "FLY"))))
