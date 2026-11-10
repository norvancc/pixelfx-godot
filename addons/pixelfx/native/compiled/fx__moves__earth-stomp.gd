@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/earth-stomp.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "spike", _S.import_value("fx/nature/earth-spike.js", null))
	_S.define(_e, "STOMP", 0.06)
	_S.define(_e, "RAM", _S.binary("+", _S.read(_e, "STOMP"), 0.43))
	_S.define(_e, "TX", 112)
	_S.define(_e, "meta", _S.merge([{"name": "Earth stomp"}, {"desc": "A knee comes up, the boot slams down, the floor heaves under the target and a stone spike rams up through it."}, {"tags": ["move", "earth", "spell", "stomp", "one-shot"]}, {"size": [290, 142]}, {"origin": [50, 128]}, {"duration": _S.binary("+", _S.read(_e, "STOMP"), 3.4)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "KNEE", _S.merge([_S.read(_e, "READY"), {"crouch": 1}, {"lean": _S.unary("-", 3)}, {"fx": 3}, {"fy": _S.unary("-", 34)}, {"bx": 11}, {"by": _S.unary("-", 30)}, {"ffx": 9}, {"ffy": _S.unary("-", 15)}, {"fbx": _S.unary("-", 5)}]))
	_S.define(_e, "SLAM", _S.merge([_S.read(_e, "READY"), {"crouch": 7}, {"lean": 3}, {"fx": 14}, {"fy": _S.unary("-", 14)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 18)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.5), _S.read(_e, "READY")], [_S.unary("-", 0.14), _S.read(_e, "KNEE")], [_S.binary("-", _S.read(_e, "STOMP"), 0.005), _S.merge([_S.read(_e, "KNEE"), {"ffy": _S.unary("-", 17)}])], [_S.read(_e, "STOMP"), _S.read(_e, "SLAM"), "snap"], [_S.binary("+", _S.read(_e, "RAM"), 0.5), _S.merge([_S.read(_e, "SLAM"), {"crouch": 5}])], [_S.binary("+", _S.read(_e, "RAM"), 1.1), _S.read(_e, "READY")], [_S.binary("+", _S.read(_e, "STOMP"), 3.4), _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "STOMP")}, {"stop": 0.1}, {"shake": 0.2}, {"amp": 3}, {"target": false}]), _S.merge([{"t": _S.read(_e, "RAM")}, {"stop": 0.14}, {"shake": 0.28}, {"amp": 3}, {"push": _S.unary("-", 3.2)}, {"straw": 30}, {"y": _S.unary("-", 10)}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "STOMP")}, {"x": 11}, {"n": 9}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "spike")}, {"t": _S.read(_e, "STOMP")}, {"x": _S.read(_e, "TX")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

