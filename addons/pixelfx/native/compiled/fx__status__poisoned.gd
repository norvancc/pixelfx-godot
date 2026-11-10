@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/poisoned.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "body", _S.function_value(_e, "_f0"))
	_S.define(_e, "offsets", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f11"))
	_S.define(_e, "draw", _S.function_value(_e, "_f14"))
	_S.define(_e, "meta", _S.merge([{"name": "Poisoned"}, {"desc": "Sick to the bone: green rolls up the body in waves, dark veins creep from a wound, toxic sweat drips and hisses; every 0.8 s it wobbles, blisters pop and a ring pulses out."}, {"tags": ["status", "poison", "toxic", "dot", "debuff", "sick", "loop"]}, {"size": [72, 64]}, {"origin": [36, 54]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0e1d14", "#173320", "#23552e", "#318232", "#55b92f", "#8eea3f", "#cfff63", "#f6ffc2"]}, {"veins": "#2c1a3a"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SICK", _S.merge([{"turn": 0.8}, {"crouch": 4}, {"lean": 4}, {"hy": 1}, {"fx": 2}, {"fy": _S.unary("-", 20)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 3}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}, {"crouch": 5}, {"lean": 5}])], [0.2, _S.merge([_S.read(_e, "SICK"), {"x": 0}])], [0.5, _S.merge([_S.read(_e, "SICK"), {"x": 1}])], [0.8, _S.merge([_S.read(_e, "SICK"), {"x": 1}, {"crouch": 5}, {"lean": 5}])], [1, _S.merge([_S.read(_e, "SICK"), {"x": 0}])], [1.3, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}])], [1.6, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}, {"crouch": 5}, {"lean": 5}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICK", 0.8)
	_S.define(_e, "G", 760)
	_S.define(_e, "since", _S.function_value(_e, "_f17"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f18"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "BODIES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "BODIES"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "m"))):
		_S.invoke(_S.read(_e, "BODIES"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "m", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "m"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "m"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 7), 3)]))
	var _v0 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.6)]))
	_S.define(_e, "l", _S.prop(_v0, 0))
	_S.define(_e, "r", _S.prop(_v0, 1))
	_S.define(_e, "wx", _S.binary("-", _S.read(_e, "r"), 1))
	_S.define(_e, "wy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.6)]))
	_S.define(_e, "veins", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f1"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 4)):
		_S.call_value(_S.read(_v3, "walk"), [_S.read(_v3, "wx"), _S.read(_v3, "wy"), _S.binary("+", _S.prop(_S.read(_v3, "Math"), "PI"), _S.binary("*", _S.binary("-", _S.binary("/", _S.read(_v3, "i"), 4), 0.45), 2.2)), 11, 0])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "lum", _S.function_value(_e, "_f2"))
	_S.define(_e, "skin", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "pick", _S.function_value(_e, "_f4"))
	_S.define(_e, "blisters", _S.invoke([0, 1], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")]))
	_S.define(_e, "sweat", [])
	for _v7 in _S.array(_S.read(_e, "E")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "e", _v7)
		_S.invoke(_S.read(_v8, "sweat"), "push", [[(_S.binary("-", _S.prop(_S.read(_v8, "e"), "x0"), 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "e"), "x0"), _S.binary("/", _S.read(_v8, "W"), 2))) else _S.binary("+", _S.prop(_S.read(_v8, "e"), "x1"), 1)), _S.binary("-", _S.prop(_S.read(_v8, "e"), "y0"), 1)]])
	for _v9 in _S.array([_S.unary("-", 1), 1]):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "side", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "hand", _S.invoke(_S.prop(_S.read(_v11, "S"), "body"), "filter", [_S.function_value(_v11, "_f8")]))
		if _S.truth(_S.prop(_S.read(_v11, "hand"), "length")):
			_S.invoke(_S.read(_v11, "sweat"), "push", [_S.prop(_S.read(_v11, "hand"), 0)])
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "sweat"), "length"))):
		_S.invoke(_S.read(_e, "sweat"), "push", [_S.call_value(_S.read(_e, "pick"), [(_S.read(_e, "skin") if _S.truth(_S.prop(_S.read(_e, "skin"), "length")) else _S.prop(_S.read(_e, "S"), "body"))])])
	_S.define(_e, "out", _S.merge([{"veins": _S.read(_e, "veins")}, {"wound": [_S.read(_e, "wx"), _S.read(_e, "wy")]}, {"blisters": _S.read(_e, "blisters")}, {"sweat": _S.read(_e, "sweat")}]))
	_S.invoke(_S.read(_e, "m"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_S = _S.read(_parent,"S")
	var _n_walk = _S.read(_parent,"walk")
	var _n_veins = _S.read(_parent,"veins")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_ang_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_depth_b4 = _S.arg(_args,4)
	var _n_pts_b5 = []
	if true:
		var _n_s_b6 = 0
		while _S.truth((_n_s_b6 < _n_len_b3)):
			_n_ang_b2 += _S.invoke(_n_R,"range",[(-0.5), 0.5])
			_n_x_b0 += cos(_n_ang_b2)
			_n_y_b1 += sin(_n_ang_b2)
			if _S.truth(not _S.truth(_S.invoke(_n_S,"on",[floori(_n_x_b0+0.5), floori(_n_y_b1+0.5)]))):
				break
			_S.invoke(_n_pts_b5,"push",[[floori(_n_x_b0+0.5), floori(_n_y_b1+0.5), (float(_n_s_b6)/_n_len_b3)]])
			if _S.truth((_S.invoke(_n_R,"chance",[0.16]) if _S.truth(((_n_s_b6 > 2) if _S.truth((_n_depth_b4 < 2)) else (_n_depth_b4 < 2))) else ((_n_s_b6 > 2) if _S.truth((_n_depth_b4 < 2)) else (_n_depth_b4 < 2)))):
				_S.call_value(_n_walk,[_n_x_b0, _n_y_b1, (_n_ang_b2 + (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[0.6, 1.1]))), (_n_len_b3 * 0.55), (_n_depth_b4 + 1)])
			_n_s_b6 += 1.0
	_S.invoke(_n_veins,"push",[_n_pts_b5])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.ColorFX.luma(_S.call_value(_n_colorAt,[_n_a, _n_x_b0, _n_y_b1]))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_lum = _S.read(_parent,"lum")
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.logical("&&",_S.logical("&&",(_S.call_value(_n_lum,[_n_x_b0, _n_y_b1]) > 0.55),func():return _S.invoke(_n_S,"on",[(_n_x_b0 - 1), _n_y_b1])),func():return _S.invoke(_n_S,"on",[(_n_x_b0 + 1), _n_y_b1]))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_list_b0 = _S.arg(_args,0)
	return _S.index_value(_n_list_b0,floori((_S.invoke(_n_R,"next",[]) * _S.prop(_n_list_b0,"length"))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	return _S.invoke([0, 1, 2],"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_pick = _S.read(_parent,"pick")
	var _n_S = _S.read(_parent,"S")
	var _n_this = _S.read(_parent,"this")
	var _n_R = _S.read(_parent,"R")
	var _tuple_0 = _S.call_value(_n_pick,[_S.invoke(_S.named_value(_n_S,"body"),"filter",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f7")])])
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return {"x":_n_x_b0,"y":_n_y_b1,"r":_S.invoke(_n_R,"range",[1.1, 1.8])}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.logical("&&",_S.logical("&&",(_S.invoke(_n_S,"on",[(_n_x_b0 - 1), _n_y_b1]) if _S.truth((_n_y_b1 > 4)) else (_n_y_b1 > 4)),func():return _S.invoke(_n_S,"on",[(_n_x_b0 + 1), _n_y_b1])),func():return _S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 - 1)]))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_l = _S.read(_parent,"l")
	var _n_side = _S.read(_parent,"side")
	var _n_r = _S.read(_parent,"r")
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return (not _S.truth(_S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 + 1)])) if _S.truth((((_n_x_b0 <= (_n_l + 1)) if _S.truth((_n_side < 0)) else (_n_x_b0 >= (_n_r - 1))) if _S.truth(((_n_y_b1 < (_n_H * 0.7)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.7)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5))))) else (((_n_x_b0 <= (_n_l + 1)) if _S.truth((_n_side < 0)) else (_n_x_b0 >= (_n_r - 1))) if _S.truth(((_n_y_b1 < (_n_H * 0.7)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.7)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_since = _S.read(_parent,"since")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_lean_b2 = (1.3 * sin(((float(_n_t_b0)/_n_D) * _n_TAU)))
	var _n_ph_b3 = _S.call_value(_n_since,[_n_t_b0])
	var _n_wob_b4 = (_n_ph_b3 < 0.12)
	var _n_w_b5 = (sin(((float(_n_ph_b3)/0.12) * PI)) if _S.truth(_n_wob_b4) else 0)
	return _S.function_value(_S.capture(_parent,{"lean":_n_lean_b2,"H":_n_H_b1,"w":_n_w_b5,"ph":_n_ph_b3,"this":_this}),"_f10")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_lean = _S.read(_parent,"lean")
	var _n_H = _S.read(_parent,"H")
	var _n_w = _S.read(_parent,"w")
	var _n_ph = _S.read(_parent,"ph")
	var _n_my_b0 = _S.arg(_args,0)
	return floori(((_n_lean * (1 - (float(_n_my_b0)/_n_H))) + (_n_w * sin(((_n_my_b0 * 0.42) + (_n_ph * 40)))))+0.5)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_P_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = _S.call_value(_n_since,[_n_t_b1])
	var _n_k_b5 = (float(_n_ph_b4)/0.55)
	if _S.truth((_n_k_b5 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (5 + (22 * sqrt(_n_k_b5))), 0.18, maxf(1,(2.5 * (1 - _n_k_b5))), (1 - _n_k_b5), [_S.index_value(_n_P_b3,3), _S.index_value(_n_P_b3,4), _S.index_value(_n_P_b3,5), _S.index_value(_n_P_b3,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	_S.invoke(_n_p_b0,"shade",[(-28), (-3), 28, 6, _S.function_value(_S.capture(_parent,{"P":_n_P_b3,"ph":_n_ph_b4,"this":_this}),"_f13")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_ph = _S.read(_parent,"ph")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float(_n_x_b0)/24), (float((_n_y_b1 - 0.5))/4)])
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_P,4),"=")
		_S.set_prop(_n_out_b2,"k",(((0.14 + (0.2 * exp((float((-_n_ph))/0.2)))) * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_body = _S.read(_parent,"body")
	var _n_offsets = _S.read(_parent,"offsets")
	var _n_since = _S.read(_parent,"since")
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_hex = _S.read(_parent,"hex")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_P_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_H_b6 = _S.named_value(_n_S_b5,"h")
	var _n_B_b7 = _S.call_value(_n_body,[_n_a_b4, _S.named_value(_n_o_b2,"seed")])
	var _n_off_b8 = _S.call_value(_n_offsets,[_n_t_b1, _n_H_b6])
	var _n_ph_b9 = _S.call_value(_n_since,[_n_t_b1])
	var _n_tick_b10 = fmod(floori((float(_n_t_b1)/_n_TICK)),2)
	var _n_vein_b11 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"veins")])
	for _iter_0 in _S.array(_S.named_value(_n_S_b5,"body")):
		var _tuple_1 = _iter_0
		var _n_mx_b16 = _S.prop(_tuple_1,0)
		var _n_my_b17 = _S.prop(_tuple_1,1)
		var _n_c_b18 = _S.call_value(_n_colorAt,[_n_a_b4, _n_mx_b16, _n_my_b17])
		var _n_l_b19 = _S.ColorFX.luma(_n_c_b18)
		var _n_wave_b20 = (0.5 + (0.5 * sin((_n_TAU * (((float(_n_my_b17)/_n_H_b6) * 1.6) + ((float(_n_t_b1)/_n_D) * 2))))))
		var _n_sick_b21 = _S.index_value(_n_P_b3,clampf((1 + floori((_n_l_b19 * 6.2)+0.5)),1,7))
		var _n_k_b22 = (0.22 + ((0.4 * _n_wave_b20) * _n_wave_b20))
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b4,"x") + _n_mx_b16) + _S.call_value(_n_off_b8,[_n_my_b17])), (_S.named_value(_n_a_b4,"y") + _n_my_b17), _S.ColorFX.mix(_n_c_b18,(_S.ColorFX.mix(_n_sick_b21,_S.index_value(_n_P_b3,6),0.3) if _S.truth(((_n_l_b19 > 0.4) if _S.truth((_n_wave_b20 > 0.85)) else (_n_wave_b20 > 0.85))) else _n_sick_b21),_n_k_b22)])
	var _n_grow_b12 = ((_S.MathFX.smooth(0,(_n_D * 0.55),_n_t_b1) * (1 - _S.MathFX.smooth((_n_D * 0.62),_n_D,_n_t_b1))) * 1.15)
	for _iter_2 in _S.array(_S.named_value(_n_B_b7,"veins")):
		var _n_pts_b23 = _iter_2
		for _iter_3 in _S.array(_n_pts_b23):
			var _tuple_4 = _iter_3
			var _n_x_b24 = _S.prop(_tuple_4,0)
			var _n_y_b25 = _S.prop(_tuple_4,1)
			var _n_u_b26 = _S.prop(_tuple_4,2)
			if _S.truth((_n_u_b26 < _n_grow_b12)):
				_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b4,"x") + _n_x_b24) + _S.call_value(_n_off_b8,[_n_y_b25])), (_S.named_value(_n_a_b4,"y") + _n_y_b25), (_S.index_value(_n_P_b3,2) if _S.truth((_n_u_b26 > (_n_grow_b12 - 0.12))) else _n_vein_b11)])
	var _tuple_5 = _S.named_value(_n_B_b7,"wound")
	var _n_wx_b13 = _S.prop(_tuple_5,0)
	var _n_wy_b14 = _S.prop(_tuple_5,1)
	_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b4,"x") + _n_wx_b13) + _S.call_value(_n_off_b8,[_n_wy_b14])), (_S.named_value(_n_a_b4,"y") + _n_wy_b14), _S.index_value(_n_P_b3,6)])
	_S.invoke(_n_p_b0,"px",[(((_S.named_value(_n_a_b4,"x") + _n_wx_b13) + _S.call_value(_n_off_b8,[_n_wy_b14])) - 1), (_S.named_value(_n_a_b4,"y") + _n_wy_b14), _S.index_value(_n_P_b3,3)])
	_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_a_b4,"x") + _n_wx_b13), (_S.named_value(_n_a_b4,"y") + _n_wy_b14), 6, _S.index_value(_n_P_b3,5), 0.3])
	for _iter_6 in _S.array(_S.index_value(_S.named_value(_n_B_b7,"blisters"),_n_tick_b10)):
		var _n_bl_b27 = _iter_6
		var _n_x_b28 = ((_S.named_value(_n_a_b4,"x") + _S.named_value(_n_bl_b27,"x")) + _S.call_value(_n_off_b8,[_S.named_value(_n_bl_b27,"y")]))
		var _n_y_b29 = (_S.named_value(_n_a_b4,"y") + _S.named_value(_n_bl_b27,"y"))
		var _n_grow2_b30 = clampf((float(_n_ph_b9)/0.16),0.0,1.0)
		var _n_pop_b31 = (_n_ph_b9 > 0.38)
		if _S.truth(not _S.truth(_n_pop_b31)):
			var _n_r_b32 = (_S.named_value(_n_bl_b27,"r") * _n_grow2_b30)
			_S.invoke(_n_p_b0,"circle",[_n_x_b28, _n_y_b29, (_n_r_b32 + 0.6), _S.index_value(_n_P_b3,3)])
			_S.invoke(_n_p_b0,"circle",[(_n_x_b28 - 0.2), (_n_y_b29 - 0.2), _n_r_b32, _S.index_value(_n_P_b3,5)])
			if _S.truth((_n_r_b32 > 0.8)):
				_S.invoke(_n_p_b0,"px",[(_n_x_b28 - 0.5), (_n_y_b29 - 0.8), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_x_b28, _n_y_b29, 4, _S.index_value(_n_P_b3,5), (0.3 * _n_grow2_b30)])
		else:
			if _S.truth((_n_ph_b9 < 0.56)):
				var _n_k_b33 = (float((_n_ph_b9 - 0.38))/0.18)
				if true:
					var _n_j_b34 = 0
					while _S.truth((_n_j_b34 < 6)):
						var _n_an_b35 = (((float(_n_j_b34)/6) * _n_TAU) + _S.named_value(_n_bl_b27,"x"))
						var _n_d_b36 = ((_S.named_value(_n_bl_b27,"r") + 0.5) + (_n_k_b33 * 3.5))
						_S.invoke(_n_p_b0,"dot",[(_n_x_b28 + (cos(_n_an_b35) * _n_d_b36)), ((_n_y_b29 + (sin(_n_an_b35) * _n_d_b36)) - (_n_k_b33 * 2)), (_S.index_value(_n_P_b3,6) if _S.truth(fmod(_n_j_b34,2)) else _S.index_value(_n_P_b3,5)), (1.2 - _n_k_b33)])
						_n_j_b34 += 1.0
				_S.invoke(_n_p_b0,"glow",[_n_x_b28, _n_y_b29, 6, _S.index_value(_n_P_b3,6), (0.4 * (1 - _n_k_b33))])
	_S.invoke(_S.named_value(_n_B_b7,"sweat"),"forEach",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"a":_n_a_b4,"off":_n_off_b8,"p":_n_p_b0,"P":_n_P_b3,"this":_this}),"_f15")])
	var _n_k_b15 = (float(_n_ph_b9)/0.55)
	if _S.truth((_n_k_b15 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (5 + (22 * sqrt(_n_k_b15))), 0.18, maxf(1,(2.5 * (1 - _n_k_b15))), (1 - _n_k_b15), [_S.index_value(_n_P_b3,3), _S.index_value(_n_P_b3,4), _S.index_value(_n_P_b3,5), _S.index_value(_n_P_b3,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f16")])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + (_n_H_b6 * 0.45)), 26, _S.index_value(_n_P_b3,4), (0.14 + (0.2 * exp((float((-_n_ph_b9))/0.18))))])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_t = _S.read(_parent,"t")
	var _n_a = _S.read(_parent,"a")
	var _n_off = _S.read(_parent,"off")
	var _n_p = _S.read(_parent,"p")
	var _n_P = _S.read(_parent,"P")
	var _n_G = _S.read(_parent,"G")
	var _tuple_0 = _S.arg(_args,0)
	var _n_sx_b0 = _S.prop(_tuple_0,0)
	var _n_sy_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	var _n_per_b3 = (float(_n_D)/2)
	var _n_age_b4 = fmod((fmod((_n_t - (_n_i_b2 * 0.37)),_n_per_b3) + _n_per_b3),_n_per_b3)
	var _n_gather_b5 = 0.35
	var _n_x_b6 = (((_S.named_value(_n_a,"x") + _n_sx_b0) + 0.5) + _S.call_value(_n_off,[_n_sy_b1]))
	var _n_y0_b7 = (_S.named_value(_n_a,"y") + _n_sy_b1)
	if _S.truth((_n_age_b4 < _n_gather_b5)):
		var _n_k_b13 = (float(_n_age_b4)/_n_gather_b5)
		var _n_run_b14 = floori((_n_k_b13 * 2)+0.5)
		_S.invoke(_n_p,"px",[_n_x_b6, (_n_y0_b7 + _n_run_b14), (_S.index_value(_n_P,6) if _S.truth((_n_k_b13 > 0.5)) else _S.index_value(_n_P,5))])
		if _S.truth((_n_k_b13 > 0.5)):
			_S.invoke(_n_p,"px",[_n_x_b6, ((_n_y0_b7 + _n_run_b14) - 1), _S.index_value(_n_P,4)])
		return null
	var _n_f_b8 = (_n_age_b4 - _n_gather_b5)
	var _n_fallH_b9 = ((-1) - (_n_y0_b7 + 2))
	var _n_tf_b10 = sqrt((float((2 * maxf(1,_n_fallH_b9)))/_n_G))
	if _S.truth((_n_f_b8 < _n_tf_b10)):
		var _n_y_b15 = ((_n_y0_b7 + 2) + (((0.5 * _n_G) * _n_f_b8) * _n_f_b8))
		_S.invoke(_n_p,"line",[_n_x_b6, (_n_y_b15 - minf(3,((_n_G * _n_f_b8) * 0.012))), _n_x_b6, _n_y_b15, _S.index_value(_n_P,4)])
		_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b15, _S.index_value(_n_P,6)])
		return null
	var _n_h_b11 = (_n_f_b8 - _n_tf_b10)
	if _S.truth((_n_h_b11 > 0.4)):
		return null
	var _n_k_b12 = (float(_n_h_b11)/0.4)
	_S.invoke(_n_p,"line",[((_n_x_b6 - 1) - (_n_k_b12 * 2)), (-1), ((_n_x_b6 + 1) + (_n_k_b12 * 2)), (-1), _S.index_value(_n_P,(6 if _S.truth((_n_k_b12 < 0.4)) else 4)), (1.2 - _n_k_b12)])
	if true:
		var _n_j_b16 = 0
		while _S.truth((_n_j_b16 < 3)):
			_S.invoke(_n_p,"dot",[(_n_x_b6 + ((_n_j_b16 - 1) * (2 + (3 * _n_k_b12)))), (((-2) - fmod(_n_j_b16,2)) - ((5 * _n_k_b12) * (1 - _n_k_b12))), _S.index_value(_n_P,6), (1 - _n_k_b12)])
			_n_j_b16 += 1.0
	_S.invoke(_n_p,"disc",[(_n_x_b6 + (sin((_n_k_b12 * 6)) * 1.5)), ((-3) - (_n_k_b12 * 6)), (1 + (1.5 * _n_k_b12)), _S.index_value(_n_P,5), (0.35 * (1 - _n_k_b12))])
	_S.invoke(_n_p,"glow",[_n_x_b6, (-1.5), 5, _S.index_value(_n_P,5), (0.35 * (1 - _n_k_b12))])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_t_b0 = _S.arg(_args,0)
	return fmod((fmod(_n_t_b0,_n_TICK) + _n_TICK),_n_TICK)
	return null

static func _f18(_parent,_args:Array,_this=null):
	return 0
	return null
