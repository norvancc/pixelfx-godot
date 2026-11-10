@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/eclipse.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Eclipse"}, {"desc": "A black moon over the sun: a breathing pearl corona with long streamers, a thin white rim, and one diamond bead blazing on its edge."}, {"tags": ["shadow", "eclipse", "moon", "sun", "corona", "sky", "magic", "loop"]}, {"size": [160, 144]}, {"origin": [80, 72]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"pearl": ["#5a4f8a", "#a99be0", "#e6defa", "#fffaf2"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "R", 19)
	_S.define(_e, "D", 4)
	_S.define(_e, "BEAD", _S.unary("-", 0.72))
	_S.define(_e, "breathe", _S.function_value(_e, "_f7"))
	_S.define(_e, "STREAMS", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 30}]), _S.function_value(_e, "_f8")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_breathe = _S.read(_parent,"breathe")
	var _n_R = _S.read(_parent,"R")
	var _n_STREAMS = _S.read(_parent,"STREAMS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Q_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"pearl"),4)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 26, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"Q":_n_Q_b4,"this":_this}),"_f2")])
	var _n_b_b6 = (1 + (0.08 * _S.call_value(_n_breathe,[_n_t_b1, 1, 0])))
	_S.invoke(_n_p_b0,"glow",[0, 0, (72 * _n_b_b6), _S.index_value(_n_C_b3,4), 0.38])
	_S.invoke(_n_p_b0,"glow",[0, 0, (46 * _n_b_b6), _S.index_value(_n_Q_b4,1), 0.34])
	for _iter_0 in _S.array(_n_STREAMS):
		var _n_s_b7 = _iter_0
		var _n_L_b8 = (_S.named_value(_n_s_b7,"len") * (1 + (0.18 * _S.call_value(_n_breathe,[_n_t_b1, _S.named_value(_n_s_b7,"k"), _S.named_value(_n_s_b7,"ph")]))))
		if true:
			var _n_d_b9 = 4
			while _S.truth((_n_d_b9 <= _n_L_b8)):
				var _n_u_b10 = (float(_n_d_b9)/_n_L_b8)
				var _n_a_b11 = (_S.named_value(_n_s_b7,"a") + ((_S.named_value(_n_s_b7,"curl") * _n_d_b9) * _n_d_b9))
				var _n_r_b12 = ((_n_R + 1) + _n_d_b9)
				var _n_x_b13 = (cos(_n_a_b11) * _n_r_b12)
				var _n_y_b14 = (sin(_n_a_b11) * _n_r_b12)
				_S.invoke(_n_p_b0,"dot",[_n_x_b13, _n_y_b14, (_S.index_value(_n_Q_b4,2) if _S.truth((_n_u_b10 < 0.3)) else (_S.index_value(_n_Q_b4,1) if _S.truth((_n_u_b10 < 0.65)) else _S.index_value(_n_C_b3,5))), (1 if _S.truth((_n_u_b10 < 0.75)) else ((1 - _n_u_b10) * 4))])
				_n_d_b9 += 0.5
		_S.invoke(_n_p_b0,"glowLine",[(cos(_S.named_value(_n_s_b7,"a")) * (_n_R + 4)), (sin(_S.named_value(_n_s_b7,"a")) * (_n_R + 4)), (cos(_S.named_value(_n_s_b7,"a")) * (_n_R + (_n_L_b8 * 0.6))), (sin(_S.named_value(_n_s_b7,"a")) * (_n_R + (_n_L_b8 * 0.6))), 3, _S.index_value(_n_Q_b4,1), 0.12])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.2, 2.6])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Q = _S.read(_parent,"Q")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.invoke(_n_r_b2,"range",[(-78), 78])
	var _n_y_b4 = _S.invoke(_n_r_b2,"range",[(-70), 70])
	if _S.truth((_S.Bridge.hypot([_n_x_b3, _n_y_b4]) < (_n_R + 22))):
		return null
	var _n_k_b5 = sin((float((PI * _n_age_b0))/_n_L_b1))
	_S.invoke(_n_p,"dot",[_n_x_b3, _n_y_b4, (_n_WHITE if _S.truth((_n_k_b5 > 0.7)) else _S.index_value(_n_Q,1)), (_n_k_b5 * 1.2)])
	if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < 0.4) if _S.truth((_n_k_b5 > 0.85)) else (_n_k_b5 > 0.85))):
		_S.invoke(_n_p,"dot",[(_n_x_b3 - 1), _n_y_b4, _S.index_value(_n_Q,0), 0.8])
		_S.invoke(_n_p,"dot",[(_n_x_b3 + 1), _n_y_b4, _S.index_value(_n_Q,0), 0.8])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_breathe = _S.read(_parent,"breathe")
	var _n_R = _S.read(_parent,"R")
	var _n_BEAD = _S.read(_parent,"BEAD")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_halo = _S.read(_parent,"halo")
	var _n_unlight = _S.read(_parent,"unlight")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Q_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"pearl"),4)
	var _n_b_b5 = (1 + (0.08 * _S.call_value(_n_breathe,[_n_t_b1, 1, 0])))
	var _n_W_b6 = (_n_R + 10)
	_S.invoke(_n_p_b0,"shade",[(-_n_W_b6), (-_n_W_b6), _n_W_b6, _n_W_b6, _S.function_value(_S.capture(_parent,{"b":_n_b_b5,"t":_n_t_b1,"Q":_n_Q_b4,"C":_n_C_b3,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"shade",[(-_n_R), (-_n_R), _n_R, _n_R, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f5")])
	var _n_bx_b7 = (cos(_n_BEAD) * (_n_R + 0.4))
	var _n_by_b8 = (sin(_n_BEAD) * (_n_R + 0.4))
	var _n_k_b9 = (0.75 + (0.25 * _S.call_value(_n_breathe,[_n_t_b1, 2, 1])))
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < 8)):
			var _n_a_b11 = ((float((_n_i_b10 * PI))/4) + 0.12)
			var _n_len_b12 = (((7 if _S.truth(fmod(_n_i_b10,2)) else 22) * _n_k_b9) * (1.6 if _S.truth((_S.binary("===",_n_i_b10,1) if _S.truth(_S.binary("===",_n_i_b10,1)) else _S.binary("===",_n_i_b10,5))) else 1))
			if true:
				var _n_d_b13 = 1
				while _S.truth((_n_d_b13 <= _n_len_b12)):
					var _n_u_b14 = (float(_n_d_b13)/_n_len_b12)
					var _n_x_b15 = (_n_bx_b7 + (cos(_n_a_b11) * _n_d_b13))
					var _n_y_b16 = (_n_by_b8 + (sin(_n_a_b11) * _n_d_b13))
					if _S.truth((((_n_x_b15 * _n_x_b15) + (_n_y_b16 * _n_y_b16)) < pow((_n_R - 0.5),2))):
						break
					_S.invoke(_n_p_b0,"dot",[_n_x_b15, _n_y_b16, (_n_WHITE if _S.truth((_n_u_b14 < 0.35)) else (_S.index_value(_n_Q_b4,2) if _S.truth((_n_u_b14 < 0.7)) else _S.index_value(_n_Q_b4,1))), (1 if _S.truth((_n_u_b14 < 0.5)) else ((1 - _n_u_b14) * 2.2))])
					_n_d_b13 += 0.5
			_n_i_b10 += 1.0
	_S.invoke(_n_p_b0,"circle",[_n_bx_b7, _n_by_b8, (3 * _n_k_b9), _S.index_value(_n_Q_b4,2)])
	_S.invoke(_n_p_b0,"circle",[_n_bx_b7, _n_by_b8, (2.2 * _n_k_b9), _S.index_value(_n_Q_b4,3)])
	_S.invoke(_n_p_b0,"circle",[_n_bx_b7, _n_by_b8, 1.4, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_bx_b7, _n_by_b8, (46 * _n_k_b9), _S.index_value(_n_Q_b4,2), (0.8 * _n_k_b9)])
	_S.invoke(_n_p_b0,"glow",[_n_bx_b7, _n_by_b8, 14, _n_WHITE, 0.8])
	_S.call_value(_n_halo,[_n_p_b0, 0, 0, (_n_R - 0.5), (_n_R + 16), _S.index_value(_n_Q_b4,2), (0.35 * _n_b_b5)])
	_S.call_value(_n_unlight,[_n_p_b0, (-_n_R), (-_n_R), _n_R, _n_R, _S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_b = _S.read(_parent,"b")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_Q = _S.read(_parent,"Q")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_r_b3 = sqrt(((_n_x_b0 * _n_x_b0) + (_n_y_b1 * _n_y_b1)))
	if _S.truth(((_n_r_b3 < (_n_R - 0.5)) if _S.truth((_n_r_b3 < (_n_R - 0.5))) else (_n_r_b3 > (_n_R + (9 * _n_b))))):
		return null
	var _n_a_b4 = atan2(_n_y_b1,_n_x_b0)
	var _n_e_b5 = (float((_n_r_b3 - _n_R))/(9 * _n_b))
	var _n_streak_b6 = ((0.55 + (0.3 * cos(((_n_a_b4 * 23) + (sin((_n_a_b4 * 5)) * 2))))) + (0.15 * cos(((_n_a_b4 * 41) - (float((_n_TAU * _n_t))/_n_D)))))
	var _n_I_b7 = ((pow((1 - _n_e_b5),2.2) * _n_streak_b6) * (0.75 + (0.4 * absf(cos(_n_a_b4)))))
	if _S.truth((_n_r_b3 < (_n_R + 0.9))):
		return _S.index_value(_n_Q,3)
	if _S.truth((_n_I_b7 < 0.1)):
		return null
	if _S.truth((_S.binary("===",_S.binary("&",(floori(_n_x_b0) + floori(_n_y_b1)),1),0) if _S.truth((_n_I_b7 > 0.45)) else (_n_I_b7 > 0.45))):
		_S.set_prop(_n_out_b2,"k",(0.2 * _n_I_b7),"=")
	return (_S.index_value(_n_Q,2) if _S.truth((_n_I_b7 > 0.72)) else (_S.index_value(_n_Q,1) if _S.truth((_n_I_b7 > 0.42)) else (_S.index_value(_n_C,5) if _S.truth((_n_I_b7 > 0.22)) else _S.index_value(_n_C,4))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = sqrt(((_n_x_b0 * _n_x_b0) + (_n_y_b1 * _n_y_b1)))
	if _S.truth((_n_r_b2 >= (_n_R - 0.5))):
		return null
	return (_S.index_value(_n_C,1) if _S.truth(((_n_x_b0 < ((-_n_R) * 0.45)) if _S.truth((_n_r_b2 > (_n_R - 2.2))) else (_n_r_b2 > (_n_R - 2.2)))) else _S.index_value(_n_C,0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((_n_x_b0 * _n_x_b0) + (_n_y_b1 * _n_y_b1)) < pow((_n_R - 0.6),2))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	return sin(((float(((_n_TAU * _n_k_b1) * _n_t_b0))/_n_D) + _n_ph_b2))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_side_b2 = (0 if _S.truth(fmod(_n_i_b1,2)) else PI)
	var _n_spread_b3 = ((_S.MathFX.rand([_n_i_b1,1]) - 0.5) * (1.3 if _S.truth((_S.MathFX.rand([_n_i_b1,2]) < 0.7)) else 3.1))
	var _n_a_b4 = (_n_side_b2 + _n_spread_b3)
	var _n_eq_b5 = absf(cos(_n_a_b4))
	return {"a":_n_a_b4,"len":((10 + (_S.MathFX.rand([_n_i_b1,3]) * 28)) * (0.45 + (0.75 * _n_eq_b5))),"curl":((_S.MathFX.rand([_n_i_b1,4]) - 0.5) * 0.00018),"k":(1 + fmod(_n_i_b1,3)),"ph":(_S.MathFX.rand([_n_i_b1,5]) * _n_TAU),"w":_S.MathFX.rand([_n_i_b1,6])}
	return null
