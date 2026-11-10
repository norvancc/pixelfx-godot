@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/snake.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "lift", _S.function_value(_e, "_f0"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f1"))
	_S.define(_e, "snake", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Snake"}, {"desc": "A snake slithers along the floor, head raised: humps rise and roll back down its patterned body to the tail, dust puffs where it touches down, its forked tongue flicks."}, {"tags": ["critter", "snake", "reptile", "ground", "loop"]}, {"size": [136, 56]}, {"origin": [68, 48]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#081410", "#123a1e", "#1d5e2a", "#2f8a36", "#5cb848", "#a8e070", "#e8ffc0"]}, {"belly": ["#4a3a14", "#b08a34", "#f0d878"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "HEAD", 30)
	_S.define(_e, "LEN", 70)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 44), _S.unary("-", 24), 88, 26]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "TONGUE", _S.call_value(_S.read(_e, "hex"), ["#e8304a"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#8a7f92"]))
	_S.define(_e, "K", _S.binary("/", _S.read(_e, "TAU"), 30))
	_S.define(_e, "W", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "D")))
	_S.define(_e, "radius", _S.function_value(_e, "_f8"))
	_S.define(_e, "bob", _S.function_value(_e, "_f9"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_K = _S.read(_parent,"K")
	var _n_W = _S.read(_parent,"W")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_wave_b2 = pow(maxf(0,sin(((_n_K * _n_u_b0) - (_n_W * _n_t_b1)))),0.85)
	var _n_env_b3 = (_S.MathFX.smooth(8,18,_n_u_b0) * (1 - _S.MathFX.smooth((_n_LEN - 14),(_n_LEN - 2),_n_u_b0)))
	var _n_neck_b4 = ((6 * pow((1 - (float(_n_u_b0)/12)),2)) if _S.truth((_n_u_b0 < 12)) else 0)
	return (((7 * _n_wave_b2) * _n_env_b3) + _n_neck_b4)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array([0.3, 1.5]):
		var _n_t0_b1 = _iter_0
		var _n_k_b2 = (float((_n_t_b0 - _n_t0_b1))/0.5)
		if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_k_b2 >= 0)) else (_n_k_b2 >= 0))):
			return pow(maxf(0,sin(((_n_k_b2 * PI) * 3))),0.6)
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_bob = _S.read(_parent,"bob")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_radius = _S.read(_parent,"radius")
	var _n_lift = _S.read(_parent,"lift")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_B_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	_S.invoke(_n_g_b0,"clear",[])
	var _n_hb_b4 = _S.call_value(_n_bob,[_n_t_b3])
	if true:
		var _n_u_b7 = _n_LEN
		while _S.truth((_n_u_b7 >= 2)):
			var _n_x_b8 = (_n_HEAD - _n_u_b7)
			var _n_r0_b9 = _S.call_value(_n_radius,[_n_u_b7])
			var _n_cy_b10 = (((-_n_r0_b9) - _S.call_value(_n_lift,[_n_u_b7, _n_t_b3])) + ((_n_hb_b4 * (1 - (float(_n_u_b7)/12))) if _S.truth((_n_u_b7 < 12)) else 0))
			var _n_hump_b11 = _S.call_value(_n_lift,[_n_u_b7, _n_t_b3])
			var _n_slope_b12 = (_S.call_value(_n_lift,[(_n_u_b7 + 0.5), _n_t_b3]) - _S.call_value(_n_lift,[(_n_u_b7 - 0.5), _n_t_b3]))
			var _n_r_b13 = (_n_r0_b9 * sqrt((1 + (_n_slope_b12 * _n_slope_b12))))
			if true:
				var _n_y_b14 = floori((_n_cy_b10 - _n_r_b13))
				while _S.truth((_n_y_b14 <= ceili((_n_cy_b10 + _n_r_b13)))):
					var _n_v_b15 = (float(((_n_y_b14 + 0.5) - _n_cy_b10))/_n_r_b13)
					if _S.truth((absf(_n_v_b15) > 1)):
						_n_y_b14 += 1.0
						continue
					var _n_c_b16 = (_S.index_value(_n_C_b1,4) if _S.truth((_n_v_b15 < (-0.5))) else (_S.index_value(_n_C_b1,3) if _S.truth((_n_v_b15 < 0.1)) else (_S.index_value(_n_C_b1,2) if _S.truth((_n_v_b15 < 0.45)) else (_S.index_value(_n_B_b2,1) if _S.truth((_n_v_b15 < 0.8)) else _S.index_value(_n_B_b2,0)))))
					var _n_dm_b17 = ((float(absf((fmod((_n_u_b7 + 2),7) - 3.5)))/3.5) + (float(absf((_n_v_b15 + 0.25)))/0.55))
					if _S.truth(((_n_u_b7 > 4) if _S.truth(((_n_v_b15 < 0.35) if _S.truth((_n_dm_b17 < 0.85)) else (_n_dm_b17 < 0.85))) else ((_n_v_b15 < 0.35) if _S.truth((_n_dm_b17 < 0.85)) else (_n_dm_b17 < 0.85)))):
						_n_c_b16 = (_S.index_value(_n_C_b1,1) if _S.truth((_n_dm_b17 < 0.5)) else _S.index_value(_n_C_b1,2))
					if _S.truth(((_n_dm_b17 >= 0.85) if _S.truth(((_n_hump_b11 > 4.5) if _S.truth((_n_v_b15 < (-0.62))) else (_n_v_b15 < (-0.62)))) else ((_n_hump_b11 > 4.5) if _S.truth((_n_v_b15 < (-0.62))) else (_n_v_b15 < (-0.62))))):
						_n_c_b16 = (_S.index_value(_n_C_b1,6) if _S.truth((_n_hump_b11 > 6)) else _S.index_value(_n_C_b1,5))
					if _S.truth((_S.binary("===",fmod(floori(_n_u_b7),3),0) if _S.truth(((_n_v_b15 < 0.8) if _S.truth((_n_v_b15 > 0.45)) else (_n_v_b15 > 0.45))) else ((_n_v_b15 < 0.8) if _S.truth((_n_v_b15 > 0.45)) else (_n_v_b15 > 0.45)))):
						_n_c_b16 = _S.index_value(_n_B_b2,2)
					_S.invoke(_n_g_b0,"set",[_n_x_b8, _n_y_b14, _n_c_b16])
					_n_y_b14 += 1.0
			_n_u_b7 -= 0.5
	var _n_hx_b5 = (_n_HEAD + 2)
	var _n_hy_b6 = ((-9.5) + _n_hb_b4)
	_S.invoke(_n_g_b0,"shade",[(_n_hx_b5 - 5), (_n_hy_b6 - 4), (_n_hx_b5 + 6), (_n_hy_b6 + 4), _S.function_value(_S.capture(_parent,{"hx":_n_hx_b5,"hy":_n_hy_b6,"B":_n_B_b2,"C":_n_C_b1,"this":_this}),"_f3")])
	_S.invoke(_n_g_b0,"line",[(_n_hx_b5 - 1), (_n_hy_b6 + 1.5), (_n_hx_b5 + 5), (_n_hy_b6 + 1.2), _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 1), (_n_hy_b6 - 2), _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 2), (_n_hy_b6 - 2), _S.index_value(_n_B_b2,2)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 1), (_n_hy_b6 - 1), _S.index_value(_n_B_b2,2)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 2), (_n_hy_b6 - 1), _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 1), (_n_hy_b6 - 3), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"set",[(_n_hx_b5 + 5), (_n_hy_b6 - 1), _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_B = _S.read(_parent,"B")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (float((_n_x_b0 - _n_hx))/(5.6 if _S.truth((_n_x_b0 > _n_hx)) else 4.6))
	var _n_dy_b3 = (float((_n_y_b1 - _n_hy))/(3.6 - (maxf(0,(_n_x_b0 - _n_hx)) * 0.18)))
	if _S.truth((((_n_dx_b2 * _n_dx_b2) + (_n_dy_b3 * _n_dy_b3)) > 1)):
		return 0
	if _S.truth((_n_dy_b3 > 0.55)):
		return _S.index_value(_n_B,1)
	return ((_S.index_value(_n_C,5) if _S.truth((_n_dx_b2 < 0.3)) else _S.index_value(_n_C,4)) if _S.truth((_n_dy_b3 < (-0.3))) else _S.index_value(_n_C,3))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_bob = _S.read(_parent,"bob")
	var _n_tongue = _S.read(_parent,"tongue")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_TONGUE = _S.read(_parent,"TONGUE")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_snake = _S.read(_parent,"snake")
	var _n_SWARM = _S.read(_parent,"SWARM")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_B_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"belly"),3)
	var _n_hb_b6 = _S.call_value(_n_bob,[_n_t_b3])
	var _n_e_b7 = _S.call_value(_n_tongue,[_n_t_b3])
	var _n_tx_b8 = (_n_HEAD + 7.5)
	var _n_ty_b9 = ((-8.2) + _n_hb_b6)
	if _S.truth((_n_e_b7 > 0.05)):
		var _n_L_b12 = (7 * _n_e_b7)
		var _n_wig_b13 = ((sin((_n_t_b3 * 60)) * 0.6) * _n_e_b7)
		_S.invoke(_n_p_b0,"line",[_n_tx_b8, _n_ty_b9, (_n_tx_b8 + _n_L_b12), (_n_ty_b9 + _n_wig_b13), _n_TONGUE])
		if _S.truth((_n_L_b12 > 3)):
			_S.invoke(_n_p_b0,"px",[((_n_tx_b8 + _n_L_b12) + 1), ((_n_ty_b9 + _n_wig_b13) - 1), _n_TONGUE])
			_S.invoke(_n_p_b0,"px",[((_n_tx_b8 + _n_L_b12) + 1), ((_n_ty_b9 + _n_wig_b13) + 1), _n_TONGUE])
	var _n_g_b10 = _n_GRID
	_S.call_value(_n_snake,[_n_g_b10, _n_C_b4, _n_B_b5, _n_t_b3])
	_S.invoke(_n_g_b10,"draw",[_n_p_b0])
	var _n_sw_b11 = _S.invoke(_n_SWARM,"begin",[_n_t_b3])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 26, ((_S.named_value(_n_o_b2,"seed") * 7) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"sw":_n_sw_b11,"this":_this}),"_f6")])
	_S.invoke(_n_sw_b11,"draw",[_n_p_b0])
	_S.invoke(_n_p_b0,"glow",[(_n_HEAD + 3.5), ((-11) + _n_hb_b6), 4, _S.index_value(_n_B_b5,2), 0.35])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.6, 1.1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_W = _S.read(_parent,"W")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_K = _S.read(_parent,"K")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_sw = _S.read(_parent,"sw")
	var _n_P = _S.read(_parent,"P")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_born_b3 = _S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D])
	var _n_m_b4 = _S.invoke(_n_r_b2,"int",[0, 2])
	var _n_u_b5 = (float(((PI + (_n_W * _n_born_b3)) + (_n_m_b4 * _n_TAU)))/_n_K)
	if _S.truth(((_n_u_b5 < 18) if _S.truth((_n_u_b5 < 18)) else (_n_u_b5 > (_n_LEN - 10)))):
		return null
	var _n_x_b6 = (((_n_HEAD - _n_u_b5) + _S.invoke(_n_r_b2,"range",[(-2), 2])) - (_S.invoke(_n_r_b2,"range",[6, 16]) * _n_age_b0))
	_S.invoke(_n_sw,"add",[_S.named_value(_n_P,"SMOKE"), _n_x_b6, ((-0.5) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[3, 8]))), 0, 0, _n_age_b0, _n_L_b1, _n_DUST, _S.invoke(_n_r_b2,"range",[1.8, 3.4])])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_lift = _S.read(_parent,"lift")
	var _n_radius = _S.read(_parent,"radius")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_shadow = _S.read(_parent,"shadow")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	if true:
		var _n_u_b5 = 2
		while _S.truth((_n_u_b5 <= _n_LEN)):
			var _n_h_b6 = _S.call_value(_n_lift,[_n_u_b5, _n_t_b3])
			var _n_r_b7 = _S.call_value(_n_radius,[_n_u_b5])
			_S.call_value(_n_shadow,[_n_p_b0, (_n_HEAD - _n_u_b5), (-0.2), (2.2 + (_n_r_b7 * 0.4)), 1.2, _S.index_value(_n_C_b4,0), ((0.5 * (1 - clampf((float(_n_h_b6)/10),0.0,1.0))) + 0.1)])
			_n_u_b5 += 2
	_S.call_value(_n_shadow,[_n_p_b0, (_n_HEAD + 2), (-0.2), 5, 1.2, _S.index_value(_n_C_b4,0), 0.35])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_u_b0 = _S.arg(_args,0)
	return (3.3 if _S.truth((_n_u_b0 < 6)) else _S.numeric_lerp(3.4,0.6,pow((float((_n_u_b0 - 6))/(_n_LEN - 6)),1.3)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_t_b0 = _S.arg(_args,0)
	return (0.8 * sin((_n_W * _n_t_b0)))
	return null
