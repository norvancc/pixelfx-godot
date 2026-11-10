@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/moves/sword-combo.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "chain", _S.import_value("core/index.js", "chain"))
	_S.define(_e, "shiftKeys", _S.import_value("core/index.js", "shiftKeys"))
	_S.define(_e, "shiftHits", _S.import_value("core/index.js", "shiftHits"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "slash", _S.import_value("fx/melee/sword-slash.js", null))
	_S.define(_e, "double", _S.import_value("fx/melee/double-slash.js", null))
	_S.define(_e, "cleave", _S.import_value("fx/melee/heavy-cleave.js", null))
	_S.define(_e, "A", 0)
	_S.define(_e, "B", 0.5)
	_S.define(_e, "C", 1.04)
	_S.define(_e, "STEP", 10)
	_S.define(_e, "FINISH", _S.binary("+", _S.read(_e, "C"), 0.335))
	_S.define(_e, "meta", _S.merge([{"name": "Sword combo"}, {"desc": "Three strokes walking forward: a slash, a crossing double cut, and a two-handed cleave into the floor that throws the target about."}, {"tags": ["move", "melee", "sword", "combo", "one-shot"]}, {"size": [264, 150]}, {"origin": [72, 130]}, {"duration": _S.binary("+", _S.read(_e, "FINISH"), 1.6)}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "until", _S.function_value(_e, "_f0"))
	_S.define(_e, "STAND_", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 11}, {"fy": _S.unary("-", 15)}, {"sa": 0.38}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 118}])}, {"poses": _S.concat([_S.array(_S.call_value(_S.read(_e, "shiftKeys"), [_S.call_value(_S.read(_e, "until"), [_S.prop(_S.prop(_S.read(_e, "slash"), "act"), "poses"), 0.3]), _S.read(_e, "A")])), _S.array(_S.call_value(_S.read(_e, "shiftKeys"), [_S.invoke(_S.call_value(_S.read(_e, "until"), [_S.prop(_S.prop(_S.read(_e, "double"), "act"), "poses"), 0.27]), "filter", [_S.function_value(_e, "_f2")]), _S.read(_e, "B"), _S.merge([{"dx": _S.read(_e, "STEP")}])])), _S.array(_S.call_value(_S.read(_e, "shiftKeys"), [_S.invoke(_S.prop(_S.prop(_S.read(_e, "cleave"), "act"), "poses"), "filter", [_S.function_value(_e, "_f3")]), _S.read(_e, "C"), _S.merge([{"dx": _S.binary("*", _S.read(_e, "STEP"), 2)}, {"weapon": "sword"}])])), [[_S.binary("+", _S.read(_e, "FINISH"), 1.6), _S.merge([_S.read(_e, "STAND_"), {"x": _S.binary("-", _S.binary("*", _S.read(_e, "STEP"), 2), 4)}])]]])}, {"hits": _S.concat([_S.array(_S.call_value(_S.read(_e, "shiftHits"), [_S.prop(_S.prop(_S.read(_e, "slash"), "act"), "hits"), _S.read(_e, "A")])), _S.array(_S.call_value(_S.read(_e, "shiftHits"), [_S.prop(_S.prop(_S.read(_e, "double"), "act"), "hits"), _S.read(_e, "B")])), _S.array(_S.call_value(_S.read(_e, "shiftHits"), [_S.prop(_S.prop(_S.read(_e, "cleave"), "act"), "hits"), _S.read(_e, "C")]))])}, {"dust": _S.concat([_S.array(_S.invoke(_S.call_value(_S.read(_e, "shiftHits"), [_S.prop(_S.prop(_S.read(_e, "slash"), "act"), "dust"), _S.read(_e, "A")]), "map", [_S.function_value(_e, "_f4")])), _S.array(_S.invoke(_S.call_value(_S.read(_e, "shiftHits"), [_S.prop(_S.prop(_S.read(_e, "cleave"), "act"), "dust"), _S.read(_e, "C")]), "map", [_S.function_value(_e, "_f5")]))])}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "create", _S.call_value(_S.read(_e, "chain"), [[_S.merge([{"fx": _S.read(_e, "slash")}, {"t": _S.read(_e, "A")}]), _S.merge([{"fx": _S.read(_e, "double")}, {"t": _S.read(_e, "B")}, {"x": _S.read(_e, "STEP")}]), _S.merge([{"fx": _S.read(_e, "cleave")}, {"t": _S.read(_e, "C")}, {"x": _S.binary("*", _S.read(_e, "STEP"), 2)}])]]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_keys_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return _S.invoke(_n_keys_b0,"filter",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_n_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_k_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_k_b0,0) <= _n_t)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_k_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_k_b0,0) >= (-0.14))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_k_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_k_b0,0) >= (-0.3))
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "d")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "d"), {"x": _S.binary("+", _S.prop(_S.read(_e, "d"), "x"), _S.binary("*", _S.read(_e, "STEP"), 2))}])
