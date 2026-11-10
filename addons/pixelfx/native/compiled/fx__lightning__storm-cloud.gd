@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/storm-cloud.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f2":"sky_storm_cloud","_f3":"sky_storm_scud"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "billows", _S.function_value(_e, "_f0"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f2"))
	_S.define(_e, "scud", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Storm cloud"}, {"desc": "A storm cloud boils overhead, billows lit from inside by flickering discharges, ragged scud under its flat dark base; rain slants down and once a loop a bolt cracks to the floor."}, {"tags": ["lightning", "storm", "weather", "cloud", "rain", "ambient", "loop"]}, {"size": [168, 176]}, {"origin": [84, 164]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"cloud": ["#09070f", "#120f1e", "#1b182e", "#252640", "#323758", "#464d78", "#646b9c"]}, {"rain": ["#2b3250", "#46527a", "#6d7cab", "#a5b5e0"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 90)
	_S.define(_e, "P", 3)
	_S.define(_e, "BASE", _S.unary("-", 100))
	_S.define(_e, "TOP", _S.unary("-", 156))
	_S.define(_e, "TH", 0.35)
	_S.define(_e, "VIS", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "TH")]))]))
	_S.define(_e, "BILLOWS", [[_S.unary("-", 6), _S.unary("-", 132), 17], [18, _S.unary("-", 127), 14], [_S.unary("-", 28), _S.unary("-", 122), 12], [38, _S.unary("-", 118), 10], [0, _S.unary("-", 142), 12], [14, _S.unary("-", 149), 19, 0.38], [40, _S.unary("-", 148), 14, 0.34], [_S.unary("-", 48), _S.unary("-", 113), 10], [55, _S.unary("-", 110), 9], [_S.unary("-", 17), _S.unary("-", 115), 13], [22, _S.unary("-", 113), 12], [_S.unary("-", 42), _S.unary("-", 104), 11], [_S.unary("-", 10), _S.unary("-", 104), 12], [20, _S.unary("-", 104), 11], [48, _S.unary("-", 103), 9], [_S.unary("-", 63), _S.unary("-", 104), 7], [66, _S.unary("-", 103), 6]])
	_S.define(_e, "FLASHES", [[7, 2, 0.8], [8, 9, 0.55], [29, 1, 0.75], [31, 10, 1], [33, 3, 0.5], [70, 0, 0.8], [71, 4, 0.55], [72, 5, 0.35]])
	_S.define(_e, "BOLT", 52)
	_S.define(_e, "BOLT_B", 12)
	_S.define(_e, "BK", [1, 0.7, 0.3, 0.95, 0.5, 0.75, 0.2])
	_S.define(_e, "W0", _S.unary("-", 84))
	_S.define(_e, "H0", _S.binary("-", _S.read(_e, "TOP"), 6))
	_S.define(_e, "GW", 168)
	_S.define(_e, "GH", _S.binary("-", _S.binary("+", _S.read(_e, "BASE"), 8), _S.read(_e, "H0")))
	_S.define(_e, "FIELD", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "GX", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "GY", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_S.define(_e, "LIT", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "GW"), _S.read(_e, "GH"))]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_BILLOWS = _S.read(_parent,"BILLOWS")
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_ph_b1 = _S.arg(_args,1)
	return _S.invoke(_n_BILLOWS,"map",[_S.function_value(_S.capture(_parent,{"ph":_n_ph_b1,"seed":_n_seed_b0,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_seed = _S.read(_parent,"seed")
	var _n_VIS = _S.read(_parent,"VIS")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_v_b2 = _S.prop(_tuple_0,2)
	var _n_sq_b3 = _S.coalesce(_S.prop(_tuple_0,3),func():return 1)
	var _n_i_b4 = _S.arg(_args,1)
	var _n_top_b5 = (_S.binary("===",_n_sq_b3,1) if _S.truth((_n_y_b1 < (-112))) else (_n_y_b1 < (-112)))
	var _n_boil_b6 = (0.82 + (0.3 * pow(sin((PI * fmod((_n_ph + (_n_i_b4 * 0.37)),1))),2)))
	return {"sq":_n_sq_b3,"x":((_n_x_b0 + (3.5 * _S.NoiseKernels.loop_noise(_n_ph,0.7,(_n_seed + _n_i_b4)))) + ((4 * _S.NoiseKernels.loop_noise(_n_ph,0.5,((_n_seed + _n_i_b4) + 90))) if _S.truth((_n_sq_b3 < 1)) else 0)),"y":((_n_y_b1 + (2 * _S.NoiseKernels.loop_noise(_n_ph,0.7,((_n_seed + _n_i_b4) + 30)))) - ((4 * (_n_boil_b6 - 0.97)) if _S.truth(_n_top_b5) else 0)),"r":(float((_n_v_b2 * (_n_boil_b6 if _S.truth(_n_top_b5) else (1 + (0.08 * _S.NoiseKernels.loop_noise(_n_ph,0.6,((_n_seed + _n_i_b4) + 60)))))))/_n_VIS)}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_FIELD = _S.read(_parent,"FIELD")
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_LIT = _S.read(_parent,"LIT")
	var _n_H0 = _S.read(_parent,"H0")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_GW = _S.read(_parent,"GW")
	var _n_GH = _S.read(_parent,"GH")
	var _n_TH = _S.read(_parent,"TH")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_K_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	var _n_flashes_b6 = _S.arg(_args,6)
	_S.invoke(_n_FIELD,"fill",[0])
	_S.invoke(_n_GX,"fill",[0])
	_S.invoke(_n_GY,"fill",[0])
	_S.invoke(_n_LIT,"fill",[0])
	for _iter_0 in _S.array(_S.invoke(_n_B_b1,"entries",[])):
		var _tuple_1 = _iter_0
		var _n_i_b9 = _S.prop(_tuple_1,0)
		var _n_b_b10 = _S.prop(_tuple_1,1)
		var _n_k_b11 = _S.logical("??",_S.invoke(_n_flashes_b6,"get",[_n_i_b9]),func():return 0)
		var _n_r2_b12 = (_S.named_value(_n_b_b10,"r") * _S.named_value(_n_b_b10,"r"))
		var _n_ry_b13 = (_S.named_value(_n_b_b10,"r") * _S.named_value(_n_b_b10,"sq"))
		if true:
			var _n_y_b14 = maxf(0,floori(((_S.named_value(_n_b_b10,"y") - _n_ry_b13) - _n_H0)))
			while _S.truth((_n_y_b14 < minf(_n_GH,ceili(((_S.named_value(_n_b_b10,"y") + _n_ry_b13) - _n_H0))))):
				if true:
					var _n_x_b15 = maxf(0,floori(((_S.named_value(_n_b_b10,"x") - _S.named_value(_n_b_b10,"r")) - _n_W0)))
					while _S.truth((_n_x_b15 < minf(_n_GW,ceili(((_S.named_value(_n_b_b10,"x") + _S.named_value(_n_b_b10,"r")) - _n_W0))))):
						var _n_dx_b16 = (((_n_x_b15 + _n_W0) + 0.5) - _S.named_value(_n_b_b10,"x"))
						var _n_dy_b17 = (float((((_n_y_b14 + _n_H0) + 0.5) - _S.named_value(_n_b_b10,"y")))/_S.named_value(_n_b_b10,"sq"))
						var _n_d2_b18 = (float(((_n_dx_b16 * _n_dx_b16) + (_n_dy_b17 * _n_dy_b17)))/_n_r2_b12)
						if _S.truth((_n_d2_b18 >= 1)):
							_n_x_b15 += 1.0
							continue
						var _n_j_b19 = ((_n_y_b14 * _n_GW) + _n_x_b15)
						var _n_u_b20 = (1 - _n_d2_b18)
						var _n_c_b21 = (_n_u_b20 * _n_u_b20)
						_S.set_prop(_n_FIELD,_n_j_b19,_n_c_b21,"+=")
						_S.set_prop(_n_GX,_n_j_b19,(float((((-4) * _n_u_b20) * _n_dx_b16))/_n_r2_b12),"+=")
						_S.set_prop(_n_GY,_n_j_b19,(float((((-4) * _n_u_b20) * _n_dy_b17))/(_n_r2_b12 * _S.named_value(_n_b_b10,"sq"))),"+=")
						if _S.truth(_n_k_b11):
							_S.set_prop(_n_LIT,_n_j_b19,((_n_k_b11 * (0.25 + (0.75 * _n_c_b21))) * (1 if _S.truth((_n_d2_b18 < 1)) else 0)),"+=")
						_n_x_b15 += 1.0
				_n_y_b14 += 1.0
	var _n_ramp_b7 = _S.concat([_S.array(_n_K_b4),[_S.index_value(_n_C_b5,3)],[_S.index_value(_n_C_b5,4)],[_S.index_value(_n_C_b5,5)],[_S.index_value(_n_C_b5,6)]])
	var _n_n_b8 = _S.prop(_n_K_b4,"length")
	if true:
		var _n_y_b22 = 0
		while _S.truth((_n_y_b22 < _n_GH)):
			var _n_cy_b23 = ((_n_y_b22 + _n_H0) + 0.5)
			if true:
				var _n_x_b24 = 0
				while _S.truth((_n_x_b24 < _n_GW)):
					var _n_j_b25 = ((_n_y_b22 * _n_GW) + _n_x_b24)
					if _S.truth((_S.index_value(_n_FIELD,_n_j_b25) < (_n_TH - 0.06))):
						_n_x_b24 += 1.0
						continue
					var _n_cx_b26 = ((_n_x_b24 + _n_W0) + 0.5)
					var _n_base_b27 = (_n_BASE + (1.5 * _S.NoiseKernels.tile_noise(((_n_cx_b26 * 0.12) + (9 * _n_ph_b2)),3,9,0,(_n_seed_b3 + 5))))
					var _n_F_b28 = ((_S.index_value(_n_FIELD,_n_j_b25) * (1 - _S.MathFX.smooth((_n_base_b27 - 3),_n_base_b27,_n_cy_b23))) + (0.05 * _S.NoiseKernels.tile_noise(((_n_cx_b26 * 0.21) + (18 * _n_ph_b2)),(_n_cy_b23 * 0.21),18,0,_n_seed_b3)))
					if _S.truth((_n_F_b28 < _n_TH)):
						_n_x_b24 += 1.0
						continue
					var _n_gl_b29 = _S.logical("||",_S.Bridge.hypot([_S.index_value(_n_GX,_n_j_b25), _S.index_value(_n_GY,_n_j_b25)]),func():return 1)
					var _n_lam_b30 = (float((-((_S.index_value(_n_GX,_n_j_b25) * 0.42) + (_S.index_value(_n_GY,_n_j_b25) * 0.9))))/_n_gl_b29)
					var _n_edge_b31 = (minf(1,(_n_gl_b29 * 5)) * (1 if _S.truth((_n_F_b28 < (_n_TH + 0.08))) else 0.55))
					var _n_h_b32 = (1 - (2 * clampf((float((_n_cy_b23 - _n_TOP))/(_n_BASE - _n_TOP)),0.0,1.0)))
					var _n_i_b33 = (((2.7 + (2.2 * _n_h_b32)) + ((1.3 * _n_lam_b30) * _n_edge_b31)) + (0.4 * _S.NoiseKernels.tile_noise(((_n_cx_b26 * 0.16) + (12 * _n_ph_b2)),(_n_cy_b23 * 0.16),12,0,(_n_seed_b3 + 9))))
					if _S.truth(((_n_h_b32 > (-0.5)) if _S.truth(((_n_lam_b30 > 0.3) if _S.truth((_n_F_b28 < (_n_TH + 0.05))) else (_n_F_b28 < (_n_TH + 0.05)))) else ((_n_lam_b30 > 0.3) if _S.truth((_n_F_b28 < (_n_TH + 0.05))) else (_n_F_b28 < (_n_TH + 0.05))))):
						_n_i_b33 += 1
					if _S.truth((_n_cy_b23 > (_n_base_b27 - 6))):
						_n_i_b33 -= 1
					_n_i_b33 = clampf(floori(_n_i_b33+0.5),0,(_n_n_b8 - 1))
					var _n_L_b34 = (_S.index_value(_n_LIT,_n_j_b25) * (0.7 + (0.6 * _S.NoiseKernels.tile_noise(((_n_cx_b26 * 0.2) - (14 * _n_ph_b2)),(_n_cy_b23 * 0.2),14,0,(_n_seed_b3 + 3)))))
					if _S.truth((_n_L_b34 > 0.12)):
						_n_i_b33 = minf((_S.prop(_n_ramp_b7,"length") - 1),(_n_i_b33 + floori((_n_L_b34 * 5.5)+0.5)))
					_S.invoke(_n_p_b0,"px",[_n_cx_b26, _n_cy_b23, _S.index_value(_n_ramp_b7,_n_i_b33)])
					_n_x_b24 += 1.0
			_n_y_b22 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ph_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.arg(_args,2)
	var _n_K_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.MathFX.rng([_n_seed_b2,13])
	if true:
		var _n_w_b5 = 0
		while _S.truth((_n_w_b5 < 6)):
			var _n_x0_b6 = _S.invoke(_n_r_b4,"range",[(-60), 60])
			var _n_y0_b7 = (_n_BASE + _S.invoke(_n_r_b4,"range",[3, 9]))
			var _n_rx_b8 = _S.invoke(_n_r_b4,"range",[10, 20])
			var _n_ry_b9 = _S.invoke(_n_r_b4,"range",[1.3, 2.2])
			var _n_off_b10 = _S.invoke(_n_r_b4,"next",[])
			var _n_u_b11 = fmod((_n_ph_b1 + _n_off_b10),1)
			var _n_a_b12 = pow(sin((PI * _n_u_b11)),0.8)
			var _n_xc_b13 = (_n_x0_b6 + (16 * (_n_u_b11 - 0.5)))
			if true:
				var _n_y_b14 = floori(((_n_y0_b7 - _n_ry_b9) - 1))
				while _S.truth((_n_y_b14 <= ((_n_y0_b7 + _n_ry_b9) + 1))):
					if true:
						var _n_x_b15 = floori(((_n_xc_b13 - _n_rx_b8) - 1))
						while _S.truth((_n_x_b15 <= ((_n_xc_b13 + _n_rx_b8) + 1))):
							var _n_dx_b16 = (float(((_n_x_b15 + 0.5) - _n_xc_b13))/_n_rx_b8)
							var _n_dy_b17 = (float(((_n_y_b14 + 0.5) - _n_y0_b7))/_n_ry_b9)
							var _n_nz_b18 = _S.NoiseKernels.tile_noise(((((_n_x_b15 + 0.5) * 0.35) + (10 * _n_ph_b1)) + (_n_w_b5 * 7)),((_n_y_b14 + 0.5) * 0.5),10,0,((_n_seed_b2 + 20) + _n_w_b5))
							var _n_v_b19 = (((((1 - (_n_dx_b16 * _n_dx_b16)) - (_n_dy_b17 * _n_dy_b17)) * _n_a_b12) + (0.6 * _n_nz_b18)) - 0.25)
							if _S.truth((_n_v_b19 > 0)):
								_S.invoke(_n_p_b0,"blend",[(_n_x_b15 + 0.5), (_n_y_b14 + 0.5), (_S.index_value(_n_K_b3,2) if _S.truth((_n_v_b19 > 0.4)) else _S.index_value(_n_K_b3,3)), minf(0.6,(0.2 + (_n_v_b19 * 0.7)))])
							_n_x_b15 += 1.0
					_n_y_b14 += 1.0
			_n_w_b5 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_billows = _S.read(_parent,"billows")
	var _n_BOLT = _S.read(_parent,"BOLT")
	var _n_BILLOWS = _S.read(_parent,"BILLOWS")
	var _n_BOLT_B = _S.read(_parent,"BOLT_B")
	var _n_Map = _S.read(_parent,"Map")
	var _n_FLASHES = _S.read(_parent,"FLASHES")
	var _n_BK = _S.read(_parent,"BK")
	var _n_P = _S.read(_parent,"P")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_scud = _S.read(_parent,"scud")
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flight = _S.read(_parent,"flight")
	var _n_spark = _S.read(_parent,"spark")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_K_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"cloud"),7)
	var _n_RN_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"rain"),4)
	var _n_S_b6 = _S.invoke(_S.named_value(_n_o_b2,"sparks"),"map",[_n_hex])
	var _n_f_b7 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_ph_b8 = (float(_n_f_b7)/_n_N)
	var _n_B_b9 = _S.call_value(_n_billows,[_S.named_value(_n_o_b2,"seed"), _n_ph_b8])
	var _n_br_b10 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),5,_n_BOLT])
	var _n_ba_b11 = (_n_f_b7 - _n_BOLT)
	var _n_bx0_b12 = (_S.index_value(_S.index_value(_n_BILLOWS,_n_BOLT_B),0) + _S.invoke(_n_br_b10,"range",[(-4), 4]))
	var _n_bx1_b13 = _S.invoke(_n_br_b10,"range",[(-24), 24])
	var _n_flashes_b14 = _S.construct(_n_Map,[_S.invoke(_S.invoke(_n_FLASHES,"filter",[_S.function_value(_S.capture(_parent,{"f":_n_f_b7,"this":_this}),"_f5")]),"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])])
	if _S.truth(((_n_ba_b11 < _S.prop(_n_BK,"length")) if _S.truth((_n_ba_b11 >= 0)) else (_n_ba_b11 >= 0))):
		_S.invoke(_n_flashes_b14,"set",[_n_BOLT_B, maxf(_S.logical("??",_S.invoke(_n_flashes_b14,"get",[_n_BOLT_B]),func():return 0),_S.index_value(_n_BK,_n_ba_b11))])
	var _n_lights_b15 = _S.invoke(_S.concat([_S.array(_n_flashes_b14)]),"map",[_S.function_value(_S.capture(_parent,{"B":_n_B_b9,"this":_this}),"_f7")])
	var _n_flash_b16 = _S.invoke(_n_lights_b15,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), 0])
	_S.call_value(_n_cycle,[_n_t_b1, _n_P, 150, (_S.named_value(_n_o_b2,"seed") + 11), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"flash":_n_flash_b16,"C":_n_C_b3,"RN":_n_RN_b5,"this":_this}),"_f10")])
	_S.call_value(_n_scud,[_n_p_b0, _n_ph_b8, _S.named_value(_n_o_b2,"seed"), _n_K_b4])
	_S.call_value(_n_cloud,[_n_p_b0, _n_B_b9, _n_ph_b8, _S.named_value(_n_o_b2,"seed"), _n_K_b4, _n_C_b3, _n_flashes_b14])
	for _iter_0 in _S.array(_n_lights_b15):
		var _n_l_b18 = _iter_0
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b18,"x"), _S.named_value(_n_l_b18,"y"), _S.named_value(_n_l_b18,"r"), _S.index_value(_n_C_b3,4), (0.4 * _S.named_value(_n_l_b18,"k"))])
	_S.invoke(_n_p_b0,"glow",[0, (-122), 80, _S.index_value(_n_C_b3,2), (0.05 + (0.22 * _n_flash_b16))])
	for _iter_1 in _S.array(_n_FLASHES):
		var _tuple_2 = _iter_1
		var _n_ff_b19 = _S.prop(_tuple_2,0)
		var _n_b_b20 = _S.prop(_tuple_2,1)
		var _n_k_b21 = _S.prop(_tuple_2,2)
		if _S.truth(((_n_k_b21 > 0.6) if _S.truth(_S.binary("===",_n_ff_b19,_n_f_b7)) else _S.binary("===",_n_ff_b19,_n_f_b7))):
			var _n_r_b22 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),7,_n_ff_b19])
			var _n_x_b23 = _S.named_value(_S.index_value(_n_B_b9,_n_b_b20),"x")
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b22, (_n_x_b23 - _S.invoke(_n_r_b22,"range",[12, 22])), (_n_BASE - _S.invoke(_n_r_b22,"range",[2, 6])), (_n_x_b23 + _S.invoke(_n_r_b22,"range",[12, 22])), (_n_BASE - _S.invoke(_n_r_b22,"range",[1, 5])), 0.25, 0.5]), 0.6, _n_C_b3, 0.4])
	if _S.truth(((_n_ba_b11 < _S.prop(_n_BK,"length")) if _S.truth((_n_ba_b11 >= 0)) else (_n_ba_b11 >= 0))):
		var _n_k_b24 = _S.index_value(_n_BK,_n_ba_b11)
		_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),9,_n_BOLT]), _n_bx0_b12, (_n_BASE - 3), _n_bx1_b13, 0, 0.22, 0.7]), _n_k_b24, _n_C_b3, (1.15 if _S.truth(_S.binary("===",_n_ba_b11,0)) else 1), {"hero":_S.binary("===",_n_ba_b11,0)}])
		_S.invoke(_n_p_b0,"circle",[_n_bx1_b13, (-1), ((3 * _n_k_b24) + 1.5), _S.index_value(_n_C_b3,2)])
		_S.invoke(_n_p_b0,"circle",[_n_bx1_b13, (-1), ((3 * _n_k_b24) + 0.5), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"circle",[_n_bx1_b13, (-1), (2 * _n_k_b24), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_bx1_b13, (-22), 78, _S.index_value(_n_C_b3,3), (0.5 * _n_k_b24)])
		_S.invoke(_n_p_b0,"glow",[_n_bx1_b13, (-3), 18, _S.index_value(_n_C_b3,5), (0.45 * _n_k_b24)])
		_S.invoke(_n_p_b0,"glow",[_n_bx0_b12, _n_BASE, 84, _S.index_value(_n_C_b3,4), (0.3 * _n_k_b24)])
	var _n_sa_b17 = fmod((fmod((_n_t_b1 - (float(_n_BOLT)/_n_FPS)),_n_P) + _n_P),_n_P)
	if true:
		var _n_j_b25 = 0
		while _S.truth((_n_j_b25 < 16)):
			var _n_q_b26 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),31,_n_j_b25])
			var _n_life_b27 = _S.invoke(_n_q_b26,"range",[0.25, 0.6])
			if _S.truth((_n_sa_b17 >= _n_life_b27)):
				_n_j_b25 += 1.0
				continue
			var _n_a_b28 = ((float((-PI))/2) + _S.invoke(_n_q_b26,"range",[(-1.3), 1.3]))
			var _n_sp_b29 = _S.invoke(_n_q_b26,"range",[60, 200])
			var _tuple_3 = _S.call_value(_n_flight,[_n_bx1_b13, (-1), (cos(_n_a_b28) * _n_sp_b29), (sin(_n_a_b28) * _n_sp_b29), _n_sa_b17, {"floor":0}])
			var _n_x_b30 = _S.prop(_tuple_3,0)
			var _n_y_b31 = _S.prop(_tuple_3,1)
			var _n_vx_b32 = _S.prop(_tuple_3,2)
			var _n_vy_b33 = _S.prop(_tuple_3,3)
			_S.call_value(_n_spark,[_n_p_b0, _n_x_b30, _n_y_b31, _n_vx_b32, _n_vy_b33, (1 - (float(_n_sa_b17)/_n_life_b27)), _n_S_b6])
			_n_j_b25 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _tuple_0 = _S.arg(_args,0)
	var _n_ff_b0 = _S.prop(_tuple_0,0)
	return _S.binary("===",_n_ff_b0,_n_f)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_b_b0 = _S.prop(_tuple_0,1)
	var _n_k_b1 = _S.prop(_tuple_0,2)
	return [_n_b_b0, _n_k_b1]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_VIS = _S.read(_parent,"VIS")
	var _tuple_0 = _S.arg(_args,0)
	var _n_b_b0 = _S.prop(_tuple_0,0)
	var _n_k_b1 = _S.prop(_tuple_0,1)
	return {"x":_S.named_value(_S.index_value(_n_B,_n_b_b0),"x"),"y":_S.named_value(_S.index_value(_n_B,_n_b_b0),"y"),"k":_n_k_b1,"r":((_S.named_value(_S.index_value(_n_B,_n_b_b0),"r") * _n_VIS) * (1.6 if _S.truth((_S.named_value(_S.index_value(_n_B,_n_b_b0),"sq") < 1)) else 2.2))}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_l_b1 = _S.arg(_args,1)
	return maxf(_n_s_b0,_S.named_value(_n_l_b1,"k"))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.5, 0.62])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_RN = _S.read(_parent,"RN")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[(-62), 62])
	var _n_vy_b4 = _S.invoke(_n_r_b2,"range",[190, 240])
	var _n_vx_b5 = ((-_n_vy_b4) * 0.18)
	var _n_tf_b6 = (float((0 - (_n_BASE + 4)))/_n_vy_b4)
	if _S.truth((_n_age_b0 < _n_tf_b6)):
		var _n_x_b7 = (_n_x0_b3 + (_n_vx_b5 * _n_age_b0))
		var _n_y_b8 = ((_n_BASE + 4) + (_n_vy_b4 * _n_age_b0))
		var _n_l_b9 = _S.invoke(_n_r_b2,"range",[4, 6.5])
		_S.invoke(_n_p,"line",[(_n_x_b7 - ((_n_vx_b5 * 0.018) * (float(_n_l_b9)/4))), (_n_y_b8 - _n_l_b9), _n_x_b7, _n_y_b8, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f11")])
	else:
		if _S.truth((_n_age_b0 < (_n_tf_b6 + 0.12))):
			var _n_x_b10 = (_n_x0_b3 + (_n_vx_b5 * _n_tf_b6))
			var _n_a_b11 = (float((_n_age_b0 - _n_tf_b6))/0.12)
			for _iter_0 in _S.array([(-1), 1]):
				var _n_s_b12 = _iter_0
				_S.invoke(_n_p,"px",[(_n_x_b10 + (_n_s_b12 * (1 + (_n_a_b11 * 2.5)))), ((-1) - (sin((_n_a_b11 * PI)) * 2.5)), (_S.index_value(_n_RN,3) if _S.truth((_n_a_b11 < 0.5)) else _S.index_value(_n_RN,2))])
			if _S.truth((_n_a_b11 < 0.4)):
				_S.invoke(_n_p,"px",[_n_x_b10, 0, _S.index_value(_n_RN,3)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_flash = _S.read(_parent,"flash")
	var _n_RN = _S.read(_parent,"RN")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_S.index_value(_n_C,5) if _S.truth((_n_flash > 0.5)) else _S.index_value(_n_RN,3)) if _S.truth((_n_u_b0 > 0.7)) else (_S.index_value(_n_C,3) if _S.truth((_n_flash > 0.5)) else _S.index_value(_n_RN,(2 if _S.truth((_n_u_b0 > 0.35)) else 1))))
	return null
