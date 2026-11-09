@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/arrow-shot.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "arrow", _S.import_value("fx/projectiles/arrow.js", null))
	_S.define(_e, "spark", _S.import_value("fx/impacts/hit-spark.js", null))
	_S.define(_e, "LOOSE", 0.56)
	_S.define(_e, "FLY", 0.24)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "LOOSE"), _S.read(_e, "FLY")))
	_S.define(_e, "TX", 180)
	_S.define(_e, "SPEED", _S.binary("/", _S.binary("-", _S.read(_e, "TX"), 30), _S.read(_e, "FLY")))
	_S.define(_e, "meta", _S.merge([{"name": "Arrow shot"}, {"desc": "He raises the bow, draws to his cheek, holds his breath and looses: the string snaps forward, the arrow crosses the floor and thuds home."}, {"tags": ["move", "bow", "arrow", "projectile", "ranged", "one-shot"]}, {"size": [300, 74]}, {"origin": [38, 66]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "bow"}, {"sa": _S.unary("-", 0.4)}, {"fx": 12}, {"fy": _S.unary("-", 20)}, {"bx": 6}, {"by": _S.unary("-", 17)}]))
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "REST_"), {"crouch": 3}, {"lean": 1}, {"fx": 18}, {"fy": _S.unary("-", 28)}, {"sa": 0}, {"bx": 10}, {"by": _S.unary("-", 27)}, {"nocked": true}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "DRAWN", _S.merge([_S.read(_e, "AIM"), {"crouch": 4}, {"lean": _S.unary("-", 2)}, {"fx": 18}, {"bx": _S.unary("-", 3)}, {"by": _S.unary("-", 29)}, {"pull": true}]))
	_S.define(_e, "LOOSED", _S.merge([_S.read(_e, "AIM"), {"crouch": 3}, {"lean": 2}, {"fx": 19}, {"fy": _S.unary("-", 28)}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 32)}, {"nocked": false}, {"pull": false}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.44), _S.read(_e, "REST_")], [_S.unary("-", 0.14), _S.read(_e, "AIM")], [0.16, _S.read(_e, "DRAWN")], [_S.read(_e, "LOOSE"), _S.merge([_S.read(_e, "DRAWN"), {"crouch": 4}])], [_S.binary("+", _S.read(_e, "LOOSE"), 0.002), _S.read(_e, "LOOSED"), "snap"], [1.1, _S.merge([_S.read(_e, "LOOSED"), {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 25)}])], [1.6, _S.read(_e, "REST_")], [1.9, _S.read(_e, "REST_")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.07}, {"shake": 0.12}, {"amp": 2}, {"push": 2.2}, {"straw": 14}, {"y": _S.unary("-", 28)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "arrow")}, {"t": _S.read(_e, "LOOSE")}, {"until": _S.read(_e, "HIT")}, {"x": _S.function_value(_e, "_f0")}, {"y": _S.unary("-", 28)}]), _S.merge([{"fx": _S.read(_e, "spark")}, {"t": _S.read(_e, "HIT")}, {"x": _S.binary("-", _S.read(_e, "TX"), 10)}, {"height": 30}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 30, _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LOOSE")), _S.read(_e, "SPEED")))
