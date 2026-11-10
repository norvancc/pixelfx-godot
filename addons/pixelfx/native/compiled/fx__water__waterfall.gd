@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/waterfall.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f0"))
	_S.define(_e, "rockMap", _S.function_value(_e, "_f3"))
	_S.define(_e, "outcrop", _S.function_value(_e, "_f5"))
	_S.define(_e, "river", _S.function_value(_e, "_f8"))
	_S.define(_e, "curl", _S.function_value(_e, "_f10"))
	_S.define(_e, "pool", _S.function_value(_e, "_f12"))
	_S.define(_e, "foam", _S.function_value(_e, "_f14"))
	_S.define(_e, "mist", _S.function_value(_e, "_f18"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f22"))
	_S.define(_e, "draw", _S.function_value(_e, "_f23"))
	_S.define(_e, "meta", _S.merge([{"name": "Waterfall"}, {"desc": "A river pours from a notch in a rock outcrop: a white curl, a deep sheet that splits into strands, churning foam, spray, drifting mist and rings on a dark pool."}, {"tags": ["water", "waterfall", "cascade", "foam", "mist", "ambient", "loop"]}, {"size": [144, 136]}, {"origin": [72, 118]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 92}, {"width": 13}, {"ledge": true}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.2)
	_S.define(_e, "G", 760)
	_S.define(_e, "POOL", [56, 11])
	_S.define(_e, "halfW", _S.function_value(_e, "_f28"))
	_S.define(_e, "ROCKS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_W_b4 = _S.arg(_args,4)
	var _n_S_b5 = _S.arg(_args,5)
	if true:
		var _n_y_b6 = ((-_n_H_b3) + 2)
		while _S.truth((_n_y_b6 <= (-1))):
			var _n_d_b7 = ((_n_y_b6 + 0.5) + _n_H_b3)
			var _n_v_b8 = (float(_n_d_b7)/_n_H_b3)
			var _n_s_b9 = sqrt((_n_d_b7 + 3))
			var _n_hw0_b10 = _S.call_value(_n_halfW,[_n_W_b4, _n_d_b7, _n_H_b3])
			var _n_split_b11 = _S.MathFX.smooth(0.56,0.95,_n_v_b8)
			var _n_glass_b12 = (1 - _S.MathFX.smooth(4,24,_n_d_b7))
			var _n_wl_b13 = (_S.NoiseKernels.tile_noise(2,((_n_s_b9 * 1.4) - (_n_ph_b2 * 12)),0,12,(_n_S_b5 + 2)) * (0.4 + (1.8 * _n_v_b8)))
			var _n_wr_b14 = (_S.NoiseKernels.tile_noise(11,((_n_s_b9 * 1.4) - (_n_ph_b2 * 12)),0,12,(_n_S_b5 + 2)) * (0.4 + (1.8 * _n_v_b8)))
			var _n_fan_b15 = ((_S.NoiseKernels.tile_noise(3,((_n_s_b9 * 0.8) - (_n_ph_b2 * 4)),0,4,(_n_S_b5 + 61)) * 1.6) if _S.truth((_n_split_b11 > 0)) else 0)
			var _n_sd_b16 = ((_n_s_b9 * 1.5) - (_n_ph_b2 * 20))
			var _n_sb_b17 = ((_n_s_b9 * 0.45) - (_n_ph_b2 * 6))
			if true:
				var _n_X_b18 = ((-_n_W_b4) - 8)
				while _S.truth((_n_X_b18 <= (_n_W_b4 + 8))):
					var _n_x_b19 = (_n_X_b18 + 0.5)
					var _n_hw_b20 = (_n_hw0_b10 + (_n_wl_b13 if _S.truth((_n_x_b19 < 0)) else _n_wr_b14))
					var _n_ax_b21 = absf(_n_x_b19)
					if _S.truth((_n_ax_b21 > _n_hw_b20)):
						_n_X_b18 += 1.0
						continue
					var _n_e_b22 = (float(_n_ax_b21)/_n_hw_b20)
					var _n_edge_b23 = false
					if _S.truth((_n_split_b11 > 0)):
						var _n_f_b27 = fmod((fmod((float((((float(_n_x_b19)/(1 + (0.22 * _n_split_b11))) + _n_fan_b15) + 64))/5.4),1) + 1),1)
						if _S.truth((_n_f_b27 > (1 - (0.46 * _n_split_b11)))):
							_n_X_b18 += 1.0
							continue
						_n_edge_b23 = (_n_f_b27 < 0.2)
					var _n_dash_b24 = _S.NoiseKernels.tile_noise(((_n_X_b18 * 1.618) + 0.31),_n_sd_b16,0,20,_n_S_b5)
					if _S.truth(_S.logical("&&",_S.logical("&&",(_S.MathFX.rand([_n_X_b18,(_n_S_b5 + 60)]) < 0.48),func():return (_n_e_b22 < 0.86)),func():return not _S.truth(_n_edge_b23))):
						_S.invoke(_n_p_b0,"blend",[_n_x_b19, (_n_y_b6 + 0.5), (_S.index_value(_n_C_b1,4) if _S.truth((_n_dash_b24 > 0.45)) else (_S.index_value(_n_C_b1,3) if _S.truth((_n_glass_b12 > 0.5)) else _S.index_value(_n_C_b1,2))), (0.7 if _S.truth((_n_dash_b24 > 0.45)) else (0.42 + (0.15 * _n_v_b8)))])
						_n_X_b18 += 1.0
						continue
					var _n_broad_b25 = _S.NoiseKernels.tile_noise((floori((float((_n_x_b19 + 40))/3)) * 2.7),_n_sb_b17,0,6,(_n_S_b5 + 1))
					var _n_b_b26 = (((((((-0.34) + (0.46 * _n_v_b8)) + (0.3 * _n_broad_b25)) - (_n_glass_b12 * 0.5)) + ((0.35 * _S.MathFX.smooth(0.7,1,_n_e_b22)) * (1 if _S.truth((_n_x_b19 < 0)) else 0.3))) - ((0.12 * _n_e_b22) if _S.truth((_n_x_b19 > 0)) else 0)) + (0.3 if _S.truth(_n_edge_b23) else 0))
					if _S.truth((_n_dash_b24 > (0.2 - (0.22 * _n_v_b8)))):
						_n_b_b26 += (0.36 + (0.7 * (_n_dash_b24 - 0.2)))
					if _S.truth((_n_b_b26 > (-0.2))):
						_S.invoke(_n_p_b0,"px",[_n_X_b18, _n_y_b6, (_n_WHITE if _S.truth((_n_b_b26 > 0.62)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_b_b26 > 0.34)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_b_b26 > 0.08)) else _S.index_value(_n_C_b1,4))))])
					else:
						_S.invoke(_n_p_b0,"blend",[_n_x_b19, (_n_y_b6 + 0.5), _S.index_value(_n_C_b1,3), 0.8])
					_n_X_b18 += 1.0
			_n_y_b6 += 1.0
	_S.call_value(_n_cycle,[(_n_ph_b2 * _n_D), _n_D, 16, (_n_S_b5 + 30), 0.4, _S.function_value(_S.capture(_parent,{"H":_n_H_b3,"W":_n_W_b4,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_W = _S.read(_parent,"W")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_side_b3 = _S.invoke(_n_r_b2,"sign",[])
	var _n_d0_b4 = _S.invoke(_n_r_b2,"range",[14, (_n_H * 0.7)])
	var _n_d_b5 = ((_n_d0_b4 + (50 * _n_age_b0)) + ((260 * _n_age_b0) * _n_age_b0))
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth((_n_d_b5 > (_n_H - 6))):
		return null
	var _n_x_b7 = (_n_side_b3 * ((_S.call_value(_n_halfW,[_n_W, _n_d_b5, _n_H]) + 1.5) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[6, 16]))))
	var _n_y_b8 = ((-_n_H) + _n_d_b5)
	var _n_len_b9 = (2 + (6 * _n_k_b6))
	_S.invoke(_n_p,"line",[_n_x_b7, (_n_y_b8 - _n_len_b9), _n_x_b7, _n_y_b8, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f2"), (1 - (_n_k_b6 * 0.5))])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.7)) else _S.index_value(_n_C,4))
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "lumps", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	_S.define(_e, "hgt", _S.arg(_args, 4))
	_S.define(_e, "Lx", _S.arg(_args, 5))
	_S.define(_e, "Ly", _S.arg(_args, 6))
	_S.define(_e, "Lz", _S.arg(_args, 7))
	_S.define(_e, "S", _S.arg(_args, 8))
	_S.define(_e, "id", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "hgt"))]), "fill", [_S.unary("-", 1)]))
	_S.define(_e, "lit", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "hgt"))]))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "j"), _S.read(_v6, "hgt"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), _S.read(_v7, "w"))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "x", _S.binary("+", _S.binary("+", _S.read(_v8, "x0"), _S.read(_v8, "i")), 0.5))
			_S.define(_v8, "y", _S.binary("+", _S.binary("+", _S.read(_v8, "y0"), _S.read(_v8, "j")), 0.5))
			_S.define(_v8, "best", _S.unary("-", 1))
			_S.define(_v8, "z", _S.unary("-", 1000000000))
			_S.define(_v8, "l", 0)
			_S.invoke(_S.read(_v8, "lumps"), "forEach", [_S.function_value(_v8, "_f4")])
			_S.set_prop(_S.read(_v8, "id"), _S.binary("+", _S.binary("*", _S.read(_v8, "j"), _S.read(_v8, "w")), _S.read(_v8, "i")), _S.read(_v8, "best"), "=", false)
			_S.set_prop(_S.read(_v8, "lit"), _S.binary("+", _S.binary("*", _S.read(_v8, "j"), _S.read(_v8, "w")), _S.read(_v8, "i")), _S.binary("+", _S.read(_v8, "l"), _S.binary("*", 0.2, _S.call_value(_S.read(_v8, "tileNoise"), [_S.binary("*", _S.read(_v8, "x"), 0.32), _S.binary("*", _S.read(_v8, "y"), 0.32), 0, 0, _S.binary("+", _S.read(_v8, "S"), 70)]))), "=", false)
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "j", 1, "+=", true)
	return _S.merge([{"id": _S.read(_e, "id")}, {"lit": _S.read(_e, "lit")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "cx", _S.prop(_v9, 0))
	_S.define(_e, "cy", _S.prop(_v9, 1))
	_S.define(_e, "rx", _S.prop(_v9, 2))
	_S.define(_e, "ry", _S.prop(_v9, 3))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "rx")))
	_S.define(_e, "ny", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ry")))
	_S.define(_e, "r2", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "nx")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "ny"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "r2"), 1)):
		return null
	_S.define(_e, "nz", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_e, "r2"))]))
	_S.define(_e, "depth", _S.binary("+", _S.binary("*", _S.read(_e, "nz"), _S.read(_e, "ry")), (_S.unary("-", 6) if _S.truth(_S.binary("===", _S.read(_e, "k"), 5)) else (_S.unary("-", 3) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else (_S.unary("-", 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 2)) else 0)))))
	if _S.truth(_S.binary(">", _S.read(_e, "depth"), _S.read(_e, "z"))):
		_S.last([_S.write(_e, "z", _S.read(_e, "depth"), "=", false), _S.write(_e, "best", _S.read(_e, "k"), "=", false), _S.write(_e, "l", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "Lx")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "Ly"))), _S.binary("*", _S.read(_e, "nz"), _S.read(_e, "Lz"))), "=", false)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "S", _S.arg(_args, 5))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", _S.unary("-", 0.72))
	_S.define(_e, "Lz", 0.42)
	_S.define(_e, "lumps", [[_S.binary("-", _S.unary("-", _S.read(_e, "W")), 11), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 4), 13, 10], [_S.binary("+", _S.read(_e, "W"), 8), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), 9, 7.5], [0, _S.binary("+", _S.unary("-", _S.read(_e, "H")), 3.5), _S.binary("+", _S.read(_e, "W"), 3), 4.2], [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 21), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 4), 7, 5.5], [_S.binary("+", _S.read(_e, "W"), 15), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 4.5), 5, 4], [_S.unary("-", 2), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 5), _S.binary("+", _S.read(_e, "W"), 7), 6.5]])
	_S.define(_e, "x0", _S.binary("-", _S.unary("-", _S.read(_e, "W")), 29))
	_S.define(_e, "x1", _S.binary("+", _S.read(_e, "W"), 21))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", _S.read(_e, "H")), 15))
	_S.define(_e, "y1", _S.binary("+", _S.unary("-", _S.read(_e, "H")), 10))
	_S.define(_e, "w", _S.binary("+", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), 1))
	_S.define(_e, "hgt", _S.binary("+", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), 1))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "W")) + "|" + _S.string(_S.read(_e, "H")) + "|" + _S.string(_S.read(_e, "S")) + ""))
	_S.define(_e, "map", _S.invoke(_S.read(_e, "ROCKS"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "map"))):
		_S.invoke(_S.read(_e, "ROCKS"), "set", [_S.read(_e, "key"), _S.write(_e, "map", _S.call_value(_S.read(_e, "rockMap"), [_S.read(_e, "lumps"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "w"), _S.read(_e, "hgt"), _S.read(_e, "Lx"), _S.read(_e, "Ly"), _S.read(_e, "Lz"), _S.read(_e, "S")]), "=", false)])
	var _v10 = _S.read(_e, "map")
	_S.define(_e, "id", _S.prop(_v10, "id"))
	_S.define(_e, "lit", _S.prop(_v10, "lit"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.unary("-", _S.read(_e, "W")), 26), _S.unary("-", _S.read(_e, "H")), _S.binary("+", _S.read(_e, "W"), 18), _S.binary("+", _S.unary("-", _S.read(_e, "H")), 20), _S.function_value(_e, "_f6")])
	_S.define(_e, "at", _S.function_value(_e, "_f7"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "j"), _S.read(_v11, "hgt"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "w"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "k", _S.prop(_S.read(_v13, "id"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "w")), _S.read(_v13, "i"))))
			_S.define(_v13, "x", _S.binary("+", _S.read(_v13, "x0"), _S.read(_v13, "i")))
			_S.define(_v13, "y", _S.binary("+", _S.read(_v13, "y0"), _S.read(_v13, "j")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v13, "k"), 2), func(): return _S.binary("===", _S.read(_v13, "k"), 5)), func(): return _S.binary("<", _S.read(_v13, "k"), 0)), func(): return _S.binary(">=", _S.read(_v13, "y"), _S.binary("-", _S.unary("-", _S.read(_v13, "H")), 5))), func(): return _S.binary("<", _S.read(_v13, "y"), _S.binary("+", _S.unary("-", _S.read(_v13, "H")), 1))), func(): return _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("+", _S.read(_v13, "x"), 0.5)]), _S.binary("+", _S.read(_v13, "W"), 1.5)))):
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			if _S.truth(_S.binary("<", _S.read(_v13, "k"), 0)):
				var _v14 = _S.scope(_v13)
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.binary("-", _S.read(_v14, "i"), 1), _S.read(_v14, "j")]), 0), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.binary("+", _S.read(_v14, "i"), 1), _S.read(_v14, "j")]), 0)), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.read(_v14, "i"), _S.binary("-", _S.read(_v14, "j"), 1)]), 0)), func(): return _S.binary(">=", _S.call_value(_S.read(_v14, "at"), [_S.read(_v14, "i"), _S.binary("+", _S.read(_v14, "j"), 1)]), 0))):
					_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "ST"), 0)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "r", _S.call_value(_S.read(_v13, "at"), [_S.binary("+", _S.read(_v13, "i"), 1), _S.read(_v13, "j")]))
			_S.define(_v13, "b", _S.call_value(_S.read(_v13, "at"), [_S.read(_v13, "i"), _S.binary("+", _S.read(_v13, "j"), 1)]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v13, "r"), 0), func(): return _S.binary("!==", _S.read(_v13, "r"), _S.read(_v13, "k"))), func(): return _S.binary("<", _S.read(_v13, "r"), _S.read(_v13, "k"))), func(): return _S.logical("&&", _S.binary(">=", _S.read(_v13, "b"), 0), func(): return _S.binary("!==", _S.read(_v13, "b"), _S.read(_v13, "k"))))):
				var _v15 = _S.scope(_v13)
				_S.invoke(_S.read(_v15, "p"), "px", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.prop(_S.read(_v15, "ST"), 1)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "l", _S.prop(_S.read(_v13, "lit"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "w")), _S.read(_v13, "i"))))
			_S.define(_v13, "wet", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("+", _S.read(_v13, "x"), 0.5)]), _S.binary("+", _S.read(_v13, "W"), 6)), func(): return _S.binary(">", _S.read(_v13, "y"), _S.binary("-", _S.unary("-", _S.read(_v13, "H")), 9))))
			_S.define(_v13, "c", (_S.prop(_S.read(_v13, "ST"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.9)) else (_S.prop(_S.read(_v13, "ST"), 4) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.64)) else (_S.prop(_S.read(_v13, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.3)) else (_S.prop(_S.read(_v13, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "l"), _S.unary("-", 0.05))) else _S.prop(_S.read(_v13, "ST"), 1))))))
			if _S.truth(_S.binary("===", _S.read(_v13, "k"), 5)):
				_S.write(_v13, "c", (_S.prop(_S.read(_v13, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.7)) else (_S.prop(_S.read(_v13, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "l"), 0.2)) else _S.prop(_S.read(_v13, "ST"), 1))), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v13, "at"), [_S.read(_v13, "i"), _S.binary("-", _S.read(_v13, "j"), 1)]), 0), func(): return _S.binary(">", _S.read(_v13, "l"), 0.25))):
				_S.write(_v13, "c", _S.prop(_S.read(_v13, "ST"), 5), "=", false)
			if _S.truth(_S.read(_v13, "wet")):
				var _v16 = _S.scope(_v13)
				_S.write(_v16, "c", (_S.prop(_S.read(_v16, "ST"), 4) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.9)) else (_S.prop(_S.read(_v16, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.64)) else (_S.prop(_S.read(_v16, "ST"), 2) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.3)) else _S.prop(_S.read(_v16, "ST"), 1)))), "=", false)
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "l"), 0.3), func(): return _S.binary(">", _S.call_value(_S.read(_v16, "tileNoise"), [_S.binary("*", _S.read(_v16, "x"), 0.9), _S.binary("-", _S.binary("*", _S.read(_v16, "y"), 0.6), _S.binary("*", _S.read(_v16, "ph"), 8)), 0, 8, _S.binary("+", _S.read(_v16, "S"), 71)]), 0.42))):
					_S.write(_v16, "c", (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v16, "l"), 0.6)) else _S.prop(_S.read(_v16, "C"), 4)), "=", false)
			_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "j", 1, "+=", true)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "q", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "q"), 3)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "L", _S.prop(_S.read(_v18, "lumps"), _S.binary("%", _S.read(_v18, "q"), 2)))
		_S.define(_v18, "cx", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v18, "L"), 0), _S.binary("*", (_S.unary("-", 0.5) if _S.truth(_S.binary("===", _S.read(_v18, "q"), 2)) else 0.15), _S.prop(_S.read(_v18, "L"), 2)))]))
		_S.define(_v18, "cy", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v18, "L"), 1), _S.binary("*", _S.prop(_S.read(_v18, "L"), 3), (0.1 if _S.truth(_S.binary("===", _S.read(_v18, "q"), 2)) else _S.unary("-", 0.25))))]))
		_S.define(_v18, "len", _S.binary("+", 3, _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "q"), _S.binary("+", _S.read(_v18, "S"), 74)]), 4)])))
		_S.define(_v18, "dx", (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "q"), _S.binary("+", _S.read(_v18, "S"), 75)]), 0.5)) else _S.unary("-", 1)))
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "n", 0)
		while _S.truth(_S.binary("<=", _S.read(_v19, "n"), _S.read(_v19, "len"))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "x", _S.binary("+", _S.read(_v20, "cx"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "round", [_S.binary("*", _S.read(_v20, "n"), 0.6)]), _S.read(_v20, "dx"))))
			_S.define(_v20, "y", _S.binary("+", _S.read(_v20, "cy"), _S.read(_v20, "n")))
			_S.define(_v20, "i", _S.binary("-", _S.read(_v20, "x"), _S.read(_v20, "x0")))
			_S.define(_v20, "j", _S.binary("-", _S.read(_v20, "y"), _S.read(_v20, "y0")))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.read(_v20, "j")]), 0), func(): return _S.binary(">", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.read(_v20, "j")]), 1)), func(): return _S.binary("<", _S.call_value(_S.read(_v20, "at"), [_S.read(_v20, "i"), _S.binary("+", _S.read(_v20, "j"), 1)]), 0))):
				break
			_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.prop(_S.read(_v20, "ST"), 1) if _S.truth(_S.binary("===", _S.read(_v20, "n"), _S.read(_v20, "len"))) else _S.prop(_S.read(_v20, "ST"), 0))])
			if _S.truth(_S.binary("===", _S.read(_v20, "n"), 0)):
				_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("-", _S.read(_v20, "x"), _S.read(_v20, "dx")), _S.binary("-", _S.read(_v20, "y"), 1), _S.prop(_S.read(_v20, "ST"), 4)])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "n", 1, "+=", true)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "q", 1, "+=", true)
	for _v21 in _S.array([_S.binary("-", _S.unary("-", _S.read(_e, "W")), 3), _S.binary("+", _S.read(_e, "W"), 3)]):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "sx", _v21)
		var _v23 = _S.scope(_v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "y", _S.binary("-", _S.unary("-", _S.read(_v24, "H")), 2))
		while _S.truth(_S.binary("<", _S.read(_v24, "y"), _S.binary("+", _S.unary("-", _S.read(_v24, "H")), 7))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "g", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_v25, "y"), 0.35), _S.binary("*", _S.read(_v25, "ph"), 6)), 1), 1), 1))
			_S.define(_v25, "i", _S.binary("-", _S.invoke(_S.read(_v25, "Math"), "floor", [_S.read(_v25, "sx")]), _S.read(_v25, "x0")))
			_S.define(_v25, "j", _S.binary("-", _S.invoke(_S.read(_v25, "Math"), "floor", [_S.read(_v25, "y")]), _S.read(_v25, "y0")))
			if _S.truth(_S.binary(">=", _S.call_value(_S.read(_v25, "at"), [_S.read(_v25, "i"), _S.read(_v25, "j")]), 0)):
				_S.invoke(_S.read(_v25, "p"), "px", [_S.read(_v25, "sx"), _S.read(_v25, "y"), (_S.prop(_S.read(_v25, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v25, "g"), 0.3)) else _S.prop(_S.read(_v25, "C"), 3))])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "y", 1, "+=", true)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_p = _S.read(_parent,"p")
	var _n_ST = _S.read(_parent,"ST")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_k_b4 = (1 - _S.Bridge.hypot([(float((_n_x_b0 + 4))/(_n_W + 22)), (float((_n_y_b1 + _n_H))/20)]))
	if _S.truth((_n_k_b4 > 0)):
		_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_ST,0), (0.4 * minf(1,(_n_k_b4 * 3)))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_hgt = _S.read(_parent,"hgt")
	var _n_id = _S.read(_parent,"id")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return ((-1) if _S.truth(((((_n_i_b0 < 0) if _S.truth((_n_i_b0 < 0)) else (_n_j_b1 < 0)) if _S.truth(((_n_i_b0 < 0) if _S.truth((_n_i_b0 < 0)) else (_n_j_b1 < 0))) else (_n_i_b0 >= _n_w)) if _S.truth((((_n_i_b0 < 0) if _S.truth((_n_i_b0 < 0)) else (_n_j_b1 < 0)) if _S.truth(((_n_i_b0 < 0) if _S.truth((_n_i_b0 < 0)) else (_n_j_b1 < 0))) else (_n_i_b0 >= _n_w))) else (_n_j_b1 >= _n_hgt))) else _S.index_value(_n_id,((_n_j_b1 * _n_w) + _n_i_b0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_W_b4 = _S.arg(_args,4)
	var _n_S_b5 = _S.arg(_args,5)
	var _n_top_b6 = ((-_n_H_b3) - 6)
	_S.invoke(_n_p_b0,"shade",[((-_n_W_b4) - 3), _n_top_b6, (_n_W_b4 + 3), (-_n_H_b3), _S.function_value(_S.capture(_parent,{"top":_n_top_b6,"S":_n_S_b5,"H":_n_H_b3,"W":_n_W_b4,"ph":_n_ph_b2,"C":_n_C_b1,"this":_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_S = _S.read(_parent,"S")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_ph = _S.read(_parent,"ph")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_back_b3 = ((_n_top + 1.5) + (_S.NoiseKernels.tile_noise((_n_x_b0 * 0.3),4,0,0,(_n_S + 62)) * 1.5))
	var _n_v_b4 = (float((_n_y_b1 - _n_back_b3))/((-_n_H) - _n_back_b3))
	var _n_hw_b5 = ((_n_W + 2) - ((1 - _n_v_b4) * 3))
	if _S.truth(((_n_y_b1 < _n_back_b3) if _S.truth((_n_y_b1 < _n_back_b3)) else (absf(_n_x_b0) > _n_hw_b5))):
		return null
	var _n_n_b6 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.32),(((_n_y_b1 - _n_top) * 0.7) - (_n_ph * 8)),0,8,(_n_S + 3))
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_n_b6 > 0.66)) else (_S.index_value(_n_C,5) if _S.truth((_n_n_b6 > 0.4)) else (_S.index_value(_n_C,3) if _S.truth((_n_v_b4 < 0.5)) else _S.index_value(_n_C,4)))),"=")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_W_b4 = _S.arg(_args,4)
	var _n_S_b5 = _S.arg(_args,5)
	if true:
		var _n_x_b6 = (-_n_W_b4)
		while _S.truth((_n_x_b6 <= _n_W_b4)):
			var _n_g_b7 = _S.NoiseKernels.tile_noise((_n_x_b6 * 0.45),(_n_ph_b2 * 4),0,4,(_n_S_b5 + 4))
			_S.invoke(_n_p_b0,"px",[_n_x_b6, ((-_n_H_b3) - 1), _S.index_value(_n_C_b1,4)])
			_S.invoke(_n_p_b0,"px",[_n_x_b6, (-_n_H_b3), _n_WHITE])
			_S.invoke(_n_p_b0,"px",[_n_x_b6, ((-_n_H_b3) + 1), (_S.index_value(_n_C_b1,6) if _S.truth((_n_g_b7 > 0.2)) else _S.index_value(_n_C_b1,5))])
			_n_x_b6 += 1.0
	_S.invoke(_n_p_b0,"glowLine",[(-_n_W_b4), (-_n_H_b3), _n_W_b4, (-_n_H_b3), 6, _S.index_value(_n_C_b1,6), 0.18])
	_S.invoke(_n_p_b0,"glow",[0, (-_n_H_b3), 34, _S.index_value(_n_C_b1,5), 0.2])
	_S.call_value(_n_cycle,[(_n_ph_b2 * _n_D), _n_D, 4, (_n_S_b5 + 5), 0.36, _S.function_value(_S.capture(_parent,{"W":_n_W_b4,"p":_n_p_b0,"H":_n_H_b3,"C":_n_C_b1,"this":_this}),"_f11")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = sin((float((PI * _n_age_b0))/_n_life_b1))
	var _n_x_b4 = _S.invoke(_n_r_b2,"range",[(-_n_W), _n_W])
	if _S.truth((_n_k_b3 > 0.5)):
		for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_1 = _iter_0
			var _n_dx_b5 = _S.prop(_tuple_1,0)
			var _n_dy_b6 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p,"px",[(_n_x_b4 + _n_dx_b5), ((-_n_H) + _n_dy_b6), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b4, (-_n_H), 6, _S.index_value(_n_C,5), (0.4 * _n_k_b3)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_POOL = _S.read(_parent,"POOL")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_W_b3 = _S.arg(_args,3)
	var _n_S_b4 = _S.arg(_args,4)
	var _tuple_0 = _n_POOL
	var _n_RX_b5 = _S.prop(_tuple_0,0)
	var _n_RY_b6 = _S.prop(_tuple_0,1)
	var _n_cy_b7 = 2
	var _n_T_b8 = (_n_ph_b2 * _n_TAU)
	var _n_cols_b9 = []
	if true:
		var _n_X_b10 = (-_n_RX_b5)
		while _S.truth((_n_X_b10 < _n_RX_b5)):
			var _n_x_b11 = (_n_X_b10 + 0.5)
			_S.invoke(_n_cols_b9,"push",[[sin(((_n_x_b11 * 0.11) - (_n_T_b8 * 2))), ((sin((_n_T_b8 + (_n_x_b11 * 0.05))) * 1.4) + (_n_x_b11 * 0.13))]])
			_n_X_b10 += 1.0
	if true:
		var _n_Y_b12 = floori((_n_cy_b7 - _n_RY_b6))
		while _S.truth((_n_Y_b12 < (_n_cy_b7 + _n_RY_b6))):
			var _n_y_b13 = (_n_Y_b12 + 0.5)
			var _n_dy_b14 = (float((_n_y_b13 - _n_cy_b7))/_n_RY_b6)
			var _n_sy_b15 = sin(((_n_y_b13 * 0.5) + _n_T_b8))
			if true:
				var _n_X_b16 = (-_n_RX_b5)
				while _S.truth((_n_X_b16 < _n_RX_b5)):
					var _n_x_b17 = (_n_X_b16 + 0.5)
					var _n_dx_b18 = (float(_n_x_b17)/_n_RX_b5)
					var _n_d_b19 = ((_n_dx_b18 * _n_dx_b18) + (_n_dy_b14 * _n_dy_b14))
					if _S.truth((_n_d_b19 > 1)):
						_n_X_b16 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[_n_x_b17, _n_y_b13, (_S.index_value(_n_C_b1,2) if _S.truth((_n_d_b19 < 0.12)) else _S.index_value(_n_C_b1,1)), (0.62 * minf(1,((1 - _n_d_b19) * 4)))])
					var _tuple_1 = _S.index_value(_n_cols_b9,(_n_X_b16 + _n_RX_b5))
					var _n_cx1_b20 = _S.prop(_tuple_1,0)
					var _n_cx2_b21 = _S.prop(_tuple_1,1)
					var _n_u_b22 = ((_n_x_b17 * 0.2) + (1.8 * _n_sy_b15))
					var _n_w_b23 = ((_n_y_b13 * 0.55) + (1.8 * _n_cx1_b20))
					var _n_f_b24 = ((maxf(0,(1 - (absf((sin(_n_u_b22) + sin(_n_w_b23))) * 2.6))) + (0.6 * maxf(0,(1 - (absf(sin((_n_cx2_b21 + (_n_y_b13 * 0.3)))) * 3))))) * (1 - _n_d_b19))
					if _S.truth((_n_f_b24 > 0.5)):
						_S.invoke(_n_p_b0,"light",[_n_x_b17, _n_y_b13, _S.index_value(_n_C_b1,5), (0.18 * _n_f_b24)])
					_n_X_b16 += 1.0
			_n_Y_b12 += 1.0
	if true:
		var _n_i_b25 = 0
		while _S.truth((_n_i_b25 < 7)):
			var _n_a_b26 = (PI * (1.12 + (0.76 * (float((_n_i_b25 + 0.5))/7))))
			var _n_x_b27 = ((cos(_n_a_b26) * _n_RX_b5) * 0.96)
			var _n_y_b28 = (_n_cy_b7 + ((sin(_n_a_b26) * _n_RY_b6) * 0.96))
			var _n_g_b29 = sin((((_n_ph_b2 * _n_TAU) * 2) + (_n_i_b25 * 2.4)))
			if _S.truth((_n_g_b29 > 0.2)):
				_S.invoke(_n_p_b0,"px",[_n_x_b27, _n_y_b28, (_S.index_value(_n_C_b1,6) if _S.truth((_n_g_b29 > 0.8)) else _S.index_value(_n_C_b1,4))])
			_n_i_b25 += 1.0
	_S.invoke(_n_p_b0,"shade",[((-_n_W_b3) - 3), 3, (_n_W_b3 + 3), 10, _S.function_value(_S.capture(_parent,{"ph":_n_ph_b2,"S":_n_S_b4,"W":_n_W_b3,"C":_n_C_b1,"this":_this}),"_f13")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_W = _S.read(_parent,"W")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.9),(((_n_y_b1 - 3) * 0.35) + (_n_ph * 6)),0,6,(_n_S + 6))
	var _n_k_b4 = (1 - (float((_n_y_b1 - 3))/7))
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > ((_n_W + 2) - ((_n_y_b1 - 3) * 0.4))),func():return (_n_n_b3 < (0.25 + ((1 - _n_k_b4) * 0.4))))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth(((_n_k_b4 > 0.6) if _S.truth((_n_n_b3 > 0.6)) else (_n_n_b3 > 0.6))) else _S.index_value(_n_C,5)),"=")
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.arg(_args,3)
	var _n_W_b4 = _S.arg(_args,4)
	var _n_S_b5 = _S.arg(_args,5)
	var _n_R_b6 = (_n_W_b4 + 10)
	_S.invoke(_n_p_b0,"shade",[(-_n_R_b6), (-13), _n_R_b6, 3, _S.function_value(_S.capture(_parent,{"ph":_n_ph_b3,"S":_n_S_b5,"R":_n_R_b6,"C":_n_C_b1,"this":_this}),"_f15")])
	_S.call_value(_n_cycle,[_n_t_b2, _n_D, 30, (_n_S_b5 + 10), 0.7, _S.function_value(_S.capture(_parent,{"W":_n_W_b4,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f16")])
	_S.call_value(_n_cycle,[_n_t_b2, _n_D, 18, (_n_S_b5 + 11), 1, _S.function_value(_S.capture(_parent,{"W":_n_W_b4,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f17")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_ax_b3 = absf(_n_x_b0)
	var _n_lump_b4 = ((_S.NoiseKernels.tile_noise((_n_x_b0 * 0.22),(_n_ph * 6),0,6,(_n_S + 7)) * 3) + (_S.NoiseKernels.tile_noise(((_n_x_b0 * 0.55) + 9),(_n_ph * 12),0,12,(_n_S + 8)) * 1.5))
	var _n_top_b5 = (((-8) + _n_lump_b4) + (pow((float(_n_ax_b3)/_n_R),2) * 7))
	if _S.truth(_S.logical("||",(_n_ax_b3 > (_n_R - (maxf(0,((-_n_y_b1) - 1)) * 0.6))),func():return (_n_y_b1 < _n_top_b5))):
		return null
	var _n_n_b6 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.5),(((_n_y_b1 - _n_top_b5) * 0.5) - (_n_ph * 10)),0,10,(_n_S + 9))
	var _n_boil_b7 = _S.NoiseKernels.tile_noise(((_n_x_b0 * 0.42) + 3),((_n_y_b1 * 0.42) - (_n_ph * 8)),0,8,(_n_S + 12))
	var _n_u_b8 = (_n_y_b1 - _n_top_b5)
	if _S.truth((_n_y_b1 > 1)):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,5) if _S.truth((_n_n_b6 > 0)) else _S.index_value(_n_C,4)),"=")
	else:
		if _S.truth((_n_u_b8 < 1.2)):
			_S.set_prop(_n_out_b2,"c",_n_WHITE,"=")
		else:
			if _S.truth((_n_boil_b7 < (-0.3))):
				_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,4) if _S.truth((_n_u_b8 > 4)) else _S.index_value(_n_C,5)),"=")
			else:
				if _S.truth((_n_boil_b7 < (-0.05))):
					_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,6),"=")
				else:
					_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_n_b6 > (-0.2))) else _S.index_value(_n_C,6)),"=")
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_ease = _S.read(_parent,"ease")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_billow = _S.read(_parent,"billow")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_side_b4 = _S.invoke(_n_r_b2,"sign",[])
	var _n_x0_b5 = (_S.invoke(_n_r_b2,"range",[(-_n_W), _n_W]) * 0.9)
	var _n_sp_b6 = _S.invoke(_n_r_b2,"range",[2, 8])
	var _n_up_b7 = _S.invoke(_n_r_b2,"range",[2, 8])
	var _n_x_b8 = (_n_x0_b5 + ((_n_side_b4 * _S.invoke(_n_ease,"outCubic",[_n_k_b3])) * _n_sp_b6))
	var _n_y_b9 = ((-_S.invoke(_n_r_b2,"range",[2, 5])) - (_S.invoke(_n_ease,"outCubic",[_n_k_b3]) * _n_up_b7))
	var _n_rad_b10 = (_S.invoke(_n_r_b2,"range",[1.4, 3]) * pow(sin((PI * _n_k_b3)),0.7))
	if _S.truth((_n_rad_b10 > 0.6)):
		_S.call_value(_n_billow,[_n_p, _n_x_b8, _n_y_b9, _n_rad_b10, _n_C])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_SY = _S.read(_parent,"SY")
	var _n_G = _S.read(_parent,"G")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_bead = _S.read(_parent,"bead")
	var _n_ring = _S.read(_parent,"ring")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_side_b3 = _S.invoke(_n_r_b2,"sign",[])
	var _n_x0_b4 = (_n_side_b3 * _S.invoke(_n_r_b2,"range",[2, (_n_W + 4)]))
	var _n_vx_b5 = (_n_side_b3 * _S.invoke(_n_r_b2,"range",[12, 60]))
	var _n_vy_b6 = (-_S.invoke(_n_r_b2,"range",[70, 150]))
	var _n_z_b7 = _S.invoke(_n_r_b2,"range",[(-3), 9])
	var _n_s_b8 = (2 if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.3)) else 1)
	var _n_land_b9 = (_n_z_b7 * _n_SY)
	var _n_tl_b10 = (float(((-_n_vy_b6) + sqrt(((_n_vy_b6 * _n_vy_b6) + ((2 * _n_G) * (_n_land_b9 + 5))))))/_n_G)
	if _S.truth((_n_age_b0 < _n_tl_b10)):
		_S.call_value(_n_bead,[_n_p, (_n_x0_b4 + (_n_vx_b5 * _n_age_b0)), (((-5) + (_n_vy_b6 * _n_age_b0)) + (((0.5 * _n_G) * _n_age_b0) * _n_age_b0)), _n_vx_b5, (_n_vy_b6 + (_n_G * _n_age_b0)), _n_s_b8, _n_C])
	else:
		if _S.truth((_n_age_b0 < (_n_tl_b10 + 0.35))):
			_S.call_value(_n_ring,[_n_p, (_n_x0_b4 + (_n_vx_b5 * _n_tl_b10)), _n_land_b9, (1 + ((_n_age_b0 - _n_tl_b10) * 12)), _n_SY, (1 - (float((_n_age_b0 - _n_tl_b10))/0.35)), _n_C, {"n":1}])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	_S.call_value(_n_cycle,[_n_t_b2, _n_D, _n_n_b4, (_n_S_b3 + _n_seed_b5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f19"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f20")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.8, 2.8])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_side_b4 = _S.invoke(_n_r_b2,"sign",[])
	var _n_drift_b5 = _S.invoke(_n_ease,"outCubic",[_n_k_b3])
	var _n_x_b6 = (_n_side_b4 * (_S.invoke(_n_r_b2,"range",[3, 12]) + (_n_drift_b5 * _S.invoke(_n_r_b2,"range",[24, 48]))))
	var _n_y_b7 = ((-_S.invoke(_n_r_b2,"range",[2, 7])) - (_n_k_b3 * _S.invoke(_n_r_b2,"range",[3, 12])))
	var _n_rad_b8 = (_S.invoke(_n_r_b2,"range",[4, 6]) + (_n_k_b3 * _S.invoke(_n_r_b2,"range",[5, 9])))
	var _n_a_b9 = ((_S.invoke(_n_r_b2,"range",[0.2, 0.3]) * minf(1,(float(_n_k_b3)/0.12))) * pow((1 - _n_k_b3),1.7))
	_S.invoke(_n_p,"disc",[_n_x_b6, _n_y_b7, _n_rad_b8, _S.index_value(_n_C,6), _S.function_value(_S.capture(_parent,{"a":_n_a_b9,"this":_n_this}),"_f21")])
	if _S.truth((_n_a_b9 > 0.05)):
		_S.invoke(_n_p,"glow",[_n_x_b6, _n_y_b7, (_n_rad_b8 * 1.2), _S.index_value(_n_C,4), (0.35 * _n_a_b9)])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_a * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_pool = _S.read(_parent,"pool")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_mist = _S.read(_parent,"mist")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_W_b5 = _S.named_value(_n_o_b2,"width")
	_S.call_value(_n_pool,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_W_b5, _S.named_value(_n_o_b2,"seed")])
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 3)):
			var _n_f_b7 = fmod((_n_ph_b4 + (float(_n_i_b6)/3)),1)
			_S.call_value(_n_ring,[_n_p_b0, 0, 1, ((_n_W_b5 + 6) + (_n_f_b7 * 38)), _n_SY, (0.95 * pow((1 - _n_f_b7),1.5)), _n_C_b3, {"n":1,"half":(-1),"seed":(_n_i_b6 + 1)}])
			_n_i_b6 += 1.0
	_S.call_value(_n_mist,[_n_p_b0, _n_C_b3, _n_t_b1, _S.named_value(_n_o_b2,"seed"), 7, 20])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_river = _S.read(_parent,"river")
	var _n_outcrop = _S.read(_parent,"outcrop")
	var _n_sheet = _S.read(_parent,"sheet")
	var _n_curl = _S.read(_parent,"curl")
	var _n_foam = _S.read(_parent,"foam")
	var _n_mist = _S.read(_parent,"mist")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_H_b5 = _S.named_value(_n_o_b2,"height")
	var _n_W_b6 = _S.named_value(_n_o_b2,"width")
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_T_b8 = (_n_ph_b4 * _n_TAU)
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 3)):
			var _n_f_b10 = fmod((_n_ph_b4 + (float(_n_i_b9)/3)),1)
			_S.call_value(_n_ring,[_n_p_b0, 0, 1, ((_n_W_b6 + 6) + (_n_f_b10 * 38)), _n_SY, (0.95 * pow((1 - _n_f_b10),1.5)), _n_C_b3, {"n":1,"half":1,"seed":(_n_i_b9 + 1),"glint":((1 - (_n_f_b10 * 2.5)) if _S.truth((_n_f_b10 < 0.4)) else 0)}])
			_n_i_b9 += 1.0
	_S.call_value(_n_river,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_H_b5, _n_W_b6, _n_S_b7])
	if _S.truth(_S.named_value(_n_o_b2,"ledge")):
		_S.call_value(_n_outcrop,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_H_b5, _n_W_b6, _n_S_b7])
	_S.call_value(_n_sheet,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_H_b5, _n_W_b6, _n_S_b7])
	_S.call_value(_n_curl,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_H_b5, _n_W_b6, _n_S_b7])
	_S.call_value(_n_foam,[_n_p_b0, _n_C_b3, _n_t_b1, _n_ph_b4, _n_W_b6, _n_S_b7])
	_S.call_value(_n_mist,[_n_p_b0, _n_C_b3, _n_t_b1, _n_S_b7, 5, 21])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 12, (_n_S_b7 + 50), _S.function_value(_S.capture(_parent,{"this":_this}),"_f24"), _S.function_value(_S.capture(_parent,{"H":_n_H_b5,"W":_n_W_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f25")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 34, (_n_S_b7 + 51), _S.function_value(_S.capture(_parent,{"this":_this}),"_f26"), _S.function_value(_S.capture(_parent,{"W":_n_W_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f27")])
	_S.invoke(_n_p_b0,"glowLine",[0, ((-_n_H_b5) + 6), 0, (-8), 26, _S.index_value(_n_C_b3,4), 0.12])
	_S.invoke(_n_p_b0,"glow",[0, (-5), 40, _S.index_value(_n_C_b3,5), (0.32 + (0.05 * sin((_n_T_b8 * 2))))])
	_S.invoke(_n_p_b0,"glow",[0, 4, 50, _S.index_value(_n_C_b3,3), 0.14])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.2, 0.4])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = sin((float((PI * _n_age_b0))/_n_life_b1))
	var _n_low_b4 = (_S.invoke(_n_r_b2,"next",[]) < 0.45)
	var _n_d_b5 = ((_n_H - _S.invoke(_n_r_b2,"range",[4, 16])) if _S.truth(_n_low_b4) else _S.invoke(_n_r_b2,"range",[12, (_n_H - 16)]))
	var _n_x_b6 = (_S.invoke(_n_r_b2,"range",[((-_n_W) - 10), (_n_W + 10)]) if _S.truth(_n_low_b4) else (_S.invoke(_n_r_b2,"range",[(-0.8), 0.8]) * _S.call_value(_n_halfW,[_n_W, _n_d_b5, _n_H])))
	var _n_y_b7 = (((-_n_H) + _n_d_b5) - ((float(_n_age_b0)/_n_life_b1) * (6 if _S.truth(_n_low_b4) else (-10))))
	_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b7, _n_WHITE])
	if _S.truth((_n_k_b3 > 0.55)):
		for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_1 = _iter_0
			var _n_dx_b8 = _S.prop(_tuple_1,0)
			var _n_dy_b9 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p,"px",[(_n_x_b6 + _n_dx_b8), (_n_y_b7 + _n_dy_b9), _S.index_value(_n_C,6)])
	if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < 0.5) if _S.truth((_n_k_b3 > 0.85)) else (_n_k_b3 > 0.85))):
		for _iter_2 in _S.array([[2, 0], [(-2), 0], [0, 2], [0, (-2)]]):
			var _tuple_3 = _iter_2
			var _n_dx_b10 = _S.prop(_tuple_3,0)
			var _n_dy_b11 = _S.prop(_tuple_3,1)
			_S.invoke(_n_p,"px",[(_n_x_b6 + _n_dx_b10), (_n_y_b7 + _n_dy_b11), _S.index_value(_n_C,5)])
	_S.invoke(_n_p,"glow",[_n_x_b6, _n_y_b7, 5, _S.index_value(_n_C,5), (0.35 * _n_k_b3)])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.9, 1.6])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_side_b4 = _S.invoke(_n_r_b2,"sign",[])
	var _n_x_b5 = ((_n_side_b4 * (_S.invoke(_n_r_b2,"range",[0, (_n_W + 6)]) + (_n_k_b3 * _S.invoke(_n_r_b2,"range",[6, 22])))) + (sin(((_n_age_b0 * 5) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 1.2))
	var _n_y_b6 = ((-_S.invoke(_n_r_b2,"range",[3, 10])) - (_n_k_b3 * _S.invoke(_n_r_b2,"range",[10, 34])))
	if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < ((_n_k_b3 - 0.7) * 3.3)) if _S.truth((_n_k_b3 > 0.7)) else (_n_k_b3 > 0.7))):
		return null
	_S.invoke(_n_p,"px",[_n_x_b5, _n_y_b6, (_n_WHITE if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < 0.5) if _S.truth((_n_k_b3 < 0.4)) else (_n_k_b3 < 0.4))) else _S.index_value(_n_C,6))])
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_W_b0 = _S.arg(_args,0)
	var _n_d_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	return (_n_W_b0 + (3.2 * pow(clampf((float(_n_d_b1)/_n_H_b2),0.0,1.0),1.6)))
	return null
