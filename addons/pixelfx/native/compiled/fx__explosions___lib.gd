@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f21":"explosion_lobe"}
const SHADERS = ["_f7","_f12","_f14"]
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "fireBall", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawPs", _S.function_value(_e, "_f2"))
	_S.define(_e, "draft", _S.function_value(_e, "_f3"))
	_S.define(_e, "cull", _S.function_value(_e, "_f4"))
	_S.define(_e, "fadeEdges", _S.function_value(_e, "_f5"))
	_S.define(_e, "pool", _S.function_value(_e, "_f6"))
	_S.define(_e, "haze", _S.function_value(_e, "_f8"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f10"))
	_S.define(_e, "rock", _S.function_value(_e, "_f11"))
	_S.define(_e, "glowDome", _S.function_value(_e, "_f13"))
	_S.define(_e, "trail", _S.function_value(_e, "_f15"))
	_S.define(_e, "drawDirt", _S.function_value(_e, "_f16"))
	_S.define(_e, "crater", _S.function_value(_e, "_f18"))
	_S.define(_e, "dome", _S.function_value(_e, "_f19"))
	_S.define(_e, "lobe", _S.function_value(_e, "_f21"))
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#17121d"]))
	_exports["OUTLINE"] = _S.read(_e, "OUTLINE")
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_exports["SOOT2"] = _S.read(_e, "SOOT2")
	_exports["stone"] = _S.read(_e, "stone")
	_S.define(_e, "fireRamp", _S.function_value(_e, "_f24"))
	_exports["fireRamp"] = _S.read(_e, "fireRamp")
	_exports["fireBall"] = _S.read(_e, "fireBall")
	_exports["drawPs"] = _S.read(_e, "drawPs")
	_S.define(_e, "LIFTS", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "SMOKE"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "FIRE"), _S.prop(_S.read(_e, "P"), "EMBER"), _S.prop(_S.read(_e, "P"), "VAPOUR")]]))
	_exports["draft"] = _S.read(_e, "draft")
	_exports["cull"] = _S.read(_e, "cull")
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "SMOKE"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "VAPOUR")]]))
	_exports["fadeEdges"] = _S.read(_e, "fadeEdges")
	_exports["pool"] = _S.read(_e, "pool")
	_exports["haze"] = _S.read(_e, "haze")
	_S.define(_e, "heatRamp", _S.function_value(_e, "_f25"))
	_exports["heatRamp"] = _S.read(_e, "heatRamp")
	_exports["scorch"] = _S.read(_e, "scorch")
	_exports["rock"] = _S.read(_e, "rock")
	_exports["glowDome"] = _S.read(_e, "glowDome")
	_exports["trail"] = _S.read(_e, "trail")
	_exports["drawDirt"] = _S.read(_e, "drawDirt")
	_exports["crater"] = _S.read(_e, "crater")
	_exports["dome"] = _S.read(_e, "dome")
	_exports["lobe"] = _S.read(_e, "lobe")
	_S.define(_e, "Plume", _S.class_value("Plume", _S.function_value(_e, "_f26"), {"shape": _S.function_value(_e, "_f28"), "hot": _S.function_value(_e, "_f29"), "ember": _S.function_value(_e, "_f30"), "lobesAt": _S.function_value(_e, "_f31"), "update": _S.function_value(_e, "_f33"), "draw": _S.function_value(_e, "_f34")}, {}, {}, null))
	_exports["Plume"] = _S.read(_e, "Plume")
	_S.define(_e, "Column", _S.class_value("Column", _S.function_value(_e, "_f35"), {"spawn": _S.function_value(_e, "_f36"), "update": _S.function_value(_e, "_f37"), "draw": _S.function_value(_e, "_f38")}, {}, {}, null))
	_exports["Column"] = _S.read(_e, "Column")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_c_b0 = _S.arg(_args,0)
	_n_c_b0 = _S.call_value(_n_hex,[_n_c_b0])
	return {"light":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.35),_n_WHITE,0.08),"body":_n_c_b0,"shade":_S.ColorFX.scale_color(_n_c_b0,0.64),"dust":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.2),_S.ColorFX.rgb(150,140,150),0.3)}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_FR_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_S.named_value(_n_q_b1,"life"))/_S.named_value(_n_q_b1,"max"))
	var _n_age_b4 = (1 - _n_k_b3)
	var _n_n_b5 = _S.prop(_n_FR_b2,"length")
	var _n_x_b6 = _S.named_value(_n_q_b1,"x")
	var _n_y_b7 = _S.named_value(_n_q_b1,"y")
	var _n_heat_b8 = minf(0.999,(pow(_n_age_b4,0.62) + (fmod(_S.named_value(_n_q_b1,"seed"),1) * 0.1)))
	var _n_idx_b9 = minf((_n_n_b5 - 2),floori((_n_heat_b8 * (_n_n_b5 - 1))))
	var _n_r_b10 = ((_S.named_value(_n_q_b1,"size") * (0.55 + (0.45 * minf(1,(_n_age_b4 * 7))))) * (1 - (_n_age_b4 * 0.55)))
	var _n_c_b11 = _S.index_value(_n_FR_b2,_n_idx_b9)
	if _S.truth((_n_idx_b9 >= (_n_n_b5 - 2))):
		return _S.invoke(_n_p_b0,"disc",[_n_x_b6, _n_y_b7, _n_r_b10, _n_c_b11, (minf(1,(_n_k_b3 * 3)) * 0.85)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b6, _n_y_b7, _n_r_b10, _S.index_value(_n_FR_b2,minf((_n_n_b5 - 1),(_n_idx_b9 + (3 if _S.truth((_n_idx_b9 <= 2)) else 2))))])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b6 - (_n_r_b10 * 0.16)), (_n_y_b7 - (_n_r_b10 * 0.22)), (_n_r_b10 * 0.78), _n_c_b11])
	if _S.truth((_n_r_b10 > 1.6)):
		_S.invoke(_n_p_b0,"circle",[_n_x_b6, (_n_y_b7 - (_n_r_b10 * 0.9)), (_n_r_b10 * 0.42), _n_c_b11])
	if _S.truth(((_n_r_b10 > 1.8) if _S.truth((_n_idx_b9 <= 3)) else (_n_idx_b9 <= 3))):
		_S.invoke(_n_p_b0,"circle",[(_n_x_b6 - (_n_r_b10 * 0.28)), (_n_y_b7 - (_n_r_b10 * 0.34)), (_n_r_b10 * 0.36), _S.index_value(_n_FR_b2,maxf(0,(_n_idx_b9 - 1)))])
	if _S.truth((_n_idx_b9 < 6)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, ((_n_r_b10 * 2.4) + 2), _n_c_b11, (0.18 * _n_k_b3)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_PF = _S.read(_parent,"PF")
	var _n_fireBall = _S.read(_parent,"fireBall")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ps_b1 = _S.arg(_args,1)
	var _n_layer_b2 = _S.arg(_args,2)
	var _n_FR_b3 = _S.arg(_args,3)
	var _n_all_b4 = _S.named_value(_n_ps_b1,"list")
	var _n_fires_b5 = []
	var _n_rest_b6 = []
	for _iter_0 in _S.array(_n_all_b4):
		var _n_q_b8 = _iter_0
		_S.invoke((_n_fires_b5 if _S.truth(_S.binary("===",_S.named_value(_n_q_b8,"k"),_S.named_value(_n_P,"FIRE"))) else _n_rest_b6),"push",[_n_q_b8])
	var _n_back_b7 = _S.binary("===",_n_layer_b2,"back")
	if _S.truth(not _S.truth(_n_back_b7)):
		for _iter_1 in _S.array(_n_fires_b5):
			var _n_q_b9 = _iter_1
			if _S.truth((not _S.truth(_S.binary("&",_S.named_value(_n_q_b9,"flag"),_S.named_value(_n_PF,"BACK"))) if _S.truth((_S.named_value(_n_q_b9,"delay") <= 0)) else (_S.named_value(_n_q_b9,"delay") <= 0))):
				_S.call_value(_n_fireBall,[_n_p_b0, _n_q_b9, _n_FR_b3])
	_S.set_prop(_n_ps_b1,"list",_n_rest_b6,"=")
	_S.invoke(_n_ps_b1,"draw",[_n_p_b0, _n_layer_b2])
	_S.set_prop(_n_ps_b1,"list",_n_all_b4,"=")
	if _S.truth(_n_back_b7):
		for _iter_2 in _S.array(_n_fires_b5):
			var _n_q_b10 = _iter_2
			if _S.truth((_S.binary("&",_S.named_value(_n_q_b10,"flag"),_S.named_value(_n_PF,"BACK")) if _S.truth((_S.named_value(_n_q_b10,"delay") <= 0)) else (_S.named_value(_n_q_b10,"delay") <= 0))):
				_S.call_value(_n_fireBall,[_n_p_b0, _n_q_b10, _n_FR_b3])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_LIFTS = _S.read(_parent,"LIFTS")
	var _n_ps_b0 = _S.arg(_args,0)
	var _n_dt_b1 = _S.arg(_args,1)
	var _object_0 = _S.arg(_args,2)
	var _n_x_b2 = _S.coalesce(_S.named_value(_object_0,"x"),func():return 0)
	var _n_top_b3 = _S.coalesce(_S.named_value(_object_0,"top"),func():return (-INF))
	var _n_w_b4 = _S.coalesce(_S.named_value(_object_0,"w"),func():return 12)
	var _n_up_b5 = _S.coalesce(_S.named_value(_object_0,"up"),func():return 150)
	var _n_squeeze_b6 = _S.coalesce(_S.named_value(_object_0,"squeeze"),func():return 4)
	var _n_pull_b7 = _S.coalesce(_S.named_value(_object_0,"pull"),func():return 0)
	var _n_low_b8 = _S.coalesce(_S.named_value(_object_0,"low"),func():return 10)
	var _n_reach_b9 = _S.coalesce(_S.named_value(_object_0,"reach"),func():return 100)
	var _n_k_b10 = _S.coalesce(_S.named_value(_object_0,"k"),func():return 1)
	if _S.truth((_n_k_b10 <= 0)):
		return null
	for _iter_1 in _S.array(_S.named_value(_n_ps_b0,"list")):
		var _n_q_b11 = _iter_1
		if _S.truth(_S.logical("||",((_S.named_value(_n_q_b11,"delay") > 0) if _S.truth((_S.named_value(_n_q_b11,"delay") > 0)) else not _S.truth(_S.invoke(_n_LIFTS,"has",[_S.named_value(_n_q_b11,"k")]))),func():return (_S.named_value(_n_q_b11,"y") < _n_top_b3))):
			continue
		var _n_dx_b12 = (_S.named_value(_n_q_b11,"x") - _n_x_b2)
		var _n_ax_b13 = absf(_n_dx_b12)
		var _n_u_b14 = (float(_n_ax_b13)/_n_w_b4)
		if _S.truth((_n_u_b14 < 1)):
			var _n_f_b15 = ((1 - (_n_u_b14 * _n_u_b14)) * _n_k_b10)
			_S.set_prop(_n_q_b11,"vy",((_n_up_b5 * _n_f_b15) * _n_dt_b1),"-=")
			_S.set_prop(_n_q_b11,"vx",(((_n_dx_b12 * _n_squeeze_b6) * _n_f_b15) * _n_dt_b1),"-=")
		if _S.truth(((_n_ax_b13 < _n_reach_b9) if _S.truth(((_n_ax_b13 > (_n_w_b4 * 0.4)) if _S.truth(((_S.named_value(_n_q_b11,"y") > (-_n_low_b8)) if _S.truth(_n_pull_b7) else _n_pull_b7)) else ((_S.named_value(_n_q_b11,"y") > (-_n_low_b8)) if _S.truth(_n_pull_b7) else _n_pull_b7))) else ((_n_ax_b13 > (_n_w_b4 * 0.4)) if _S.truth(((_S.named_value(_n_q_b11,"y") > (-_n_low_b8)) if _S.truth(_n_pull_b7) else _n_pull_b7)) else ((_S.named_value(_n_q_b11,"y") > (-_n_low_b8)) if _S.truth(_n_pull_b7) else _n_pull_b7)))):
			_S.set_prop(_n_q_b11,"vx",((((signf(_n_dx_b12) * _n_pull_b7) * _n_k_b10) * (1 - (float(_n_ax_b13)/_n_reach_b9))) * _n_dt_b1),"-=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ps_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _n_L_b5 = _S.named_value(_n_ps_b0,"list")
	if true:
		var _n_i_b6 = (_S.prop(_n_L_b5,"length") - 1)
		while _S.truth((_n_i_b6 >= 0)):
			var _n_q_b7 = _S.index_value(_n_L_b5,_n_i_b6)
			if _S.truth(((((_S.named_value(_n_q_b7,"x") < _n_x0_b1) if _S.truth((_S.named_value(_n_q_b7,"x") < _n_x0_b1)) else (_S.named_value(_n_q_b7,"x") > _n_x1_b3)) if _S.truth(((_S.named_value(_n_q_b7,"x") < _n_x0_b1) if _S.truth((_S.named_value(_n_q_b7,"x") < _n_x0_b1)) else (_S.named_value(_n_q_b7,"x") > _n_x1_b3))) else (_S.named_value(_n_q_b7,"y") < _n_y0_b2)) if _S.truth((((_S.named_value(_n_q_b7,"x") < _n_x0_b1) if _S.truth((_S.named_value(_n_q_b7,"x") < _n_x0_b1)) else (_S.named_value(_n_q_b7,"x") > _n_x1_b3)) if _S.truth(((_S.named_value(_n_q_b7,"x") < _n_x0_b1) if _S.truth((_S.named_value(_n_q_b7,"x") < _n_x0_b1)) else (_S.named_value(_n_q_b7,"x") > _n_x1_b3))) else (_S.named_value(_n_q_b7,"y") < _n_y0_b2))) else (_S.named_value(_n_q_b7,"y") > _n_y1_b4))):
				_S.invoke(_n_L_b5,"splice",[_n_i_b6, 1])
			_n_i_b6 -= 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_SOFT = _S.read(_parent,"SOFT")
	var _n_ps_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_w_b3 = _S.coalesce(_S.arg(_args,3),func():return 30)
	var _n_y1_b4 = _S.coalesce(_S.arg(_args,4),func():return INF)
	var _n_L_b5 = _S.named_value(_n_ps_b0,"list")
	if true:
		var _n_i_b6 = (_S.prop(_n_L_b5,"length") - 1)
		while _S.truth((_n_i_b6 >= 0)):
			var _n_q_b7 = _S.index_value(_n_L_b5,_n_i_b6)
			if _S.truth(not _S.truth(_S.invoke(_n_SOFT,"has",[_S.named_value(_n_q_b7,"k")]))):
				_n_i_b6 -= 1.0
				continue
			var _n_r_b8 = (_S.named_value(_n_q_b7,"size") * 1.65)
			var _n_e_b9 = minf((float((minf((_S.named_value(_n_q_b7,"x") - _n_x0_b1),(_n_x1_b2 - _S.named_value(_n_q_b7,"x"))) - _n_r_b8))/_n_w_b3),(float(((_n_y1_b4 - _S.named_value(_n_q_b7,"y")) - _n_r_b8))/6))
			if _S.truth((_n_e_b9 <= 0)):
				_S.invoke(_n_L_b5,"splice",[_n_i_b6, 1])
			else:
				if _S.truth((_n_e_b9 < 1)):
					_S.set_prop(_n_q_b7,"life",minf(_S.named_value(_n_q_b7,"life"),((_S.named_value(_n_q_b7,"max") * 0.42) * _n_e_b9)),"=")
			_n_i_b6 -= 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth((((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_rx_b3 < 1)) if _S.truth(((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_rx_b3 < 1))) else (_n_ry_b4 < 0.5))):
		return null
	_S.invoke(_n_p_b0,"shade",[(_n_x_b1 - _n_rx_b3), (_n_y_b2 - _n_ry_b4), (_n_x_b1 + _n_rx_b3), (_n_y_b2 + _n_ry_b4), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"rx":_n_rx_b3,"y":_n_y_b2,"ry":_n_ry_b4,"c":_n_c_b5,"k":_n_k_b6,"this":_this}),"_f7")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_px_b0 - _n_x))/_n_rx)
	var _n_dy_b4 = (float((_n_py_b1 - _n_y))/_n_ry)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 >= 1)):
		return null
	var _n_f_b6 = (1 - sqrt(_n_d_b5))
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",((_n_f_b6 * _n_f_b6) * _n_k),"=")
	return null

static func _f7_shader(_parent):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	return func(_cb0=null,_cb1=null,_cb2=null,_cb3=null):
		var _n_px_b0 = _cb0
		var _n_py_b1 = _cb1
		var _n_out_b2 = _cb2
		var _n_dx_b3 = (float((_n_px_b0 - _n_x))/_n_rx)
		var _n_dy_b4 = (float((_n_py_b1 - _n_y))/_n_ry)
		var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
		if _S.truth((_n_d_b5 >= 1)):
			return null
		var _n_f_b6 = (1 - sqrt(_n_d_b5))
		_S.set_prop(_n_out_b2,"l",_n_c,"=")
		_S.set_prop(_n_out_b2,"k",((_n_f_b6 * _n_f_b6) * _n_k),"=")
		return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	if _S.truth(((_n_rx_b3 < 0.5) if _S.truth((_n_rx_b3 < 0.5)) else (_n_ry_b4 < 0.5))):
		return null
	var _n_fc_b7 = _S.binary("===",_S.unary("typeof",_n_c_b5),"function")
	var _n_fa_b8 = _S.binary("===",_S.unary("typeof",_n_a_b6),"function")
	_S.invoke(_n_p_b0,"each",[(_n_x_b1 - _n_rx_b3), (_n_y_b2 - _n_ry_b4), (_n_x_b1 + _n_rx_b3), (_n_y_b2 + _n_ry_b4), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"rx":_n_rx_b3,"y":_n_y_b2,"ry":_n_ry_b4,"p":_n_p_b0,"fc":_n_fc_b7,"c":_n_c_b5,"fa":_n_fa_b8,"a":_n_a_b6,"this":_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_p = _S.read(_parent,"p")
	var _n_c = _S.read(_parent,"c")
	var _n_fc = _S.read(_parent,"fc")
	var _n_a = _S.read(_parent,"a")
	var _n_fa = _S.read(_parent,"fa")
	var _n_lx_b0 = _S.arg(_args,0)
	var _n_ly_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_dx_b4 = (float((_n_lx_b0 - _n_x))/_n_rx)
	var _n_dy_b5 = (float((_n_ly_b1 - _n_y))/_n_ry)
	var _n_d2_b6 = ((_n_dx_b4 * _n_dx_b4) + (_n_dy_b5 * _n_dy_b5))
	if _S.truth((_n_d2_b6 > 1)):
		return null
	var _n_d_b7 = sqrt(_n_d2_b6)
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.call_value(_n_c,[_n_d_b7]) if _S.truth(_n_fc) else _n_c), (_S.call_value(_n_a,[_n_d_b7]) if _S.truth(_n_fa) else _n_a)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_HR_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_rx0_b3 = _S.arg(_args,3)
	var _n_cool_b4 = _S.arg(_args,4)
	var _n_fade_b5 = _S.arg(_args,5)
	var _n_rows_b6 = _S.coalesce(_S.arg(_args,6),func():return 3)
	if _S.truth((_n_fade_b5 <= 0)):
		return null
	var _n_rx_b7 = (_n_rx0_b3 * minf(1,(float(_n_t_b2)/0.08)))
	var _n_ry_b8 = (_n_rows_b6 + 1.5)
	var _n_n_b9 = _S.prop(_n_HR_b1,"length")
	if true:
		var _n_y_b10 = 0
		while _S.truth((_n_y_b10 < _n_rows_b6)):
			if true:
				var _n_x_b11 = floori((-_n_rx_b7))
				while _S.truth((_n_x_b11 <= ceili(_n_rx_b7))):
					var _n_dx_b12 = (float((_n_x_b11 + 0.5))/_n_rx_b7)
					var _n_dy_b13 = (float((_n_y_b10 + 0.5))/_n_ry_b8)
					var _n_d_b14 = sqrt(((_n_dx_b12 * _n_dx_b12) + (_n_dy_b13 * _n_dy_b13)))
					if _S.truth((_n_d_b14 > 1)):
						_n_x_b11 += 1.0
						continue
					var _n_k_b15 = _S.MathFX.rand([((_n_x_b11 * 31) + _n_y_b10),3])
					var _n_T_b16 = ((pow(clampf((1 - (float(_n_t_b2)/_n_cool_b4)),0.0,1.0),1.4) * (1.25 - _n_d_b14)) - (_n_k_b15 * 0.35))
					var _n_crack_b17 = (((pow(clampf((1 - (float(_n_t_b2)/(_n_cool_b4 * 2))),0.0,1.0),1.2) * (1.15 - _n_d_b14)) * 0.8) if _S.truth(((_n_d_b14 < 0.85) if _S.truth((_n_k_b15 > 0.88)) else (_n_k_b15 > 0.88))) else 0)
					var _n_H_b18 = maxf(_n_T_b16,_n_crack_b17)
					if _S.truth((_n_H_b18 > 0.06)):
						var _n_c_b19 = _S.index_value(_n_HR_b1,minf((_n_n_b9 - 1),floori(((1 - minf(1,_n_H_b18)) * (_n_n_b9 - 1)))))
						_S.invoke(_n_p_b0,"dot",[_n_x_b11, _n_y_b10, _n_c_b19, _n_fade_b5])
						if _S.truth((_S.binary("===",_S.binary("&",_n_x_b11,3),0) if _S.truth(_S.binary("===",_S.binary("&",_n_x_b11,3),0)) else (_n_crack_b17 > _n_T_b16))):
							_S.invoke(_n_p_b0,"glow",[(_n_x_b11 + 0.5), _n_y_b10, 6, _n_c_b19, ((0.18 * _n_H_b18) * _n_fade_b5)])
					else:
						_S.invoke(_n_p_b0,"dot",[_n_x_b11, _n_y_b10, (_n_SOOT if _S.truth((_n_d_b14 < 0.5)) else _n_SOOT2), ((1 if _S.truth((_n_d_b14 < (0.95 - (_n_k_b15 * 0.3)))) else (1 - _n_d_b14)) * _n_fade_b5)])
					_n_x_b11 += 1.0
			_n_y_b10 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_FR_b3 = _S.arg(_args,3)
	var _n_r_b4 = (0.6 + (_S.named_value(_n_b_b1,"s") * 0.75))
	var _n_fade_b5 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_lx_b6 = ((cos(_S.named_value(_n_b_b1,"a")) * _n_r_b4) * 0.4)
	var _n_ly_b7 = ((sin(_S.named_value(_n_b_b1,"a")) * _n_r_b4) * 0.4)
	var _n_heat_b8 = (_S.named_value(_n_b_b1,"heat") if _S.named_value(_n_b_b1,"heat")!=null else 0)
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b4) - 1), ((_S.named_value(_n_b_b1,"y") - _n_r_b4) - 1), ((_S.named_value(_n_b_b1,"x") + _n_r_b4) + 1), ((_S.named_value(_n_b_b1,"y") + _n_r_b4) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"r":_n_r_b4,"fade":_n_fade_b5,"lx":_n_lx_b6,"ly":_n_ly_b7,"heat":_n_heat_b8,"FR":_n_FR_b3,"st":_n_st_b2,"this":_this}),"_f12")])
	if _S.truth((_n_heat_b8 > 0.05)):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b1,"x"), _S.named_value(_n_b_b1,"y"), ((_n_r_b4 * 2) + 3), _S.index_value(_n_FR_b3,3), ((0.32 * _n_heat_b8) * _n_fade_b5)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_fade = _S.read(_parent,"fade")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_heat = _S.read(_parent,"heat")
	var _n_FR = _S.read(_parent,"FR")
	var _n_st = _S.read(_parent,"st")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.15), _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_r + 0.9))):
		return null
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	if _S.truth((_n_d_b5 > _n_r)):
		return _n_OUTLINE
	var _n_lit_b6 = ((_n_dx_b3 * _n_lx) + (_n_dy_b4 * _n_ly))
	if _S.truth((_n_heat > 0.08)):
		var _n_g_b7 = ((_n_heat * (1.1 - (float(_n_d_b5)/(_n_r + 0.5)))) + ((_n_heat * 0.45) if _S.truth((_n_lit_b6 > 0.3)) else 0))
		if _S.truth((_n_g_b7 > 0.5)):
			return _S.index_value(_n_FR,(1 if _S.truth((_n_g_b7 > 1)) else (2 if _S.truth((_n_g_b7 > 0.8)) else (3 if _S.truth((_n_g_b7 > 0.62)) else 4))))
		if _S.truth((_n_g_b7 > 0.32)):
			return _S.index_value(_n_FR,5)
	return (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b6 < (-0.4))) else (_S.named_value(_n_st,"shade") if _S.truth((_n_lit_b6 > 0.6)) else _S.named_value(_n_st,"body")))
	return null

static func _f12_shader(_parent):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_fade = _S.read(_parent,"fade")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_heat = _S.read(_parent,"heat")
	var _n_FR = _S.read(_parent,"FR")
	var _n_st = _S.read(_parent,"st")
	return func(_cb0=null,_cb1=null,_cb2=null,_cb3=null):
		var _n_x_b0 = _cb0
		var _n_y_b1 = _cb1
		var _n_out_b2 = _cb2
		var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
		var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
		var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.15), _n_dy_b4])
		if _S.truth((_n_d_b5 > (_n_r + 0.9))):
			return null
		_S.set_prop(_n_out_b2,"a",_n_fade,"=")
		if _S.truth((_n_d_b5 > _n_r)):
			return _n_OUTLINE
		var _n_lit_b6 = ((_n_dx_b3 * _n_lx) + (_n_dy_b4 * _n_ly))
		if _S.truth((_n_heat > 0.08)):
			var _n_g_b7 = ((_n_heat * (1.1 - (float(_n_d_b5)/(_n_r + 0.5)))) + ((_n_heat * 0.45) if _S.truth((_n_lit_b6 > 0.3)) else 0))
			if _S.truth((_n_g_b7 > 0.5)):
				return _S.index_value(_n_FR,(1 if _S.truth((_n_g_b7 > 1)) else (2 if _S.truth((_n_g_b7 > 0.8)) else (3 if _S.truth((_n_g_b7 > 0.62)) else 4))))
			if _S.truth((_n_g_b7 > 0.32)):
				return _S.index_value(_n_FR,5)
		return (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b6 < (-0.4))) else (_S.named_value(_n_st,"shade") if _S.truth((_n_lit_b6 > 0.6)) else _S.named_value(_n_st,"body")))
		return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	var _n_box_b7 = _S.coalesce(_S.arg(_args,7),func():return [(-INF), (-INF), INF, INF])
	if _S.truth(((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_w_b4 < 1))):
		return null
	_S.invoke(_n_p_b0,"shade",[maxf(_S.index_value(_n_box_b7,0),((_n_x_b1 - _n_R_b3) - _n_w_b4)), maxf(_S.index_value(_n_box_b7,1),((_n_y_b2 - _n_R_b3) - _n_w_b4)), minf(_S.index_value(_n_box_b7,2),((_n_x_b1 + _n_R_b3) + _n_w_b4)), minf(_S.index_value(_n_box_b7,3),(_n_y_b2 + 0.5)), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"R":_n_R_b3,"w":_n_w_b4,"c":_n_c_b5,"k":_n_k_b6,"this":_this}),"_f14")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_R = _S.read(_parent,"R")
	var _n_w = _S.read(_parent,"w")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = (float(absf((_S.Bridge.hypot([(_n_px_b0 - _n_x), (_n_py_b1 - _n_y)]) - _n_R)))/_n_w)
	if _S.truth((_n_d_b3 >= 1)):
		return null
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",(((1 - _n_d_b3) * (1 - _n_d_b3)) * _n_k),"=")
	return null

static func _f14_shader(_parent):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_R = _S.read(_parent,"R")
	var _n_w = _S.read(_parent,"w")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	return func(_cb0=null,_cb1=null,_cb2=null,_cb3=null):
		var _n_px_b0 = _cb0
		var _n_py_b1 = _cb1
		var _n_out_b2 = _cb2
		var _n_d_b3 = (float(absf((_S.Bridge.hypot([(_n_px_b0 - _n_x), (_n_py_b1 - _n_y)]) - _n_R)))/_n_w)
		if _S.truth((_n_d_b3 >= 1)):
			return null
		_S.set_prop(_n_out_b2,"l",_n_c,"=")
		_S.set_prop(_n_out_b2,"k",(((1 - _n_d_b3) * (1 - _n_d_b3)) * _n_k),"=")
		return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_FR_b3 = _S.arg(_args,3)
	var _n_SM_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.coalesce(_S.arg(_args,5),func():return 0.5)
	var _n_w_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_heat_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_lx_b8 = NAN
	var _n_ly_b9 = NAN
	if true:
		var _n_i_b10 = (_S.prop(_n_pts_b1,"length") - 1)
		while _S.truth((_n_i_b10 >= 0)):
			var _n_q_b11 = _S.index_value(_n_pts_b1,_n_i_b10)
			var _n_age_b12 = (float((_n_t_b2 - _S.named_value(_n_q_b11,"t")))/_n_life_b5)
			if _S.truth((_n_age_b12 >= 1)):
				break
			if _S.truth((_S.Bridge.hypot([(_S.named_value(_n_q_b11,"x") - _n_lx_b8), (_S.named_value(_n_q_b11,"y") - _n_ly_b9)]) < 1.6)):
				_n_i_b10 -= 1.0
				continue
			_n_lx_b8 = _S.named_value(_n_q_b11,"x")
			_n_ly_b9 = _S.named_value(_n_q_b11,"y")
			var _n_r_b13 = (_n_w_b6 * (0.7 + (_n_age_b12 * 2.6)))
			if _S.truth((_n_age_b12 < (0.12 * _n_heat_b7))):
				_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_q_b11,"x"), (_S.named_value(_n_q_b11,"y") - (_n_age_b12 * 6)), (_n_r_b13 * 0.8), _S.index_value(_n_FR_b3,(3 if _S.truth((_n_age_b12 < 0.05)) else 5))])
			else:
				_S.invoke(_n_p_b0,"disc",[_S.named_value(_n_q_b11,"x"), (_S.named_value(_n_q_b11,"y") - (_n_age_b12 * 6)), _n_r_b13, _S.index_value(_n_SM_b4,minf((_S.prop(_n_SM_b4,"length") - 1),(1 + floori((_n_age_b12 * 3))))), (0.55 * (1 - _n_age_b12))])
			_n_i_b10 -= 1.0
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ps_b1 = _S.arg(_args,1)
	var _n_layer_b2 = _S.arg(_args,2)
	var _n_all_b3 = _S.named_value(_n_ps_b1,"list")
	var _n_grit_b4 = []
	var _n_rest_b5 = []
	for _iter_0 in _S.array(_n_all_b3):
		var _n_q_b6 = _iter_0
		_S.invoke((_n_grit_b4 if _S.truth(_S.binary("===",_S.named_value(_n_q_b6,"k"),_S.named_value(_n_P,"GRIT"))) else _n_rest_b5),"push",[_n_q_b6])
	_S.set_prop(_n_ps_b1,"list",_n_rest_b5,"=")
	_S.invoke(_n_ps_b1,"draw",[_n_p_b0, _n_layer_b2])
	_S.set_prop(_n_ps_b1,"list",_n_all_b3,"=")
	if _S.truth(_S.binary("===",_n_layer_b2,"back")):
		return null
	for _iter_1 in _S.array(_n_grit_b4):
		var _n_q_b7 = _iter_1
		if _S.truth((_S.named_value(_n_q_b7,"delay") > 0)):
			continue
		var _n_k_b8 = (float(_S.named_value(_n_q_b7,"life"))/_S.named_value(_n_q_b7,"max"))
		var _n_sp_b9 = _S.Bridge.hypot([_S.named_value(_n_q_b7,"vx"), _S.named_value(_n_q_b7,"vy")])
		if _S.truth((((_n_k_b8 * 4) < 0.5) if _S.truth((_n_k_b8 < 0.25)) else (_n_k_b8 < 0.25))):
			continue
		if _S.truth((_n_sp_b9 > 140)):
			var _n_L_b10 = minf(5,(_n_sp_b9 * 0.012))
			var _n_ux_b11 = (float(_S.named_value(_n_q_b7,"vx"))/_n_sp_b9)
			var _n_uy_b12 = (float(_S.named_value(_n_q_b7,"vy"))/_n_sp_b9)
			_S.invoke(_n_p_b0,"line",[(_S.named_value(_n_q_b7,"x") - (_n_ux_b11 * _n_L_b10)), (_S.named_value(_n_q_b7,"y") - (_n_uy_b12 * _n_L_b10)), _S.named_value(_n_q_b7,"x"), _S.named_value(_n_q_b7,"y"), _S.function_value(_S.capture(_parent,{"q":_n_q_b7,"this":_this}),"_f17")])
		else:
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b7,"x"), _S.named_value(_n_q_b7,"y"), _S.named_value(_n_q_b7,"col")])
			if _S.truth((_S.named_value(_n_q_b7,"size") >= 2)):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b7,"x") + 1), _S.named_value(_n_q_b7,"y"), _S.named_value(_n_q_b7,"col")])
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b7,"x"), (_S.named_value(_n_q_b7,"y") + 1), _S.ColorFX.scale_color(_S.named_value(_n_q_b7,"col"),0.8)])
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b7,"x") + 1), (_S.named_value(_n_q_b7,"y") + 1), _S.ColorFX.scale_color(_S.named_value(_n_q_b7,"col"),0.7)])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.ColorFX.scale_color(_S.named_value(_n_q,"col"),0.7) if _S.truth((_n_u_b0 < 0.5)) else _S.named_value(_n_q,"col"))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_E_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	if _S.truth(((_n_k_b4 <= 0) if _S.truth((_n_k_b4 <= 0)) else (_n_a_b5 <= 0))):
		return null
	var _n_n_b6 = _S.prop(_n_E_b1,"length")
	var _n_rx_b7 = (_n_r_b3 * _n_k_b4)
	var _n_ry_b8 = maxf(1.5,((_n_r_b3 * 0.17) * _n_k_b4))
	if true:
		var _n_py_b9 = (-1)
		while _S.truth((_n_py_b9 <= (ceili(_n_ry_b8) + 1))):
			if true:
				var _n_px_b10 = floori(((-_n_rx_b7) - 1))
				while _S.truth((_n_px_b10 <= ceili((_n_rx_b7 + 1)))):
					var _n_dx_b11 = (float((_n_px_b10 + 0.5))/_n_rx_b7)
					var _n_dy_b12 = (float(((_n_py_b9 + 0.5) - (_n_ry_b8 * 0.35)))/_n_ry_b8)
					var _n_d_b13 = sqrt(((_n_dx_b11 * _n_dx_b11) + (_n_dy_b12 * _n_dy_b12)))
					if _S.truth((_n_d_b13 > 1.08)):
						_n_px_b10 += 1.0
						continue
					var _n_c_b14 = ((_S.index_value(_n_E_b1,(_n_n_b6 - 2)) if _S.truth((_n_dy_b12 < 0)) else _S.index_value(_n_E_b1,2)) if _S.truth((_n_d_b13 > 0.92)) else (_S.index_value(_n_E_b1,0) if _S.truth((_n_dy_b12 < (-0.2))) else (_S.index_value(_n_E_b1,1) if _S.truth((_n_dy_b12 < 0.35)) else _S.index_value(_n_E_b1,2))))
					_S.invoke(_n_p_b0,"dot",[(_n_x_b2 + _n_px_b10), _n_py_b9, _n_c_b14, _n_a_b5])
					_n_px_b10 += 1.0
			_n_py_b9 += 1.0
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b15 = _iter_0
		if true:
			var _n_i_b16 = 0
			while _S.truth((_n_i_b16 < 9)):
				var _n_u_b17 = (float(_n_i_b16)/8)
				var _n_h_b18 = floori((((sin((PI * _n_u_b17)) * 2.2) * _n_k_b4) + ((1 if _S.truth((_S.MathFX.rand([_n_i_b16,(3 if _S.truth((_n_s_b15 > 0)) else 4)]) < 0.4)) else 0) * _n_k_b4))+0.5)
				var _n_hx_b19 = (_n_x_b2 + (_n_s_b15 * ((_n_rx_b7 * 0.82) + ((_n_u_b17 * _n_r_b3) * 0.55))))
				if true:
					var _n_j_b20 = 0
					while _S.truth((_n_j_b20 <= _n_h_b18)):
						_S.invoke(_n_p_b0,"dot",[_n_hx_b19, (-_n_j_b20), (_S.index_value(_n_E_b1,(_n_n_b6 - 2)) if _S.truth(_S.binary("===",_n_j_b20,_n_h_b18)) else (_S.index_value(_n_E_b1,3) if _S.truth(_S.binary("===",_n_j_b20,(_n_h_b18 - 1))) else _S.index_value(_n_E_b1,2))), _n_a_b5])
						_n_j_b20 += 1.0
				_n_i_b16 += 1.0
	if true:
		var _n_i_b21 = 0
		while _S.truth((_n_i_b21 < 26)):
			var _n_s_b22 = ((-1) if _S.truth((_S.MathFX.rand([_n_i_b21,7]) < 0.5)) else 1)
			var _n_d_b23 = (_n_rx_b7 * (1.05 + (_S.MathFX.rand([_n_i_b21,8]) * 1.4)))
			var _n_y_b24 = (floori((_S.MathFX.rand([_n_i_b21,9]) * 3)+0.5) - 1)
			if _S.truth((_S.MathFX.rand([_n_i_b21,10]) < _n_k_b4)):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b2 + (_n_s_b22 * _n_d_b23)), _n_y_b24, (_S.index_value(_n_E_b1,3) if _S.truth((_S.MathFX.rand([_n_i_b21,11]) < 0.5)) else _S.index_value(_n_E_b1,2)), _n_a_b5])
			_n_i_b21 += 1.0
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_e_b5 = (float(1.4)/_n_r_b3)
	_S.invoke(_n_p_b0,"shade",[((_n_x_b2 - _n_r_b3) - 1.5), ((-_n_r_b3) - 1.5), ((_n_x_b2 + _n_r_b3) + 1.5), 0.5, _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"r":_n_r_b3,"e":_n_e_b5,"F":_n_F_b1,"k":_n_k_b4,"this":_this}),"_f20")])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_r = _S.read(_parent,"r")
	var _n_e = _S.read(_parent,"e")
	var _n_F = _S.read(_parent,"F")
	var _n_k = _S.read(_parent,"k")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_d_b2 = (float(_S.Bridge.hypot([(_n_px_b0 - _n_x), _n_py_b1]))/_n_r)
	if _S.truth((_n_d_b2 > (1 + _n_e))):
		return null
	return (_S.index_value(_n_F,2) if _S.truth((_n_d_b2 > 1)) else ((_S.index_value(_n_F,6) if _S.truth((_n_k > 0.45)) else _S.index_value(_n_F,5)) if _S.truth((_n_d_b2 > 0.8)) else ((_n_WHITE if _S.truth((_n_k > 0.45)) else _S.index_value(_n_F,6)) if _S.truth((_n_d_b2 > 0.5)) else (_n_WHITE if _S.truth((_n_k > 0.2)) else _S.index_value(_n_F,6)))))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_FR_b4 = _S.arg(_args,4)
	var _n_SM_b5 = _S.arg(_args,5)
	var _n_fire_b6 = _S.arg(_args,6)
	var _n_glow_b7 = _S.arg(_args,7)
	var _n_a_b8 = _S.arg(_args,8)
	var _n_z_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	var _n_dark_b10 = _S.coalesce(_S.arg(_args,10),func():return 0)
	var _n_style_b11 = _S.coalesce(_S.arg(_args,11),func():return 0)
	if _S.truth(((_n_r_b3 < 0.7) if _S.truth((_n_r_b3 < 0.7)) else (_n_a_b8 <= 0.01))):
		return null
	var _n_n_b12 = _S.prop(_n_FR_b4,"length")
	var _n_m_b13 = _S.prop(_n_SM_b5,"length")
	var _n_back_b14 = (1 if _S.truth((_n_z_b9 < (-0.35))) else 0)
	var _n_rim_b15 = (1 - minf(0.35,(float(1.6)/_n_r_b3)))
	var _n_seam_b16 = (1 - minf(0.3,(float(1.3)/_n_r_b3)))
	var _n_D_b17 = _S.function_value(_S.capture(_parent,{"SM":_n_SM_b5,"m":_n_m_b13,"back":_n_back_b14,"dark":_n_dark_b10,"this":_this}),"_f22")
	var _n_soft_b18 = (0.55 + (0.4 * (1 - minf(1,_n_a_b8))))
	var _n_px_b19 = _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"r":_n_r_b3,"y":_n_y_b2,"fire":_n_fire_b6,"n":_n_n_b12,"seam":_n_seam_b16,"FR":_n_FR_b4,"style":_n_style_b11,"D":_n_D_b17,"glow":_n_glow_b7,"p":_n_p_b0,"rim":_n_rim_b15,"a":_n_a_b8,"soft":_n_soft_b18,"this":_this}),"_f23")
	if _S.truth((_S.binary("!==",_S.named_value(_n_p_b0,"sn"),0) if _S.truth(_S.binary("!==",_S.named_value(_n_p_b0,"sn"),0)) else _S.binary("!==",_S.named_value(_n_p_b0,"cs"),1))):
		return _S.invoke(_n_p_b0,"each",[(_n_x_b1 - _n_r_b3), (_n_y_b2 - _n_r_b3), (_n_x_b1 + _n_r_b3), (_n_y_b2 + _n_r_b3), _n_px_b19])
	var _n_ax_b20 = (_S.named_value(_n_p_b0,"tx") + ((_n_x_b1 - _n_r_b3) * _S.named_value(_n_p_b0,"fx")))
	var _n_bx_b21 = (_S.named_value(_n_p_b0,"tx") + ((_n_x_b1 + _n_r_b3) * _S.named_value(_n_p_b0,"fx")))
	var _n_sx0_b22 = maxf(_S.named_value(_n_p_b0,"ox"),floori(minf(_n_ax_b20,_n_bx_b21)))
	var _n_sx1_b23 = minf(((_S.named_value(_n_p_b0,"ox") + _S.named_value(_n_p_b0,"w")) - 1),ceili(maxf(_n_ax_b20,_n_bx_b21)))
	var _n_sy0_b24 = maxf(_S.named_value(_n_p_b0,"oy"),floori(((_S.named_value(_n_p_b0,"ty") + _n_y_b2) - _n_r_b3)))
	var _n_sy1_b25 = minf(((_S.named_value(_n_p_b0,"oy") + _S.named_value(_n_p_b0,"h")) - 1),ceili(((_S.named_value(_n_p_b0,"ty") + _n_y_b2) + _n_r_b3)))
	if true:
		var _n_sy_b26 = _n_sy0_b24
		while _S.truth((_n_sy_b26 <= _n_sy1_b25)):
			var _n_ly_b27 = ((_n_sy_b26 + 0.5) - _S.named_value(_n_p_b0,"ty"))
			var _n_q_b28 = (float((_n_ly_b27 - _n_y_b2))/_n_r_b3)
			if _S.truth(((_n_q_b28 * _n_q_b28) >= 1)):
				_n_sy_b26 += 1.0
				continue
			var _n_hw_b29 = (_n_r_b3 * sqrt((1 - (_n_q_b28 * _n_q_b28))))
			var _n_cx_b30 = (_S.named_value(_n_p_b0,"tx") + (_n_x_b1 * _S.named_value(_n_p_b0,"fx")))
			if true:
				var _n_sx_b31 = maxf(_n_sx0_b22,floori(((_n_cx_b30 - _n_hw_b29) - 0.5)))
				var _n_e_b32 = minf(_n_sx1_b23,ceili((_n_cx_b30 + _n_hw_b29)))
				while _S.truth((_n_sx_b31 <= _n_e_b32)):
					_S.call_value(_n_px_b19,[(((_n_sx_b31 + 0.5) - _S.named_value(_n_p_b0,"tx")) * _S.named_value(_n_p_b0,"fx")), _n_ly_b27, _n_sx_b31, _n_sy_b26])
					_n_sx_b31 += 1.0
			_n_sy_b26 += 1.0
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_SM = _S.read(_parent,"SM")
	var _n_m = _S.read(_parent,"m")
	var _n_back = _S.read(_parent,"back")
	var _n_dark = _S.read(_parent,"dark")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_SM,minf((_n_m - 1),((_n_i_b0 + _n_back) + _n_dark)))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_r = _S.read(_parent,"r")
	var _n_y = _S.read(_parent,"y")
	var _n_fire = _S.read(_parent,"fire")
	var _n_n = _S.read(_parent,"n")
	var _n_seam = _S.read(_parent,"seam")
	var _n_FR = _S.read(_parent,"FR")
	var _n_style = _S.read(_parent,"style")
	var _n_D = _S.read(_parent,"D")
	var _n_glow = _S.read(_parent,"glow")
	var _n_p = _S.read(_parent,"p")
	var _n_a = _S.read(_parent,"a")
	var _n_rim = _S.read(_parent,"rim")
	var _n_soft = _S.read(_parent,"soft")
	var _n_lx_b0 = _S.arg(_args,0)
	var _n_ly_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_dx_b4 = (float((_n_lx_b0 - _n_x))/_n_r)
	var _n_dy_b5 = (float((_n_ly_b1 - _n_y))/_n_r)
	var _n_d2_b6 = ((_n_dx_b4 * _n_dx_b4) + (_n_dy_b5 * _n_dy_b5))
	if _S.truth((_n_d2_b6 > 1)):
		return null
	var _n_d_b7 = sqrt(_n_d2_b6)
	var _n_nz_b8 = sqrt((1 - _n_d2_b6))
	var _n_sky_b9 = ((((-0.5) * _n_dx_b4) - (0.66 * _n_dy_b5)) + (0.56 * _n_nz_b8))
	var _n_v_b10 = ((_n_fire * (1.32 - (0.78 * _n_d_b7))) + ((0.14 * _n_sky_b9) * _n_fire))
	var _n_c_b11 = null
	var _n_k_b12 = 0
	var _n_solid_b13 = false
	if _S.truth((_n_v_b10 > 0.44)):
		var _n_i_b14 = minf((_n_n - 3),maxf(0,floori((((1.3 - _n_v_b10) * (_n_n - 1)) * 0.78))))
		if _S.truth((_n_d_b7 > _n_seam)):
			_n_i_b14 = minf(6,maxf(4,(_n_i_b14 + 2)))
		else:
			if _S.truth((_n_d_b7 > (_n_seam - 0.22))):
				_n_i_b14 = minf((_n_n - 3),(_n_i_b14 + 1))
		_n_c_b11 = _S.index_value(_n_FR,_n_i_b14)
		_n_k_b12 = (0.05 * _n_fire)
		_n_solid_b13 = true
	else:
		if _S.truth(_n_style):
			var _n_lam_b15 = ((((-0.42) * _n_dx_b4) - (0.78 * _n_dy_b5)) + (0.46 * _n_nz_b8))
			if _S.truth(((_n_d_b7 > 0.4) if _S.truth((_n_lam_b15 > 0.66)) else (_n_lam_b15 > 0.66))):
				_n_c_b11 = _S.call_value(_n_D,[0])
			else:
				if _S.truth((_n_lam_b15 > 0.16)):
					_n_c_b11 = _S.call_value(_n_D,[1])
				else:
					if _S.truth((_n_lam_b15 > (-0.3))):
						_n_c_b11 = _S.call_value(_n_D,[2])
					else:
						_n_c_b11 = _S.call_value(_n_D,[(4 if _S.truth((_n_lam_b15 < (-0.64))) else 3)])
						var _n_g_b16 = (_n_glow * (0.6 + (0.4 * _n_dy_b5)))
						if _S.truth((_n_g_b16 > 0.55)):
							_n_c_b11 = _S.index_value(_n_FR,(5 if _S.truth((_n_g_b16 > 0.8)) else 6))
							_n_k_b12 = (0.08 * _n_g_b16)
						else:
							if _S.truth((_n_g_b16 > 0.34)):
								_n_c_b11 = _S.ColorFX.mix(_n_c_b11,_S.index_value(_n_FR,6),0.6)
							else:
								if _S.truth((_n_g_b16 > 0.16)):
									_n_c_b11 = _S.ColorFX.mix(_n_c_b11,_S.index_value(_n_FR,7),0.45)
		else:
			var _n_g_b17 = (_n_glow * ((0.82 * _n_dy_b5) + (0.3 * _n_nz_b8)))
			if _S.truth((_n_g_b17 > 0.45)):
				_n_c_b11 = _S.index_value(_n_FR,(4 if _S.truth((_n_g_b17 > 0.66)) else 5))
				_n_k_b12 = (0.1 * _n_glow)
			else:
				if _S.truth((_n_g_b17 > 0.3)):
					_n_c_b11 = _S.index_value(_n_FR,6)
				else:
					if _S.truth((_n_g_b17 > 0.2)):
						_n_c_b11 = _S.index_value(_n_FR,7)
					else:
						var _n_s_b18 = ((_n_sky_b9 * 0.5) + 0.5)
						_n_c_b11 = _S.call_value(_n_D,[(0 if _S.truth((_n_s_b18 > 0.8)) else (1 if _S.truth((_n_s_b18 > 0.62)) else (2 if _S.truth((_n_s_b18 > 0.42)) else (3 if _S.truth((_n_s_b18 > 0.22)) else 4))))])
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _n_c_b11, (_n_a if _S.truth((_n_solid_b13 if _S.truth(_n_solid_b13) else (_n_d_b7 <= _n_rim))) else (_n_a * _n_soft))])
	if _S.truth((_n_k_b12 > 0)):
		_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, _n_c_b11, _n_k_b12])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_F_b0 = _S.arg(_args,0)
	return [_S.index_value(_n_F_b0,7), _S.index_value(_n_F_b0,6), _S.index_value(_n_F_b0,5), _S.index_value(_n_F_b0,4), _S.index_value(_n_F_b0,3), _S.index_value(_n_F_b0,2), _S.index_value(_n_F_b0,1), _S.ColorFX.mix(_S.index_value(_n_F_b0,1),_S.index_value(_n_F_b0,0),0.5), _S.index_value(_n_F_b0,0)]
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_FR_b0 = _S.arg(_args,0)
	return _S.concat([_S.array(_S.invoke(_n_FR_b0,"slice",[0, 8])),[_S.ColorFX.mix(_S.index_value(_n_FR_b0,8),_n_SOOT,0.3)],[_S.ColorFX.mix(_S.index_value(_n_FR_b0,8),_n_SOOT,0.65)]])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "o", _S.write(_e, "o", _S.merge([{"x": 0}, {"y": _S.unary("-", 20)}, {"rise": 100}, {"tau": 1.2}, {"drift": 4}, {"tube": [8, 20]}, {"ring": [1, 18]}, {"grow": 0.9}, {"n": 40}, {"size": [5, 10]}, {"swell": 0.5}, {"spin": 2.4}, {"spinTau": 1.6}, {"heat": 1.15}, {"cool": 0.45}, {"under": 0.5}, {"tilt": 0.2}, {"squash": 0.7}, {"fade": [4, 6]}, {"glow": 1}, {"spread": 10}, {"style": 0}, {"inner": false}, {"hollow": false}, {"fray": null}, _S.read(_e, "o")]), "=", false), "=", false)
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "R"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "roll", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "onFray", null, "=", false)
	_S.set_prop(_S.read(_e, "this"), "lobes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "o"), "n")}]), _S.function_value(_e, "_f27")]), "=", false)
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_o = _S.read(_parent,"o")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"th":(_n_TAU * fmod(((_n_i_b1 * 0.618034) + _S.invoke(_n_R,"range",[(-0.08), 0.08])),1)),"ph":(float((_n_TAU * (_n_i_b1 + _S.invoke(_n_R,"range",[(-0.35), 0.35]))))/_S.named_value(_n_o,"n")),"j":_S.invoke(_n_R,"range",[(-0.55), 0.12]),"s":_S.invoke(_n_R,"range",[_S.index_value(_S.named_value(_n_o,"size"),0), _S.index_value(_S.named_value(_n_o,"size"),1)]),"h":_S.invoke(_n_R,"range",[(-0.22), 0.08]),"dx":_S.invoke(_n_R,"range",[(-1), 1]),"dy":_S.invoke(_n_R,"range",[(-1), 0.4]),"f":_S.invoke(_n_R,"range",[(-0.9), 0.5]),"gv":_S.invoke(_n_R,"range",[0.55, 1.15])}
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.coalesce(_S.arg(_args,0),func():return _S.named_value(_this,"t"))
	var _n_o_b1 = _S.named_value(_this,"o")
	var _n_u_b2 = maxf(0,_n_t_b0)
	var _n_g_b3 = (1 - exp((float((-_n_u_b2))/_S.named_value(_n_o_b1,"grow"))))
	return {"x":_S.named_value(_n_o_b1,"x"),"y":((_S.named_value(_n_o_b1,"y") - (_S.named_value(_n_o_b1,"rise") * (1 - exp((float((-_n_u_b2))/_S.named_value(_n_o_b1,"tau")))))) - (_S.named_value(_n_o_b1,"drift") * _n_u_b2)),"tube":(_S.index_value(_S.named_value(_n_o_b1,"tube"),0) + ((_S.index_value(_S.named_value(_n_o_b1,"tube"),1) - _S.index_value(_S.named_value(_n_o_b1,"tube"),0)) * _n_g_b3)),"ring":(_S.index_value(_S.named_value(_n_o_b1,"ring"),0) + ((_S.index_value(_S.named_value(_n_o_b1,"ring"),1) - _S.index_value(_S.named_value(_n_o_b1,"ring"),0)) * _n_g_b3)),"g":_n_g_b3}
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.coalesce(_S.arg(_args,0),func():return _S.named_value(_this,"t"))
	return clampf(((_S.named_value(_S.named_value(_this,"o"),"heat") - (_S.named_value(_S.named_value(_this,"o"),"cool") * _n_t_b0)) + 0.3),0.0,1.0)
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.coalesce(_S.arg(_args,0),func():return _S.named_value(_this,"t"))
	return clampf((float(((_S.named_value(_S.named_value(_this,"o"),"heat") - (_S.named_value(_S.named_value(_this,"o"),"cool") * _n_t_b0)) + 1))/1.1),0.0,1.0)
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_o_b1 = _S.named_value(_this,"o")
	var _n_S_b2 = _S.invoke(_this,"shape",[_n_t_b0])
	var _n_base_b3 = (_S.named_value(_n_o_b1,"heat") - (_S.named_value(_n_o_b1,"cool") * _n_t_b0))
	var _n_span_b4 = ((_S.named_value(_n_S_b2,"ring") + _S.named_value(_n_S_b2,"tube")) if _S.truth((_S.named_value(_n_S_b2,"ring") + _S.named_value(_n_S_b2,"tube"))) else 1)
	var _n_list_b5 = []
	for _iter_0 in _S.array(_S.named_value(_this,"lobes")):
		var _n_q_b6 = _iter_0
		var _n_fade_b7 = (1 - _S.MathFX.smooth((_S.index_value(_S.named_value(_n_o_b1,"fade"),0) + _S.named_value(_n_q_b6,"f")),(_S.index_value(_S.named_value(_n_o_b1,"fade"),1) + (_S.named_value(_n_q_b6,"f") * 0.5)),_n_t_b0))
		var _n_loose_b8 = (pow(_S.MathFX.smooth(((_S.index_value(_S.named_value(_n_o_b1,"fade"),0) - 1.8) + _S.named_value(_n_q_b6,"f")),_S.index_value(_S.named_value(_n_o_b1,"fade"),1),_n_t_b0),1.5) * _S.named_value(_n_o_b1,"spread"))
		if _S.truth((_n_fade_b7 <= 0)):
			continue
		var _n_th_b9 = (_S.named_value(_n_q_b6,"th") - _S.named_value(_this,"roll"))
		var _n_rt_b10 = (_S.named_value(_n_S_b2,"tube") * (1 + _S.named_value(_n_q_b6,"j")))
		var _n_rho_b11 = (_S.named_value(_n_S_b2,"ring") + (_n_rt_b10 * cos(_n_th_b9)))
		var _n_up_b12 = sin(_n_th_b9)
		var _n_X_b13 = (_n_rho_b11 * cos(_S.named_value(_n_q_b6,"ph")))
		var _n_Z_b14 = (_n_rho_b11 * sin(_S.named_value(_n_q_b6,"ph")))
		var _n_heat_b15 = (((_n_base_b3 + _S.named_value(_n_q_b6,"h")) - ((0.18 * maxf(0,cos(_n_th_b9))) * clampf((_n_t_b0 * 2),0.0,1.0))) + ((_S.named_value(_n_o_b1,"under") * maxf(0,(-_n_up_b12))) * clampf((_n_base_b3 + 0.6),0.0,1.0)))
		var _n_r_b16 = (((_S.named_value(_n_q_b6,"s") * (0.5 + (0.5 * _S.named_value(_n_S_b2,"g")))) * (1 + (_S.named_value(_n_o_b1,"swell") * clampf((1 - _n_heat_b15),0.0,1.0)))) * (1 + (0.35 * (1 - _n_fade_b7))))
		_S.invoke(_n_list_b5,"push",[{"x":((_S.named_value(_n_S_b2,"x") + _n_X_b13) + (_S.named_value(_n_q_b6,"dx") * _n_loose_b8)),"y":(((_S.named_value(_n_S_b2,"y") - ((_n_rt_b10 * _n_up_b12) * _S.named_value(_n_o_b1,"squash"))) + (_n_Z_b14 * _S.named_value(_n_o_b1,"tilt"))) + (_S.named_value(_n_q_b6,"dy") * _n_loose_b8)),"z":(float(_n_Z_b14)/_n_span_b4),"up":_n_up_b12,"out":cos(_n_th_b9),"heat":_n_heat_b15,"q":_n_q_b6,"fade":_n_fade_b7,"r":_n_r_b16,"d":(float(_S.Bridge.hypot([_n_X_b13, _n_Z_b14]))/_n_span_b4),"c":(1 - minf(1,(float(absf(_n_X_b13))/_n_span_b4)))}])
	return _S.invoke(_n_list_b5,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f32")])
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"z") - _S.named_value(_n_b_b1,"z"))
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	var _n_o_b1 = _S.named_value(_this,"o")
	_S.set_prop(_this,"t",_n_dt_b0,"+=")
	_S.set_prop(_this,"roll",((_S.named_value(_n_o_b1,"spin") * (0.12 + (0.88 * exp((float((-_S.named_value(_this,"t")))/_S.named_value(_n_o_b1,"spinTau")))))) * _n_dt_b0),"+=")
	if _S.truth(((_S.named_value(_this,"t") < (_S.index_value(_S.named_value(_n_o_b1,"fray"),2) if _S.index_value(_S.named_value(_n_o_b1,"fray"),2)!=null else INF)) if _S.truth(((_S.named_value(_this,"t") > _S.index_value(_S.named_value(_n_o_b1,"fray"),0)) if _S.truth((_S.named_value(_this,"onFray") if _S.truth(_S.named_value(_n_o_b1,"fray")) else _S.named_value(_n_o_b1,"fray"))) else (_S.named_value(_this,"onFray") if _S.truth(_S.named_value(_n_o_b1,"fray")) else _S.named_value(_n_o_b1,"fray")))) else ((_S.named_value(_this,"t") > _S.index_value(_S.named_value(_n_o_b1,"fray"),0)) if _S.truth((_S.named_value(_this,"onFray") if _S.truth(_S.named_value(_n_o_b1,"fray")) else _S.named_value(_n_o_b1,"fray"))) else (_S.named_value(_this,"onFray") if _S.truth(_S.named_value(_n_o_b1,"fray")) else _S.named_value(_n_o_b1,"fray"))))):
		var _n_S_b2 = _S.invoke(_this,"shape",[])
		var _n_k_b3 = ((_S.index_value(_S.named_value(_n_o_b1,"fray"),1) * _n_dt_b0) * _S.MathFX.smooth(_S.index_value(_S.named_value(_n_o_b1,"fray"),0),(_S.index_value(_S.named_value(_n_o_b1,"fray"),0) + 1),_S.named_value(_this,"t")))
		for _iter_0 in _S.array(_S.invoke(_this,"lobesAt",[_S.named_value(_this,"t")])):
			var _n_e_b4 = _iter_0
			if _S.truth(((_S.named_value(_n_e_b4,"out") < 0.2) if _S.truth((_S.named_value(_n_e_b4,"out") < 0.2)) else not _S.truth(_S.invoke(_S.named_value(_this,"R"),"chance",[(_n_k_b3 * _S.named_value(_n_e_b4,"fade"))])))):
				continue
			var _n_ux_b5 = (_S.named_value(_n_e_b4,"x") - _S.named_value(_n_S_b2,"x"))
			var _n_uy_b6 = (_S.named_value(_n_e_b4,"y") - _S.named_value(_n_S_b2,"y"))
			var _n_l_b7 = _S.logical("||",_S.Bridge.hypot([_n_ux_b5, _n_uy_b6]),func():return 1)
			_S.invoke(_this,"onFray",[(_S.named_value(_n_e_b4,"x") + (((float(_n_ux_b5)/_n_l_b7) * _S.named_value(_n_e_b4,"r")) * 0.6)), (_S.named_value(_n_e_b4,"y") + (((float(_n_uy_b6)/_n_l_b7) * _S.named_value(_n_e_b4,"r")) * 0.6)), _S.named_value(_n_e_b4,"r"), (float(_n_ux_b5)/_n_l_b7), (float(_n_uy_b6)/_n_l_b7)])
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_lobe = _S.read(_parent,"lobe")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_FR_b1 = _S.arg(_args,1)
	var _n_SM_b2 = _S.arg(_args,2)
	var _object_0 = _S.coalesce(_S.arg(_args,3),func():return {})
	var _n_mid_b3 = _S.named_value(_object_0,"mid")
	var _n_o_b4 = _S.named_value(_this,"o")
	var _n_t_b5 = _S.named_value(_this,"t")
	if _S.truth((_n_t_b5 >= (_S.index_value(_S.named_value(_n_o_b4,"fade"),1) + 0.5))):
		return null
	var _n_S_b6 = _S.invoke(_this,"shape",[_n_t_b5])
	var _n_base_b7 = (_S.named_value(_n_o_b4,"heat") - (_S.named_value(_n_o_b4,"cool") * _n_t_b5))
	var _n_span_b8 = ((_S.named_value(_n_S_b6,"ring") + _S.named_value(_n_S_b6,"tube")) if _S.truth((_S.named_value(_n_S_b6,"ring") + _S.named_value(_n_S_b6,"tube"))) else 1)
	var _n_list_b9 = _S.invoke(_this,"lobesAt",[_n_t_b5])
	var _n_age_b10 = clampf((float(_n_t_b5)/_S.index_value(_S.named_value(_n_o_b4,"fade"),1)),0.0,1.0)
	var _n_E_b11 = _S.invoke(_this,"ember",[_n_t_b5])
	var _n_reach_b12 = (0.3 + (1.15 * _n_E_b11))
	var _n_drawn_b13 = false
	for _iter_1 in _S.array(_n_list_b9):
		var _n_e_b15 = _iter_1
		if _S.truth((_n_mid_b3 if _S.truth(((_S.named_value(_n_e_b15,"z") >= 0) if _S.truth(not _S.truth(_n_drawn_b13)) else not _S.truth(_n_drawn_b13))) else ((_S.named_value(_n_e_b15,"z") >= 0) if _S.truth(not _S.truth(_n_drawn_b13)) else not _S.truth(_n_drawn_b13)))):
			_n_drawn_b13 = true
			_S.call_value(_n_mid_b3,[])
		var _n_h_b16 = _S.named_value(_n_e_b15,"heat")
		var _n_fade_b17 = _S.named_value(_n_e_b15,"fade")
		var _n_fire_b18 = clampf((float((_n_h_b16 - 0.2))/0.75),0.0,1.0)
		var _n_glow_b19 = (((((_n_E_b11 * clampf((float((_n_reach_b12 - _S.named_value(_n_e_b15,"d")))/0.45),0.0,1.0)) * (0.45 + (0.55 * maxf(0,(-_S.named_value(_n_e_b15,"up")))))) * _S.named_value(_S.named_value(_n_e_b15,"q"),"gv")) * _S.named_value(_n_o_b4,"glow")) if _S.truth(_S.named_value(_n_o_b4,"inner")) else (((clampf((float((_n_base_b7 + 0.45))/0.85),0.0,1.0) * _S.named_value(_n_o_b4,"glow")) * ((0.4 + (0.35 * maxf(0,(-_S.named_value(_n_e_b15,"up"))))) + (0.4 * _S.named_value(_n_e_b15,"c")))) * _S.named_value(_S.named_value(_n_e_b15,"q"),"gv")))
		_S.call_value(_n_lobe,[_n_p_b0, _S.named_value(_n_e_b15,"x"), _S.named_value(_n_e_b15,"y"), _S.named_value(_n_e_b15,"r"), _n_FR_b1, _n_SM_b2, _n_fire_b18, _n_glow_b19, (_n_fade_b17 * (0.82 + (0.18 * _n_fire_b18))), _S.named_value(_n_e_b15,"z"), ((1 if _S.truth((_n_age_b10 > 0.72)) else 0) + (1 if _S.truth(((_S.named_value(_n_e_b15,"up") < (-0.35)) if _S.truth(_S.named_value(_n_o_b4,"hollow")) else _S.named_value(_n_o_b4,"hollow"))) else 0)), _S.named_value(_n_o_b4,"style")])
		if _S.truth((_n_fire_b18 > 0.25)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_e_b15,"x"), _S.named_value(_n_e_b15,"y"), ((_S.named_value(_n_e_b15,"r") * 1.25) + 2), _S.index_value(_n_FR_b1,2), (0.07 * _n_fire_b18)])
	if _S.truth((_n_mid_b3 if _S.truth(not _S.truth(_n_drawn_b13)) else not _S.truth(_n_drawn_b13))):
		_S.call_value(_n_mid_b3,[])
	var _n_hot_b14 = _S.invoke(_this,"hot",[_n_t_b5])
	if _S.truth((_n_hot_b14 > 0)):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_S_b6,"x"), _S.named_value(_n_S_b6,"y"), ((_n_span_b8 * 1.8) + 14), _S.index_value(_n_FR_b1,3), ((0.32 * _n_hot_b14) * _S.named_value(_n_o_b4,"glow"))])
	if _S.truth(((_n_E_b11 > 0.05) if _S.truth(_S.named_value(_n_o_b4,"inner")) else _S.named_value(_n_o_b4,"inner"))):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_S_b6,"x"), (_S.named_value(_n_S_b6,"y") + (_S.named_value(_n_S_b6,"tube") * 0.3)), ((_n_span_b8 * (0.5 + (0.7 * _n_E_b11))) + 8), _S.index_value(_n_FR_b1,4), ((0.22 * _n_E_b11) * _n_E_b11)])
	return null

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "R"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "o", _S.write(_e, "o", _S.merge([{"w": 7}, {"foot": 16}, {"speed": 70}, {"size": [5, 8]}, {"n": 18}, {"sway": 2.5}, {"fade": 0.5}, {"style": 0}, _S.read(_e, "o")]), "=", false), "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "lobes", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "acc", 0, "=", false)
	return null

static func _f36(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.named_value(_this,"R")
	var _n_o_b2 = _S.named_value(_this,"o")
	_S.invoke(_S.named_value(_this,"lobes"),"push",[{"y":_n_y_b0,"x":_S.invoke(_n_R_b1,"range",[(-1), 1]),"s":_S.invoke(_n_R_b1,"range",[_S.index_value(_S.named_value(_n_o_b2,"size"),0), _S.index_value(_S.named_value(_n_o_b2,"size"),1)]),"ph":_S.invoke(_n_R_b1,"range",[0, _n_TAU]),"a":0,"v":_S.invoke(_n_R_b1,"range",[0.8, 1.2])}])
	return null

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "top", _S.arg(_args, 1))
	_S.define(_e, "feed", _S.arg(_args, 2))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "max", [10, _S.unary("-", _S.read(_e, "top"))]))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "feed"), 0)):
		var _v58 = _S.scope(_e)
		_S.set_prop(_S.read(_v58, "this"), "acc", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v58, "dt"), _S.read(_v58, "feed")), _S.prop(_S.read(_v58, "o"), "n")), _S.binary("/", _S.prop(_S.read(_v58, "o"), "speed"), _S.read(_v58, "L"))), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v58, "this"), "acc"), 1)):
			_S.invoke(_S.read(_v58, "this"), "spawn", [_S.unary("-", 1)])
			_v58 = _S.iteration(_v58)
			_S.set_prop(_S.read(_v58, "this"), "acc", 1, "-=", true)
	var _v59 = _S.scope(_e)
	_S.define(_v59, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v59, "this"), "lobes"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v59, "i"), 0)):
		var _v60 = _S.scope(_v59)
		_S.define(_v60, "b", _S.prop(_S.prop(_S.read(_v60, "this"), "lobes"), _S.read(_v60, "i")))
		_S.define(_v60, "u", _S.call_value(_S.read(_v60, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v60, "b"), "y")), _S.read(_v60, "L"))]))
		_S.set_prop(_S.read(_v60, "b"), "y", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "o"), "speed"), _S.prop(_S.read(_v60, "b"), "v")), _S.binary("+", 0.45, _S.binary("*", 0.55, _S.invoke(_S.read(_v60, "Math"), "min", [1, _S.binary("/", _S.unary("-", _S.prop(_S.read(_v60, "b"), "y")), 24)])))), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "b"), "a", _S.invoke(_S.read(_v60, "Math"), "min", [1, _S.binary("+", _S.prop(_S.read(_v60, "b"), "a"), _S.binary("*", _S.read(_v60, "dt"), 4))]), "=", false)
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v60, "b"), "y"), _S.read(_v60, "top")), func(): return _S.logical("&&", _S.binary("<=", _S.read(_v60, "feed"), 0), func(): return _S.binary("<=", _S.set_prop(_S.read(_v60, "b"), "a", _S.binary("*", _S.read(_v60, "dt"), _S.binary("-", 2, _S.read(_v60, "u"))), "-=", false), 0)))):
			_S.invoke(_S.prop(_S.read(_v60, "this"), "lobes"), "splice", [_S.read(_v60, "i"), 1])
		_v59 = _S.iteration(_v59)
		_S.write(_v59, "i", 1, "-=", true)
	return null

static func _f38(_parent,_args:Array,_this=null):
	var _n_lobe = _S.read(_parent,"lobe")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_top_b1 = _S.arg(_args,1)
	var _n_FR_b2 = _S.arg(_args,2)
	var _n_SM_b3 = _S.arg(_args,3)
	var _n_fire_b4 = _S.arg(_args,4)
	var _n_glow_b5 = _S.arg(_args,5)
	var _n_o_b6 = _S.named_value(_this,"o")
	var _n_L_b7 = maxf(10,(-_n_top_b1))
	var _n_list_b8 = _S.invoke(_S.concat([_S.array(_S.named_value(_this,"lobes"))]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f39")])
	for _iter_0 in _S.array(_n_list_b8):
		var _n_b_b9 = _iter_0
		var _n_u_b10 = clampf((float((-_S.named_value(_n_b_b9,"y")))/_n_L_b7),0.0,1.0)
		var _n_foot_b11 = pow((1 - _n_u_b10),4)
		var _n_w_b12 = (_S.named_value(_n_o_b6,"w") + (_S.named_value(_n_o_b6,"foot") * _n_foot_b11))
		var _n_x_b13 = (((_S.named_value(_n_b_b9,"x") * _n_w_b12) * 0.45) + ((sin((((_S.named_value(_this,"t") * 1.7) + _S.named_value(_n_b_b9,"ph")) + (_n_u_b10 * 3))) * _S.named_value(_n_o_b6,"sway")) * _n_u_b10))
		var _n_r_b14 = ((_S.named_value(_n_b_b9,"s") * ((0.75 + (0.5 * _n_foot_b11)) + (0.35 * _n_u_b10))) * minf(1,(_S.named_value(_n_b_b9,"a") * 1.5)))
		var _n_end_b15 = (1 - _S.MathFX.smooth(0.85,1,_n_u_b10))
		_S.call_value(_n_lobe,[_n_p_b0, _n_x_b13, (_S.named_value(_n_b_b9,"y") - ((_n_r_b14 * 0.3) * _n_foot_b11)), _n_r_b14, _n_FR_b2, _n_SM_b3, clampf((_n_fire_b4 * (1.1 - (_n_u_b10 * 0.9))),0.0,1.0), (_n_glow_b5 * _S.MathFX.smooth(0.55,1,_n_u_b10)), ((minf(1,_S.named_value(_n_b_b9,"a")) * _n_end_b15) * 0.9), 0, (0 if _S.truth((_n_u_b10 > 0.5)) else 1), _S.named_value(_n_o_b6,"style")])
	return null

static func _f39(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"y") - _S.named_value(_n_b_b1,"y"))
	return null
