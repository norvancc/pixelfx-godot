@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/meteor-call.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "circle", _S.import_value("fx/arcane/magic-circle-cast.js", null))
	_S.define(_e, "meteor", _S.import_value("fx/fire/meteor.js", null))
	_S.define(_e, "BOLT", 1.52)
	_S.define(_e, "HIT", 2.05)
	_S.define(_e, "TX", 170)
	_S.define(_e, "meta", _S.merge([{"name": "Meteor call"}, {"desc": "A long chant: a circle draws itself round him, it flares, he points, and a burning rock comes down on the target and flattens the scene."}, {"tags": ["move", "fire", "spell", "meteor", "ultimate", "one-shot"]}, {"size": [380, 240]}, {"origin": [92, 212]}, {"duration": _S.binary("+", _S.binary("-", _S.read(_e, "HIT"), 0.62), 5)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CHANT", _S.merge([{"turn": 1.1}, {"crouch": 1}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 26)}, {"bx": 2}, {"by": _S.unary("-", 26)}, {"armsFront": true}, {"hy": 1}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "UP", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "POINT", _S.merge([_S.read(_e, "READY"), {"crouch": 3}, {"lean": 5}, {"fx": 17}, {"fy": _S.unary("-", 37)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 24)}, {"ffx": 12}, {"fbx": _S.unary("-", 9)}, {"toeB": true}]))
	_S.define(_e, "FLINCH", _S.merge([{"turn": 0.9}, {"x": _S.unary("-", 3)}, {"crouch": 6}, {"lean": _S.unary("-", 4)}, {"fx": _S.unary("-", 4)}, {"fy": _S.unary("-", 36)}, {"bx": 5}, {"by": _S.unary("-", 33)}, {"ffx": 4}, {"fbx": _S.unary("-", 4)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.34), _S.read(_e, "READY")], [0, _S.read(_e, "CHANT")], [0.75, _S.merge([_S.read(_e, "CHANT"), {"crouch": 2}])], [1.4, _S.read(_e, "UP")], [_S.binary("-", _S.read(_e, "BOLT"), 0.02), _S.merge([_S.read(_e, "UP"), {"y": _S.unary("-", 1)}])], [_S.read(_e, "BOLT"), _S.read(_e, "POINT"), "snap"], [_S.binary("-", _S.read(_e, "HIT"), 0.02), _S.merge([_S.read(_e, "POINT"), {"crouch": 3}])], [_S.read(_e, "HIT"), _S.read(_e, "FLINCH"), "snap"], [_S.binary("+", _S.read(_e, "HIT"), 0.9), _S.merge([_S.read(_e, "FLINCH"), {"crouch": 3}, {"lean": _S.unary("-", 2)}])], [_S.binary("+", _S.read(_e, "HIT"), 1.7), _S.merge([_S.read(_e, "READY"), {"x": 0}])], [_S.binary("+", _S.read(_e, "HIT"), 4.3), _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "BOLT")}, {"stop": 0.06}, {"shake": 0.16}, {"amp": 2}, {"target": false}]), _S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.22}, {"shake": 0.55}, {"amp": 4}, {"push": 3.8}, {"straw": 44}, {"skin": "char"}]), _S.merge([{"t": _S.binary("+", _S.read(_e, "HIT"), 3.9)}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "circle")}, {"t": 0}]), _S.merge([{"fx": _S.read(_e, "meteor")}, {"t": _S.binary("-", _S.read(_e, "HIT"), 0.62)}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

