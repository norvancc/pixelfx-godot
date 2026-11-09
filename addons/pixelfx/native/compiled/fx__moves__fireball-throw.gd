@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/fireball-throw.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "charge", _S.import_value("fx/arcane/spell-charge.js", null))
	_S.define(_e, "fireball", _S.import_value("fx/fire/fireball.js", null))
	_S.define(_e, "blast", _S.import_value("fx/explosions/small-explosion.js", null))
	_S.define(_e, "THROW", 0.95)
	_S.define(_e, "FLY", 0.46)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "THROW"), _S.read(_e, "FLY")))
	_S.define(_e, "SPEED", 340)
	_S.define(_e, "TX", 190)
	_S.define(_e, "meta", _S.merge([{"name": "Fireball throw"}, {"desc": "He gathers fire in his hand, leans back and hurls it: the ball flies, the target takes it in a blast and comes out charred."}, {"tags": ["move", "fire", "spell", "projectile", "explosion", "one-shot"]}, {"size": [356, 244]}, {"origin": [64, 198]}, {"duration": _S.binary("+", _S.read(_e, "HIT"), 5.4)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 2}, {"fx": 18}, {"fy": _S.unary("-", 22)}, {"bx": 11}, {"by": _S.unary("-", 17)}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "THROWN", _S.merge([_S.read(_e, "READY"), {"x": 9}, {"crouch": 4}, {"lean": 6}, {"fx": 19}, {"fy": _S.unary("-", 22)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "FLINCH", _S.merge([{"turn": 0.9}, {"x": 7}, {"crouch": 5}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 4)}, {"fy": _S.unary("-", 36)}, {"bx": 5}, {"by": _S.unary("-", 33)}, {"ffx": 4}, {"fbx": _S.unary("-", 4)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.42), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [0.08, _S.merge([_S.read(_e, "HOLD")])], [0.5, _S.read(_e, "HOLD")], [_S.binary("-", _S.read(_e, "THROW"), 0.03), _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}, {"lean": _S.unary("-", 2)}, {"fx": 17}, {"bx": 5}, {"by": _S.unary("-", 20)}])], [_S.read(_e, "THROW"), _S.read(_e, "THROWN"), "snap"], [_S.binary("-", _S.read(_e, "HIT"), 0.02), _S.merge([_S.read(_e, "THROWN"), {"crouch": 3}, {"lean": 4}])], [_S.read(_e, "HIT"), _S.read(_e, "FLINCH"), "snap"], [_S.binary("+", _S.read(_e, "HIT"), 0.7), _S.merge([_S.read(_e, "FLINCH"), {"crouch": 3}, {"lean": _S.unary("-", 2)}])], [_S.binary("+", _S.read(_e, "HIT"), 1.4), _S.merge([_S.read(_e, "READY"), {"x": 4}])], [_S.binary("+", _S.read(_e, "HIT"), 2.1), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.binary("+", _S.read(_e, "HIT"), 5.4), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.18}, {"shake": 0.38}, {"amp": 3}, {"push": 3.4}, {"straw": 34}, {"skin": "char"}]), _S.merge([{"t": _S.binary("+", _S.read(_e, "HIT"), 4.8)}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "THROW")}, {"x": 13}, {"n": 7}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "charge")}, {"t": 0.08}, {"until": _S.read(_e, "THROW")}, {"palette": _S.prop(_S.read(_e, "PAL"), "fire")}]), _S.merge([{"fx": _S.read(_e, "fireball")}, {"t": _S.read(_e, "THROW")}, {"until": _S.read(_e, "HIT")}, {"x": _S.function_value(_e, "_f0")}, {"y": _S.unary("-", 22)}]), _S.merge([{"fx": _S.read(_e, "blast")}, {"t": _S.read(_e, "HIT")}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 28, _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "THROW")), _S.read(_e, "SPEED")))
