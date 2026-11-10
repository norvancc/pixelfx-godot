@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/dash-strike.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "slash", _S.import_value("fx/melee/sword-slash.js", null))
	_S.define(_e, "crit", _S.import_value("fx/impacts/crit-hit.js", null))
	_S.define(_e, "CUT", 0.16)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "CUT"), 0.06))
	_S.define(_e, "AT", 116)
	_S.define(_e, "TX", 176)
	_S.define(_e, "meta", _S.merge([{"name": "Dash strike"}, {"desc": "A crouch, then he's across the floor in a blur of after-images and already cutting: a critical hit, a beat, and he hops back to where he started."}, {"tags": ["move", "melee", "sword", "dash", "crit", "one-shot"]}, {"size": [372, 156]}, {"origin": [66, 136]}, {"duration": 2.3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GUARD", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.85)}]))
	_S.define(_e, "LOW", _S.merge([_S.read(_e, "GUARD"), {"crouch": 6}, {"lean": 6}, {"fx": _S.unary("-", 3)}, {"fy": _S.unary("-", 17)}, {"sa": 3.05}, {"bx": 9}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "COCK", _S.merge([_S.read(_e, "GUARD"), {"x": _S.binary("-", _S.read(_e, "AT"), 4)}, {"crouch": 3}, {"lean": _S.unary("-", 2)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 35)}, {"sa": _S.unary("-", 2.65)}, {"bx": 9}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "CUT_", _S.merge([_S.read(_e, "GUARD"), {"x": _S.read(_e, "AT")}, {"crouch": 2}, {"lean": 3}, {"fx": 16}, {"fy": _S.unary("-", 37)}, {"sa": _S.unary("-", 1.45)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "DOWN", _S.merge([_S.read(_e, "GUARD"), {"x": _S.binary("+", _S.read(_e, "AT"), 2)}, {"crouch": 5}, {"lean": 5}, {"fx": 20}, {"fy": _S.unary("-", 21)}, {"sa": 0.62}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "HOP", _S.merge([_S.read(_e, "GUARD"), {"y": _S.unary("-", 14)}, {"crouch": 0}, {"lean": _S.unary("-", 3)}, {"fx": 13}, {"fy": _S.unary("-", 31)}, {"sa": _S.unary("-", 0.9)}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 28)}, {"ffx": 6}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 6)}, {"fby": _S.unary("-", 6)}, {"ghost": 1}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.5), _S.merge([_S.read(_e, "GUARD"), {"x": 0}])], [_S.unary("-", 0.16), _S.merge([_S.read(_e, "LOW"), {"x": _S.unary("-", 2)}])], [_S.unary("-", 0.01), _S.merge([_S.read(_e, "LOW"), {"x": _S.unary("-", 3)}, {"crouch": 6}])], [0, _S.merge([_S.read(_e, "LOW"), {"x": 8}, {"ghost": 1}]), "snap"], [0.14, _S.merge([_S.read(_e, "LOW"), {"x": _S.binary("-", _S.read(_e, "AT"), 6)}, {"ghost": 1}]), "line"], [0.145, _S.read(_e, "COCK"), "snap"], [_S.read(_e, "CUT"), _S.read(_e, "CUT_"), "snap"], [_S.read(_e, "HIT"), _S.read(_e, "DOWN"), "snap"], [0.75, _S.merge([_S.read(_e, "DOWN"), {"crouch": 4}, {"lean": 4}])], [1.25, _S.merge([_S.read(_e, "GUARD"), {"x": _S.binary("+", _S.read(_e, "AT"), 2)}])], [1.32, _S.merge([_S.read(_e, "GUARD"), {"x": _S.binary("+", _S.read(_e, "AT"), 2)}, {"crouch": 5}, {"lean": _S.unary("-", 2)}]), "snap"], [1.4, _S.merge([_S.read(_e, "HOP"), {"x": _S.binary("-", _S.read(_e, "AT"), 28)}]), "snap"], [1.6, _S.merge([_S.read(_e, "HOP"), {"x": 22}, {"y": _S.unary("-", 18)}]), "line"], [1.74, _S.merge([_S.read(_e, "GUARD"), {"x": 0}, {"y": 0}, {"crouch": 5}]), "line"], [2.2, _S.merge([_S.read(_e, "GUARD"), {"x": 0}])]]}, {"hits": [_S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.17}, {"shake": 0.26}, {"amp": 3}, {"push": 3.4}, {"straw": 32}])]}, {"dust": [_S.merge([{"t": 0}, {"x": 0}, {"n": 8}, {"dir": _S.unary("-", 1)}]), _S.merge([{"t": 0.14}, {"x": _S.binary("-", _S.read(_e, "AT"), 6)}, {"n": 7}]), _S.merge([{"t": 1.74}, {"x": 0}, {"n": 6}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "slash")}, {"t": _S.read(_e, "CUT")}, {"x": _S.read(_e, "AT")}]), _S.merge([{"fx": _S.read(_e, "crit")}, {"t": _S.read(_e, "HIT")}, {"x": _S.binary("-", _S.read(_e, "TX"), 10)}, {"height": 28}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

