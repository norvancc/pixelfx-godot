@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/bat.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "wingPts", _S.function_value(_e, "_f1"))
	_S.define(_e, "bat", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Bat"}, {"desc": "A bat flaps in four snappy wing frames along a figure-eight, its body lifting on each downbeat, moonlight on its wing bones, red eyes glowing and glinting."}, {"tags": ["critter", "bat", "night", "flying", "spooky", "loop"]}, {"size": [112, 80]}, {"origin": [56, 40]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c0912", "#1f1629", "#382645", "#5b3f66", "#866089", "#b88fb0", "#e8cfe0"]}, {"eyes": ["#8a1020", "#ff3b30", "#ffb04a", "#fff0c0"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "FLAPS", 6)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 24), _S.unary("-", 22), 48, 40]))
	_S.define(_e, "FRAMES", [_S.merge([{"arm": _S.unary("-", 58)}, {"al": 8}, {"f": [_S.unary("-", 112), _S.unary("-", 76), _S.unary("-", 38)]}, {"fl": [9, 11, 9]}, {"lift": 1}]), _S.merge([{"arm": _S.unary("-", 18)}, {"al": 9}, {"f": [_S.unary("-", 40), _S.unary("-", 12), 16]}, {"fl": [10, 11, 9]}, {"lift": 0}]), _S.merge([{"arm": 28}, {"al": 8}, {"f": [50, 72, 94]}, {"fl": [9, 10, 8]}, {"lift": _S.unary("-", 2)}]), _S.merge([{"arm": _S.unary("-", 42)}, {"al": 6}, {"f": [_S.unary("-", 66), _S.unary("-", 38), _S.unary("-", 10)]}, {"fl": [7, 8, 6]}, {"lift": _S.unary("-", 1)}])])
	_S.define(_e, "rad", _S.function_value(_e, "_f12"))
	_S.define(_e, "frameAt", _S.function_value(_e, "_f13"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = ((float(_n_t_b0)/_n_D) * _n_TAU)
	return {"x":(22 * sin(_n_a_b1)),"y":(7 * sin((2 * _n_a_b1))),"vx":cos(_n_a_b1)}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_rad = _S.read(_parent,"rad")
	var _n_F_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_sh_b2 = [(_n_s_b1 * 2.5), (-2)]
	var _n_ar_b3 = _S.call_value(_n_rad,[_S.named_value(_n_F_b0,"arm")])
	var _n_wr_b4 = [(_S.index_value(_n_sh_b2,0) + ((_n_s_b1 * cos(_n_ar_b3)) * _S.named_value(_n_F_b0,"al"))), (_S.index_value(_n_sh_b2,1) + (sin(_n_ar_b3) * _S.named_value(_n_F_b0,"al")))]
	var _n_tips_b5 = _S.invoke(_S.named_value(_n_F_b0,"f"),"map",[_S.function_value(_S.capture(_parent,{"wr":_n_wr_b4,"s":_n_s_b1,"F":_n_F_b0,"this":_this}),"_f2")])
	var _n_pull_b6 = _S.function_value(_S.capture(_parent,{"wr":_n_wr_b4,"this":_this}),"_f3")
	var _n_hip_b7 = [(_n_s_b1 * 2), 3.5]
	return {"sh":_n_sh_b2,"wr":_n_wr_b4,"tips":_n_tips_b5,"hip":_n_hip_b7,"poly":[_n_sh_b2, _n_wr_b4, _S.index_value(_n_tips_b5,0), _S.call_value(_n_pull_b6,[_S.index_value(_n_tips_b5,0), _S.index_value(_n_tips_b5,1), 0.22]), _S.index_value(_n_tips_b5,1), _S.call_value(_n_pull_b6,[_S.index_value(_n_tips_b5,1), _S.index_value(_n_tips_b5,2), 0.22]), _S.index_value(_n_tips_b5,2), _S.call_value(_n_pull_b6,[_S.index_value(_n_tips_b5,2), _n_hip_b7, 0.38]), _n_hip_b7]}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_wr = _S.read(_parent,"wr")
	var _n_s = _S.read(_parent,"s")
	var _n_rad = _S.read(_parent,"rad")
	var _n_F = _S.read(_parent,"F")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [(_S.index_value(_n_wr,0) + ((_n_s * cos(_S.call_value(_n_rad,[_n_d_b0]))) * _S.index_value(_S.named_value(_n_F,"fl"),_n_i_b1))), (_S.index_value(_n_wr,1) + (sin(_S.call_value(_n_rad,[_n_d_b0])) * _S.index_value(_S.named_value(_n_F,"fl"),_n_i_b1)))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_wr = _S.read(_parent,"wr")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return [_S.numeric_lerp((float((_S.index_value(_n_a_b0,0) + _S.index_value(_n_b_b1,0)))/2),_S.index_value(_n_wr,0),_n_k_b2), _S.numeric_lerp((float((_S.index_value(_n_a_b0,1) + _S.index_value(_n_b_b1,1)))/2),_S.index_value(_n_wr,1),_n_k_b2)]
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wingPts = _S.read(_parent,"wingPts")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	_S.invoke(_n_g_b0,"clear",[])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b5 = _iter_0
		var _n_w_b6 = _S.call_value(_n_wingPts,[_n_F_b3, _n_s_b5])
		var _n_lead_b7 = _S.function_value(_S.capture(_parent,{"w":_n_w_b6,"this":_this}),"_f5")
		_S.invoke(_n_g_b0,"poly",[_S.named_value(_n_w_b6,"poly"), _S.function_value(_S.capture(_parent,{"w":_n_w_b6,"lead":_n_lead_b7,"F":_n_F_b3,"C":_n_C_b1,"this":_this}),"_f6")])
		_S.invoke(_n_g_b0,"line",[_S.index_value(_S.named_value(_n_w_b6,"sh"),0), _S.index_value(_S.named_value(_n_w_b6,"sh"),1), _S.index_value(_S.named_value(_n_w_b6,"wr"),0), _S.index_value(_S.named_value(_n_w_b6,"wr"),1), _S.index_value(_n_C_b1,4)])
		for _iter_1 in _S.array(_S.named_value(_n_w_b6,"tips")):
			var _n_tip_b8 = _iter_1
			_S.invoke(_n_g_b0,"line",[_S.index_value(_S.named_value(_n_w_b6,"wr"),0), _S.index_value(_S.named_value(_n_w_b6,"wr"),1), _S.index_value(_n_tip_b8,0), _S.index_value(_n_tip_b8,1), _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f7")])
		_S.invoke(_n_g_b0,"set",[_S.index_value(_S.named_value(_n_w_b6,"wr"),0), (_S.index_value(_S.named_value(_n_w_b6,"wr"),1) - 1), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_g_b0,"ellipse",[0, 0.5, 3.8, 4.8, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f8")])
	for _iter_2 in _S.array([(-1), 1]):
		var _n_s_b9 = _iter_2
		_S.invoke(_n_g_b0,"poly",[[[(_n_s_b9 * 0.6), (-3.5)], [(_n_s_b9 * 3.6), (-9.5)], [(_n_s_b9 * 3.8), (-3)]], (_S.index_value(_n_C_b1,4) if _S.truth((_n_s_b9 < 0)) else _S.index_value(_n_C_b1,3))])
		_S.invoke(_n_g_b0,"line",[(_n_s_b9 * 2.6), (-4), (_n_s_b9 * 3.2), (-7.5), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_g_b0,"set",[(-2), (-1), _S.index_value(_n_E_b2,1)])
	_S.invoke(_n_g_b0,"set",[1, (-1), _S.index_value(_n_E_b2,1)])
	_S.invoke(_n_g_b0,"set",[(-1), 0, _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_g_b0,"set",[0, 0, _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_g_b0,"set",[(-1), 1, _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"set",[0, 1, _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"set",[(-2), 5, _S.index_value(_n_C_b1,3)])
	_S.invoke(_n_g_b0,"set",[1, 5, _S.index_value(_n_C_b1,3)])
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.named_value(_n_w,"wr")
	var _n_ax_b2 = _S.prop(_tuple_0,0)
	var _n_ay_b3 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.index_value(_S.named_value(_n_w,"tips"),0)
	var _n_bx_b4 = _S.prop(_tuple_1,0)
	var _n_by_b5 = _S.prop(_tuple_1,1)
	var _n_dx_b6 = (_n_bx_b4 - _n_ax_b2)
	var _n_dy_b7 = (_n_by_b5 - _n_ay_b3)
	var _n_L_b8 = _S.logical("||",_S.Bridge.hypot([_n_dx_b6, _n_dy_b7]),func():return 1)
	return absf((float((((_n_x_b0 - _n_ax_b2) * _n_dy_b7) - ((_n_y_b1 - _n_ay_b3) * _n_dx_b6)))/_n_L_b8))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_lead = _S.read(_parent,"lead")
	var _n_F = _S.read(_parent,"F")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_near_b2 = _S.Bridge.hypot([(_n_x_b0 - _S.index_value(_S.named_value(_n_w,"sh"),0)), (_n_y_b1 - _S.index_value(_S.named_value(_n_w,"sh"),1))])
	if _S.truth(_S.logical("&&",(_S.call_value(_n_lead,[_n_x_b0, _n_y_b1]) < 1.2),func():return (_S.named_value(_n_F,"arm") < 20))):
		return _S.index_value(_n_C,3)
	return (_S.index_value(_n_C,1) if _S.truth((_n_near_b2 < 4.5)) else _S.index_value(_n_C,2))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,4) if _S.truth((_n_u_b0 < 0.6)) else _S.index_value(_n_C,3))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_nx_b0 = _S.arg(_args,0)
	var _n_ny_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,4) if _S.truth((((_n_nx_b0 * (-0.6)) + (_n_ny_b1 * (-0.8))) > 0.45)) else (_S.index_value(_n_C,2) if _S.truth((((_n_nx_b0 * 0.6) + (_n_ny_b1 * 0.8)) > 0.55)) else (_S.index_value(_n_C,4) if _S.truth(((absf(_n_nx_b0) < 0.5) if _S.truth((_n_ny_b1 > 0.1)) else (_n_ny_b1 > 0.1))) else _S.index_value(_n_C,3))))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_frameAt = _S.read(_parent,"frameAt")
	var _n_FRAMES = _S.read(_parent,"FRAMES")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_bat = _S.read(_parent,"bat")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_E_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"eyes"),4)
	var _n_S_b6 = _S.call_value(_n_at,[_n_t_b3])
	var _n_fi_b7 = _S.call_value(_n_frameAt,[_n_t_b3])
	var _n_F_b8 = _S.index_value(_n_FRAMES,_n_fi_b7)
	var _n_X_b9 = floori(_S.named_value(_n_S_b6,"x")+0.5)
	var _n_Y_b10 = floori((_S.named_value(_n_S_b6,"y") + _S.named_value(_n_F_b8,"lift"))+0.5)
	if true:
		var _n_k_b12 = 2
		while _S.truth((_n_k_b12 <= 16)):
			var _n_A_b13 = _S.call_value(_n_at,[(_n_t_b3 - ((_n_k_b12 - 1) * 0.022))])
			var _n_B2_b14 = _S.call_value(_n_at,[(_n_t_b3 - (_n_k_b12 * 0.022))])
			var _n_u_b15 = (1 - (float(_n_k_b12)/17))
			for _iter_0 in _S.array([(-1.5), 1.5]):
				var _n_ex_b16 = _iter_0
				_S.invoke(_n_p_b0,"glowLine",[(_S.named_value(_n_A_b13,"x") + _n_ex_b16), (_S.named_value(_n_A_b13,"y") - 0.5), (_S.named_value(_n_B2_b14,"x") + _n_ex_b16), (_S.named_value(_n_B2_b14,"y") - 0.5), 2.6, _S.index_value(_n_E_b5,1), (0.16 * _n_u_b15)])
			_n_k_b12 += 1.0
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 9, ((_S.named_value(_n_o_b2,"seed") * 11) + 1), _n_D, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f10")])
	var _n_g_b11 = _n_GRID
	if _S.truth(_S.binary("===",_n_fi_b7,2)):
		_S.call_value(_n_bat,[_n_g_b11, _n_C_b4, _n_E_b5, _S.index_value(_n_FRAMES,1), _n_t_b3])
		_S.invoke(_n_g_b11,"recolor",[_S.function_value(_S.capture(_parent,{"C":_n_C_b4,"this":_this}),"_f11")])
		_S.invoke(_S.named_value(_n_g_b11,"a"),"fill",[0.35])
		_S.invoke(_n_g_b11,"draw",[_n_p_b0, 1, _n_X_b9, ((_n_Y_b10 - _S.named_value(_S.index_value(_n_FRAMES,1),"lift")) + _S.named_value(_n_F_b8,"lift"))])
	_S.call_value(_n_bat,[_n_g_b11, _n_C_b4, _n_E_b5, _n_F_b8, _n_t_b3])
	_S.invoke(_n_g_b11,"draw",[_n_p_b0, 1, _n_X_b9, _n_Y_b10])
	_S.invoke(_n_p_b0,"glow",[(_n_X_b9 - 3), (_n_Y_b10 - 6), 10, _S.index_value(_n_C_b4,5), 0.12])
	for _iter_1 in _S.array([(-1.5), 1.5]):
		var _n_ex_b17 = _iter_1
		_S.invoke(_n_p_b0,"glow",[(_n_X_b9 + _n_ex_b17), (_n_Y_b10 - 0.5), 7, _S.index_value(_n_E_b5,1), 0.6])
		_S.invoke(_n_p_b0,"glow",[(_n_X_b9 + _n_ex_b17), (_n_Y_b10 - 0.5), 2.5, _S.index_value(_n_E_b5,2), 0.5])
	_S.invoke(_n_p_b0,"glow",[_n_X_b9, _n_Y_b10, 22, _S.index_value(_n_E_b5,0), 0.25])
	for _iter_2 in _S.array([0.3, 1.5]):
		var _n_g0_b18 = _iter_2
		var _n_k_b19 = (float(_S.call_value(_n_wrap,[(_n_t_b3 - _n_g0_b18), _n_D]))/0.24)
		if _S.truth((_n_k_b19 < 1)):
			_S.call_value(_n_sparkle,[_n_p_b0, (_n_X_b9 - 2), (_n_Y_b10 - 1), (1 + (2.5 * sin((PI * _n_k_b19)))), _S.index_value(_n_E_b5,3), _S.index_value(_n_E_b5,2), (0.4 * sin((PI * _n_k_b19)))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_r_b2,"range",[(-50), 50]) + (sin(((_n_age_b0 * 1.1) + (_S.invoke(_n_r_b2,"next",[]) * 6))) * 3))
	var _n_y_b4 = (_S.invoke(_n_r_b2,"range",[(-34), 34]) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[(-2), 3])))
	var _n_tw_b5 = sin(((_n_age_b0 * 2.6) + (_S.invoke(_n_r_b2,"next",[]) * 6)))
	var _n_a_b6 = (minf(minf(1,(_n_age_b0 * 2)),((_n_L_b1 - _n_age_b0) * 2)) * (0.4 + (0.5 * _n_tw_b5)))
	_S.invoke(_n_p,"dot",[_n_x_b3, _n_y_b4, (_S.index_value(_n_C,6) if _S.truth((_n_tw_b5 > 0.7)) else _S.index_value(_n_C,5)), _n_a_b6])
	if _S.truth((_n_tw_b5 > 0.5)):
		_S.invoke(_n_p,"glow",[_n_x_b3, _n_y_b4, 3, _S.index_value(_n_C,5), (0.2 * _n_a_b6)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	return _S.ColorFX.mix(_n_c_b2,_S.index_value(_n_C,4),0.35)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_d_b0 = _S.arg(_args,0)
	return (float((_n_d_b0 * PI))/180)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_FLAPS = _S.read(_parent,"FLAPS")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t_b0 = _S.arg(_args,0)
	return fmod(floori((_S.call_value(_n_wrap,[((float(_n_t_b0)/_n_D) * _n_FLAPS), 1]) * 4)),4)
	return null
