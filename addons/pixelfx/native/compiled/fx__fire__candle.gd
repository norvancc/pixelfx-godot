@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/candle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "dish", _S.function_value(_e, "_f0"))
	_S.define(_e, "candle", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Candle"}, {"desc": "A wax candle in a brass dish: a calm flame with a blue root that sways and stretches, a halo of light, motes drifting in it, a bead of wax running down a drip."}, {"tags": ["fire", "candle", "prop", "light", "calm", "ambient", "loop"]}, {"size": [56, 76]}, {"origin": [28, 64]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"root": ["#1b2a8a", "#3a62e0", "#7fb4ff"]}, {"wax": ["#2e201e", "#5e4436", "#8e6e58", "#b8957a", "#d8b896", "#f0dcc0"]}, {"brass": ["#2a1a10", "#6a4a1e", "#b4862e", "#e8c060", "#fff0b0"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "TOP", _S.unary("-", 16))
	_S.define(_e, "WICK", _S.binary("-", _S.read(_e, "TOP"), 3))
	_S.define(_e, "CALM", [[1, 1, 5], [0.8, 0.88, 3], [0.6, 0.72, 2], [0.38, 0.52, 1], [0.18, 0.3, 0]])
	_S.define(_e, "DRIP", _S.merge([{"x": 4}, {"y0": _S.binary("+", _S.read(_e, "TOP"), 2)}, {"y1": _S.unary("-", 7)}]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"ellipse",[0, 1, 10, 2.6, _S.function_value(_S.capture(_parent,{"B":_n_B_b1,"H":_n_H_b2,"fl":_n_fl_b3,"this":_this}),"_f1")])
	_S.invoke(_n_p_b0,"rect",[(-8), 2, 17, 1, _S.index_value(_n_B_b1,1)])
	_S.invoke(_n_p_b0,"rect",[(-7), 3, 15, 1, _S.index_value(_n_B_b1,0)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_H = _S.read(_parent,"H")
	var _n_fl = _S.read(_parent,"fl")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_B,0) if _S.truth((_n_d_b0 > 0.82)) else ((_S.ColorFX.mix(_S.index_value(_n_B,3),_S.index_value(_n_H,3),(0.3 * _n_fl)) if _S.truth((_n_d_b0 > 0.6)) else _S.index_value(_n_B,2)) if _S.truth((sin(_n_a_b1) < (-0.2))) else (_S.index_value(_n_B,1) if _S.truth((_n_d_b0 > 0.55)) else _S.index_value(_n_B,2))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_DRIP = _S.read(_parent,"DRIP")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_X_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	var _n_L_b4 = _n_TOP
	var _n_cols_b5 = [_S.index_value(_n_X_b1,1), _S.index_value(_n_X_b1,4), _S.index_value(_n_X_b1,5), _S.index_value(_n_X_b1,4), _S.index_value(_n_X_b1,4), _S.index_value(_n_X_b1,3), _S.index_value(_n_X_b1,3), _S.index_value(_n_X_b1,2), _S.index_value(_n_X_b1,0)]
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 9)):
			var _n_x_b8 = (_n_i_b7 - 4)
			_S.invoke(_n_p_b0,"rect",[_n_x_b8, (_n_L_b4 + 1), 1, ((-_n_L_b4) - 2), _S.index_value(_n_cols_b5,_n_i_b7)])
			if _S.truth(_S.binary("===",_n_i_b7,2)):
				_S.invoke(_n_p_b0,"rect",[_n_x_b8, (-8), 1, 7, _S.index_value(_n_X_b1,4)])
			_n_i_b7 += 1.0
	_S.invoke(_n_p_b0,"rect",[(-3), (-1), 7, 1, _S.index_value(_n_X_b1,2)])
	_S.invoke(_n_p_b0,"px",[(-4), (-1), _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"px",[4, (-1), _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"rect",[(-3), _n_L_b4, 7, 1, _S.ColorFX.mix(_S.index_value(_n_X_b1,5),_S.index_value(_n_H_b2,2),(0.25 * _n_fl_b3))])
	_S.invoke(_n_p_b0,"px",[(-4), _n_L_b4, _S.index_value(_n_X_b1,1)])
	_S.invoke(_n_p_b0,"px",[4, _n_L_b4, _S.index_value(_n_X_b1,1)])
	_S.invoke(_n_p_b0,"rect",[(-2), (_n_L_b4 + 1), 5, 1, _S.ColorFX.mix(_S.index_value(_n_X_b1,5),_S.index_value(_n_H_b2,1),(0.5 * _n_fl_b3))])
	_S.invoke(_n_p_b0,"rect",[(-1), (_n_L_b4 + 1), 3, 1, _S.ColorFX.mix(_S.index_value(_n_X_b1,4),_S.index_value(_n_H_b2,2),(0.45 * _n_fl_b3))])
	var _n_y1_b6 = _S.named_value(_n_DRIP,"y1")
	_S.invoke(_n_p_b0,"rect",[3, (_n_L_b4 + 1), 1, ((_n_y1_b6 - _n_L_b4) - 1), _S.index_value(_n_X_b1,4)])
	_S.invoke(_n_p_b0,"rect",[4, (_n_L_b4 + 2), 1, ((_n_y1_b6 - _n_L_b4) - 2), _S.index_value(_n_X_b1,3)])
	_S.invoke(_n_p_b0,"px",[5, (_n_L_b4 + 3), _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"rect",[5, (_n_L_b4 + 4), 1, ((_n_y1_b6 - _n_L_b4) - 4), _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"rect",[3, _n_y1_b6, 2, 2, _S.index_value(_n_X_b1,4)])
	_S.invoke(_n_p_b0,"px",[5, _n_y1_b6, _S.index_value(_n_X_b1,3)])
	_S.invoke(_n_p_b0,"px",[5, (_n_y1_b6 + 1), _S.index_value(_n_X_b1,2)])
	_S.invoke(_n_p_b0,"px",[6, _n_y1_b6, _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"px",[6, (_n_y1_b6 + 1), _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"rect",[3, (_n_y1_b6 + 2), 3, 1, _S.index_value(_n_X_b1,0)])
	_S.invoke(_n_p_b0,"px",[3, (_n_L_b4 + 2), _S.index_value(_n_X_b1,5)])
	_S.invoke(_n_p_b0,"rect",[(-4), (_n_L_b4 + 1), 1, 4, _S.index_value(_n_X_b1,4)])
	_S.invoke(_n_p_b0,"px",[(-5), (_n_L_b4 + 3), _S.index_value(_n_X_b1,1)])
	_S.invoke(_n_p_b0,"px",[(-5), (_n_L_b4 + 4), _S.index_value(_n_X_b1,1)])
	_S.invoke(_n_p_b0,"px",[(-4), (_n_L_b4 + 5), _S.index_value(_n_X_b1,3)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_NL = _S.read(_parent,"NL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_WICK = _S.read(_parent,"WICK")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_dish = _S.read(_parent,"dish")
	var _n_candle = _S.read(_parent,"candle")
	var _n_D = _S.read(_parent,"D")
	var _n_DRIP = _S.read(_parent,"DRIP")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_CALM = _S.read(_parent,"CALM")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_looped = _S.read(_parent,"looped")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_RT_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"root"),3)
	var _n_X_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"wax"),6)
	var _n_B_b7 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"brass"),5)
	var _n_S_b8 = _S.named_value(_n_o_b2,"seed")
	var _n_N_b9 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f4")
	var _n_fl_b10 = ((0.86 + (0.08 * _S.call_value(_n_NL,[_n_t_b1, 2, (_n_S_b8 + 1)]))) + (0.06 * _S.call_value(_n_NL,[_n_t_b1, 7, (_n_S_b8 + 2)])))
	var _n_stretch_b11 = (maxf(0,(_S.call_value(_n_NL,[_n_t_b1, 0.75, (_n_S_b8 + 3)]) - 0.3)) * 0.6)
	var _n_h_b12 = ((12 * (1 + _n_stretch_b11)) * (0.94 + (0.06 * _n_fl_b10)))
	var _n_sway_b13 = ((_S.call_value(_n_NL,[_n_t_b1, 0.5, (_n_S_b8 + 4)]) * 1.6) + (_S.call_value(_n_NL,[_n_t_b1, 1.5, (_n_S_b8 + 5)]) * 0.5))
	var _n_GLOW_b14 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.3)
	var _n_cy_b15 = (_n_WICK - (_n_h_b12 * 0.4))
	_S.call_value(_n_floorLight,[_n_p_b0, 0, 1, 26, 5, _n_GLOW_b14, (0.3 * _n_fl_b10)])
	_S.invoke(_n_p_b0,"glow",[(_n_sway_b13 * 0.3), _n_cy_b15, (38 * _n_fl_b10), _n_GLOW_b14, (0.42 * _n_fl_b10)])
	_S.invoke(_n_p_b0,"glowRing",[(_n_sway_b13 * 0.3), _n_cy_b15, 10, 4, _S.index_value(_n_H_b4,2), (0.12 * _n_fl_b10)])
	_S.call_value(_n_dish,[_n_p_b0, _n_B_b7, _n_H_b4, _n_fl_b10])
	_S.call_value(_n_candle,[_n_p_b0, _n_X_b6, _n_H_b4, _n_fl_b10])
	var _n_run_b16 = (float(fmod(_n_t_b1,_n_D))/_n_D)
	var _n_swell_b17 = _S.MathFX.smooth(0,0.3,_n_run_b16)
	var _n_slide_b18 = _S.MathFX.smooth(0.3,0.85,_n_run_b16)
	var _n_set_b19 = _S.MathFX.smooth(0.85,1,_n_run_b16)
	if _S.truth(((_n_swell_b17 > 0.15) if _S.truth((_n_set_b19 < 1)) else (_n_set_b19 < 1))):
		var _n_by_b20 = floori((_S.named_value(_n_DRIP,"y0") + ((_S.named_value(_n_DRIP,"y1") - _S.named_value(_n_DRIP,"y0")) * _n_slide_b18))+0.5)
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_DRIP,"x"), _n_by_b20, _S.ColorFX.mix(_S.index_value(_n_X_b6,5),_S.index_value(_n_H_b4,1),(0.4 * _n_fl_b10))])
		if _S.truth(((_n_set_b19 < 0.5) if _S.truth((_n_swell_b17 > 0.6)) else (_n_swell_b17 > 0.6))):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_DRIP,"x") + 1), _n_by_b20, _S.index_value(_n_X_b6,4)])
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_DRIP,"x") + 1), (_n_by_b20 + 1), _S.index_value(_n_X_b6,2)])
	_S.invoke(_n_p_b0,"line",[0, _n_TOP, 0, (_n_WICK + 1), _S.index_value(_n_X_b6,0)])
	_S.invoke(_n_p_b0,"px",[0, (_n_WICK + 1), _S.index_value(_n_H_b4,4)])
	_S.call_value(_n_flameTongue,[_n_p_b0, 0, (_n_WICK + 1), _n_h_b12, 2.6, _n_sway_b13, _n_N_b9, (_n_S_b8 * 31), _n_H_b4, _n_CALM, 0.25, 0.6])
	if true:
		var _n_dx_b21 = (-2)
		while _S.truth((_n_dx_b21 <= 2)):
			var _n_a_b22 = (1 - (absf(_n_dx_b21) * 0.2))
			_S.invoke(_n_p_b0,"dot",[_n_dx_b21, (_n_WICK + 1), (_S.index_value(_n_RT_b5,0) if _S.truth(_S.binary("===",absf(_n_dx_b21),2)) else _S.index_value(_n_RT_b5,1)), _n_a_b22])
			if _S.truth((absf(_n_dx_b21) <= 1)):
				_S.invoke(_n_p_b0,"dot",[_n_dx_b21, (_n_WICK + 2), _S.index_value(_n_RT_b5,0), 0.7])
			_n_dx_b21 += 1.0
	_S.invoke(_n_p_b0,"px",[0, _n_WICK, _S.index_value(_n_RT_b5,2)])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 6, (_n_S_b8 + 300), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"sway":_n_sway_b13,"h":_n_h_b12,"p":_n_p_b0,"t":_n_t_b1,"S":_n_S_b8,"this":_this}),"_f6")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 10, (_n_S_b8 + 400), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"cy":_n_cy_b15,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f8")])
	_S.invoke(_n_p_b0,"glow",[(_n_sway_b13 * 0.5), (_n_WICK - (_n_h_b12 * 0.3)), 10, _S.index_value(_n_H_b4,1), (0.35 * _n_fl_b10)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, (_n_rate_b0 * 0.35), _n_seed_b1, _n_off_b2])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"vx":_S.invoke(_n_r_b0,"range",[(-1.5), 1.5]),"vy":(-_S.invoke(_n_r_b0,"range",[8, 12])),"life":_S.invoke(_n_r_b0,"range",[1.4, 2.2]),"s":_S.invoke(_n_r_b0,"range",[0.8, 1.2])}
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_sway = _S.read(_parent,"sway")
	var _n_WICK = _S.read(_parent,"WICK")
	var _n_h = _S.read(_parent,"h")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_n_sway, (_n_WICK - _n_h), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 1, (-6), 1, 0.8])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_smokePuff,[_n_p, (_n_x_b2 + (_S.call_value(_n_NL,[(_n_t - _n_age_b1), 0.6, (_n_S + 60)]) * (1 + (_n_age_b1 * 2)))), _n_y_b3, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), 0, false, 0.6])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-20), 20]),"y":_S.invoke(_n_r_b0,"range",[(-44), (-8)]),"vx":_S.invoke(_n_r_b0,"range",[(-3), 3]),"vy":_S.invoke(_n_r_b0,"range",[(-4), 2]),"life":_S.invoke(_n_r_b0,"range",[2.5, 4]),"ph":_S.invoke(_n_r_b0,"range",[0, 6.3])}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_cy = _S.read(_parent,"cy")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_x_b2 = ((_S.named_value(_n_q_b0,"x") + (_S.named_value(_n_q_b0,"vx") * _n_age_b1)) + (sin(((_n_age_b1 * 1.3) + _S.named_value(_n_q_b0,"ph"))) * 2))
	var _n_y_b3 = (_S.named_value(_n_q_b0,"y") + (_S.named_value(_n_q_b0,"vy") * _n_age_b1))
	var _n_d_b4 = _S.Bridge.hypot([_n_x_b2, (_n_y_b3 - _n_cy)])
	var _n_k_b5 = (minf(minf(1,(_n_age_b1 * 2)),((_S.named_value(_n_q_b0,"life") - _n_age_b1) * 2)) * clampf((1.2 - (float(_n_d_b4)/26)),0.0,1.0))
	if _S.truth((_n_k_b5 > 0.15)):
		_S.invoke(_n_p,"dot",[_n_x_b2, _n_y_b3, (_S.index_value(_n_H,1) if _S.truth((_n_k_b5 > 0.6)) else _S.index_value(_n_H,3)), _n_k_b5])
		_S.invoke(_n_p,"glow",[_n_x_b2, _n_y_b3, 3, _S.index_value(_n_H,2), (0.2 * _n_k_b5)])
	return null
