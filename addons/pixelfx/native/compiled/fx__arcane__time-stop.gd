@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/time-stop.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hand", _S.function_value(_e, "_f0"))
	_S.define(_e, "clockTime", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "CY", _S.unary("-", 42))
	_S.define(_e, "RC", 26)
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "FREEZE", 1.75)
	_S.define(_e, "CRACK", 2.2)
	_S.define(_e, "SHATTER", 2.42)
	_S.define(_e, "TICKS", [0.36, 0.46, 0.57, 0.7, 0.85, 1.03, 1.24, 1.49])
	_S.define(_e, "meta", _S.merge([{"name": "Time stop"}, {"desc": "A clock face springs open, ticks slower and slower, freezes drained of colour, cracks, then shatters into falling shards."}, {"tags": ["arcane", "time", "clock", "freeze", "stop", "shatter", "magic", "one-shot"]}, {"size": [196, 136]}, {"origin": [98, 118]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 14}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "flow", _S.function_value(_e, "_f17"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_TICKS = _S.read(_parent,"TICKS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = 0
	for _iter_0 in _S.array(_n_TICKS):
		var _n_tk_b2 = _iter_0
		if _S.truth((_n_t_b0 > _n_tk_b2)):
			_n_a_b1 += _S.invoke(_n_ease,"outBack",[clampf((float((_n_t_b0 - _n_tk_b2))/0.07),0.0,1.0), 3])
	return ((float((-PI))/2) + (_n_a_b1 * (float(_n_TAU)/12)))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_flow = _S.read(_parent,"flow")
	var _n_FREEZE = _S.read(_parent,"FREEZE")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_s_b1 = 0
	if true:
		var _n_u_b2 = 0
		while _S.truth((_n_u_b2 < minf(_n_t_b0,_n_FREEZE))):
			_n_s_b1 += (float(_S.call_value(_n_flow,[_n_u_b2]))/120)
			_n_u_b2 += (float(1)/120)
	return _n_s_b1
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "face", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawMote", _S.function_value(_e, "_f7"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "G", _S.invoke(_S.read(_e, "C"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f9")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.function_value(_e, "_f10")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "ix", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))
	_S.define(_e, "iy", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f12"))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 7)):
		_S.call_value(_S.read(_v15, "walk"), [_S.read(_v15, "ix"), _S.read(_v15, "iy"), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v15, "i"), 7), _S.read(_v15, "TAU")), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 0.3), 0.3])), 16, 0])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "tc", 0)
	_S.define(_e, "ticked", 0)
	_S.define(_e, "shattered", false)
	_S.define(_e, "frozen", false)
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_RC = _S.read(_parent,"RC")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_hand = _S.read(_parent,"hand")
	var _n_t = _S.read(_parent,"t")
	var _n_frozen = _S.read(_parent,"frozen")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_K_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_cracked_b3 = _S.arg(_args,3)
	var _n_cy_b4 = _n_CY
	var _n_r_b5 = (_n_RC * _n_s_b2)
	if _S.truth((_n_r_b5 < 1)):
		return null
	_S.invoke(_n_p_b0,"disc",[0, _n_cy_b4, _n_r_b5, _S.index_value(_n_K_b1,1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"ring",[0, _n_cy_b4, (_n_r_b5 + 0.5), 1, _S.index_value(_n_K_b1,6)])
	_S.invoke(_n_p_b0,"ring",[0, _n_cy_b4, (_n_r_b5 - 1.5), 1, _S.index_value(_n_K_b1,4)])
	_S.invoke(_n_p_b0,"ring",[0, _n_cy_b4, (_n_r_b5 + 2), 1, _S.index_value(_n_K_b1,3), 0.6])
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 60)):
			var _n_a_b9 = ((float(_n_i_b8)/60) * _n_TAU)
			if _S.truth(fmod(_n_i_b8,5)):
				_S.invoke(_n_p_b0,"dot",[(cos(_n_a_b9) * (_n_r_b5 - 3.5)), (_n_cy_b4 + (sin(_n_a_b9) * (_n_r_b5 - 3.5))), _S.index_value(_n_K_b1,4), 0.8])
			else:
				var _n_q_b10 = _S.binary("===",fmod(_n_i_b8,15),0)
				var _n_r0_b11 = (_n_r_b5 - (8 if _S.truth(_n_q_b10) else 6.5))
				_S.invoke(_n_p_b0,"line",[(cos(_n_a_b9) * _n_r0_b11), (_n_cy_b4 + (sin(_n_a_b9) * _n_r0_b11)), (cos(_n_a_b9) * (_n_r_b5 - 3)), (_n_cy_b4 + (sin(_n_a_b9) * (_n_r_b5 - 3))), (_S.index_value(_n_K_b1,7) if _S.truth(_n_q_b10) else _S.index_value(_n_K_b1,6))])
			_n_i_b8 += 1.0
	_S.invoke(_n_p_b0,"ring",[0, _n_cy_b4, (_n_r_b5 * 0.3), 1, _S.index_value(_n_K_b1,4), 0.8])
	var _n_ha_b6 = (((float((-PI))/2) + (float((_S.call_value(_n_hand,[_n_t]) + (float(PI)/2)))/12)) + 0.9)
	var _n_sa_b7 = (_S.call_value(_n_hand,[_n_t]) + ((sin((_n_t * 70)) * 0.012) if _S.truth(_n_frozen) else 0))
	_S.invoke(_n_p_b0,"beam",[0, _n_cy_b4, ((cos(_n_ha_b6) * _n_r_b5) * 0.48), (_n_cy_b4 + ((sin(_n_ha_b6) * _n_r_b5) * 0.48)), 2.6, _S.function_value(_S.capture(_parent,{"K":_n_K_b1,"this":_this}),"_f5")])
	_S.invoke(_n_p_b0,"line",[((-cos(_n_sa_b7)) * 5), (_n_cy_b4 - (sin(_n_sa_b7) * 5)), (cos(_n_sa_b7) * (_n_r_b5 - 4)), (_n_cy_b4 + (sin(_n_sa_b7) * (_n_r_b5 - 4))), _S.function_value(_S.capture(_parent,{"K":_n_K_b1,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"line",[(((-cos(_n_sa_b7)) * 5) + 0.5), (_n_cy_b4 - (sin(_n_sa_b7) * 5)), ((-cos(_n_sa_b7)) * 2), (_n_cy_b4 - (sin(_n_sa_b7) * 2)), _S.index_value(_n_K_b1,5)])
	_S.invoke(_n_p_b0,"circle",[0, _n_cy_b4, 2.2, _S.index_value(_n_K_b1,5)])
	_S.invoke(_n_p_b0,"circle",[0, _n_cy_b4, 1.2, _S.index_value(_n_K_b1,7)])
	if _S.truth((_n_cracked_b3 > 0)):
		for _iter_0 in _S.array(_n_cracks):
			var _n_pts_b12 = _iter_0
			if true:
				var _n_i_b13 = 0
				var _n_n_b14 = floori((_S.prop(_n_pts_b12,"length") * _n_cracked_b3))
				while _S.truth((_n_i_b13 < _n_n_b14)):
					var _tuple_1 = _S.index_value(_n_pts_b12,_n_i_b13)
					var _n_x_b15 = _S.prop(_tuple_1,0)
					var _n_y_b16 = _S.prop(_tuple_1,1)
					var _n_fresh_b17 = ((_n_cracked_b3 < 1) if _S.truth((_n_i_b13 > (_n_n_b14 - 3))) else (_n_i_b13 > (_n_n_b14 - 3)))
					_S.invoke(_n_p_b0,"px",[_n_x_b15, (_n_cy_b4 + _n_y_b16), (_n_WHITE if _S.truth(_n_fresh_b17) else _S.index_value(_n_K_b1,7))])
					if _S.truth(not _S.truth(_n_fresh_b17)):
						_S.invoke(_n_p_b0,"px",[_n_x_b15, ((_n_cy_b4 + _n_y_b16) - 1), _S.index_value(_n_K_b1,2)])
					_n_i_b13 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_d_b0 = _S.arg(_args,0)
	return (0.3 + ((0.35 * _n_d_b0) * _n_d_b0))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_K = _S.read(_parent,"K")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_K,6) if _S.truth((_n_v_b1 < 0.5)) else _S.index_value(_n_K,4))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_K = _S.read(_parent,"K")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_K,7) if _S.truth((_n_u_b0 > 0.75)) else _S.index_value(_n_K,6))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_tc = _S.read(_parent,"tc")
	var _n_CY = _S.read(_parent,"CY")
	var _n_t = _S.read(_parent,"t")
	var _n_FREEZE = _S.read(_parent,"FREEZE")
	var _n_flow = _S.read(_parent,"flow")
	var _n_G = _S.read(_parent,"G")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_m_b1 = _S.arg(_args,1)
	var _n_back_b2 = _S.arg(_args,2)
	var _n_a_b3 = (_S.named_value(_n_m_b1,"a") + (_S.named_value(_n_m_b1,"w") * _n_tc))
	var _n_z_b4 = sin(_n_a_b3)
	if _S.truth(_S.binary("!==",(_n_z_b4 < 0),_n_back_b2)):
		return null
	var _n_x_b5 = (cos(_n_a_b3) * _S.named_value(_n_m_b1,"r"))
	var _n_y_b6 = ((_n_CY + ((cos(_n_a_b3) * _S.named_value(_n_m_b1,"r")) * _S.named_value(_n_m_b1,"tilt"))) + ((_n_z_b4 * _S.named_value(_n_m_b1,"r")) * 0.3))
	var _n_cold_b7 = (_n_t >= _n_FREEZE)
	var _n_v_b8 = (_S.call_value(_n_flow,[_n_t]) * _S.named_value(_n_m_b1,"w"))
	var _n_c_b9 = (_S.index_value(_n_G,6) if _S.truth(_n_cold_b7) else _S.named_value(_n_m_b1,"c"))
	_S.invoke(_n_p_b0,"dot",[_n_x_b5, _n_y_b6, _n_c_b9, (0.6 if _S.truth(_n_back_b2) else 1)])
	if _S.truth((absf(_n_v_b8) > 0.2)):
		if true:
			var _n_k_b10 = 1
			while _S.truth((_n_k_b10 <= 3)):
				var _n_b_b11 = (_n_a_b3 - (((signf(_S.named_value(_n_m_b1,"w")) * _n_k_b10) * 0.05) * minf(1,absf(_n_v_b8))))
				_S.invoke(_n_p_b0,"dot",[(cos(_n_b_b11) * _S.named_value(_n_m_b1,"r")), ((_n_CY + ((cos(_n_b_b11) * _S.named_value(_n_m_b1,"r")) * _S.named_value(_n_m_b1,"tilt"))) + ((sin(_n_b_b11) * _S.named_value(_n_m_b1,"r")) * 0.3)), (_S.index_value(_n_C,5) if _S.truth((_n_k_b10 < 2)) else _S.index_value(_n_C,4)), ((0.5 if _S.truth(_n_back_b2) else 0.9) * (1 - (float(_n_k_b10)/4)))])
				_n_k_b10 += 1.0
	if _S.truth(not _S.truth(_n_back_b2)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b5, _n_y_b6, 5, (_S.index_value(_n_G,6) if _S.truth(_n_cold_b7) else _S.index_value(_n_C,6)), 0.3])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	var _n_l_b1 = (_S.ColorFX.luma(_n_c_b0) * 255)
	return _S.ColorFX.rgb((_n_l_b1 * 0.92),(_n_l_b1 * 0.96),minf(255,(_n_l_b1 * 1.06)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f10(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RC = _S.read(_parent,"RC")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"r":(_n_RC + _S.invoke(_n_R,"range",[5, 14])),"w":(_S.invoke(_n_R,"range",[1.4, 2.6]) * (1 if _S.truth(fmod(_n_i_b1,2)) else (-1))),"tilt":_S.invoke(_n_R,"range",[(-0.5), 0.5]),"c":_S.invoke(_n_R,"pick",[[_n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,5)]])}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_RC = _S.read(_parent,"RC")
	var _n_walk = _S.read(_parent,"walk")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_depth_b4 = _S.arg(_args,4)
	var _n_pts_b5 = [[_n_x_b0, _n_y_b1]]
	if true:
		var _n_s_b6 = 0
		while _S.truth((_n_s_b6 < _n_len_b3)):
			_n_a_b2 += _S.invoke(_n_R,"range",[(-0.55), 0.55])
			_n_x_b0 += (cos(_n_a_b2) * _S.invoke(_n_R,"range",[1.6, 2.6]))
			_n_y_b1 += (sin(_n_a_b2) * _S.invoke(_n_R,"range",[1.6, 2.6]))
			if _S.truth((_S.Bridge.hypot([_n_x_b0, _n_y_b1]) > (_n_RC - 0.5))):
				break
			_S.invoke(_n_pts_b5,"push",[[_n_x_b0, _n_y_b1]])
			if _S.truth((_S.invoke(_n_R,"chance",[0.14]) if _S.truth(((_S.prop(_n_pts_b5,"length") > 3) if _S.truth((_n_depth_b4 < 1)) else (_n_depth_b4 < 1))) else ((_S.prop(_n_pts_b5,"length") > 3) if _S.truth((_n_depth_b4 < 1)) else (_n_depth_b4 < 1)))):
				_S.call_value(_n_walk,[_n_x_b0, _n_y_b1, (_n_a_b2 + (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[0.6, 1.1]))), (float(_n_len_b3)/2), (_n_depth_b4 + 1)])
			_n_s_b6 += 1.0
	_S.invoke(_n_cracks,"push",[_n_pts_b5])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.write(_e, "tc", _S.call_value(_S.read(_e, "clockTime"), [_S.read(_e, "t")]), "=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "ticked"), _S.prop(_S.read(_e, "TICKS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "TICKS"), _S.read(_e, "ticked"))))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "ticked", 1, "+=", true)
		_S.define(_v16, "a", _S.call_value(_S.read(_v16, "hand"), [_S.binary("+", _S.read(_v16, "t"), 0.1)]))
		_S.invoke(_S.read(_v16, "lights"), "add", [_S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RC"), 4)), _S.binary("+", _S.read(_v16, "CY"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RC"), 4))), 22, _S.prop(_S.read(_v16, "C"), 6), 0.6, 0.12])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 3)):
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.binary("+", _S.read(_v17, "RC"), 1)), _S.binary("+", _S.read(_v17, "CY"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.binary("+", _S.read(_v17, "RC"), 1))), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 30), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 15), 15])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), 30), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 15), 15])), _S.invoke(_S.read(_v17, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v17, "R"), "pick", [[_S.read(_v17, "WHITE"), _S.prop(_S.read(_v17, "C"), 6)]]), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.3])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "frozen")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FREEZE")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "frozen", true, "=", false)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.read(_v18, "CY"), 70, _S.read(_v18, "WHITE"), 0.7, 0.2])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shattered")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHATTER")))):
		var _v19 = _S.scope(_e)
		_S.write(_v19, "shattered", true, "=", false)
		_S.invoke(_S.read(_v19, "lights"), "add", [0, _S.read(_v19, "CY"), 80, _S.read(_v19, "WHITE"), 0.8, 0.16])
		_S.invoke(_S.read(_v19, "lights"), "add", [0, _S.read(_v19, "CY"), 100, _S.prop(_S.read(_v19, "C"), 5), 0.6, 0.6])
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 64)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")]))
			_S.define(_v21, "d", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "RC")]))
			_S.define(_v21, "x", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "d")))
			_S.define(_v21, "y", _S.binary("+", _S.read(_v21, "CY"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "d"))))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [40, 140]))
			_S.define(_v21, "dx", _S.binary("-", _S.read(_v21, "x"), _S.read(_v21, "ix")))
			_S.define(_v21, "dy", _S.binary("-", _S.binary("-", _S.read(_v21, "y"), _S.read(_v21, "CY")), _S.read(_v21, "iy")))
			_S.define(_v21, "l", _S.logical("||", _S.invoke(_S.read(_v21, "Math"), "hypot", [_S.read(_v21, "dx"), _S.read(_v21, "dy")]), func(): return 1))
			_S.invoke(_S.read(_v21, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "SHARD")}, {"x": _S.read(_v21, "x")}, {"y": _S.read(_v21, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v21, "dx"), _S.read(_v21, "l")), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 25), 25]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v21, "dy"), _S.read(_v21, "l")), _S.read(_v21, "sp")), 0.7), _S.invoke(_S.read(_v21, "R"), "range", [40, 120]))}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.25}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.15])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1.5, 3.6])}, {"c": _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "G"), 7), _S.prop(_S.read(_v21, "G"), 6), _S.prop(_S.read(_v21, "G"), 6), _S.prop(_S.read(_v21, "G"), 5)]])}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v19)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 10)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.invoke(_S.read(_v23, "R"), "range", [0, _S.read(_v23, "TAU")]))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [40, 110]))
			_S.invoke(_S.read(_v23, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v23, "B"), "CHUNK")}, {"x": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "RC")), 0.6)}, {"y": _S.binary("+", _S.read(_v23, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "RC")), 0.6))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), 0.6), _S.invoke(_S.read(_v23, "R"), "range", [60, 130]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v23, "R"), "range", [0.9, 1.15])}, {"a": _S.invoke(_S.read(_v23, "R"), "range", [0, _S.read(_v23, "TAU")])}, {"va": _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v23, "R"), "range", [1.6, 3])}, {"ramp": [_S.prop(_S.read(_v23, "G"), 1), _S.prop(_S.read(_v23, "G"), 3), _S.prop(_S.read(_v23, "G"), 4), _S.prop(_S.read(_v23, "G"), 6), _S.prop(_S.read(_v23, "G"), 7)]}])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v24 = _S.scope(_v19)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 26)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [(_S.prop(_S.read(_v25, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v25, "i"), 2)) else _S.prop(_S.read(_v25, "P"), "MOTE")), 0, _S.read(_v25, "CY"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.invoke(_S.read(_v25, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v25, "R"), "pick", [[_S.read(_v25, "WHITE"), _S.prop(_S.read(_v25, "C"), 6), _S.prop(_S.read(_v25, "C"), 5)]]), _S.invoke(_S.read(_v25, "R"), "range", [0.8, 1.8])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v19)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 18)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "R"), "range", [90, 200]))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "SPARK"), 0, _S.read(_v27, "CY"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.invoke(_S.read(_v27, "R"), "range", [0.2, 0.45])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v28 = _S.scope(_v19)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 12)):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "a", _S.invoke(_S.read(_v29, "R"), "range", [0, _S.read(_v29, "TAU")]))
			_S.define(_v29, "d", _S.invoke(_S.read(_v29, "R"), "range", [0, _S.binary("*", _S.read(_v29, "RC"), 0.8)]))
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.read(_v29, "d")), _S.binary("+", _S.read(_v29, "CY"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.read(_v29, "d"))), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.invoke(_S.read(_v29, "R"), "range", [10, 40])), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.invoke(_S.read(_v29, "R"), "range", [10, 30])), _S.invoke(_S.read(_v29, "R"), "range", [5, 20])), _S.invoke(_S.read(_v29, "R"), "range", [0.6, 1]), (_S.prop(_S.read(_v29, "G"), 5) if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.5])) else _S.prop(_S.read(_v29, "C"), 4)), _S.invoke(_S.read(_v29, "R"), "range", [3, 6])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_t = _S.read(_parent,"t")
	var _n_SHATTER = _S.read(_parent,"SHATTER")
	var _n_FREEZE = _S.read(_parent,"FREEZE")
	var _n_G = _S.read(_parent,"G")
	var _n_C = _S.read(_parent,"C")
	var _n_drawMote = _S.read(_parent,"drawMote")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (_S.MathFX.smooth(0,_n_OPEN,_n_t) * (1 - _S.MathFX.smooth(_n_SHATTER,(_n_SHATTER + 0.5),_n_t)))
	var _n_cold_b2 = (_n_t >= _n_FREEZE)
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 40, (_S.index_value(_n_G,5) if _S.truth(_n_cold_b2) else _S.index_value(_n_C,4)), (0.25 * _n_k_b1)])
	if _S.truth((_n_t < _n_SHATTER)):
		for _iter_0 in _S.array(_n_motes):
			var _n_m_b3 = _iter_0
			_S.call_value(_n_drawMote,[_n_p_b0, _n_m_b3, true])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FREEZE = _S.read(_parent,"FREEZE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_SHATTER = _S.read(_parent,"SHATTER")
	var _n_face = _S.read(_parent,"face")
	var _n_G = _S.read(_parent,"G")
	var _n_C = _S.read(_parent,"C")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_CY = _S.read(_parent,"CY")
	var _n_RC = _S.read(_parent,"RC")
	var _n_drawMote = _S.read(_parent,"drawMote")
	var _n_motes = _S.read(_parent,"motes")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_tc = _S.read(_parent,"tc")
	var _n_clockTime = _S.read(_parent,"clockTime")
	var _n_TICKS = _S.read(_parent,"TICKS")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cold_b1 = (_n_t >= _n_FREEZE)
	var _n_s_b2 = (_S.invoke(_n_ease,"outBack",[(float(_n_t)/_n_OPEN), 2.6]) if _S.truth((_n_t < _n_OPEN)) else 1)
	if _S.truth((_n_t < _n_SHATTER)):
		var _n_white_b3 = (((_n_t < (_n_FREEZE + 0.06)) if _S.truth((_n_t >= _n_FREEZE)) else (_n_t >= _n_FREEZE)) if _S.truth(((_n_t < (_n_FREEZE + 0.06)) if _S.truth((_n_t >= _n_FREEZE)) else (_n_t >= _n_FREEZE))) else (_n_t >= (_n_SHATTER - 0.05)))
		_S.call_value(_n_face,[_n_p_b0, (_S.invoke(_n_G,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f16")]) if _S.truth(_n_white_b3) else (_n_G if _S.truth(_n_cold_b1) else _n_C)), _n_s_b2, clampf((float((_n_t - _n_CRACK))/0.18),0.0,1.0)])
		_S.invoke(_n_p_b0,"glow",[0, _n_CY, (_n_RC * 1.9), (_S.index_value(_n_G,5) if _S.truth(_n_cold_b1) else _S.index_value(_n_C,4)), (0.32 * _n_s_b2)])
		_S.invoke(_n_p_b0,"glowRing",[0, _n_CY, _n_RC, 7, (_S.index_value(_n_G,6) if _S.truth(_n_cold_b1) else _S.index_value(_n_C,5)), (0.28 * _n_s_b2)])
		for _iter_0 in _S.array(_n_motes):
			var _n_m_b4 = _iter_0
			_S.call_value(_n_drawMote,[_n_p_b0, _n_m_b4, false])
	if _S.truth((_n_t < 0.35)):
		var _n_q_b5 = (float(_n_t)/0.35)
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, (_n_RC * (0.4 + (1.2 * _S.invoke(_n_ease,"outCubic",[_n_q_b5])))), maxf(1,(3 * (1 - _n_q_b5))), (_n_WHITE if _S.truth((_n_q_b5 < 0.3)) else _S.index_value(_n_C,6)), (1.2 - _n_q_b5)])
		if _S.truth((_n_q_b5 < 0.5)):
			_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, ((26 * (1 - (_n_q_b5 * 2))) + 2), (1 - (_n_q_b5 * 2)), _n_C])
	if _S.truth((_n_t < _n_SHATTER)):
		for _iter_1 in _S.array(_n_TICKS):
			var _n_tk_b6 = _iter_1
			if _S.truth((_n_t < _n_tk_b6)):
				continue
			var _n_q_b7 = (float((_n_tc - _S.call_value(_n_clockTime,[_n_tk_b6])))/0.32)
			if _S.truth((_n_q_b7 >= 1)):
				continue
			_S.invoke(_n_p_b0,"ring",[0, _n_CY, ((_n_RC + 3) + (24 * _S.invoke(_n_ease,"outCubic",[_n_q_b7]))), 1, (_S.index_value(_n_G,5) if _S.truth(_n_cold_b1) else _S.index_value(_n_C,5)), ((0.6 if _S.truth(_n_cold_b1) else 0.8) * pow((1 - _n_q_b7),1.6))])
	if _S.truth(((_n_t < (_n_SHATTER + 0.2)) if _S.truth((_n_t >= _n_SHATTER)) else (_n_t >= _n_SHATTER))):
		var _n_q_b8 = (float((_n_t - _n_SHATTER))/0.2)
		_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, ((34 * (1 - _n_q_b8)) + 2), (1 - _n_q_b8), _n_C])
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, (_n_RC + (30 * _S.invoke(_n_ease,"outCubic",[_n_q_b8]))), maxf(1,(3 * (1 - _n_q_b8))), _n_WHITE, (1.2 - _n_q_b8)])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	return _n_WHITE
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_FREEZE = _S.read(_parent,"FREEZE")
	var _n_t_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_t_b0 < _n_OPEN)) else pow(maxf(0,(1 - (float((_n_t_b0 - _n_OPEN))/(_n_FREEZE - _n_OPEN)))),1.6))
	return null
