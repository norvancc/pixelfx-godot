@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/splash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "lace", _S.import_value("fx/water/_lib.js", "lace"))
	_S.define(_e, "pebble", _S.import_value("fx/water/_lib.js", "pebble"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Splash"}, {"desc": "A stone drops into still water: a white hit, a crown that tears into droplets arcing out to plink down with rings, a jet that bounces back, foam and drifting mist."}, {"tags": ["water", "splash", "impact", "drop", "liquid", "one-shot"]}, {"size": [176, 100]}, {"origin": [88, 78]}, {"duration": 2.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"stone": true}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "HIT", 0.16)
	_S.define(_e, "G", 820)
	_S.define(_e, "FINGERS", 12)
	_S.define(_e, "JET", 0.3)
	_S.define(_e, "TEAR", 0.11)
	_S.define(_e, "height", _S.function_value(_e, "_f16"))
	_S.define(_e, "foot", _S.function_value(_e, "_f17"))
	_S.define(_e, "lip", _S.function_value(_e, "_f18"))
	_S.define(_e, "jetH", _S.function_value(_e, "_f19"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "crown", _S.function_value(_e, "_f1"))
	_S.define(_e, "jet", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "phi", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "plinks", [])
	_S.define(_e, "bubbles", [])
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "FINGERS")}]), _S.function_value(_e, "_f6")]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "done", _S.construct(_S.read(_e, "Set"), []))
	_S.define(_e, "once", _S.function_value(_e, "_f8"))
	_S.define(_e, "scallop", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_height = _S.read(_parent,"height")
	var _n_foot = _S.read(_parent,"foot")
	var _n_lip = _S.read(_parent,"lip")
	var _n_Map = _S.read(_parent,"Map")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_phi = _S.read(_parent,"phi")
	var _n_scallop = _S.read(_parent,"scallop")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_TEAR = _S.read(_parent,"TEAR")
	var _n_bead = _S.read(_parent,"bead")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_u_b2 = (_n_t - _n_HIT)
	var _n_h_b3 = _S.call_value(_n_height,[_n_u_b2])
	if _S.truth(((_n_u_b2 < 0) if _S.truth((_n_u_b2 < 0)) else (_n_h_b3 < 0.7))):
		return null
	var _n_r0_b4 = _S.call_value(_n_foot,[_n_u_b2])
	var _n_rt_b5 = _S.call_value(_n_lip,[_n_u_b2])
	var _n_white_b6 = (_n_u_b2 < 0.045)
	var _n_cells_b7 = _S.construct(_n_Map,[])
	var _n_put_b8 = _S.function_value(_S.capture(_parent,{"cells":_n_cells_b7,"this":_this}),"_f2")
	var _n_n_b9 = ceili(((_n_rt_b5 * _n_TAU) * 1.6))
	if true:
		var _n_i_b11 = 0
		while _S.truth((_n_i_b11 < _n_n_b9)):
			var _n_a_b12 = ((float(_n_i_b11)/_n_n_b9) * _n_TAU)
			var _n_s_b13 = sin(_n_a_b12)
			var _n_c_b14 = cos(_n_a_b12)
			if _S.truth(_S.binary("!==",(_n_s_b13 < 0),_n_back_b1)):
				_n_i_b11 += 1.0
				continue
			var _n_lane_b15 = floori((float(((_n_a_b12 + _n_phi) * _n_rt_b5))/2.2))
			var _n_streak_b16 = (_S.MathFX.rand([_n_lane_b15,31]) < 0.3)
			var _n_H_b17 = _S.call_value(_n_scallop,[_n_a_b12, _n_h_b3])
			var _n_keep_b18 = (1 - clampf((float(((_n_u_b2 - 0.13) - (0.14 * _S.MathFX.rand([_n_lane_b15,7]))))/0.1),0.0,1.0))
			var _n_steps_b19 = (ceili((_n_H_b17 * 1.4)) + 2)
			if true:
				var _n_k_b20 = 0
				while _S.truth((_n_k_b20 <= (_n_steps_b19 * _n_keep_b18))):
					var _n_v_b21 = (float(_n_k_b20)/_n_steps_b19)
					var _n_r_b22 = (_n_r0_b4 + ((_n_rt_b5 - _n_r0_b4) * pow(_n_v_b21,2.2)))
					var _n_x_b23 = (_n_c_b14 * _n_r_b22)
					var _n_y_b24 = (((_n_s_b13 * _n_r_b22) * _n_SY) - (_n_H_b17 * _n_v_b21))
					if _S.truth(_n_white_b6):
						_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, _n_WHITE, 1, 3])
					else:
						if _S.truth(_n_back_b1):
							_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, ((_S.index_value(_n_C,5) if _S.truth(_n_streak_b16) else _S.index_value(_n_C,4)) if _S.truth((_n_v_b21 > 0.72)) else (_S.index_value(_n_C,3) if _S.truth(_n_streak_b16) else _S.index_value(_n_C,2))), 1, 1])
						else:
							if _S.truth((absf(_n_c_b14) > 0.9)):
								_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, ((_n_WHITE if _S.truth((absf(_n_c_b14) > 0.97)) else _S.index_value(_n_C,6)) if _S.truth((_n_c_b14 < 0)) else _S.index_value(_n_C,4)), 1, 2])
							else:
								if _S.truth((_n_v_b21 < 0.1)):
									_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, (_n_WHITE if _S.truth((_n_v_b21 < 0.05)) else _S.index_value(_n_C,6)), 1, 2])
								else:
									if _S.truth(_n_streak_b16):
										_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, (_S.index_value(_n_C,6) if _S.truth((_n_c_b14 < (-0.2))) else _S.index_value(_n_C,5)), 1, 1])
									else:
										_S.call_value(_n_put_b8,[_n_x_b23, _n_y_b24, (_S.index_value(_n_C,5) if _S.truth((_n_c_b14 < 0)) else _S.index_value(_n_C,4)), 0.22, 0])
					_n_k_b20 += 1.0
			if _S.truth(((_n_keep_b18 >= 1) if _S.truth(not _S.truth(_n_white_b6)) else not _S.truth(_n_white_b6))):
				var _n_x_b25 = (_n_c_b14 * _n_rt_b5)
				var _n_y_b26 = (((_n_s_b13 * _n_rt_b5) * _n_SY) - _n_H_b17)
				_S.call_value(_n_put_b8,[_n_x_b25, _n_y_b26, (_S.index_value(_n_C,5) if _S.truth(_n_back_b1) else (_n_WHITE if _S.truth((_n_c_b14 < 0.45)) else _S.index_value(_n_C,6))), 1, 3])
				if _S.truth(((_n_c_b14 < 0.2) if _S.truth(not _S.truth(_n_back_b1)) else not _S.truth(_n_back_b1))):
					_S.call_value(_n_put_b8,[_n_x_b25, (_n_y_b26 + 1), _S.index_value(_n_C,6), 1, 2])
			_n_i_b11 += 1.0
	for _iter_0 in _S.array(_S.invoke(_n_cells_b7,"values",[])):
		var _n_q_b27 = _iter_0
		if _S.truth(_S.binary("===",_S.named_value(_n_q_b27,"r"),0)):
			_S.invoke(_n_p_b0,"blend",[_S.named_value(_n_q_b27,"x"), _S.named_value(_n_q_b27,"y"), _S.named_value(_n_q_b27,"c"), _S.named_value(_n_q_b27,"a")])
		else:
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b27,"x"), _S.named_value(_n_q_b27,"y"), _S.named_value(_n_q_b27,"c")])
	var _n_reach_b10 = (1 - _S.MathFX.smooth(_n_TEAR,(_n_TEAR + 0.1),_n_u_b2))
	for _iter_1 in _S.array(_n_spikes):
		var _n_f_b28 = _iter_1
		if _S.truth(_S.logical("||",_S.binary("!==",(sin(_S.named_value(_n_f_b28,"a")) < 0),_n_back_b1),func():return (_n_reach_b10 <= 0))):
			continue
		var _n_H_b29 = _S.call_value(_n_scallop,[_S.named_value(_n_f_b28,"a"), _n_h_b3])
		var _n_L_b30 = ((_n_h_b3 * _S.named_value(_n_f_b28,"L")) * _n_reach_b10)
		var _n_x0_b31 = (cos(_S.named_value(_n_f_b28,"a")) * _n_rt_b5)
		var _n_y0_b32 = (((sin(_S.named_value(_n_f_b28,"a")) * _n_rt_b5) * _n_SY) - _n_H_b29)
		var _n_x1_b33 = (_n_x0_b31 + ((cos(_S.named_value(_n_f_b28,"a")) * _n_L_b30) * 0.45))
		var _n_y1_b34 = (_n_y0_b32 - _n_L_b30)
		if _S.truth((_n_L_b30 >= 1)):
			_S.invoke(_n_p_b0,"line",[_n_x0_b31, _n_y0_b32, _n_x1_b33, _n_y1_b34, (_n_WHITE if _S.truth(_n_white_b6) else (_S.index_value(_n_C,4) if _S.truth(_n_back_b1) else _S.index_value(_n_C,6)))])
		if _S.truth(((_n_u_b2 < _n_TEAR) if _S.truth((_n_u_b2 > 0.04)) else (_n_u_b2 > 0.04))):
			_S.call_value(_n_bead,[_n_p_b0, (_n_x1_b33 - (0 if _S.truth(_n_back_b1) else 0.5)), (_n_y1_b34 - 1), 0, (-1), (1 if _S.truth(_n_back_b1) else 2), _n_C])
		if _S.truth(((sin(_S.named_value(_n_f_b28,"a")) > 0.3) if _S.truth(not _S.truth(_n_back_b1)) else not _S.truth(_n_back_b1))):
			_S.invoke(_n_p_b0,"glow",[_n_x0_b31, _n_y0_b32, 6, _S.index_value(_n_C,5), (0.22 * _n_reach_b10)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cells = _S.read(_parent,"cells")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_rank_b4 = _S.arg(_args,4)
	var _n_X_b5 = floori(_n_x_b0)
	var _n_Y_b6 = floori(_n_y_b1)
	var _n_key_b7 = ((((_n_Y_b6 + 4096) * 8192) + _n_X_b5) + 4096)
	var _n_cur_b8 = _S.invoke(_n_cells,"get",[_n_key_b7])
	if _S.truth((not _S.truth(_n_cur_b8) if _S.truth(not _S.truth(_n_cur_b8)) else (_n_rank_b4 > _S.named_value(_n_cur_b8,"r")))):
		_S.invoke(_n_cells,"set",[_n_key_b7, {"x":_n_X_b5,"y":_n_Y_b6,"c":_n_c_b2,"a":_n_a_b3,"r":_n_rank_b4}])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_JET = _S.read(_parent,"JET")
	var _n_jetH = _S.read(_parent,"jetH")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_u_b1 = ((_n_t - _n_HIT) - _n_JET)
	var _n_h_b2 = _S.call_value(_n_jetH,[_n_u_b1])
	if _S.truth(((_n_u_b1 < 0) if _S.truth((_n_u_b1 < 0)) else (_n_h_b2 < 0.8))):
		return null
	var _n_top_b3 = (-_n_h_b2)
	_S.invoke(_n_p_b0,"ellipse",[0, 0, 5, 2.4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"shade",[(-3), (_n_top_b3 - 2), 3, 0, _S.function_value(_S.capture(_parent,{"top":_n_top_b3,"h":_n_h_b2,"this":_this}),"_f5")])
	if _S.truth((_n_u_b1 < 0.12)):
		_S.invoke(_n_p_b0,"circle",[0, (_n_top_b3 - 1), 1.7, _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[(-0.3), (_n_top_b3 - 1.3), 1.1, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"px",[(-1), (_n_top_b3 - 2), _n_WHITE])
	_S.invoke(_n_p_b0,"glowLine",[0, (-1), 0, _n_top_b3, 7, _S.index_value(_n_C,5), 0.3])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (null if _S.truth((sin(_n_a_b1) > 0)) else (_n_WHITE if _S.truth((_n_d_b0 < 0.5)) else (_S.index_value(_n_C,6) if _S.truth((cos(_n_a_b1) < 0)) else _S.index_value(_n_C,5))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_h = _S.read(_parent,"h")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_v_b3 = clampf((float((_n_y_b1 - _n_top))/_n_h),0.0,1.0)
	var _n_w_b4 = (1.15 + (((1.5 * _n_v_b3) * _n_v_b3) * _n_v_b3))
	var _n_q_b5 = (float(_n_x_b0)/_n_w_b4)
	if _S.truth((absf(_n_q_b5) > 1)):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_q_b5 < (-0.5))) else (_n_WHITE if _S.truth((_n_q_b5 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b5 < 0.72)) else _S.index_value(_n_C,4)))),"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_FINGERS = _S.read(_parent,"FINGERS")
	var _n_phi = _S.read(_parent,"phi")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return {"a":fmod(((float((_n_k_b1 * _n_TAU))/_n_FINGERS) + _n_phi),_n_TAU),"L":_S.invoke(_n_R,"range",[0.2, 0.36])}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_rings = _S.read(_parent,"rings")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_SY = _S.read(_parent,"SY")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_drops = _S.read(_parent,"drops")
	var _n_d_b0 = _S.arg(_args,0)
	_S.invoke(_n_rings,"add",[_S.named_value(_n_d_b0,"x"), _S.named_value(_n_d_b0,"z"), 0.6, (2 + (_S.named_value(_n_d_b0,"s") * 1.8)), (0.34 + (_S.named_value(_n_d_b0,"s") * 0.1)), {"n":1,"k":0.95,"hot":0.06}])
	_S.invoke(_n_plinks,"push",[{"x":_S.named_value(_n_d_b0,"x"),"y":(_S.named_value(_n_d_b0,"z") * _n_SY),"s":_S.named_value(_n_d_b0,"s"),"age":0}])
	if _S.truth((not _S.truth(_S.named_value(_n_d_b0,"small")) if _S.truth((_S.named_value(_n_d_b0,"s") > 1)) else (_S.named_value(_n_d_b0,"s") > 1))):
		if true:
			var _n_i_b1 = 0
			while _S.truth((_n_i_b1 < _S.named_value(_n_d_b0,"s"))):
				var _n_a_b2 = _S.invoke(_n_R,"range",[0, _n_TAU])
				var _n_v_b3 = _S.invoke(_n_R,"range",[10, 34])
				_S.invoke(_n_drops,"add",[{"x":_S.named_value(_n_d_b0,"x"),"z":_S.named_value(_n_d_b0,"z"),"h":0.5,"vx":(cos(_n_a_b2) * _n_v_b3),"vz":(sin(_n_a_b2) * _n_v_b3),"vh":_S.invoke(_n_R,"range",[55, 110]),"s":1,"small":true,"life":1}])
				_n_i_b1 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_key_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	return _S.logical("&&",_S.logical("&&",not _S.truth(_S.invoke(_n_done,"has",[_n_key_b0])),func():return (_n_t >= _n_at_b1)),func():return _S.invoke(_n_done,"add",[_n_key_b0]))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_phi = _S.read(_parent,"phi")
	var _n_o = _S.read(_parent,"o")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_h_b1 = _S.arg(_args,1)
	return (_n_h_b1 * (0.86 + (0.14 * _S.MathFX.noise((((cos(_n_a_b0) * 2.2) + (sin(_n_a_b0) * 1.3)) + (_n_phi * 3)),_S.named_value(_n_o,"seed")))))
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["hit", _S.read(_e, "HIT")])):
		var _v14 = _S.scope(_e)
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 6), 52, _S.prop(_S.read(_v14, "C"), 5), 0.6, 0.45])
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 4), 16, _S.read(_v14, "WHITE"), 0.5, 0.08])
		_S.invoke(_S.read(_v14, "rings"), "add", [0, 0, 8, 56, 2, _S.merge([{"n": 2}, {"gap": 3.4}, {"k": 1.35}, {"hot": 0.16}, {"glint": 1}])])
		_S.invoke(_S.read(_v14, "rings"), "add", [0, 0, 5, 38, 1.7, _S.merge([{"n": 1}, {"k": 0.9}, {"delay": 0.14}])])
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 20)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
			_S.define(_v16, "v", _S.invoke(_S.read(_v16, "R"), "range", [50, 125]))
			_S.invoke(_S.read(_v16, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), 3)}, {"z": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), 3)}, {"h": _S.invoke(_S.read(_v16, "R"), "range", [1, 6])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "v"))}, {"vh": _S.invoke(_S.read(_v16, "R"), "range", [160, 270])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.25])) else 1)}, {"delay": _S.invoke(_S.read(_v16, "R"), "range", [0, 0.04])}])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v14)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 9)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "s", (1 if _S.truth(_S.binary("%", _S.read(_v18, "i"), 2)) else _S.unary("-", 1)))
			_S.define(_v18, "x", _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [4, 12])))
			_S.invoke(_S.read(_v18, "mist"), "add", [_S.read(_v18, "x"), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [1, 7])), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [25, 70])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [4, 16])), _S.invoke(_S.read(_v18, "R"), "range", [2.5, 4]), _S.invoke(_S.read(_v18, "R"), "range", [7, 11]), _S.invoke(_S.read(_v18, "R"), "range", [0.9, 1.5]), (_S.prop(_S.read(_v18, "C"), 6) if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.5])) else _S.prop(_S.read(_v18, "C"), 5)), _S.invoke(_S.read(_v18, "R"), "range", [0.3, 0.42]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.1])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["spray", _S.binary("+", _S.read(_e, "HIT"), 0.04)])):
		var _v19 = _S.scope(_e)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 20)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")]))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), 9), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), 9), _S.read(_v21, "SY")), _S.invoke(_S.read(_v21, "R"), "range", [6, 15])), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.invoke(_S.read(_v21, "R"), "range", [25, 90])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 100])), _S.invoke(_S.read(_v21, "R"), "range", [0.7, 1.3]), (_S.read(_v21, "WHITE") if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 6)), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.5])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v19)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 5)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 13), 13]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [6, 20])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v22, "R"), "range", [0.25, 0.55]), _S.prop(_S.read(_v22, "C"), 6), _S.invoke(_S.read(_v22, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v22, "R"), "range", [0, 0.15])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["tear", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "TEAR"))])):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "h", _S.call_value(_S.read(_v23, "height"), [_S.read(_v23, "TEAR")]))
		_S.define(_v23, "rt", _S.call_value(_S.read(_v23, "lip"), [_S.read(_v23, "TEAR")]))
		for _v24 in _S.array(_S.read(_v23, "spikes")):
			var _v25 = _S.scope(_v23)
			_S.define(_v25, "f", _v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.binary("+", _S.prop(_S.read(_v26, "f"), "a"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.08), 0.08])))
			_S.define(_v26, "v", _S.invoke(_S.read(_v26, "R"), "range", [32, 88]))
			_S.define(_v26, "L", _S.binary("*", _S.read(_v26, "h"), _S.prop(_S.read(_v26, "f"), "L")))
			_S.invoke(_S.read(_v26, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.prop(_S.read(_v26, "f"), "a")]), _S.binary("+", _S.read(_v26, "rt"), _S.binary("*", _S.read(_v26, "L"), 0.45)))}, {"z": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.prop(_S.read(_v26, "f"), "a")]), _S.read(_v26, "rt"))}, {"h": _S.binary("+", _S.binary("+", _S.read(_v26, "h"), _S.read(_v26, "L")), 1)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "v"))}, {"vh": _S.invoke(_S.read(_v26, "R"), "range", [90, 190])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.3])) else 2)}])])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.13), func(): return _S.binary("<", _S.read(_e, "u"), 0.3)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.3]))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
		_S.define(_v27, "rt", _S.call_value(_S.read(_v27, "lip"), [_S.read(_v27, "u")]))
		_S.define(_v27, "v", _S.invoke(_S.read(_v27, "R"), "range", [15, 45]))
		_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "rt"))}, {"z": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "rt"))}, {"h": _S.binary("*", _S.call_value(_S.read(_v27, "scallop"), [_S.read(_v27, "a"), _S.call_value(_S.read(_v27, "height"), [_S.read(_v27, "u")])]), _S.invoke(_S.read(_v27, "R"), "range", [0.6, 1]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 10), 45])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1)}])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["fall", _S.binary("+", _S.read(_e, "HIT"), 0.3)])):
		var _v28 = _S.scope(_e)
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 8)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")]))
			_S.define(_v30, "r", _S.call_value(_S.read(_v30, "lip"), [0.3]))
			_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [15, 40]))
			_S.invoke(_S.read(_v30, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "r"))}, {"z": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "r"))}, {"h": _S.invoke(_S.read(_v30, "R"), "range", [3, 7])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v"))}, {"vh": _S.invoke(_S.read(_v30, "R"), "range", [30, 80])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.4])) else 1)}])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["bead", _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "JET")), 0.12)])):
		var _v31 = _S.scope(_e)
		_S.invoke(_S.read(_v31, "drops"), "add", [_S.merge([{"x": 0}, {"z": 0.2}, {"h": _S.binary("+", _S.call_value(_S.read(_v31, "jetH"), [0.12]), 1)}, {"vx": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 6])}, {"vz": 0}, {"vh": 55}, {"s": 3}])])
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 3)):
			_S.invoke(_S.read(_v32, "mist"), "add", [_S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("+", _S.unary("-", _S.call_value(_S.read(_v32, "jetH"), [0.12])), _S.invoke(_S.read(_v32, "R"), "range", [2, 8])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [4, 12])), 2, _S.invoke(_S.read(_v32, "R"), "range", [4, 6]), _S.invoke(_S.read(_v32, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v32, "C"), 6), 0.3])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["slump", _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "JET")), 0.38)])):
		var _v33 = _S.scope(_e)
		_S.invoke(_S.read(_v33, "rings"), "add", [0, 0, 3, 30, 1.5, _S.merge([{"n": 2}, {"gap": 2.6}, {"k": 0.9}])])
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v34, "i"), 4)):
			_S.invoke(_S.read(_v34, "mist"), "add", [_S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [1, 4])), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [3, 10])), 2.5, _S.invoke(_S.read(_v34, "R"), "range", [6, 9]), _S.invoke(_S.read(_v34, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_v34, "C"), 5), 0.28])
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "+=", true)
	for _v35 in _S.array([[0, 0.95], [1, 1.2], [2, 1.5]]):
		var _v36 = _S.scope(_e)
		var _v37 = _v35
		_S.define(_v36, "i", _S.prop(_v37, 0))
		_S.define(_v36, "at", _S.prop(_v37, 1))
		if _S.truth(_S.call_value(_S.read(_v36, "once"), [_S.binary("+", "glug", _S.read(_v36, "i")), _S.binary("+", _S.read(_v36, "HIT"), _S.read(_v36, "at"))])):
			_S.invoke(_S.read(_v36, "bubbles"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 5), 5])}, {"z": _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 6), 6])}, {"t0": _S.read(_v36, "t")}, {"r": _S.invoke(_S.read(_v36, "R"), "range", [1.3, 2.3])}, {"popped": false}])])
	for _v38 in _S.array(_S.read(_e, "bubbles")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "b", _v38)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v39, "b"), "popped")), func(): return _S.binary(">", _S.binary("-", _S.read(_v39, "t"), _S.prop(_S.read(_v39, "b"), "t0")), 0.2))):
			var _v40 = _S.scope(_v39)
			_S.set_prop(_S.read(_v40, "b"), "popped", true, "=", false)
			_S.invoke(_S.read(_v40, "rings"), "add", [_S.prop(_S.read(_v40, "b"), "x"), _S.prop(_S.read(_v40, "b"), "z"), 1, 7, 0.6, _S.merge([{"n": 1}, {"k": 0.9}])])
			_S.invoke(_S.read(_v40, "plinks"), "push", [_S.merge([{"x": _S.prop(_S.read(_v40, "b"), "x")}, {"y": _S.binary("*", _S.prop(_S.read(_v40, "b"), "z"), _S.read(_v40, "SY"))}, {"s": 1}, {"age": 0}])])
			var _v41 = _S.scope(_v40)
			_S.define(_v41, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v41, "i"), 2)):
				_S.invoke(_S.read(_v41, "drops"), "add", [_S.merge([{"x": _S.prop(_S.read(_v41, "b"), "x")}, {"z": _S.prop(_S.read(_v41, "b"), "z")}, {"h": 1}, {"vx": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 20), 20])}, {"vz": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 10), 10])}, {"vh": _S.invoke(_S.read(_v41, "R"), "range", [50, 90])}, {"s": 1}, {"small": true}, {"life": 1}])])
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "i", 1, "+=", true)
	var _v42 = _S.scope(_e)
	_S.define(_v42, "i", _S.binary("-", _S.prop(_S.read(_v42, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v42, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v42, "plinks"), _S.read(_v42, "i")), "age", _S.read(_v42, "dt"), "+=", false), 0.14)):
			_S.invoke(_S.read(_v42, "plinks"), "splice", [_S.read(_v42, "i"), 1])
		_v42 = _S.iteration(_v42)
		_S.write(_v42, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_foot = _S.read(_parent,"foot")
	var _n_SY = _S.read(_parent,"SY")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_crown = _S.read(_parent,"crown")
	var _n_drops = _S.read(_parent,"drops")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_u_b1 = (_n_t - _n_HIT)
	if _S.truth(((_n_u_b1 < 0.26) if _S.truth((_n_u_b1 > 0)) else (_n_u_b1 > 0))):
		var _n_r_b2 = ((_S.call_value(_n_foot,[_n_u_b1]) * 0.85) * (1 - _S.MathFX.smooth(0.12,0.26,_n_u_b1)))
		_S.invoke(_n_p_b0,"ellipse",[0, 0, _n_r_b2, ((_n_r_b2 * _n_SY) + 0.6), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, (-1)])
	_S.call_value(_n_crown,[_n_p_b0, true])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "back"])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,1) if _S.truth((sin(_n_a_b1) < 0)) else _S.index_value(_n_C,2))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_o = _S.read(_parent,"o")
	var _n_lace = _S.read(_parent,"lace")
	var _n_crown = _S.read(_parent,"crown")
	var _n_jet = _S.read(_parent,"jet")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_bubbles = _S.read(_parent,"bubbles")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_drops = _S.read(_parent,"drops")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ST = _S.read(_parent,"ST")
	var _n_pebble = _S.read(_parent,"pebble")
	var _n_mist = _S.read(_parent,"mist")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_u_b1 = (_n_t - _n_HIT)
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, 1])
	if _S.truth((_n_u_b1 > 0.2)):
		var _n_rx_b2 = (4 + (11 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_u_b1 - 0.2))/0.7),0.0,1.0)])))
		var _n_k_b3 = ((_S.MathFX.smooth(0.2,0.32,_n_u_b1) * (1 - _S.MathFX.smooth(0.5,2,_n_u_b1))) * 0.9)
		_S.call_value(_n_lace,[_n_p_b0, 0, 0, _n_rx_b2, ((_n_rx_b2 * _n_SY) + 0.5), _n_k_b3, _n_C, _n_t, _S.named_value(_n_o,"seed")])
	_S.call_value(_n_crown,[_n_p_b0, false])
	_S.call_value(_n_jet,[_n_p_b0])
	for _iter_0 in _S.array(_n_bubbles):
		var _n_b_b4 = _iter_0
		var _n_g_b5 = (float((_n_t - _S.named_value(_n_b_b4,"t0")))/0.2)
		if _S.truth((_n_g_b5 > 1)):
			continue
		var _n_r_b6 = (_S.named_value(_n_b_b4,"r") * _S.invoke(_n_ease,"outBack",[_n_g_b5]))
		var _n_x_b7 = _S.named_value(_n_b_b4,"x")
		var _n_y_b8 = (_S.named_value(_n_b_b4,"z") * _n_SY)
		if true:
			var _n_a_b9 = PI
			while _S.truth((_n_a_b9 <= (_n_TAU + 0.01))):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b7 + (cos(_n_a_b9) * _n_r_b6)), (_n_y_b8 + (sin(_n_a_b9) * _n_r_b6)), _S.index_value(_n_C,6)])
				_n_a_b9 += (float(0.5)/maxf(1,_n_r_b6))
		_S.invoke(_n_p_b0,"px",[(_n_x_b7 - (_n_r_b6 * 0.4)), (_n_y_b8 - (_n_r_b6 * 0.6)), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_x_b7, (_n_y_b8 - 1), 4, _S.index_value(_n_C,5), 0.25])
	for _iter_1 in _S.array(_n_plinks):
		var _n_q_b10 = _iter_1
		var _n_k_b11 = (float(_S.named_value(_n_q_b10,"age"))/0.14)
		if _S.truth((_n_k_b11 < 0.5)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b10,"x"), _S.named_value(_n_q_b10,"y"), _n_WHITE])
		if _S.truth((_S.named_value(_n_q_b10,"s") > 1)):
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b10,"x"), (_S.named_value(_n_q_b10,"y") - 1), _S.named_value(_n_q_b10,"x"), ((_S.named_value(_n_q_b10,"y") - 1) - (3 * (1 - _n_k_b11))), (_n_WHITE if _S.truth((_n_k_b11 < 0.4)) else _S.index_value(_n_C,6))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b10,"x"), _S.named_value(_n_q_b10,"y"), 4, _S.index_value(_n_C,5), (0.3 * (1 - _n_k_b11))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "front"])
	if _S.truth(((_n_u_b1 < 0.07) if _S.truth((_n_u_b1 >= 0)) else (_n_u_b1 >= 0))):
		_S.invoke(_n_p_b0,"ellipse",[0, 0, 10, 2.4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-3), (5 * (1 - (float(_n_u_b1)/0.07))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.5])
	if _S.truth(((_n_t < _n_HIT) if _S.truth(_S.named_value(_n_o,"stone")) else _S.named_value(_n_o,"stone"))):
		var _n_v_b12 = (float(_n_t)/_n_HIT)
		var _n_y_b13 = ((-70) + (70 * ((0.4 * _n_v_b12) + ((0.6 * _n_v_b12) * _n_v_b12))))
		_S.invoke(_n_p_b0,"line",[0, (_n_y_b13 - 12), 0, (_n_y_b13 - 3), _S.index_value(_n_ST,4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f15")])
		_S.call_value(_n_pebble,[_n_p_b0, 0, _n_y_b13, 2.6, _n_ST])
	_S.invoke(_n_mist,"draw",[_n_p_b0, _S.index_value(_n_C,5)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	if _S.truth((_n_u_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-2), 34, _S.index_value(_n_C,4), (0.2 * (1 - _S.MathFX.smooth(0,1.6,_n_u_b1)))])
		_S.invoke(_n_p_b0,"glow",[0, 2, 64, _S.index_value(_n_C,3), (0.16 * (1 - _S.MathFX.smooth(0.1,2.1,_n_u_b1)))])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.6)) else _S.index_value(_n_C,6))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_w_b0 = _S.arg(_args,0)
	return (_n_w_b0 * 0.8)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	return ((19 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_u_b0)/0.09),0.0,1.0)])) * (1 - _S.invoke(_n_ease,"inQuad",[clampf((float((_n_u_b0 - 0.12))/0.3),0.0,1.0)])))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	return (3 + (7.5 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_u_b0)/0.45),0.0,1.0)])))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_foot = _S.read(_parent,"foot")
	var _n_height = _S.read(_parent,"height")
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_S.call_value(_n_foot,[_n_u_b0]) + (_S.call_value(_n_height,[_n_u_b0]) * 0.42)) + (3 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_u_b0)/0.25),0.0,1.0)])))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_u_b0 = _S.arg(_args,0)
	return (26 * (_S.invoke(_n_ease,"outCubic",[clampf((float(_n_u_b0)/0.12),0.0,1.0)]) - _S.invoke(_n_ease,"inQuad",[clampf((float((_n_u_b0 - 0.15))/0.28),0.0,1.0)])))
	return null
