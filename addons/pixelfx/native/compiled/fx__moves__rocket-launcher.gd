@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/rocket-launcher.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "muzzle", _S.import_value("fx/projectiles/muzzle-shotgun.js", null))
	_S.define(_e, "rocket", _S.import_value("fx/projectiles/rocket.js", null))
	_S.define(_e, "blast", _S.import_value("fx/explosions/small-explosion.js", null))
	_S.define(_e, "FIRE", 0.6)
	_S.define(_e, "FLY", 0.56)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "FIRE"), _S.read(_e, "FLY")))
	_S.define(_e, "TX", 200)
	_S.define(_e, "MY", _S.unary("-", 21))
	_S.define(_e, "MX", 34)
	_S.define(_e, "meta", _S.merge([{"name": "Rocket launcher"}, {"desc": "He drops to one knee, shoulders the tube and fires: the kick shoves him back along the floor, the rocket crawls out on its jet and the target goes up."}, {"tags": ["move", "gun", "rocket", "projectile", "explosion", "one-shot"]}, {"size": [480, 244]}, {"origin": [178, 198]}, {"duration": _S.binary("+", _S.read(_e, "HIT"), 5.4)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "launcher"}, {"two": true}, {"sa": _S.unary("-", 1)}, {"fx": 9}, {"fy": _S.unary("-", 19)}]))
	_S.define(_e, "KNEEL", _S.merge([_S.read(_e, "READY"), {"weapon": "launcher"}, {"two": true}, {"sa": 0}, {"fx": 9}, {"fy": _S.unary("-", 17)}, {"crouch": 6}, {"lean": 2}, {"ffx": 12}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "KICKED", _S.merge([_S.read(_e, "KNEEL"), {"x": _S.unary("-", 6)}, {"sa": _S.unary("-", 0.12)}, {"fx": 4}, {"fy": _S.unary("-", 19)}, {"lean": _S.unary("-", 4)}, {"crouch": 5}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.52), _S.read(_e, "REST_")], [_S.unary("-", 0.18), _S.read(_e, "KNEEL")], [_S.binary("-", _S.read(_e, "FIRE"), 0.001), _S.merge([_S.read(_e, "KNEEL"), {"crouch": 7}])], [_S.read(_e, "FIRE"), _S.read(_e, "KICKED"), "snap"], [_S.binary("+", _S.read(_e, "FIRE"), 0.36), _S.merge([_S.read(_e, "KNEEL"), {"x": _S.unary("-", 6)}])], [_S.binary("+", _S.read(_e, "HIT"), 0.9), _S.merge([_S.read(_e, "KNEEL"), {"x": _S.unary("-", 6)}, {"crouch": 5}, {"lean": 1}])], [_S.binary("+", _S.read(_e, "HIT"), 1.5), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}])], [_S.binary("+", _S.read(_e, "HIT"), 2.2), _S.merge([_S.read(_e, "REST_"), {"x": 0}])], [_S.binary("+", _S.read(_e, "HIT"), 5.4), _S.read(_e, "REST_")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "FIRE")}, {"stop": 0.06}, {"shake": 0.22}, {"amp": 2}, {"target": false}]), _S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.2}, {"shake": 0.45}, {"amp": 4}, {"push": 3.8}, {"straw": 44}, {"skin": "char"}]), _S.merge([{"t": _S.binary("+", _S.read(_e, "HIT"), 4.8)}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "FIRE")}, {"x": _S.unary("-", 16)}, {"n": 10}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "muzzle")}, {"t": _S.read(_e, "FIRE")}, {"x": _S.read(_e, "MX")}, {"height": _S.unary("-", _S.read(_e, "MY"))}]), _S.merge([{"fx": _S.read(_e, "rocket")}, {"t": _S.read(_e, "FIRE")}, {"until": _S.read(_e, "HIT")}, {"x": _S.function_value(_e, "_f0")}, {"y": _S.read(_e, "MY")}]), _S.merge([{"fx": _S.read(_e, "blast")}, {"t": _S.read(_e, "HIT")}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_MX = _S.read(_parent,"MX")
	var _n_FIRE = _S.read(_parent,"FIRE")
	var _n_TX = _S.read(_parent,"TX")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_t_b0 = _S.arg(_args,0)
	return ((_n_MX + 10) + (pow((_n_t_b0 - _n_FIRE),1.5) * (float(((_n_TX - _n_MX) - 16))/pow(_n_FLY,1.5))))
	return null
