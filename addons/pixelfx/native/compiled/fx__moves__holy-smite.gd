@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/holy-smite.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "smite", _S.import_value("fx/holy/smite.js", null))
	_S.define(_e, "BOLT", 0.47)
	_S.define(_e, "TX", 118)
	_S.define(_e, "meta", _S.merge([{"name": "Holy smite"}, {"desc": "Both hands go up and a glint marks the target; he brings them down and a bolt of light drops like a hammer, leaving the target blanched."}, {"tags": ["move", "holy", "spell", "strike", "one-shot"]}, {"size": [252, 182]}, {"origin": [42, 151]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "DOWN", _S.merge([_S.read(_e, "READY"), {"crouch": 5}, {"lean": 5}, {"fx": 17}, {"fy": _S.unary("-", 29)}, {"bx": 13}, {"by": _S.unary("-", 25)}, {"ffx": 12}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.42), _S.read(_e, "READY")], [_S.unary("-", 0.04), _S.read(_e, "UP")], [_S.binary("-", _S.read(_e, "BOLT"), 0.01), _S.merge([_S.read(_e, "UP"), {"y": _S.unary("-", 1)}])], [_S.read(_e, "BOLT"), _S.read(_e, "DOWN"), "snap"], [1.1, _S.merge([_S.read(_e, "DOWN"), {"crouch": 3}, {"lean": 3}])], [1.7, _S.read(_e, "READY")], [2.8, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "BOLT")}, {"stop": 0.14}, {"shake": 0.32}, {"amp": 3}, {"push": 2.8}, {"straw": 24}, {"skin": "holy"}, {"y": _S.unary("-", 30)}]), _S.merge([{"t": 2.3}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "BOLT")}, {"x": 14}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "smite")}, {"t": 0}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

