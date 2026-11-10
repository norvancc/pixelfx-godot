@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"actor_shape","_f3":"recolor","_f4":"oval","_f5":"feather","_f15":"feathers_update","_f16":"feathers_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "shapeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "recolor", _S.function_value(_e, "_f3"))
	_S.define(_e, "oval", _S.function_value(_e, "_f4"))
	_S.define(_e, "feather", _S.function_value(_e, "_f5"))
	_S.define(_e, "plus", _S.function_value(_e, "_f7"))
	_S.define(_e, "GOLD", ["#3b1d2a", "#7a3a2c", "#c4652e", "#f0a040", "#ffd25e", "#fff0a0", "#fffbe0", "#ffffff"])
	_exports["GOLD"] = _S.read(_e, "GOLD")
	_S.define(_e, "GREEN", ["#0e2a24", "#14472f", "#1d6e3a", "#2f9a45", "#5cc654", "#a0e46c", "#dcffb4", "#ffffff"])
	_exports["GREEN"] = _S.read(_e, "GREEN")
	_S.define(_e, "ASH", ["#16131c", "#26222f", "#3a3546", "#524c5e", "#6e6878", "#8c8796"])
	_exports["ASH"] = _S.read(_e, "ASH")
	_S.define(_e, "SHAPES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["shapeOf"] = _S.read(_e, "shapeOf")
	_exports["recolor"] = _S.read(_e, "recolor")
	_S.define(_e, "toneOf", _S.function_value(_e, "_f9"))
	_exports["toneOf"] = _S.read(_e, "toneOf")
	_exports["oval"] = _S.read(_e, "oval")
	_S.define(_e, "FAR", _S.function_value(_e, "_f10"))
	_exports["FAR"] = _S.read(_e, "FAR")
	_S.define(_e, "NEAR", _S.function_value(_e, "_f11"))
	_exports["NEAR"] = _S.read(_e, "NEAR")
	_exports["feather"] = _S.read(_e, "feather")
	_S.define(_e, "Feathers", _S.class_value("Feathers", _S.function_value(_e, "_f12"), {"add": _S.function_value(_e, "_f13"), "update": _S.function_value(_e, "_f15"), "draw": _S.function_value(_e, "_f16")}, {"count": _S.function_value(_e, "_f14")}, {}, null))
	_exports["Feathers"] = _S.read(_e, "Feathers")
	_exports["plus"] = _S.read(_e, "plus")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SHAPES = _S.read(_parent,"SHAPES")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.invoke(_n_SHAPES,"get",[_S.named_value(_n_A_b0,"mask")])
	if _S.truth((_S.binary("===",_S.named_value(_n_s_b1,"y"),_S.named_value(_n_A_b0,"y")) if _S.truth((_S.binary("===",_S.named_value(_n_s_b1,"x"),_S.named_value(_n_A_b0,"x")) if _S.truth(_n_s_b1) else _n_s_b1)) else (_S.binary("===",_S.named_value(_n_s_b1,"x"),_S.named_value(_n_A_b0,"x")) if _S.truth(_n_s_b1) else _n_s_b1))):
		return _n_s_b1
	var _n_m_b2 = _S.named_value(_n_A_b0,"mask")
	var _n_inside_b3 = _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"this":_this}),"_f1")
	var _n_edge_b4 = []
	var _n_out_b5 = []
	if true:
		var _n_j_b6 = (-1)
		while _S.truth((_n_j_b6 <= _S.named_value(_n_m_b2,"h"))):
			if true:
				var _n_i_b7 = (-1)
				while _S.truth((_n_i_b7 <= _S.named_value(_n_m_b2,"w"))):
					var _n_nb_b8 = (((_S.call_value(_n_inside_b3,[(_n_i_b7 - 1), _n_j_b6]) + _S.call_value(_n_inside_b3,[(_n_i_b7 + 1), _n_j_b6])) + _S.call_value(_n_inside_b3,[_n_i_b7, (_n_j_b6 - 1)])) + _S.call_value(_n_inside_b3,[_n_i_b7, (_n_j_b6 + 1)]))
					if _S.truth(_S.call_value(_n_inside_b3,[_n_i_b7, _n_j_b6])):
						if _S.truth((_n_nb_b8 < 4)):
							_S.invoke(_n_edge_b4,"push",[[(_S.named_value(_n_A_b0,"x") + _n_i_b7), (_S.named_value(_n_A_b0,"y") + _n_j_b6)]])
					else:
						if _S.truth(_n_nb_b8):
							_S.invoke(_n_out_b5,"push",[[(_S.named_value(_n_A_b0,"x") + _n_i_b7), (_S.named_value(_n_A_b0,"y") + _n_j_b6)]])
					_n_i_b7 += 1.0
			_n_j_b6 += 1.0
	_n_s_b1 = {"x":_S.named_value(_n_A_b0,"x"),"y":_S.named_value(_n_A_b0,"y"),"edge":_n_edge_b4,"out":_n_out_b5,"top":_S.named_value(_n_A_b0,"y"),"bottom":(_S.named_value(_n_A_b0,"y") + _S.named_value(_n_m_b2,"h")),"at":_S.function_value(_S.capture(_parent,{"inside":_n_inside_b3,"A":_n_A_b0,"this":_this}),"_f2")}
	_S.invoke(_n_SHAPES,"set",[_S.named_value(_n_A_b0,"mask"), _n_s_b1])
	return _n_s_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return ((_S.index_value(_S.named_value(_n_m,"data"),((_n_j_b1 * _S.named_value(_n_m,"w")) + _n_i_b0)) > 0) if _S.truth(((_n_j_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_inside,[(floori(_n_x_b0) - _S.named_value(_n_A,"x")), (floori(_n_y_b1) - _S.named_value(_n_A,"y"))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_fn_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_m_b4 = _S.named_value(_n_A_b1,"mask")
	var _n_P_b5 = _S.named_value(_n_A_b1,"pixels")
	var _n_fa_b6 = _S.binary("===",_S.unary("typeof",_n_a_b3),"function")
	if _S.truth(not _S.truth(_n_P_b5)):
		return null
	if true:
		var _n_j_b7 = 0
		while _S.truth((_n_j_b7 < _S.named_value(_n_m_b4,"h"))):
			if true:
				var _n_i_b8 = 0
				while _S.truth((_n_i_b8 < _S.named_value(_n_m_b4,"w"))):
					var _n_c_b9 = _S.index_value(_n_P_b5,((_n_j_b7 * _S.named_value(_n_m_b4,"w")) + _n_i_b8))
					if _S.truth(not _S.truth(_n_c_b9)):
						_n_i_b8 += 1.0
						continue
					var _n_x_b10 = (_S.named_value(_n_A_b1,"x") + _n_i_b8)
					var _n_y_b11 = (_S.named_value(_n_A_b1,"y") + _n_j_b7)
					var _n_n_b12 = _S.call_value(_n_fn_b2,[_n_c_b9, _n_x_b10, _n_y_b11])
					if _S.truth(_n_n_b12):
						_S.invoke(_n_p_b0,"dot",[_n_x_b10, _n_y_b11, _n_n_b12, (_S.call_value(_n_a_b3,[_n_x_b10, _n_y_b11]) if _S.truth(_n_fa_b6) else _n_a_b3)])
					_n_i_b8 += 1.0
			_n_j_b7 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_keep_b7 = _S.coalesce(_S.arg(_args,7),func():return null)
	if _S.truth((_n_rx_b3 < 0.5)):
		return null
	var _n_n_b8 = (ceili(((maxf(_n_rx_b3,_n_ry_b4) * _n_TAU) * 1.5)) + 6)
	var _n_fc_b9 = _S.binary("===",_S.unary("typeof",_n_c_b5),"function")
	var _n_fa_b10 = _S.binary("===",_S.unary("typeof",_n_a_b6),"function")
	if true:
		var _n_j_b11 = 0
		while _S.truth((_n_j_b11 < _n_n_b8)):
			var _n_g_b12 = ((float(_n_j_b11)/_n_n_b8) * _n_TAU)
			if _S.truth((not _S.truth(_S.call_value(_n_keep_b7,[_n_g_b12])) if _S.truth(_n_keep_b7) else _n_keep_b7)):
				_n_j_b11 += 1.0
				continue
			_S.invoke(_n_p_b0,"dot",[(_n_cx_b1 + (cos(_n_g_b12) * _n_rx_b3)), (_n_cy_b2 + (sin(_n_g_b12) * _n_ry_b4)), (_S.call_value(_n_c_b5,[_n_g_b12]) if _S.truth(_n_fc_b9) else _n_c_b5), (_S.call_value(_n_a_b6,[_n_g_b12]) if _S.truth(_n_fa_b10) else _n_a_b6)])
			_n_j_b11 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_ang_b3 = _S.arg(_args,3)
	var _n_len_b4 = _S.arg(_args,4)
	var _n_wid_b5 = _S.arg(_args,5)
	var _n_R_b6 = _S.arg(_args,6)
	var _n_a_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_side_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_hot_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	var _n_quill_b10 = _S.coalesce(_S.arg(_args,10),func():return 0.02)
	if _S.truth(((_n_len_b4 < 1.5) if _S.truth((_n_len_b4 < 1.5)) else (_n_a_b7 <= 0.02))):
		return null
	var _n_n_b11 = _S.prop(_n_R_b6,"length")
	var _n_ca_b12 = cos(_n_ang_b3)
	var _n_sa_b13 = sin(_n_ang_b3)
	var _n_x1_b14 = (_n_x_b1 + (_n_ca_b12 * _n_len_b4))
	var _n_y1_b15 = (_n_y_b2 + (_n_sa_b13 * _n_len_b4))
	var _n_pad_b16 = (_n_wid_b5 + 1.2)
	var _n_h_b17 = (_n_hot_b9 > 0.5)
	var _n_edge_b18 = (_S.index_value(_n_R_b6,(_n_n_b11 - 3)) if _S.truth(_n_h_b17) else _S.index_value(_n_R_b6,(_n_n_b11 - 5)))
	var _n_lead_b19 = (_n_WHITE if _S.truth(_n_h_b17) else _S.index_value(_n_R_b6,(_n_n_b11 - 2)))
	var _n_B_b20 = ([_n_WHITE, _n_WHITE, _S.index_value(_n_R_b6,(_n_n_b11 - 2))] if _S.truth(_n_h_b17) else [_S.index_value(_n_R_b6,(_n_n_b11 - 2)), _S.index_value(_n_R_b6,(_n_n_b11 - 3)), _S.index_value(_n_R_b6,(_n_n_b11 - 4))])
	_S.invoke(_n_p_b0,"each",[(minf(_n_x_b1,_n_x1_b14) - _n_pad_b16), (minf(_n_y_b2,_n_y1_b15) - _n_pad_b16), (maxf(_n_x_b1,_n_x1_b14) + _n_pad_b16), (maxf(_n_y_b2,_n_y1_b15) + _n_pad_b16), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"ca":_n_ca_b12,"sa":_n_sa_b13,"len":_n_len_b4,"side":_n_side_b8,"wid":_n_wid_b5,"quill":_n_quill_b10,"p":_n_p_b0,"B":_n_B_b20,"a":_n_a_b7,"edge":_n_edge_b18,"lead":_n_lead_b19,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_len = _S.read(_parent,"len")
	var _n_side = _S.read(_parent,"side")
	var _n_wid = _S.read(_parent,"wid")
	var _n_quill = _S.read(_parent,"quill")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_B = _S.read(_parent,"B")
	var _n_a = _S.read(_parent,"a")
	var _n_edge = _S.read(_parent,"edge")
	var _n_lead = _S.read(_parent,"lead")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_dx_b4 = (_n_px_b0 - _n_x)
	var _n_dy_b5 = (_n_py_b1 - _n_y)
	var _n_u_b6 = (float(((_n_dx_b4 * _n_ca) + (_n_dy_b5 * _n_sa)))/_n_len)
	if _S.truth(((_n_u_b6 < 0) if _S.truth((_n_u_b6 < 0)) else (_n_u_b6 > 1.05))):
		return null
	var _n_v_b7 = ((((-_n_dx_b4) * _n_sa) + (_n_dy_b5 * _n_ca)) * _n_side)
	var _n_av_b8 = absf(_n_v_b7)
	var _n_w_b9 = ((_n_wid * sqrt(clampf((float((_n_u_b6 - _n_quill))/0.22),0.0,1.0))) * sqrt(maxf(0,(1 - pow(maxf(0,(float((_n_u_b6 - 0.55))/0.47)),2)))))
	var _n_lim_b10 = ((_n_w_b9 * 0.42) if _S.truth((_n_v_b7 < 0)) else _n_w_b9)
	var _n_fade_b11 = (1 if _S.truth((_n_u_b6 < 0.72)) else (1 - ((_n_u_b6 - 0.72) * 1.6)))
	if _S.truth(((_n_u_b6 < 0.9) if _S.truth((_n_av_b8 < 0.5)) else (_n_av_b8 < 0.5))):
		return _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, (_n_WHITE if _S.truth((_n_u_b6 < 0.5)) else _S.index_value(_n_B,0)), _n_a])
	if _S.truth(((_n_av_b8 > (_n_lim_b10 + 0.05)) if _S.truth((_n_av_b8 > (_n_lim_b10 + 0.05))) else (_n_w_b9 < 0.5))):
		return null
	if _S.truth(((_n_lim_b10 - _n_av_b8) < 1)):
		return (_S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_B,2) if _S.truth((_n_u_b6 > 0.85)) else _n_edge), (_n_a * _n_fade_b11)]) if _S.truth((_n_v_b7 > 0)) else _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, _n_lead, _n_a]))
	if _S.truth((_n_u_b6 < 0.72)):
		return _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_B,0) if _S.truth((_n_u_b6 < 0.38)) else _S.index_value(_n_B,1)), _n_a])
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_B,2), (_n_a * _n_fade_b11)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_th_b4 = _S.arg(_args,4)
	var _n_R_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_glint_b7 = _S.coalesce(_S.arg(_args,7),func():return false)
	var _n_n_b8 = _S.prop(_n_R_b5,"length")
	var _n_X_b9 = floori(_n_x_b1+0.5)
	var _n_Y_b10 = floori(_n_y_b2+0.5)
	var _n_w_b11 = (1 if _S.truth((_n_th_b4 > 1)) else 0)
	var _n_ins_b12 = _S.function_value(_S.capture(_parent,{"w":_n_w_b11,"L":_n_L_b3,"this":_this}),"_f8")
	if true:
		var _n_j_b13 = ((-_n_L_b3) - 1)
		while _S.truth((_n_j_b13 <= (_n_L_b3 + 1))):
			if true:
				var _n_i_b14 = ((-_n_L_b3) - 1)
				while _S.truth((_n_i_b14 <= (_n_L_b3 + 1))):
					if _S.truth(not _S.truth(_S.call_value(_n_ins_b12,[_n_i_b14, _n_j_b13]))):
						if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_ins_b12,[(_n_i_b14 - 1), _n_j_b13]),func():return _S.call_value(_n_ins_b12,[(_n_i_b14 + 1), _n_j_b13])),func():return _S.call_value(_n_ins_b12,[_n_i_b14, (_n_j_b13 - 1)])),func():return _S.call_value(_n_ins_b12,[_n_i_b14, (_n_j_b13 + 1)])) if _S.truth(_n_w_b11) else _n_w_b11)):
							_S.invoke(_n_p_b0,"dot",[(_n_X_b9 + _n_i_b14), (_n_Y_b10 + _n_j_b13), _S.index_value(_n_R_b5,maxf(0,(_n_n_b8 - 6))), (_n_a_b6 * 0.9)])
						_n_i_b14 += 1.0
						continue
					var _n_c_b15 = null
					if _S.truth(not _S.truth(_n_w_b11)):
						_n_c_b15 = (_n_WHITE if _S.truth((_S.binary("===",_n_j_b13,0) if _S.truth(_S.binary("===",_n_i_b14,0)) else _S.binary("===",_n_i_b14,0))) else (_S.index_value(_n_R_b5,(_n_n_b8 - 3)) if _S.truth(((absf(_n_i_b14) + absf(_n_j_b13)) >= _n_L_b3)) else _S.index_value(_n_R_b5,(_n_n_b8 - 2))))
					else:
						if _S.truth((_S.binary("===",_n_j_b13,0) if _S.truth(_S.binary("===",_n_i_b14,0)) else _S.binary("===",_n_i_b14,0))):
							_n_c_b15 = _n_WHITE
						else:
							if _S.truth((_S.binary("===",_n_i_b14,0) if _S.truth(_S.binary("===",_n_i_b14,0)) else _S.binary("===",_n_j_b13,0))):
								_n_c_b15 = (_S.index_value(_n_R_b5,(_n_n_b8 - 2)) if _S.truth(((absf(_n_i_b14) + absf(_n_j_b13)) < _n_L_b3)) else _S.index_value(_n_R_b5,(_n_n_b8 - 3)))
							else:
								_n_c_b15 = (_S.index_value(_n_R_b5,(_n_n_b8 - 3)) if _S.truth(((_n_i_b14 < 0) if _S.truth((_n_i_b14 < 0)) else (_n_j_b13 < 0))) else _S.index_value(_n_R_b5,(_n_n_b8 - 5)))
					if _S.truth((((_S.binary("===",_n_j_b13,(-_n_L_b3)) if _S.truth(_S.binary("===",_n_i_b14,0)) else _S.binary("===",_n_i_b14,0)) if _S.truth((_S.binary("===",_n_j_b13,(-_n_L_b3)) if _S.truth(_S.binary("===",_n_i_b14,0)) else _S.binary("===",_n_i_b14,0))) else (_S.binary("===",_n_j_b13,0) if _S.truth(_S.binary("===",_n_i_b14,(-_n_L_b3))) else _S.binary("===",_n_i_b14,(-_n_L_b3)))) if _S.truth(_n_glint_b7) else _n_glint_b7)):
						_n_c_b15 = _n_WHITE
					_S.invoke(_n_p_b0,"dot",[(_n_X_b9 + _n_i_b14), (_n_Y_b10 + _n_j_b13), _n_c_b15, _n_a_b6])
					_n_i_b14 += 1.0
			_n_j_b13 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_L = _S.read(_parent,"L")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return _S.logical("||",_S.logical("&&",(absf(_n_i_b0) <= _n_w),func():return (absf(_n_j_b1) <= _n_L)),func():return _S.logical("&&",(absf(_n_j_b1) <= _n_w),func():return (absf(_n_i_b0) <= _n_L)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	var _n_lift_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.index_value(_n_R_b0,clampf(floori((((_S.ColorFX.luma(_n_c_b1) * 1.1) + _n_lift_b2) * _S.prop(_n_R_b0,"length"))),0,(_S.prop(_n_R_b0,"length") - 1)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_rng_b0 = _S.arg(_args,0)
	var _n_floor_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	_S.set_prop(_this,"R",_n_rng_b0,"=")
	_S.set_prop(_this,"floor",_n_floor_b1,"=")
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"a": 0}, {"len": 7}, {"wid": 2}, {"delay": 0}, {"back": false}, {"side": _S.invoke(_S.read(_e, "R"), "sign", [])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [3.2, 4.6])}, {"amp": _S.invoke(_S.read(_e, "R"), "range", [6, 11])}, {"sink": _S.invoke(_S.read(_e, "R"), "range", [14, 24])}, {"va": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 9), 9])}, {"tilt": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.35), 0.35])}, _S.read(_e, "f"), {"max": _S.prop(_S.read(_e, "f"), "life")}, {"age": 0}, {"landed": false}])])
	return null

static func _f14(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			var _n_f_b2 = _S.index_value(_S.named_value(_this,"list"),_n_i_b1)
			if _S.truth((_S.named_value(_n_f_b2,"delay") > 0)):
				_S.set_prop(_n_f_b2,"delay",_n_dt_b0,"-=")
				_n_i_b1 -= 1.0
				continue
			if _S.truth((_S.set_prop(_n_f_b2,"life",_n_dt_b0,"-=") <= 0)):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_f_b2,"age",_n_dt_b0,"+=")
			if _S.truth(_S.named_value(_n_f_b2,"landed")):
				_S.set_prop(_n_f_b2,"a",(((floori((float(_S.named_value(_n_f_b2,"a"))/PI)+0.5) * PI) - _S.named_value(_n_f_b2,"a")) * minf(1,(_n_dt_b0 * 10))),"+=")
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_f_b2,"vx",((_S.named_value(_n_f_b2,"vx") * 3.4) * _n_dt_b0),"-=")
			_S.set_prop(_n_f_b2,"vy",((_S.named_value(_n_f_b2,"vy") * 3.4) * _n_dt_b0),"-=")
			var _n_s_b3 = _S.MathFX.smooth(0.1,0.6,_S.named_value(_n_f_b2,"age"))
			var _n_ph_b4 = ((_S.named_value(_n_f_b2,"age") * _S.named_value(_n_f_b2,"w")) + _S.named_value(_n_f_b2,"ph"))
			var _n_c_b5 = cos(_n_ph_b4)
			_S.set_prop(_n_f_b2,"x",((_S.named_value(_n_f_b2,"vx") + (((sin(_n_ph_b4) * _S.named_value(_n_f_b2,"amp")) * _n_s_b3) * 0.9)) * _n_dt_b0),"+=")
			_S.set_prop(_n_f_b2,"y",((_S.named_value(_n_f_b2,"vy") + ((_S.named_value(_n_f_b2,"sink") * _n_s_b3) * (((_n_c_b5 * _n_c_b5) * 1.5) - 0.2))) * _n_dt_b0),"+=")
			var _n_rest_b6 = (((floori((float(_S.named_value(_n_f_b2,"a"))/PI)+0.5) * PI) + _S.named_value(_n_f_b2,"tilt")) + (sin(_n_ph_b4) * 0.6))
			_S.set_prop(_n_f_b2,"a",(((_S.named_value(_n_f_b2,"va") * _n_dt_b0) * (1 - _n_s_b3)) + ((_n_rest_b6 - _S.named_value(_n_f_b2,"a")) * minf(1,((_n_dt_b0 * 5) * _n_s_b3)))),"+=")
			if _S.truth((_S.named_value(_n_f_b2,"y") >= (_S.named_value(_this,"floor") - 0.5))):
				_S.set_prop(_n_f_b2,"y",(_S.named_value(_this,"floor") - 0.5),"=")
				_S.set_prop(_n_f_b2,"landed",true,"=")
				_S.set_prop(_n_f_b2,"life",minf(_S.named_value(_n_f_b2,"life"),0.6),"=")
			_n_i_b1 -= 1.0
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_feather = _S.read(_parent,"feather")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_layer_b2 = _S.arg(_args,2)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_f_b3 = _iter_0
		if _S.truth(((_S.named_value(_n_f_b3,"delay") > 0) if _S.truth((_S.named_value(_n_f_b3,"delay") > 0)) else (_S.binary("!==",("back" if _S.truth(_S.named_value(_n_f_b3,"back")) else "front"),_n_layer_b2) if _S.truth(_n_layer_b2) else _n_layer_b2))):
			continue
		var _n_k_b4 = (float(_S.named_value(_n_f_b3,"life"))/_S.named_value(_n_f_b3,"max"))
		var _n_a_b5 = minf(minf(1,(float(_S.named_value(_n_f_b3,"life"))/0.45)),(float(_S.named_value(_n_f_b3,"age"))/0.06))
		var _n_ca_b6 = cos(_S.named_value(_n_f_b3,"a"))
		var _n_sa_b7 = sin(_S.named_value(_n_f_b3,"a"))
		_S.call_value(_n_feather,[_n_p_b0, (_S.named_value(_n_f_b3,"x") - (float((_n_ca_b6 * _S.named_value(_n_f_b3,"len")))/2)), (_S.named_value(_n_f_b3,"y") - (float((_n_sa_b7 * _S.named_value(_n_f_b3,"len")))/2)), _S.named_value(_n_f_b3,"a"), _S.named_value(_n_f_b3,"len"), _S.named_value(_n_f_b3,"wid"), _n_R_b1, _n_a_b5, _S.named_value(_n_f_b3,"side"), (1 if _S.truth((_S.named_value(_n_f_b3,"age") < 0.06)) else 0), 0.2])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_f_b3,"x"), _S.named_value(_n_f_b3,"y"), (4 + (_S.named_value(_n_f_b3,"len") * 0.5)), _S.index_value(_n_R_b1,(_S.prop(_n_R_b1,"length") - 3)), ((0.22 * _n_a_b5) * (0.4 + (0.6 * _n_k_b4)))])
	return null
