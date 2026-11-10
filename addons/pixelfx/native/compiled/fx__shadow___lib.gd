@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f3":"shadow_ring_fast","_f5":"shadow_ring_light","_f7":"shadow_halo","_f9":"geometry_black_star","_f13":"geometry_in_star","_f24":"shadow_puffs_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ramp", _S.import_value("core/index.js", "ramp"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "unlight", _S.function_value(_e, "_f0"))
	_S.define(_e, "annulus", _S.function_value(_e, "_f2"))
	_S.define(_e, "ringFast", _S.function_value(_e, "_f3"))
	_S.define(_e, "ringLight", _S.function_value(_e, "_f5"))
	_S.define(_e, "halo", _S.function_value(_e, "_f7"))
	_S.define(_e, "blackStar", _S.function_value(_e, "_f9"))
	_S.define(_e, "inStar", _S.function_value(_e, "_f13"))
	_S.define(_e, "attract", _S.function_value(_e, "_f14"))
	_S.define(_e, "shard", _S.function_value(_e, "_f16"))
	_S.define(_e, "floorPool", _S.function_value(_e, "_f18"))
	_S.define(_e, "VOID", ["#06040b", "#150c26", "#2a1150", "#461a84", "#6f2cc0", "#9d5cec", "#cfa6ff", "#f6eaff"])
	_exports["VOID"] = _S.read(_e, "VOID")
	_exports["unlight"] = _S.read(_e, "unlight")
	_exports["ringFast"] = _S.read(_e, "ringFast")
	_exports["ringLight"] = _S.read(_e, "ringLight")
	_exports["halo"] = _S.read(_e, "halo")
	_exports["blackStar"] = _S.read(_e, "blackStar")
	_exports["inStar"] = _S.read(_e, "inStar")
	_exports["attract"] = _S.read(_e, "attract")
	_S.define(_e, "PK", _S.merge([{"FLAME": 0}, {"SOOT": 1}]))
	_exports["PK"] = _S.read(_e, "PK")
	_S.define(_e, "Puffs", _S.class_value("Puffs", _S.function_value(_e, "_f20"), {"spawn": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "draw": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Puffs"] = _S.read(_e, "Puffs")
	_exports["shard"] = _S.read(_e, "shard")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f26"), {"add": _S.function_value(_e, "_f28"), "update": _S.function_value(_e, "_f29"), "draw": _S.function_value(_e, "_f30")}, {}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["floorPool"] = _S.read(_e, "floorPool")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _n_dark_b5 = _S.arg(_args,5)
	var _n_keep_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_L_b7 = _S.named_value(_n_p_b0,"L")
	var _n_w_b8 = _S.named_value(_n_p_b0,"w")
	var _n_ox_b9 = _S.named_value(_n_p_b0,"ox")
	var _n_oy_b10 = _S.named_value(_n_p_b0,"oy")
	_S.invoke(_n_p_b0,"each",[_n_x0_b1, _n_y0_b2, _n_x1_b3, _n_y1_b4, _S.function_value(_S.capture(_parent,{"dark":_n_dark_b5,"oy":_n_oy_b10,"w":_n_w_b8,"ox":_n_ox_b9,"L":_n_L_b7,"keep":_n_keep_b6,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_dark = _S.read(_parent,"dark")
	var _n_oy = _S.read(_parent,"oy")
	var _n_w = _S.read(_parent,"w")
	var _n_ox = _S.read(_parent,"ox")
	var _n_L = _S.read(_parent,"L")
	var _n_keep = _S.read(_parent,"keep")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	if _S.truth(not _S.truth(_S.call_value(_n_dark,[_n_x_b0, _n_y_b1]))):
		return null
	var _n_i_b4 = (((_n_sy_b3 - _n_oy) * _n_w) + (_n_sx_b2 - _n_ox))
	var _n_d_b5 = _S.index_value(_n_L,_n_i_b4)
	if _S.truth(not _S.truth(_n_d_b5)):
		return null
	if _S.truth((_n_keep <= 0)):
		_S.set_prop(_n_L,_n_i_b4,0,"=")
	else:
		_S.set_prop(_n_L,_n_i_b4,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",(_S.binary("&",_S.binary(">>>",_n_d_b5,16),255) * _n_keep),16)),_S.binary("<<",(_S.binary("&",_S.binary(">>>",_n_d_b5,8),255) * _n_keep),8)),(_S.binary("&",_n_d_b5,255) * _n_keep)),"=")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r0_b2 = _S.arg(_args,2)
	var _n_r1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_r02_b5 = ((_n_r0_b2 * _n_r0_b2) if _S.truth((_n_r0_b2 > 0)) else (-1))
	var _n_r12_b6 = (_n_r1_b3 * _n_r1_b3)
	if true:
		var _n_py_b7 = floori((_n_y_b1 - _n_r1_b3))
		while _S.truth((_n_py_b7 <= ceili((_n_y_b1 + _n_r1_b3)))):
			var _n_cy_b8 = (_n_py_b7 + 0.5)
			var _n_dy_b9 = (_n_cy_b8 - _n_y_b1)
			var _n_dy2_b10 = (_n_dy_b9 * _n_dy_b9)
			if _S.truth((_n_dy2_b10 >= _n_r12_b6)):
				_n_py_b7 += 1.0
				continue
			var _n_xo_b11 = sqrt((_n_r12_b6 - _n_dy2_b10))
			var _n_xi_b12 = (sqrt((_n_r02_b5 - _n_dy2_b10)) if _S.truth((_n_dy2_b10 < _n_r02_b5)) else 0)
			if true:
				var _n_px_b13 = floori((_n_x_b0 - _n_xo_b11))
				var _n_x1_b14 = ceili((_n_x_b0 + _n_xo_b11))
				while _S.truth((_n_px_b13 <= _n_x1_b14)):
					var _n_cx_b15 = (_n_px_b13 + 0.5)
					var _n_dx_b16 = (_n_cx_b15 - _n_x_b0)
					if _S.truth(((_n_dx_b16 < _n_xi_b12) if _S.truth(((_n_dx_b16 > (-_n_xi_b12)) if _S.truth((_n_xi_b12 > 0)) else (_n_xi_b12 > 0))) else ((_n_dx_b16 > (-_n_xi_b12)) if _S.truth((_n_xi_b12 > 0)) else (_n_xi_b12 > 0)))):
						_n_px_b13 = maxf(_n_px_b13,(floori((_n_x_b0 + _n_xi_b12)) - 1))
						_n_px_b13 += 1.0
						continue
					var _n_d2_b17 = ((_n_dx_b16 * _n_dx_b16) + _n_dy2_b10)
					if _S.truth(((_n_d2_b17 >= _n_r02_b5) if _S.truth((_n_d2_b17 < _n_r12_b6)) else (_n_d2_b17 < _n_r12_b6))):
						_S.call_value(_n_fn_b4,[_n_cx_b15, _n_cy_b8, sqrt(_n_d2_b17)])
					_n_px_b13 += 1.0
			_n_py_b7 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_annulus = _S.read(_parent,"annulus")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	if _S.truth((_n_r_b3 <= 0)):
		return null
	var _n_r0_b7 = maxf(0,(_n_r_b3 - _n_w_b4))
	var _n_fc_b8 = _S.binary("===",_S.unary("typeof",_n_c_b5),"function")
	var _n_fa_b9 = _S.binary("===",_S.unary("typeof",_n_a_b6),"function")
	_S.call_value(_n_annulus,[_n_x_b1, _n_y_b2, _n_r0_b7, _n_r_b3, _S.function_value(_S.capture(_parent,{"r0":_n_r0_b7,"r":_n_r_b3,"fc":_n_fc_b8,"fa":_n_fa_b9,"y":_n_y_b2,"x":_n_x_b1,"p":_n_p_b0,"c":_n_c_b5,"a":_n_a_b6,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r0 = _S.read(_parent,"r0")
	var _n_r = _S.read(_parent,"r")
	var _n_y = _S.read(_parent,"y")
	var _n_x = _S.read(_parent,"x")
	var _n_fc = _S.read(_parent,"fc")
	var _n_fa = _S.read(_parent,"fa")
	var _n_p = _S.read(_parent,"p")
	var _n_c = _S.read(_parent,"c")
	var _n_a = _S.read(_parent,"a")
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float((_n_d_b2 - _n_r0))/((_n_r - _n_r0) if _S.truth((_n_r - _n_r0)) else 1))
	var _n_ang_b4 = (atan2((_n_cy_b1 - _n_y),(_n_cx_b0 - _n_x)) if _S.truth((_n_fc if _S.truth(_n_fc) else _n_fa)) else 0)
	_S.invoke(_n_p,"dot",[_n_cx_b0, _n_cy_b1, (_S.call_value(_n_c,[_n_v_b3, _n_ang_b4]) if _S.truth(_n_fc) else _n_c), (_S.call_value(_n_a,[_n_v_b3, _n_ang_b4]) if _S.truth(_n_fa) else _n_a)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_annulus = _S.read(_parent,"annulus")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	var _n_keep_b7 = _S.coalesce(_S.arg(_args,7),func():return null)
	if _S.truth(((_n_w_b4 < 1) if _S.truth((_n_w_b4 < 1)) else (_n_k_b6 <= 0.004))):
		return null
	var _n_col_b8 = _S.call_value(_n_hex,[_n_c_b5])
	_S.call_value(_n_annulus,[_n_x_b1, _n_y_b2, maxf(0,(_n_R_b3 - _n_w_b4)), (_n_R_b3 + _n_w_b4), _S.function_value(_S.capture(_parent,{"keep":_n_keep_b7,"R":_n_R_b3,"w":_n_w_b4,"p":_n_p_b0,"col":_n_col_b8,"k":_n_k_b6,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_keep = _S.read(_parent,"keep")
	var _n_R = _S.read(_parent,"R")
	var _n_w = _S.read(_parent,"w")
	var _n_p = _S.read(_parent,"p")
	var _n_col = _S.read(_parent,"col")
	var _n_k = _S.read(_parent,"k")
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.arg(_args,2)
	if _S.truth((not _S.truth(_S.call_value(_n_keep,[_n_cx_b0, _n_cy_b1])) if _S.truth(_n_keep) else _n_keep)):
		return null
	var _n_f_b3 = (1 - (float(absf((_n_d_b2 - _n_R)))/_n_w))
	_S.invoke(_n_p,"light",[_n_cx_b0, _n_cy_b1, _n_col, ((_n_f_b3 * _n_f_b3) * _n_k)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_annulus = _S.read(_parent,"annulus")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r0_b3 = _S.arg(_args,3)
	var _n_r1_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth(((_n_r1_b4 <= _n_r0_b3) if _S.truth((_n_r1_b4 <= _n_r0_b3)) else (_n_k_b6 <= 0.004))):
		return null
	var _n_col_b7 = _S.call_value(_n_hex,[_n_c_b5])
	var _n_w_b8 = (_n_r1_b4 - _n_r0_b3)
	_S.call_value(_n_annulus,[_n_x_b1, _n_y_b2, maxf(0,_n_r0_b3), _n_r1_b4, _S.function_value(_S.capture(_parent,{"r0":_n_r0_b3,"w":_n_w_b8,"p":_n_p_b0,"col":_n_col_b7,"k":_n_k_b6,"this":_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_r0 = _S.read(_parent,"r0")
	var _n_w = _S.read(_parent,"w")
	var _n_p = _S.read(_parent,"p")
	var _n_col = _S.read(_parent,"col")
	var _n_k = _S.read(_parent,"k")
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.arg(_args,2)
	var _n_f_b3 = (1 - (float((_n_d_b2 - _n_r0))/_n_w))
	_S.invoke(_n_p,"light",[_n_cx_b0, _n_cy_b1, _n_col, ((_n_f_b3 * _n_f_b3) * _n_k)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_inStar = _S.read(_parent,"inStar")
	var _n_cy_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_rot_b2 = _S.arg(_args,2)
	var _n_short_b3 = _S.coalesce(_S.arg(_args,3),func():return 0.46)
	var _n_q_b4 = _S.coalesce(_S.arg(_args,4),func():return 0.32)
	var _n_R0_b5 = (ceili(_n_L_b1) + 2)
	var _n_n_b6 = ((_n_R0_b5 * 2) + 1)
	var _n_data_b7 = _S.construct(_n_Uint8Array,[(_n_n_b6 * _n_n_b6)])
	if true:
		var _n_j_b9 = 0
		while _S.truth((_n_j_b9 < _n_n_b6)):
			if true:
				var _n_i_b10 = 0
				while _S.truth((_n_i_b10 < _n_n_b6)):
					var _n_x_b11 = ((_n_i_b10 - _n_R0_b5) + 0.5)
					var _n_y_b12 = (((_n_cy_b0 + _n_j_b9) - _n_R0_b5) + 0.5)
					if _S.truth(_S.logical("||",_S.call_value(_n_inStar,[_n_x_b11, _n_y_b12, 0, _n_cy_b0, _n_L_b1, _n_rot_b2, _n_q_b4]),func():return _S.call_value(_n_inStar,[_n_x_b11, _n_y_b12, 0, _n_cy_b0, (_n_L_b1 * _n_short_b3), (_n_rot_b2 + (float(PI)/4)), _n_q_b4]))):
						_S.set_prop(_n_data_b7,((_n_j_b9 * _n_n_b6) + _n_i_b10),1,"=")
					_n_i_b10 += 1.0
			_n_j_b9 += 1.0
	if true:
		var _n_a_b13 = 0
		while _S.truth((_n_a_b13 < 4)):
			if true:
				var _n_d_b14 = 0
				var _n_ca_b15 = cos((_n_rot_b2 + (float((_n_a_b13 * PI))/2)))
				var _n_sa_b16 = sin((_n_rot_b2 + (float((_n_a_b13 * PI))/2)))
				while _S.truth((_n_d_b14 < (_n_L_b1 - 1))):
					var _n_i_b17 = (floori((_n_ca_b15 * _n_d_b14)) + _n_R0_b5)
					var _n_j_b18 = (floori((_n_sa_b16 * _n_d_b14)) + _n_R0_b5)
					_S.set_prop(_n_data_b7,((_n_j_b18 * _n_n_b6) + _n_i_b17),1,"=")
					_n_d_b14 += 0.5
			_n_a_b13 += 1.0
	var _n_at_b8 = _S.function_value(_S.capture(_parent,{"R0":_n_R0_b5,"cy":_n_cy_b0,"n":_n_n_b6,"data":_n_data_b7,"this":_this}),"_f10")
	return {"R0":_n_R0_b5,"at":_n_at_b8,"unlight":_S.function_value(_S.capture(_parent,{"n":_n_n_b6,"data":_n_data_b7,"R0":_n_R0_b5,"cy":_n_cy_b0}),"_f11"),"draw":_S.function_value(_S.capture(_parent,{"n":_n_n_b6,"R0":_n_R0_b5,"cy":_n_cy_b0,"data":_n_data_b7,"at":_n_at_b8}),"_f12")}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_cy = _S.read(_parent,"cy")
	var _n_n = _S.read(_parent,"n")
	var _n_data = _S.read(_parent,"data")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = (floori(_n_x_b0) + _n_R0)
	var _n_j_b3 = (floori((_n_y_b1 - _n_cy)) + _n_R0)
	return (_S.binary("===",_S.index_value(_n_data,((_n_j_b3 * _n_n) + _n_i_b2)),1) if _S.truth(((_n_j_b3 < _n_n) if _S.truth(((_n_i_b2 < _n_n) if _S.truth(((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0))) else ((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0)))) else ((_n_i_b2 < _n_n) if _S.truth(((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0))) else ((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0))))) else ((_n_j_b3 < _n_n) if _S.truth(((_n_i_b2 < _n_n) if _S.truth(((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0))) else ((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0)))) else ((_n_i_b2 < _n_n) if _S.truth(((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0))) else ((_n_j_b3 >= 0) if _S.truth((_n_i_b2 >= 0)) else (_n_i_b2 >= 0)))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_data = _S.read(_parent,"data")
	var _n_n = _S.read(_parent,"n")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_cy = _S.read(_parent,"cy")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_Lb_b1 = _S.named_value(_n_p_b0,"L")
	var _n_w_b2 = _S.named_value(_n_p_b0,"w")
	var _n_h_b3 = _S.named_value(_n_p_b0,"h")
	var _n_ox_b4 = _S.named_value(_n_p_b0,"ox")
	var _n_oy_b5 = _S.named_value(_n_p_b0,"oy")
	if true:
		var _n_j_b6 = 0
		while _S.truth((_n_j_b6 < _n_n)):
			if true:
				var _n_i_b7 = 0
				while _S.truth((_n_i_b7 < _n_n)):
					if _S.truth(not _S.truth(_S.index_value(_n_data,((_n_j_b6 * _n_n) + _n_i_b7)))):
						_n_i_b7 += 1.0
						continue
					var _n_x_b8 = ((_n_i_b7 - _n_R0) + 0.5)
					var _n_y_b9 = (((_n_cy + _n_j_b6) - _n_R0) + 0.5)
					var _n_sx_b10 = (_S.invoke(_n_p_b0,"cellX",[_n_x_b8, _n_y_b9]) - _n_ox_b4)
					var _n_sy_b11 = (_S.invoke(_n_p_b0,"cellY",[_n_x_b8, _n_y_b9]) - _n_oy_b5)
					if _S.truth(((_n_sy_b11 < _n_h_b3) if _S.truth(((_n_sx_b10 < _n_w_b2) if _S.truth(((_n_sy_b11 >= 0) if _S.truth((_n_sx_b10 >= 0)) else (_n_sx_b10 >= 0))) else ((_n_sy_b11 >= 0) if _S.truth((_n_sx_b10 >= 0)) else (_n_sx_b10 >= 0)))) else ((_n_sx_b10 < _n_w_b2) if _S.truth(((_n_sy_b11 >= 0) if _S.truth((_n_sx_b10 >= 0)) else (_n_sx_b10 >= 0))) else ((_n_sy_b11 >= 0) if _S.truth((_n_sx_b10 >= 0)) else (_n_sx_b10 >= 0))))):
						_S.set_prop(_n_Lb_b1,((_n_sy_b11 * _n_w_b2) + _n_sx_b10),0,"=")
					_n_i_b7 += 1.0
			_n_j_b6 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_cy = _S.read(_parent,"cy")
	var _n_data = _S.read(_parent,"data")
	var _n_n = _S.read(_parent,"n")
	var _n_at = _S.read(_parent,"at")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	var _n_rim_b2 = _S.arg(_args,2)
	var _n_skip_b3 = _S.arg(_args,3)
	if true:
		var _n_j_b4 = 0
		while _S.truth((_n_j_b4 < _n_n)):
			if true:
				var _n_i_b5 = 0
				while _S.truth((_n_i_b5 < _n_n)):
					var _n_x_b6 = ((_n_i_b5 - _n_R0) + 0.5)
					var _n_y_b7 = (((_n_cy + _n_j_b4) - _n_R0) + 0.5)
					if _S.truth(_S.index_value(_n_data,((_n_j_b4 * _n_n) + _n_i_b5))):
						_S.invoke(_n_p_b0,"px",[_n_x_b6, _n_y_b7, _n_c_b1])
					else:
						if _S.truth(_S.logical("&&",(not _S.truth(_S.call_value(_n_skip_b3,[_n_x_b6, _n_y_b7])) if _S.truth(_n_rim_b2) else _n_rim_b2),func():return _S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_at,[(_n_x_b6 - 1), _n_y_b7]),func():return _S.call_value(_n_at,[(_n_x_b6 + 1), _n_y_b7])),func():return _S.call_value(_n_at,[_n_x_b6, (_n_y_b7 - 1)])),func():return _S.call_value(_n_at,[_n_x_b6, (_n_y_b7 + 1)])))):
							_S.invoke(_n_p_b0,"px",[_n_x_b6, _n_y_b7, _n_rim_b2])
					_n_i_b5 += 1.0
			_n_j_b4 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_rot_b5 = _S.arg(_args,5)
	var _n_q_b6 = _S.coalesce(_S.arg(_args,6),func():return 0.42)
	if _S.truth((_n_L_b4 <= 0)):
		return false
	var _n_c_b7 = cos(_n_rot_b5)
	var _n_s_b8 = sin(_n_rot_b5)
	var _n_dx_b9 = (_n_x_b0 - _n_cx_b2)
	var _n_dy_b10 = (_n_y_b1 - _n_cy_b3)
	var _n_u_b11 = (float(absf(((_n_dx_b9 * _n_c_b7) + (_n_dy_b10 * _n_s_b8))))/_n_L_b4)
	var _n_v_b12 = (float(absf((((-_n_dx_b9) * _n_s_b8) + (_n_dy_b10 * _n_c_b7))))/_n_L_b4)
	return _S.logical("&&",((minf(_n_u_b11,_n_v_b12) <= pow(0.5,(float(1)/_n_q_b6))) if _S.truth(((_n_v_b12 < 1) if _S.truth((_n_u_b11 < 1)) else (_n_u_b11 < 1))) else ((_n_v_b12 < 1) if _S.truth((_n_u_b11 < 1)) else (_n_u_b11 < 1))),func():return ((pow(_n_u_b11,_n_q_b6) + pow(_n_v_b12,_n_q_b6)) <= 1))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_list_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_G_b3 = _S.arg(_args,3)
	var _n_reach_b4 = _S.arg(_args,4)
	var _n_swirl_b5 = _S.arg(_args,5)
	var _n_r0_b6 = _S.arg(_args,6)
	var _n_dt_b7 = _S.arg(_args,7)
	var _n_w_b8 = _S.coalesce(_S.arg(_args,8),func():return _S.function_value(_S.capture(_parent,{"this":_this}),"_f15"))
	var _n_vmax_b9 = _S.coalesce(_S.arg(_args,9),func():return INF)
	var _n_eaten_b10 = 0
	if true:
		var _n_i_b11 = (_S.prop(_n_list_b0,"length") - 1)
		while _S.truth((_n_i_b11 >= 0)):
			var _n_q_b12 = _S.index_value(_n_list_b0,_n_i_b11)
			var _n_wt_b13 = _S.call_value(_n_w_b8,[_n_q_b12])
			if _S.truth((not _S.truth(_n_wt_b13) if _S.truth(not _S.truth(_n_wt_b13)) else (_S.named_value(_n_q_b12,"delay") > 0))):
				_n_i_b11 -= 1.0
				continue
			var _n_dx_b14 = (_n_x_b1 - _S.named_value(_n_q_b12,"x"))
			var _n_dy_b15 = (_n_y_b2 - _S.named_value(_n_q_b12,"y"))
			var _n_d2_b16 = ((_n_dx_b14 * _n_dx_b14) + (_n_dy_b15 * _n_dy_b15))
			if _S.truth((_n_d2_b16 > (_n_reach_b4 * _n_reach_b4))):
				_n_i_b11 -= 1.0
				continue
			var _n_d_b17 = _S.logical("||",sqrt(_n_d2_b16),func():return 1)
			if _S.truth((_n_d_b17 < _n_r0_b6)):
				_S.invoke(_n_list_b0,"splice",[_n_i_b11, 1])
				_n_eaten_b10 += 1.0
				_n_i_b11 -= 1.0
				continue
			var _n_a_b18 = ((((float(_n_G_b3)/(_n_d2_b16 + (_n_r0_b6 * _n_r0_b6))) * minf(1,(float((_n_reach_b4 - _n_d_b17))/(_n_reach_b4 * 0.25)))) * _n_wt_b13) * _n_dt_b7)
			var _n_ux_b19 = (float(_n_dx_b14)/_n_d_b17)
			var _n_uy_b20 = (float(_n_dy_b15)/_n_d_b17)
			_S.set_prop(_n_q_b12,"vx",((_n_ux_b19 - (_n_uy_b20 * _n_swirl_b5)) * _n_a_b18),"+=")
			_S.set_prop(_n_q_b12,"vy",((_n_uy_b20 + (_n_ux_b19 * _n_swirl_b5)) * _n_a_b18),"+=")
			var _n_drag_b21 = minf(0.2,(((1 - (float(_n_d_b17)/_n_reach_b4)) * 1.6) * _n_dt_b7))
			_S.set_prop(_n_q_b12,"vx",(_S.named_value(_n_q_b12,"vx") * _n_drag_b21),"-=")
			_S.set_prop(_n_q_b12,"vy",(_S.named_value(_n_q_b12,"vy") * _n_drag_b21),"-=")
			var _n_v_b22 = _S.Bridge.hypot([_S.named_value(_n_q_b12,"vx"), _S.named_value(_n_q_b12,"vy")])
			if _S.truth((_n_v_b22 > _n_vmax_b9)):
				_S.set_prop(_n_q_b12,"vx",(float(_n_vmax_b9)/_n_v_b22),"*=")
				_S.set_prop(_n_q_b12,"vy",(float(_n_vmax_b9)/_n_v_b22),"*=")
			_n_i_b11 -= 1.0
	return _n_eaten_b10
	return null

static func _f15(_parent,_args:Array,_this=null):
	return 1
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_lx_b3 = _S.arg(_args,3)
	var _n_ly_b4 = _S.arg(_args,4)
	var _n_lk_b5 = _S.arg(_args,5)
	var _n_fa_b6 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.4))
	var _n_ca_b7 = cos(_S.named_value(_n_b_b1,"a"))
	var _n_sa_b8 = sin(_S.named_value(_n_b_b1,"a"))
	var _n_L_b9 = maxf(2,_S.named_value(_n_b_b1,"s"))
	var _n_W_b10 = maxf(2,(_n_L_b9 * 0.55))
	var _n_side_b11 = (1 if _S.truth(((((-_n_sa_b8) * (_n_lx_b3 - _S.named_value(_n_b_b1,"x"))) + (_n_ca_b7 * (_n_ly_b4 - _S.named_value(_n_b_b1,"y")))) > 0)) else (-1))
	var _n_rim_b12 = (_S.index_value(_n_C_b2,6) if _S.truth((_n_lk_b5 > 0.6)) else (_S.index_value(_n_C_b2,5) if _S.truth((_n_lk_b5 > 0.3)) else (_S.index_value(_n_C_b2,4) if _S.truth((_n_lk_b5 > 0.08)) else _S.index_value(_n_C_b2,3))))
	var _n_E_b13 = ((float(_n_L_b9)/2) + 1.5)
	_S.invoke(_n_p_b0,"shade",[(_S.named_value(_n_b_b1,"x") - _n_E_b13), (_S.named_value(_n_b_b1,"y") - _n_E_b13), (_S.named_value(_n_b_b1,"x") + _n_E_b13), (_S.named_value(_n_b_b1,"y") + _n_E_b13), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"ca":_n_ca_b7,"sa":_n_sa_b8,"side":_n_side_b11,"L":_n_L_b9,"W":_n_W_b10,"fa":_n_fa_b6,"lk":_n_lk_b5,"rim":_n_rim_b12,"C":_n_C_b2,"this":_this}),"_f17")])
	if _S.truth((_n_lk_b5 > 0.04)):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b1,"x"), _S.named_value(_n_b_b1,"y"), (3 + (_n_L_b9 * 0.6)), _S.index_value(_n_C_b2,5), ((0.2 * _n_lk_b5) * _n_fa_b6)])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_side = _S.read(_parent,"side")
	var _n_L = _S.read(_parent,"L")
	var _n_W = _S.read(_parent,"W")
	var _n_fa = _S.read(_parent,"fa")
	var _n_lk = _S.read(_parent,"lk")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_rim = _S.read(_parent,"rim")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_u_b5 = ((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa))
	var _n_v_b6 = ((((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca)) * _n_side)
	if _S.truth(((_n_u_b5 < ((float((-_n_L))/2) - 0.4)) if _S.truth((_n_u_b5 < ((float((-_n_L))/2) - 0.4))) else (_n_u_b5 > ((float(_n_L)/2) + 0.4)))):
		return null
	var _n_half_b7 = ((float(((float(_n_W)/2) * ((float(_n_L)/2) - _n_u_b5)))/_n_L) + 0.4)
	if _S.truth((absf(_n_v_b6) > _n_half_b7)):
		return null
	_S.set_prop(_n_out_b2,"a",_n_fa,"=")
	if _S.truth(((_n_lk > 0.3) if _S.truth((_n_u_b5 > ((float(_n_L)/2) - 1.3))) else (_n_u_b5 > ((float(_n_L)/2) - 1.3)))):
		return _n_WHITE
	if _S.truth((_n_v_b6 > (_n_half_b7 - 1))):
		return (_n_rim if _S.truth((_n_u_b5 > (float((-_n_L))/4))) else _S.index_value(_n_C,maxf(3,(_S.invoke(_n_C,"indexOf",[_n_rim]) - 1))))
	return (_S.index_value(_n_C,1) if _S.truth((_n_v_b6 < ((-_n_half_b7) + 1))) else _S.index_value(_n_C,2))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_ripples_b4 = _S.arg(_args,4)
	if _S.truth((_n_rx_b2 < 1)):
		return null
	var _n_ry_b5 = ((_n_rx_b2 * 0.17) + 0.6)
	_S.invoke(_n_p_b0,"shade",[((-_n_rx_b2) - 3), ((-_n_ry_b5) - 2), (_n_rx_b2 + 3), (_n_ry_b5 + 2), _S.function_value(_S.capture(_parent,{"rx":_n_rx_b2,"ry":_n_ry_b5,"C":_n_C_b1,"ripples":_n_ripples_b4,"t":_n_t_b3,"this":_this}),"_f19")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_ry = _S.read(_parent,"ry")
	var _n_C = _S.read(_parent,"C")
	var _n_t = _S.read(_parent,"t")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (float(_n_x_b0)/_n_rx)
	var _n_dy_b3 = (float((_n_y_b1 - 0.5))/_n_ry)
	var _n_d_b4 = sqrt(((_n_dx_b2 * _n_dx_b2) + (_n_dy_b3 * _n_dy_b3)))
	if _S.truth((_n_d_b4 > 1.18)):
		return null
	if _S.truth((_n_d_b4 > 1)):
		if _S.truth(((_n_d_b4 < 1.09) if _S.truth((_n_dy_b3 < 0)) else (_n_dy_b3 < 0))):
			return (_S.index_value(_n_C,6) if _S.truth((absf(_n_dx_b2) < 0.55)) else (_S.index_value(_n_C,5) if _S.truth((absf(_n_dx_b2) < 0.85)) else _S.index_value(_n_C,4)))
		if _S.truth(((_n_d_b4 < 1.09) if _S.truth((_n_dy_b3 >= 0)) else (_n_dy_b3 >= 0))):
			return _S.index_value(_n_C,2)
		return (_S.index_value(_n_C,1) if _S.truth(((_S.MathFX.noise((_n_x_b0 * 0.7),9) > 0.15) if _S.truth((_n_y_b1 > (-0.5))) else (_n_y_b1 > (-0.5)))) else null)
	for _iter_0 in _S.array(_n_ripples):
		var _n_r_b5 = _iter_0
		var _n_age_b6 = (_n_t - _S.named_value(_n_r_b5,"t0"))
		var _n_rr_b7 = (((_n_age_b6 * 46) * _S.named_value(_n_r_b5,"w")) + 1)
		var _n_ex_b8 = (_n_x_b0 - _S.named_value(_n_r_b5,"x"))
		var _n_ey_b9 = (float((_n_y_b1 - 0.5))/0.17)
		var _n_e_b10 = _S.logical("||",sqrt(((_n_ex_b8 * _n_ex_b8) + (_n_ey_b9 * _n_ey_b9))),func():return 1)
		var _n_g_b11 = (float(sqrt(((_n_ex_b8 * _n_ex_b8) + pow((float(_n_ey_b9)/0.17),2))))/_n_e_b10)
		if _S.truth(_S.logical("&&",(absf((_n_e_b10 - _n_rr_b7)) < (0.55 * _n_g_b11)),func():return (_n_age_b6 < _S.named_value(_n_r_b5,"life")))):
			return (_S.index_value(_n_C,4) if _S.truth((_n_age_b6 < (_S.named_value(_n_r_b5,"life") * 0.5))) else _S.index_value(_n_C,3))
	if _S.truth(((_S.MathFX.noise(((_n_x_b0 * 0.25) + (_n_t * 1.3)),4) > 0.2) if _S.truth(((_n_dy_b3 > (-0.85)) if _S.truth((_n_dy_b3 < (-0.55))) else (_n_dy_b3 < (-0.55)))) else ((_n_dy_b3 > (-0.85)) if _S.truth((_n_dy_b3 < (-0.55))) else (_n_dy_b3 < (-0.55))))):
		return (_S.index_value(_n_C,5) if _S.truth((_S.MathFX.noise(((_n_x_b0 * 0.6) - (_n_t * 2)),6) > 0.55)) else _S.index_value(_n_C,2))
	if _S.truth(((_n_d_b4 > 0.72) if _S.truth((_n_dy_b3 < (-0.35))) else (_n_dy_b3 < (-0.35)))):
		return (_S.index_value(_n_C,3) if _S.truth((_n_d_b4 > 0.9)) else _S.index_value(_n_C,2))
	return (_S.index_value(_n_C,1) if _S.truth((_n_d_b4 > 0.86)) else _S.index_value(_n_C,0))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_ramp = _S.read(_parent,"ramp")
	var _n_hex = _S.read(_parent,"hex")
	var _n_o_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"R",_S.named_value(_n_o_b0,"rng"),"=")
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"t",0,"=")
	_S.set_prop(_this,"F",_S.call_value(_n_ramp,[_S.named_value(_n_o_b0,"flame")]),"=")
	_S.set_prop(_this,"soot",_S.call_value(_n_ramp,[_S.named_value(_n_o_b0,"soot")]),"=")
	_S.set_prop(_this,"cap",_S.call_value(_n_hex,[_S.named_value(_n_o_b0,"cap")]),"=")
	_S.set_prop(_this,"rim",_S.call_value(_n_ramp,[_S.named_value(_n_o_b0,"rim")]),"=")
	_S.set_prop(_this,"floor",(_S.named_value(_n_o_b0,"floor") if _S.named_value(_n_o_b0,"floor")!=null else null),"=")
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_k_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	var _n_size_b6 = _S.arg(_args,6)
	var _n_delay_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_smokes_b8 = _S.coalesce(_S.arg(_args,8),func():return false)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"k":_n_k_b0,"x":_n_x_b1,"y":_n_y_b2,"vx":_n_vx_b3,"vy":_n_vy_b4,"life":_n_life_b5,"max":_n_life_b5,"size":_n_size_b6,"delay":_n_delay_b7,"smokes":_n_smokes_b8,"seed":(_S.invoke(_S.named_value(_this,"R"),"next",[]) * 100)}])
	return null

static func _f22(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_PK = _S.read(_parent,"PK")
	var _n_dt_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"t",_n_dt_b0,"+=")
	var _n_t_b1 = _S.named_value(_this,"t")
	if true:
		var _n_i_b2 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b2 >= 0)):
			var _n_q_b3 = _S.index_value(_S.named_value(_this,"list"),_n_i_b2)
			if _S.truth((_S.named_value(_n_q_b3,"delay") > 0)):
				_S.set_prop(_n_q_b3,"delay",_n_dt_b0,"-=")
				_n_i_b2 -= 1.0
				continue
			if _S.truth((_S.set_prop(_n_q_b3,"life",_n_dt_b0,"-=") <= 0)):
				if _S.truth((_S.named_value(_n_q_b3,"smokes") if _S.truth(_S.binary("===",_S.named_value(_n_q_b3,"k"),_S.named_value(_n_PK,"FLAME"))) else _S.binary("===",_S.named_value(_n_q_b3,"k"),_S.named_value(_n_PK,"FLAME")))):
					_S.invoke(_this,"spawn",[_S.named_value(_n_PK,"SOOT"), _S.named_value(_n_q_b3,"x"), (_S.named_value(_n_q_b3,"y") - 1), (_S.named_value(_n_q_b3,"vx") * 0.5), ((_S.named_value(_n_q_b3,"vy") * 0.5) - 6), _S.invoke(_S.named_value(_this,"R"),"range",[0.9, 1.6]), (_S.named_value(_n_q_b3,"size") * 1.25)])
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b2, 1])
				_n_i_b2 -= 1.0
				continue
			if _S.truth(_S.binary("===",_S.named_value(_n_q_b3,"k"),_S.named_value(_n_PK,"FLAME"))):
				_S.set_prop(_n_q_b3,"vy",(95 * _n_dt_b0),"-=")
				_S.set_prop(_n_q_b3,"vx",((sin(((_n_t_b1 * 17) + _S.named_value(_n_q_b3,"seed"))) * 30) * _n_dt_b0),"+=")
				_S.set_prop(_n_q_b3,"vx",((_S.named_value(_n_q_b3,"vx") * 5) * _n_dt_b0),"-=")
				_S.set_prop(_n_q_b3,"vy",((_S.named_value(_n_q_b3,"vy") * 3.2) * _n_dt_b0),"-=")
			else:
				_S.set_prop(_n_q_b3,"vy",(18 * _n_dt_b0),"-=")
				_S.set_prop(_n_q_b3,"vx",((sin(((_n_t_b1 * 1.3) + _S.named_value(_n_q_b3,"seed"))) * 8) * _n_dt_b0),"+=")
				_S.set_prop(_n_q_b3,"vx",((_S.named_value(_n_q_b3,"vx") * 1.6) * _n_dt_b0),"-=")
				_S.set_prop(_n_q_b3,"vy",((_S.named_value(_n_q_b3,"vy") * 1.3) * _n_dt_b0),"-=")
			_S.set_prop(_n_q_b3,"x",(_S.named_value(_n_q_b3,"vx") * _n_dt_b0),"+=")
			_S.set_prop(_n_q_b3,"y",(_S.named_value(_n_q_b3,"vy") * _n_dt_b0),"+=")
			if _S.truth((_S.binary("===",_S.named_value(_n_q_b3,"k"),_S.named_value(_n_PK,"SOOT")) if _S.truth(_S.named_value(_this,"floor")) else _S.named_value(_this,"floor"))):
				var _n_f_b4 = (_S.invoke(_this,"floor",[_S.named_value(_n_q_b3,"x")]) - (_S.named_value(_n_q_b3,"size") * 0.6))
				if _S.truth((_S.named_value(_n_q_b3,"y") > _n_f_b4)):
					_S.set_prop(_n_q_b3,"y",_n_f_b4,"=")
					_S.set_prop(_n_q_b3,"vy",minf(0,_S.named_value(_n_q_b3,"vy")),"=")
					_S.set_prop(_n_q_b3,"vx",(1 - (2 * _n_dt_b0)),"*=")
			_n_i_b2 -= 1.0
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_PK = _S.read(_parent,"PK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_kind_b1 = _S.arg(_args,1)
	var _n_light_b2 = _S.coalesce(_S.arg(_args,2),func():return null)
	var _n_F_b3 = _S.named_value(_this,"F")
	var _n_n_b4 = _S.prop(_n_F_b3,"length")
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_q_b5 = _iter_0
		if _S.truth(((_S.named_value(_n_q_b5,"delay") > 0) if _S.truth((_S.named_value(_n_q_b5,"delay") > 0)) else _S.binary("!==",_S.named_value(_n_q_b5,"k"),_n_kind_b1))):
			continue
		var _n_k_b6 = (float(_S.named_value(_n_q_b5,"life"))/_S.named_value(_n_q_b5,"max"))
		var _n_age_b7 = (1 - _n_k_b6)
		var _n_x_b8 = _S.named_value(_n_q_b5,"x")
		var _n_y_b9 = _S.named_value(_n_q_b5,"y")
		if _S.truth(_S.binary("===",_S.named_value(_n_q_b5,"k"),_S.named_value(_n_PK,"FLAME"))):
			var _n_heat_b25 = minf(0.999,(pow(_n_age_b7,0.62) + (fmod(_S.named_value(_n_q_b5,"seed"),1) * 0.1)))
			var _n_idx_b26 = minf((_n_n_b4 - 2),floori((_n_heat_b25 * (_n_n_b4 - 1))))
			var _n_r_b27 = ((_S.named_value(_n_q_b5,"size") * (0.55 + (0.45 * minf(1,(_n_age_b7 * 7))))) * (1 - (_n_age_b7 * 0.55)))
			var _n_c_b28 = _S.index_value(_n_F_b3,_n_idx_b26)
			if _S.truth((_n_idx_b26 >= (_n_n_b4 - 3))):
				_S.invoke(_n_p_b0,"disc",[_n_x_b8, _n_y_b9, _n_r_b27, _n_c_b28, (minf(1,(_n_k_b6 * 3)) * 0.8)])
			else:
				_S.invoke(_n_p_b0,"circle",[_n_x_b8, _n_y_b9, _n_r_b27, _S.index_value(_n_F_b3,minf((_n_n_b4 - 1),(_n_idx_b26 + 2)))])
				_S.invoke(_n_p_b0,"circle",[(_n_x_b8 - (_n_r_b27 * 0.16)), (_n_y_b9 - (_n_r_b27 * 0.22)), (_n_r_b27 * 0.78), _n_c_b28])
				if _S.truth((_n_r_b27 > 1.6)):
					_S.invoke(_n_p_b0,"circle",[_n_x_b8, (_n_y_b9 - (_n_r_b27 * 0.9)), (_n_r_b27 * 0.42), _n_c_b28])
				if _S.truth(((_n_r_b27 > 1.8) if _S.truth((_n_idx_b26 <= 3)) else (_n_idx_b26 <= 3))):
					_S.invoke(_n_p_b0,"circle",[(_n_x_b8 - (_n_r_b27 * 0.28)), (_n_y_b9 - (_n_r_b27 * 0.34)), (_n_r_b27 * 0.36), _S.index_value(_n_F_b3,maxf(0,(_n_idx_b26 - 1)))])
				if _S.truth((_n_idx_b26 < 6)):
					_S.invoke(_n_p_b0,"glow",[_n_x_b8, _n_y_b9, ((_n_r_b27 * 2.4) + 2), _n_c_b28, (0.2 * _n_k_b6)])
			continue
		var _n_r_b10 = (_S.named_value(_n_q_b5,"size") * ((0.65 + (minf(1,(_n_age_b7 * 2.5)) * 0.45)) + (_n_age_b7 * 0.45)))
		var _n_a_b11 = ((minf(1,(_n_age_b7 * 10)) * minf(1,(_n_k_b6 * 2.2))) * 0.72)
		var _n_body_b12 = _S.ColorFX.mix(_S.index_value(_S.named_value(_this,"soot"),0),_S.index_value(_S.named_value(_this,"soot"),1),_n_age_b7)
		var _n_edge_b13 = (_n_a_b11 * 0.5)
		var _n_core_b14 = (1 - ((1 - (_n_a_b11 * 0.5)) * (1 - (_n_a_b11 * 0.62))))
		_S.invoke(_n_p_b0,"disc",[_n_x_b8, (_n_y_b9 + (_n_r_b10 * 0.06)), _n_r_b10, _n_body_b12, _S.function_value(_S.capture(_parent,{"core":_n_core_b14,"edge":_n_edge_b13,"this":_this}),"_f25")])
		var _n_lk_b15 = (_S.named_value(_n_light_b2,"k") if _S.truth(_n_light_b2) else 0)
		if _S.truth((_n_lk_b15 < 0.5)):
			_S.invoke(_n_p_b0,"disc",[(_n_x_b8 - (_n_r_b10 * 0.2)), (_n_y_b9 - (_n_r_b10 * 0.32)), (_n_r_b10 * 0.48), _S.named_value(_this,"cap"), (((_n_a_b11 * 0.32) * (1 - (_n_age_b7 * 0.7))) * (1 - (_n_lk_b15 * 2)))])
		if _S.truth((_n_lk_b15 <= 0.02)):
			continue
		var _n_lx_b16 = (_S.named_value(_n_light_b2,"x") - _n_x_b8)
		var _n_ly_b17 = (_S.named_value(_n_light_b2,"y") - _n_y_b9)
		var _n_dl_b18 = _S.logical("||",sqrt(((_n_lx_b16 * _n_lx_b16) + (_n_ly_b17 * _n_ly_b17))),func():return 1)
		var _n_ux_b19 = (float(_n_lx_b16)/_n_dl_b18)
		var _n_uy_b20 = (float(_n_ly_b17)/_n_dl_b18)
		var _n_lit_b21 = (minf(1,(_S.named_value(_n_light_b2,"k") * clampf((1.3 - (float(_n_dl_b18)/_S.named_value(_n_light_b2,"reach"))),0.0,1.0))) * _n_a_b11)
		if _S.truth((_n_lit_b21 <= 0.02)):
			continue
		var _tuple_1 = _S.named_value(_this,"rim")
		var _n_hot_b22 = _S.prop(_tuple_1,0)
		var _n_warm_b23 = _S.prop(_tuple_1,1)
		var _n_dim_b24 = _S.prop(_tuple_1,2)
		_S.invoke(_n_p_b0,"disc",[(_n_x_b8 + ((_n_ux_b19 * _n_r_b10) * 0.26)), (_n_y_b9 + ((_n_uy_b20 * _n_r_b10) * 0.26)), (_n_r_b10 * 0.72), _n_dim_b24, (_n_lit_b21 * 0.55)])
		_S.invoke(_n_p_b0,"disc",[(_n_x_b8 + ((_n_ux_b19 * _n_r_b10) * 0.5)), (_n_y_b9 + ((_n_uy_b20 * _n_r_b10) * 0.5)), (_n_r_b10 * 0.46), _n_warm_b23, (_n_lit_b21 * 0.5)])
		if _S.truth((_n_r_b10 > 3)):
			_S.invoke(_n_p_b0,"disc",[(_n_x_b8 + ((_n_ux_b19 * _n_r_b10) * 0.68)), (_n_y_b9 + ((_n_uy_b20 * _n_r_b10) * 0.68)), (_n_r_b10 * 0.24), _n_hot_b22, (_n_lit_b21 * 0.4)])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_core = _S.read(_parent,"core")
	var _n_edge = _S.read(_parent,"edge")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_core if _S.truth((_n_d_b0 < 0.72)) else _n_edge)
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_o_b0 = _S.coalesce(_S.arg(_args,0),func():return {})
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"floor",(_S.named_value(_n_o_b0,"floor") if _S.named_value(_n_o_b0,"floor")!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f27")),"=")
	_S.set_prop(_this,"onLand",(_S.named_value(_n_o_b0,"onLand") if _S.named_value(_n_o_b0,"onLand")!=null else null),"=")
	_S.set_prop(_this,"g",(_S.named_value(_n_o_b0,"g") if _S.named_value(_n_o_b0,"g")!=null else 0.8),"=")
	return null

static func _f27(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.coalesce(_S.arg(_args,4),func():return 1)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"y":_n_y_b1,"vx":_n_vx_b2,"vy":_n_vy_b3,"size":_n_size_b4}])
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v37, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v37, "i"), 0)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "d", _S.prop(_S.prop(_S.read(_v38, "this"), "list"), _S.read(_v38, "i")))
		_S.set_prop(_S.read(_v38, "d"), "vy", _S.binary("*", _S.binary("*", _S.read(_v38, "GRAVITY"), _S.prop(_S.read(_v38, "this"), "g")), _S.read(_v38, "dt")), "+=", false)
		_S.set_prop(_S.read(_v38, "d"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vx"), 0.4), _S.read(_v38, "dt")), "-=", false)
		_S.set_prop(_S.read(_v38, "d"), "x", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vx"), _S.read(_v38, "dt")), "+=", false)
		_S.set_prop(_S.read(_v38, "d"), "y", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vy"), _S.read(_v38, "dt")), "+=", false)
		_S.define(_v38, "f", _S.invoke(_S.read(_v38, "this"), "floor", [_S.prop(_S.read(_v38, "d"), "x")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v38, "d"), "vy"), 0), func(): return _S.binary(">=", _S.prop(_S.read(_v38, "d"), "y"), _S.read(_v38, "f")))):
			var _v39 = _S.scope(_v38)
			_S.optional_call(_S.prop(_S.read(_v39, "this"), "onLand"), [_S.prop(_S.read(_v39, "d"), "x"), _S.read(_v39, "f"), _S.prop(_S.read(_v39, "d"), "vy"), _S.prop(_S.read(_v39, "d"), "size")])
			_S.invoke(_S.prop(_S.read(_v39, "this"), "list"), "splice", [_S.read(_v39, "i"), 1])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "-=", true)
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_body_b1 = _S.arg(_args,1)
	var _n_shine_b2 = _S.arg(_args,2)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_d_b3 = _iter_0
		var _n_up_b4 = (_S.named_value(_n_d_b3,"vy") < 0)
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_d_b3,"x"), _S.named_value(_n_d_b3,"y"), _n_body_b1])
		if _S.truth((_S.named_value(_n_d_b3,"size") > 1.4)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_d_b3,"x"), (_S.named_value(_n_d_b3,"y") + (1 if _S.truth(_n_up_b4) else (-1))), _n_body_b1])
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_d_b3,"x"), (_S.named_value(_n_d_b3,"y") - (1 if _S.truth((not _S.truth(_n_up_b4) if _S.truth((_S.named_value(_n_d_b3,"size") > 1.4)) else (_S.named_value(_n_d_b3,"size") > 1.4))) else 0)), _n_shine_b2])
	return null
