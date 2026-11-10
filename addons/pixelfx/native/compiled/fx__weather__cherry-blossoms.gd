@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/cherry-blossoms.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "petals", _S.function_value(_e, "_f3"))
	_S.define(_e, "petal", _S.function_value(_e, "_f7"))
	_S.define(_e, "blossoms", _S.function_value(_e, "_f9"))
	_S.define(_e, "scatter", _S.function_value(_e, "_f12"))
	_S.define(_e, "meta", _S.merge([{"name": "Cherry blossoms"}, {"desc": "Pink petals flutter down on a spring breeze, tumbling in little spirals and flashing as they catch the light, with a few whole blossoms spinning among them."}, {"tags": ["weather", "cherry blossom", "sakura", "petals", "spring", "wind", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1832", "#8e3460", "#d26a94", "#f2a2c0", "#ffd2e2", "#fff4f8"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "FLOOR", 1)
	_S.define(_e, "gust", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "SCATTER", _S.construct(_S.read(_e, "Map"), []))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_hex = _S.read(_parent,"hex")
	var _n_rows = _S.read(_parent,"rows")
	var _n_scatter = _S.read(_parent,"scatter")
	var _n_petals = _S.read(_parent,"petals")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_top_b6 = _S.call_value(_n_hex,["#0e0a14"])
	var _n_low_b7 = _S.ColorFX.mix(_S.call_value(_n_hex,["#1a0e1a"]),_S.index_value(_n_C_b5,0),0.4)
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"top":_n_top_b6,"low":_n_low_b7,"this":_this}),"_f1")])
	_S.call_value(_n_scatter,[_n_q_b3, _n_S_b4, _n_C_b5])
	_S.call_value(_n_petals,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 0])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_low = _S.read(_parent,"low")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float((_n_y_b0 + 170))/180)
	_S.invoke(_S.named_value(_n_R_b1,"c"),"fill",[_S.ColorFX.mix(_n_top,_n_low,(_n_k_b2 * _n_k_b2))])
	_S.invoke(_S.named_value(_n_R_b1,"a"),"fill",[(0.3 + (0.12 * _n_k_b2))])
	_S.invoke(_S.named_value(_n_R_b1,"b"),"fill",[1])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_petals = _S.read(_parent,"petals")
	var _n_blossoms = _S.read(_parent,"blossoms")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	_S.call_value(_n_petals,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 1])
	_S.call_value(_n_blossoms,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_n_b5 = (54 if _S.truth(_n_near_b4) else 90)
	var _n_sd_b6 = ((_n_S_b2 * 7) + _n_near_b4)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, _n_n_b5, _n_sd_b6, 1, 2, _S.function_value(_S.capture(_parent,{"sd":_n_sd_b6,"t":_n_t_b1,"near":_n_near_b4,"q":_n_q_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_this = _S.read(_parent,"this")
	var _n_D = _S.read(_parent,"D")
	var _n_t = _S.read(_parent,"t")
	var _n_FLOOR = _S.read(_parent,"FLOOR")
	var _n_near = _S.read(_parent,"near")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_petal = _S.read(_parent,"petal")
	var _n_q = _S.read(_parent,"q")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_R_b5 = _S.function_value(_S.capture(_parent,{"i":_n_i_b3,"j":_n_j_b4,"this":_n_this}),"_f5")
	var _n_dur_b6 = (float(_n_D)/_n_m_b2)
	var _n_tf_b7 = (_n_dur_b6 * 0.84)
	var _n_a_b8 = minf((_n_u_b0 * _n_dur_b6),_n_tf_b7)
	var _n_rest_b9 = ((_n_u_b0 * _n_dur_b6) - _n_tf_b7)
	var _n_born_b10 = (_n_t - (_n_u_b0 * _n_dur_b6))
	var _n_x0_b11 = ((-200) + (_S.call_value(_n_R_b5,[1]) * 330))
	var _n_y0_b12 = (-184)
	var _n_vy_b13 = (float(((_n_FLOOR + (2 if _S.truth(_n_near) else 0)) - _n_y0_b12))/_n_tf_b7)
	var _n_vx_b14 = (9 + (_S.call_value(_n_R_b5,[2]) * 10))
	var _n_rho_b15 = ((3 if _S.truth(_n_near) else 2) + (_S.call_value(_n_R_b5,[3]) * 3))
	var _n_w_b16 = (2.2 + (_S.call_value(_n_R_b5,[4]) * 2.8))
	var _n_ph_b17 = (_S.call_value(_n_R_b5,[5]) * _n_TAU)
	var _n_gk_b18 = (1 if _S.truth(_n_near) else 0.6)
	var _n_at_b19 = _S.function_value(_S.capture(_parent,{"x0":_n_x0_b11,"vx":_n_vx_b14,"born":_n_born_b10,"gk":_n_gk_b18,"rho":_n_rho_b15,"w":_n_w_b16,"ph":_n_ph_b17,"y0":_n_y0_b12,"vy":_n_vy_b13,"this":_n_this}),"_f6")
	var _n_len_b20 = ((3.6 if _S.truth(_n_near) else 2.6) + (_S.call_value(_n_R_b5,[6]) * 1.1))
	if _S.truth((_n_rest_b9 > 0)):
		var _tuple_0 = _S.call_value(_n_at_b19,[_n_tf_b7])
		var _n_x_b25 = _S.prop(_tuple_0,0)
		var _n_y_b26 = _S.prop(_tuple_0,1)
		var _n_fade_b27 = (1 - (float(_n_rest_b9)/(_n_dur_b6 - _n_tf_b7)))
		if _S.truth((_n_fade_b27 > 0.15)):
			_S.call_value(_n_petal,[_n_q, _n_x_b25, _n_y_b26, (_n_len_b20 * (0.35 + (0.65 * _n_fade_b27))), ((_S.call_value(_n_R_b5,[7]) - 0.5) * 1.2), 0.5, _n_C, 1])
		return null
	var _tuple_1 = _S.call_value(_n_at_b19,[_n_a_b8])
	var _n_x_b21 = _S.prop(_tuple_1,0)
	var _n_y_b22 = _S.prop(_tuple_1,1)
	var _n_flip_b23 = cos(((_S.call_value(_n_R_b5,[8]) * _n_TAU) + (_n_a_b8 * (3 + (_S.call_value(_n_R_b5,[9]) * 5)))))
	var _n_ang_b24 = ((_S.call_value(_n_R_b5,[10]) * _n_TAU) + ((_n_a_b8 * (_S.call_value(_n_R_b5,[11]) - 0.5)) * 3))
	_S.call_value(_n_petal,[_n_q, _n_x_b21, _n_y_b22, _n_len_b20, _n_ang_b24, _n_flip_b23, _n_C, 1])
	if _S.truth((_n_flip_b23 > 0.9)):
		var _n_g_b28 = (float((_n_flip_b23 - 0.9))/0.1)
		_S.invoke(_n_q,"px",[_n_x_b21, (_n_y_b22 - 1), _n_WHITE])
		_S.invoke(_n_q,"glow",[_n_x_b21, _n_y_b22, (7 if _S.truth(_n_near) else 5), _S.index_value(_n_C,4), ((0.32 if _S.truth(_n_near) else 0.22) * _n_g_b28)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_sd = _S.read(_parent,"sd")
	var _n_i = _S.read(_parent,"i")
	var _n_j = _S.read(_parent,"j")
	var _n_c_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_sd,_n_i,_n_j,_n_c_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_vx = _S.read(_parent,"vx")
	var _n_gust = _S.read(_parent,"gust")
	var _n_born = _S.read(_parent,"born")
	var _n_gk = _S.read(_parent,"gk")
	var _n_rho = _S.read(_parent,"rho")
	var _n_w = _S.read(_parent,"w")
	var _n_ph = _S.read(_parent,"ph")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_vy = _S.read(_parent,"vy")
	var _n_aa_b0 = _S.arg(_args,0)
	return [(((_n_x0 + (_n_vx * _n_aa_b0)) + ((_S.call_value(_n_gust,[(_n_born + _n_aa_b0)]) - _S.call_value(_n_gust,[_n_born])) * _n_gk)) + (_n_rho * cos(((_n_w * _n_aa_b0) + _n_ph)))), ((_n_y0 + (_n_vy * _n_aa_b0)) + ((_n_rho * 0.6) * sin(((_n_w * _n_aa_b0) + _n_ph))))]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_ang_b4 = _S.arg(_args,4)
	var _n_flip_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_a_b7 = _S.arg(_args,7)
	var _n_fs_b8 = (0.3 + (0.7 * absf(_n_flip_b5)))
	var _n_back_b9 = (_n_flip_b5 < (-0.2))
	var _n_c_b10 = cos(_n_ang_b4)
	var _n_s_b11 = sin(_n_ang_b4)
	var _n_e_b12 = (_n_len_b3 + 1)
	var _n_face_b13 = ([_S.index_value(_n_C_b6,1), _S.index_value(_n_C_b6,2), _S.index_value(_n_C_b6,3)] if _S.truth(_n_back_b9) else [_S.index_value(_n_C_b6,2), _S.index_value(_n_C_b6,3), _S.index_value(_n_C_b6,4)])
	var _n_tip_b14 = (_S.index_value(_n_C_b6,3) if _S.truth(_n_back_b9) else _S.index_value(_n_C_b6,5))
	_S.invoke(_n_q_b0,"shade",[(_n_x_b1 - _n_e_b12), (_n_y_b2 - _n_e_b12), (_n_x_b1 + _n_e_b12), (_n_y_b2 + _n_e_b12), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"c":_n_c_b10,"s":_n_s_b11,"len":_n_len_b3,"fs":_n_fs_b8,"tip":_n_tip_b14,"face":_n_face_b13,"a":_n_a_b7,"this":_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c = _S.read(_parent,"c")
	var _n_s = _S.read(_parent,"s")
	var _n_len = _S.read(_parent,"len")
	var _n_fs = _S.read(_parent,"fs")
	var _n_tip = _S.read(_parent,"tip")
	var _n_face = _S.read(_parent,"face")
	var _n_a = _S.read(_parent,"a")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _n_x)
	var _n_dy_b4 = (_n_py_b1 - _n_y)
	var _n_u_b5 = (float(((_n_dx_b3 * _n_c) + (_n_dy_b4 * _n_s)))/_n_len)
	var _n_v_b6 = (float((((-_n_dx_b3) * _n_s) + (_n_dy_b4 * _n_c)))/(_n_len * _n_fs))
	if _S.truth(((_n_u_b5 < (-1)) if _S.truth((_n_u_b5 < (-1))) else (_n_u_b5 > 1))):
		return null
	var _n_hw_b7 = ((0.55 * sqrt((1 - (_n_u_b5 * _n_u_b5)))) * (1 + (0.35 * _n_u_b5)))
	if _S.truth(_S.logical("||",(absf(_n_v_b6) > _n_hw_b7),func():return ((absf(_n_v_b6) < 0.12) if _S.truth((_n_u_b5 > 0.7)) else (_n_u_b5 > 0.7)))):
		return null
	_S.set_prop(_n_out_b2,"c",(_n_tip if _S.truth(((_n_v_b6 < 0.1) if _S.truth((_n_u_b5 > 0.45)) else (_n_u_b5 > 0.45))) else (_S.index_value(_n_face,0) if _S.truth((_n_u_b5 < (-0.45))) else (_S.index_value(_n_face,2) if _S.truth((_n_v_b6 < 0)) else _S.index_value(_n_face,1)))),"=")
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, 7, (_n_S_b2 * 31), 1, 1, _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"t":_n_t_b1,"q":_n_q_b0,"C":_n_C_b3,"this":_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_FLOOR = _S.read(_parent,"FLOOR")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_gust = _S.read(_parent,"gust")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_petal = _S.read(_parent,"petal")
	var _n_q = _S.read(_parent,"q")
	var _n_C = _S.read(_parent,"C")
	var _n_hex = _S.read(_parent,"hex")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_R_b4 = _S.function_value(_S.capture(_parent,{"i":_n_i_b3,"this":_n_this}),"_f11")
	var _n_y_b5 = ((-190) + (((_n_FLOOR + 2) + 190) * minf(1,(float(_n_u_b0)/0.9))))
	var _n_born_b6 = (_n_t - (_n_u_b0 * _n_D))
	if _S.truth((_n_u_b0 > 0.9)):
		return null
	var _n_x_b7 = (((((-190) + (_S.call_value(_n_R_b4,[1]) * 330)) + (((14 * _n_u_b0) * _n_D) * 0.1)) + (_S.call_value(_n_gust,[_n_t]) - _S.call_value(_n_gust,[_n_born_b6]))) + (6 * sin((((_n_u_b0 * _n_TAU) * 2) + (_S.call_value(_n_R_b4,[2]) * 6)))))
	var _n_rot_b8 = ((_S.call_value(_n_R_b4,[3]) * _n_TAU) + (((_n_u_b0 * _n_D) * (_S.call_value(_n_R_b4,[4]) - 0.5)) * 2))
	var _n_r_b9 = (3.6 + (_S.call_value(_n_R_b4,[5]) * 1.2))
	if true:
		var _n_p_b10 = 0
		while _S.truth((_n_p_b10 < 5)):
			var _n_an_b11 = (_n_rot_b8 + (float((_n_p_b10 * _n_TAU))/5))
			_S.call_value(_n_petal,[_n_q, (_n_x_b7 + ((cos(_n_an_b11) * _n_r_b9) * 0.75)), (_n_y_b5 + ((sin(_n_an_b11) * _n_r_b9) * 0.75)), (_n_r_b9 * 0.7), _n_an_b11, 1, _n_C, 1])
			_n_p_b10 += 1.0
	_S.invoke(_n_q,"px",[_n_x_b7, _n_y_b5, _S.call_value(_n_hex,["#ffe08a"])])
	_S.invoke(_n_q,"glow",[_n_x_b7, _n_y_b5, 8, _S.index_value(_n_C,4), 0.2])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_i = _S.read(_parent,"i")
	var _n_c_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([(_n_S * 31),_n_i,_n_c_b0])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "key", _S.binary("+", _S.read(_e, "S"), _S.invoke(_S.read(_e, "C"), "join", [])))
	_S.define(_e, "px", _S.invoke(_S.read(_e, "SCATTER"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "px"))):
		var _v6 = _S.scope(_e)
		_S.write(_v6, "px", [], "=", false)
		_S.define(_v6, "rec", _S.merge([{"shade": _S.function_value(_v6, "_f13")}]))
		var _v10 = _S.scope(_v6)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 46)):
			_S.call_value(_S.read(_v10, "petal"), [_S.read(_v10, "rec"), _S.binary("+", _S.unary("-", 164), _S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 71]), 328)), _S.binary("+", _S.read(_v10, "FLOOR"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 72]), 3)]), 2)), _S.binary("+", 2.6, _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 73])), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 74]), 0.5), 1.2), 0.5, _S.read(_v10, "C"), 1])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		_S.invoke(_S.read(_v6, "SCATTER"), "set", [_S.read(_v6, "key"), _S.read(_v6, "px")])
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "px"), "length"))):
		_S.invoke(_S.read(_v11, "q"), "dot", [_S.prop(_S.read(_v11, "px"), _S.read(_v11, "i")), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 1)), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 2)), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 3))])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 4, "+=", false)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_px = _S.read(_parent,"px")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_o_b5 = {"c":0,"a":1}
	if true:
		var _n_y_b6 = floori(_n_y0_b1)
		while _S.truth((_n_y_b6 <= ceili(_n_y1_b3))):
			if true:
				var _n_x_b7 = floori(_n_x0_b0)
				while _S.truth((_n_x_b7 <= ceili(_n_x1_b2))):
					_S.set_prop(_n_o_b5,"c",0,"=")
					var _n_c_b8 = _S.logical("||",_S.call_value(_n_fn_b4,[(_n_x_b7 + 0.5), (_n_y_b6 + 0.5), _n_o_b5]),func():return _S.named_value(_n_o_b5,"c"))
					if _S.truth(_n_c_b8):
						_S.invoke(_n_px,"push",[(_n_x_b7 + 0.5), (_n_y_b6 + 0.5), _n_c_b8, _S.named_value(_n_o_b5,"a")])
					_n_x_b7 += 1.0
			_n_y_b6 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	return ((22 * sin(((float((_n_TAU * _n_t_b0))/_n_D) + 0.4))) + (7 * sin(((float(((_n_TAU * 2) * _n_t_b0))/_n_D) - 1))))
	return null
