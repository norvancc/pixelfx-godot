@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/jellyfish.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "bubble", _S.import_value("fx/critters/_lib.js", "bubble"))
	_S.define(_e, "squeeze", _S.function_value(_e, "_f0"))
	_S.define(_e, "lift", _S.function_value(_e, "_f1"))
	_S.define(_e, "bell", _S.function_value(_e, "_f2"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBell", _S.function_value(_e, "_f4"))
	_S.define(_e, "strand", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawTentacle", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawArms", _S.function_value(_e, "_f11"))
	_S.define(_e, "draw", _S.function_value(_e, "_f12"))
	_S.define(_e, "meta", _S.merge([{"name": "Jellyfish"}, {"desc": "A see-through jellyfish pulses: its bell squeezes to shove it up and relaxes as it sinks, frilled arms and long tentacles trailing, a glow inside, bubbles drifting by."}, {"tags": ["critter", "jellyfish", "sea", "underwater", "glow", "swim", "loop"]}, {"size": [96, 120]}, {"origin": [48, 38]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#140b2b", "#2a1650", "#4b2386", "#7a3cb8", "#b066e0", "#e09cf5", "#ffd6ff", "#ffffff"]}, {"glow": ["#0b3550", "#1f7fa8", "#4fd2e8", "#b8fbff"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 28), 44, 36]))
	_S.define(_e, "W0", 32)
	_S.define(_e, "H0", 18)
	_S.define(_e, "scallop", _S.function_value(_e, "_f18"))
	_S.define(_e, "ARMS", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 40), _S.unary("-", 40), 80, 100]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	if _S.truth((_n_u_b0 < 0.16)):
		return _S.invoke(_n_ease,"outCubic",[(float(_n_u_b0)/0.16)])
	if _S.truth((_n_u_b0 < 0.22)):
		return 1
	if _S.truth((_n_u_b0 < 0.72)):
		return _S.numeric_lerp(1,(-0.14),_S.invoke(_n_ease,"inOutSine",[(float((_n_u_b0 - 0.22))/0.5)]))
	return _S.numeric_lerp((-0.14),0,_S.invoke(_n_ease,"inOutSine",[(float((_n_u_b0 - 0.72))/0.28)]))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	return (((-6) * _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_u_b0,0.04,0.42)])) if _S.truth((_n_u_b0 < 0.42)) else ((-6) + (6 * _S.invoke(_n_ease,"inOutSine",[(float((_n_u_b0 - 0.42))/0.58)]))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_squeeze = _S.read(_parent,"squeeze")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_lift = _S.read(_parent,"lift")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_H0 = _S.read(_parent,"H0")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = _S.call_value(_n_wrap,[_n_t_b0, _n_D])
	var _n_u_b1 = (float(fmod(_n_t_b0,_n_BEAT))/_n_BEAT)
	var _n_c_b2 = _S.call_value(_n_squeeze,[_n_u_b1])
	return {"x":(2 * sin(((float(_n_t_b0)/_n_D) * _n_TAU))),"y":_S.call_value(_n_lift,[_n_u_b1]),"c":_n_c_b2,"W":(_n_W0 * (1 - (0.3 * _n_c_b2))),"H":(_n_H0 * (1 + (0.24 * _n_c_b2)))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_h_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	if _S.truth((_n_h_b0 > _S.named_value(_n_B_b1,"H"))):
		return (-1)
	var _n_hw_b2 = ((float(_S.named_value(_n_B_b1,"W"))/2) * sqrt(maxf(0,(1 - pow((float(maxf(0,_n_h_b0))/_S.named_value(_n_B_b1,"H")),2)))))
	if _S.truth((_n_h_b0 < (_S.named_value(_n_B_b1,"H") * 0.3))):
		_n_hw_b2 -= ((_S.named_value(_n_B_b1,"c") * 2.4) * (1 - (float(_n_h_b0)/(_S.named_value(_n_B_b1,"H") * 0.3))))
	return _n_hw_b2
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_G_b2 = _S.arg(_args,2)
	var _n_B_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_g_b5 = _S.invoke(_n_GRID,"clear",[])
	var _n_bx_b6 = floori(_S.named_value(_n_B_b3,"x")+0.5)
	var _n_by_b7 = floori(_S.named_value(_n_B_b3,"y")+0.5)
	var _n_inside_b8 = _S.function_value(_S.capture(_parent,{"B":_n_B_b3,"this":_this}),"_f5")
	_S.invoke(_n_g_b5,"shade",[(-20), (-26), 20, 3, _S.function_value(_S.capture(_parent,{"bx":_n_bx_b6,"by":_n_by_b7,"inside":_n_inside_b8,"C":_n_C_b1,"this":_this}),"_f6")])
	_S.invoke(_n_g_b5,"depths",[4])
	var _n_iw_b9 = (_S.named_value(_n_B_b3,"W") * 0.36)
	var _n_ih_b10 = (_S.named_value(_n_B_b3,"H") * 0.66)
	var _n_lx_b11 = (_S.named_value(_n_B_b3,"x") - (_S.named_value(_n_B_b3,"W") * 0.22))
	var _n_ly_b12 = (_S.named_value(_n_B_b3,"y") - (_S.named_value(_n_B_b3,"H") * 0.78))
	_S.invoke(_n_g_b5,"recolor",[_S.function_value(_S.capture(_parent,{"bx":_n_bx_b6,"by":_n_by_b7,"g":_n_g_b5,"B":_n_B_b3,"C":_n_C_b1,"iw":_n_iw_b9,"ih":_n_ih_b10,"lx":_n_lx_b11,"ly":_n_ly_b12,"this":_this}),"_f7")])
	for _iter_0 in _S.array([(-0.62), 0.62]):
		var _n_s_b17 = _iter_0
		if true:
			var _n_h_b18 = 2
			while _S.truth((_n_h_b18 < (_S.named_value(_n_B_b3,"H") - 2))):
				var _n_hw_b19 = _S.call_value(_n_halfW,[_n_h_b18, _n_B_b3])
				var _n_x_b20 = (_S.named_value(_n_B_b3,"x") + ((_n_s_b17 * _n_hw_b19) * 0.9))
				var _n_y_b21 = (_S.named_value(_n_B_b3,"y") - _n_h_b18)
				if _S.truth((_S.invoke(_n_g_b5,"depth",[(_n_x_b20 - _n_bx_b6), (_n_y_b21 - _n_by_b7)]) >= 3)):
					_S.invoke(_n_g_b5,"set",[(_n_x_b20 - _n_bx_b6), (_n_y_b21 - _n_by_b7), _S.index_value(_n_C_b1,4), 0.5])
				_n_h_b18 += 1.0
	var _n_pulse_b13 = (0.5 + (0.5 * _S.named_value(_n_B_b3,"c")))
	var _n_cy_b14 = (_S.named_value(_n_B_b3,"y") - (_S.named_value(_n_B_b3,"H") * 0.42))
	var _n_rx_b15 = (_S.named_value(_n_B_b3,"W") * 0.2)
	var _n_ry_b16 = (_S.named_value(_n_B_b3,"H") * 0.2)
	if true:
		var _n_y_b22 = floori((_n_cy_b14 - _n_ry_b16))
		while _S.truth((_n_y_b22 <= (_n_cy_b14 + _n_ry_b16))):
			if true:
				var _n_x_b23 = floori((_S.named_value(_n_B_b3,"x") - _n_rx_b15))
				while _S.truth((_n_x_b23 <= (_S.named_value(_n_B_b3,"x") + _n_rx_b15))):
					var _n_d_b24 = (pow((float(((_n_x_b23 + 0.5) - _S.named_value(_n_B_b3,"x")))/_n_rx_b15),2) + pow((float(((_n_y_b22 + 0.5) - _n_cy_b14))/_n_ry_b16),2))
					if _S.truth(((_n_d_b24 > 1) if _S.truth((_n_d_b24 > 1)) else (_S.invoke(_n_g_b5,"depth",[(_n_x_b23 - _n_bx_b6), (_n_y_b22 - _n_by_b7)]) < 2))):
						_n_x_b23 += 1.0
						continue
					_S.invoke(_n_g_b5,"set",[(_n_x_b23 - _n_bx_b6), (_n_y_b22 - _n_by_b7), (_S.index_value(_n_C_b1,6) if _S.truth((_n_d_b24 < 0.3)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_d_b24 < 0.65)) else _S.index_value(_n_C_b1,4))), (0.9 if _S.truth((_n_d_b24 < 0.3)) else 0.6)])
					_n_x_b23 += 1.0
			_n_y_b22 += 1.0
	_S.invoke(_n_g_b5,"outline",[_S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f8"), 0.9])
	_S.invoke(_n_g_b5,"draw",[_n_p_b0, 1, _n_bx_b6, _n_by_b7])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_B_b3,"x"), (_S.named_value(_n_B_b3,"y") - (_S.named_value(_n_B_b3,"H") * 0.45)), (30 + (6 * _S.named_value(_n_B_b3,"c"))), _S.index_value(_n_C_b1,4), (0.22 + (0.12 * _n_pulse_b13))])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_B_b3,"x"), (_S.named_value(_n_B_b3,"y") - (_S.named_value(_n_B_b3,"H") * 0.45)), 11, _S.index_value(_n_C_b1,6), (0.14 + (0.16 * _n_pulse_b13))])
	for _iter_1 in _S.array([(-1), 1]):
		var _n_s_b25 = _iter_1
		for _iter_2 in _S.array([0.14, 0.42, 0.78]):
			var _n_q_b26 = _iter_2
			var _n_x_b27 = (_S.named_value(_n_B_b3,"x") + ((_n_s_b25 * _S.call_value(_n_halfW,[0.5, _n_B_b3])) * _n_q_b26))
			var _n_y_b28 = (_S.named_value(_n_B_b3,"y") + 1)
			var _n_tw_b29 = (0.6 + (0.4 * sin((((((float(_n_t_b4)/_n_D) * _n_TAU) * 3) + (_n_q_b26 * 9)) + _n_s_b25))))
			_S.invoke(_n_p_b0,"px",[_n_x_b27, _n_y_b28, (_S.index_value(_n_G_b2,3) if _S.truth((_n_tw_b29 > 0.85)) else _S.index_value(_n_G_b2,2))])
			_S.invoke(_n_p_b0,"glow",[_n_x_b27, _n_y_b28, 4, _S.index_value(_n_G_b2,2), (0.4 * _n_tw_b29)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_scallop = _S.read(_parent,"scallop")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_x_b0 - _S.named_value(_n_B,"x"))
	var _n_h_b3 = (_S.named_value(_n_B,"y") - _n_y_b1)
	if _S.truth((_n_h_b3 < (-_S.call_value(_n_scallop,[_n_dx_b2, _n_B])))):
		return false
	var _n_hw_b4 = _S.call_value(_n_halfW,[maxf(0,_n_h_b3), _n_B])
	return ((absf(_n_dx_b2) <= _n_hw_b4) if _S.truth((_n_hw_b4 >= 0)) else (_n_hw_b4 >= 0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_inside = _S.read(_parent,"inside")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_X_b3 = (_n_x_b0 + _n_bx)
	var _n_Y_b4 = (_n_y_b1 + _n_by)
	if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_X_b3, _n_Y_b4]))):
		return 0
	_S.set_prop(_n_o_b2,"t",1,"=")
	return _S.index_value(_n_C,3)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_g = _S.read(_parent,"g")
	var _n_B = _S.read(_parent,"B")
	var _n_C = _S.read(_parent,"C")
	var _n_iw = _S.read(_parent,"iw")
	var _n_ih = _S.read(_parent,"ih")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_tag_b4 = _S.arg(_args,4)
	if _S.truth(_S.binary("!==",_n_tag_b4,1)):
		return _n_c_b2
	var _n_X_b5 = ((_n_x_b0 + _n_bx) + 0.5)
	var _n_Y_b6 = ((_n_y_b1 + _n_by) + 0.5)
	var _n_d_b7 = _S.invoke(_n_g,"depth",[_n_x_b0, _n_y_b1])
	var _n_dx_b8 = (_n_X_b5 - _S.named_value(_n_B,"x"))
	var _n_h_b9 = (_S.named_value(_n_B,"y") - _n_Y_b6)
	var _n_v_b10 = (float(_n_h_b9)/_S.named_value(_n_B,"H"))
	var _n_i_b11 = _S.invoke(_n_g,"idx",[_n_x_b0, _n_y_b1])
	var _n_col_b12 = _S.index_value(_n_C,3)
	var _n_al_b13 = (0.26 + (0.2 * clampf(_n_v_b10,0.0,1.0)))
	var _n_ie_b14 = (pow((float(_n_dx_b8)/_n_iw),2) + pow((float(maxf(0,_n_h_b9))/_n_ih),2))
	if _S.truth(((_n_h_b9 > 0.5) if _S.truth(((_n_ie_b14 < 1.12) if _S.truth((_n_ie_b14 > 0.8)) else (_n_ie_b14 > 0.8))) else ((_n_ie_b14 < 1.12) if _S.truth((_n_ie_b14 > 0.8)) else (_n_ie_b14 > 0.8)))):
		_n_col_b12 = _S.index_value(_n_C,4)
		_n_al_b13 = 0.55
	if _S.truth((_n_h_b9 < 1)):
		_n_col_b12 = _S.index_value(_n_C,5)
		_n_al_b13 = 0.85
	if _S.truth(_S.binary("===",_n_d_b7,2)):
		_n_col_b12 = (_S.index_value(_n_C,5) if _S.truth(((_n_dx_b8 < 0) if _S.truth((_n_v_b10 > 0.5)) else (_n_v_b10 > 0.5))) else _S.index_value(_n_C,4))
		_n_al_b13 = 0.75
	if _S.truth(_S.binary("===",_n_d_b7,1)):
		_n_col_b12 = (_S.index_value(_n_C,6) if _S.truth(((_n_v_b10 > 0.25) if _S.truth((_n_dx_b8 < 0)) else (_n_dx_b8 < 0))) else _S.index_value(_n_C,5))
		_n_al_b13 = 0.92
	var _n_gx_b15 = (_n_X_b5 - _n_lx)
	var _n_gy_b16 = (_n_Y_b6 - _n_ly)
	if _S.truth(((((_n_gx_b15 * _n_gx_b15) + (_n_gy_b16 * _n_gy_b16)) < 26) if _S.truth(((_n_v_b10 > 0.45) if _S.truth(((_n_dx_b8 < (-1)) if _S.truth(_S.binary("===",_n_d_b7,2)) else _S.binary("===",_n_d_b7,2))) else ((_n_dx_b8 < (-1)) if _S.truth(_S.binary("===",_n_d_b7,2)) else _S.binary("===",_n_d_b7,2)))) else ((_n_v_b10 > 0.45) if _S.truth(((_n_dx_b8 < (-1)) if _S.truth(_S.binary("===",_n_d_b7,2)) else _S.binary("===",_n_d_b7,2))) else ((_n_dx_b8 < (-1)) if _S.truth(_S.binary("===",_n_d_b7,2)) else _S.binary("===",_n_d_b7,2))))):
		_n_col_b12 = _S.index_value(_n_C,7)
		_n_al_b13 = 1
	_S.set_prop(_S.named_value(_n_g,"a"),_n_i_b11,_n_al_b13,"=")
	return _n_col_b12
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_nx_b2 = _S.arg(_args,2)
	var _n_ny_b3 = _S.arg(_args,3)
	return (0 if _S.truth((_n_ny_b3 > 0)) else _S.index_value(_n_C,1))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_bell = _S.read(_parent,"bell")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_off_b1 = _S.arg(_args,1)
	var _n_len_b2 = _S.arg(_args,2)
	var _n_step_b3 = _S.arg(_args,3)
	var _n_lag_b4 = _S.arg(_args,4)
	var _n_sway_b5 = _S.arg(_args,5)
	var _n_ph_b6 = _S.arg(_args,6)
	var _n_pull_b7 = _S.arg(_args,7)
	var _n_pts_b8 = []
	var _n_B1_b9 = _S.call_value(_n_bell,[_n_t_b0])
	var _n_o1_b10 = _S.call_value(_n_off_b1,[_n_B1_b9])
	if true:
		var _n_s_b11 = 0
		while _S.truth((_n_s_b11 <= _n_len_b2)):
			var _n_B_b12 = _S.call_value(_n_bell,[(_n_t_b0 - (_n_s_b11 * _n_lag_b4))])
			var _n_relax_b13 = (1 - clampf(_S.named_value(_n_B_b12,"c"),0.0,1.0))
			var _n_ox_b14 = _S.numeric_lerp(_S.index_value(_n_o1_b10,0),_S.index_value(_S.call_value(_n_off_b1,[_n_B_b12]),0),0.4)
			var _n_w_b15 = (((0.3 + (_n_s_b11 * _n_sway_b5)) * (0.55 + (0.65 * _n_relax_b13))) * sin((((((float(_n_t_b0)/_n_D) * _n_TAU) * 2) - (_n_s_b11 * 0.11)) + _n_ph_b6)))
			_S.invoke(_n_pts_b8,"push",[[(((_S.named_value(_n_B_b12,"x") + _n_ox_b14) + _n_w_b15) + ((_n_ox_b14 * _n_s_b11) * ((0.009 * _n_relax_b13) - ((0.005 * _n_pull_b7) * _S.named_value(_n_B_b12,"c"))))), ((_S.named_value(_n_B_b12,"y") + _S.index_value(_n_o1_b10,1)) + (_n_s_b11 * (0.88 + (0.05 * _S.named_value(_n_B_b12,"c")))))]])
			_n_s_b11 += _n_step_b3
	return _n_pts_b8
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_G_b2 = _S.arg(_args,2)
	var _n_pts_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_t_b5 = _S.arg(_args,5)
	var _n_i_b6 = _S.arg(_args,6)
	var _n_n_b7 = _S.prop(_n_pts_b3,"length")
	if true:
		var _n_k_b8 = 1
		while _S.truth((_n_k_b8 < _n_n_b7)):
			var _n_u_b9 = (float(_n_k_b8)/(_n_n_b7 - 1))
			var _tuple_0 = _S.index_value(_n_pts_b3,(_n_k_b8 - 1))
			var _n_x0_b10 = _S.prop(_tuple_0,0)
			var _n_y0_b11 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b3,_n_k_b8)
			var _n_x1_b12 = _S.prop(_tuple_1,0)
			var _n_y1_b13 = _S.prop(_tuple_1,1)
			var _n_c_b14 = ((_S.index_value(_n_C_b1,3) if _S.truth((_n_u_b9 < 0.3)) else (_S.index_value(_n_C_b1,2) if _S.truth((_n_u_b9 < 0.7)) else _S.index_value(_n_C_b1,1))) if _S.truth(_n_back_b4) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_u_b9 < 0.2)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_u_b9 < 0.45)) else (_S.index_value(_n_C_b1,3) if _S.truth((_n_u_b9 < 0.78)) else _S.index_value(_n_C_b1,2)))))
			_S.invoke(_n_p_b0,"line",[_n_x0_b10, _n_y0_b11, _n_x1_b12, _n_y1_b13, _n_c_b14])
			_n_k_b8 += 1.0
	if _S.truth(_n_back_b4):
		return null
	if true:
		var _n_k_b15 = 3
		while _S.truth((_n_k_b15 < _n_n_b7)):
			var _n_tw_b16 = sin((((((float(_n_t_b5)/_n_D) * _n_TAU) * 2) - (_n_k_b15 * 0.5)) + (_n_i_b6 * 1.7)))
			if _S.truth((_n_tw_b16 < 0.3)):
				_n_k_b15 += 4
				continue
			var _tuple_2 = _S.index_value(_n_pts_b3,_n_k_b15)
			var _n_x_b17 = _S.prop(_tuple_2,0)
			var _n_y_b18 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[_n_x_b17, _n_y_b18, (_S.index_value(_n_G_b2,3) if _S.truth((_n_tw_b16 > 0.8)) else _S.index_value(_n_G_b2,2))])
			_S.invoke(_n_p_b0,"glow",[_n_x_b17, _n_y_b18, 3.5, _S.index_value(_n_G_b2,2), (0.35 * _n_tw_b16)])
			_n_k_b15 += 4
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ARMS = _S.read(_parent,"ARMS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_list_b2 = _S.arg(_args,2)
	var _n_back_b3 = _S.arg(_args,3)
	var _n_g_b4 = _S.invoke(_n_ARMS,"clear",[])
	var _n_a_b5 = (0.6 if _S.truth(_n_back_b3) else 0.88)
	for _iter_0 in _S.array(_n_list_b2):
		var _n_arm_b6 = _iter_0
		if _S.truth(_S.binary("!==",_S.named_value(_n_arm_b6,"back"),_n_back_b3)):
			continue
		var _n_pts_b7 = _S.named_value(_n_arm_b6,"pts")
		var _n_n_b8 = _S.prop(_n_pts_b7,"length")
		var _n_lastRow_b9 = (-1000000000)
		if true:
			var _n_k_b10 = 1
			while _S.truth((_n_k_b10 < _n_n_b8)):
				var _tuple_1 = _S.index_value(_n_pts_b7,(_n_k_b10 - 1))
				var _n_x0_b11 = _S.prop(_tuple_1,0)
				var _n_y0_b12 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_n_pts_b7,_n_k_b10)
				var _n_x1_b13 = _S.prop(_tuple_2,0)
				var _n_y1_b14 = _S.prop(_tuple_2,1)
				var _n_m_b15 = maxf(1,ceili((absf((_n_y1_b14 - _n_y0_b12)) * 2)))
				if true:
					var _n_j_b16 = 0
					while _S.truth((_n_j_b16 < _n_m_b15)):
						var _n_q_b17 = (float(_n_j_b16)/_n_m_b15)
						var _n_x_b18 = _S.numeric_lerp(_n_x0_b11,_n_x1_b13,_n_q_b17)
						var _n_y_b19 = _S.numeric_lerp(_n_y0_b12,_n_y1_b14,_n_q_b17)
						var _n_u_b20 = (float(((_n_k_b10 - 1) + _n_q_b17))/(_n_n_b8 - 1))
						var _n_wd_b21 = _S.numeric_lerp(2.2,0.6,_n_u_b20)
						if true:
							var _n_i_b23 = (-ceili(_n_wd_b21))
							while _S.truth((_n_i_b23 <= ceili(_n_wd_b21))):
								if _S.truth((absf(_n_i_b23) > (_n_wd_b21 + 0.2))):
									_n_i_b23 += 1.0
									continue
								_S.invoke(_n_g_b4,"set",[(_n_x_b18 + _n_i_b23), _n_y_b19, (_S.index_value(_n_C_b1,(4 if _S.truth(_n_back_b3) else 6)) if _S.truth((_n_i_b23 < 0)) else (_S.index_value(_n_C_b1,(2 if _S.truth(_n_back_b3) else 4)) if _S.truth((_n_i_b23 > 0)) else _S.index_value(_n_C_b1,(3 if _S.truth(_n_back_b3) else 5)))), _n_a_b5])
								_n_i_b23 += 1.0
						var _n_row_b22 = floori(_n_y_b19)
						if _S.truth(((_n_u_b20 < 0.85) if _S.truth((_S.binary("===",fmod(_n_row_b22,3),0) if _S.truth(_S.binary("!==",_n_row_b22,_n_lastRow_b9)) else _S.binary("!==",_n_row_b22,_n_lastRow_b9))) else (_S.binary("===",fmod(_n_row_b22,3),0) if _S.truth(_S.binary("!==",_n_row_b22,_n_lastRow_b9)) else _S.binary("!==",_n_row_b22,_n_lastRow_b9)))):
							_S.invoke(_n_g_b4,"set",[(_n_x_b18 + (((-_n_wd_b21) - 1.2) if _S.truth(fmod((float(_n_row_b22)/3),2)) else (_n_wd_b21 + 1.2))), _n_y_b19, _S.index_value(_n_C_b1,(4 if _S.truth(_n_back_b3) else 6)), _n_a_b5])
						_n_lastRow_b9 = _n_row_b22
						_n_j_b16 += 1.0
				_n_k_b10 += 1.0
	_S.invoke(_n_g_b4,"draw",[_n_p_b0])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_bell = _S.read(_parent,"bell")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_strand = _S.read(_parent,"strand")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_ease = _S.read(_parent,"ease")
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_drawTentacle = _S.read(_parent,"drawTentacle")
	var _n_drawArms = _S.read(_parent,"drawArms")
	var _n_drawBell = _S.read(_parent,"drawBell")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_G_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"glow"),4)
	var _n_B_b6 = _S.call_value(_n_bell,[_n_t_b3])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 16, ((_S.named_value(_n_o_b2,"seed") * 5) + 1), _n_D, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"G":_n_G_b5,"C":_n_C_b4,"this":_this}),"_f13")])
	var _n_tents_b7 = []
	var _n_arms_b8 = []
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 9)):
			var _n_r_b10 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b9,4])
			var _n_q_b11 = (((-0.88) + (float((1.76 * _n_i_b9))/8)) + _S.invoke(_n_r_b10,"range",[(-0.05), 0.05]))
			var _n_back_b12 = _S.binary("===",fmod(_n_i_b9,2),1)
			_S.invoke(_n_tents_b7,"push",[{"back":_n_back_b12,"i":_n_i_b9,"pts":_S.call_value(_n_strand,[_n_t_b3, _S.function_value(_S.capture(_parent,{"q":_n_q_b11,"this":_this}),"_f14"), _S.invoke(_n_r_b10,"range",[36, 50]), 1.5, 0.022, 0.065, _S.invoke(_n_r_b10,"range",[0, _n_TAU]), 1])}])
			_n_i_b9 += 1.0
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < 4)):
			var _n_r_b14 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b13,9])
			var _n_q_b15 = _S.index_value([(-0.32), (-0.1), 0.12, 0.3],_n_i_b13)
			var _n_back_b16 = (_S.binary("===",_n_i_b13,1) if _S.truth(_S.binary("===",_n_i_b13,1)) else _S.binary("===",_n_i_b13,2))
			_S.invoke(_n_arms_b8,"push",[{"back":_n_back_b16,"pts":_S.call_value(_n_strand,[_n_t_b3, _S.function_value(_S.capture(_parent,{"q":_n_q_b15,"this":_this}),"_f15"), _S.invoke(_n_r_b14,"range",[20, 27]), 1, 0.03, 0.06, (_S.invoke(_n_r_b14,"range",[0, _n_TAU]) + _n_i_b13), 0.4])}])
			_n_i_b13 += 1.0
	if true:
		var _n_b_b17 = 0
		while _S.truth((_n_b_b17 < 2)):
			var _n_age_b18 = _S.call_value(_n_wrap,[((_n_t_b3 - (_n_b_b17 * _n_BEAT)) - 0.05), _n_D])
			if _S.truth((_n_age_b18 > 0.9)):
				_n_b_b17 += 1.0
				continue
			var _n_B0_b19 = _S.call_value(_n_bell,[((_n_b_b17 * _n_BEAT) + 0.05)])
			var _n_e_b20 = _S.invoke(_n_ease,"outCubic",[(float(_n_age_b18)/0.9)])
			var _n_k_b21 = (1 - (float(_n_age_b18)/0.9))
			var _n_cx_b22 = _S.named_value(_n_B0_b19,"x")
			var _n_cy_b23 = ((_S.named_value(_n_B0_b19,"y") + 3) + (14 * _n_e_b20))
			var _n_rx_b24 = ((_S.named_value(_n_B0_b19,"W") * 0.32) + (9 * _n_e_b20))
			var _n_ry_b25 = (1.5 + (2.5 * _n_e_b20))
			if true:
				var _n_j_b26 = 0
				while _S.truth((_n_j_b26 < 8)):
					var _n_a_b27 = (((float(_n_j_b26)/8) * _n_TAU) + (_n_e_b20 * 0.8))
					_S.invoke(_n_p_b0,"glow",[(_n_cx_b22 + (cos(_n_a_b27) * _n_rx_b24)), (_n_cy_b23 + (sin(_n_a_b27) * _n_ry_b25)), (5 + (3 * _n_e_b20)), _S.index_value(_n_C_b4,5), (0.14 * _n_k_b21)])
					_n_j_b26 += 1.0
			if true:
				var _n_j_b28 = 0
				while _S.truth((_n_j_b28 < 7)):
					var _n_a_b29 = ((((float(_n_j_b28)/7) * _n_TAU) + (_n_e_b20 * 2.4)) + _n_b_b17)
					var _n_x_b30 = (_n_cx_b22 + ((cos(_n_a_b29) * _n_rx_b24) * 1.05))
					var _n_y_b31 = ((_n_cy_b23 + ((sin(_n_a_b29) * _n_ry_b25) * 1.4)) - (cos((_n_a_b29 * 2)) * 0.6))
					if _S.truth((fmod(_n_j_b28,2) if _S.truth((_n_k_b21 < 0.15)) else (_n_k_b21 < 0.15))):
						_n_j_b28 += 1.0
						continue
					_S.invoke(_n_p_b0,"dot",[_n_x_b30, _n_y_b31, (_S.index_value(_n_G_b5,3) if _S.truth((sin(_n_a_b29) > 0)) else _S.index_value(_n_G_b5,2)), minf(1,(_n_k_b21 * 2.5))])
					_S.invoke(_n_p_b0,"glow",[_n_x_b30, _n_y_b31, 3, _S.index_value(_n_G_b5,2), (0.3 * _n_k_b21)])
					_n_j_b28 += 1.0
			if true:
				var _n_i_b32 = 0
				while _S.truth((_n_i_b32 < 4)):
					var _n_r_b33 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_b_b17,_n_i_b32,13])
					var _n_L_b34 = _S.invoke(_n_r_b33,"range",[1.4, 2.2])
					var _n_ag_b35 = _S.call_value(_n_wrap,[(((_n_t_b3 - (_n_b_b17 * _n_BEAT)) - 0.08) - (_n_i_b32 * 0.04)), _n_D])
					if _S.truth((_n_ag_b35 > _n_L_b34)):
						_n_i_b32 += 1.0
						continue
					var _n_rad_b36 = _S.invoke(_n_r_b33,"range",[0.6, 1.5])
					var _n_sx_b37 = _S.invoke(_n_r_b33,"sign",[])
					var _n_x_b38 = (_S.named_value(_n_B0_b19,"x") + (_n_sx_b37 * (((_S.named_value(_n_B0_b19,"W") * 0.4) + _S.invoke(_n_r_b33,"range",[0, 4])) + (_n_ag_b35 * _S.invoke(_n_r_b33,"range",[4, 10])))))
					var _n_y_b39 = (((_S.named_value(_n_B0_b19,"y") + 2) - ((14 + (10 * _n_rad_b36)) * _n_ag_b35)) + (6 * exp(((-_n_ag_b35) * 4))))
					if _S.truth((_n_y_b39 < (-33))):
						_n_i_b32 += 1.0
						continue
					_S.call_value(_n_bubble,[_n_p_b0, (_n_x_b38 + (sin(((_n_ag_b35 * 5) + _n_i_b32)) * 0.8)), _n_y_b39, _n_rad_b36, [_S.index_value(_n_G_b5,3), _S.index_value(_n_G_b5,3), _S.index_value(_n_G_b5,2), _S.index_value(_n_G_b5,1)], minf(minf(minf(1,(_n_ag_b35 * 6)),((_n_L_b34 - _n_ag_b35) * 3)),(float((_n_y_b39 + 33))/6))])
					_n_i_b32 += 1.0
			_n_b_b17 += 1.0
	for _iter_0 in _S.array(_n_tents_b7):
		var _n_a_b40 = _iter_0
		if _S.truth(_S.named_value(_n_a_b40,"back")):
			_S.call_value(_n_drawTentacle,[_n_p_b0, _n_C_b4, _n_G_b5, _S.named_value(_n_a_b40,"pts"), true, _n_t_b3, _S.named_value(_n_a_b40,"i")])
	_S.call_value(_n_drawArms,[_n_p_b0, _n_C_b4, _n_arms_b8, true])
	_S.call_value(_n_drawBell,[_n_p_b0, _n_C_b4, _n_G_b5, _n_B_b6, _n_t_b3])
	_S.call_value(_n_drawArms,[_n_p_b0, _n_C_b4, _n_arms_b8, false])
	for _iter_1 in _S.array(_n_tents_b7):
		var _n_a_b41 = _iter_1
		if _S.truth(not _S.truth(_S.named_value(_n_a_b41,"back"))):
			_S.call_value(_n_drawTentacle,[_n_p_b0, _n_C_b4, _n_G_b5, _S.named_value(_n_a_b41,"pts"), false, _n_t_b3, _S.named_value(_n_a_b41,"i")])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 7, ((_S.named_value(_n_o_b2,"seed") * 5) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f16"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"G":_n_G_b5,"this":_this}),"_f17")])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_B_b6,"x"), (_S.named_value(_n_B_b6,"y") + 6), 58, _S.index_value(_n_C_b4,3), 0.14])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_G = _S.read(_parent,"G")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_r_b2,"range",[(-42), 42]) + (sin(((_n_age_b0 * 0.8) + (_S.invoke(_n_r_b2,"next",[]) * 6))) * 3))
	var _n_y_b4 = (_S.invoke(_n_r_b2,"range",[(-34), 66]) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[1, 4])))
	var _n_tw_b5 = sin(((_n_age_b0 * 2.2) + (_S.invoke(_n_r_b2,"next",[]) * 6)))
	var _n_a_b6 = (minf(minf(1,(_n_age_b0 * 2)),((_n_L_b1 - _n_age_b0) * 2)) * (0.35 + (0.35 * _n_tw_b5)))
	_S.invoke(_n_p,"dot",[_n_x_b3, _n_y_b4, (_S.index_value(_n_G,2) if _S.truth((_n_tw_b5 > 0.8)) else _S.index_value(_n_C,3)), _n_a_b6])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_b_b0 = _S.arg(_args,0)
	return [(_n_q * _S.call_value(_n_halfW,[0.5, _n_b_b0])), 0.5]
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_b_b0 = _S.arg(_args,0)
	return [((_n_q * _S.named_value(_n_b_b0,"W")) * 0.5), (-1)]
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.8, 3])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_G = _S.read(_parent,"G")
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_rad_b3 = (_S.invoke(_n_r_b2,"range",[0.6, 1.4]) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.6])) else _S.invoke(_n_r_b2,"range",[1.6, 2.6]))
	var _n_x0_b4 = _S.invoke(_n_r_b2,"range",[(-30), 30])
	var _n_y0_b5 = _S.invoke(_n_r_b2,"range",[10, 70])
	var _n_v_b6 = (20 + (13 * _n_rad_b3))
	var _n_end_b7 = minf(_n_L_b1,(float((_n_y0_b5 + 30))/_n_v_b6))
	if _S.truth((_n_age_b0 > _n_end_b7)):
		return null
	var _n_ph_b8 = (_S.invoke(_n_r_b2,"next",[]) * _n_TAU)
	var _n_x_b9 = (_n_x0_b4 + (sin(((_n_age_b0 * (4 + (float(2)/_n_rad_b3))) + _n_ph_b8)) * (0.6 + (_n_rad_b3 * 0.8))))
	var _n_y_b10 = (_n_y0_b5 - (_n_v_b6 * _n_age_b0))
	_S.call_value(_n_bubble,[_n_p, _n_x_b9, _n_y_b10, _n_rad_b3, [_S.index_value(_n_G,3), _S.index_value(_n_G,3), _S.index_value(_n_G,2), _S.index_value(_n_G,1)], minf(minf(1,(_n_age_b0 * 3)),((_n_end_b7 - _n_age_b0) * 3)), (0.1 * sin(((_n_age_b0 * 9) + _n_ph_b8)))])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	return (1.1 * maxf(0,sin(((((float(_n_dx_b0)/(float(_S.named_value(_n_B_b1,"W"))/2)) * PI) * 4) + (float(PI)/2)))))
	return null
