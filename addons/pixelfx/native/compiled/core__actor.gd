@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/actor.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "maskOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "pixelsOf", _S.function_value(_e, "_f3"))
	_S.define(_e, "stockActor", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawActor", _S.function_value(_e, "_f7"))
	_S.define(_e, "HERO", ["....kkkkk...", "..kkhhhhhk..", ".khhhhhhhhk.", ".khhhhhhhhhk", ".khhssssshhk", ".khsessesshk", ".khsessesshk", "..ksssssssk.", "...kkSSSkk..", "..kttttttk..", ".kttTttTttk.", ".ksttTTttsk.", ".kstttttttk.", "..kbbbbbbk..", "..kppkkppk..", "..kppk.kppk.", "..kppk.kppk.", "..koook.kook", "..kkkkk.kkkk"])
	_S.define(_e, "HERO_PAL", _S.merge([{"k": "#17121f"}, {"h": "#7a4128"}, {"s": "#f3c49d"}, {"S": "#c98b6c"}, {"e": "#17121f"}, {"t": "#5f6f94"}, {"T": "#46536f"}, {"b": "#8a5a32"}, {"p": "#38334a"}, {"o": "#6a4030"}, {"H": "#a35d34"}, {"w": "#ffffff"}, {"m": "#a3564a"}, {"g": "#e8c060"}, {"L": "#7f90b6"}, {"O": "#8f5a3f"}, {"P": "#4b4560"}, {"c": "#f53cd1"}, {"C": "#ff8fe6"}, {"D": "#a31f8a"}]))
	_S.define(_e, "DUMMY_PAL", _S.merge([{"k": "#0e0c14"}, {"A": "#e4e6ec"}, {"B": "#b6b9c3"}, {"C": "#868995"}, {"D": "#5c5e6a"}, {"E": "#6e707c"}, {"F": "#4b4d58"}, {"G": "#34353f"}, {"J": "#2a2b33"}, {"m": "#f53cd1"}]))
	_S.define(_e, "HERO2", ["...........kkk..........", "..........kAABk.........", ".........kAAABJk........", ".........kABBJJk........", ".........kBBBJCDk.......", ".........kBCJDDDk.......", ".........kkJJJDk........", ".......kkkkABBJCkk......", "......kAABCJBCCCkDk.....", "......kABBCJCCCmDkDk....", "......kBBCDDJCDDDkDk....", "......kABCDJDDDDDkk.....", ".....kAABDkDDDDJkk......", ".....kABCDkDDJJGkk......", ".....kABCkJJJGGGkk......", "....kJJCDkFFFGGGk.......", "....kAJJDkJJJGGGk.......", "....kJCJJkABBJGGk.......", ".....kJCCkBBCDJJJk......", ".....kCCCJBBCDJJDk......", ".....kCCCDJCCDkJDDk.....", "......kCDDJBCDkDDDk.....", ".......kDJJJCDkDDDkk....", ".......kJBCJCDkDDDkk....", ".......kBDJBCDkCDDkk....", "........kJJBCDkCDDk.....", "........kBBBCDkCCDDk....", "........kBBBCDkCCDDk....", ".........kBBCDkJDDDk....", "........kBJJJJkCJJJk....", "........kBBCCDkCCDDk....", "........kBBCDDkCDDk.....", "........kBBCDkCCDDk.....", "........kBCCDkCCDDk.....", "........kBCDDkCDDDk.....", ".......kJBCJkkkDJkkkk...", ".......kAJJAAAAkCCCCCk..", "........kkkkkkkkkkkkk..."])
	_S.define(_e, "MASKS", _S.merge([{"1": _S.call_value(_S.read(_e, "maskOf"), [_S.read(_e, "HERO"), 1])}, {"2": _S.call_value(_S.read(_e, "maskOf"), [_S.read(_e, "HERO2"), 1])}]))
	_S.define(_e, "SPRITES", _S.merge([{"1": _S.read(_e, "HERO")}, {"2": _S.read(_e, "HERO2")}]))
	_S.define(_e, "PIXELS", _S.merge([{"1": _S.call_value(_S.read(_e, "pixelsOf"), [_S.read(_e, "HERO"), _S.read(_e, "HERO_PAL")])}, {"2": _S.call_value(_S.read(_e, "pixelsOf"), [_S.read(_e, "HERO2"), _S.read(_e, "DUMMY_PAL")])}]))
	_exports["stockActor"] = _S.read(_e, "stockActor")
	_exports["drawActor"] = _S.read(_e, "drawActor")
	_S.define(_e, "actorAlphaOf", _S.function_value(_e, "_f8"))
	_exports["actorAlphaOf"] = _S.read(_e, "actorAlphaOf")
	_exports["HERO"] = _S.read(_e, "HERO")
	_exports["HERO2"] = _S.read(_e, "HERO2")
	_exports["HERO_PAL"] = _S.read(_e, "HERO_PAL")
	_exports["DUMMY_PAL"] = _S.read(_e, "DUMMY_PAL")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_rows_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	var _n_h_b2 = (_S.prop(_n_rows_b0,"length") * _n_k_b1)
	var _n_w_b3 = (_S.prop(_S.index_value(_n_rows_b0,0),"length") * _n_k_b1)
	var _n_data_b4 = _S.construct(_n_Uint8Array,[(_n_w_b3 * _n_h_b2)])
	_S.invoke(_n_rows_b0,"forEach",[_S.function_value(_S.capture(_parent,{"k":_n_k_b1,"data":_n_data_b4,"w":_n_w_b3,"this":_this}),"_f1")])
	return {"w":_n_w_b3,"h":_n_h_b2,"data":_n_data_b4}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_S.concat([_S.array(_n_r_b0)]),"forEach",[_S.function_value(_S.capture(_parent,{"y":_n_y_b1,"this":_n_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_data = _S.read(_parent,"data")
	var _n_y = _S.read(_parent,"y")
	var _n_k = _S.read(_parent,"k")
	var _n_w = _S.read(_parent,"w")
	var _n_ch_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	if _S.truth(_S.binary("===",_n_ch_b0,".")):
		return null
	if true:
		var _n_j_b2 = 0
		while _S.truth((_n_j_b2 < (_n_k * _n_k))):
			_S.set_prop(_n_data,(((((_n_y * _n_k) + _S.binary("|",(float(_n_j_b2)/_n_k),0)) * _n_w) + (_n_x_b1 * _n_k)) + fmod(_n_j_b2,_n_k)),1,"=")
			_n_j_b2 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_rows_b0 = _S.arg(_args,0)
	var _n_pal_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.prop(_S.index_value(_n_rows_b0,0),"length")
	var _n_data_b3 = _S.construct(_n_Uint32Array,[(_n_w_b2 * _S.prop(_n_rows_b0,"length"))])
	_S.invoke(_n_rows_b0,"forEach",[_S.function_value(_S.capture(_parent,{"data":_n_data_b3,"w":_n_w_b2,"pal":_n_pal_b1,"this":_this}),"_f4")])
	return _n_data_b3
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_S.concat([_S.array(_n_r_b0)]),"forEach",[_S.function_value(_S.capture(_parent,{"y":_n_y_b1,"this":_n_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_data = _S.read(_parent,"data")
	var _n_y = _S.read(_parent,"y")
	var _n_w = _S.read(_parent,"w")
	var _n_pal = _S.read(_parent,"pal")
	var _n_hex = _S.read(_parent,"hex")
	var _n_ch_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	return _S.set_prop(_n_data,((_n_y * _n_w) + _n_x_b1),(0 if _S.truth(_S.binary("===",_n_ch_b0,".")) else _S.call_value(_n_hex,[_S.index_value(_n_pal,_n_ch_b0)])),"=")
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 0), func(): return 1))
	_S.write(_e, "k", (2 if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else 1), "=", false)
	_S.define(_e, "m", _S.prop(_S.read(_e, "MASKS"), _S.read(_e, "k")))
	_S.define(_e, "x", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.prop(_S.read(_e, "m"), "w"), 2)])))
	_S.define(_e, "y", _S.unary("-", _S.prop(_S.read(_e, "m"), "h")))
	return _S.merge([{"mask": _S.read(_e, "m")}, {"pixels": _S.prop(_S.read(_e, "PIXELS"), _S.read(_e, "k"))}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"w": _S.prop(_S.read(_e, "m"), "w")}, {"h": _S.prop(_S.read(_e, "m"), "h")}, {"k": _S.read(_e, "k")}, {"head": [0, _S.read(_e, "y")]}, {"chest": [0, (_S.unary("-", 26) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else _S.binary("+", _S.read(_e, "y"), 11))]}, (_S.merge([{"eyes": [[13, 3], [15, 3]]}]) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else _S.merge([]))])

static func _f7(_parent,_args:Array,_this=null):
	var _n_stockActor = _S.read(_parent,"stockActor")
	var _n_SPRITES = _S.read(_parent,"SPRITES")
	var _n_DUMMY_PAL = _S.read(_parent,"DUMMY_PAL")
	var _n_HERO_PAL = _S.read(_parent,"HERO_PAL")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_actor_b1 = _S.coalesce(_S.arg(_args,1),func():return _S.call_value(_n_stockActor,[]))
	var _n_a_b2 = _S.coalesce(_S.arg(_args,2),func():return 1)
	if _S.truth((_n_a_b2 > 0)):
		_S.invoke(_n_p_b0,"sprite",[_S.index_value(_n_SPRITES,(2 if _S.truth(_S.binary("===",_S.named_value(_n_actor_b1,"k"),2)) else 1)), (_n_DUMMY_PAL if _S.truth(_S.binary("===",_S.named_value(_n_actor_b1,"k"),2)) else _n_HERO_PAL), _S.named_value(_n_actor_b1,"x"), _S.named_value(_n_actor_b1,"y"), {"a":_n_a_b2}])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_mod_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	return (_S.invoke(_n_mod_b0,"actorAlpha",[_n_t_b1, _n_o_b2]) if _S.truth(_S.binary("===",_S.unary("typeof",_S.named_value(_n_mod_b0,"actorAlpha")),"function")) else 1)
	return null
