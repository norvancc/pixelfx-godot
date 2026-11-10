@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/chain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "createFx", _S.import_value("core/fx.js", "createFx"))
	_S.define(_e, "chain", _S.function_value(_e, "_f0"))
	_exports["chain"] = _S.read(_e, "chain")
	_S.define(_e, "shiftKeys", _S.function_value(_e, "_f8"))
	_exports["shiftKeys"] = _S.read(_e, "shiftKeys")
	_S.define(_e, "shiftHits", _S.function_value(_e, "_f10"))
	_exports["shiftHits"] = _S.read(_e, "shiftHits")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "cues", _S.arg(_args, 0))
	return _S.function_value(_e, "_f1")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "cues"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "at", _S.function_value(_e, "_f3"))
	_S.define(_e, "each", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "fx", _S.prop(_v0, "fx"))
	_S.define(_e, "t", _S.prop(_v0, "t"))
	_S.define(_e, "until", _S.prop(_v0, "until"))
	_S.define(_e, "x", _S.prop(_v0, "x"))
	_S.define(_e, "y", _S.prop(_v0, "y"))
	_S.define(_e, "flip", _S.prop(_v0, "flip"))
	_S.define(_e, "opts", _S.omit(_v0, ["fx","t","until","x","y","flip"]))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"fx": _S.read(_e, "fx")}, {"t": _S.logical("??", _S.read(_e, "t"), func(): return 0)}, {"until": _S.logical("??", _S.read(_e, "until"), func(): return INF)}, {"x": _S.logical("??", _S.read(_e, "x"), func(): return 0)}, {"y": _S.logical("??", _S.read(_e, "y"), func(): return 0)}, {"flip": _S.unary("!", _S.unary("!", _S.read(_e, "flip")))}, {"opts": _S.merge([_S.read(_e, "opts"), {"seed": _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "o"), "seed"), func(): return 1), _S.read(_e, "i"))}])}, {"inst": null}, {"over": false}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_v_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_v_b0,[_n_t]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_v_b0),"function")) else _n_v_b0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_list = _S.read(_parent,"list")
	var _n_Object = _S.read(_parent,"Object")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_layer_b1 = _S.arg(_args,1)
	var _object_0 = _n_p_b0
	var _n_frame_b2 = _S.named_value(_object_0,"frame")
	var _n_tx_b3 = _S.named_value(_object_0,"tx")
	var _n_ty_b4 = _S.named_value(_object_0,"ty")
	var _n_sign_b5 = _S.named_value(_object_0,"fx")
	var _n_cs_b6 = _S.named_value(_object_0,"cs")
	var _n_sn_b7 = _S.named_value(_object_0,"sn")
	var _n_fade_b8 = _S.named_value(_object_0,"fade")
	var _n_lightK_b9 = _S.named_value(_object_0,"lightK")
	for _iter_1 in _S.array(_n_list):
		var _n_c_b10 = _iter_1
		if _S.truth((not _S.truth(_S.named_value(_n_c_b10,"inst")) if _S.truth(not _S.truth(_S.named_value(_n_c_b10,"inst"))) else _S.named_value(_n_c_b10,"over"))):
			continue
		_S.set_prop(_S.named_value(_S.named_value(_n_c_b10,"inst"),"options"),"x",(_n_tx_b3 + (_n_sign_b5 * _S.call_value(_n_at,[_S.named_value(_n_c_b10,"x")]))),"=")
		_S.set_prop(_S.named_value(_S.named_value(_n_c_b10,"inst"),"options"),"y",(_n_ty_b4 + _S.call_value(_n_at,[_S.named_value(_n_c_b10,"y")])),"=")
		_S.set_prop(_S.named_value(_S.named_value(_n_c_b10,"inst"),"options"),"flip",_S.binary("!==",(_n_sign_b5 < 0),_S.named_value(_n_c_b10,"flip")),"=")
		_S.invoke(_S.named_value(_n_c_b10,"inst"),"draw",[_n_frame_b2, _n_layer_b1])
	_S.invoke(_n_Object,"assign",[_n_p_b0, {"tx":_n_tx_b3,"ty":_n_ty_b4,"fx":_n_sign_b5,"cs":_n_cs_b6,"sn":_n_sn_b7,"fade":_n_fade_b8,"lightK":_n_lightK_b9}])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v5 in _S.array(_S.read(_e, "list")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "c", _v5)
		var _v7 = _S.scope(_v6)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v7, "c"), "over"), func(): return _S.binary("<", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "c"), "t")))):
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v7, "c"), "inst"))):
			_S.set_prop(_S.read(_v7, "c"), "inst", _S.call_value(_S.read(_v7, "createFx"), [_S.prop(_S.read(_v7, "c"), "fx"), _S.prop(_S.read(_v7, "c"), "opts")]), "=", false)
		else:
			_S.invoke(_S.prop(_S.read(_v7, "c"), "inst"), "update", [_S.read(_v7, "dt")])
		if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "c"), "until")), func(): return _S.logical("&&", _S.invoke(_S.prop(_S.read(_v7, "c"), "inst"), "done", []), func(): return _S.unary("!", _S.prop(_S.prop(_S.prop(_S.read(_v7, "c"), "fx"), "meta"), "loop"))))):
			_S.set_prop(_S.read(_v7, "c"), "over", true, "=", false)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_each = _S.read(_parent,"each")
	var _n_p_b0 = _S.arg(_args,0)
	return _S.call_value(_n_each,[_n_p_b0, "back"])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_each = _S.read(_parent,"each")
	var _n_p_b0 = _S.arg(_args,0)
	return _S.call_value(_n_each,[_n_p_b0, "front"])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "keys", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	var _v8 = _S.coalesce(_S.arg(_args, 2), func(): return _S.merge([]))
	_S.define(_e, "dx", _S.coalesce(_S.prop(_v8, "dx"), func(): return 0))
	_S.define(_e, "over", _S.omit(_v8, ["dx"]))
	return _S.invoke(_S.read(_e, "keys"), "map", [_S.function_value(_e, "_f9")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "t", _S.prop(_v9, 0))
	_S.define(_e, "pose", _S.prop(_v9, 1))
	_S.define(_e, "how", _S.prop(_v9, 2))
	return [_S.binary("+", _S.read(_e, "t"), _S.read(_e, "dt")), _S.merge([_S.read(_e, "pose"), _S.read(_e, "over"), {"x": _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "pose"), "x"), func(): return 0), _S.read(_e, "dx"))}]), _S.read(_e, "how")]

static func _f10(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_hits_b0 = _S.arg(_args,0)
	var _n_dt_b1 = _S.arg(_args,1)
	return _S.invoke(_n_hits_b0,"map",[_S.function_value(_S.capture(_parent,{"dt":_n_dt_b1,"this":_n_this}),"_f11")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "h"), {"t": _S.binary("+", _S.prop(_S.read(_e, "h"), "t"), _S.read(_e, "dt"))}])
