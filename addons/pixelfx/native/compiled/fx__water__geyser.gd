@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/geyser.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "lace", _S.import_value("fx/water/_lib.js", "lace"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Geyser"}, {"desc": "A pool heaves and burbles faster and faster, then blasts a white column of water skyward with a churning foam head; it rains back down in drops and steam, slumps and sputters out."}, {"tags": ["water", "geyser", "eruption", "steam", "column", "nature", "one-shot"]}, {"size": [184, 168]}, {"origin": [92, 146]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 100}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "G", 820)
	_S.define(_e, "ERUPT", 1.15)
	_S.define(_e, "FALL", 2.6)
	_S.define(_e, "GONE", 3.3)
	_S.define(_e, "SPURTS", [[0.46, 7], [0.72, 12], [0.92, 9], [1.04, 15], [_S.binary("+", _S.read(_e, "GONE"), 0.15), 15], [_S.binary("+", _S.read(_e, "GONE"), 0.55), 8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "column", _S.function_value(_e, "_f1"))
	_S.define(_e, "foamHead", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "HMAX", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "plinks", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "V0", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.read(_e, "HMAX"))]))
	_S.define(_e, "t", 0)
	_S.define(_e, "poolR", _S.function_value(_e, "_f5"))
	_S.define(_e, "poolK", _S.function_value(_e, "_f6"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f8"))
	_S.define(_e, "head", _S.function_value(_e, "_f9"))
	_S.define(_e, "spurt", _S.function_value(_e, "_f10"))
	_S.define(_e, "done", _S.construct(_S.read(_e, "Set"), []))
	_S.define(_e, "once", _S.function_value(_e, "_f11"))
	_S.define(_e, "emit", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_thin_b2 = _S.arg(_args,2)
	if _S.truth((_n_H_b1 < 1)):
		return null
	var _n_tau_b3 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")
	_S.invoke(_n_p_b0,"shade",[(-22), ((-_n_H_b1) - 2), 22, 0, _S.function_value(_S.capture(_parent,{"H":_n_H_b1,"thin":_n_thin_b2,"tau":_n_tau_b3,"this":_this}),"_f3")])
	_S.invoke(_n_p_b0,"glowLine",[0, 0, 0, (-_n_H_b1), (16 + (8 * _n_thin_b2)), _S.index_value(_n_C,5), (0.12 * _n_thin_b2)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_V0 = _S.read(_parent,"V0")
	var _n_G = _S.read(_parent,"G")
	var _n_HMAX = _S.read(_parent,"HMAX")
	var _n_h_b0 = _S.arg(_args,0)
	return (float((_n_V0 - sqrt(maxf(0,((_n_V0 * _n_V0) - ((2 * _n_G) * minf(_n_h_b0,(_n_HMAX * 0.96))))))))/_n_G)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_thin = _S.read(_parent,"thin")
	var _n_tau = _S.read(_parent,"tau")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_h_b3 = (-_n_y_b1)
	var _n_v_b4 = (float(_n_h_b3)/_n_H)
	var _n_sway_b5 = ((_S.MathFX.noise(((_n_t * 1.6) + (_n_h_b3 * 0.025)),(_n_S + 5)) * 2.5) * _n_v_b4)
	var _n_rag_b6 = (_S.NoiseKernels.noise2(((_n_h_b3 * 0.2) - (_n_t * 11)),(3 if _S.truth((_n_x_b0 < _n_sway_b5)) else 7),(_n_S + 6)) * (0.5 + (1.8 * _n_v_b4)))
	var _n_w_b7 = (((3.6 + (7.5 * pow(_n_v_b4,1.8))) * _n_thin) + _n_rag_b6)
	var _n_q_b8 = (float((_n_x_b0 - _n_sway_b5))/maxf(1,_n_w_b7))
	var _n_aq_b9 = absf(_n_q_b8)
	if _S.truth((_n_aq_b9 > 1)):
		return null
	var _n_X_b10 = floori(_n_x_b0)
	var _n_streak_b11 = _S.NoiseKernels.noise2(((_n_X_b10 * 1.618) + 0.3),((_S.call_value(_n_tau,[_n_h_b3]) - _n_t) * 14),_n_S)
	var _n_body_b12 = _S.NoiseKernels.noise2((floori((float((_n_x_b0 + 40))/2)) * 2.3),((_S.call_value(_n_tau,[_n_h_b3]) - _n_t) * 5),(_n_S + 1))
	var _n_lvl_b13 = (0 if _S.truth((_n_aq_b9 < 0.42)) else (1 if _S.truth((_n_aq_b9 < 0.7)) else (2 if _S.truth((_n_aq_b9 < 0.9)) else 3)))
	if _S.truth((_n_q_b8 > 0.38)):
		_n_lvl_b13 += 1.0
	if _S.truth((_n_streak_b11 > 0.28)):
		_n_lvl_b13 -= 1.0
	if _S.truth((_n_body_b12 < (-0.4))):
		_n_lvl_b13 += 1.0
	_S.set_prop(_n_out_b2,"c",_S.index_value([_n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,5), _S.index_value(_n_C,4), _S.index_value(_n_C,3)],clampf(_n_lvl_b13,0,4)),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_billow = _S.read(_parent,"billow")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_back_b3 = _S.arg(_args,3)
	if _S.truth(((_n_k_b2 <= 0.01) if _S.truth((_n_k_b2 <= 0.01)) else (_n_H_b1 < 4))):
		return null
	if _S.truth(_n_back_b3):
		if true:
			var _n_i_b4 = 0
			while _S.truth((_n_i_b4 < 16)):
				var _n_side_b5 = (1 if _S.truth(fmod(_n_i_b4,2)) else (-1))
				var _n_x0_b6 = ((_n_side_b5 * (5 + (9 * _S.MathFX.rand([_n_i_b4,(_n_S + 20)])))) * _n_k_b2)
				var _n_len_b7 = ((14 + (26 * _S.MathFX.rand([_n_i_b4,(_n_S + 21)]))) * _n_k_b2)
				var _n_speed_b8 = (70 + (50 * _S.MathFX.rand([_n_i_b4,(_n_S + 22)])))
				if true:
					var _n_j_b9 = 0
					while _S.truth((_n_j_b9 < 3)):
						var _n_f_b10 = fmod((((float((_n_t * _n_speed_b8))/_n_len_b7) + (float(_n_j_b9)/3)) + _S.MathFX.rand([_n_i_b4,(_n_S + 23)])),1)
						var _n_y0_b11 = (((-_n_H_b1) + 2) + (_n_f_b10 * _n_len_b7))
						var _n_x_b12 = (_n_x0_b6 + (((_n_side_b5 * _n_f_b10) * _n_f_b10) * 6))
						var _n_L_b13 = (1 + (((4 * _n_f_b10) * (1 - _n_f_b10)) * 2))
						if _S.truth((_n_f_b10 < 0.85)):
							_S.invoke(_n_p_b0,"line",[_n_x_b12, _n_y0_b11, (_n_x_b12 + (_n_side_b5 * 0.6)), (_n_y0_b11 + _n_L_b13), (_S.index_value(_n_C,6) if _S.truth((_n_f_b10 < 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_f_b10 < 0.7)) else _S.index_value(_n_C,4)))])
						_n_j_b9 += 1.0
				_n_i_b4 += 1.0
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < 12)):
			var _n_a_b15 = (((float(_n_i_b14)/12) * _n_TAU) + (_n_t * (1.3 if _S.truth(fmod(_n_i_b14,2)) else (-1.1))))
			var _n_z_b16 = sin(_n_a_b15)
			if _S.truth(_S.binary("!==",(_n_z_b16 < 0),_n_back_b3)):
				_n_i_b14 += 1.0
				continue
			var _n_rho_b17 = ((3 + (7 * _S.MathFX.rand([_n_i_b14,_n_S]))) * _n_k_b2)
			var _n_x_b18 = (((cos(_n_a_b15) * _n_rho_b17) * 1.25) + (_S.MathFX.noise(((_n_t * 3) + _n_i_b14),(_n_S + 8)) * 2.5))
			var _n_y_b19 = (((((-_n_H_b1) + ((_n_z_b16 * _n_rho_b17) * 0.45)) + ((float(_n_rho_b17)/10) * 4)) - (4 * (1 - (float(_n_rho_b17)/(10 * _n_k_b2))))) + (_S.MathFX.noise((((_n_t * 3) + _n_i_b14) + 50),(_n_S + 9)) * 2.5))
			var _n_r_b20 = (((2 + (2.6 * _S.MathFX.rand([_n_i_b14,(_n_S + 2)]))) + (0.7 * sin(((_n_t * 7) + _n_i_b14)))) * _n_k_b2)
			if _S.truth(_n_back_b3):
				_S.call_value(_n_billow,[_n_p_b0, _n_x_b18, _n_y_b19, _n_r_b20, [_S.index_value(_n_C,0), _S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,5)]])
			else:
				_S.invoke(_n_p_b0,"circle",[(_n_x_b18 + (_n_r_b20 * 0.15)), (_n_y_b19 + (_n_r_b20 * 0.25)), _n_r_b20, _S.index_value(_n_C,4)])
				_S.invoke(_n_p_b0,"circle",[_n_x_b18, _n_y_b19, (_n_r_b20 * 0.82), (_S.index_value(_n_C,5) if _S.truth((_n_rho_b17 > (6 * _n_k_b2))) else _S.index_value(_n_C,6))])
				_S.invoke(_n_p_b0,"circle",[(_n_x_b18 - (_n_r_b20 * 0.25)), (_n_y_b19 - (_n_r_b20 * 0.3)), (_n_r_b20 * 0.5), _n_WHITE])
			_n_i_b14 += 1.0
	if _S.truth(not _S.truth(_n_back_b3)):
		_S.invoke(_n_p_b0,"glow",[0, ((-_n_H_b1) - 2), 38, _S.index_value(_n_C,5), (0.34 * _n_k_b2)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_tt_b0 = _S.arg(_args,0)
	return (((12 + (7 * _S.MathFX.smooth(0,1,_n_tt_b0))) + (15 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_tt_b0 - _n_ERUPT))/1.2),0.0,1.0)]))) * (1 - (0.25 * _S.MathFX.smooth(_n_GONE,4.6,_n_tt_b0))))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.MathFX.smooth(0,0.2,_n_tt_b0) * (1 - _S.MathFX.smooth(4,4.85,_n_tt_b0)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_poolR = _S.read(_parent,"poolR")
	var _n_t = _S.read(_parent,"t")
	var _n_rings = _S.read(_parent,"rings")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_SY = _S.read(_parent,"SY")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_drops = _S.read(_parent,"drops")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_inPool_b1 = (_S.Bridge.hypot([_S.named_value(_n_d_b0,"x"), _S.named_value(_n_d_b0,"z")]) < _S.call_value(_n_poolR,[_n_t]))
	_S.invoke(_n_rings,"add",[_S.named_value(_n_d_b0,"x"), _S.named_value(_n_d_b0,"z"), 0.6, ((2.5 if _S.truth(_n_inPool_b1) else 1.5) + (_S.named_value(_n_d_b0,"s") * 1.6)), (0.32 + (_S.named_value(_n_d_b0,"s") * 0.1)), {"n":1,"k":(0.95 if _S.truth(_n_inPool_b1) else 0.7),"hot":0.05}])
	_S.invoke(_n_plinks,"push",[{"x":_S.named_value(_n_d_b0,"x"),"y":(_S.named_value(_n_d_b0,"z") * _n_SY),"s":_S.named_value(_n_d_b0,"s"),"age":0}])
	if _S.truth((not _S.truth(_S.named_value(_n_d_b0,"small")) if _S.truth((_S.named_value(_n_d_b0,"s") > 1)) else (_S.named_value(_n_d_b0,"s") > 1))):
		if true:
			var _n_i_b2 = 0
			while _S.truth((_n_i_b2 < 2)):
				var _n_a_b3 = _S.invoke(_n_R,"range",[0, _n_TAU])
				var _n_v_b4 = _S.invoke(_n_R,"range",[8, 28])
				_S.invoke(_n_drops,"add",[{"x":_S.named_value(_n_d_b0,"x"),"z":_S.named_value(_n_d_b0,"z"),"h":0.5,"vx":(cos(_n_a_b3) * _n_v_b4),"vz":(sin(_n_a_b3) * _n_v_b4),"vh":_S.invoke(_n_R,"range",[45, 95]),"s":1,"small":true,"life":1}])
				_n_i_b2 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_HMAX = _S.read(_parent,"HMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_S = _S.read(_parent,"S")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_tt_b0 = _S.arg(_args,0)
	if _S.truth(((_n_tt_b0 < _n_ERUPT) if _S.truth((_n_tt_b0 < _n_ERUPT)) else (_n_tt_b0 > _n_GONE))):
		return 0
	return (((_n_HMAX * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_tt_b0 - _n_ERUPT))/0.3),0.0,1.0)])) * (0.93 + (0.07 * _S.MathFX.noise((_n_tt_b0 * 2.2),_n_S)))) * (1 - _S.invoke(_n_ease,"inQuad",[clampf((float((_n_tt_b0 - _n_FALL))/(_n_GONE - _n_FALL)),0.0,1.0)])))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.MathFX.smooth((_n_ERUPT + 0.08),(_n_ERUPT + 0.3),_n_tt_b0) * (1 - _S.MathFX.smooth((_n_FALL + 0.1),(_n_FALL + 0.45),_n_tt_b0)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_SPURTS = _S.read(_parent,"SPURTS")
	var _n_tt_b0 = _S.arg(_args,0)
	var _n_h_b1 = 0
	for _iter_0 in _S.array(_n_SPURTS):
		var _tuple_1 = _iter_0
		var _n_s0_b2 = _S.prop(_tuple_1,0)
		var _n_hs_b3 = _S.prop(_tuple_1,1)
		_n_h_b1 = maxf(_n_h_b1,(_n_hs_b3 * sin((PI * clampf((float((_n_tt_b0 - _n_s0_b2))/0.2),0.0,1.0)))))
	return _n_h_b1
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_key_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	return _S.logical("&&",_S.logical("&&",not _S.truth(_S.invoke(_n_done,"has",[_n_key_b0])),func():return (_n_t >= _n_at_b1)),func():return _S.invoke(_n_done,"add",[_n_key_b0]))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_dt_b1 = _S.arg(_args,1)
	return _S.invoke(_n_R,"chance",[minf(1,(_n_rate_b0 * _n_dt_b1))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "H", _S.call_value(_S.read(_e, "top"), [_S.read(_e, "t")]))
	_S.define(_e, "hk", _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "ERUPT")))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.call_value(_S.read(_e, "emit"), [_S.binary("+", 1.5, _S.binary("*", _S.binary("*", 9, _S.read(_e, "k")), _S.read(_e, "k"))), _S.read(_e, "dt")]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "r", _S.invoke(_S.read(_v13, "R"), "range", [0, 7]))
		_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "r")))
		_S.define(_v13, "z", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "r")))
		_S.invoke(_S.read(_v13, "pops"), "push", [_S.merge([{"x": _S.read(_v13, "x")}, {"y": _S.binary("-", _S.binary("*", _S.read(_v13, "z"), _S.read(_v13, "SY")), _S.invoke(_S.read(_v13, "R"), "range", [1, 3]))}, {"age": 0}, {"r": _S.invoke(_S.read(_v13, "R"), "range", [1, 2])}])])
		_S.invoke(_S.read(_v13, "rings"), "add", [_S.read(_v13, "x"), _S.read(_v13, "z"), 1, _S.invoke(_S.read(_v13, "R"), "range", [5, 9]), 0.55, _S.merge([{"n": 1}, {"k": 0.85}])])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.invoke(_S.read(_v14, "R"), "int", [1, 3]))):
			_S.invoke(_S.read(_v14, "drops"), "add", [_S.merge([{"x": _S.read(_v14, "x")}, {"z": _S.read(_v14, "z")}, {"h": 2}, {"vx": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 25), 25])}, {"vz": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 15), 15])}, {"vh": _S.invoke(_S.read(_v14, "R"), "range", [50, 120])}, {"s": 1}, {"small": true}, {"life": 1}])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.call_value(_S.read(_e, "emit"), [_S.binary("+", 3, _S.binary("*", 7, _S.read(_e, "k"))), _S.read(_e, "dt")]))):
		_S.invoke(_S.read(_e, "mist"), "add", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [1, 5])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [6, 18])), 2, _S.invoke(_S.read(_e, "R"), "range", [5, 9]), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5]), _S.prop(_S.read(_e, "C"), 6), 0.22])
	for _v15 in _S.array(_S.read(_e, "SPURTS")):
		var _v16 = _S.scope(_e)
		var _v17 = _v15
		_S.define(_v16, "s0", _S.prop(_v17, 0))
		_S.define(_v16, "hs", _S.prop(_v17, 1))
		if _S.truth(_S.call_value(_S.read(_v16, "once"), [_S.binary("+", "spurt", _S.read(_v16, "s0")), _S.binary("+", _S.read(_v16, "s0"), 0.08)])):
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.binary("+", 3, _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("/", _S.read(_v18, "hs"), 4)])))):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "a", _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")]))
				_S.define(_v19, "v", _S.invoke(_S.read(_v19, "R"), "range", [10, 40]))
				_S.invoke(_S.read(_v19, "drops"), "add", [_S.merge([{"x": 0}, {"z": 0}, {"h": _S.binary("*", _S.read(_v19, "hs"), 0.8)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "v"))}, {"vh": _S.invoke(_S.read(_v19, "R"), "range", [20, 90])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.3])) else 1)}])])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["erupt", _S.read(_e, "ERUPT")])):
		var _v20 = _S.scope(_e)
		_S.invoke(_S.read(_v20, "lights"), "add", [0, _S.unary("-", 26), 64, _S.prop(_S.read(_v20, "C"), 5), 0.85, 0.6])
		_S.invoke(_S.read(_v20, "lights"), "add", [0, _S.unary("-", 4), 28, _S.read(_v20, "WHITE"), 0.75, 0.1])
		_S.invoke(_S.read(_v20, "rings"), "add", [0, 0, 6, 40, 1.2, _S.merge([{"n": 2}, {"gap": 3}, {"k": 1.2}, {"hot": 0.12}, {"glint": 1}])])
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 44)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "a", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
			_S.define(_v22, "v", _S.invoke(_S.read(_v22, "R"), "range", [30, 120]))
			_S.invoke(_S.read(_v22, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), 3)}, {"z": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), 3)}, {"h": _S.invoke(_S.read(_v22, "R"), "range", [2, 10])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "v"))}, {"vh": _S.invoke(_S.read(_v22, "R"), "range", [180, 400])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.15])) else (2 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v22, "R"), "range", [0, 0.12])}])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v23 = _S.scope(_v20)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 12)):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "s", (1 if _S.truth(_S.binary("%", _S.read(_v24, "i"), 2)) else _S.unary("-", 1)))
			_S.invoke(_S.read(_v24, "mist"), "add", [_S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [3, 9])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [4, 18])), 3, _S.invoke(_S.read(_v24, "R"), "range", [9, 14]), _S.invoke(_S.read(_v24, "R"), "range", [1.2, 1.9]), (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.read(_v24, "WHITE")), 0.3, _S.invoke(_S.read(_v24, "R"), "range", [0, 0.15])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		var _v25 = _S.scope(_v20)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 14)):
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "STAR"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 16), 16]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [8, 80])), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", 6), _S.invoke(_S.read(_v25, "R"), "range", [0.3, 0.7]), (_S.read(_v25, "WHITE") if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.5])) else _S.prop(_S.read(_v25, "C"), 6)), _S.invoke(_S.read(_v25, "R"), "range", [1, 2.6]), _S.invoke(_S.read(_v25, "R"), "range", [0.05, 0.5])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "hk"), 0)):
		var _v26 = _S.scope(_e)
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 60, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "v", _S.invoke(_S.read(_v27, "R"), "range", [10, 60]))
			_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 9), 9])}, {"z": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 4), 4])}, {"h": _S.binary("+", _S.read(_v27, "H"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 3]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 40), 60])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.08])) else (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1))}])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 9, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "mist"), "add", [_S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", _S.read(_v26, "H")), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 2])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [14, 34])), 3, _S.invoke(_S.read(_v26, "R"), "range", [8, 13]), _S.invoke(_S.read(_v26, "R"), "range", [0.9, 1.4]), (_S.prop(_S.read(_v26, "C"), 6) if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.6])) else _S.read(_v26, "WHITE")), 0.2])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 5, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "mist"), "add", [_S.binary("*", _S.invoke(_S.read(_v26, "R"), "sign", []), _S.invoke(_S.read(_v26, "R"), "range", [3, 9])), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [1, 6])), _S.binary("*", _S.invoke(_S.read(_v26, "R"), "sign", []), _S.invoke(_S.read(_v26, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [2, 10])), 3, _S.invoke(_S.read(_v26, "R"), "range", [8, 12]), _S.invoke(_S.read(_v26, "R"), "range", [1, 1.6]), _S.prop(_S.read(_v26, "C"), 6), 0.22])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 40, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "s", _S.invoke(_S.read(_v28, "R"), "sign", []))
			_S.define(_v28, "hh", _S.invoke(_S.read(_v28, "R"), "range", [8, _S.binary("*", _S.read(_v28, "H"), 0.95)]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "FLAKE"), _S.binary("*", _S.read(_v28, "s"), _S.binary("+", 3, _S.binary("*", 6, _S.invoke(_S.read(_v28, "Math"), "pow", [_S.binary("/", _S.read(_v28, "hh"), _S.read(_v28, "H")), 1.8])))), _S.unary("-", _S.read(_v28, "hh")), _S.binary("*", _S.read(_v28, "s"), _S.invoke(_S.read(_v28, "R"), "range", [10, 45])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 20), 10]), _S.invoke(_S.read(_v28, "R"), "range", [0.6, 1.2]), (_S.read(_v28, "WHITE") if _S.truth(_S.invoke(_S.read(_v28, "R"), "chance", [0.5])) else _S.prop(_S.read(_v28, "C"), 6)), _S.invoke(_S.read(_v28, "R"), "range", [0.6, 1.3])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 4, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "rings"), "add", [_S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 2), 2]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 2), 2]), 4, _S.binary("*", _S.call_value(_S.read(_v26, "poolR"), [_S.read(_v26, "t")]), _S.invoke(_S.read(_v26, "R"), "range", [0.7, 1])), 0.9, _S.merge([{"n": 1}, {"k": 0.8}])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 7, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STAR"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [10, _S.binary("+", _S.read(_v26, "H"), 8)])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 4), _S.invoke(_S.read(_v26, "R"), "range", [0.25, 0.55]), (_S.read(_v26, "WHITE") if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.4])) else _S.prop(_S.read(_v26, "C"), 6)), _S.invoke(_S.read(_v26, "R"), "range", [0.8, 2.2]), 0])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["collapse", _S.binary("+", _S.read(_e, "FALL"), 0.12)])):
		var _v29 = _S.scope(_e)
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "i"), 40)):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.invoke(_S.read(_v31, "R"), "range", [0, _S.read(_v31, "TAU")]))
			_S.define(_v31, "v", _S.invoke(_S.read(_v31, "R"), "range", [15, 80]))
			_S.invoke(_S.read(_v31, "drops"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 6])}, {"z": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 3), 3])}, {"h": _S.binary("+", _S.call_value(_S.read(_v31, "top"), [_S.read(_v31, "t")]), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 8), 4]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "v"))}, {"vh": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 40), 60])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.12])) else (2 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v31, "R"), "range", [0, 0.25])}])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "i", 1, "+=", true)
		var _v32 = _S.scope(_v29)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 6)):
			_S.invoke(_S.read(_v32, "mist"), "add", [_S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", _S.call_value(_S.read(_v32, "top"), [_S.read(_v32, "t")])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [10, 26])), 4, _S.invoke(_S.read(_v32, "R"), "range", [9, 13]), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_v32, "C"), 6), 0.18])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", _S.binary("-", _S.prop(_S.read(_v33, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v33, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v33, "pops"), _S.read(_v33, "i")), "age", _S.read(_v33, "dt"), "+=", false), 0.12)):
			_S.invoke(_S.read(_v33, "pops"), "splice", [_S.read(_v33, "i"), 1])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "-=", true)
	var _v34 = _S.scope(_e)
	_S.define(_v34, "i", _S.binary("-", _S.prop(_S.read(_v34, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v34, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v34, "plinks"), _S.read(_v34, "i")), "age", _S.read(_v34, "dt"), "+=", false), 0.14)):
			_S.invoke(_S.read(_v34, "plinks"), "splice", [_S.read(_v34, "i"), 1])
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_poolR = _S.read(_parent,"poolR")
	var _n_t = _S.read(_parent,"t")
	var _n_poolK = _S.read(_parent,"poolK")
	var _n_SY = _S.read(_parent,"SY")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ring = _S.read(_parent,"ring")
	var _n_foamHead = _S.read(_parent,"foamHead")
	var _n_top = _S.read(_parent,"top")
	var _n_head = _S.read(_parent,"head")
	var _n_drops = _S.read(_parent,"drops")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pr_b1 = _S.call_value(_n_poolR,[_n_t])
	var _n_pk_b2 = _S.call_value(_n_poolK,[_n_t])
	if _S.truth((_n_pk_b2 > 0)):
		_S.invoke(_n_p_b0,"each",[(-_n_pr_b1), ((-_n_pr_b1) * _n_SY), _n_pr_b1, (_n_pr_b1 * _n_SY), _S.function_value(_S.capture(_parent,{"pr":_n_pr_b1,"p":_n_p_b0,"pk":_n_pk_b2,"this":_this}),"_f15")])
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, (-1)])
	var _n_u_b3 = (float((_n_t - _n_ERUPT))/0.4)
	if _S.truth(((_n_u_b3 < 1) if _S.truth((_n_u_b3 > 0)) else (_n_u_b3 > 0))):
		_S.call_value(_n_ring,[_n_p_b0, 0, 0.5, (6 + (42 * _S.invoke(_n_ease,"outCubic",[_n_u_b3]))), _n_SY, (1.5 * (1 - _n_u_b3)), _n_C, {"n":3,"gap":(1.6 + (2 * _n_u_b3)),"half":(-1),"hot":(_n_u_b3 < 0.3),"seed":9}])
	_S.call_value(_n_foamHead,[_n_p_b0, _S.call_value(_n_top,[_n_t]), _S.call_value(_n_head,[_n_t]), true])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "back"])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_pr = _S.read(_parent,"pr")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_pk = _S.read(_parent,"pk")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_d_b4 = (pow((float(_n_x_b0)/_n_pr),2) + pow((float(_n_y_b1)/(_n_pr * _n_SY)),2))
	if _S.truth((_n_d_b4 > 1)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,2) if _S.truth((_n_d_b4 < 0.15)) else _S.index_value(_n_C,1)), ((0.6 * _n_pk) * minf(1,((1 - _n_d_b4) * 4)))])
	if _S.truth(((_n_d_b4 < 0.95) if _S.truth(((_n_d_b4 > 0.78) if _S.truth((_n_y_b1 < 0)) else (_n_y_b1 < 0))) else ((_n_d_b4 > 0.78) if _S.truth((_n_y_b1 < 0)) else (_n_y_b1 < 0)))):
		_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,4), (0.7 * _n_pk)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_t = _S.read(_parent,"t")
	var _n_head = _S.read(_parent,"head")
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_S = _S.read(_parent,"S")
	var _n_lace = _S.read(_parent,"lace")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_spurt = _S.read(_parent,"spurt")
	var _n_column = _S.read(_parent,"column")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_billow = _S.read(_parent,"billow")
	var _n_foamHead = _S.read(_parent,"foamHead")
	var _n_pops = _S.read(_parent,"pops")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_drops = _S.read(_parent,"drops")
	var _n_ps = _S.read(_parent,"ps")
	var _n_mist = _S.read(_parent,"mist")
	var _n_lights = _S.read(_parent,"lights")
	var _n_poolK = _S.read(_parent,"poolK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.call_value(_n_top,[_n_t])
	var _n_hk_b2 = _S.call_value(_n_head,[_n_t])
	var _n_k_b3 = clampf((float(_n_t)/_n_ERUPT),0.0,1.0)
	var _n_thin_b4 = (_S.MathFX.smooth(_n_ERUPT,(_n_ERUPT + 0.12),_n_t) * (1 - (0.55 * _S.MathFX.smooth(_n_FALL,_n_GONE,_n_t))))
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, 1])
	var _n_u_b5 = (float((_n_t - _n_ERUPT))/0.4)
	if _S.truth(((_n_u_b5 < 1) if _S.truth((_n_u_b5 > 0)) else (_n_u_b5 > 0))):
		_S.call_value(_n_ring,[_n_p_b0, 0, 0.5, (6 + (42 * _S.invoke(_n_ease,"outCubic",[_n_u_b5]))), _n_SY, (1.5 * (1 - _n_u_b5)), _n_C, {"n":3,"gap":(1.6 + (2 * _n_u_b5)),"half":1,"hot":(_n_u_b5 < 0.3),"seed":9}])
	var _n_fk_b6 = (_S.MathFX.smooth(_n_ERUPT,(_n_ERUPT + 0.3),_n_t) * (1 - _S.MathFX.smooth((_n_GONE - 0.3),4.4,_n_t)))
	if _S.truth((_n_fk_b6 > 0)):
		_S.call_value(_n_lace,[_n_p_b0, 0, 0, (8 + (10 * _n_fk_b6)), (((8 + (10 * _n_fk_b6)) * _n_SY) + 0.5), _n_fk_b6, _n_C, _n_t, _n_S])
	if _S.truth((_n_t < (_n_ERUPT + 0.05))):
		var _n_beat_b9 = pow(maxf(0,sin((_n_t * (8 + ((18 * _n_k_b3) * _n_k_b3))))),3)
		var _n_rd_b10 = ((4 + (3.5 * _n_k_b3)) + (1.5 * _n_beat_b9))
		var _n_hd_b11 = ((1.5 + (3 * _n_k_b3)) + (3 * _n_beat_b9))
		_S.invoke(_n_p_b0,"shade",[((-_n_rd_b10) - 1), ((-_n_hd_b11) - 1), (_n_rd_b10 + 1), 0.5, _S.function_value(_S.capture(_parent,{"rd":_n_rd_b10,"hd":_n_hd_b11,"this":_this}),"_f17")])
		_S.invoke(_n_p_b0,"px",[((-_n_rd_b10) * 0.35), ((-_n_hd_b11) * 0.6), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, (-5), ((16 + (16 * _n_k_b3)) + (8 * _n_beat_b9)), _S.index_value(_n_C,5), ((0.06 + (0.12 * _n_k_b3)) + (0.12 * _n_beat_b9))])
	var _n_sp_b7 = _S.call_value(_n_spurt,[_n_t])
	if _S.truth(((_n_H_b1 < 1) if _S.truth((_n_sp_b7 > 1)) else (_n_sp_b7 > 1))):
		_S.invoke(_n_p_b0,"shade",[(-2), ((-_n_sp_b7) - 1), 2, 0, _S.function_value(_S.capture(_parent,{"sp":_n_sp_b7,"this":_this}),"_f18")])
		_S.invoke(_n_p_b0,"circle",[0, (-_n_sp_b7), 1.3, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"px",[0, ((-_n_sp_b7) - 1), _n_WHITE])
		_S.invoke(_n_p_b0,"glowLine",[0, 0, 0, (-_n_sp_b7), 8, _S.index_value(_n_C,5), 0.3])
	_S.call_value(_n_column,[_n_p_b0, _n_H_b1, _n_thin_b4])
	if _S.truth(((_n_hk_b2 > 0) if _S.truth((_n_hk_b2 > 0)) else ((_n_t < _n_GONE) if _S.truth((_n_H_b1 > 1)) else (_n_H_b1 > 1)))):
		if true:
			var _n_i_b12 = 0
			while _S.truth((_n_i_b12 < 7)):
				var _n_a_b13 = (((float(_n_i_b12)/7) * _n_TAU) + (_n_t * 2.1))
				var _n_r_b14 = (4 + (2 * sin(((_n_t * 5) + (_n_i_b12 * 1.7)))))
				var _n_x_b15 = ((cos(_n_a_b13) * _n_r_b14) * 1.3)
				var _n_y_b16 = (((sin(_n_a_b13) * _n_r_b14) * _n_SY) - 2)
				_S.call_value(_n_billow,[_n_p_b0, _n_x_b15, _n_y_b16, ((1.6 + (1.2 * _S.MathFX.rand([_n_i_b12,(_n_S + 4)]))) * maxf(_n_hk_b2,(_n_thin_b4 * 0.6))), _n_C])
				_n_i_b12 += 1.0
	_S.call_value(_n_foamHead,[_n_p_b0, _n_H_b1, _n_hk_b2, false])
	for _iter_0 in _S.array(_n_pops):
		var _n_q_b17 = _iter_0
		var _n_g_b18 = (float(_S.named_value(_n_q_b17,"age"))/0.12)
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0.7, (-0.7)], [(-0.7), (-0.7)], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b19 = _S.prop(_tuple_2,0)
			var _n_dy_b20 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_q_b17,"x") + (_n_dx_b19 * (_S.named_value(_n_q_b17,"r") + (3 * _n_g_b18)))), (_S.named_value(_n_q_b17,"y") + (_n_dy_b20 * (_S.named_value(_n_q_b17,"r") + (3 * _n_g_b18)))), _S.index_value(_n_C,6), (1 - _n_g_b18)])
	for _iter_3 in _S.array(_n_plinks):
		var _n_q_b21 = _iter_3
		var _n_g_b22 = (float(_S.named_value(_n_q_b21,"age"))/0.14)
		if _S.truth((_n_g_b22 < 0.5)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b21,"x"), _S.named_value(_n_q_b21,"y"), _n_WHITE])
		if _S.truth((_S.named_value(_n_q_b21,"s") > 1)):
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b21,"x"), (_S.named_value(_n_q_b21,"y") - 1), _S.named_value(_n_q_b21,"x"), ((_S.named_value(_n_q_b21,"y") - 1) - (3 * (1 - _n_g_b22))), (_n_WHITE if _S.truth((_n_g_b22 < 0.4)) else _S.index_value(_n_C,6))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b21,"x"), _S.named_value(_n_q_b21,"y"), 4, _S.index_value(_n_C,5), (0.25 * (1 - _n_g_b22))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "front"])
	var _n_f_b8 = (float((_n_t - _n_ERUPT))/0.07)
	if _S.truth(((_n_f_b8 < 1) if _S.truth((_n_f_b8 >= 0)) else (_n_f_b8 >= 0))):
		_S.invoke(_n_p_b0,"circle",[0, (-4), (7 * (1 - (_n_f_b8 * 0.4))), _n_WHITE])
		_S.invoke(_n_p_b0,"ellipse",[0, 0, 12, 2.6, _S.function_value(_S.capture(_parent,{"this":_this}),"_f19")])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_mist,"draw",[_n_p_b0, _S.index_value(_n_C,5)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	if _S.truth((_n_H_b1 > 1)):
		_S.invoke(_n_p_b0,"glowLine",[0, 0, 0, (-_n_H_b1), 26, _S.index_value(_n_C,4), (0.2 * _n_thin_b4)])
	_S.invoke(_n_p_b0,"glow",[0, (-2), 46, _S.index_value(_n_C,4), (0.24 * maxf(_n_hk_b2,((0.3 * _n_k_b3) * (1 if _S.truth((_n_t < _n_ERUPT)) else 0))))])
	_S.invoke(_n_p_b0,"glow",[0, 2, 60, _S.index_value(_n_C,3), (0.12 * _S.call_value(_n_poolK,[_n_t]))])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_rd = _S.read(_parent,"rd")
	var _n_hd = _S.read(_parent,"hd")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float(_n_x_b0)/_n_rd)
	var _n_dy_b4 = (float(_n_y_b1)/_n_hd)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth(((_n_d_b5 > 1) if _S.truth((_n_d_b5 > 1)) else (_n_y_b1 > 0.5))):
		return null
	var _n_lit_b6 = (((-_n_dx_b3) * 0.7) - (_n_dy_b4 * 0.7))
	var _n_rim_b7 = (_n_d_b5 > 0.68)
	_S.set_prop(_n_out_b2,"c",((_n_WHITE if _S.truth((_n_lit_b6 > 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_n_lit_b6 > (-0.15))) else _S.index_value(_n_C,4))) if _S.truth(_n_rim_b7) else (_S.index_value(_n_C,6) if _S.truth((_n_lit_b6 > 0.55)) else (_S.index_value(_n_C,5) if _S.truth((_n_lit_b6 > 0.12)) else (_S.index_value(_n_C,4) if _S.truth((_n_lit_b6 > (-0.3))) else _S.index_value(_n_C,3))))),"=")
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_q_b3 = (float(_n_x_b0)/(1 + (0.8 * (1 + (float(_n_y_b1)/_n_sp)))))
	if _S.truth((absf(_n_q_b3) > 1)):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_q_b3 < (-0.3))) else (_n_WHITE if _S.truth((_n_q_b3 < 0.35)) else _S.index_value(_n_C,5))),"=")
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.6)) else _S.index_value(_n_C,6))
	return null
