@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/burning.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "tnoise", _S.import_value("fx/status/_lib.js", "tnoise"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "tongue", _S.import_value("fx/status/_lib.js", "tongue"))
	_S.define(_e, "smoke", _S.import_value("fx/status/_lib.js", "smoke"))
	_S.define(_e, "ember", _S.import_value("fx/status/_lib.js", "ember"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "spots", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Burning"}, {"desc": "Burning over time: small flames lick from four hot spots, trailing sparks and thin smoke; every 0.6 s they flare, the body flashes white then orange, scorch marks spread."}, {"tags": ["status", "fire", "burn", "dot", "debuff", "loop"]}, {"size": [72, 80]}, {"origin": [36, 70]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"char": ["#120c0a", "#2a1a14", "#4a2c1c"]}, {"smoke": "#5b5566"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "A_", _S.merge([{"turn": 1}, {"crouch": 2}, {"lean": 2}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 38)}, {"bx": 12}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 7)}, {"fbx": 5}]))
	_S.define(_e, "B_", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"lean": _S.unary("-", 2)}, {"fx": _S.unary("-", 12)}, {"fy": _S.unary("-", 17)}, {"bx": 13}, {"by": _S.unary("-", 38)}, {"ffx": _S.unary("-", 4)}, {"fbx": 4}, {"fby": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "A_")], [0.15, _S.read(_e, "B_"), "snap"], [0.3, _S.read(_e, "A_"), "snap"], [0.45, _S.read(_e, "B_"), "snap"], [0.6, _S.read(_e, "A_"), "snap"], [0.75, _S.read(_e, "B_"), "snap"], [0.9, _S.read(_e, "A_"), "snap"], [1.05, _S.read(_e, "B_"), "snap"], [1.2, _S.read(_e, "A_"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICK", 0.6)
	_S.define(_e, "WIND", _S.unary("-", 14))
	_S.define(_e, "since", _S.function_value(_e, "_f20"))
	_S.define(_e, "flare", _S.function_value(_e, "_f21"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f22"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "SPOTS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "SPOTS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "s"))):
		_S.invoke(_S.read(_e, "SPOTS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "s", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "s"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "s"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 13), 5)]))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	_S.define(_e, "hair", _S.prop(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f2")]), "sort", [_S.function_value(_e, "_f3")]), 0))
	_S.define(_e, "shoulder", _S.logical("??", _S.prop(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f4")]), "sort", [_S.function_value(_e, "_f5")]), 0), func(): return _S.call_value(_S.read(_e, "at"), [0.5, 1])))
	_S.define(_e, "list", _S.invoke([_S.merge([{"at": _S.read(_e, "hair")}, {"side": _S.unary("-", 1)}, {"n": 3}, {"h": 4.5}]), _S.merge([{"at": _S.read(_e, "shoulder")}, {"side": 1}, {"n": 2}, {"h": 4}]), _S.merge([{"at": _S.call_value(_S.read(_e, "at"), [0.62, _S.unary("-", 1)])}, {"side": _S.unary("-", 1)}, {"n": 2}, {"h": 3.5}]), _S.merge([{"at": _S.call_value(_S.read(_e, "at"), [0.6, 1])}, {"side": 1}, {"n": 2}, {"h": 3.5}])], "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "scorch", _S.invoke([0, 1], "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "out", _S.merge([{"list": _S.read(_e, "list")}, {"scorch": _S.read(_e, "scorch")}]))
	_S.invoke(_S.read(_e, "s"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_S = _S.read(_parent,"S")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.arg(_args,1)
	var _n_my_b2 = floori((_n_H * _n_q_b0)+0.5)
	var _tuple_0 = _S.index_value(_S.named_value(_n_S,"rows"),_n_my_b2)
	var _n_l_b3 = _S.prop(_tuple_0,0)
	var _n_r_b4 = _S.prop(_tuple_0,1)
	return [(_n_l_b3 if _S.truth((_n_side_b1 < 0)) else _n_r_b4), _n_my_b2]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	return (_n_x_b0 < (_n_W * 0.42))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_p_b0,1) - _S.index_value(_n_q_b1,1)) if _S.truth((_S.index_value(_n_p_b0,1) - _S.index_value(_n_q_b1,1))) else (_S.index_value(_n_p_b0,0) - _S.index_value(_n_q_b1,0)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return ((_n_y_b1 < (_n_H * 0.62)) if _S.truth(((_n_y_b1 > (_n_H * 0.4)) if _S.truth((_n_x_b0 > (float(_n_W)/2))) else (_n_x_b0 > (float(_n_W)/2)))) else ((_n_y_b1 > (_n_H * 0.4)) if _S.truth((_n_x_b0 > (float(_n_W)/2))) else (_n_x_b0 > (float(_n_W)/2))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_p_b0,1) - _S.index_value(_n_q_b1,1))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sp", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([_S.read(_e, "sp"), {"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.prop(_S.prop(_S.read(_e, "sp"), "at"), 0)), 0.5)}, {"y": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.prop(_S.prop(_S.read(_e, "sp"), "at"), 1)), 1.5)}, {"tongues": _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "sp"), "n")}]), _S.function_value(_e, "_f7")])}])

static func _f7(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_R = _S.read(_parent,"R")
	var _n_i = _S.read(_parent,"i")
	var _n_seed = _S.read(_parent,"seed")
	var _n___b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return {"dx":(((_n_j_b1 - (float((_S.named_value(_n_sp,"n") - 1))/2)) * 1.6) + _S.invoke(_n_R,"range",[(-0.4), 0.4])),"h":(_S.named_value(_n_sp,"h") * _S.invoke(_n_R,"range",[0.8, 1.2])),"n":(((_n_i * 17) + (_n_j_b1 * 5)) + _n_seed)}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_tick_b0 = _S.arg(_args,0)
	return _S.invoke([0, 1],"map",[_S.function_value(_S.capture(_parent,{"tick":_n_tick_b0,"this":_n_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_list = _S.read(_parent,"list")
	var _n_tick = _S.read(_parent,"tick")
	var _n_this = _S.read(_parent,"this")
	var _n_S = _S.read(_parent,"S")
	var _n_R = _S.read(_parent,"R")
	var _n_a = _S.read(_parent,"a")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_sp_b1 = _S.index_value(_n_list,fmod((((_n_tick * 2) + _n_k_b0) + 1),_S.prop(_n_list,"length")))
	var _n_lum_b2 = _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f10")
	var _n_cand_b3 = _S.invoke(_S.named_value(_n_S,"body"),"filter",[_S.function_value(_S.capture(_parent,{"sp":_n_sp_b1,"lum":_n_lum_b2,"this":_n_this}),"_f11")])
	if _S.truth(not _S.truth(_S.prop(_n_cand_b3,"length"))):
		_n_cand_b3 = _S.invoke(_S.named_value(_n_S,"body"),"filter",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f12")])
	var _tuple_0 = _S.index_value(_n_cand_b3,floori((_S.invoke(_n_R,"next",[]) * _S.prop(_n_cand_b3,"length"))))
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	return {"x":((_S.named_value(_n_a,"x") + _n_x_b4) + 0.5),"y":((_S.named_value(_n_a,"y") + _n_y_b5) + 0.5),"r":_S.invoke(_n_R,"range",[3.2, 4.4])}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.ColorFX.luma(_S.call_value(_n_colorAt,[_n_a, _n_x_b0, _n_y_b1]))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_sp = _S.read(_parent,"sp")
	var _n_H = _S.read(_parent,"H")
	var _n_lum = _S.read(_parent,"lum")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.logical("&&",_S.logical("&&",_S.logical("&&",(_S.Bridge.hypot([(((_S.named_value(_n_a,"x") + _n_x_b0) + 0.5) - _S.named_value(_n_sp,"x")), (((_S.named_value(_n_a,"y") + _n_y_b1) + 0.5) - _S.named_value(_n_sp,"y"))]) < 9),func():return (_n_y_b1 > (_n_H * 0.42))),func():return (_S.call_value(_n_lum,[_n_x_b0, _n_y_b1]) > 0.3)),func():return (_S.call_value(_n_lum,[_n_x_b0, _n_y_b1]) < 0.6))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return (_n_y_b0 > (_n_H * 0.45))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_flare = _S.read(_parent,"flare")
	var _n_D = _S.read(_parent,"D")
	var _n_tnoise = _S.read(_parent,"tnoise")
	var _n_hex = _S.read(_parent,"hex")
	var _n_spots = _S.read(_parent,"spots")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.invoke(_S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9),"reverse",[])
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_fl_b5 = _S.call_value(_n_flare,[_n_t_b1])
	var _n_flick_b6 = (0.8 + (0.2 * _S.call_value(_n_tnoise,[_n_t_b1, _n_D, 7.5, 3])))
	_S.invoke(_n_p_b0,"shade",[(-30), (-3), 30, 7, _S.function_value(_S.capture(_parent,{"F":_n_F_b3,"fl":_n_fl_b5,"flick":_n_flick_b6,"this":_this}),"_f14")])
	var _n_smokeC_b7 = _S.ColorFX.mix(_S.call_value(_n_hex,[_S.named_value(_n_o_b2,"smoke")]),_S.index_value(_n_F_b3,6),0.2)
	var _object_0 = _S.call_value(_n_spots,[_n_a_b4, _S.named_value(_n_o_b2,"seed")])
	var _n_list_b8 = _S.named_value(_object_0,"list")
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 16, (_S.named_value(_n_o_b2,"seed") + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f15"), _S.function_value(_S.capture(_parent,{"list":_n_list_b8,"p":_n_p_b0,"smokeC":_n_smokeC_b7,"this":_this}),"_f16")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_F = _S.read(_parent,"F")
	var _n_fl = _S.read(_parent,"fl")
	var _n_flick = _S.read(_parent,"flick")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float(_n_x_b0)/26), (float((_n_y_b1 - 0.5))/4.5)])
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.ColorFX.mix(_S.index_value(_n_F,3),_S.index_value(_n_F,4),0.5),"=")
		_S.set_prop(_n_out_b2,"k",((((0.16 + (0.22 * _n_fl)) * _n_flick) * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.2])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_list = _S.read(_parent,"list")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_travel = _S.read(_parent,"travel")
	var _n_p = _S.read(_parent,"p")
	var _n_smokeC = _S.read(_parent,"smokeC")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_sp_b4 = _S.index_value(_n_list,fmod(_n_i_b3,_S.prop(_n_list,"length")))
	var _n_x_b5 = ((_S.named_value(_n_sp_b4,"x") + _S.call_value(_n_travel,[(_n_WIND * 0.6), (_n_WIND * 0.5), 0.8, _n_age_b0])) + (sin(((_n_age_b0 * 4) + _n_i_b3)) * 1.2))
	var _n_y_b6 = ((_S.named_value(_n_sp_b4,"y") - 3) - _S.call_value(_n_travel,[18, 6, 1, _n_age_b0]))
	_S.call_value(_n_smoke,[_n_p, _n_x_b5, _n_y_b6, _S.invoke(_n_r_b2,"range",[1.1, 1.9]), (float(_n_age_b0)/_n_life_b1), _n_smokeC, 0.9])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_spots = _S.read(_parent,"spots")
	var _n_since = _S.read(_parent,"since")
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_flare = _S.read(_parent,"flare")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_tnoise = _S.read(_parent,"tnoise")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_tongue = _S.read(_parent,"tongue")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_travel = _S.read(_parent,"travel")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.invoke(_S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9),"reverse",[])
	var _n_CH_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"char"),3)
	var _n_a_b5 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b6 = _S.call_value(_n_shape,[_n_a_b5])
	var _object_0 = _S.call_value(_n_spots,[_n_a_b5, _S.named_value(_n_o_b2,"seed")])
	var _n_list_b7 = _S.named_value(_object_0,"list")
	var _n_scorch_b8 = _S.named_value(_object_0,"scorch")
	var _n_ph_b9 = _S.call_value(_n_since,[_n_t_b1])
	var _n_tick_b10 = fmod(floori((float(_n_t_b1)/_n_TICK)),2)
	var _n_fl_b11 = _S.call_value(_n_flare,[_n_t_b1])
	if _S.truth((_n_ph_b9 < 0.034)):
		for _iter_1 in _S.array(_S.named_value(_n_S_b6,"body")):
			var _tuple_2 = _iter_1
			var _n_mx_b12 = _S.prop(_tuple_2,0)
			var _n_my_b13 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b5,"x") + _n_mx_b12), (_S.named_value(_n_a_b5,"y") + _n_my_b13), _n_WHITE])
	else:
		if _S.truth((_n_ph_b9 < 0.22)):
			var _n_k_b14 = (1 - (float((_n_ph_b9 - 0.034))/0.186))
			for _iter_3 in _S.array(_S.named_value(_n_S_b6,"body")):
				var _tuple_4 = _iter_3
				var _n_mx_b15 = _S.prop(_tuple_4,0)
				var _n_my_b16 = _S.prop(_tuple_4,1)
				_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_a_b5,"x") + _n_mx_b15), (_S.named_value(_n_a_b5,"y") + _n_my_b16), _S.index_value(_n_F_b3,4), (0.55 * _n_k_b14)])
	for _iter_5 in _S.array(_S.index_value(_n_scorch_b8,_n_tick_b10)):
		var _n_sc_b17 = _iter_5
		var _n_grow_b18 = clampf((float(_n_ph_b9)/0.14),0.0,1.0)
		var _n_fade_b19 = (1 - clampf((float((_n_ph_b9 - 0.25))/0.33),0.0,1.0))
		var _n_r_b20 = (_S.named_value(_n_sc_b17,"r") * (0.4 + (0.6 * _n_grow_b18)))
		if _S.truth((_n_fade_b19 <= 0)):
			continue
		for _iter_6 in _S.array(_S.named_value(_n_S_b6,"body")):
			var _tuple_7 = _iter_6
			var _n_mx_b21 = _S.prop(_tuple_7,0)
			var _n_my_b22 = _S.prop(_tuple_7,1)
			var _n_x_b23 = ((_S.named_value(_n_a_b5,"x") + _n_mx_b21) + 0.5)
			var _n_y_b24 = ((_S.named_value(_n_a_b5,"y") + _n_my_b22) + 0.5)
			var _n_d_b25 = (_S.Bridge.hypot([(_n_x_b23 - _S.named_value(_n_sc_b17,"x")), ((_n_y_b24 - _S.named_value(_n_sc_b17,"y")) * 1.2)]) + (_S.MathFX.rand([_n_mx_b21,_n_my_b22,7]) * 0.9))
			if _S.truth((_n_d_b25 > _n_r_b20)):
				continue
			var _n_edge_b26 = (_n_d_b25 > (_n_r_b20 - 1))
			if _S.truth(_n_edge_b26):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b23 - 0.5), (_n_y_b24 - 0.5), (_S.index_value(_n_F_b3,3) if _S.truth((_S.MathFX.rand([_n_mx_b21,_n_my_b22,floori((_n_t_b1 * 20))]) < 0.5)) else _S.index_value(_n_F_b3,4)), (_n_fade_b19 * 1.2)])
			else:
				_S.invoke(_n_p_b0,"dot",[(_n_x_b23 - 0.5), (_n_y_b24 - 0.5), (_S.index_value(_n_CH_b4,0) if _S.truth((_n_d_b25 < (_n_r_b20 * 0.5))) else _S.index_value(_n_CH_b4,1)), (_n_fade_b19 * 1.1)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_sc_b17,"x"), _S.named_value(_n_sc_b17,"y"), 6, _S.index_value(_n_F_b3,4), (0.3 * _n_fade_b19)])
	for _iter_8 in _S.array(_n_list_b7):
		var _n_sp_b27 = _iter_8
		for _iter_9 in _S.array(_S.named_value(_n_sp_b27,"tongues")):
			var _n_tg_b28 = _iter_9
			var _n_h_b29 = ((_S.named_value(_n_tg_b28,"h") * (0.85 + (0.25 * _S.call_value(_n_tnoise,[_n_t_b1, _n_D, 5, _S.named_value(_n_tg_b28,"n")])))) * (1 + (1.6 * _n_fl_b11)))
			_S.call_value(_n_tongue,[_n_p_b0, (_S.named_value(_n_sp_b27,"x") + _S.named_value(_n_tg_b28,"dx")), _S.named_value(_n_sp_b27,"y"), _n_h_b29, (1.1 + (0.3 * _n_fl_b11)), ((float(((_n_WIND * 0.08) * _n_h_b29))/4) + (_S.call_value(_n_tnoise,[_n_t_b1, _n_D, 3, (_S.named_value(_n_tg_b28,"n") + 9)]) * 0.8)), _n_F_b3, _n_t_b1, _n_D, _S.named_value(_n_tg_b28,"n")])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_sp_b27,"x"), (_S.named_value(_n_sp_b27,"y") - 2), (9 + (6 * _n_fl_b11)), _S.index_value(_n_F_b3,4), (0.22 + (0.35 * _n_fl_b11))])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 20, (_S.named_value(_n_o_b2,"seed") + 6), _S.function_value(_S.capture(_parent,{"this":_this}),"_f18"), _S.function_value(_S.capture(_parent,{"list":_n_list_b7,"p":_n_p_b0,"F":_n_F_b3,"this":_this}),"_f19")])
	if _S.truth((_n_ph_b9 < 0.3)):
		for _iter_10 in _S.array(_S.invoke(_n_list_b7,"entries",[])):
			var _tuple_11 = _iter_10
			var _n_k_b30 = _S.prop(_tuple_11,0)
			var _n_sp_b31 = _S.prop(_tuple_11,1)
			if true:
				var _n_j_b32 = 0
				while _S.truth((_n_j_b32 < 4)):
					var _n_an_b33 = ((float((-PI))/2) + ((_S.MathFX.rand([_n_k_b30,_n_j_b32,_n_tick_b10]) - 0.5) * 2.2))
					var _n_v_b34 = (50 + (50 * _S.MathFX.rand([_n_k_b30,_n_j_b32,2])))
					var _n_x_b35 = (_S.named_value(_n_sp_b31,"x") + (cos(_n_an_b33) * _S.call_value(_n_travel,[_n_v_b34, 0, 3, _n_ph_b9])))
					var _n_y_b36 = (((_S.named_value(_n_sp_b31,"y") - 2) + (sin(_n_an_b33) * _S.call_value(_n_travel,[_n_v_b34, 0, 3, _n_ph_b9]))) + ((60 * _n_ph_b9) * _n_ph_b9))
					_S.invoke(_n_p_b0,"px",[_n_x_b35, _n_y_b36, (_S.index_value(_n_F_b3,1) if _S.truth((_n_ph_b9 < 0.12)) else _S.index_value(_n_F_b3,3))])
					_S.invoke(_n_p_b0,"light",[_n_x_b35, _n_y_b36, _S.index_value(_n_F_b3,3), (0.4 * (1 - (float(_n_ph_b9)/0.3)))])
					_n_j_b32 += 1.0
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.5, 0.9])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_list = _S.read(_parent,"list")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_travel = _S.read(_parent,"travel")
	var _n_p = _S.read(_parent,"p")
	var _n_F = _S.read(_parent,"F")
	var _n_ember = _S.read(_parent,"ember")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_sp_b4 = _S.index_value(_n_list,fmod(_n_i_b3,_S.prop(_n_list,"length")))
	var _n_x_b5 = (((_S.named_value(_n_sp_b4,"x") + _S.invoke(_n_r_b2,"range",[(-1.5), 1.5])) + _S.call_value(_n_travel,[(_n_WIND + _S.invoke(_n_r_b2,"range",[(-10), 6])), (_n_WIND * 0.6), 1.2, _n_age_b0])) + ((sin(((_n_age_b0 * 9) + _n_i_b3)) * 1.2) * _n_age_b0))
	var _n_y_b6 = ((_S.named_value(_n_sp_b4,"y") - 2) + _S.call_value(_n_travel,[(-_S.invoke(_n_r_b2,"range",[25, 55])), (-18), 1.4, _n_age_b0]))
	_S.call_value(_n_ember,[_n_p, _n_x_b5, _n_y_b6, (float(_n_age_b0)/_n_life_b1), [_S.index_value(_n_F,1), _S.index_value(_n_F,3), _S.index_value(_n_F,5)], (_n_age_b0 + _n_i_b3)])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_t_b0 = _S.arg(_args,0)
	return fmod((fmod(_n_t_b0,_n_TICK) + _n_TICK),_n_TICK)
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_t_b0 = _S.arg(_args,0)
	return exp((float((-_S.call_value(_n_since,[_n_t_b0])))/0.12))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_S.call_value(_n_since,[_n_t_b0]) < 0.034)) else 1)
	return null
