@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/ground-pound.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "slam", _S.import_value("fx/impacts/ground-slam.js", null))
	_S.define(_e, "LAND", 0.62)
	_S.define(_e, "TX", 80)
	_S.define(_e, "meta", _S.merge([{"name": "Ground pound"}, {"desc": "He coils, leaps out of frame height, hangs, and comes down like a rock: the floor cracks, shock waves race out and throw the target about as they pass."}, {"tags": ["move", "impact", "jump", "landing", "shockwave", "one-shot"]}, {"size": [304, 204]}, {"origin": [152, 168]}, {"duration": _S.binary("+", _S.read(_e, "LAND"), 3.2)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "COIL", _S.merge([_S.read(_e, "READY"), {"crouch": 8}, {"lean": 4}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 14)}, {"bx": 3}, {"by": _S.unary("-", 14)}, {"ffx": 8}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "AIR", _S.merge([{"turn": 0.8}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 44)}, {"bx": 10}, {"by": _S.unary("-", 44)}, {"ffx": 6}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 3)}, {"fby": _S.unary("-", 3)}, {"toeB": true}]))
	_S.define(_e, "TOP", _S.merge([_S.read(_e, "AIR"), {"y": _S.unary("-", 62)}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 20)}, {"bx": 11}, {"by": _S.unary("-", 20)}, {"ffx": 7}, {"ffy": _S.unary("-", 10)}, {"fbx": _S.unary("-", 4)}, {"fby": _S.unary("-", 10)}]))
	_S.define(_e, "DOWN", _S.merge([{"turn": 0.8}, {"y": _S.unary("-", 8)}, {"crouch": 0}, {"fx": _S.unary("-", 5)}, {"fy": _S.unary("-", 40)}, {"bx": 6}, {"by": _S.unary("-", 40)}, {"ffx": 3}, {"ffy": _S.unary("-", 3)}, {"fbx": _S.unary("-", 3)}, {"fby": _S.unary("-", 3)}, {"ghost": 1}]))
	_S.define(_e, "HERO_", _S.merge([{"y": 0}, {"crouch": 8}, {"lean": 5}, {"fx": 13}, {"fy": _S.unary("-", 8)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.5), _S.read(_e, "READY")], [_S.unary("-", 0.16), _S.read(_e, "COIL")], [0, _S.merge([_S.read(_e, "COIL"), {"crouch": 7}])], [0.03, _S.merge([_S.read(_e, "AIR"), {"y": _S.unary("-", 10)}, {"ghost": 1}]), "snap"], [0.26, _S.merge([_S.read(_e, "TOP"), {"y": _S.unary("-", 60)}]), "out"], [0.42, _S.read(_e, "TOP")], [_S.binary("-", _S.read(_e, "LAND"), 0.005), _S.merge([_S.read(_e, "DOWN"), {"y": _S.unary("-", 4)}]), "in"], [_S.read(_e, "LAND"), _S.read(_e, "HERO_"), "snap"], [_S.binary("+", _S.read(_e, "LAND"), 0.8), _S.merge([_S.read(_e, "HERO_"), {"crouch": 6}])], [_S.binary("+", _S.read(_e, "LAND"), 1.3), _S.merge([_S.read(_e, "HERO_"), {"crouch": 5}, {"lean": 3}, {"fx": 13}, {"fy": _S.unary("-", 15)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 20)}])], [_S.binary("+", _S.read(_e, "LAND"), 1.8), _S.read(_e, "READY")], [_S.binary("+", _S.read(_e, "LAND"), 3.2), _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": _S.read(_e, "LAND")}, {"stop": 0.2}, {"shake": 0.5}, {"amp": 4}, {"target": false}]), _S.merge([{"t": _S.binary("+", _S.read(_e, "LAND"), 0.14)}, {"stop": 0.04}, {"push": 3}, {"straw": 26}, {"y": _S.unary("-", 8)}]), _S.merge([{"t": _S.binary("+", _S.read(_e, "LAND"), 0.44)}, {"push": _S.unary("-", 1.6)}, {"straw": 8}, {"y": _S.unary("-", 8)}, {"flash": 0}])]}, {"dust": [_S.merge([{"t": 0.03}, {"x": 0}, {"n": 8}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "slam")}, {"t": _S.read(_e, "LAND")}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

