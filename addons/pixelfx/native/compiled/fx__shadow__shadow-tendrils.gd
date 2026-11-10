@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/shadow-tendrils.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "Drops", _S.import_value("fx/shadow/_lib.js", "Drops"))
	_S.define(_e, "floorPool", _S.import_value("fx/shadow/_lib.js", "floorPool"))
	_S.define(_e, "spine", _S.function_value(_e, "_f0"))
	_S.define(_e, "tentacle", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Shadow tendrils"}, {"desc": "A dark pool opens on the floor; tentacles with lit rims and hooked tips lash up out of it with a splash, writhe, and sink back as it closes."}, {"tags": ["shadow", "tentacle", "tendril", "ground", "dark", "magic", "one-shot"]}, {"size": [208, 130]}, {"origin": [104, 106]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RX", 40)
	_S.define(_e, "OPEN", 0.34)
	_S.define(_e, "SHUT", 2.5)
	_S.define(_e, "SINK", 0.5)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_T_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_e_b2 = clampf((float((_n_t_b1 - _S.named_value(_n_T_b0,"t0")))/0.2),0.0,1.0)
	var _n_s1_b3 = clampf((float((_n_t_b1 - _S.named_value(_n_T_b0,"t1")))/_n_SINK),0.0,1.0)
	if _S.truth(((_n_e_b2 <= 0) if _S.truth((_n_e_b2 <= 0)) else (_n_s1_b3 >= 1))):
		return null
	var _n_lift_b4 = (0.07 * sin((PI * clampf((float(_n_s1_b3)/0.3),0.0,1.0))))
	var _n_down_b5 = _S.invoke(_n_ease,"inOutCubic",[clampf((float((_n_s1_b3 - 0.12))/0.88),0.0,1.0)])
	var _n_rise_b6 = ((_S.invoke(_n_ease,"outBack",[_n_e_b2, 1.8]) * (1 + _n_lift_b4)) * (1 - _n_down_b5))
	var _n_hidden_b7 = ((1 - _n_rise_b6) * _S.named_value(_n_T_b0,"L"))
	var _n_writhe_b8 = (_S.named_value(_n_T_b0,"A") * (0.25 + (0.75 * _S.MathFX.smooth((_S.named_value(_n_T_b0,"t0") + 0.08),(_S.named_value(_n_T_b0,"t0") + 0.5),_n_t_b1))))
	var _n_hook_b9 = (((0.04 + (_S.named_value(_n_T_b0,"H") * _S.invoke(_n_ease,"outBack",[clampf((float(((_n_t_b1 - _S.named_value(_n_T_b0,"t0")) - 0.1))/0.32),0.0,1.0), 2.5]))) * (1 + (0.5 * _n_s1_b3))) * (1 + (0.18 * sin(((_n_t_b1 * 2.3) + _S.named_value(_n_T_b0,"ph"))))))
	var _n_lean_b10 = (_S.named_value(_n_T_b0,"lean") + (0.12 * sin(((_n_t_b1 * 1.6) + _S.named_value(_n_T_b0,"ph")))))
	if _S.truth(_S.named_value(_n_T_b0,"whip")):
		_n_lean_b10 += (_S.named_value(_S.named_value(_n_T_b0,"whip"),"a") * exp((-pow((float((_n_t_b1 - _S.named_value(_S.named_value(_n_T_b0,"whip"),"t")))/0.14),2))))
	var _n_th_b11 = ((float((-PI))/2) + _n_lean_b10)
	var _n_x_b12 = (_S.named_value(_n_T_b0,"x") - (cos(_n_th_b11) * _n_hidden_b7))
	var _n_y_b13 = (_S.named_value(_n_T_b0,"y") - (sin(_n_th_b11) * _n_hidden_b7))
	var _n_pts_b14 = []
	var _n_n_b15 = ceili((float(_S.named_value(_n_T_b0,"L"))/0.5))
	if true:
		var _n_i_b16 = 0
		while _S.truth((_n_i_b16 <= _n_n_b15)):
			var _n_s_b17 = (_n_i_b16 * 0.5)
			var _n_u_b18 = (float(_n_s_b17)/_S.named_value(_n_T_b0,"L"))
			_S.invoke(_n_pts_b14,"push",[{"x":_n_x_b12,"y":_n_y_b13,"th":_n_th_b11,"w":((_S.named_value(_n_T_b0,"W") * pow((1 - _n_u_b18),0.75)) + 0.45),"u":_n_u_b18,"s":_n_s_b17}])
			_n_th_b11 += (0.5 * ((_n_writhe_b8 * sin(((((float(_n_s_b17)/_S.named_value(_n_T_b0,"lam")) * _n_TAU) - (_S.named_value(_n_T_b0,"om") * _n_t_b1)) + _S.named_value(_n_T_b0,"ph")))) + ((_S.named_value(_n_T_b0,"curl") * _n_hook_b9) * _S.MathFX.smooth(0.58,1,_n_u_b18))))
			_n_x_b12 += (cos(_n_th_b11) * 0.5)
			_n_y_b13 += (sin(_n_th_b11) * 0.5)
			_n_i_b16 += 1.0
	return _n_pts_b14
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_LX = _S.read(_parent,"LX")
	var _n_LY = _S.read(_parent,"LY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_T_b1 = _S.arg(_args,1)
	var _n_pts_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_surf_b5 = _S.named_value(_n_T_b1,"y")
	for _iter_0 in _S.array(_n_pts_b2):
		var _n_q_b11 = _iter_0
		if _S.truth((_S.named_value(_n_q_b11,"y") > _n_surf_b5)):
			continue
		var _n_nx_b12 = (-sin(_S.named_value(_n_q_b11,"th")))
		var _n_ny_b13 = cos(_S.named_value(_n_q_b11,"th"))
		var _n_ks_b14 = (1 if _S.truth((((_n_nx_b12 * _n_LX) + (_n_ny_b13 * _n_LY)) >= 0)) else (-1))
		if true:
			var _n_v_b15 = (-_S.named_value(_n_q_b11,"w"))
			while _S.truth((_n_v_b15 <= _S.named_value(_n_q_b11,"w"))):
				var _n_x_b16 = (_S.named_value(_n_q_b11,"x") + (_n_nx_b12 * _n_v_b15))
				var _n_y_b17 = (_S.named_value(_n_q_b11,"y") + (_n_ny_b13 * _n_v_b15))
				var _n_u_b18 = ((float(_n_v_b15)/_S.named_value(_n_q_b11,"w")) * _n_ks_b14)
				if _S.truth((_n_y_b17 <= _n_surf_b5)):
					_S.invoke(_n_p_b0,"px",[_n_x_b16, _n_y_b17, (_S.index_value(_n_C_b3,2) if _S.truth((_n_u_b18 > 0.55)) else (_S.index_value(_n_C_b3,1) if _S.truth((_n_u_b18 > (-0.45))) else _S.index_value(_n_C_b3,0)))])
				_n_v_b15 += 0.5
	var _n_pulse_b6 = ((_n_t_b4 - _S.named_value(_n_T_b1,"t0")) * 150)
	var _n_slow_b7 = (fmod(((_n_t_b4 - _S.named_value(_n_T_b1,"t0")) * 55),(_S.named_value(_n_T_b1,"L") * 1.8)) - 4)
	for _iter_1 in _S.array(_n_pts_b2):
		var _n_q_b19 = _iter_1
		if _S.truth((_S.named_value(_n_q_b19,"y") > _n_surf_b5)):
			continue
		var _n_nx_b20 = (-sin(_S.named_value(_n_q_b19,"th")))
		var _n_ny_b21 = cos(_S.named_value(_n_q_b19,"th"))
		var _n_f_b22 = ((_n_nx_b20 * _n_LX) + (_n_ny_b21 * _n_LY))
		var _n_ks_b23 = (1 if _S.truth((_n_f_b22 >= 0)) else (-1))
		var _n_lit_b24 = (_n_ks_b23 * _S.named_value(_n_q_b19,"w"))
		var _n_x0_b25 = (_S.named_value(_n_q_b19,"x") + (_n_nx_b20 * _n_lit_b24))
		var _n_y0_b26 = (_S.named_value(_n_q_b19,"y") + (_n_ny_b21 * _n_lit_b24))
		var _n_x1_b27 = (_S.named_value(_n_q_b19,"x") - (_n_nx_b20 * _n_lit_b24))
		var _n_y1_b28 = (_S.named_value(_n_q_b19,"y") - (_n_ny_b21 * _n_lit_b24))
		if _S.truth((_n_y1_b28 <= _n_surf_b5)):
			_S.invoke(_n_p_b0,"px",[_n_x1_b27, _n_y1_b28, _S.index_value(_n_C_b3,3)])
		if _S.truth((_n_y0_b26 <= _n_surf_b5)):
			_S.invoke(_n_p_b0,"px",[_n_x0_b25, _n_y0_b26, (_S.index_value(_n_C_b3,7) if _S.truth(_S.logical("&&",(absf(_n_f_b22) > 0.8),func():return (_S.named_value(_n_q_b19,"u") > 0.15))) else (_S.index_value(_n_C_b3,6) if _S.truth((_S.named_value(_n_q_b19,"u") > 0.85)) else (_S.index_value(_n_C_b3,6) if _S.truth((absf(_n_f_b22) > 0.3)) else _S.index_value(_n_C_b3,5))))])
		if _S.truth(((fmod(_S.named_value(_n_q_b19,"s"),3) < 0.5) if _S.truth(((_S.named_value(_n_q_b19,"u") < 0.93) if _S.truth((_S.named_value(_n_q_b19,"u") > 0.62)) else (_S.named_value(_n_q_b19,"u") > 0.62))) else ((_S.named_value(_n_q_b19,"u") < 0.93) if _S.truth((_S.named_value(_n_q_b19,"u") > 0.62)) else (_S.named_value(_n_q_b19,"u") > 0.62)))):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b19,"x") + (((_n_nx_b20 * _S.named_value(_n_T_b1,"curl")) * _S.named_value(_n_q_b19,"w")) * 0.45)), (_S.named_value(_n_q_b19,"y") + (((_n_ny_b21 * _S.named_value(_n_T_b1,"curl")) * _S.named_value(_n_q_b19,"w")) * 0.45)), _S.index_value(_n_C_b3,4)])
		var _n_dp_b29 = minf(absf((_S.named_value(_n_q_b19,"s") - _n_pulse_b6)),(absf((_S.named_value(_n_q_b19,"s") - _n_slow_b7)) * 1.6))
		if _S.truth((_n_dp_b29 < 2.5)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b19,"x"), _S.named_value(_n_q_b19,"y"), (_S.index_value(_n_C_b3,7) if _S.truth((_n_dp_b29 < 1)) else _S.index_value(_n_C_b3,5))])
	var _n_tip_b8 = _S.index_value(_n_pts_b2,(_S.prop(_n_pts_b2,"length") - 1))
	if _S.truth((_S.named_value(_n_tip_b8,"y") <= _n_surf_b5)):
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_tip_b8,"x"), _S.named_value(_n_tip_b8,"y"), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_tip_b8,"x"), _S.named_value(_n_tip_b8,"y"), 6, _S.index_value(_n_C_b3,6), 0.25])
	if true:
		var _n_i_b30 = 0
		while _S.truth((_n_i_b30 < _S.prop(_n_pts_b2,"length"))):
			if _S.truth((_S.named_value(_S.index_value(_n_pts_b2,_n_i_b30),"y") < _n_surf_b5)):
				_S.invoke(_n_p_b0,"glow",[_S.named_value(_S.index_value(_n_pts_b2,_n_i_b30),"x"), _S.named_value(_S.index_value(_n_pts_b2,_n_i_b30),"y"), 9, _S.index_value(_n_C_b3,4), 0.1])
			_n_i_b30 += 8
	var _n_pq_b9 = _S.index_value(_n_pts_b2,minf((_S.prop(_n_pts_b2,"length") - 1),maxf(0,floori((_n_pulse_b6 * 2)+0.5))))
	if _S.truth(((_S.named_value(_n_pq_b9,"y") < _n_surf_b5) if _S.truth((_n_pulse_b6 < _S.named_value(_n_T_b1,"L"))) else (_n_pulse_b6 < _S.named_value(_n_T_b1,"L")))):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_pq_b9,"x"), _S.named_value(_n_pq_b9,"y"), 10, _S.index_value(_n_C_b3,6), 0.45])
	var _n_base_b10 = _S.invoke(_n_pts_b2,"find",[_S.function_value(_S.capture(_parent,{"surf":_n_surf_b5,"this":_this}),"_f2")])
	if _S.truth(_n_base_b10):
		var _n_w_b31 = (_S.named_value(_n_base_b10,"w") + 1.5)
		_S.invoke(_n_p_b0,"line",[(_S.named_value(_n_base_b10,"x") - _n_w_b31), _n_surf_b5, (_S.named_value(_n_base_b10,"x") + _n_w_b31), _n_surf_b5, _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_base_b10,"x") - _n_w_b31) - 1), (_n_surf_b5 + 0.5), _S.index_value(_n_C_b3,3)])
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_base_b10,"x") + _n_w_b31) + 1), (_n_surf_b5 + 0.5), _S.index_value(_n_C_b3,3)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_surf = _S.read(_parent,"surf")
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_q_b0,"y") <= _n_surf)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "splash", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.55]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "ripples", [])
	_S.define(_e, "splats", [])
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "rx", _S.function_value(_e, "_f6"))
	_S.define(_e, "inPool", _S.function_value(_e, "_f7"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"onLand": _S.function_value(_e, "_f8")}])]))
	_S.define(_e, "rows", [[_S.unary("-", 22), _S.unary("-", 2.5)], [_S.unary("-", 8), _S.unary("-", 3)], [7, _S.unary("-", 3)], [21, _S.unary("-", 2.5)], [_S.unary("-", 28), 2.5], [_S.unary("-", 1), 3], [27, 2.5]])
	_S.define(_e, "order", [3, 0, 5, 2, 4, 1, 6])
	_S.define(_e, "last", [1, 5, 0, 6, 3, 2, 4])
	_S.define(_e, "tents", _S.invoke(_S.read(_e, "rows"), "map", [_S.function_value(_e, "_f9")]))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f4(_parent,_args:Array,_this=null):
	var _n_drops = _S.read(_parent,"drops")
	var _n_R = _S.read(_parent,"R")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_t = _S.read(_parent,"t")
	var _n_lights = _S.read(_parent,"lights")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_power_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_n_b2)):
			_S.invoke(_n_drops,"add",[(_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])), (_n_y_b1 - 1), (_S.invoke(_n_R,"range",[(-70), 70]) * _n_power_b3), ((-_S.invoke(_n_R,"range",[90, 230])) * _n_power_b3), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.4])) else 1)])
			_n_i_b4 += 1.0
	_S.invoke(_n_ripples,"push",[{"x":_n_x_b0,"t0":_n_t,"life":0.7,"w":1}])
	_S.invoke(_n_lights,"push",[{"x":_n_x_b0,"y":(_n_y_b1 - 7),"r":30,"k":(0.6 * _n_power_b3),"life":0.25,"max":0.25}])
	return null

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((_n_RX * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_tt_b0)/_n_OPEN),0.0,1.0)])) * (1 - _S.invoke(_n_ease,"inCubic",[clampf((float((_n_tt_b0 - _n_SHUT))/0.45),0.0,1.0)])))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	return (absf(_n_x_b0) < (_S.call_value(_n_rx,[_n_tt_b1]) * 0.95))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_inPool = _S.read(_parent,"inPool")
	var _n_t = _S.read(_parent,"t")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_splats = _S.read(_parent,"splats")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	if _S.truth(_S.call_value(_n_inPool,[_n_x_b0, _n_t])):
		_S.invoke(_n_ripples,"push",[{"x":_n_x_b0,"t0":_n_t,"life":0.5,"w":0.6}])
	else:
		_S.invoke(_n_splats,"push",[{"x":_n_x_b0,"t0":_n_t,"s":_n_s_b3}])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_order = _S.read(_parent,"order")
	var _n_last = _S.read(_parent,"last")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	var _n_back_b3 = (_n_y_b1 < 0)
	var _n_sx_b4 = _S.logical("||",signf(_n_x_b0),func():return 1)
	return {"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-3), 3])),"y":_n_y_b1,"back":_n_back_b3,"L":(_S.invoke(_n_R,"range",[46, 62]) if _S.truth(_n_back_b3) else _S.invoke(_n_R,"range",[32, 46])),"W":(_S.invoke(_n_R,"range",[3.2, 4]) if _S.truth(_n_back_b3) else _S.invoke(_n_R,"range",[3.8, 4.6])),"lean":((_n_sx_b4 * (0.06 + (float(absf(_n_x_b0))/120))) + _S.invoke(_n_R,"range",[(-0.06), 0.06])),"curl":((-_n_sx_b4) if _S.truth(_S.invoke(_n_R,"chance",[0.75])) else _n_sx_b4),"lam":_S.invoke(_n_R,"range",[36, 50]),"om":(_S.invoke(_n_R,"range",[4.5, 7]) * _S.invoke(_n_R,"sign",[])),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"A":_S.invoke(_n_R,"range",[0.06, 0.085]),"H":_S.invoke(_n_R,"range",[0.15, 0.32]),"t0":((0.3 + (_S.index_value(_n_order,_n_i_b2) * 0.045)) + _S.invoke(_n_R,"range",[0, 0.03])),"t1":((1.5 + (_S.index_value(_n_last,_n_i_b2) * 0.1)) + _S.invoke(_n_R,"range",[0, 0.05])),"whip":({"t":_S.invoke(_n_R,"range",[0.9, 1.5]),"a":(_S.invoke(_n_R,"range",[0.28, 0.45]) * _S.invoke(_n_R,"sign",[]))} if _S.truth(_S.invoke(_n_R,"chance",[0.45])) else null),"up":false,"down":false}
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v15 in _S.array(_S.read(_e, "tents")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "T", _v15)
		var _v17 = _S.scope(_v16)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "T"), "up")), func(): return _S.binary(">=", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "T"), "t0")))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "T"), "up", true, "=", false)
			_S.call_value(_S.read(_v18, "splash"), [_S.prop(_S.read(_v18, "T"), "x"), _S.prop(_S.read(_v18, "T"), "y"), 12, 1])
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 4)):
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SPARK"), _S.prop(_S.read(_v19, "T"), "x"), _S.binary("-", _S.prop(_S.read(_v19, "T"), "y"), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [120, 260])), _S.invoke(_S.read(_v19, "R"), "range", [0.2, 0.45])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "T"), "down")), func(): return _S.binary(">=", _S.read(_v17, "t"), _S.binary("+", _S.prop(_S.read(_v17, "T"), "t1"), _S.binary("*", _S.read(_v17, "SINK"), 0.8))))):
			var _v20 = _S.scope(_v17)
			_S.set_prop(_S.read(_v20, "T"), "down", true, "=", false)
			_S.call_value(_S.read(_v20, "splash"), [_S.prop(_S.read(_v20, "T"), "x"), _S.prop(_S.read(_v20, "T"), "y"), 6, 0.6])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v17, "t"), _S.binary("+", _S.prop(_S.read(_v17, "T"), "t0"), 0.2)), func(): return _S.binary("<", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "T"), "t1"))), func(): return _S.invoke(_S.read(_v17, "R"), "chance", [_S.binary("*", _S.read(_v17, "dt"), 1.6)]))):
			var _v21 = _S.scope(_v17)
			_S.define(_v21, "pts", _S.call_value(_S.read(_v21, "spine"), [_S.read(_v21, "T"), _S.read(_v21, "t")]))
			_S.define(_v21, "q", _S.logical("&&", _S.read(_v21, "pts"), func(): return _S.prop(_S.read(_v21, "pts"), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [0.3, 0.95]), _S.prop(_S.read(_v21, "pts"), "length"))]))))
			if _S.truth(_S.logical("&&", _S.read(_v21, "q"), func(): return _S.binary("<", _S.prop(_S.read(_v21, "q"), "y"), _S.prop(_S.read(_v21, "T"), "y")))):
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "STAR"), _S.binary("-", _S.prop(_S.read(_v21, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.prop(_S.read(_v21, "q"), "th")]), _S.prop(_S.read(_v21, "q"), "w"))), _S.binary("+", _S.prop(_S.read(_v21, "q"), "y"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.prop(_S.read(_v21, "q"), "th")]), _S.prop(_S.read(_v21, "q"), "w"))), 0, _S.unary("-", 4), _S.invoke(_S.read(_v21, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v21, "C"), 6), _S.invoke(_S.read(_v21, "R"), "range", [1, 2.2])])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), 8), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SHUT"), 0.4)))):
		var _v22 = _S.scope(_e)
		var _v23 = _S.scope(_v22)
		_S.write(_v23, "acc", _S.binary("*", _S.read(_v23, "dt"), 9), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v23, "acc"), 1)):
			_S.invoke(_S.read(_v23, "puffs"), "spawn", [_S.prop(_S.read(_v23, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v23, "r")), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [1, 4])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [14, 30])), _S.invoke(_S.read(_v23, "R"), "range", [0.6, 0.85]), _S.invoke(_S.read(_v23, "R"), "range", [3, 6])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 16)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", 2), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [30, 80])), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.prop(_S.read(_v22, "C"), 7), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 5)]]), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 1.1])])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 5)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", 3), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [20, 45])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v22, "C"), 6)])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 3)])):
			_S.invoke(_S.read(_v22, "ripples"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v22, "r"))}, {"t0": _S.read(_v22, "t")}, {"life": 0.6}, {"w": 0.5}])])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 7)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v22, "r")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 8])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 22])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.9]), (_S.prop(_S.read(_v22, "C"), 3) if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.5])) else _S.prop(_S.read(_v22, "C"), 4)), _S.invoke(_S.read(_v22, "R"), "range", [3, 6])])
	for _v24 in _S.array([_S.read(_e, "ripples"), _S.read(_e, "splats")]):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
			if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v26, "t"), _S.prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "t0")), _S.logical("??", _S.prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "life"), func(): return 0.6))):
				_S.invoke(_S.read(_v26, "a"), "splice", [_S.read(_v26, "i"), 1])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "-=", true)
	var _v27 = _S.scope(_e)
	_S.define(_v27, "i", _S.binary("-", _S.prop(_S.read(_v27, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v27, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v27, "lights"), _S.read(_v27, "i")), "life", _S.read(_v27, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v27, "lights"), "splice", [_S.read(_v27, "i"), 1])
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_t = _S.read(_parent,"t")
	var _n_RX = _S.read(_parent,"RX")
	var _n_C = _S.read(_parent,"C")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_floorPool = _S.read(_parent,"floorPool")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	var _n_ps = _S.read(_parent,"ps")
	var _n_spine = _S.read(_parent,"spine")
	var _n_tentacle = _S.read(_parent,"tentacle")
	var _n_DIM = _S.read(_parent,"DIM")
	var _n_tents = _S.read(_parent,"tents")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.call_value(_n_rx,[_n_t])
	var _n_k_b2 = (float(_n_r_b1)/_n_RX)
	_S.call_value(_n_floorPool,[_n_p_b0, _n_C, _n_r_b1, _n_t, _n_ripples])
	if _S.truth((_n_k_b2 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-16), 86, _S.index_value(_n_C,4), (0.22 * _n_k_b2)])
		_S.invoke(_n_p_b0,"glow",[0, (-8), ((_n_r_b1 * 1.7) + 12), _S.index_value(_n_C,4), ((0.32 * _n_k_b2) * (0.9 + (0.1 * sin((_n_t * 5)))))])
		_S.invoke(_n_p_b0,"glow",[0, 0, (_n_r_b1 * 1.15), _S.index_value(_n_C,5), (0.18 * _n_k_b2)])
	_S.invoke(_n_puffs,"draw",[_n_p_b0, _S.named_value(_n_PK,"SOOT"), {"x":0,"y":6,"k":_n_k_b2,"reach":70}])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	for _iter_0 in _S.array(_n_tents):
		var _n_T_b3 = _iter_0
		if _S.truth(_S.named_value(_n_T_b3,"back")):
			var _n_pts_b4 = _S.call_value(_n_spine,[_n_T_b3, _n_t])
			if _S.truth(_n_pts_b4):
				_S.call_value(_n_tentacle,[_n_p_b0, _n_T_b3, _n_pts_b4, _n_DIM, _n_t])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_spine = _S.read(_parent,"spine")
	var _n_t = _S.read(_parent,"t")
	var _n_tentacle = _S.read(_parent,"tentacle")
	var _n_C = _S.read(_parent,"C")
	var _n_tents = _S.read(_parent,"tents")
	var _n_drops = _S.read(_parent,"drops")
	var _n_splats = _S.read(_parent,"splats")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_tents):
		var _n_T_b1 = _iter_0
		if _S.truth(not _S.truth(_S.named_value(_n_T_b1,"back"))):
			var _n_pts_b2 = _S.call_value(_n_spine,[_n_T_b1, _n_t])
			if _S.truth(_n_pts_b2):
				_S.call_value(_n_tentacle,[_n_p_b0, _n_T_b1, _n_pts_b2, _n_C, _n_t])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _S.index_value(_n_C,1), _S.index_value(_n_C,5)])
	for _iter_1 in _S.array(_n_splats):
		var _n_s_b3 = _iter_1
		var _n_a_b4 = (1 - (float((_n_t - _S.named_value(_n_s_b3,"t0")))/0.6))
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b3,"x"), (-0.5), _S.index_value(_n_C,1), (_n_a_b4 * 1.5)])
		_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_s_b3,"x") + 1), (-0.5), _S.index_value(_n_C,2), _n_a_b4])
		if _S.truth((_S.named_value(_n_s_b3,"s") > 1)):
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_s_b3,"x") - 1), (-0.5), _S.index_value(_n_C,2), _n_a_b4])
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b3,"x"), (-1.5), _S.index_value(_n_C,5), _n_a_b4])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	for _iter_2 in _S.array(_n_lights):
		var _n_l_b5 = _iter_2
		var _n_q_b6 = (float(_S.named_value(_n_l_b5,"life"))/_S.named_value(_n_l_b5,"max"))
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b5,"x"), _S.named_value(_n_l_b5,"y"), (_S.named_value(_n_l_b5,"r") * (0.6 + (0.4 * _n_q_b6))), _S.index_value(_n_C,5), ((_S.named_value(_n_l_b5,"k") * _n_q_b6) * _n_q_b6)])
	return null
