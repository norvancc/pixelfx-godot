@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/torch.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "burn", _S.import_value("fx/fire/_lib.js", "burn"))
	_S.define(_e, "plate", _S.function_value(_e, "_f0"))
	_S.define(_e, "handle", _S.function_value(_e, "_f2"))
	_S.define(_e, "ring", _S.function_value(_e, "_f4"))
	_S.define(_e, "wrap", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Torch"}, {"desc": "A wall torch on an iron bracket: a licking flame leaping off a pitch-soaked wrap, licks and puffs torn off its tips, smoke, embers, a flickering light on the wall."}, {"tags": ["fire", "torch", "prop", "light", "wall", "dungeon", "loop"]}, {"size": [72, 120]}, {"origin": [36, 94]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"wood": ["#0e080a", "#24130f", "#3b2216", "#5a3520", "#8a5a34", "#b9884f"]}, {"iron": ["#0d0b12", "#1e1b26", "#363242", "#5b5566", "#8a8396"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "BASE", _S.unary("-", 16))
	_S.define(_e, "TONGUES", [[_S.unary("-", 1.9), _S.unary("-", 1), 0.74, 2, 1], [2.1, _S.unary("-", 1), 0.7, 2, 1], [_S.unary("-", 3.4), 0.5, 0.42, 1.6, 0], [3.6, 0.5, 0.46, 1.6, 0], [0, 0, 1, 2.9, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"shade",[(-5.5), (-5.5), 5.5, 11.5, _S.function_value(_S.capture(_parent,{"I":_n_I_b1,"H":_n_H_b2,"fl":_n_fl_b3,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_I = _S.read(_parent,"I")
	var _n_H = _S.read(_parent,"H")
	var _n_fl = _S.read(_parent,"fl")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	if _S.truth(((((_n_x_b0 < (-5)) if _S.truth((_n_x_b0 < (-5))) else (_n_x_b0 > 5)) if _S.truth(((_n_x_b0 < (-5)) if _S.truth((_n_x_b0 < (-5))) else (_n_x_b0 > 5))) else (_n_y_b1 < (-5))) if _S.truth((((_n_x_b0 < (-5)) if _S.truth((_n_x_b0 < (-5))) else (_n_x_b0 > 5)) if _S.truth(((_n_x_b0 < (-5)) if _S.truth((_n_x_b0 < (-5))) else (_n_x_b0 > 5))) else (_n_y_b1 < (-5)))) else (_n_y_b1 > 11))):
		return _S.index_value(_n_I,0)
	var _n_rv_b2 = _S.logical("&&",(absf(_n_x_b0) < 0.6),func():return _S.logical("||",(absf((_n_y_b1 + 3.5)) < 0.6),func():return (absf((_n_y_b1 - 9.5)) < 0.6)))
	if _S.truth(_n_rv_b2):
		return _S.ColorFX.mix(_S.index_value(_n_I,4),_S.index_value(_n_H,3),(0.35 * _n_fl))
	if _S.truth(((_n_y_b1 < (-4)) if _S.truth((_n_y_b1 < (-4))) else (_n_x_b0 < (-4)))):
		return _S.ColorFX.mix(_S.index_value(_n_I,3),_S.index_value(_n_H,4),(0.3 * _n_fl))
	if _S.truth(((_n_y_b1 > 10) if _S.truth((_n_y_b1 > 10)) else (_n_x_b0 > 4))):
		return _S.index_value(_n_I,1)
	return (_S.index_value(_n_I,2) if _S.truth((_n_y_b1 < 2)) else _S.index_value(_n_I,1))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	_S.invoke(_n_p_b0,"shade",[(-3), (-12), 3, 15, _S.function_value(_S.capture(_parent,{"W":_n_W_b1,"this":_this}),"_f3")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_half_b2 = (1.3 + (clampf((float((14 - _n_y_b1))/26),0.0,1.0) * 0.9))
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_half_b2 + 0.5)),func():return (_n_y_b1 > 14.5))):
		return null
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_half_b2 - 0.5)),func():return (_n_y_b1 > 13.5))):
		return _S.index_value(_n_W,0)
	var _n_g_b3 = _S.MathFX.rand([floori((float(_n_y_b1)/3)),floori(_n_x_b0+0.5),9])
	return ((_S.index_value(_n_W,2) if _S.truth((_n_g_b3 < 0.3)) else _S.index_value(_n_W,4)) if _S.truth((_n_x_b0 < (-0.3))) else (_S.index_value(_n_W,1) if _S.truth((_n_g_b3 < 0.4)) else _S.index_value(_n_W,2)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_fl_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"rect",[(-3), (-2), 7, 4, _S.index_value(_n_I_b1,0)])
	_S.invoke(_n_p_b0,"rect",[(-2), (-1), 5, 1, _S.ColorFX.mix(_S.index_value(_n_I_b1,4),_S.index_value(_n_H_b2,3),(0.3 * _n_fl_b3))])
	_S.invoke(_n_p_b0,"rect",[(-2), 0, 5, 1, _S.index_value(_n_I_b1,2)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_I_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"shade",[(-6), (_n_BASE - 2), 6, (-9), _S.function_value(_S.capture(_parent,{"W":_n_W_b1,"t":_n_t_b4,"H":_n_H_b3,"I":_n_I_b2,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_W = _S.read(_parent,"W")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_H = _S.read(_parent,"H")
	var _n_I = _S.read(_parent,"I")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float((_n_y_b1 - (_n_BASE - 1.5)))/7.5)
	var _n_half_b4 = (4.6 - (_n_v_b3 * 1.9))
	if _S.truth(_S.logical("||",_S.logical("||",(absf(_n_x_b0) > (_n_half_b4 + 0.5)),func():return (_n_y_b1 < (_n_BASE - 1.5))),func():return (_n_y_b1 > (-9.5)))):
		return null
	if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_half_b4 - 0.5)),func():return (_n_y_b1 > (-10.5)))):
		return _S.index_value(_n_W,0)
	var _n_cord_b5 = _S.binary("===",fmod(floori(((_n_y_b1 - (_n_x_b0 * 0.6)) + 40)),3),0)
	var _n_h_b6 = _S.MathFX.rand([floori(_n_x_b0),floori(_n_y_b1),31])
	if _S.truth((_n_v_b3 < 0.45)):
		if _S.truth((_n_h_b6 < 0.42)):
			var _n_g_b7 = (0.5 + (0.5 * sin(((((float(_n_t)/_n_D) * PI) * 4) + (_n_h_b6 * 40)))))
			_S.set_prop(_n_out_b2,"k",(0.3 * _n_g_b7),"=")
			return (_S.index_value(_n_H,2) if _S.truth((_n_g_b7 > 0.66)) else (_S.index_value(_n_H,4) if _S.truth((_n_g_b7 > 0.33)) else _S.index_value(_n_H,5)))
		return (_S.index_value(_n_W,0) if _S.truth((_n_h_b6 < 0.75)) else _S.index_value(_n_W,1))
	if _S.truth(_n_cord_b5):
		return _S.index_value(_n_I,2)
	return (_S.index_value(_n_W,3) if _S.truth((_n_x_b0 < (-1))) else (_S.index_value(_n_W,2) if _S.truth((_n_x_b0 < 1.5)) else _S.index_value(_n_W,1)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_NL = _S.read(_parent,"NL")
	var _n_plate = _S.read(_parent,"plate")
	var _n_handle = _S.read(_parent,"handle")
	var _n_ring = _S.read(_parent,"ring")
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_D = _S.read(_parent,"D")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_burn = _S.read(_parent,"burn")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_W_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"wood"),6)
	var _n_I_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"iron"),5)
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_fl0_b8 = ((0.74 + (0.16 * _S.call_value(_n_NL,[_n_t_b1, 7.3, (_n_S_b7 + 1)]))) + (0.1 * _S.call_value(_n_NL,[_n_t_b1, 19, (_n_S_b7 + 2)])))
	_S.call_value(_n_plate,[_n_p_b0, _n_I_b6, _n_H_b4, _n_fl0_b8])
	_S.call_value(_n_handle,[_n_p_b0, _n_W_b5])
	_S.call_value(_n_ring,[_n_p_b0, _n_I_b6, _n_H_b4, _n_fl0_b8])
	_S.call_value(_n_burn,[_n_p_b0, _n_t_b1, _n_TONGUES, {"H":_n_H_b4,"D":_n_D,"NL":_n_NL,"S":_n_S_b7,"x":0,"y":_n_BASE,"height":20,"lean":0.12,"spread":4,"puffs":10,"licks":5,"smoke":7,"smokeSize":2.3,"smokeLife":[1.3, 2.1],"embers":7,"glowR":48,"glow":1.25,"wind":2,"mid":_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"W":_n_W_b5,"I":_n_I_b6,"H":_n_H_b4,"t":_n_t_b1,"this":_this}),"_f8")}])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_p = _S.read(_parent,"p")
	var _n_W = _S.read(_parent,"W")
	var _n_I = _S.read(_parent,"I")
	var _n_H = _S.read(_parent,"H")
	var _n_t = _S.read(_parent,"t")
	return _S.call_value(_n_wrap,[_n_p, _n_W, _n_I, _n_H, _n_t])
	return null
