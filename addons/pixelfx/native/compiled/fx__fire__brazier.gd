@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/brazier.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "burn", _S.import_value("fx/fire/_lib.js", "burn"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "stand", _S.function_value(_e, "_f0"))
	_S.define(_e, "bowl", _S.function_value(_e, "_f4"))
	_S.define(_e, "coals", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Brazier"}, {"desc": "An iron bowl on a tripod heaped with glowing coals and a big roaring fire, sparks and embers streaming up off it, light on the iron and the floor."}, {"tags": ["fire", "brazier", "prop", "light", "sparks", "ambient", "loop"]}, {"size": [112, 148]}, {"origin": [56, 136]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"iron": ["#0b0910", "#1c1924", "#302c3a", "#4c4658", "#78708a"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "RIM", _S.unary("-", 25))
	_S.define(_e, "RX", 15)
	_S.define(_e, "RY", 3)
	_S.define(_e, "TONGUES", [[_S.unary("-", 7), _S.unary("-", 1.5), 0.5, 2, 1], [7.2, _S.unary("-", 1.5), 0.55, 2, 1], [_S.unary("-", 3), _S.unary("-", 2.5), 0.84, 2.2, 1], [3.3, _S.unary("-", 2.5), 0.86, 2.2, 1], [_S.unary("-", 11.5), 0.5, 0.2, 1.5, 0], [11.5, 0.5, 0.22, 1.5, 0], [_S.unary("-", 8.3), 0, 0.34, 2, 0], [8.5, 0, 0.38, 2, 0], [_S.unary("-", 4.7), _S.unary("-", 0.5), 0.6, 2.8, 0], [4.9, _S.unary("-", 0.5), 0.64, 2.8, 0], [0, _S.unary("-", 1), 1, 3.6, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	var _n_leg_b4 = _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"I":_n_I_b1,"this":_this}),"_f1")
	_S.invoke(_n_p_b0,"ellipse",[0, (-9), 9, 1.8, _S.function_value(_S.capture(_parent,{"I":_n_I_b1,"this":_this}),"_f2")])
	_S.call_value(_n_leg_b4,[(-6), (-17), (-12), (-1)])
	_S.call_value(_n_leg_b4,[4, (-17), 10, (-1)])
	_S.invoke(_n_p_b0,"rect",[(-14), (-1), 5, 1, _S.index_value(_n_I_b1,2)])
	_S.invoke(_n_p_b0,"rect",[(-15), 0, 6, 1, _S.index_value(_n_I_b1,0)])
	_S.invoke(_n_p_b0,"px",[(-15), (-1), _S.index_value(_n_I_b1,3)])
	_S.invoke(_n_p_b0,"rect",[9, (-1), 5, 1, _S.index_value(_n_I_b1,2)])
	_S.invoke(_n_p_b0,"rect",[9, 0, 6, 1, _S.index_value(_n_I_b1,0)])
	_S.invoke(_n_p_b0,"px",[13, (-1), _S.index_value(_n_I_b1,3)])
	_S.invoke(_n_p_b0,"rect",[(-1), (-16), 3, 15, _S.index_value(_n_I_b1,0)])
	_S.invoke(_n_p_b0,"rect",[0, (-16), 1, 15, _S.ColorFX.mix(_S.index_value(_n_I_b1,3),_S.index_value(_n_H_b2,4),(0.15 * _n_fl_b3))])
	_S.invoke(_n_p_b0,"rect",[(-2), (-1), 5, 1, _S.index_value(_n_I_b1,2)])
	_S.invoke(_n_p_b0,"rect",[(-2), 0, 5, 1, _S.index_value(_n_I_b1,0)])
	_S.invoke(_n_p_b0,"ellipse",[0, (-9), 9, 1.8, _S.function_value(_S.capture(_parent,{"I":_n_I_b1,"this":_this}),"_f3")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_I = _S.read(_parent,"I")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	_S.invoke(_n_p,"line",[_n_x0_b0, _n_y0_b1, _n_x1_b2, _n_y1_b3, _S.index_value(_n_I,0)])
	_S.invoke(_n_p,"line",[(_n_x0_b0 + 1), _n_y0_b1, (_n_x1_b2 + 1), _n_y1_b3, _S.index_value(_n_I,2)])
	_S.invoke(_n_p,"line",[(_n_x0_b0 + 2), _n_y0_b1, (_n_x1_b2 + 2), _n_y1_b3, _S.index_value(_n_I,0)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_I = _S.read(_parent,"I")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_I,2) if _S.truth((_n_d_b0 > 0.6)) else 0)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_I = _S.read(_parent,"I")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_I,0) if _S.truth((_n_d_b0 > 0.85)) else _S.index_value(_n_I,3)) if _S.truth(_S.logical("&&",(sin(_n_a_b1) > 0),func():return (_n_d_b0 > 0.55))) else 0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"shade",[((-_n_RX) - 1), (_n_RIM - 1), (_n_RX + 1), (_n_RIM + 9), _S.function_value(_S.capture(_parent,{"I":_n_I_b1,"H":_n_H_b2,"fl":_n_fl_b3,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_RX = _S.read(_parent,"RX")
	var _n_I = _S.read(_parent,"I")
	var _n_H = _S.read(_parent,"H")
	var _n_fl = _S.read(_parent,"fl")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = (float((_n_y_b1 - _n_RIM))/9)
	var _n_hw_b3 = ((_n_RX * sqrt(maxf(0,(1 - ((_n_v_b2 * _n_v_b2) * 0.9))))) - (((_n_v_b2 - 0.5) * 6) if _S.truth((_n_v_b2 > 0.5)) else 0))
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_hw_b3 + 0.5)),func():return (_n_y_b1 < _n_RIM))):
		return null
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_hw_b3 - 0.5)),func():return (_n_v_b2 > 0.92))):
		return _S.index_value(_n_I,0)
	if _S.truth((_n_y_b1 < (_n_RIM + 1))):
		return _S.ColorFX.mix(_S.index_value(_n_I,3),_S.index_value(_n_H,4),(0.5 * _n_fl))
	if _S.truth((_n_y_b1 < (_n_RIM + 2))):
		return _S.index_value(_n_I,2)
	if _S.truth((_n_y_b1 < (_n_RIM + 3))):
		return (_S.ColorFX.mix(_S.index_value(_n_I,4),_S.index_value(_n_H,4),(0.25 * _n_fl)) if _S.truth(_S.binary("===",fmod(floori(_n_x_b0+0.5),4),0)) else _S.index_value(_n_I,0))
	return (_S.index_value(_n_I,2) if _S.truth((_n_x_b0 < ((-_n_RX) * 0.45))) else (_S.index_value(_n_I,1) if _S.truth((_n_x_b0 < (_n_RX * 0.25))) else _S.index_value(_n_I,0)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_S_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"shade",[(-_n_RX), (_n_RIM - 6), _n_RX, (_n_RIM + 1), _S.function_value(_S.capture(_parent,{"S":_n_S_b4,"I":_n_I_b1,"t":_n_t_b3,"H":_n_H_b2,"this":_this}),"_f7")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_RX = _S.read(_parent,"RX")
	var _n_S = _S.read(_parent,"S")
	var _n_I = _S.read(_parent,"I")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_top_b3 = ((_n_RIM - 1) - (4 * maxf(0,(1 - pow((float(_n_x_b0)/(_n_RX - 1)),2)))))
	if _S.truth((((_n_y_b1 < _n_top_b3) if _S.truth((_n_y_b1 < _n_top_b3)) else (_n_y_b1 > (_n_RIM + 0.5))) if _S.truth(((_n_y_b1 < _n_top_b3) if _S.truth((_n_y_b1 < _n_top_b3)) else (_n_y_b1 > (_n_RIM + 0.5)))) else (absf(_n_x_b0) > (_n_RX - 0.5)))):
		return null
	var _n_lump_b4 = _S.MathFX.rand([floori((float((_n_x_b0 + (floori(_n_y_b1) * 1.5)))/3)),floori((float(_n_y_b1)/2)),(_n_S + 20)])
	var _n_edge_b5 = (_n_y_b1 < (_n_top_b3 + 1))
	if _S.truth(_S.logical("||",(_S.MathFX.rand([floori(_n_x_b0),floori(_n_y_b1),(_n_S + 21)]) < 0.16),func():return ((_n_lump_b4 < 0.3) if _S.truth(_n_edge_b5) else _n_edge_b5))):
		return _S.index_value(_n_I,0)
	var _n_g_b6 = ((0.5 + (0.5 * sin(((((float(_n_t)/_n_D) * PI) * 4) + (_n_lump_b4 * 40))))) * (0.7 if _S.truth(_n_edge_b5) else 1))
	_S.set_prop(_n_out_b2,"k",(0.3 * _n_g_b6),"=")
	return (_S.index_value(_n_H,2) if _S.truth((_n_g_b6 > 0.72)) else (_S.index_value(_n_H,3) if _S.truth((_n_g_b6 > 0.5)) else (_S.index_value(_n_H,4) if _S.truth((_n_g_b6 > 0.3)) else (_S.index_value(_n_H,5) if _S.truth((_n_g_b6 > 0.15)) else _S.index_value(_n_H,6)))))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_NL = _S.read(_parent,"NL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_stand = _S.read(_parent,"stand")
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_RX = _S.read(_parent,"RX")
	var _n_RY = _S.read(_parent,"RY")
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_D = _S.read(_parent,"D")
	var _n_burn = _S.read(_parent,"burn")
	var _n_looped = _S.read(_parent,"looped")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_I_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"iron"),5)
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_fl_b7 = ((0.74 + (0.16 * _S.call_value(_n_NL,[_n_t_b1, 7.3, (_n_S_b6 + 1)]))) + (0.1 * _S.call_value(_n_NL,[_n_t_b1, 19, (_n_S_b6 + 2)])))
	var _n_GLOW_b8 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SPARKS_b9 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,5)]
	var _n_EMB_b10 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6)]
	_S.call_value(_n_floorLight,[_n_p_b0, 0, 0.5, 40, 7, _n_GLOW_b8, (0.32 * _n_fl_b7)])
	_S.call_value(_n_stand,[_n_p_b0, _n_I_b5, _n_H_b4, _n_fl_b7])
	_S.invoke(_n_p_b0,"ellipse",[0, _n_RIM, _n_RX, _n_RY, _S.function_value(_S.capture(_parent,{"I":_n_I_b5,"H":_n_H_b4,"fl":_n_fl_b7,"this":_this}),"_f9")])
	_S.call_value(_n_burn,[_n_p_b0, _n_t_b1, _n_TONGUES, {"H":_n_H_b4,"D":_n_D,"NL":_n_NL,"S":_n_S_b6,"x":0,"y":_n_RIM,"height":32,"lean":0.1,"spread":7,"puffs":8,"licks":4,"smoke":14,"smokeSize":3,"smokeLife":[1.6, 2.4],"embers":10,"glowR":58,"glow":1.4,"wind":3,"mid":_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"I":_n_I_b5,"H":_n_H_b4,"t":_n_t_b1,"S":_n_S_b6,"fl":_n_fl_b7,"this":_this}),"_f10")}])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 60, (_n_S_b6 + 600), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"SPARKS":_n_SPARKS_b9,"EMB":_n_EMB_b10,"this":_this}),"_f12")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_I = _S.read(_parent,"I")
	var _n_H = _S.read(_parent,"H")
	var _n_fl = _S.read(_parent,"fl")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_I,0) if _S.truth((_n_d_b0 > 0.88)) else _S.ColorFX.mix(_S.index_value(_n_I,3),_S.index_value(_n_H,4),(0.3 * _n_fl))) if _S.truth(_S.logical("&&",(sin(_n_a_b1) < 0),func():return (_n_d_b0 > 0.7))) else 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_coals = _S.read(_parent,"coals")
	var _n_p = _S.read(_parent,"p")
	var _n_I = _S.read(_parent,"I")
	var _n_H = _S.read(_parent,"H")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_bowl = _S.read(_parent,"bowl")
	var _n_fl = _S.read(_parent,"fl")
	_S.call_value(_n_coals,[_n_p, _n_I, _n_H, _n_t, _n_S])
	_S.call_value(_n_bowl,[_n_p, _n_I, _n_H, _n_fl])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.invoke(_n_r_b0,"range",[(-1), 1])
	return {"x":(_n_side_b1 * 8),"y":(_n_RIM - _S.invoke(_n_r_b0,"range",[4, 18])),"vx":(_n_side_b1 * _S.invoke(_n_r_b0,"range",[10, 40])),"vy":(-_S.invoke(_n_r_b0,"range",[70, 150])),"life":_S.invoke(_n_r_b0,"range",[0.7, 1.7]),"a":_S.invoke(_n_r_b0,"range",[0, 6.3]),"w":_S.invoke(_n_r_b0,"range",[1.8, 3.2]),"m":_S.invoke(_n_r_b0,"range",[3, 8]),"big":_S.invoke(_n_r_b0,"chance",[0.12])}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_SPARKS = _S.read(_parent,"SPARKS")
	var _n_spark = _S.read(_parent,"spark")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_ember = _S.read(_parent,"ember")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-22), 1.9, 1.9])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	var _n_vx_b4 = _S.prop(_tuple_0,2)
	var _n_vy_b5 = _S.prop(_tuple_0,3)
	var _n_k_b6 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_wob_b7 = ((_S.named_value(_n_q_b0,"m") * (sin(((_n_age_b1 * _S.named_value(_n_q_b0,"w")) + _S.named_value(_n_q_b0,"a"))) - sin(_S.named_value(_n_q_b0,"a")))) * minf(1,(_n_age_b1 * 1.5)))
	var _n_wv_b8 = (((_S.named_value(_n_q_b0,"m") * _S.named_value(_n_q_b0,"w")) * cos(((_n_age_b1 * _S.named_value(_n_q_b0,"w")) + _S.named_value(_n_q_b0,"a")))) * minf(1,(_n_age_b1 * 1.5)))
	if _S.truth((_S.Bridge.hypot([(_n_vx_b4 + _n_wv_b8), _n_vy_b5]) > 40)):
		_S.call_value(_n_spark,[_n_p, (_n_x_b2 + _n_wob_b7), _n_y_b3, (_n_vx_b4 + _n_wv_b8), _n_vy_b5, _n_k_b6, _n_SPARKS])
	else:
		_S.call_value(_n_ember,[_n_p, (_n_x_b2 + _n_wob_b7), _n_y_b3, _n_k_b6, (2 if _S.truth(_S.named_value(_n_q_b0,"big")) else 1), _n_EMB, ((_n_age_b1 * 40) + _S.named_value(_n_q_b0,"a"))])
	return null
