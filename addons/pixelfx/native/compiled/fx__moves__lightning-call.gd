@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/lightning-call.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "strike", _S.import_value("fx/lightning/lightning-strike.js", null))
	_S.define(_e, "BOLT", 0.76)
	_S.define(_e, "TX", 130)
	_S.define(_e, "meta", _S.merge([{"name": "Lightning call"}, {"desc": "An arm goes up, a sigil lights under the target, and on the downswing a thick bolt comes down on it; the target jolts through the aftershocks."}, {"tags": ["move", "lightning", "spell", "strike", "one-shot"]}, {"size": [290, 266]}, {"origin": [42, 231]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", _S.merge([_S.read(_e, "READY"), {"crouch": 1}, {"lean": _S.unary("-", 2)}, {"fx": 2}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 19)}, {"ffx": 7}, {"fbx": _S.unary("-", 5)}]))
	_S.define(_e, "DOWN", _S.merge([_S.read(_e, "READY"), {"crouch": 5}, {"lean": 5}, {"fx": 18}, {"fy": _S.unary("-", 27)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 12}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[0, _S.read(_e, "READY")], [0.26, _S.read(_e, "UP")], [_S.binary("-", _S.read(_e, "BOLT"), 0.04), _S.merge([_S.read(_e, "UP"), {"y": _S.unary("-", 1)}, {"crouch": _S.unary("-", 1)}])], [_S.read(_e, "BOLT"), _S.read(_e, "DOWN"), "snap"], [1.4, _S.merge([_S.read(_e, "DOWN"), {"crouch": 3}, {"lean": 4}])], [2, _S.read(_e, "READY")], [3, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "BOLT")}, {"stop": 0.14}, {"shake": 0.32}, {"amp": 3}, {"push": 2.8}, {"straw": 24}, {"skin": "shock"}, {"shiver": 1.2}]), _S.merge([{"t": 1.04}, {"stop": 0.03}, {"push": 1.2}, {"straw": 8}]), _S.merge([{"t": 1.26}, {"stop": 0.03}, {"push": _S.unary("-", 1)}, {"straw": 6}]), _S.merge([{"t": 2.5}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "BOLT")}, {"x": 14}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "strike")}, {"t": 0}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

