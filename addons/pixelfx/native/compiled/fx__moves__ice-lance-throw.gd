@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/ice-lance-throw.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "charge", _S.import_value("fx/arcane/spell-charge.js", null))
	_S.define(_e, "lance", _S.import_value("fx/ice/ice-lance.js", null))
	_S.define(_e, "burst", _S.import_value("fx/ice/snowflake-burst.js", null))
	_S.define(_e, "THROW", 0.8)
	_S.define(_e, "FLY", 0.34)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "THROW"), _S.read(_e, "FLY")))
	_S.define(_e, "TX", 170)
	_S.define(_e, "SPEED", _S.binary("/", _S.binary("-", _S.read(_e, "TX"), 34), _S.read(_e, "FLY")))
	_S.define(_e, "meta", _S.merge([{"name": "Ice lance throw"}, {"desc": "Frost gathers into a spear in his hand, he throws it like a javelin, and the target ices over in a burst of snowflakes and shivers."}, {"tags": ["move", "ice", "spell", "projectile", "one-shot"]}, {"size": [310, 136]}, {"origin": [86, 134]}, {"duration": _S.binary("+", _S.read(_e, "HIT"), 3.2)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 2}, {"fx": 18}, {"fy": _S.unary("-", 22)}, {"bx": 11}, {"by": _S.unary("-", 17)}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "THROWN", _S.merge([_S.read(_e, "READY"), {"x": 9}, {"crouch": 4}, {"lean": 6}, {"fx": 19}, {"fy": _S.unary("-", 24)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": _S.read(_e, "TX")}])}, {"poses": [[_S.unary("-", 0.4), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [0.06, _S.merge([_S.read(_e, "HOLD")])], [_S.binary("-", _S.read(_e, "THROW"), 0.2), _S.read(_e, "HOLD")], [_S.binary("-", _S.read(_e, "THROW"), 0.03), _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}, {"lean": _S.unary("-", 2)}, {"fx": 17}, {"bx": 5}, {"by": _S.unary("-", 20)}])], [_S.read(_e, "THROW"), _S.read(_e, "THROWN"), "snap"], [_S.binary("+", _S.read(_e, "HIT"), 0.3), _S.merge([_S.read(_e, "THROWN"), {"crouch": 3}, {"lean": 4}])], [_S.binary("+", _S.read(_e, "HIT"), 0.9), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.binary("+", _S.read(_e, "HIT"), 3.2), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": _S.read(_e, "HIT")}, {"stop": 0.13}, {"shake": 0.2}, {"amp": 2}, {"push": 2.4}, {"straw": 12}, {"skin": "ice"}, {"shiver": 1.4}, {"y": _S.unary("-", 26)}]), _S.merge([{"t": 2.75}, {"push": 0.3}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": _S.read(_e, "THROW")}, {"x": 13}, {"n": 6}, {"dir": 1}, {"c": "#d8f2ff"}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "charge")}, {"t": 0.06}, {"until": _S.read(_e, "THROW")}, {"palette": _S.prop(_S.read(_e, "PAL"), "ice")}]), _S.merge([{"fx": _S.read(_e, "lance")}, {"t": _S.read(_e, "THROW")}, {"until": _S.read(_e, "HIT")}, {"x": _S.function_value(_e, "_f0")}, {"y": _S.unary("-", 24)}]), _S.merge([{"fx": _S.read(_e, "burst")}, {"t": _S.read(_e, "HIT")}, {"x": _S.read(_e, "TX")}, {"y": _S.unary("-", 26)}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 34, _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "THROW")), _S.read(_e, "SPEED")))
