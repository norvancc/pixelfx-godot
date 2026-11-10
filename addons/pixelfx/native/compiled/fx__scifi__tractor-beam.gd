@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/tractor-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "flash", _S.import_value("fx/scifi/_lib.js", "flash"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "haul", _S.function_value(_e, "_f0"))
	_S.define(_e, "rockAt", _S.function_value(_e, "_f1"))
	_S.define(_e, "rock", _S.function_value(_e, "_f2"))
	_S.define(_e, "pod", _S.function_value(_e, "_f7"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f10"))
	_S.define(_e, "setup", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Tractor beam"}, {"desc": "A hovering pod projects a cone of light to the floor; rocks tear loose in puffs of dust and spiral up spinning into the lens while rings of light climb the beam."}, {"tags": ["scifi", "beam", "tractor", "lift", "abduct", "debris", "ground", "loop"]}, {"size": [120, 132]}, {"origin": [60, 114]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06161a", "#0b2e33", "#11505a", "#1a7f84", "#2bb5a8", "#7ef0c8", "#d6fff0", "#ffffff"]}, {"hull": ["#0d0f17", "#1c2030", "#2e3448", "#4a5470", "#7a86a8", "#b8c4e0"]}, {"stone": ["#1a1622", "#2e2838", "#4a4258", "#6d6480", "#9a90aa"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LENS", _S.unary("-", 84))
	_S.define(_e, "TOPW", 5.5)
	_S.define(_e, "BOTW", 32)
	_S.define(_e, "half", _S.function_value(_e, "_f25"))
	_S.define(_e, "POP", 0.1)
	_S.define(_e, "HOVER", 0.32)
	_S.define(_e, "RISE", 1.4)
	_S.define(_e, "LIFE", _S.binary("+", _S.binary("+", _S.read(_e, "POP"), _S.read(_e, "HOVER")), _S.read(_e, "RISE")))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_half = _S.read(_parent,"half")
	var _n_BOTW = _S.read(_parent,"BOTW")
	var _n_r0_b0 = _S.arg(_args,0)
	var _n_th0_b1 = _S.arg(_args,1)
	var _n_dir_b2 = _S.arg(_args,2)
	var _n_turns_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_s_b5 = pow(clampf(_n_k_b4,0.0,1.0),1.8)
	var _n_y_b6 = _S.numeric_lerp((-2),(_n_LENS + 5),_n_s_b5)
	var _n_th_b7 = (_n_th0_b1 + (((_n_dir_b2 * _n_TAU) * _n_turns_b3) * _n_s_b5))
	var _n_rr_b8 = ((_n_r0_b0 * (float(_S.call_value(_n_half,[_n_y_b6]))/_n_BOTW)) * (1 - (0.5 * _n_s_b5)))
	return [(cos(_n_th_b7) * _n_rr_b8), _n_y_b6, sin(_n_th_b7)]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_POP = _S.read(_parent,"POP")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_RISE = _S.read(_parent,"RISE")
	var _n_haul = _S.read(_parent,"haul")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_lift_b2 = clampf((float(((_n_age_b1 - _n_POP) - _n_HOVER))/_n_RISE),0.0,1.0)
	if _S.truth((_n_lift_b2 > 0)):
		var _tuple_0 = _S.call_value(_n_haul,[_S.named_value(_n_r_b0,"r0"), _S.named_value(_n_r_b0,"th0"), _S.named_value(_n_r_b0,"dir"), 1.3, _n_lift_b2])
		var _n_x_b5 = _S.prop(_tuple_0,0)
		var _n_y_b6 = _S.prop(_tuple_0,1)
		var _n_z_b7 = _S.prop(_tuple_0,2)
		var _tuple_1 = _S.call_value(_n_haul,[_S.named_value(_n_r_b0,"r0"), _S.named_value(_n_r_b0,"th0"), _S.named_value(_n_r_b0,"dir"), 1.3, (_n_lift_b2 - 0.07)])
		var _n_x1_b8 = _S.prop(_tuple_1,0)
		var _n_y1_b9 = _S.prop(_tuple_1,1)
		return {"x":_n_x_b5,"y":_n_y_b6,"z":_n_z_b7,"px":_n_x1_b8,"py":_n_y1_b9,"size":(_S.named_value(_n_r_b0,"s") * (1 - (0.6 * pow(_n_lift_b2,2.5)))),"a":(_S.named_value(_n_r_b0,"a0") + ((_S.named_value(_n_r_b0,"va") * _n_age_b1) * (0.3 + (_n_lift_b2 * 2)))),"lift":_n_lift_b2}
	var _n_y_b3 = (_S.numeric_lerp(3,(-2),(float(_n_age_b1)/_n_POP)) if _S.truth((_n_age_b1 < _n_POP)) else ((-2) - (2 * _S.MathFX.smooth(0,_n_HOVER,(_n_age_b1 - _n_POP)))))
	var _n_wob_b4 = ((sin(((_n_age_b1 * 55) + (_S.named_value(_n_r_b0,"th0") * 9))) * 0.7) if _S.truth((_n_age_b1 > _n_POP)) else 0)
	return {"x":((cos(_S.named_value(_n_r_b0,"th0")) * _S.named_value(_n_r_b0,"r0")) + _n_wob_b4),"y":_n_y_b3,"z":1,"size":_S.named_value(_n_r_b0,"s"),"a":(_S.named_value(_n_r_b0,"a0") + ((_S.named_value(_n_r_b0,"va") * _n_age_b1) * 0.3)),"lift":0}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_n_b6 = 6
	var _n_R_b7 = maxf(0.9,_S.named_value(_n_q_b1,"size"))
	var _n_ca_b8 = cos(_S.named_value(_n_q_b1,"a"))
	var _n_sa_b9 = sin(_S.named_value(_n_q_b1,"a"))
	var _n_lit_b10 = _S.ColorFX.mix(_S.index_value(_n_S_b3,4),_S.index_value(_n_C_b4,6),(0.3 + (0.6 * _S.named_value(_n_q_b1,"lift"))))
	var _n_rad_b11 = _S.function_value(_S.capture(_parent,{"n":_n_n_b6,"R":_n_R_b7,"r":_n_r_b2,"this":_this}),"_f3")
	if _S.truth((not _S.truth(_n_back_b5) if _S.truth((_S.named_value(_n_q_b1,"lift") > 0.15)) else (_S.named_value(_n_q_b1,"lift") > 0.15))):
		_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b1,"px"), _S.named_value(_n_q_b1,"py"), _S.named_value(_n_q_b1,"x"), _S.named_value(_n_q_b1,"y"), _S.function_value(_S.capture(_parent,{"C":_n_C_b4,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
		if true:
			var _n_i_b12 = 1
			while _S.truth((_n_i_b12 <= 3)):
				_S.invoke(_n_p_b0,"disc",[_S.numeric_lerp(_S.named_value(_n_q_b1,"x"),_S.named_value(_n_q_b1,"px"),(float(_n_i_b12)/3)), (_S.numeric_lerp(_S.named_value(_n_q_b1,"y"),_S.named_value(_n_q_b1,"py"),(float(_n_i_b12)/3)) + 1), (_n_R_b7 * (0.5 + (0.25 * _n_i_b12))), _S.ColorFX.mix(_S.index_value(_n_S_b3,3),_S.index_value(_n_C_b4,5),0.4), ((0.22 * (1 - (float(_n_i_b12)/4))) * _S.named_value(_n_q_b1,"lift"))])
				_n_i_b12 += 1.0
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_q_b1,"x") - _n_R_b7) - 2), ((_S.named_value(_n_q_b1,"y") - _n_R_b7) - 2), ((_S.named_value(_n_q_b1,"x") + _n_R_b7) + 2), ((_S.named_value(_n_q_b1,"y") + _n_R_b7) + 2), _S.function_value(_S.capture(_parent,{"q":_n_q_b1,"ca":_n_ca_b8,"sa":_n_sa_b9,"rad":_n_rad_b11,"S":_n_S_b3,"back":_n_back_b5,"R":_n_R_b7,"C":_n_C_b4,"lit":_n_lit_b10,"this":_this}),"_f6")])
	if _S.truth(((_S.named_value(_n_q_b1,"lift") > 0) if _S.truth(not _S.truth(_n_back_b5)) else not _S.truth(_n_back_b5))):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b1,"x"), (_S.named_value(_n_q_b1,"y") - _n_R_b7), (5 + _n_R_b7), _S.index_value(_n_C_b4,5), (0.25 * _S.named_value(_n_q_b1,"lift"))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_n = _S.read(_parent,"n")
	var _n_R = _S.read(_parent,"R")
	var _n_r = _S.read(_parent,"r")
	var _n_ang_b0 = _S.arg(_args,0)
	var _n_f_b1 = fmod((fmod(((float(_n_ang_b0)/_n_TAU) * _n_n),_n_n) + _n_n),_n_n)
	var _n_i_b2 = floori(_n_f_b1)
	var _n_k_b3 = (_n_f_b1 - _n_i_b2)
	return (_n_R * (0.75 + (0.35 * _S.numeric_lerp(_S.MathFX.rand([_S.named_value(_n_r,"id"),_n_i_b2]),_S.MathFX.rand([_S.named_value(_n_r,"id"),fmod((_n_i_b2 + 1),_n_n)]),_n_k_b3))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,5) if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,3))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (0.7 * _n_u_b0)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_rad = _S.read(_parent,"rad")
	var _n_S = _S.read(_parent,"S")
	var _n_R = _S.read(_parent,"R")
	var _n_back = _S.read(_parent,"back")
	var _n_C = _S.read(_parent,"C")
	var _n_lit = _S.read(_parent,"lit")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_q,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_q,"y"))
	var _n_u_b5 = ((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa))
	var _n_v_b6 = (((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca))
	var _n_d_b7 = _S.Bridge.hypot([_n_u_b5, _n_v_b6])
	var _n_e_b8 = _S.call_value(_n_rad,[atan2(_n_v_b6,_n_u_b5)])
	if _S.truth((_n_d_b7 > (_n_e_b8 + 0.8))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_S,0) if _S.truth((_n_d_b7 > _n_e_b8)) else ((_S.index_value(_n_S,3) if _S.truth((_n_dy_b4 < ((-0.3) * _n_R))) else _S.index_value(_n_S,1)) if _S.truth(_n_back) else ((_S.index_value(_n_C,6) if _S.truth(((_n_d_b7 > (_n_e_b8 - 1)) if _S.truth((_S.named_value(_n_q,"lift") > 0.35)) else (_S.named_value(_n_q,"lift") > 0.35))) else _n_lit) if _S.truth((_n_dy_b4 < ((-0.45) * _n_R))) else ((_S.index_value(_n_S,4) if _S.truth((_n_dx_b3 < 0)) else _S.index_value(_n_S,3)) if _S.truth((_n_dy_b4 < ((-0.1) * _n_R))) else (_S.index_value(_n_S,1) if _S.truth((_n_dy_b4 > (0.35 * _n_R))) else _S.index_value(_n_S,2)))))),"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_y0_b4 = _S.arg(_args,4)
	var _n_y_b5 = floori(_n_y0_b4+0.5)
	_S.invoke(_n_p_b0,"shade",[(-21), (_n_y_b5 - 12), 21, (_n_y_b5 + 6), _S.function_value(_S.capture(_parent,{"y":_n_y_b5,"H":_n_H_b3,"C":_n_C_b2,"this":_this}),"_f8")])
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 6)):
			var _n_lx_b7 = ((-15) + (_n_i_b6 * 6))
			var _n_k_b8 = (0.5 + (0.5 * cos((_n_TAU * ((4 * (float(_n_t_b1)/_n_D)) - (float(_n_i_b6)/6))))))
			_S.invoke(_n_p_b0,"px",[_n_lx_b7, (_n_y_b5 + 1), (_n_WHITE if _S.truth((_n_k_b8 > 0.7)) else (_S.index_value(_n_C_b2,5) if _S.truth((_n_k_b8 > 0.35)) else _S.index_value(_n_C_b2,2)))])
			if _S.truth((_n_k_b8 > 0.5)):
				_S.invoke(_n_p_b0,"glow",[_n_lx_b7, (_n_y_b5 + 1), 5, _S.index_value(_n_C_b2,5), (0.35 * _n_k_b8)])
			_n_i_b6 += 1.0
	_S.invoke(_n_p_b0,"ellipse",[0, (_n_y_b5 + 5.5), 7.5, 2.2, _S.function_value(_S.capture(_parent,{"C":_n_C_b2,"this":_this}),"_f9")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_y = _S.read(_parent,"y")
	var _n_H = _S.read(_parent,"H")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_yy_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dy_b3 = (_n_yy_b1 - _n_y)
	var _n_cx_b4 = (float(_n_x_b0)/8.5)
	var _n_cy_b5 = (float((_n_dy_b3 + 5))/6)
	if _S.truth(((((_n_cx_b4 * _n_cx_b4) + (_n_cy_b5 * _n_cy_b5)) <= 1) if _S.truth((_n_cy_b5 < 0)) else (_n_cy_b5 < 0))):
		var _n_d_b9 = ((_n_cx_b4 * _n_cx_b4) + (_n_cy_b5 * _n_cy_b5))
		var _n_l_b10 = (((-_n_cx_b4) * 0.6) - (_n_cy_b5 * 0.8))
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((_n_d_b9 > 0.8)) else (_n_WHITE if _S.truth((_n_l_b10 > 0.85)) else (_S.index_value(_n_C,6) if _S.truth((_n_l_b10 > 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_l_b10 > 0.2)) else _S.index_value(_n_C,3))))),"=")
		return null
	var _n_hx_b6 = (float(_n_x_b0)/20)
	var _n_hy_b7 = (float((_n_dy_b3 + 0.5))/4.5)
	if _S.truth(((((_n_hx_b6 * _n_hx_b6) + (_n_hy_b7 * _n_hy_b7)) <= 1) if _S.truth((_n_dy_b3 <= 0)) else (_n_dy_b3 <= 0))):
		var _n_d_b11 = ((_n_hx_b6 * _n_hx_b6) + (_n_hy_b7 * _n_hy_b7))
		var _n_l_b12 = (((-_n_hx_b6) * 0.55) - (_n_hy_b7 * 0.7))
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((_n_d_b11 > 0.88)) else (_S.index_value(_n_H,1) if _S.truth(_S.binary("===",_n_dy_b3,(-2))) else (_S.index_value(_n_H,5) if _S.truth((_n_l_b12 > 0.55)) else (_S.index_value(_n_H,4) if _S.truth((_n_l_b12 > 0.25)) else (_S.index_value(_n_H,3) if _S.truth((_n_l_b12 > (-0.1))) else _S.index_value(_n_H,2)))))),"=")
		return null
	var _n_w_b8 = (19.5 - (_n_dy_b3 * 2.4))
	if _S.truth(((absf(_n_x_b0) <= _n_w_b8) if _S.truth(((_n_dy_b3 <= 5) if _S.truth((_n_dy_b3 > 0)) else (_n_dy_b3 > 0))) else ((_n_dy_b3 <= 5) if _S.truth((_n_dy_b3 > 0)) else (_n_dy_b3 > 0)))):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((absf(_n_x_b0) > (_n_w_b8 - 1))) else (_S.index_value(_n_H,2) if _S.truth(_S.binary("===",_n_dy_b3,1)) else (_S.index_value(_n_C,3) if _S.truth(((absf(_n_x_b0) < 9) if _S.truth((_n_dy_b3 >= 4)) else (_n_dy_b3 >= 4))) else _S.index_value(_n_H,1)))),"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.45)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b0 < 0.75)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b0 < 0.9)) else _S.index_value(_n_C,3))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_ry_b5 = (_n_rx_b2 * 0.17)
	if true:
		var _n_i_b6 = 0
		var _n_n_b7 = ceili((_n_rx_b2 * 7))
		while _S.truth((_n_i_b6 < _n_n_b7)):
			var _n_g_b8 = ((float(_n_i_b6)/_n_n_b7) * _n_TAU)
			var _n_s_b9 = sin(_n_g_b8)
			if _S.truth(_S.binary("===",(_n_s_b9 >= 0),_n_back_b4)):
				_n_i_b6 += 1.0
				continue
			_S.invoke(_n_p_b0,"px",[(cos(_n_g_b8) * _n_rx_b2), (_n_y_b1 + (_n_s_b9 * _n_ry_b5)), _n_c_b3])
			_n_i_b6 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Array = _S.read(_parent,"Array")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_P = _S.read(_parent,"P")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_key_b1 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"stone"),"join",[])) + "")
	if _S.truth(_S.invoke(_n_cache,"has",[_n_key_b1])):
		return _S.invoke(_n_cache,"get",[_n_key_b1])
	var _n_C_b2 = _S.ColorFX.fit(_S.named_value(_n_o_b0,"palette"),8)
	var _n_S_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b0,"stone"),5)
	var _n_rn_b4 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_rocks_b5 = _S.invoke(_n_Array,"from",[{"length":7}, _S.function_value(_S.capture(_parent,{"o":_n_o_b0,"rn":_n_rn_b4,"this":_this}),"_f12")])
	var _n_g_b6 = _S.construct(_n_Ghosts,[_n_D, {"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f13"),"box":[(-58), (-112), 58, 14]}])
	for _iter_0 in _S.array(_n_rocks_b5):
		var _n_r_b8 = _iter_0
		var _n_x_b9 = (cos(_S.named_value(_n_r_b8,"th0")) * _S.named_value(_n_r_b8,"r0"))
		if true:
			var _n_i_b10 = 0
			while _S.truth((_n_i_b10 < 5)):
				_S.invoke(_n_g_b6,"add",[(_S.named_value(_n_r_b8,"born") + 0.02), _S.named_value(_n_P,"DUST"), (_n_x_b9 + _S.invoke(_n_rn_b4,"range",[(-3), 3])), (-1), _S.invoke(_n_rn_b4,"range",[(-34), 34]), (-_S.invoke(_n_rn_b4,"range",[8, 26])), _S.invoke(_n_rn_b4,"range",[0.5, 0.9]), _S.ColorFX.mix(_S.index_value(_n_S_b3,3),_S.index_value(_n_C_b2,4),0.3), _S.invoke(_n_rn_b4,"range",[2.2, 3.6])])
				_n_i_b10 += 1.0
		if true:
			var _n_i_b11 = 0
			while _S.truth((_n_i_b11 < 6)):
				_S.invoke(_n_g_b6,"add",[(_S.named_value(_n_r_b8,"born") + 0.02), _S.named_value(_n_P,"GRIT"), (_n_x_b9 + _S.invoke(_n_rn_b4,"range",[(-2), 2])), (-2), _S.invoke(_n_rn_b4,"range",[(-45), 45]), (-_S.invoke(_n_rn_b4,"range",[60, 150])), _S.invoke(_n_rn_b4,"range",[0.5, 0.9]), _S.invoke(_n_rn_b4,"pick",[[_S.index_value(_n_S_b3,2), _S.index_value(_n_S_b3,3), _S.index_value(_n_S_b3,4)]]), (2 if _S.truth(_S.invoke(_n_rn_b4,"chance",[0.3])) else 1)])
				_n_i_b11 += 1.0
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < 16)):
			var _n_s_b13 = _S.invoke(_n_rn_b4,"sign",[])
			_S.invoke(_n_g_b6,"add",[_S.invoke(_n_rn_b4,"range",[0, _n_D]), _S.named_value(_n_P,"DUST"), (_n_s_b13 * _S.invoke(_n_rn_b4,"range",[14, 34])), (-_S.invoke(_n_rn_b4,"range",[0, 3])), ((-_n_s_b13) * _S.invoke(_n_rn_b4,"range",[6, 22])), (-_S.invoke(_n_rn_b4,"range",[4, 14])), _S.invoke(_n_rn_b4,"range",[0.9, 1.5]), _S.ColorFX.mix(_S.index_value(_n_S_b3,3),_S.index_value(_n_C_b2,5),0.3), _S.invoke(_n_rn_b4,"range",[2.6, 4.4])])
			_n_i_b12 += 1.0
	var _n_v_b7 = {"C":_n_C_b2,"S":_n_S_b3,"rocks":_n_rocks_b5,"g":_n_g_b6}
	_S.invoke(_n_cache,"set",[_n_key_b1, _n_v_b7])
	return _n_v_b7
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_o = _S.read(_parent,"o")
	var _n_D = _S.read(_parent,"D")
	var _n_rn = _S.read(_parent,"rn")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"id":(_n_i_b1 + (_S.named_value(_n_o,"seed") * 31)),"born":(((float(_n_i_b1)/7) * _n_D) + _S.invoke(_n_rn,"range",[(-0.06), 0.06])),"r0":_S.invoke(_n_rn,"range",[8, 25]),"th0":((0 if _S.truth(fmod(_n_i_b1,2)) else PI) + _S.invoke(_n_rn,"range",[(-0.45), 0.45])),"dir":_S.invoke(_n_rn,"sign",[]),"s":_S.invoke(_n_rn,"range",[2.4, 4.4]),"a0":_S.invoke(_n_rn,"range",[0, _n_TAU]),"va":_S.invoke(_n_rn,"range",[(-7), 7])}
	return null

static func _f13(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_BOTW = _S.read(_parent,"BOTW")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_LIFE = _S.read(_parent,"LIFE")
	var _n_rockAt = _S.read(_parent,"rockAt")
	var _n_rock = _S.read(_parent,"rock")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _object_0 = _S.call_value(_n_setup,[_n_o_b2])
	var _n_C_b3 = _S.named_value(_object_0,"C")
	var _n_S_b4 = _S.named_value(_object_0,"S")
	var _n_rocks_b5 = _S.named_value(_object_0,"rocks")
	var _n_g_b6 = _S.named_value(_object_0,"g")
	if true:
		var _n_y_b7 = (-6)
		while _S.truth((_n_y_b7 <= 6)):
			if true:
				var _n_x_b8 = (-_n_BOTW)
				while _S.truth((_n_x_b8 <= _n_BOTW)):
					var _n_d_b9 = _S.Bridge.hypot([(float((_n_x_b8 + 0.5))/_n_BOTW), (float((_n_y_b7 + 0.5))/5.5)])
					if _S.truth((_n_d_b9 <= 1)):
						_S.invoke(_n_p_b0,"blend",[(_n_x_b8 + 0.5), (_n_y_b7 + 0.5), (_S.index_value(_n_C_b3,6) if _S.truth((_n_d_b9 < 0.35)) else _S.index_value(_n_C_b3,5)), (0.2 + (0.55 * pow((1 - _n_d_b9),1.5)))])
					_n_x_b8 += 1.0
			_n_y_b7 += 1.0
	_S.call_value(_n_hoop,[_n_p_b0, 0, (_n_BOTW + 1), _S.index_value(_n_C_b3,5), true])
	_S.invoke(_S.invoke(_n_g_b6,"at",[_n_t_b1]),"draw",[_n_p_b0, "back"])
	for _iter_1 in _S.array(_n_rocks_b5):
		var _n_r_b10 = _iter_1
		var _n_age_b11 = _S.call_value(_n_since,[_n_t_b1, _S.named_value(_n_r_b10,"born"), _n_D])
		if _S.truth((_n_age_b11 >= _n_LIFE)):
			continue
		var _n_q_b12 = _S.call_value(_n_rockAt,[_n_r_b10, _n_age_b11])
		if _S.truth(((_S.named_value(_n_q_b12,"lift") > 0) if _S.truth((_S.named_value(_n_q_b12,"z") < 0)) else (_S.named_value(_n_q_b12,"z") < 0))):
			_S.call_value(_n_rock,[_n_p_b0, _n_q_b12, _n_r_b10, _n_S_b4, _n_C_b3, true])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_D = _S.read(_parent,"D")
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_half = _S.read(_parent,"half")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_since = _S.read(_parent,"since")
	var _n_ease = _S.read(_parent,"ease")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_LIFE = _S.read(_parent,"LIFE")
	var _n_rockAt = _S.read(_parent,"rockAt")
	var _n_rock = _S.read(_parent,"rock")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_flash = _S.read(_parent,"flash")
	var _n_BOTW = _S.read(_parent,"BOTW")
	var _n_pod = _S.read(_parent,"pod")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _object_0 = _S.call_value(_n_setup,[_n_o_b2])
	var _n_C_b3 = _S.named_value(_object_0,"C")
	var _n_S_b4 = _S.named_value(_object_0,"S")
	var _n_rocks_b5 = _S.named_value(_object_0,"rocks")
	var _n_g_b6 = _S.named_value(_object_0,"g")
	var _n_H_b7 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"hull"),6)
	var _n_ph_b8 = (float(_n_t_b1)/_n_D)
	var _n_podY_b9 = ((_n_LENS - 5) + (1.5 * sin(((_n_TAU * 2) * _n_ph_b8))))
	if true:
		var _n_y_b11 = ceili((_n_LENS + 3))
		while _S.truth((_n_y_b11 < 0)):
			var _n_w_b12 = _S.call_value(_n_half,[_n_y_b11])
			var _n_v_b13 = (float((_n_y_b11 - _n_LENS))/(-_n_LENS))
			var _n_pulse_b14 = (1 if _S.truth((fmod((fmod(((_n_v_b13 * 3.2) + (_n_ph_b8 * 6)),1) + 1),1) < 0.08)) else 0)
			if true:
				var _n_x_b15 = (floori((-_n_w_b12)) - 1)
				while _S.truth((_n_x_b15 <= ceili(_n_w_b12))):
					var _n_q_b16 = (float(absf((_n_x_b15 + 0.5)))/_n_w_b12)
					if _S.truth((_n_q_b16 > (1 + (float(1.2)/_n_w_b12)))):
						_n_x_b15 += 1.0
						continue
					if _S.truth((_n_q_b16 > 1)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b15, _n_y_b11, _S.index_value(_n_C_b3,4), (0.6 - (0.3 * _n_v_b13))])
					else:
						if _S.truth((_n_q_b16 > (1 - (float(1)/_n_w_b12)))):
							_S.invoke(_n_p_b0,"px",[_n_x_b15, _n_y_b11, (_n_WHITE if _S.truth((_n_v_b13 < 0.2)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_v_b13 < 0.45)) else _S.index_value(_n_C_b3,5)))])
						else:
							var _n_curtain_b17 = 0
							if true:
								var _n_s_b20 = 0
								while _S.truth((_n_s_b20 < 4)):
									if _S.truth((absf((((float((_n_x_b15 + 0.5))/_n_w_b12) - ((_S.MathFX.rand([_S.named_value(_n_o_b2,"seed"),_n_s_b20,7]) - 0.5) * 1.4)) - (0.12 * sin(((_n_TAU * _n_ph_b8) + (_n_s_b20 * 1.7)))))) < 0.045)):
										_n_curtain_b17 = 1
									_n_s_b20 += 1.0
							var _n_core_b18 = (pow((1 - _n_q_b16),2) * pow((1 - _n_v_b13),1.6))
							var _n_a_b19 = ((((0.08 + (0.22 * pow(_n_q_b16,4))) + (0.6 * _n_core_b18)) + (0.12 * _n_pulse_b14)) + (0.18 * _n_curtain_b17))
							_S.invoke(_n_p_b0,"blend",[(_n_x_b15 + 0.5), (_n_y_b11 + 0.5), (_n_WHITE if _S.truth((_n_core_b18 > 0.45)) else (_S.index_value(_n_C_b3,5) if _S.truth(((_n_curtain_b17 if _S.truth(_n_curtain_b17) else _n_pulse_b14) if _S.truth((_n_curtain_b17 if _S.truth(_n_curtain_b17) else _n_pulse_b14)) else (_n_v_b13 < 0.35))) else _S.index_value(_n_C_b3,4))), clampf(_n_a_b19,0.0,1.0)])
					_n_x_b15 += 1.0
			if _S.truth(_S.binary("===",_S.binary("&",_n_y_b11,3),0)):
				for _iter_1 in _S.array([(-1), 1]):
					var _n_s_b21 = _iter_1
					_S.invoke(_n_p_b0,"glow",[(_n_s_b21 * _n_w_b12), _n_y_b11, 8, _S.index_value(_n_C_b3,4), 0.18])
			_n_y_b11 += 1.0
	if true:
		var _n_i_b22 = 0
		while _S.truth((_n_i_b22 < 5)):
			var _n_k_b23 = (float(_S.call_value(_n_since,[_n_t_b1, ((float(_n_i_b22)/5) * _n_D), _n_D]))/1.1)
			if _S.truth((_n_k_b23 >= 1)):
				_n_i_b22 += 1.0
				continue
			var _n_y_b24 = _S.numeric_lerp(0,(_n_LENS + 5),_S.invoke(_n_ease,"inQuad",[_n_k_b23]))
			var _n_w_b25 = (_S.call_value(_n_half,[_n_y_b24]) + 1)
			_S.call_value(_n_hoop,[_n_p_b0, _n_y_b24, _n_w_b25, _S.index_value(_n_C_b3,3), true])
			_S.call_value(_n_hoop,[_n_p_b0, _n_y_b24, _n_w_b25, (_n_WHITE if _S.truth((_n_k_b23 < 0.12)) else _S.index_value(_n_C_b3,6)), false])
			_S.invoke(_n_p_b0,"glow",[0, (_n_y_b24 + (_n_w_b25 * 0.17)), (_n_w_b25 + 4), _S.index_value(_n_C_b3,5), 0.12])
			_n_i_b22 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 22, (_S.named_value(_n_o_b2,"seed") + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f16"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f17")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 9, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f19"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"S":_n_S_b4,"C":_n_C_b3,"this":_this}),"_f20")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 46, (_S.named_value(_n_o_b2,"seed") + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f21"), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"S":_n_S_b4,"p":_n_p_b0,"this":_this}),"_f22")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 8, (_S.named_value(_n_o_b2,"seed") + 4), 0.5, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f24")])
	for _iter_2 in _S.array(_n_rocks_b5):
		var _n_r_b26 = _iter_2
		var _n_age_b27 = _S.call_value(_n_since,[_n_t_b1, _S.named_value(_n_r_b26,"born"), _n_D])
		if _S.truth((_n_age_b27 >= _n_LIFE)):
			continue
		var _n_q_b28 = _S.call_value(_n_rockAt,[_n_r_b26, _n_age_b27])
		if _S.truth(((_S.named_value(_n_q_b28,"z") >= 0) if _S.truth((_S.named_value(_n_q_b28,"z") >= 0)) else (_S.named_value(_n_q_b28,"lift") <= 0))):
			_S.call_value(_n_rock,[_n_p_b0, _n_q_b28, _n_r_b26, _n_S_b4, _n_C_b3, false])
		if _S.truth((_n_age_b27 > (_n_LIFE - 0.1))):
			_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_q_b28,"x"), (_n_LENS + 3), 5, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.5])
	for _iter_3 in _S.array(_n_rocks_b5):
		var _n_r_b29 = _iter_3
		_S.call_value(_n_flash,[_n_p_b0, _n_t_b1, ((_S.named_value(_n_r_b29,"born") + _n_LIFE) - 0.08), 0, (_n_LENS + 3), 30, _S.index_value(_n_C_b3,5), 0.7, 0.28])
	_S.invoke(_S.invoke(_n_g_b6,"at",[_n_t_b1]),"draw",[_n_p_b0, "front"])
	_S.call_value(_n_hoop,[_n_p_b0, 0, (_n_BOTW + 1), _n_WHITE, false])
	_S.call_value(_n_hoop,[_n_p_b0, 1, _n_BOTW, _S.index_value(_n_C_b3,5), false])
	_S.call_value(_n_pod,[_n_p_b0, _n_t_b1, _n_C_b3, _n_H_b7, _n_podY_b9])
	var _n_fl_b10 = (0.85 + (0.15 * sin(((_n_TAU * 6) * _n_ph_b8))))
	_S.invoke(_n_p_b0,"glow",[0, (_n_LENS + 6), 36, _S.index_value(_n_C_b3,5), (0.7 * _n_fl_b10)])
	_S.invoke(_n_p_b0,"glow",[0, (_n_LENS + 6), 12, _n_WHITE, (0.7 * _n_fl_b10)])
	if true:
		var _n_y_b30 = (_n_LENS + 16)
		while _S.truth((_n_y_b30 < (-8))):
			_S.invoke(_n_p_b0,"glow",[0, _n_y_b30, (_S.call_value(_n_half,[_n_y_b30]) + 10), _S.index_value(_n_C_b3,4), 0.16])
			_n_y_b30 += 14
	for _iter_4 in _S.array([(-20), 0, 20]):
		var _n_x_b31 = _iter_4
		_S.invoke(_n_p_b0,"glow",[_n_x_b31, (-2), 22, _S.index_value(_n_C_b3,4), 0.26])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.6, 1])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_half = _S.read(_parent,"half")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_y_b4 = _S.numeric_lerp((-2),(_n_LENS + 5),(_n_k_b3 * _n_k_b3))
	var _n_w_b5 = _S.call_value(_n_half,[_n_y_b4])
	var _n_x_b6 = (_S.invoke(_n_r_b2,"range",[(-0.85), 0.85]) * _n_w_b5)
	var _n_L_b7 = (2 + (6 * _n_k_b3))
	_S.invoke(_n_p,"line",[_n_x_b6, _n_y_b4, _n_x_b6, (_n_y_b4 + _n_L_b7), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f18"), minf(1,((1 - _n_k_b3) * 3))])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.3)) else _S.index_value(_n_C,5))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.4, 2])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_haul = _S.read(_parent,"haul")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_haul,[_S.invoke(_n_r_b2,"range",[8, 26]), _S.invoke(_n_r_b2,"range",[0, _n_TAU]), _S.invoke(_n_r_b2,"sign",[]), 0.8, _n_k_b3])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	_S.invoke(_n_p,"disc",[_n_x_b4, _n_y_b5, _S.numeric_lerp(4,1.5,_n_k_b3), _S.ColorFX.mix(_S.index_value(_n_S,3),_S.index_value(_n_C,5),(0.25 + (0.5 * _n_k_b3))), ((0.4 * minf(1,(_n_k_b3 * 6))) * (1 - _n_k_b3))])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.3])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_haul = _S.read(_parent,"haul")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_S = _S.read(_parent,"S")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_r0_b4 = _S.invoke(_n_r_b2,"range",[6, 30])
	var _n_th0_b5 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_dir_b6 = _S.invoke(_n_r_b2,"sign",[])
	var _n_turns_b7 = _S.invoke(_n_r_b2,"range",[1, 1.8])
	var _n_mote_b8 = _S.invoke(_n_r_b2,"chance",[0.45])
	var _tuple_0 = _S.call_value(_n_haul,[_n_r0_b4, _n_th0_b5, _n_dir_b6, _n_turns_b7, _n_k_b3])
	var _n_x_b9 = _S.prop(_tuple_0,0)
	var _n_y_b10 = _S.prop(_tuple_0,1)
	var _n_z_b11 = _S.prop(_tuple_0,2)
	var _tuple_1 = _S.call_value(_n_haul,[_n_r0_b4, _n_th0_b5, _n_dir_b6, _n_turns_b7, (_n_k_b3 - (0.13 if _S.truth(_n_mote_b8) else 0.06))])
	var _n_x1_b12 = _S.prop(_tuple_1,0)
	var _n_y1_b13 = _S.prop(_tuple_1,1)
	var _n_c_b14 = ((_n_WHITE if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else _S.index_value(_n_C,6)) if _S.truth(_n_mote_b8) else _S.invoke(_n_r_b2,"pick",[[_S.index_value(_n_S,3), _S.index_value(_n_S,4), _S.index_value(_n_S,4)]]))
	_S.invoke(_n_p,"line",[_n_x1_b12, _n_y1_b13, _n_x_b9, _n_y_b10, _S.function_value(_S.capture(_parent,{"z":_n_z_b11,"c":_n_c_b14,"mote":_n_mote_b8,"this":_n_this}),"_f23")])
	if _S.truth(_n_mote_b8):
		_S.invoke(_n_p,"px",[_n_x_b9, _n_y_b10, _n_WHITE])
		_S.invoke(_n_p,"glow",[_n_x_b9, _n_y_b10, 4, _S.index_value(_n_C,5), 0.45])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_c = _S.read(_parent,"c")
	var _n_z = _S.read(_parent,"z")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_S = _S.read(_parent,"S")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_c if _S.truth((_n_z > 0)) else _S.ColorFX.scale_color(_n_c,0.7)) if _S.truth((_n_u_b0 > 0.5)) else (_S.index_value(_n_C,4) if _S.truth(_n_mote) else _S.index_value(_n_S,2)))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_haul = _S.read(_parent,"haul")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_haul,[_S.invoke(_n_r_b2,"range",[4, 24]), _S.invoke(_n_r_b2,"range",[0, _n_TAU]), _S.invoke(_n_r_b2,"sign",[]), 0.6, (_S.invoke(_n_r_b2,"range",[0.1, 0.7]) + (_n_k_b3 * 0.15))])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_arm_b6 = floori((2 * sin((PI * _n_k_b3)))+0.5)
	if _S.truth((_n_arm_b6 > 0)):
		_S.call_value(_n_sparkle,[_n_p, _n_x_b4, _n_y_b5, _n_arm_b6, _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.4])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_BOTW = _S.read(_parent,"BOTW")
	var _n_TOPW = _S.read(_parent,"TOPW")
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_y_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(_n_BOTW,_n_TOPW,clampf((float(_n_y_b0)/_n_LENS),0.0,1.0))
	return null
