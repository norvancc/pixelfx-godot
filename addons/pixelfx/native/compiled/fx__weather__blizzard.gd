@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/blizzard.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f8":"weather_blizzard_sheet_row","_f10":"weather_blizzard_ground_row"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f2"))
	_S.define(_e, "sheets", _S.function_value(_e, "_f7"))
	_S.define(_e, "ground", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Blizzard"}, {"desc": "Snow driven almost flat by a gale: streaks at three depths race past, gusts throw translucent sheets of snow across the sky and spindrift streams off the drifts."}, {"tags": ["weather", "blizzard", "snow", "wind", "storm", "winter", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0d111f", "#182035", "#27324d", "#3e4d6e", "#64779c", "#9cb0d0", "#d8e4f6", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 8)
	_S.define(_e, "gustAt", _S.function_value(_e, "_f12"))
	_S.define(_e, "bank", _S.function_value(_e, "_f13"))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 240}, {"m": [3, 4]}, {"len": [2, 4]}, {"drop": [10, 40]}, {"col": [3, 4, 5]}]), _S.merge([{"n": 130}, {"m": [4, 5]}, {"len": [5, 8]}, {"drop": [20, 60]}, {"col": [4, 5, 6]}]), _S.merge([{"n": 34}, {"m": [6, 7]}, {"len": [10, 16]}, {"drop": [30, 70]}, {"col": [4, 6, 7]}, {"near": true}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "GX", _S.construct(_S.read(_e, "Float32Array"), [320]))
	_S.define(_e, "WV", _S.construct(_S.read(_e, "Float32Array"), [320]))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_sheets = _S.read(_parent,"sheets")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_ground = _S.read(_parent,"ground")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_sheets,[_n_p_b0, _n_t_b1, _n_S_b4, _n_C_b5, 0])
	_S.call_value(_n_streaks,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 0])
	_S.call_value(_n_streaks,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 1])
	_S.call_value(_n_ground,[_n_p_b0, _n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_sheets = _S.read(_parent,"sheets")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_sheets,[_n_p_b0, _n_t_b1, _n_S_b4, _n_C_b5, 1])
	_S.call_value(_n_streaks,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 2])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_Ly_b5 = _S.index_value(_n_LAYERS,_n_L_b4)
	var _n_sd_b6 = ((_n_S_b2 * 17) + _n_L_b4)
	var _tuple_0 = _S.invoke(_S.named_value(_n_Ly_b5,"col"),"map",[_S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f3")])
	var _n_c0_b7 = _S.prop(_tuple_0,0)
	var _n_c1_b8 = _S.prop(_tuple_0,1)
	var _n_c2_b9 = _S.prop(_tuple_0,2)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, _S.named_value(_n_Ly_b5,"n"), _n_sd_b6, _S.index_value(_S.named_value(_n_Ly_b5,"m"),0), _S.index_value(_S.named_value(_n_Ly_b5,"m"),1), _S.function_value(_S.capture(_parent,{"sd":_n_sd_b6,"Ly":_n_Ly_b5,"t":_n_t_b1,"q":_n_q_b0,"c0":_n_c0_b7,"c1":_n_c1_b8,"c2":_n_c2_b9,"C":_n_C_b3,"this":_this}),"_f4")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,_n_i_b0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_this = _S.read(_parent,"this")
	var _n_Ly = _S.read(_parent,"Ly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bank = _S.read(_parent,"bank")
	var _n_gustAt = _S.read(_parent,"gustAt")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_q = _S.read(_parent,"q")
	var _n_c0 = _S.read(_parent,"c0")
	var _n_c1 = _S.read(_parent,"c1")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_c2 = _S.read(_parent,"c2")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_R_b5 = _S.function_value(_S.capture(_parent,{"i":_n_i_b3,"j":_n_j_b4,"this":_n_this}),"_f5")
	var _n_drop_b6 = (_S.index_value(_S.named_value(_n_Ly,"drop"),0) + (_S.call_value(_n_R_b5,[3]) * (_S.index_value(_S.named_value(_n_Ly,"drop"),1) - _S.index_value(_S.named_value(_n_Ly,"drop"),0))))
	var _n_x_b7 = ((-190) + (380 * _n_u_b0))
	var _n_y_b8 = ((((-178) + (_S.call_value(_n_R_b5,[1]) * 182)) + (_n_drop_b6 * _n_u_b0)) + (3 * sin((((_n_u_b0 * _n_TAU) * (1 + _S.call_value(_n_R_b5,[5]))) + (_S.call_value(_n_R_b5,[6]) * 6)))))
	if _S.truth((_n_y_b8 > (_S.call_value(_n_bank,[_n_x_b7]) - 1))):
		return null
	var _n_g_b9 = _S.call_value(_n_gustAt,[_n_x_b7, _n_t])
	if _S.truth(((_S.call_value(_n_R_b5,[7]) > (0.45 + (0.75 * _n_g_b9))) if _S.truth(not _S.truth(_S.named_value(_n_Ly,"near"))) else not _S.truth(_S.named_value(_n_Ly,"near")))):
		return null
	var _n_L_b10 = ((_S.index_value(_S.named_value(_n_Ly,"len"),0) + (_S.call_value(_n_R_b5,[2]) * (_S.index_value(_S.named_value(_n_Ly,"len"),1) - _S.index_value(_S.named_value(_n_Ly,"len"),0)))) * (0.7 + (0.6 * _n_g_b9)))
	var _n_dx_b11 = (float(380)/(float(_n_D)/_n_m_b2))
	var _n_dy_b12 = (float(_n_drop_b6)/(float(_n_D)/_n_m_b2))
	var _n_l_b13 = _S.Bridge.hypot([_n_dx_b11, _n_dy_b12])
	var _n_ux_b14 = (float(_n_dx_b11)/_n_l_b13)
	var _n_uy_b15 = (float(_n_dy_b12)/_n_l_b13)
	_S.invoke(_n_q,"line",[(_n_x_b7 - (_n_ux_b14 * _n_L_b10)), (_n_y_b8 - (_n_uy_b15 * _n_L_b10)), (_n_x_b7 - ((_n_ux_b14 * _n_L_b10) * 0.45)), (_n_y_b8 - ((_n_uy_b15 * _n_L_b10) * 0.45)), _n_c0, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f6")])
	_S.invoke(_n_q,"line",[(_n_x_b7 - ((_n_ux_b14 * _n_L_b10) * 0.45)), (_n_y_b8 - ((_n_uy_b15 * _n_L_b10) * 0.45)), (_n_x_b7 - _n_ux_b14), (_n_y_b8 - _n_uy_b15), _n_c1])
	_S.invoke(_n_q,"px",[_n_x_b7, _n_y_b8, (_n_WHITE if _S.truth((_S.named_value(_n_Ly,"near") if _S.truth((_n_g_b9 > 0.6)) else (_n_g_b9 > 0.6))) else _n_c2)])
	if _S.truth(_S.named_value(_n_Ly,"near")):
		_S.invoke(_n_q,"glow",[_n_x_b7, _n_y_b8, 5, _S.index_value(_n_C,5), (0.12 + (0.12 * _n_g_b9))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_sd = _S.read(_parent,"sd")
	var _n_i = _S.read(_parent,"i")
	var _n_j = _S.read(_parent,"j")
	var _n_n_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_sd,_n_i,_n_j,_n_n_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (0.3 + (0.7 * _n_v_b0))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_GX = _S.read(_parent,"GX")
	var _n_gustAt = _S.read(_parent,"gustAt")
	var _n_WV = _S.read(_parent,"WV")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_rows = _S.read(_parent,"rows")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_F_b5 = _S.call_value(_n_field,[(((_n_S_b2 * 3) + 7) + _n_near_b4), 256, 128])
	var _n_shift_b6 = (float(((256 * (3 if _S.truth(_n_near_b4) else 2)) * _n_t_b1))/_n_D)
	var _n_c_b7 = (_S.index_value(_n_C_b3,6) if _S.truth(_n_near_b4) else _S.index_value(_n_C_b3,5))
	var _n_y0_b8 = ((-110) if _S.truth(_n_near_b4) else (-170))
	var _n_haze_b9 = _S.ColorFX.mix(_S.index_value(_n_C_b3,2),_S.index_value(_n_C_b3,3),0.5)
	var _n_sy_b10 = (4.5 if _S.truth(_n_near_b4) else 3.2)
	var _n_th_b11 = (0.58 if _S.truth(_n_near_b4) else 0.54)
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < 320)):
			_S.set_prop(_n_GX,_n_i_b12,_S.call_value(_n_gustAt,[((_n_i_b12 - 160) + 0.5), _n_t_b1]),"=")
			_S.set_prop(_n_WV,_n_i_b12,(5 * sin(((((_n_i_b12 - 160) * 0.021) - (float((_n_TAU * _n_t_b1))/_n_D)) + (_n_near_b4 * 2)))),"=")
			_n_i_b12 += 1.0
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, _n_y0_b8, 4, _S.function_value(_S.capture(_parent,{"near":_n_near_b4,"F":_n_F_b5,"shift":_n_shift_b6,"sy":_n_sy_b10,"th":_n_th_b11,"c":_n_c_b7,"haze":_n_haze_b9,"C":_n_C_b3,"this":_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_GX = _S.read(_parent,"GX")
	var _n_F = _S.read(_parent,"F")
	var _n_shift = _S.read(_parent,"shift")
	var _n_WV = _S.read(_parent,"WV")
	var _n_sy = _S.read(_parent,"sy")
	var _n_th = _S.read(_parent,"th")
	var _n_c = _S.read(_parent,"c")
	var _n_haze = _S.read(_parent,"haze")
	var _n_C = _S.read(_parent,"C")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_fade_b2 = (_S.MathFX.smooth((-110),(-40),_n_y_b0) if _S.truth(_n_near) else 1)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 320)):
			var _n_g_b4 = _S.index_value(_n_GX,_n_i_b3)
			var _n_n_b5 = _S.Accelerators.Weather.sample_at(_n_F,(((_n_i_b3 - 160) * 0.16) - _n_shift),(((_n_y_b0 + _S.index_value(_n_WV,_n_i_b3)) * _n_sy) + 40))
			var _n_d_b6 = ((((_n_n_b5 - _n_th) * 2.2) * (0.35 + _n_g_b4)) * _n_fade_b2)
			if _S.truth(_n_near):
				if _S.truth((_n_d_b6 <= 0.02)):
					_n_i_b3 += 1.0
					continue
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b3,_n_c,"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b3,minf(0.5,_n_d_b6),"=")
			else:
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b3,(_n_c if _S.truth((_n_d_b6 > 0.08)) else _n_haze),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b3,((0.3 + (0.12 * _n_g_b4)) + minf(0.42,maxf(0,_n_d_b6))),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"b"),_n_i_b3,1,"=")
			if _S.truth((_n_d_b6 > 0.05)):
				_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b3,_S.index_value(_n_C,5),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b3,(_n_d_b6 * 0.08),"=")
			_n_i_b3 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_GX = _S.read(_parent,"GX")
	var _n_gustAt = _S.read(_parent,"gustAt")
	var _n_WV = _S.read(_parent,"WV")
	var _n_bank = _S.read(_parent,"bank")
	var _n_meta = _S.read(_parent,"meta")
	var _n_rows = _S.read(_parent,"rows")
	var _n_trips = _S.read(_parent,"trips")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_F_b5 = _S.call_value(_n_field,[((_n_S_b3 * 5) + 1), 256, 128])
	var _n_shift_b6 = (float(((256 * 4) * _n_t_b2))/_n_D)
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 320)):
			_S.set_prop(_n_GX,_n_i_b7,_S.call_value(_n_gustAt,[((_n_i_b7 - 160) + 0.5), _n_t_b2]),"=")
			_S.set_prop(_n_WV,_n_i_b7,_S.call_value(_n_bank,[((_n_i_b7 - 160) + 0.5)]),"=")
			_n_i_b7 += 1.0
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-16), 9, _S.function_value(_S.capture(_parent,{"C":_n_C_b4,"F":_n_F_b5,"shift":_n_shift_b6,"this":_this}),"_f10")])
	_S.call_value(_n_trips,[_n_t_b2, _n_D, 40, (_n_S_b3 * 23), 8, 10, _S.function_value(_S.capture(_parent,{"S":_n_S_b3,"q":_n_q_b1,"C":_n_C_b4,"this":_this}),"_f11")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WV = _S.read(_parent,"WV")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_F = _S.read(_parent,"F")
	var _n_shift = _S.read(_parent,"shift")
	var _n_GX = _S.read(_parent,"GX")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < 320)):
			var _n_x_b3 = ((_n_i_b2 - 160) + 0.5)
			var _n_top_b4 = _S.index_value(_n_WV,_n_i_b2)
			var _n_d_b5 = (_n_y_b0 - _n_top_b4)
			if _S.truth((_n_d_b5 >= 0)):
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b2,(_n_WHITE if _S.truth((_n_d_b5 < 1)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b5 < 2)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b5 < 4)) else _S.index_value(_n_C,4)))),"=")
				if _S.truth((_n_d_b5 < 1)):
					_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b2,_S.index_value(_n_C,6),"=")
					_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b2,0.1,"=")
				_n_i_b2 += 1.0
				continue
			if _S.truth((_n_y_b0 < (-14))):
				_n_i_b2 += 1.0
				continue
			var _n_n_b6 = _S.Accelerators.Weather.sample_at(_n_F,((_n_x_b3 * 0.5) - _n_shift),((_n_y_b0 * 3) + 9))
			var _n_s_b7 = ((((_n_n_b6 - 0.5) * 3) * _S.MathFX.smooth((-14),(-1),_n_y_b0)) * (0.4 + _S.index_value(_n_GX,_n_i_b2)))
			if _S.truth((_n_s_b7 > 0.02)):
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b2,_S.index_value(_n_C,6),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b2,minf(0.55,_n_s_b7),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"b"),_n_i_b2,1,"=")
			_n_i_b2 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_bank = _S.read(_parent,"bank")
	var _n_S = _S.read(_parent,"S")
	var _n_q = _S.read(_parent,"q")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_x_b5 = ((-175) + (350 * _n_u_b0))
	var _n_y_b6 = ((_S.call_value(_n_bank,[_n_x_b5]) - 1) - ((_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,1]) * 6) * absf(sin(((_n_u_b0 * 9) + _n_i_b3)))))
	_S.invoke(_n_q,"px",[_n_x_b5, _n_y_b6, (_n_WHITE if _S.truth((_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,2]) < 0.5)) else _S.index_value(_n_C,6))])
	_S.invoke(_n_q,"px",[(_n_x_b5 - 1), _n_y_b6, _S.index_value(_n_C,5)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return (0.5 + (0.5 * sin(((_n_TAU * ((float((_n_x_b0 + 160))/400) - (float((2 * _n_t_b1))/_n_D))) + 0.8))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return (((-2) + (1.2 * sin(((_n_x_b0 * 0.05) + 2)))) + (0.8 * sin(((_n_x_b0 * 0.15) + 1))))
	return null
