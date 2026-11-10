@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/rain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f2":"weather_rain_back","_f10":"weather_rain_floor","_f13":"weather_rain_mist"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "crown", _S.import_value("fx/weather/_lib.js", "crown"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "pools", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "layer", _S.function_value(_e, "_f5"))
	_S.define(_e, "rings", _S.function_value(_e, "_f9"))
	_S.define(_e, "floor", _S.function_value(_e, "_f10"))
	_S.define(_e, "mist", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Rain"}, {"desc": "Slanted rain at four depths: far drops fade into the dark, near ones glint and splash, drops ring the puddles and a low mist drifts over the wet floor."}, {"tags": ["weather", "rain", "storm", "water", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0e1322", "#1a2440", "#283a5e", "#3a5482", "#5674a8", "#84a6d6", "#c0dcf8", "#f2f8ff"]}, {"density": 1}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 8)
	_S.define(_e, "SLANT", _S.unary("-", 0.2))
	_S.define(_e, "UX", _S.binary("/", _S.read(_e, "SLANT"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "UY", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 200}, {"m": [10, 13]}, {"len": 2}, {"col": [2, 2, 3]}, {"stop": [_S.unary("-", 80), _S.unary("-", 6)]}]), _S.merge([{"n": 150}, {"m": [14, 17]}, {"len": 4}, {"col": [2, 3, 4]}, {"stop": [_S.unary("-", 45), _S.unary("-", 2)]}]), _S.merge([{"n": 96}, {"m": [19, 23]}, {"len": 7}, {"col": [3, 4, 5]}, {"z": [0, 1.4]}, {"size": [0.15, 0.4]}]), _S.merge([{"n": 42}, {"m": [25, 29]}, {"len": 13}, {"col": [3, 5, 7]}, {"z": [2, 6.5]}, {"size": [0.6, 1]}, {"near": true}])])
	_S.define(_e, "poolAt", _S.function_value(_e, "_f16"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_S_b0 = _S.arg(_args,0)
	return _S.invoke(_n_Array,"from",[{"length":5}, _S.function_value(_S.capture(_parent,{"S":_n_S_b0,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_x_b2 = (((-150) + (_n_i_b1 * 66)) + (_S.MathFX.rand([_n_S,_n_i_b1,61]) * 30))
	var _n_w_b3 = (16 + (_S.MathFX.rand([_n_S,_n_i_b1,63]) * 26))
	return {"x0":_n_x_b2,"x1":(_n_x_b2 + _n_w_b3),"y":(3 + floori((_S.MathFX.rand([_n_S,_n_i_b1,62]) * 3)))}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_pools = _S.read(_parent,"pools")
	var _n_pass = _S.read(_parent,"pass")
	var _n_floor = _S.read(_parent,"floor")
	var _n_layer = _S.read(_parent,"layer")
	var _n_mist = _S.read(_parent,"mist")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_n_t_b1 = (float(floori((_n_t_b1 * 30000)+0.5))/30000)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_P_b6 = _S.call_value(_n_pools,[_n_S_b4])
	var _n_haze_b7 = _S.ColorFX.mix(_S.index_value(_n_C_b5,0),_S.index_value(_n_C_b5,1),0.6)
	_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-170), (-0.5), _S.function_value(_S.capture(_parent,{"haze":_n_haze_b7,"this":_this}),"_f3")])
	_S.call_value(_n_floor,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _n_P_b6])
	if true:
		var _n_L_b8 = 0
		while _S.truth((_n_L_b8 < 3)):
			_S.call_value(_n_layer,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _n_P_b6, _n_L_b8, _S.named_value(_n_o_b2,"density")])
			_n_L_b8 += 1.0
	_S.call_value(_n_mist,[_n_p_b0, _n_t_b1, _n_S_b4, _n_C_b5])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_haze = _S.read(_parent,"haze")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	_S.set_prop(_n_out_b2,"c",_n_haze,"=")
	_S.set_prop(_n_out_b2,"a",(0.3 + (0.26 * _S.MathFX.smooth((-170),0,_n_y_b1))),"=")
	_S.set_prop(_n_out_b2,"b",1,"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_pools = _S.read(_parent,"pools")
	var _n_layer = _S.read(_parent,"layer")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_n_t_b1 = (float(floori((_n_t_b1 * 30000)+0.5))/30000)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_P_b6 = _S.call_value(_n_pools,[_n_S_b4])
	_S.call_value(_n_layer,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _n_P_b6, 3, _S.named_value(_n_o_b2,"density")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_P_b4 = _S.arg(_args,4)
	var _n_L_b5 = _S.arg(_args,5)
	var _n_density_b6 = _S.arg(_args,6)
	var _n_Ly_b7 = _S.index_value(_n_LAYERS,_n_L_b5)
	var _n_sd_b8 = ((_n_S_b2 * 11) + _n_L_b5)
	var _tuple_0 = _S.invoke(_S.named_value(_n_Ly_b7,"col"),"map",[_S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f6")])
	var _n_c0_b9 = _S.prop(_tuple_0,0)
	var _n_c1_b10 = _S.prop(_tuple_0,1)
	var _n_c2_b11 = _S.prop(_tuple_0,2)
	var _n_len_b12 = _S.named_value(_n_Ly_b7,"len")
	var _n_n_b13 = floori((_S.named_value(_n_Ly_b7,"n") * _n_density_b6)+0.5)
	var _n_G_b14 = _S.call_value(_n_field,[(_n_S_b2 + 21), 256, 128, [4, 8, 16]])
	var _n_sweep_b15 = (float((256 * _n_t_b1))/_n_D)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, _n_n_b13, _n_sd_b8, _S.index_value(_S.named_value(_n_Ly_b7,"m"),0), _S.index_value(_S.named_value(_n_Ly_b7,"m"),1), _S.function_value(_S.capture(_parent,{"L":_n_L_b5,"sd":_n_sd_b8,"G":_n_G_b14,"sweep":_n_sweep_b15,"Ly":_n_Ly_b7,"len":_n_len_b12,"q":_n_q_b0,"c2":_n_c2_b11,"c1":_n_c1_b10,"c0":_n_c0_b9,"C":_n_C_b3,"P":_n_P_b4,"this":_this}),"_f7")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,_n_i_b0)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_L = _S.read(_parent,"L")
	var _n_sd = _S.read(_parent,"sd")
	var _n_G = _S.read(_parent,"G")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_Ly = _S.read(_parent,"Ly")
	var _n_len = _S.read(_parent,"len")
	var _n_SLANT = _S.read(_parent,"SLANT")
	var _n_q = _S.read(_parent,"q")
	var _n_c2 = _S.read(_parent,"c2")
	var _n_UX = _S.read(_parent,"UX")
	var _n_UY = _S.read(_parent,"UY")
	var _n_c1 = _S.read(_parent,"c1")
	var _n_c0 = _S.read(_parent,"c0")
	var _n_this = _S.read(_parent,"this")
	var _n_C = _S.read(_parent,"C")
	var _n_D = _S.read(_parent,"D")
	var _n_poolAt = _S.read(_parent,"poolAt")
	var _n_P = _S.read(_parent,"P")
	var _n_rings = _S.read(_parent,"rings")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_crown = _S.read(_parent,"crown")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	if _S.truth(((_S.MathFX.rand([_n_sd,_n_i_b3,_n_j_b4,7]) > (0.35 + (1.3 * (_S.Accelerators.Weather.sample_at(_n_G,((((-166) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_j_b4,2]) * 332)) * 0.8) + _n_sweep),(9 + (_n_L * 40))) - 0.32)))) if _S.truth((_n_L < 2)) else (_n_L < 2))):
		return null
	var _n_end_b5 = ((_S.index_value(_S.named_value(_n_Ly,"z"),0) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_j_b4,1]) * (_S.index_value(_S.named_value(_n_Ly,"z"),1) - _S.index_value(_S.named_value(_n_Ly,"z"),0)))) if _S.truth(_S.named_value(_n_Ly,"z")) else (_S.index_value(_S.named_value(_n_Ly,"stop"),0) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_j_b4,1]) * (_S.index_value(_S.named_value(_n_Ly,"stop"),1) - _S.index_value(_S.named_value(_n_Ly,"stop"),0)))))
	var _n_y0_b6 = ((-172) - _n_len)
	var _n_y_b7 = (_n_y0_b6 + ((_n_end_b5 - _n_y0_b6) * _n_u_b0))
	var _n_x_b8 = (((-166) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_j_b4,2]) * 332)) - ((_n_end_b5 - _n_y_b7) * _n_SLANT))
	var _n_a_b9 = (1 if _S.truth(_S.named_value(_n_Ly,"z")) else minf(1,((1 - _n_u_b0) * 5)))
	if _S.truth((_n_len <= 2)):
		_S.invoke(_n_q,"dot",[_n_x_b8, _n_y_b7, _n_c2, _n_a_b9])
		_S.invoke(_n_q,"dot",[(_n_x_b8 - _n_UX), (_n_y_b7 - _n_UY), _n_c1, (_n_a_b9 * 0.8)])
	else:
		_S.invoke(_n_q,"line",[(_n_x_b8 - (_n_UX * _n_len)), (_n_y_b7 - (_n_UY * _n_len)), (_n_x_b8 - ((_n_UX * _n_len) * 0.45)), (_n_y_b7 - ((_n_UY * _n_len) * 0.45)), _n_c0, _S.function_value(_S.capture(_parent,{"a":_n_a_b9,"this":_n_this}),"_f8")])
		_S.invoke(_n_q,"line",[(_n_x_b8 - ((_n_UX * _n_len) * 0.45)), (_n_y_b7 - ((_n_UY * _n_len) * 0.45)), (_n_x_b8 - _n_UX), (_n_y_b7 - _n_UY), _n_c1, _n_a_b9])
		_S.invoke(_n_q,"dot",[_n_x_b8, _n_y_b7, _n_c2, _n_a_b9])
	if _S.truth(_S.named_value(_n_Ly,"near")):
		_S.invoke(_n_q,"glow",[_n_x_b8, (_n_y_b7 - 2), 4, _S.index_value(_n_C,5), 0.12])
	if _S.truth(not _S.truth(_S.named_value(_n_Ly,"z"))):
		return null
	var _n_dur_b10 = (float(_n_D)/_n_m_b2)
	if true:
		var _n_back_b11 = 1
		while _S.truth((_n_back_b11 < 4)):
			var _n_age_b12 = ((_n_u_b0 * _n_dur_b10) + ((_n_back_b11 - 1) * _n_dur_b10))
			if _S.truth((_n_age_b12 > 0.7)):
				break
			var _n_jp_b13 = _S.call_value(_n_wrap,[(_n_k_b1 - _n_back_b11), _n_m_b2])
			var _n_z_b14 = (_S.index_value(_S.named_value(_n_Ly,"z"),0) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_jp_b13,1]) * (_S.index_value(_S.named_value(_n_Ly,"z"),1) - _S.index_value(_S.named_value(_n_Ly,"z"),0))))
			var _n_xp_b15 = ((-166) + (_S.MathFX.rand([_n_sd,_n_i_b3,_n_jp_b13,2]) * 332))
			if _S.truth((_S.MathFX.rand([_n_sd,_n_i_b3,_n_jp_b13,5]) > (1 if _S.truth(_S.named_value(_n_Ly,"near")) else 0.7))):
				_n_back_b11 += 1.0
				continue
			var _n_size_b16 = (_S.index_value(_S.named_value(_n_Ly,"size"),0) + ((float((_n_z_b14 - _S.index_value(_S.named_value(_n_Ly,"z"),0)))/(_S.index_value(_S.named_value(_n_Ly,"z"),1) - _S.index_value(_S.named_value(_n_Ly,"z"),0))) * (_S.index_value(_S.named_value(_n_Ly,"size"),1) - _S.index_value(_S.named_value(_n_Ly,"size"),0))))
			var _n_pool_b17 = (_S.call_value(_n_poolAt,[_n_P, _n_xp_b15, _n_z_b14]) if _S.truth(_S.named_value(_n_Ly,"near")) else _S.named_value(_n_Ly,"near"))
			if _S.truth(_n_pool_b17):
				_S.call_value(_n_rings,[_n_q, _n_xp_b15, _n_pool_b17, _n_age_b12, _n_C])
			else:
				if _S.truth(_S.logical("&&",_S.logical("&&",_S.call_value(_n_crown,[_n_q, _n_xp_b15, _n_z_b14, _n_age_b12, _n_size_b16, {"hot":_S.index_value(_n_C,6),"cool":_S.index_value(_n_C,4),"white":_n_WHITE}, _S.MathFX.rand([_n_sd,_n_i_b3,_n_jp_b13,4])]),func():return _S.named_value(_n_Ly,"near")),func():return (_n_age_b12 < 0.1))):
					_S.invoke(_n_q,"glow",[_n_xp_b15, (_n_z_b14 - 1), 5, _S.index_value(_n_C,5), (0.3 * (1 - (float(_n_age_b12)/0.1)))])
			_n_back_b11 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_a * (0.35 + (0.65 * _n_v_b0)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_pool_b2 = _S.arg(_args,2)
	var _n_age_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_X_b5 = floori(_n_x_b1+0.5)
	var _n_y_b6 = _S.named_value(_n_pool_b2,"y")
	if _S.truth((_n_age_b3 < 0.05)):
		_S.invoke(_n_q_b0,"px",[_n_X_b5, _n_y_b6, _S.index_value(_n_C_b4,7)])
	if true:
		var _n_r_b7 = 0
		while _S.truth((_n_r_b7 < 2)):
			var _n_a_b8 = (_n_age_b3 - (_n_r_b7 * 0.16))
			var _n_u_b9 = (float(_n_a_b8)/0.5)
			if _S.truth(((_n_u_b9 <= 0) if _S.truth((_n_u_b9 <= 0)) else (_n_u_b9 >= 1))):
				_n_r_b7 += 1.0
				continue
			var _n_w_b10 = floori((1 + (7 * sqrt(_n_u_b9)))+0.5)
			var _n_c_b11 = (_S.index_value(_n_C_b4,6) if _S.truth((not _S.truth(_n_r_b7) if _S.truth((_n_u_b9 < 0.4)) else (_n_u_b9 < 0.4))) else _S.index_value(_n_C_b4,5))
			for _iter_0 in _S.array([(-1), 1]):
				var _n_s_b12 = _iter_0
				if true:
					var _n_d_b13 = 0
					while _S.truth((_n_d_b13 < (2 if _S.truth((_n_u_b9 < 0.6)) else 1))):
						var _n_px_b14 = (_n_X_b5 + (_n_s_b12 * (_n_w_b10 - _n_d_b13)))
						if _S.truth(((_n_px_b14 < _S.named_value(_n_pool_b2,"x1")) if _S.truth((_n_px_b14 > _S.named_value(_n_pool_b2,"x0"))) else (_n_px_b14 > _S.named_value(_n_pool_b2,"x0")))):
							_S.invoke(_n_q_b0,"px",[_n_px_b14, _n_y_b6, _n_c_b11])
						_n_d_b13 += 1.0
			_n_r_b7 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_P_b4 = _S.arg(_args,4)
	_S.call_value(_n_pass,[_n_q_b0, _n_meta, 0, 9.5, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"P":_n_P_b4,"this":_this}),"_f11")])
	_S.invoke(_n_P_b4,"forEach",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"q":_n_q_b0,"C":_n_C_b3,"this":_this}),"_f12")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_P = _S.read(_parent,"P")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	if _S.truth((_n_y_b1 < 1)):
		_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,4),"=")
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,5),"=")
		_S.set_prop(_n_out_b2,"k",0.08,"=")
		return null
	if _S.truth((_n_y_b1 < 2)):
		_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,1),"=")
		return null
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,0),"=")
	_S.set_prop(_n_out_b2,"a",0.55,"=")
	_S.set_prop(_n_out_b2,"b",1,"=")
	for _iter_0 in _S.array(_n_P):
		var _n_p_b3 = _iter_0
		if _S.truth((_S.binary("===",floori(_n_y_b1),_S.named_value(_n_p_b3,"y")) if _S.truth(((_n_x_b0 < _S.named_value(_n_p_b3,"x1")) if _S.truth((_n_x_b0 >= _S.named_value(_n_p_b3,"x0"))) else (_n_x_b0 >= _S.named_value(_n_p_b3,"x0")))) else ((_n_x_b0 < _S.named_value(_n_p_b3,"x1")) if _S.truth((_n_x_b0 >= _S.named_value(_n_p_b3,"x0"))) else (_n_x_b0 >= _S.named_value(_n_p_b3,"x0"))))):
			var _n_edge_b4 = ((_n_x_b0 < (_S.named_value(_n_p_b3,"x0") + 2)) if _S.truth((_n_x_b0 < (_S.named_value(_n_p_b3,"x0") + 2))) else (_n_x_b0 >= (_S.named_value(_n_p_b3,"x1") - 2)))
			_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,3) if _S.truth(_n_edge_b4) else _S.index_value(_n_C,4)),"=")
			_S.set_prop(_n_out_b2,"a",1,"=")
			_S.set_prop(_n_out_b2,"b",0,"=")
			_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,5),"=")
			_S.set_prop(_n_out_b2,"k",0.06,"=")
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_q = _S.read(_parent,"q")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_gx_b2 = floori(((_S.named_value(_n_p_b0,"x0") + 3) + (((_S.named_value(_n_p_b0,"x1") - _S.named_value(_n_p_b0,"x0")) - 6) * (0.5 + (0.5 * sin(((float(((PI * 2) * _n_t))/_n_D) + (_n_i_b1 * 1.9)))))))+0.5)
	_S.invoke(_n_q,"px",[_n_gx_b2, _S.named_value(_n_p_b0,"y"), _S.index_value(_n_C,6)])
	_S.invoke(_n_q,"glow",[_n_gx_b2, _S.named_value(_n_p_b0,"y"), 4, _S.index_value(_n_C,5), 0.2])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_M_b4 = _S.call_value(_n_field,[(_n_S_b2 + 9), 256, 128, [4, 8, 16, 32]])
	var _n_drift_b5 = (float((256 * _n_t_b1))/_n_D)
	var _n_crest_b6 = _S.ColorFX.mix(_S.index_value(_n_C_b3,4),_S.index_value(_n_C_b3,5),0.5)
	var _n_dens_b7 = _S.function_value(_S.capture(_parent,{"M":_n_M_b4,"drift":_n_drift_b5,"this":_this}),"_f14")
	_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-20), 9, _S.function_value(_S.capture(_parent,{"dens":_n_dens_b7,"crest":_n_crest_b6,"C":_n_C_b3,"this":_this}),"_f15")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_M = _S.read(_parent,"M")
	var _n_drift = _S.read(_parent,"drift")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_prof_b2 = (_S.MathFX.smooth((-22),(-4),_n_y_b1) * (1 - _S.MathFX.smooth(7,10,_n_y_b1)))
	return (_n_prof_b2 * (0.62 + ((_S.Accelerators.Weather.sample_at(_n_M,((_n_x_b0 * 0.45) + _n_drift),((_n_y_b1 * 4) + 30)) - 0.5) * 2)))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_dens = _S.read(_parent,"dens")
	var _n_crest = _S.read(_parent,"crest")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.call_value(_n_dens,[_n_x_b0, _n_y_b1])
	if _S.truth((_n_d_b3 < 0.28)):
		return null
	var _n_th_b4 = (((_S.Painter.BAYER[((floori(_n_y_b1)&3)<<2)|(floori(_n_x_b0)&3)]+0.5)/16.0) * 0.06)
	_S.set_prop(_n_out_b2,"b",1,"=")
	if _S.truth(((_S.call_value(_n_dens,[_n_x_b0, (_n_y_b1 - 1)]) < 0.43) if _S.truth((_n_d_b3 > (0.46 + _n_th_b4))) else (_n_d_b3 > (0.46 + _n_th_b4)))):
		_S.set_prop(_n_out_b2,"c",_n_crest,"=")
		_S.set_prop(_n_out_b2,"a",0.5,"=")
	else:
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,4) if _S.truth((_n_d_b3 > (0.58 + _n_th_b4))) else _S.index_value(_n_C,3)),"=")
		_S.set_prop(_n_out_b2,"a",(clampf(((_n_d_b3 - 0.28) * 1.6),0.0,1.0) * 0.5),"=")
	_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,4),"=")
	_S.set_prop(_n_out_b2,"k",((_n_d_b3 - 0.3) * 0.1),"=")
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_P_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	return _S.invoke(_n_P_b0,"find",[_S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"this":_n_this}),"_f17")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_p_b0 = _S.arg(_args,0)
	return ((absf((_n_y - _S.named_value(_n_p_b0,"y"))) < 1.5) if _S.truth(((_n_x <= (_S.named_value(_n_p_b0,"x1") - 2)) if _S.truth((_n_x >= (_S.named_value(_n_p_b0,"x0") + 2))) else (_n_x >= (_S.named_value(_n_p_b0,"x0") + 2)))) else ((_n_x <= (_S.named_value(_n_p_b0,"x1") - 2)) if _S.truth((_n_x >= (_S.named_value(_n_p_b0,"x0") + 2))) else (_n_x >= (_S.named_value(_n_p_b0,"x0") + 2))))
	return null
