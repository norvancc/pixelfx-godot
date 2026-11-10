@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"ice_in_poly","_f1":"ice_centroid","_f7":"ice_of","_f29":"panes_update","_f30":"panes_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "inPoly", _S.function_value(_e, "_f0"))
	_S.define(_e, "centroid", _S.function_value(_e, "_f1"))
	_S.define(_e, "splitPoly", _S.function_value(_e, "_f4"))
	_S.define(_e, "iceOf", _S.function_value(_e, "_f7"))
	_S.define(_e, "glassPoly", _S.function_value(_e, "_f8"))
	_S.define(_e, "blade", _S.function_value(_e, "_f9"))
	_S.define(_e, "flakeDesign", _S.function_value(_e, "_f15"))
	_S.define(_e, "snowflake", _S.function_value(_e, "_f16"))
	_S.define(_e, "endBy", _S.function_value(_e, "_f17"))
	_S.define(_e, "fractures", _S.function_value(_e, "_f18"))
	_S.define(_e, "drawFractures", _S.function_value(_e, "_f20"))
	_exports["inPoly"] = _S.read(_e, "inPoly")
	_exports["centroid"] = _S.read(_e, "centroid")
	_exports["splitPoly"] = _S.read(_e, "splitPoly")
	_exports["iceOf"] = _S.read(_e, "iceOf")
	_exports["glassPoly"] = _S.read(_e, "glassPoly")
	_S.define(_e, "Panes", _S.class_value("Panes", _S.function_value(_e, "_f22"), {"add": _S.function_value(_e, "_f24"), "corners": _S.function_value(_e, "_f26"), "seat": _S.function_value(_e, "_f28"), "update": _S.function_value(_e, "_f29"), "draw": _S.function_value(_e, "_f30")}, {"count": _S.function_value(_e, "_f25")}, {}, null))
	_exports["Panes"] = _S.read(_e, "Panes")
	_exports["blade"] = _S.read(_e, "blade")
	_exports["flakeDesign"] = _S.read(_e, "flakeDesign")
	_exports["snowflake"] = _S.read(_e, "snowflake")
	_exports["endBy"] = _S.read(_e, "endBy")
	_exports["fractures"] = _S.read(_e, "fractures")
	_exports["drawFractures"] = _S.read(_e, "drawFractures")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_inside_b3 = false
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_S.prop(_n_pts_b0,"length") - 1)
		while _S.truth((_n_i_b4 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,_n_i_b4)
			var _n_xi_b6 = _S.prop(_tuple_0,0)
			var _n_yi_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_j_b5)
			var _n_xj_b8 = _S.prop(_tuple_1,0)
			var _n_yj_b9 = _S.prop(_tuple_1,1)
			if _S.truth(((_n_x_b1 < ((float(((_n_xj_b8 - _n_xi_b6) * (_n_y_b2 - _n_yi_b7)))/(_n_yj_b9 - _n_yi_b7)) + _n_xi_b6)) if _S.truth(_S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2))) else _S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2)))):
				_n_inside_b3 = not _S.truth(_n_inside_b3)
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	return _n_inside_b3
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_a_b1 = 0
	var _n_cx_b2 = 0
	var _n_cy_b3 = 0
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_S.prop(_n_pts_b0,"length") - 1)
		while _S.truth((_n_i_b4 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,_n_j_b5)
			var _n_x0_b6 = _S.prop(_tuple_0,0)
			var _n_y0_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_i_b4)
			var _n_x1_b8 = _S.prop(_tuple_1,0)
			var _n_y1_b9 = _S.prop(_tuple_1,1)
			var _n_k_b10 = ((_n_x0_b6 * _n_y1_b9) - (_n_x1_b8 * _n_y0_b7))
			_n_a_b1 += _n_k_b10
			_n_cx_b2 += ((_n_x0_b6 + _n_x1_b8) * _n_k_b10)
			_n_cy_b3 += ((_n_y0_b7 + _n_y1_b9) * _n_k_b10)
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	if _S.truth((absf(_n_a_b1) < 0.000001)):
		var _n_n_b11 = _S.prop(_n_pts_b0,"length")
		return {"x":(float(_S.invoke(_n_pts_b0,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), 0]))/_n_n_b11),"y":(float(_S.invoke(_n_pts_b0,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), 0]))/_n_n_b11),"area":0}
	return {"x":(float(_n_cx_b2)/(3 * _n_a_b1)),"y":(float(_n_cy_b3)/(3 * _n_a_b1)),"area":(float(absf(_n_a_b1))/2)}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_n_s_b0 + _S.index_value(_n_q_b1,0))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_n_s_b0 + _S.index_value(_n_q_b1,1))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_nx_b4 = (-sin(_n_a_b3))
	var _n_ny_b5 = cos(_n_a_b3)
	var _n_side_b6 = _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"nx":_n_nx_b4,"y":_n_y_b2,"ny":_n_ny_b5,"this":_this}),"_f5")
	var _n_L_b7 = []
	var _n_Rt_b8 = []
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < _S.prop(_n_pts_b0,"length"))):
			var _n_p_b10 = _S.index_value(_n_pts_b0,_n_i_b9)
			var _n_q_b11 = _S.index_value(_n_pts_b0,fmod((_n_i_b9 + 1),_S.prop(_n_pts_b0,"length")))
			var _n_sp_b12 = _S.call_value(_n_side_b6,[_n_p_b10])
			var _n_sq_b13 = _S.call_value(_n_side_b6,[_n_q_b11])
			_S.invoke((_n_L_b7 if _S.truth((_n_sp_b12 >= 0)) else _n_Rt_b8),"push",[_n_p_b10])
			if _S.truth(_S.binary("!==",(_n_sp_b12 >= 0),(_n_sq_b13 >= 0))):
				var _n_u_b14 = (float(_n_sp_b12)/(_n_sp_b12 - _n_sq_b13))
				var _n_m_b15 = [(_S.index_value(_n_p_b10,0) + ((_S.index_value(_n_q_b11,0) - _S.index_value(_n_p_b10,0)) * _n_u_b14)), (_S.index_value(_n_p_b10,1) + ((_S.index_value(_n_q_b11,1) - _S.index_value(_n_p_b10,1)) * _n_u_b14))]
				_S.invoke(_n_L_b7,"push",[_n_m_b15])
				_S.invoke(_n_Rt_b8,"push",[_n_m_b15])
			_n_i_b9 += 1.0
	return _S.invoke([_n_L_b7, _n_Rt_b8],"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_nx = _S.read(_parent,"nx")
	var _n_y = _S.read(_parent,"y")
	var _n_ny = _S.read(_parent,"ny")
	var _n_q_b0 = _S.arg(_args,0)
	return (((_S.index_value(_n_q_b0,0) - _n_x) * _n_nx) + ((_S.index_value(_n_q_b0,1) - _n_y) * _n_ny))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	return (_S.prop(_n_s_b0,"length") >= 3)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.prop(_n_C_b1,"length")
	var _n_l_b3 = _S.ColorFX.luma(_n_c_b0)
	return _S.index_value(_n_C_b1,clampf(floori((float(((2 if _S.truth((_n_l_b3 < 0.12)) else (2 + (_n_l_b3 * 5.2))) * (_n_n_b2 - 1)))/7)+0.5),1,(_n_n_b2 - 1)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_x0_b4 = INF
	var _n_y0_b5 = INF
	var _n_x1_b6 = (-INF)
	var _n_y1_b7 = (-INF)
	for _iter_0 in _S.array(_n_pts_b1):
		var _tuple_1 = _iter_0
		var _n_x_b8 = _S.prop(_tuple_1,0)
		var _n_y_b9 = _S.prop(_tuple_1,1)
		_n_x0_b4 = minf(_n_x0_b4,_n_x_b8)
		_n_x1_b6 = maxf(_n_x1_b6,_n_x_b8)
		_n_y0_b5 = minf(_n_y0_b5,_n_y_b9)
		_n_y1_b7 = maxf(_n_y1_b7,_n_y_b9)
	if true:
		var _n_y_b10 = floori(_n_y0_b5)
		while _S.truth((_n_y_b10 <= ceili(_n_y1_b7))):
			if true:
				var _n_x_b11 = floori(_n_x0_b4)
				while _S.truth((_n_x_b11 <= ceili(_n_x1_b6))):
					if _S.truth(_S.call_value(_n_inPoly,[_n_pts_b1, (_n_x_b11 + 0.5), (_n_y_b10 + 0.5)])):
						_S.invoke(_n_p_b0,"blend",[_n_x_b11, _n_y_b10, _n_c_b2, _n_a_b3])
					_n_x_b11 += 1.0
			_n_y_b10 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_bx_b1 = _S.arg(_args,1)
	var _n_by_b2 = _S.arg(_args,2)
	var _n_tx_b3 = _S.arg(_args,3)
	var _n_ty_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_opts_b7 = _S.coalesce(_S.arg(_args,7),func():return {})
	var _n_dx_b8 = (_n_tx_b3 - _n_bx_b1)
	var _n_dy_b9 = (_n_ty_b4 - _n_by_b2)
	var _n_L_b10 = _S.Bridge.hypot([_n_dx_b8, _n_dy_b9])
	if _S.truth(((_n_L_b10 < 1.5) if _S.truth((_n_L_b10 < 1.5)) else (_n_w_b5 < 0.5))):
		return null
	var _n_ux_b11 = (float(_n_dx_b8)/_n_L_b10)
	var _n_uy_b12 = (float(_n_dy_b9)/_n_L_b10)
	var _n_nx_b13 = (-_n_uy_b12)
	var _n_ny_b14 = _n_ux_b11
	var _n_a_b15 = (_S.named_value(_n_opts_b7,"a") if _S.named_value(_n_opts_b7,"a")!=null else 1)
	var _n_dim_b16 = (_S.named_value(_n_opts_b7,"dim") if _S.named_value(_n_opts_b7,"dim")!=null else 0)
	var _n_jag_b17 = (_S.named_value(_n_opts_b7,"jag") if _S.named_value(_n_opts_b7,"jag")!=null else (-1))
	var _n_glint_b18 = (_S.named_value(_n_opts_b7,"glint") if _S.named_value(_n_opts_b7,"glint")!=null else (-1))
	var _n_K_b19 = _S.function_value(_S.capture(_parent,{"C":_n_C_b6,"dim":_n_dim_b16,"this":_this}),"_f10")
	var _n_hw_b20 = (float(_n_w_b5)/2)
	var _n_left_b21 = _S.function_value(_S.capture(_parent,{"hw":_n_hw_b20,"this":_this}),"_f11")
	var _n_right_b22 = _S.function_value(_S.capture(_parent,{"hw":_n_hw_b20,"jag":_n_jag_b17,"this":_this}),"_f12")
	var _n_ridge_b23 = _S.function_value(_S.capture(_parent,{"w":_n_w_b5,"this":_this}),"_f13")
	var _n_pad_b24 = (_n_hw_b20 + 2)
	_S.invoke(_n_p_b0,"shade",[(minf(_n_bx_b1,_n_tx_b3) - _n_pad_b24), (minf(_n_by_b2,_n_ty_b4) - _n_pad_b24), (maxf(_n_bx_b1,_n_tx_b3) + _n_pad_b24), maxf(_n_by_b2,_n_ty_b4), _S.function_value(_S.capture(_parent,{"bx":_n_bx_b1,"by":_n_by_b2,"ux":_n_ux_b11,"uy":_n_uy_b12,"L":_n_L_b10,"nx":_n_nx_b13,"ny":_n_ny_b14,"left":_n_left_b21,"right":_n_right_b22,"K":_n_K_b19,"a":_n_a_b15,"opts":_n_opts_b7,"ridge":_n_ridge_b23,"jag":_n_jag_b17,"glint":_n_glint_b18,"this":_this}),"_f14")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_dim = _S.read(_parent,"dim")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,clampf((_n_i_b0 - _n_dim),0,(_S.prop(_n_C,"length") - 1)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_hw = _S.read(_parent,"hw")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_hw * (1 - _n_u_b0)) + 0.35)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_hw = _S.read(_parent,"hw")
	var _n_jag = _S.read(_parent,"jag")
	var _n_u_b0 = _S.arg(_args,0)
	return (((_n_hw * (1 - _n_u_b0)) * (0.55 if _S.truth(((_n_u_b0 > _n_jag) if _S.truth((_n_jag >= 0)) else (_n_jag >= 0))) else 1)) + 0.35)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_u_b0 = _S.arg(_args,0)
	return (((-_n_w) * 0.12) * (1 - _n_u_b0))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_ux = _S.read(_parent,"ux")
	var _n_uy = _S.read(_parent,"uy")
	var _n_L = _S.read(_parent,"L")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_left = _S.read(_parent,"left")
	var _n_right = _S.read(_parent,"right")
	var _n_K = _S.read(_parent,"K")
	var _n_a = _S.read(_parent,"a")
	var _n_opts = _S.read(_parent,"opts")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ridge = _S.read(_parent,"ridge")
	var _n_jag = _S.read(_parent,"jag")
	var _n_glint = _S.read(_parent,"glint")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_rx_b3 = (_n_x_b0 - _n_bx)
	var _n_ry_b4 = (_n_y_b1 - _n_by)
	var _n_u_b5 = (float(((_n_rx_b3 * _n_ux) + (_n_ry_b4 * _n_uy)))/_n_L)
	var _n_s_b6 = ((_n_rx_b3 * _n_nx) + (_n_ry_b4 * _n_ny))
	if _S.truth((_n_u_b5 < 0)):
		return null
	var _n_l_b7 = _S.call_value(_n_left,[minf(_n_u_b5,1)])
	var _n_r_b8 = _S.call_value(_n_right,[minf(_n_u_b5,1)])
	if _S.truth((((_n_u_b5 > 1) if _S.truth((_n_u_b5 > 1)) else (_n_s_b6 < (-_n_l_b7))) if _S.truth(((_n_u_b5 > 1) if _S.truth((_n_u_b5 > 1)) else (_n_s_b6 < (-_n_l_b7)))) else (_n_s_b6 > _n_r_b8))):
		var _n_over_b11 = (((_n_u_b5 - 1) * _n_L) if _S.truth((_n_u_b5 > 1)) else 0)
		var _n_out_b12 = maxf(_n_over_b11,(((-_n_l_b7) - _n_s_b6) if _S.truth((_n_s_b6 < (-_n_l_b7))) else (_n_s_b6 - _n_r_b8)))
		if _S.truth(((_n_u_b5 < (1 + (float(1)/_n_L))) if _S.truth((_n_out_b12 < 1)) else (_n_out_b12 < 1))):
			_S.set_prop(_n_o_b2,"c",_S.call_value(_n_K,[0]),"=")
			_S.set_prop(_n_o_b2,"a",_n_a,"=")
		return null
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	if _S.truth(_S.named_value(_n_opts,"white")):
		return _S.set_prop(_n_o_b2,"c",_n_WHITE,"=")
	var _n_rd_b9 = _S.call_value(_n_ridge,[_n_u_b5])
	var _n_c_b10 = null
	if _S.truth((_n_u_b5 > 0.88)):
		_n_c_b10 = _n_WHITE
	else:
		if _S.truth((absf((_n_s_b6 - _n_rd_b9)) < 0.55)):
			_n_c_b10 = _S.call_value(_n_K,[6])
		else:
			if _S.truth((_n_s_b6 < _n_rd_b9)):
				_n_c_b10 = (_S.call_value(_n_K,[6]) if _S.truth(((_n_s_b6 + _n_l_b7) < 1)) else (_S.call_value(_n_K,[5]) if _S.truth(((float((_n_s_b6 + _n_l_b7))/maxf(1,(_n_rd_b9 + _n_l_b7))) > 0.55)) else _S.call_value(_n_K,[4])))
			else:
				_n_c_b10 = (_S.call_value(_n_K,[1]) if _S.truth(((_n_r_b8 - _n_s_b6) < 1.1)) else (_S.call_value(_n_K,[2]) if _S.truth(((float((_n_s_b6 - _n_rd_b9))/maxf(1,(_n_r_b8 - _n_rd_b9))) > 0.5)) else _S.call_value(_n_K,[3])))
	if _S.truth(_S.logical("&&",(((absf((_n_u_b5 - _n_jag)) * _n_L) < 0.8) if _S.truth((_n_jag >= 0)) else (_n_jag >= 0)),func():return (_n_s_b6 > _n_rd_b9))):
		_n_c_b10 = _S.call_value(_n_K,[6])
	else:
		if _S.truth(_S.logical("&&",(_S.binary("!==",_n_c_b10,_S.call_value(_n_K,[6])) if _S.truth((_n_s_b6 < _n_rd_b9)) else (_n_s_b6 < _n_rd_b9)),func():return (fmod(_S.binary("^",(floori(_n_x_b0) * 73856093),(floori(_n_y_b1) * 19349663)),997) < 30))):
			_n_c_b10 = _S.call_value(_n_K,[7])
	if _S.truth(((_n_s_b6 <= (_n_rd_b9 + 0.6)) if _S.truth((_n_glint >= 0)) else (_n_glint >= 0))):
		var _n_g_b13 = (absf((_n_u_b5 - _n_glint)) * _n_L)
		if _S.truth((_n_g_b13 < 0.8)):
			_n_c_b10 = _n_WHITE
		else:
			if _S.truth((_n_g_b13 < 1.8)):
				_n_c_b10 = _S.call_value(_n_K,[6])
	_S.set_prop(_n_o_b2,"c",_n_c_b10,"=")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.invoke(_n_R_b0,"int",[1, 3])
	var _n_branches_b2 = []
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_n_b1)):
			_S.invoke(_n_branches_b2,"push",[[(0.38 + (float((0.4 * (_n_i_b3 + _S.invoke(_n_R_b0,"range",[0.2, 0.8]))))/_n_n_b1)), (_S.invoke(_n_R_b0,"range",[0.24, 0.36]) * (1 - (_n_i_b3 * 0.15)))]])
			_n_i_b3 += 1.0
	return {"branches":_n_branches_b2,"plate":_S.invoke(_n_R_b0,"chance",[0.45]),"fork":_S.invoke(_n_R_b0,"chance",[0.45])}
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_rot_b4 = _S.arg(_args,4)
	var _n_d_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_opts_b7 = _S.coalesce(_S.arg(_args,7),func():return {})
	var _n_n_b8 = _S.prop(_n_C_b6,"length")
	var _n_a_b9 = (_S.named_value(_n_opts_b7,"a") if _S.named_value(_n_opts_b7,"a")!=null else 1)
	var _n_hot_b10 = (_S.named_value(_n_opts_b7,"hot") if _S.named_value(_n_opts_b7,"hot")!=null else 0)
	_n_rot_b4 = (floori((float(_n_rot_b4)/(float(PI)/18))+0.5) * (float(PI)/18))
	if _S.truth((_n_r_b3 < 1.2)):
		_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _n_WHITE, _n_a_b9])
		return null
	if _S.truth((_n_r_b3 < 2.6)):
		var _n_pose_b15 = fmod(floori((float((fmod(_n_rot_b4,(float(PI)/3)) + (float(PI)/3)))/(float(PI)/6))),2)
		var _n_pts_b16 = ([[1, 0], [(-1), 0], [0, 1], [0, (-1)]] if _S.truth(_n_pose_b15) else [[1, 1], [(-1), (-1)], [1, (-1)], [(-1), 1]])
		for _iter_0 in _S.array(_n_pts_b16):
			var _tuple_1 = _iter_0
			var _n_dx_b17 = _S.prop(_tuple_1,0)
			var _n_dy_b18 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + _n_dx_b17), (_n_y_b2 + _n_dy_b18), (_n_WHITE if _S.truth((_n_hot_b10 > 0.5)) else _S.index_value(_n_C_b6,(_n_n_b8 - 3))), _n_a_b9])
		_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _n_WHITE, _n_a_b9])
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 4, _S.index_value(_n_C_b6,(_n_n_b8 - 3)), (0.2 * _n_a_b9)])
		return null
	var _n_arm_b11 = (_n_WHITE if _S.truth((_n_hot_b10 > 0.5)) else _S.index_value(_n_C_b6,(_n_n_b8 - 2)))
	var _n_br_b12 = (_S.index_value(_n_C_b6,(_n_n_b8 - 2)) if _S.truth((_n_hot_b10 > 0.5)) else _S.index_value(_n_C_b6,(_n_n_b8 - 3)))
	var _n_big_b13 = (_n_r_b3 >= 7)
	var _n_branches_b14 = ([] if _S.truth((_n_r_b3 < 4)) else (_S.invoke(_S.named_value(_n_d_b5,"branches"),"slice",[0, 2]) if _S.truth(_n_big_b13) else [[0.58, 0.36]]))
	if true:
		var _n_k_b19 = 0
		while _S.truth((_n_k_b19 < 6)):
			var _n_g_b20 = (_n_rot_b4 + (float((_n_k_b19 * _n_TAU))/6))
			var _n_ca_b21 = cos(_n_g_b20)
			var _n_sa_b22 = sin(_n_g_b20)
			_S.invoke(_n_p_b0,"line",[_n_x_b1, _n_y_b2, (_n_x_b1 + (_n_ca_b21 * _n_r_b3)), (_n_y_b2 + (_n_sa_b22 * _n_r_b3)), _n_arm_b11, _n_a_b9])
			for _iter_2 in _S.array(_n_branches_b14):
				var _tuple_3 = _iter_2
				var _n_u_b23 = _S.prop(_tuple_3,0)
				var _n_l_b24 = _S.prop(_tuple_3,1)
				var _n_bx_b25 = (_n_x_b1 + ((_n_ca_b21 * _n_r_b3) * _n_u_b23))
				var _n_by_b26 = (_n_y_b2 + ((_n_sa_b22 * _n_r_b3) * _n_u_b23))
				var _n_bl_b27 = maxf(1,(_n_r_b3 * _n_l_b24))
				for _iter_4 in _S.array([(-1), 1]):
					var _n_s_b28 = _iter_4
					_S.invoke(_n_p_b0,"line",[_n_bx_b25, _n_by_b26, (_n_bx_b25 + (cos((_n_g_b20 + (float((_n_s_b28 * PI))/3))) * _n_bl_b27)), (_n_by_b26 + (sin((_n_g_b20 + (float((_n_s_b28 * PI))/3))) * _n_bl_b27)), _n_br_b12, _n_a_b9])
			if _S.truth((not _S.truth(_S.named_value(_n_d_b5,"plate")) if _S.truth((_n_big_b13 if _S.truth(_S.named_value(_n_d_b5,"fork")) else _S.named_value(_n_d_b5,"fork"))) else (_n_big_b13 if _S.truth(_S.named_value(_n_d_b5,"fork")) else _S.named_value(_n_d_b5,"fork")))):
				for _iter_5 in _S.array([(-1), 1]):
					var _n_s_b29 = _iter_5
					_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_ca_b21 * _n_r_b3)) + (cos((_n_g_b20 + (_n_s_b29 * 0.9))) * 1.2)), ((_n_y_b2 + (_n_sa_b22 * _n_r_b3)) + (sin((_n_g_b20 + (_n_s_b29 * 0.9))) * 1.2)), _n_br_b12, _n_a_b9])
			_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_ca_b21 * _n_r_b3)), (_n_y_b2 + (_n_sa_b22 * _n_r_b3)), _n_WHITE, _n_a_b9])
			_n_k_b19 += 1.0
	if _S.truth((_n_big_b13 if _S.truth(_S.named_value(_n_d_b5,"plate")) else _S.named_value(_n_d_b5,"plate"))):
		var _n_q_b30 = (_n_r_b3 * 0.34)
		if true:
			var _n_k_b31 = 0
			while _S.truth((_n_k_b31 < 6)):
				var _n_g0_b32 = ((_n_rot_b4 + (float(PI)/6)) + (float((_n_k_b31 * _n_TAU))/6))
				var _n_g1_b33 = (_n_g0_b32 + (float(_n_TAU)/6))
				_S.invoke(_n_p_b0,"line",[(_n_x_b1 + (cos(_n_g0_b32) * _n_q_b30)), (_n_y_b2 + (sin(_n_g0_b32) * _n_q_b30)), (_n_x_b1 + (cos(_n_g1_b33) * _n_q_b30)), (_n_y_b2 + (sin(_n_g1_b33) * _n_q_b30)), _S.index_value(_n_C_b6,(_n_n_b8 - 3)), _n_a_b9])
				_n_k_b31 += 1.0
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (3 + (_n_r_b3 * 1.2)), _S.index_value(_n_C_b6,(_n_n_b8 - 4)), ((0.14 + (0.35 * _n_hot_b10)) * _n_a_b9)])
	if _S.truth((_n_hot_b10 > 0.3)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (2 + (_n_r_b3 * 0.5)), _n_WHITE, ((0.3 * _n_hot_b10) * _n_a_b9)])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "systems", _args.slice(2))
	_S.define(_e, "left", _S.invoke(_S.read(_e, "Math"), "max", [0.001, _S.binary("-", _S.binary("-", _S.read(_e, "D"), 0.05), _S.read(_e, "t"))]))
	for _v39 in _S.array(_S.read(_e, "systems")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "sys", _v39)
		for _v41 in _S.array(_S.prop(_S.read(_v40, "sys"), "list")):
			var _v42 = _S.scope(_v40)
			_S.define(_v42, "q", _v41)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "q"), "life"), _S.read(_v42, "left"))):
				_S.set_prop(_S.read(_v42, "q"), "life", _S.read(_v42, "left"), "=", false)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "inside", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "n", _S.arg(_args, 4))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([])))
	_S.define(_e, "out", [])
	_S.define(_e, "step", _S.logical("??", _S.prop(_S.read(_e, "opts"), "step"), func(): return [1.6, 2.6]))
	_S.define(_e, "len", _S.logical("??", _S.prop(_S.read(_e, "opts"), "len"), func(): return 18))
	_S.define(_e, "fork", _S.logical("??", _S.prop(_S.read(_e, "opts"), "fork"), func(): return 0.16))
	_S.define(_e, "a0", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a0"), func(): return _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])))
	_S.define(_e, "spread", _S.logical("??", _S.prop(_S.read(_e, "opts"), "spread"), func(): return _S.read(_e, "TAU")))
	_S.define(_e, "walk", _S.function_value(_e, "_f19"))
	var _v45 = _S.scope(_e)
	_S.define(_v45, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "i"), _S.read(_v45, "n"))):
		_S.call_value(_S.read(_v45, "walk"), [_S.read(_v45, "x"), _S.read(_v45, "y"), 0, _S.binary("+", _S.binary("+", _S.read(_v45, "a0"), _S.binary("*", _S.binary("/", _S.read(_v45, "i"), _S.read(_v45, "n")), _S.read(_v45, "spread"))), _S.binary("*", _S.invoke(_S.read(_v45, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.invoke(_S.read(_v45, "Math"), "min", [1, _S.binary("/", _S.read(_v45, "spread"), _S.read(_v45, "TAU"))]))), _S.read(_v45, "len"), 0])
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f19(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_step = _S.read(_parent,"step")
	var _n_inside = _S.read(_parent,"inside")
	var _n_fork = _S.read(_parent,"fork")
	var _n_walk = _S.read(_parent,"walk")
	var _n_out = _S.read(_parent,"out")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_len_b4 = _S.arg(_args,4)
	var _n_depth_b5 = _S.arg(_args,5)
	var _n_pts_b6 = [[_n_x_b0, _n_y_b1, _n_d_b2]]
	if true:
		var _n_s_b7 = 0
		while _S.truth((_n_s_b7 < _n_len_b4)):
			_n_a_b3 += _S.invoke(_n_R,"range",[(-0.55), 0.55])
			var _n_st_b8 = _S.invoke(_n_R,"range",[_S.index_value(_n_step,0), _S.index_value(_n_step,1)])
			var _n_nx_b9 = (_n_x_b0 + (cos(_n_a_b3) * _n_st_b8))
			var _n_ny_b10 = (_n_y_b1 + (sin(_n_a_b3) * _n_st_b8))
			if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_nx_b9, _n_ny_b10]))):
				break
			_n_x_b0 = _n_nx_b9
			_n_y_b1 = _n_ny_b10
			_n_d_b2 += _n_st_b8
			_S.invoke(_n_pts_b6,"push",[[_n_x_b0, _n_y_b1, _n_d_b2]])
			if _S.truth((_S.invoke(_n_R,"chance",[_n_fork]) if _S.truth(((_S.prop(_n_pts_b6,"length") > 2) if _S.truth((_n_depth_b5 < 2)) else (_n_depth_b5 < 2))) else ((_S.prop(_n_pts_b6,"length") > 2) if _S.truth((_n_depth_b5 < 2)) else (_n_depth_b5 < 2)))):
				_S.call_value(_n_walk,[_n_x_b0, _n_y_b1, _n_d_b2, (_n_a_b3 + (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[0.6, 1.2]))), ceili((_n_len_b4 * 0.5)), (_n_depth_b5 + 1)])
			_n_s_b7 += 1.0
	if _S.truth((_S.prop(_n_pts_b6,"length") > 1)):
		_S.invoke(_n_out,"push",[_n_pts_b6])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cracks_b1 = _S.arg(_args,1)
	var _n_reach_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_opts_b4 = _S.coalesce(_S.arg(_args,4),func():return {})
	var _n_n_b5 = _S.prop(_n_C_b3,"length")
	var _n_ox_b6 = (_S.named_value(_n_opts_b4,"ox") if _S.named_value(_n_opts_b4,"ox")!=null else 0)
	var _n_oy_b7 = (_S.named_value(_n_opts_b4,"oy") if _S.named_value(_n_opts_b4,"oy")!=null else 0)
	var _n_hot_b8 = (_S.named_value(_n_opts_b4,"hot") if _S.named_value(_n_opts_b4,"hot")!=null else true)
	var _n_a_b9 = (_S.named_value(_n_opts_b4,"a") if _S.named_value(_n_opts_b4,"a")!=null else 1)
	var _n_seg_b10 = _S.function_value(_S.capture(_parent,{"reach":_n_reach_b2,"ox":_n_ox_b6,"oy":_n_oy_b7,"this":_this}),"_f21")
	for _iter_0 in _S.array(_n_cracks_b1):
		var _n_pts_b11 = _iter_0
		if true:
			var _n_i_b12 = 1
			while _S.truth((_n_i_b12 < _S.prop(_n_pts_b11,"length"))):
				var _n_s_b13 = _S.call_value(_n_seg_b10,[_n_pts_b11, _n_i_b12])
				if _S.truth(not _S.truth(_n_s_b13)):
					break
				_S.invoke(_n_p_b0,"line",[_S.index_value(_n_s_b13,0), (_S.index_value(_n_s_b13,1) + 1), _S.index_value(_n_s_b13,2), (_S.index_value(_n_s_b13,3) + 1), _S.index_value(_n_C_b3,minf(2,(_n_n_b5 - 1))), _n_a_b9])
				_n_i_b12 += 1.0
	for _iter_1 in _S.array(_n_cracks_b1):
		var _n_pts_b14 = _iter_1
		if true:
			var _n_i_b15 = 1
			while _S.truth((_n_i_b15 < _S.prop(_n_pts_b14,"length"))):
				var _n_s_b16 = _S.call_value(_n_seg_b10,[_n_pts_b14, _n_i_b15])
				if _S.truth(not _S.truth(_n_s_b16)):
					break
				var _n_tip_b17 = (_S.index_value(_n_s_b16,4) if _S.truth(_n_hot_b8) else _n_hot_b8)
				_S.invoke(_n_p_b0,"line",[_S.index_value(_n_s_b16,0), _S.index_value(_n_s_b16,1), _S.index_value(_n_s_b16,2), _S.index_value(_n_s_b16,3), (_n_WHITE if _S.truth(_n_tip_b17) else _S.index_value(_n_C_b3,(_n_n_b5 - 2))), _n_a_b9])
				if _S.truth(_n_tip_b17):
					_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_s_b16,2), _S.index_value(_n_s_b16,3), 5, _S.index_value(_n_C_b3,(_n_n_b5 - 3)), (0.5 * _n_a_b9)])
				else:
					if _S.truth(fmod(_n_i_b15,2)):
						_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_s_b16,2), _S.index_value(_n_s_b16,3), 3, _S.index_value(_n_C_b3,(_n_n_b5 - 3)), (0.18 * _n_a_b9)])
				_n_i_b15 += 1.0
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_reach = _S.read(_parent,"reach")
	var _n_ox = _S.read(_parent,"ox")
	var _n_oy = _S.read(_parent,"oy")
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.index_value(_n_pts_b0,(_n_i_b1 - 1))
	var _n_x0_b2 = _S.prop(_tuple_0,0)
	var _n_y0_b3 = _S.prop(_tuple_0,1)
	var _n_d0_b4 = _S.prop(_tuple_0,2)
	var _tuple_1 = _S.index_value(_n_pts_b0,_n_i_b1)
	var _n_x1_b5 = _S.prop(_tuple_1,0)
	var _n_y1_b6 = _S.prop(_tuple_1,1)
	var _n_d1_b7 = _S.prop(_tuple_1,2)
	if _S.truth((_n_d0_b4 >= _n_reach)):
		return null
	var _n_u_b8 = minf(1,(float((_n_reach - _n_d0_b4))/maxf(0.01,(_n_d1_b7 - _n_d0_b4))))
	return [(_n_x0_b2 + _n_ox), (_n_y0_b3 + _n_oy), ((_n_x0_b2 + _n_ox) + ((_n_x1_b5 - _n_x0_b2) * _n_u_b8)), ((_n_y0_b3 + _n_oy) + ((_n_y1_b6 - _n_y0_b3) * _n_u_b8)), ((_n_reach - _n_d1_b7) < 3)]
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_opts_b0 = _S.coalesce(_S.arg(_args,0),func():return {})
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"ground",(_S.named_value(_n_opts_b0,"ground") if _S.named_value(_n_opts_b0,"ground")!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f23")),"=")
	_S.set_prop(_this,"onLand",(_S.named_value(_n_opts_b0,"onLand") if _S.named_value(_n_opts_b0,"onLand")!=null else null),"=")
	_S.set_prop(_this,"onCrumble",(_S.named_value(_n_opts_b0,"onCrumble") if _S.named_value(_n_opts_b0,"onCrumble")!=null else null),"=")
	_S.set_prop(_this,"onSkid",(_S.named_value(_n_opts_b0,"onSkid") if _S.named_value(_n_opts_b0,"onSkid")!=null else null),"=")
	return null

static func _f23(_parent,_args:Array,_this=null):
	return INF
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "q"), "life"), func(): return 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"f": 0}, {"vf": 0}, {"lit": 0.6}, {"g": 1}, {"drag": 0.3}, {"bounce": 0.35}, {"rest": false}, {"brittle": false}, _S.read(_e, "q"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f25(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_ca_b1 = cos(_S.named_value(_n_q_b0,"a"))
	var _n_sa_b2 = sin(_S.named_value(_n_q_b0,"a"))
	var _n_k_b3 = cos(_S.named_value(_n_q_b0,"f"))
	return _S.invoke(_S.named_value(_n_q_b0,"pts"),"map",[_S.function_value(_S.capture(_parent,{"k":_n_k_b3,"q":_n_q_b0,"ca":_n_ca_b1,"sa":_n_sa_b2,"this":_this}),"_f27")])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_q = _S.read(_parent,"q")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_yy_b2 = (_n_y_b1 * _n_k)
	return [((_S.named_value(_n_q,"x") + (_n_x_b0 * _n_ca)) - (_n_yy_b2 * _n_sa)), ((_S.named_value(_n_q,"y") + (_n_x_b0 * _n_sa)) + (_n_yy_b2 * _n_ca))]
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_low_b1 = (-INF)
	for _iter_0 in _S.array(_S.invoke(_this,"corners",[_n_q_b0])):
		var _n_c_b2 = _iter_0
		_n_low_b1 = maxf(_n_low_b1,_S.index_value(_n_c_b2,1))
	return _n_low_b1
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v59 = _S.scope(_e)
	_S.define(_v59, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v59, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v59, "i"), 0)):
		var _v60 = _S.scope(_v59)
		_S.define(_v60, "q", _S.prop(_S.prop(_S.read(_v60, "this"), "list"), _S.read(_v60, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v60, "q"), "life", _S.read(_v60, "dt"), "-=", false), 0)):
			var _v61 = _S.scope(_v60)
			_S.invoke(_S.prop(_S.read(_v61, "this"), "list"), "splice", [_S.read(_v61, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.define(_v60, "floor", _S.binary("-", _S.invoke(_S.read(_v60, "this"), "ground", [_S.prop(_S.read(_v60, "q"), "x")]), 0.5))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v60, "q"), "rest"), func(): return _S.binary("!==", _S.prop(_S.read(_v60, "q"), "crumble"), null)), func(): return _S.binary(">", _S.set_prop(_S.read(_v60, "q"), "restT", _S.binary("+", _S.logical("??", _S.prop(_S.read(_v60, "q"), "restT"), func(): return 0), _S.read(_v60, "dt")), "=", false), _S.prop(_S.read(_v60, "q"), "crumble")))):
			var _v62 = _S.scope(_v60)
			_S.optional_call(_S.prop(_S.read(_v62, "this"), "onCrumble"), [_S.read(_v62, "q")])
			_S.invoke(_S.prop(_S.read(_v62, "this"), "list"), "splice", [_S.read(_v62, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v60, "q"), "rest")):
			var _v63 = _S.scope(_v60)
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v63, "Math"), "abs", [_S.prop(_S.read(_v63, "q"), "vx")]), 8)):
				_S.optional_call(_S.prop(_S.read(_v63, "this"), "onSkid"), [_S.read(_v63, "q"), _S.prop(_S.read(_v63, "q"), "x"), _S.binary("+", _S.read(_v63, "floor"), 0.5)])
			_S.set_prop(_S.read(_v63, "q"), "x", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vx"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vx"), 7), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "a", _S.binary("*", _S.prop(_S.read(_v63, "q"), "va"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "va", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "va"), 9), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "vf", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vf"), 9), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "f", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vf"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "y", _S.binary("-", _S.invoke(_S.read(_v63, "this"), "seat", [_S.read(_v63, "q")]), _S.read(_v63, "floor")), "-=", false)
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v60, "q"), "vy", _S.binary("*", _S.binary("*", _S.read(_v60, "GRAVITY"), _S.prop(_S.read(_v60, "q"), "g")), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vx"), _S.prop(_S.read(_v60, "q"), "drag")), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vy"), _S.prop(_S.read(_v60, "q"), "drag")), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "q"), "x", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vx"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "y", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vy"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "a", _S.binary("*", _S.prop(_S.read(_v60, "q"), "va"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "f", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vf"), _S.read(_v60, "dt")), "+=", false)
		_S.define(_v60, "low", _S.invoke(_S.read(_v60, "this"), "seat", [_S.read(_v60, "q")]))
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.prop(_S.read(_v60, "q"), "g"), 0), func(): return _S.binary("<", _S.read(_v60, "low"), _S.read(_v60, "floor"))), func(): return _S.binary("<=", _S.prop(_S.read(_v60, "q"), "vy"), 0))):
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v60, "q"), "y", _S.binary("-", _S.read(_v60, "low"), _S.read(_v60, "floor")), "-=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70)):
			_S.last([_S.set_prop(_S.read(_v60, "q"), "hits", _S.binary("+", _S.logical("??", _S.prop(_S.read(_v60, "q"), "hits"), func(): return 0), 1), "=", false), _S.optional_call(_S.prop(_S.read(_v60, "this"), "onLand"), [_S.read(_v60, "q"), _S.prop(_S.read(_v60, "q"), "x"), _S.binary("+", _S.read(_v60, "floor"), 0.5), _S.prop(_S.read(_v60, "q"), "vy")])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v60, "q"), "brittle"), func(): return _S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70)), func(): return _S.binary(">=", _S.prop(_S.read(_v60, "q"), "hits"), _S.prop(_S.read(_v60, "q"), "brittle")))):
			var _v64 = _S.scope(_v60)
			_S.invoke(_S.prop(_S.read(_v64, "this"), "list"), "splice", [_S.read(_v64, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70), func(): return _S.binary(">", _S.prop(_S.read(_v60, "q"), "bounce"), 0))):
			var _v65 = _S.scope(_v60)
			_S.set_prop(_S.read(_v65, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v65, "q"), "vy")), _S.prop(_S.read(_v65, "q"), "bounce")), "=", false)
			_S.set_prop(_S.read(_v65, "q"), "vx", 0.75, "*=", false)
			_S.set_prop(_S.read(_v65, "q"), "va", 0.6, "*=", false)
			_S.set_prop(_S.read(_v65, "q"), "vf", 0.5, "*=", false)
		else:
			var _v66 = _S.scope(_v60)
			_S.set_prop(_S.read(_v66, "q"), "rest", true, "=", false)
			_S.set_prop(_S.read(_v66, "q"), "vy", 0, "=", false)
		_v59 = _S.iteration(_v59)
		_S.write(_v59, "i", 1, "-=", true)
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	for _v67 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v68 = _S.scope(_e)
		_S.define(_v68, "q", _v67)
		var _v69 = _S.scope(_v68)
		_S.define(_v69, "a", _S.invoke(_S.read(_v69, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v69, "q"), "life"), 0.35)]))
		_S.define(_v69, "pts", _S.invoke(_S.read(_v69, "this"), "corners", [_S.read(_v69, "q")]))
		_S.define(_v69, "k", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.prop(_S.read(_v69, "q"), "f")]))
		_S.define(_v69, "face", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.read(_v69, "k")]))
		_S.define(_v69, "lv", _S.binary("*", _S.prop(_S.read(_v69, "q"), "lit"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v69, "face")))))
		_S.define(_v69, "flash", _S.logical("&&", _S.binary(">", _S.read(_v69, "face"), 0.97), func(): return _S.unary("!", _S.prop(_S.read(_v69, "q"), "rest"))))
		if _S.truth(_S.binary(">", _S.read(_v69, "face"), 0.25)):
			var _v70 = _S.scope(_v69)
			if _S.truth(_S.logical("&&", _S.prop(_S.read(_v70, "q"), "solid"), func(): return _S.binary("!==", _S.prop(_S.read(_v70, "q"), "tone"), null))):
				var _v71 = _S.scope(_v70)
				_S.invoke(_S.read(_v71, "p"), "poly", [_S.read(_v71, "pts"), (_S.prop(_S.read(_v71, "C"), _S.binary("-", _S.read(_v71, "n"), 1)) if _S.truth(_S.read(_v71, "flash")) else _S.prop(_S.read(_v71, "C"), _S.call_value(_S.read(_v71, "clamp"), [_S.invoke(_S.read(_v71, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v71, "q"), "tone"), 5), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v71, "face")))))]), 1, _S.binary("-", _S.read(_v71, "n"), 2)]))), _S.read(_v71, "a")])
			else:
				if _S.truth(_S.prop(_S.read(_v70, "q"), "solid")):
					var _v72 = _S.scope(_v70)
					_S.define(_v72, "rr", _S.logical("??", _S.prop(_S.read(_v72, "q"), "ridge"), func(): return _S.binary("/", _S.unary("-", _S.prop(_S.read(_v72, "Math"), "PI")), 2)))
					_S.define(_v72, "cr", _S.invoke(_S.read(_v72, "Math"), "cos", [_S.read(_v72, "rr")]))
					_S.define(_v72, "sr", _S.invoke(_S.read(_v72, "Math"), "sin", [_S.read(_v72, "rr")]))
					_S.define(_v72, "ca", _S.invoke(_S.read(_v72, "Math"), "cos", [_S.prop(_S.read(_v72, "q"), "a")]))
					_S.define(_v72, "sa", _S.invoke(_S.read(_v72, "Math"), "sin", [_S.prop(_S.read(_v72, "q"), "a")]))
					_S.define(_v72, "rx", _S.binary("-", _S.binary("*", _S.read(_v72, "cr"), _S.read(_v72, "ca")), _S.binary("*", _S.binary("*", _S.read(_v72, "sr"), _S.read(_v72, "k")), _S.read(_v72, "sa"))))
					_S.define(_v72, "ry", _S.binary("+", _S.binary("*", _S.read(_v72, "cr"), _S.read(_v72, "sa")), _S.binary("*", _S.binary("*", _S.read(_v72, "sr"), _S.read(_v72, "k")), _S.read(_v72, "ca"))))
					_S.define(_v72, "nx", _S.unary("-", _S.read(_v72, "ry")))
					_S.define(_v72, "ny", _S.read(_v72, "rx"))
					if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v72, "nx"), _S.unary("-", 0.55)), _S.binary("*", _S.read(_v72, "ny"), _S.unary("-", 0.84))), 0)):
						_S.last([_S.write(_v72, "nx", _S.unary("-", _S.read(_v72, "nx")), "=", false), _S.write(_v72, "ny", _S.unary("-", _S.read(_v72, "ny")), "=", false)])
					_S.define(_v72, "lit", (_S.prop(_S.read(_v72, "C"), _S.binary("-", _S.read(_v72, "n"), 1)) if _S.truth(_S.read(_v72, "flash")) else _S.prop(_S.read(_v72, "C"), _S.call_value(_S.read(_v72, "clamp"), [_S.invoke(_S.read(_v72, "Math"), "round", [_S.binary("+", 3, _S.binary("*", _S.read(_v72, "lv"), 3))]), 3, _S.binary("-", _S.read(_v72, "n"), 2)]))))
					_S.define(_v72, "deep", _S.prop(_S.read(_v72, "C"), _S.call_value(_S.read(_v72, "clamp"), [_S.invoke(_S.read(_v72, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.read(_v72, "lv"), 2))]), 1, 3])))
					_S.invoke(_S.read(_v72, "p"), "poly", [_S.read(_v72, "pts"), _S.function_value(_v72, "_f31"), _S.read(_v72, "a")])
				else:
					_S.call_value(_S.read(_v70, "glassPoly"), [_S.read(_v70, "p"), _S.read(_v70, "pts"), (_S.prop(_S.read(_v70, "C"), _S.binary("-", _S.read(_v70, "n"), 1)) if _S.truth(_S.read(_v70, "flash")) else _S.prop(_S.read(_v70, "C"), _S.call_value(_S.read(_v70, "clamp"), [_S.invoke(_S.read(_v70, "Math"), "round", [_S.binary("+", 3, _S.binary("*", _S.read(_v70, "lv"), 3))]), 3, _S.binary("-", _S.read(_v70, "n"), 2)]))), _S.binary("*", _S.binary("+", _S.binary("+", 0.3, _S.binary("*", 0.35, _S.read(_v70, "lv"))), (0.3 if _S.truth(_S.read(_v70, "flash")) else 0)), _S.read(_v70, "a"))])
		_S.define(_v69, "cx", 0)
		_S.define(_v69, "cy", 0)
		_S.define(_v69, "top", 0)
		for _v73 in _S.array(_S.read(_v69, "pts")):
			var _v74 = _S.scope(_v69)
			var _v75 = _v73
			_S.define(_v74, "x", _S.prop(_v75, 0))
			_S.define(_v74, "y", _S.prop(_v75, 1))
			_S.last([_S.write(_v74, "cx", _S.read(_v74, "x"), "+=", false), _S.write(_v74, "cy", _S.read(_v74, "y"), "+=", false)])
		_S.write(_v69, "cx", _S.prop(_S.read(_v69, "pts"), "length"), "/=", false)
		_S.write(_v69, "cy", _S.prop(_S.read(_v69, "pts"), "length"), "/=", false)
		var _v76 = _S.scope(_v69)
		_S.define(_v76, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v76, "i"), _S.prop(_S.read(_v76, "pts"), "length"))):
			var _v77 = _S.scope(_v76)
			var _v78 = _S.prop(_S.read(_v77, "pts"), _S.read(_v77, "i"))
			_S.define(_v77, "x0", _S.prop(_v78, 0))
			_S.define(_v77, "y0", _S.prop(_v78, 1))
			var _v79 = _S.prop(_S.read(_v77, "pts"), _S.binary("%", _S.binary("+", _S.read(_v77, "i"), 1), _S.prop(_S.read(_v77, "pts"), "length")))
			_S.define(_v77, "x1", _S.prop(_v79, 0))
			_S.define(_v77, "y1", _S.prop(_v79, 1))
			_S.define(_v77, "nx", _S.binary("-", _S.read(_v77, "y1"), _S.read(_v77, "y0")))
			_S.define(_v77, "ny", _S.binary("-", _S.read(_v77, "x0"), _S.read(_v77, "x1")))
			if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v77, "nx"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v77, "x0"), _S.read(_v77, "x1")), 2), _S.read(_v77, "cx"))), _S.binary("*", _S.read(_v77, "ny"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v77, "y0"), _S.read(_v77, "y1")), 2), _S.read(_v77, "cy")))), 0)):
				_S.last([_S.write(_v77, "nx", _S.unary("-", _S.read(_v77, "nx")), "=", false), _S.write(_v77, "ny", _S.unary("-", _S.read(_v77, "ny")), "=", false)])
			_S.define(_v77, "l", _S.logical("||", _S.invoke(_S.read(_v77, "Math"), "hypot", [_S.read(_v77, "nx"), _S.read(_v77, "ny")]), func(): return 1))
			_S.define(_v77, "lit", _S.binary("/", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v77, "nx")), 0.55), _S.binary("*", _S.read(_v77, "ny"), 0.84)), _S.read(_v77, "l")))
			_S.invoke(_S.read(_v77, "p"), "line", [_S.read(_v77, "x0"), _S.read(_v77, "y0"), _S.read(_v77, "x1"), _S.read(_v77, "y1"), (_S.prop(_S.read(_v77, "C"), _S.binary("-", _S.read(_v77, "n"), 1)) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v77, "face"), 0.25), func(): return _S.binary(">", _S.read(_v77, "lit"), 0.35))) else (_S.prop(_S.read(_v77, "C"), _S.binary("-", _S.read(_v77, "n"), 2)) if _S.truth(_S.binary(">", _S.read(_v77, "lit"), _S.unary("-", 0.25))) else (_S.prop(_S.read(_v77, "C"), 1) if _S.truth(_S.prop(_S.read(_v77, "q"), "solid")) else _S.prop(_S.read(_v77, "C"), _S.invoke(_S.read(_v77, "Math"), "max", [2, _S.binary("-", _S.read(_v77, "n"), 4)]))))), _S.read(_v77, "a")])
			if _S.truth(_S.binary("<", _S.prop(_S.prop(_S.read(_v77, "pts"), _S.read(_v77, "i")), 1), _S.prop(_S.prop(_S.read(_v77, "pts"), _S.read(_v77, "top")), 1))):
				_S.write(_v77, "top", _S.read(_v77, "i"), "=", false)
			_v76 = _S.iteration(_v76)
			_S.write(_v76, "i", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v69, "face"), 0.7)):
			_S.invoke(_S.read(_v69, "p"), "dot", [_S.prop(_S.prop(_S.read(_v69, "pts"), _S.read(_v69, "top")), 0), _S.prop(_S.prop(_S.read(_v69, "pts"), _S.read(_v69, "top")), 1), _S.read(_v69, "WHITE"), _S.read(_v69, "a")])
		_S.invoke(_S.read(_v69, "p"), "glow", [_S.read(_v69, "cx"), _S.read(_v69, "cy"), 5, _S.prop(_S.read(_v69, "C"), _S.binary("-", _S.read(_v69, "n"), 3)), _S.binary("*", (0.5 if _S.truth(_S.read(_v69, "flash")) else 0.14), _S.read(_v69, "a"))])
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_lit = _S.read(_parent,"lit")
	var _n_C = _S.read(_parent,"C")
	var _n_n = _S.read(_parent,"n")
	var _n_deep = _S.read(_parent,"deep")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = (((_n_x_b0 - _S.named_value(_n_q,"x")) * _n_nx) + ((_n_y_b1 - _S.named_value(_n_q,"y")) * _n_ny))
	return (_n_lit if _S.truth((_n_d_b2 > 0.6)) else (_S.index_value(_n_C,(_n_n - 2)) if _S.truth((_n_d_b2 > (-0.6))) else _n_deep))
	return null
