@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/fog.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f4":"weather_fog_bank_row","_f6":"weather_fog_streak_row"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "bank", _S.function_value(_e, "_f2"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Fog"}, {"desc": "Slow banks of moonlit fog at three depths drift past each other, crests catching the light, while thin streaks of mist slide by in front."}, {"tags": ["weather", "fog", "mist", "haze", "night", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#14121e", "#24213a", "#363250", "#4f4a6c", "#6d688b", "#918cab", "#bdb8d4", "#ece8f6"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "W", 320)
	_S.define(_e, "T", [0.3, 0.5, 0.7])
	_S.define(_e, "BW", 0.06)
	_S.define(_e, "BANKS", [_S.merge([{"top": _S.unary("-", 84)}, {"base": _S.unary("-", 40)}, {"bot": _S.unary("-", 20)}, {"sx": 1.6}, {"sy": 2.2}, {"lap": 1}, {"alpha": 0.24}, {"tone": [2, 3, 4]}, {"crest": 5}, {"warp": 16}, {"crestFrom": 3}]), _S.merge([{"top": _S.unary("-", 62)}, {"base": _S.unary("-", 24)}, {"bot": _S.unary("-", 2)}, {"sx": 1.0667}, {"sy": 2.5}, {"lap": 1}, {"alpha": 0.3}, {"tone": [2, 3, 4]}, {"crest": 5}, {"warp": 22}, {"crestFrom": 2}]), _S.merge([{"top": _S.unary("-", 42)}, {"base": _S.unary("-", 8)}, {"bot": 10}, {"sx": 0.8}, {"sy": 2.8}, {"lap": 1}, {"alpha": 0.36}, {"tone": [2, 3, 5]}, {"crest": 6}, {"warp": 28}, {"crestFrom": 1}])])
	_S.define(_e, "BR", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")]))
	_S.define(_e, "P1", _S.invoke(_S.read(_e, "BANKS"), "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "P2", _S.invoke(_S.read(_e, "BANKS"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "WARP", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_bank = _S.read(_parent,"bank")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_bank,[_n_p_b0, _n_t_b1, _n_S_b3, _n_C_b4, 0])
	_S.call_value(_n_bank,[_n_p_b0, _n_t_b1, _n_S_b3, _n_C_b4, 1])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_bank = _S.read(_parent,"bank")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_bank,[_n_p_b0, _n_t_b1, _n_S_b3, _n_C_b4, 2])
	_S.call_value(_n_streaks,[_n_p_b0, _n_t_b1, _n_S_b3, _n_C_b4, 1])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_BANKS = _S.read(_parent,"BANKS")
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_P1 = _S.read(_parent,"P1")
	var _n_P2 = _S.read(_parent,"P2")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_BR = _S.read(_parent,"BR")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_W = _S.read(_parent,"W")
	var _n_meta = _S.read(_parent,"meta")
	var _n_rows = _S.read(_parent,"rows")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.arg(_args,4)
	var _n_B_b5 = _S.index_value(_n_BANKS,_n_n_b4)
	var _n_F_b6 = _S.call_value(_n_field,[((_n_S_b2 * 7) + _n_n_b4), 256, 128])
	var _n_G_b7 = _S.call_value(_n_field,[((_n_S_b2 * 7) + 11), 256, 128, [4, 8, 16]])
	var _n_drift_b8 = (float(((256 * _S.named_value(_n_B_b5,"lap")) * _n_t_b1))/_n_D)
	var _n_boil_b9 = (float((128 * _n_t_b1))/_n_D)
	var _n_prev1_b10 = _S.index_value(_n_P1,_n_n_b4)
	var _n_prev2_b11 = _S.index_value(_n_P2,_n_n_b4)
	var _n_tones_b12 = _S.invoke(_S.named_value(_n_B_b5,"tone"),"map",[_S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f3")])
	var _n_crest_b13 = _S.ColorFX.mix(_S.index_value(_n_C_b3,_S.named_value(_n_B_b5,"crest")),_n_WHITE,(0.12 + (0.08 * _n_n_b4)))
	_S.invoke(_n_prev1_b10,"fill",[0])
	_S.invoke(_n_prev2_b11,"fill",[0])
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < _n_W)):
			_S.set_prop(_n_BR,_n_i_b14,(2 * sin((((float((_n_TAU * _n_t_b1))/_n_D) + ((_n_i_b14 - 160) * 0.006)) + (_n_n_b4 * 1.7)))),"=")
			_n_i_b14 += 1.0
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (_S.named_value(_n_B_b5,"top") - 2), _S.named_value(_n_B_b5,"bot"), _S.function_value(_S.capture(_parent,{"B":_n_B_b5,"G":_n_G_b7,"n":_n_n_b4,"boil":_n_boil_b9,"F":_n_F_b6,"drift":_n_drift_b8,"prev2":_n_prev2_b11,"prev1":_n_prev1_b10,"crest":_n_crest_b13,"C":_n_C_b3,"tones":_n_tones_b12,"this":_this}),"_f4")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,_n_i_b0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_WARP = _S.read(_parent,"WARP")
	var _n_G = _S.read(_parent,"G")
	var _n_n = _S.read(_parent,"n")
	var _n_boil = _S.read(_parent,"boil")
	var _n_W = _S.read(_parent,"W")
	var _n_F = _S.read(_parent,"F")
	var _n_drift = _S.read(_parent,"drift")
	var _n_BR = _S.read(_parent,"BR")
	var _n_prev2 = _S.read(_parent,"prev2")
	var _n_prev1 = _S.read(_parent,"prev1")
	var _n_T = _S.read(_parent,"T")
	var _n_BW = _S.read(_parent,"BW")
	var _n_crest = _S.read(_parent,"crest")
	var _n_C = _S.read(_parent,"C")
	var _n_tones = _S.read(_parent,"tones")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_prof_b2 = (_S.MathFX.smooth(_S.named_value(_n_B,"top"),_S.named_value(_n_B,"base"),_n_y_b0) * (1 - _S.MathFX.smooth((_S.named_value(_n_B,"bot") - (14 if _S.truth((_S.named_value(_n_B,"bot") < 10)) else 4)),(_S.named_value(_n_B,"bot") + 1),_n_y_b0)))
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_W)):
			_S.set_prop(_n_WARP,_n_i_b3,_S.set_prop(_n_WARP,(_n_i_b3 + 1),(_S.Accelerators.Weather.sample_at(_n_G,((_n_i_b3 * 0.35) + (_n_n * 70)),((_n_y_b0 * 0.5) + _n_boil)) - 0.5),"="),"=")
			_n_i_b3 += 2
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_W)):
			var _n_x_b5 = ((_n_i_b4 - 160) + 0.5)
			var _n_w_b6 = _S.index_value(_n_WARP,_n_i_b4)
			var _n_nn_b7 = (clampf((((_S.Accelerators.Weather.sample_at(_n_F,(((_n_x_b5 * _S.named_value(_n_B,"sx")) + _n_drift) + (_n_w_b6 * _S.named_value(_n_B,"warp"))),(((_n_y_b0 + _S.index_value(_n_BR,_n_i_b4)) * _S.named_value(_n_B,"sy")) + (_n_w_b6 * 8))) - 0.5) * 2.6) + 0.5),0.0,1.0) - 0.5)
			var _n_f_b8 = (0 if _S.truth((_n_prof_b2 <= 0.01)) else (((_n_prof_b2 * 0.72) + (_n_nn_b7 * 0.95)) * (0.6 + (0.5 * _n_prof_b2))))
			var _n_above_b9 = _S.index_value(_n_prev2,_n_i_b4)
			_S.set_prop(_n_prev2,_n_i_b4,_S.index_value(_n_prev1,_n_i_b4),"=")
			_S.set_prop(_n_prev1,_n_i_b4,_n_f_b8,"=")
			if _S.truth((_n_f_b8 <= _S.index_value(_n_T,0))):
				_n_i_b4 += 1.0
				continue
			var _n_th_b10 = (((_S.Painter.BAYER[((floori(_n_y_b0)&3)<<2)|(floori(_n_i_b4)&3)]+0.5)/16.0) * _n_BW)
			var _n_band_b11 = (2 if _S.truth((_n_f_b8 > (_S.index_value(_n_T,2) + _n_th_b10))) else (1 if _S.truth((_n_f_b8 > (_S.index_value(_n_T,1) + _n_th_b10))) else 0))
			var _n_solid_b12 = (2 if _S.truth((_n_f_b8 > _S.index_value(_n_T,2))) else (1 if _S.truth((_n_f_b8 > _S.index_value(_n_T,1))) else 0))
			if _S.truth(((_n_above_b9 < _S.index_value(_n_T,_n_solid_b12)) if _S.truth((_n_solid_b12 >= _S.named_value(_n_B,"crestFrom"))) else (_n_solid_b12 >= _S.named_value(_n_B,"crestFrom")))):
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b4,_n_crest,"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b4,(_S.named_value(_n_B,"alpha") * 0.95),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b4,_S.index_value(_n_C,6),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b4,0.07,"=")
			else:
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b4,_S.index_value(_n_tones,_n_band_b11),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b4,(_S.named_value(_n_B,"alpha") * (0.55 + (0.25 * _n_band_b11))),"=")
				if _S.truth(_S.binary("===",_n_band_b11,2)):
					_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b4,_S.index_value(_n_C,5),"=")
					_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b4,(0.03 + (0.02 * _n_n)),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"b"),_n_i_b4,1,"=")
			_n_i_b4 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_meta = _S.read(_parent,"meta")
	var _n_rows = _S.read(_parent,"rows")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	var _n_F_b5 = _S.call_value(_n_field,[(((_n_S_b2 * 7) + 20) + _n_front_b4), 256, 128])
	var _n_drift_b6 = (float((256 * _n_t_b1))/_n_D)
	var _n_sx_b7 = (0.4 if _S.truth(_n_front_b4) else 0.5)
	var _n_y0_b8 = ((-40) if _S.truth(_n_front_b4) else (-96))
	var _n_y1_b9 = (6 if _S.truth(_n_front_b4) else (-30))
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, _n_y0_b8, _n_y1_b9, _S.function_value(_S.capture(_parent,{"y0":_n_y0_b8,"y1":_n_y1_b9,"F":_n_F_b5,"sx":_n_sx_b7,"drift":_n_drift_b6,"C":_n_C_b3,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_y1 = _S.read(_parent,"y1")
	var _n_F = _S.read(_parent,"F")
	var _n_sx = _S.read(_parent,"sx")
	var _n_drift = _S.read(_parent,"drift")
	var _n_C = _S.read(_parent,"C")
	var _n_W = _S.read(_parent,"W")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_env_b2 = (_S.MathFX.smooth(_n_y0,(_n_y0 + 10),_n_y_b0) * (1 - _S.MathFX.smooth((_n_y1 - 10),_n_y1,_n_y_b0)))
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_W)):
			var _n_x_b4 = ((_n_i_b3 - 160) + 0.5)
			var _n_s_b5 = (((_S.Accelerators.Weather.sample_at(_n_F,((_n_x_b4 * _n_sx) + _n_drift),((_n_y_b0 * 6.5) + 30)) - 0.64) * 3) * _n_env_b2)
			if _S.truth((_n_s_b5 <= 0.05)):
				_n_i_b3 += 1.0
				continue
			_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b3,(_S.index_value(_n_C,5) if _S.truth((_n_s_b5 > 0.35)) else _S.index_value(_n_C,4)),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b3,minf(0.4,_n_s_b5),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"b"),_n_i_b3,1,"=")
			_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b3,_S.index_value(_n_C,5),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b3,(_n_s_b5 * 0.05),"=")
			_n_i_b3 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_W = _S.read(_parent,"W")
	return _S.construct(_n_Float32Array,[_n_W])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_W = _S.read(_parent,"W")
	return _S.construct(_n_Float32Array,[_n_W])
	return null
