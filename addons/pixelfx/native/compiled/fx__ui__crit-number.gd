@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/crit-number.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "starburst", _S.function_value(_e, "_f0"))
	_S.define(_e, "tag", _S.function_value(_e, "_f3"))
	_S.define(_e, "speedLines", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Crit number"}, {"desc": "CRIT 128! slams in huge and white over a jagged starburst with a hard shake and speed lines, cools to fire, holds with a shine, then pops into sparks."}, {"tags": ["ui", "critical", "damage", "number", "combat", "text", "one-shot"]}, {"size": [152, 120]}, {"origin": [76, 60]}, {"duration": 1.5}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a0710", "#5e0f16", "#a3191c", "#e0401c", "#ff7b22", "#ffb93b", "#ffe68a", "#ffffff"]}, {"text": "128!"}, {"label": "CRIT"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FOLD", 0.92)
	_S.define(_e, "TAGOUT", 0.98)
	_S.define(_e, "POP", 1.06)
	_S.define(_e, "SX", 1.3)
	_S.define(_e, "NS", 4)
	_S.define(_e, "NY", 5)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SX = _S.read(_parent,"SX")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_R_b4 = _S.arg(_args,4)
	var _n_rot_b5 = _S.arg(_args,5)
	var _n_tips_b6 = _S.arg(_args,6)
	var _n_heat_b7 = _S.arg(_args,7)
	var _n_boil_b8 = _S.arg(_args,8)
	var _n_a_b9 = _S.coalesce(_S.arg(_args,9),func():return 1)
	if _S.truth(((_n_R_b4 < 2) if _S.truth((_n_R_b4 < 2)) else (_n_a_b9 <= 0))):
		return null
	var _n_n_b10 = _S.prop(_n_tips_b6,"length")
	var _n_V_b11 = []
	if true:
		var _n_i_b15 = 0
		while _S.truth((_n_i_b15 < (_n_n_b10 * 2))):
			var _n_an_b16 = (_n_rot_b5 + (float((_n_i_b15 * PI))/_n_n_b10))
			var _n_r_b17 = (_n_R_b4 * ((0.6 + _S.named_value(_S.index_value(_n_tips_b6,_S.binary(">>",_n_i_b15,1)),"dip")) if _S.truth(fmod(_n_i_b15,2)) else (_S.named_value(_S.index_value(_n_tips_b6,_S.binary(">>",_n_i_b15,1)),"len") * (1 + (0.14 * (_S.MathFX.rand([_n_boil_b8,_n_i_b15]) - 0.5))))))
			_S.invoke(_n_V_b11,"push",[[(cos(_n_an_b16) * _n_r_b17), (sin(_n_an_b16) * _n_r_b17), _n_an_b16]])
			_n_i_b15 += 1.0
	var _n_step_b12 = (float(PI)/_n_n_b10)
	var _n_edge_b13 = _S.function_value(_S.capture(_parent,{"rot":_n_rot_b5,"V":_n_V_b11,"step":_n_step_b12,"this":_this}),"_f1")
	var _n_M_b14 = ((_n_R_b4 * 1.15) + 2)
	_S.invoke(_n_p_b0,"shade",[(_n_cx_b2 - (_n_M_b14 * _n_SX)), (_n_cy_b3 - _n_M_b14), (_n_cx_b2 + (_n_M_b14 * _n_SX)), (_n_cy_b3 + _n_M_b14), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b2,"cy":_n_cy_b3,"edge":_n_edge_b13,"a":_n_a_b9,"heat":_n_heat_b7,"C":_n_C_b1,"rot":_n_rot_b5,"n":_n_n_b10,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_V = _S.read(_parent,"V")
	var _n_step = _S.read(_parent,"step")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	var _n_a_b2 = (atan2(_n_dy_b1,_n_dx_b0) - _n_rot)
	_n_a_b2 -= (floori((float(_n_a_b2)/_n_TAU)) * _n_TAU)
	var _n_i_b3 = minf((_S.prop(_n_V,"length") - 1),floori((float(_n_a_b2)/_n_step)))
	var _tuple_0 = _S.index_value(_n_V,_n_i_b3)
	var _n_x0_b4 = _S.prop(_tuple_0,0)
	var _n_y0_b5 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.index_value(_n_V,fmod((_n_i_b3 + 1),_S.prop(_n_V,"length")))
	var _n_x1_b6 = _S.prop(_tuple_1,0)
	var _n_y1_b7 = _S.prop(_tuple_1,1)
	var _n_ex_b8 = (_n_x1_b6 - _n_x0_b4)
	var _n_ey_b9 = (_n_y1_b7 - _n_y0_b5)
	var _n_den_b10 = ((_n_dx_b0 * _n_ey_b9) - (_n_dy_b1 * _n_ex_b8))
	return (_S.Bridge.hypot([_n_x0_b4, _n_y0_b5]) if _S.truth((absf(_n_den_b10) < 1e-9)) else (float(((_n_x0_b4 * _n_ey_b9) - (_n_y0_b5 * _n_ex_b8)))/_n_den_b10))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_SX = _S.read(_parent,"SX")
	var _n_cy = _S.read(_parent,"cy")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_edge = _S.read(_parent,"edge")
	var _n_a = _S.read(_parent,"a")
	var _n_heat = _S.read(_parent,"heat")
	var _n_C = _S.read(_parent,"C")
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_n = _S.read(_parent,"n")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_x_b0 - _n_cx))/_n_SX)
	var _n_dy_b4 = (_n_y_b1 - _n_cy)
	var _n_d_b5 = _S.Bridge.hypot([_n_dx_b3, _n_dy_b4])
	if _S.truth((_n_d_b5 < 0.01)):
		return _n_WHITE
	var _n_L_b6 = _S.call_value(_n_edge,[(float(_n_dx_b3)/_n_d_b5), (float(_n_dy_b4)/_n_d_b5)])
	var _n_gap_b7 = ((_n_L_b6 - _n_d_b5) * (1 + (0.3 * absf((float(_n_dx_b3)/_n_d_b5)))))
	var _n_q_b8 = (float(_n_d_b5)/_n_L_b6)
	if _S.truth((_n_gap_b7 < 0)):
		return null
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	if _S.truth((_n_heat > 0.85)):
		return (_S.index_value(_n_C,6) if _S.truth((_n_gap_b7 < 1)) else _n_WHITE)
	if _S.truth((_n_gap_b7 < 1)):
		return _S.index_value(_n_C,1)
	if _S.truth((_n_gap_b7 < 2.2)):
		return (_n_WHITE if _S.truth((_n_heat > 0.3)) else _S.index_value(_n_C,6))
	if _S.truth((_n_gap_b7 < 3.4)):
		return (_S.index_value(_n_C,6) if _S.truth((_n_heat > 0.3)) else _S.index_value(_n_C,5))
	if _S.truth(((_n_gap_b7 < 7) if _S.truth((_n_gap_b7 >= 6)) else (_n_gap_b7 >= 6))):
		return (_n_WHITE if _S.truth((_n_heat > 0.5)) else _S.index_value(_n_C,4))
	var _n_an_b9 = (atan2(_n_dy_b4,_n_dx_b3) - _n_rot)
	var _n_sp_b10 = ((absf((fmod((((float(_n_an_b9)/_n_TAU) * _n_n) + 0.5),1) - 0.5)) * (float(_n_TAU)/_n_n)) * _n_d_b5)
	if _S.truth(((_n_q_b8 > 0.25) if _S.truth((_n_sp_b10 < 0.6)) else (_n_sp_b10 < 0.6))):
		return (_n_WHITE if _S.truth((_n_heat > 0.5)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b8 > 0.6)) else _S.index_value(_n_C,4)))
	var _n_i_b11 = floori(((3 if _S.truth((_n_q_b8 > 0.72)) else (4 if _S.truth((_n_q_b8 > 0.45)) else 5)) - (_n_heat * 5))+0.5)
	return (_n_WHITE if _S.truth((_n_i_b11 <= 0)) else _S.index_value([_n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,5), _S.index_value(_n_C,4), _S.index_value(_n_C,3), _S.index_value(_n_C,2)],_n_i_b11))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_h_b5 = _S.arg(_args,5)
	var _n_lean_b6 = _S.arg(_args,6)
	_S.invoke(_n_p_b0,"shade",[(_n_x_b2 - 1), (_n_y_b3 - 1), (((_n_x_b2 + _n_w_b4) + _n_lean_b6) + 1), ((_n_y_b3 + _n_h_b5) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"lean":_n_lean_b6,"y":_n_y_b3,"h":_n_h_b5,"w":_n_w_b4,"C":_n_C_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_lean = _S.read(_parent,"lean")
	var _n_y = _S.read(_parent,"y")
	var _n_h = _S.read(_parent,"h")
	var _n_w = _S.read(_parent,"w")
	var _n_C = _S.read(_parent,"C")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_lx_b2 = ((_n_px_b0 - _n_x) - (_n_lean * (float(((_n_y + _n_h) - _n_py_b1))/_n_h)))
	if _S.truth(((((_n_py_b1 < _n_y) if _S.truth((_n_py_b1 < _n_y)) else (_n_py_b1 > (_n_y + _n_h))) if _S.truth(((_n_py_b1 < _n_y) if _S.truth((_n_py_b1 < _n_y)) else (_n_py_b1 > (_n_y + _n_h)))) else (_n_lx_b2 < 0)) if _S.truth((((_n_py_b1 < _n_y) if _S.truth((_n_py_b1 < _n_y)) else (_n_py_b1 > (_n_y + _n_h))) if _S.truth(((_n_py_b1 < _n_y) if _S.truth((_n_py_b1 < _n_y)) else (_n_py_b1 > (_n_y + _n_h)))) else (_n_lx_b2 < 0))) else (_n_lx_b2 > _n_w))):
		return null
	if _S.truth(((((_n_lx_b2 < 1) if _S.truth((_n_lx_b2 < 1)) else (_n_lx_b2 > (_n_w - 1))) if _S.truth(((_n_lx_b2 < 1) if _S.truth((_n_lx_b2 < 1)) else (_n_lx_b2 > (_n_w - 1)))) else (_n_py_b1 < (_n_y + 1))) if _S.truth((((_n_lx_b2 < 1) if _S.truth((_n_lx_b2 < 1)) else (_n_lx_b2 > (_n_w - 1))) if _S.truth(((_n_lx_b2 < 1) if _S.truth((_n_lx_b2 < 1)) else (_n_lx_b2 > (_n_w - 1)))) else (_n_py_b1 < (_n_y + 1)))) else (_n_py_b1 > ((_n_y + _n_h) - 1)))):
		return _S.index_value(_n_C,0)
	return (_S.index_value(_n_C,4) if _S.truth((_n_py_b1 < (_n_y + 2))) else (_S.index_value(_n_C,3) if _S.truth((_n_py_b1 < (_n_y + (_n_h * 0.55)))) else _S.index_value(_n_C,2)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_lines_b3 = _S.arg(_args,3)
	var _n_k_b4 = (float(_n_t_b2)/0.24)
	if _S.truth(((_n_k_b4 <= 0) if _S.truth((_n_k_b4 <= 0)) else (_n_k_b4 >= 1))):
		return null
	for _iter_0 in _S.array(_n_lines_b3):
		var _n_l_b5 = _iter_0
		var _n_r0_b6 = (_S.named_value(_n_l_b5,"r") * (1 + (0.5 * _S.invoke(_n_ease,"outExpo",[_n_k_b4]))))
		var _n_r1_b7 = ((_n_r0_b6 + (_S.named_value(_n_l_b5,"len") * (1 - _n_k_b4))) + 2)
		var _n_ca_b8 = (cos(_S.named_value(_n_l_b5,"a")) * 1.2)
		var _n_sa_b9 = (sin(_S.named_value(_n_l_b5,"a")) * 0.92)
		_S.invoke(_n_p_b0,"line",[(_n_ca_b8 * _n_r0_b6), (_n_sa_b9 * _n_r0_b6), (_n_ca_b8 * _n_r1_b7), (_n_sa_b9 * _n_r1_b7), _S.function_value(_S.capture(_parent,{"k":_n_k_b4,"C":_n_C_b1,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_k = _S.read(_parent,"k")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth(((_n_u_b0 > 0.5) if _S.truth((_n_u_b0 > 0.5)) else (_n_k < 0.3))) else _S.index_value(_n_C,6))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 0), 0.5]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "num", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text")]))
	_S.define(_e, "lab", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "label"), "mini"]))
	_S.define(_e, "tips", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 13}]), _S.function_value(_e, "_f8")]))
	_S.define(_e, "lines", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 18}]), _S.function_value(_e, "_f9")]))
	_S.define(_e, "reach", _S.function_value(_e, "_f10"))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "stamped", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "tagGone", false)
	_S.define(_e, "spawnStar", _S.function_value(_e, "_f11"))
	_S.define(_e, "sizeAt", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f14")}])

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return {"len":_S.invoke(_n_R,"range",[0.86, 1.12]),"dip":_S.invoke(_n_R,"range",[(-0.06), 0.06])}
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_i_b1)/18) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.1), 0.1])),"r":_S.invoke(_n_R,"range",[31, 34]),"len":_S.invoke(_n_R,"range",[8, 15])}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	var _n_d_b1 = _S.arg(_args,1)
	return (9 if _S.truth((_n_v_b0 <= (_n_d_b1 * 2.2))) else (float((-log((1 - (float((_n_d_b1 * 2.2))/_n_v_b0)))))/2.2))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_end = _S.read(_parent,"end")
	var _n_t = _S.read(_parent,"t")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_life_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_size_b6 = _S.arg(_args,6)
	return _S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _n_x_b0, _n_y_b1, _n_vx_b2, _n_vy_b3, minf(_n_life_b4,(_n_end - _n_t)), _n_c_b5, _n_size_b6])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_NS = _S.read(_parent,"NS")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_NS + ((3 * exp(((-_n_t_b0) * 26))) * cos((_n_t_b0 * 38))))
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "slammed"))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "slammed", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [0, 0, 70, _S.read(_v7, "WHITE"), 0.9, 0.16])
		_S.invoke(_S.read(_v7, "lights"), "add", [0, 0, 60, _S.prop(_S.read(_v7, "C"), 4), 0.45, 0.5])
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 30)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [140, 300]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 8), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 6), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 1.15), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 40), _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "R"), "range", [0.12, 0.32]), _S.call_value(_S.read(_v9, "reach"), [_S.binary("*", _S.read(_v9, "sp"), 1.15), 40])])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v10 = _S.scope(_v7)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 10)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "an", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
			_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [90, 170]))
			_S.invoke(_S.read(_v11, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v11, "B"), "SHARD")}, {"x": _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), 10)}, {"y": _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), 7)}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 1.15)}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 60)}, {"g": 0.35}, {"drag": 1.6}, {"life": _S.invoke(_S.read(_v11, "Math"), "min", [_S.invoke(_S.read(_v11, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_v11, "end"), _S.read(_v11, "t"))])}, {"a": _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")])}, {"va": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 24), 24])}, {"s": _S.invoke(_S.read(_v11, "R"), "range", [2, 3.5])}, {"c": _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "C"), 7), _S.prop(_S.read(_v11, "C"), 6), _S.prop(_S.read(_v11, "C"), 5)]])}])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "stamped")), func(): return _S.binary(">=", _S.read(_e, "t"), 0.09))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "stamped", true, "=", false)
		_S.invoke(_S.read(_v12, "lights"), "add", [_S.unary("-", 4), _S.unary("-", 20), 30, _S.prop(_S.read(_v12, "C"), 6), 0.5, 0.2])
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 6)):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STAR"), _S.binary("+", _S.unary("-", 4), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 16), 16])), _S.binary("+", _S.unary("-", 20), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4])), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 40), 40]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 30), 10]), _S.invoke(_S.read(_v13, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v13, "C"), 6), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 1.4])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "tagGone")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "TAGOUT")))):
		var _v14 = _S.scope(_e)
		_S.write(_v14, "tagGone", true, "=", false)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			_S.call_value(_S.read(_v15, "spawnStar"), [_S.binary("+", _S.unary("-", 10), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 16), 16])), _S.binary("+", _S.unary("-", 14), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 5), 5])), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [10, 60])), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.4]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "C"), 7), _S.prop(_S.read(_v15, "C"), 6)]]), (0.6 if _S.truth(_S.read(_v15, "i")) else 1.6)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FOLD"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.07]))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "an", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [70, 150]))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SPARK"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "an")]), 30), _S.read(_v16, "SX")), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "an")]), 30), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "an")]), _S.read(_v16, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "an")]), _S.read(_v16, "sp")), 30), _S.invoke(_S.read(_v16, "Math"), "min", [_S.invoke(_S.read(_v16, "R"), "range", [0.12, 0.26]), _S.call_value(_S.read(_v16, "reach"), [_S.read(_v16, "sp"), 14])])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FOLD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "an", _S.invoke(_S.read(_v17, "R"), "range", [0, _S.read(_v17, "TAU")]))
		_S.define(_v17, "r", _S.invoke(_S.read(_v17, "R"), "range", [14, 28]))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "EMBER"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "an")]), _S.read(_v17, "r")), _S.read(_v17, "SX")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "an")]), _S.read(_v17, "r")), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [15, 40])), _S.invoke(_S.read(_v17, "Math"), "min", [_S.invoke(_S.read(_v17, "R"), "range", [0.5, 0.9]), _S.binary("-", _S.read(_v17, "end"), _S.read(_v17, "t"))]), _S.prop(_S.read(_v17, "C"), 5), _S.invoke(_S.read(_v17, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.05)))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "popped", true, "=", false)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, 0, 44, _S.prop(_S.read(_v18, "C"), 6), 0.7, 0.25])
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 14)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v20, "i"), 14), _S.read(_v20, "TAU")), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.15), 0.15])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [60, 130]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), 10), _S.read(_v20, "SX")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), 7), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), _S.read(_v20, "sp")), _S.read(_v20, "SX")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), _S.read(_v20, "sp")), 10), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.3, 0.42]), _S.binary("-", _S.read(_v20, "end"), _S.read(_v20, "t"))]), _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "C"), 7), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v20, "i"), 3)) else _S.invoke(_S.read(_v20, "R"), "range", [1.3, 2.2]))])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 8)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "an", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
			_S.define(_v22, "sp", _S.invoke(_S.read(_v22, "R"), "range", [120, 240]))
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "an")]), 6), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "an")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "an")]), _S.read(_v22, "sp")), 30), _S.invoke(_S.read(_v22, "Math"), "min", [_S.invoke(_S.read(_v22, "R"), "range", [0.15, 0.3]), _S.binary("-", _S.read(_v22, "end"), _S.read(_v22, "t")), _S.call_value(_S.read(_v22, "reach"), [_S.read(_v22, "sp"), 40])])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v23 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 4, 0, 0.32, _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "sx", _S.prop(_v23, 0))
	_S.define(_e, "sy", _S.prop(_v23, 1))
	var _v24 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 2, 0.09, 0.15, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3)])
	_S.define(_e, "lx", _S.prop(_v24, 0))
	_S.define(_e, "ly", _S.prop(_v24, 1))
	_S.define(_e, "grow", (1.25 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.04)) else _S.binary("+", 1, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), 0.04)), 14)])))))
	_S.define(_e, "fold", _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "FOLD"), 0.12), _S.read(_e, "FOLD")]), 2.4])))
	_S.define(_e, "heat", (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)) else _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.035), 0.12))])))
	_S.define(_e, "breathe", _S.binary("+", 1, _S.binary("*", 0.04, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 16)]))))
	if _S.truth(_S.binary(">", _S.read(_e, "fold"), 0.02)):
		_S.call_value(_S.read(_e, "starburst"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.binary("*", _S.binary("*", _S.binary("*", 31, _S.read(_e, "grow")), _S.read(_e, "fold")), _S.read(_e, "breathe")), _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("*", 0.25, _S.read(_e, "t"))), _S.read(_e, "tips"), _S.read(_e, "heat"), (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.2)) else _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 10)]))])
	_S.call_value(_S.read(_e, "speedLines"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "lines")])
	_S.define(_e, "rk", _S.binary("/", _S.read(_e, "t"), 0.26))
	_S.define(_e, "rr", _S.binary("+", 30, _S.binary("*", 22, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "rk")]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rk"), 0), func(): return _S.binary("<", _S.read(_e, "rk"), 1))):
		_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0, _S.binary("*", _S.read(_e, "rr"), _S.read(_e, "SX")), _S.read(_e, "rr"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "rk"), 0.35)) else _S.prop(_S.read(_e, "C"), 6)), _S.function_value(_e, "_f15")])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "s", _S.call_value(_S.read(_e, "sizeAt"), [_S.read(_e, "t")]))
	_S.define(_e, "sxN", _S.read(_e, "s"))
	_S.define(_e, "syN", _S.read(_e, "s"))
	_S.define(_e, "flash", (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)) else (0.5 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)) else 0)))
	_S.define(_e, "pu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.05))
	if _S.truth(_S.binary(">=", _S.read(_e, "pu"), 1)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v25, "t"), _S.read(_v25, "POP")), 0.05), 0.22))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v25, "k"), 0), func(): return _S.binary("<", _S.read(_v25, "k"), 1))):
			_S.invoke(_S.read(_v25, "p"), "ellipse", [0, 0, _S.binary("*", _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), _S.read(_v25, "SX")), _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), (_S.read(_v25, "WHITE") if _S.truth(_S.binary("<", _S.read(_v25, "k"), 0.4)) else _S.prop(_S.read(_v25, "C"), 6)), _S.function_value(_v25, "_f16")])
	else:
		var _v26 = _S.scope(_e)
		_S.define(_v26, "sq", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), _S.binary("-", _S.read(_v26, "POP"), 0.07), _S.read(_v26, "POP")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "sq"), 0), func(): return _S.binary("<=", _S.read(_v26, "pu"), 0))):
			_S.last([_S.write(_v26, "sxN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("+", 1, _S.binary("*", 0.14, _S.read(_v26, "sq")))), "=", false), _S.write(_v26, "syN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("-", 1, _S.binary("*", 0.12, _S.read(_v26, "sq")))), "=", false)])
		if _S.truth(_S.binary(">", _S.read(_v26, "pu"), 0)):
			_S.last([_S.write(_v26, "sxN", _S.write(_v26, "syN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("+", 1, _S.binary("*", 0.25, _S.read(_v26, "pu")))), "=", false), "=", false), _S.write(_v26, "flash", 1, "=", false)])
		_S.define(_v26, "W", _S.binary("*", _S.prop(_S.read(_v26, "num"), "w"), _S.read(_v26, "sxN")))
		_S.define(_v26, "H", _S.binary("*", 7, _S.read(_v26, "syN")))
		_S.define(_v26, "x0", _S.binary("-", _S.binary("-", _S.read(_v26, "sx"), _S.binary("/", _S.read(_v26, "W"), 2)), 3))
		_S.define(_v26, "y0", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v26, "sy"), _S.read(_v26, "NY")), _S.binary("/", _S.read(_v26, "H"), 2)), _S.binary("*", 3, _S.call_value(_S.read(_v26, "smooth"), [0.15, _S.read(_v26, "FOLD"), _S.read(_v26, "t")]))))
		_S.define(_v26, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v26, "num"), "letters"), "filter", [_S.function_value(_v26, "_f17")]), "map", [_S.function_value(_v26, "_f18")]))
		_S.define(_v26, "sh", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), 0.36, 0.6]))
		_S.define(_v26, "shine", (_S.binary("+", _S.binary("-", _S.read(_v26, "x0"), 10), _S.binary("*", _S.binary("+", _S.read(_v26, "W"), 26), _S.invoke(_S.read(_v26, "ease"), "inOutSine", [_S.read(_v26, "sh")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "sh"), 0), func(): return _S.binary("<", _S.read(_v26, "sh"), 1))) else null))
		_S.call_value(_S.read(_v26, "drawWord"), [_S.read(_v26, "p"), _S.read(_v26, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v26, "C"), 5), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 7)]}, {"edge": _S.read(_v26, "WHITE")}, {"under": _S.prop(_S.read(_v26, "C"), 4)}, {"outline": _S.prop(_S.read(_v26, "C"), 0)}, {"ow": 2}, {"shadow": _S.read(_v26, "SHADOW")}, {"shine": _S.read(_v26, "shine")}, {"shineY": _S.read(_v26, "y0")}, {"glint": _S.prop(_S.read(_v26, "C"), 5)}])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("!==", _S.read(_v26, "shine"), null), func(): return _S.binary(">", _S.read(_v26, "shine"), _S.read(_v26, "x0"))), func(): return _S.binary("<", _S.read(_v26, "shine"), _S.binary("+", _S.read(_v26, "x0"), _S.read(_v26, "W"))))):
			_S.invoke(_S.read(_v26, "p"), "glowLine", [_S.read(_v26, "shine"), _S.read(_v26, "y0"), _S.binary("+", _S.read(_v26, "shine"), _S.binary("*", 0.6, _S.read(_v26, "H"))), _S.binary("+", _S.read(_v26, "y0"), _S.read(_v26, "H")), 8, _S.prop(_S.read(_v26, "C"), 6), 0.3])
		_S.define(_v26, "lk", _S.binary("-", _S.read(_v26, "t"), 0.06))
		_S.define(_v26, "lo", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), _S.binary("-", _S.read(_v26, "TAGOUT"), 0.05), _S.read(_v26, "TAGOUT")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "lk"), 0), func(): return _S.binary("<", _S.read(_v26, "t"), _S.read(_v26, "TAGOUT")))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "ls", (3 if _S.truth(_S.binary("<", _S.read(_v27, "lk"), 0.035)) else (1.8 if _S.truth(_S.binary("<", _S.read(_v27, "lk"), 0.07)) else _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.15, _S.read(_v27, "lo")))))))
			_S.define(_v27, "LW", _S.binary("*", _S.prop(_S.read(_v27, "lab"), "w"), _S.read(_v27, "ls")))
			_S.define(_v27, "lh", _S.binary("*", 5, _S.read(_v27, "ls")))
			_S.define(_v27, "lxo", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v27, "sx"), _S.read(_v27, "lx")), 8), _S.binary("/", _S.read(_v27, "LW"), 2)))
			_S.define(_v27, "lyo", _S.binary("-", _S.binary("+", _S.binary("-", _S.binary("-", _S.read(_v27, "y0"), 3), _S.read(_v27, "lh")), _S.read(_v27, "ly")), _S.binary("*", 2, _S.read(_v27, "lo"))))
			if _S.truth(_S.binary(">", _S.read(_v27, "lo"), 0.5)):
				_S.call_value(_S.read(_v27, "tag"), [_S.read(_v27, "p"), _S.merge([{"0": _S.read(_v27, "WHITE")}, {"2": _S.read(_v27, "WHITE")}, {"3": _S.read(_v27, "WHITE")}, {"4": _S.read(_v27, "WHITE")}]), _S.binary("-", _S.read(_v27, "lxo"), 4), _S.binary("-", _S.read(_v27, "lyo"), 3), _S.binary("+", _S.read(_v27, "LW"), 8), _S.binary("+", _S.read(_v27, "lh"), 5), 3])
			else:
				_S.call_value(_S.read(_v27, "tag"), [_S.read(_v27, "p"), _S.read(_v27, "C"), _S.binary("-", _S.read(_v27, "lxo"), 4), _S.binary("-", _S.read(_v27, "lyo"), 3), _S.binary("+", _S.read(_v27, "LW"), 8), _S.binary("+", _S.read(_v27, "lh"), 5), 3])
			_S.define(_v27, "lit", _S.invoke(_S.invoke(_S.prop(_S.read(_v27, "lab"), "letters"), "filter", [_S.function_value(_v27, "_f19")]), "map", [_S.function_value(_v27, "_f20")]))
			_S.call_value(_S.read(_v27, "drawWord"), [_S.read(_v27, "p"), _S.read(_v27, "lit"), _S.merge([{"fill": [_S.prop(_S.read(_v27, "C"), 6), _S.prop(_S.read(_v27, "C"), 7), _S.prop(_S.read(_v27, "C"), 7)]}, {"edge": _S.read(_v27, "WHITE")}, {"under": _S.prop(_S.read(_v27, "C"), 5)}, {"outline": 0}, {"shadow": _S.prop(_S.read(_v27, "C"), 1)}])])
		_S.define(_v26, "g", _S.binary("/", _S.binary("-", _S.read(_v26, "t"), 0.6), 0.24))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "g"), 0), func(): return _S.binary("<", _S.read(_v26, "g"), 1))):
			_S.call_value(_S.read(_v26, "sparkle"), [_S.read(_v26, "p"), _S.binary("-", _S.binary("+", _S.read(_v26, "x0"), _S.read(_v26, "W")), 2), _S.binary("+", _S.read(_v26, "y0"), 1), _S.binary("*", 6, _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.read(_v26, "g"), _S.prop(_S.read(_v26, "Math"), "PI"))])), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 5), 0.6])
	_S.define(_e, "hold", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.1, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "FOLD"), 0.1), _S.binary("+", _S.read(_e, "POP"), 0.1), _S.read(_e, "t")]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "sx"), _S.read(_e, "sy"), 56, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.14, _S.read(_e, "hold")), _S.binary("+", 1, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 16)]))))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.12)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 64, _S.read(_e, "WHITE"), _S.binary("*", 0.8, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.12)))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_rk = _S.read(_parent,"rk")
	var _n_rr = _S.read(_parent,"rr")
	var _n_d_b0 = _S.arg(_args,0)
	return ((1.2 - _n_rk) if _S.truth((_n_d_b0 > (1 - (float(1.6)/_n_rr)))) else 0)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_ease = _S.read(_parent,"ease")
	var _n_d_b0 = _S.arg(_args,0)
	return ((1.3 - _n_k) if _S.truth((_n_d_b0 > (1 - (float(1.5)/(6 + (22 * _S.invoke(_n_ease,"outCubic",[_n_k]))))))) else 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	return _S.named_value(_n_L_b0,"g")
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_sxN = _S.read(_parent,"sxN")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_syN = _S.read(_parent,"syN")
	var _n_flash = _S.read(_parent,"flash")
	var _n_L_b0 = _S.arg(_args,0)
	return {"g":_S.named_value(_n_L_b0,"g"),"x":(_n_x0 + (_S.named_value(_n_L_b0,"x") * _n_sxN)),"y":_n_y0,"sx":_n_sxN,"sy":_n_syN,"slant":1,"flash":_n_flash}
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	return _S.named_value(_n_L_b0,"g")
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_lxo = _S.read(_parent,"lxo")
	var _n_ls = _S.read(_parent,"ls")
	var _n_lyo = _S.read(_parent,"lyo")
	var _n_lk = _S.read(_parent,"lk")
	var _n_L_b0 = _S.arg(_args,0)
	return {"g":_S.named_value(_n_L_b0,"g"),"x":((_n_lxo + 1) + (_S.named_value(_n_L_b0,"x") * _n_ls)),"y":_n_lyo,"sx":_n_ls,"sy":_n_ls,"slant":0.5,"flash":(1 if _S.truth((_n_lk < 0.035)) else 0)}
	return null
