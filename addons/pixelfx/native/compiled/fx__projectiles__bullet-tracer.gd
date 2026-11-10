@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/bullet-tracer.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Bullet tracer"}, {"desc": "A white-hot slug tearing along, its tracer burning behind it in a long streak that sputters and cools from white through gold to red, shedding sparks and a thread of smoke."}, {"tags": ["projectile", "bullet", "tracer", "gun", "directional", "loop"]}, {"size": [200, 40]}, {"origin": [184, 18]}, {"duration": 0.6}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"smoke": ["#2e2a36", "#46404f", "#625b6b", "#817a8a", "#a39caa"]}, {"length": 120}, {"speed": 520}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SLUG", ["..oyyp..", ".ypwwwwp", "ywwwwwww", ".ypwwwwp", "..oyyp.."])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_beat = _S.read(_parent,"beat")
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_SLUG = _S.read(_parent,"SLUG")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_SM_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"smoke"),5)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	var _n_L_b7 = _S.prop(_n_o_b2,"length")
	var _n_V_b8 = _S.named_value(_n_o_b2,"speed")
	var _n_fr_b9 = floori(((_n_t_b1 * 30) + 0.000001))
	var _n_ph_b10 = (float((_n_TAU * _n_t_b1))/_n_D_b6)
	var _n_left_b11 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	var _n_puffs_b12 = []
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b6, 18, (_n_S_b5 + 7), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"left":_n_left_b11,"puffs":_n_puffs_b12,"this":_this}),"_f2")])
	_S.call_value(_n_cloud,[_n_p_b0, _n_puffs_b12, _n_SM_b4, _n_SM_b4, {"dens":1.2,"max":0.6}])
	var _n_heat_b13 = _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"t":_n_t_b1,"S":_n_S_b5,"ph":_n_ph_b10,"this":_this}),"_f3")
	var _n_yAt_b14 = _S.function_value(_S.capture(_parent,{"ph":_n_ph_b10,"L":_n_L_b7,"this":_this}),"_f4")
	var _n_HOT_b15 = (_n_L_b7 * 0.32)
	_S.invoke(_n_p_b0,"shade",[((-_n_HOT_b15) - 1), (-4), 1, 5, _S.function_value(_S.capture(_parent,{"HOT":_n_HOT_b15,"ph":_n_ph_b10,"yAt":_n_yAt_b14,"heat":_n_heat_b13,"F":_n_F_b3,"this":_this}),"_f5")])
	if true:
		var _n_d_b17 = _n_HOT_b15
		while _S.truth((_n_d_b17 <= _n_L_b7)):
			var _n_u_b18 = (float(_n_d_b17)/_n_L_b7)
			var _n_h_b19 = _S.call_value(_n_heat_b13,[_n_d_b17])
			if _S.truth(((_S.MathFX.rand([floori((float(_n_d_b17)/3)),_n_fr_b9,_n_S_b5]) < ((_n_u_b18 - 0.55) * 1.6)) if _S.truth((_n_u_b18 > 0.55)) else (_n_u_b18 > 0.55))):
				_n_d_b17 += 0.5
				continue
			var _n_c_b20 = (_S.index_value(_n_F_b3,6) if _S.truth((_n_h_b19 > 0.55)) else (_S.index_value(_n_F_b3,5) if _S.truth((_n_h_b19 > 0.42)) else (_S.index_value(_n_F_b3,4) if _S.truth((_n_h_b19 > 0.3)) else (_S.index_value(_n_F_b3,3) if _S.truth((_n_h_b19 > 0.18)) else (_S.index_value(_n_F_b3,2) if _S.truth((_n_h_b19 > 0.08)) else _S.index_value(_n_F_b3,1))))))
			_S.invoke(_n_p_b0,"dot",[(-_n_d_b17), _S.call_value(_n_yAt_b14,[_n_d_b17]), _n_c_b20, (1 if _S.truth((_n_u_b18 < 0.85)) else (float((1 - _n_u_b18))/0.15))])
			_n_d_b17 += 0.5
	_S.invoke(_n_p_b0,"glowLine",[(-2), 1, ((-_n_L_b7) * 0.45), 1, 6, _S.index_value(_n_F_b3,4), 0.35])
	_S.invoke(_n_p_b0,"glowLine",[(-2), 1, ((-_n_L_b7) * 0.2), 1, 3, _S.index_value(_n_F_b3,7), 0.3])
	var _n_SP_b16 = [_S.index_value(_n_F_b3,7), _S.index_value(_n_F_b3,6), _S.index_value(_n_F_b3,4), _S.index_value(_n_F_b3,3)]
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b6, 16, (_n_S_b5 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"V":_n_V_b8,"left":_n_left_b11,"p":_n_p_b0,"SP":_n_SP_b16,"this":_this}),"_f7")])
	_S.invoke(_n_p_b0,"sprite",[_n_SLUG, {"w":_n_WHITE,"p":_S.index_value(_n_F_b3,7),"y":_S.index_value(_n_F_b3,6),"o":_S.index_value(_n_F_b3,5)}, (-1), (-1)])
	_S.invoke(_n_p_b0,"glow",[2, 1, 24, _S.index_value(_n_F_b3,4), 0.5])
	_S.invoke(_n_p_b0,"glow",[3, 1, 8, _n_WHITE, 0.55])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.5, 0.7])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_left = _S.read(_parent,"left")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = (((-_n_L) * _S.invoke(_n_r_b2,"range",[0.45, 0.8])) - (_n_age_b0 * 90))
	var _n_y_b5 = ((0.5 + ((sin(((_n_age_b0 * 6) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * _n_age_b0) * 3)) - ((_n_age_b0 * _n_age_b0) * 8))
	if _S.truth((_n_x_b4 < (_n_left + 6))):
		return null
	_S.invoke(_n_puffs,"push",[{"x":_n_x_b4,"y":_n_y_b5,"r":(1.2 + (_n_age_b0 * 4)),"a":(((0.55 * (1 - _n_k_b3)) * minf(1,(_n_age_b0 * 8))) * _S.MathFX.smooth(_n_left,(_n_left + 30),_n_x_b4)),"b":(0.95 - (_n_k_b3 * 0.4)),"w":0}])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_ph = _S.read(_parent,"ph")
	var _n_d_b0 = _S.arg(_args,0)
	return (((1 - pow((float(_n_d_b0)/_n_L),0.8)) + (_S.MathFX.noise(((_n_d_b0 * 0.12) - (_n_t * 40)),_n_S) * 0.12)) + (0.08 * sin(((_n_d_b0 * 0.35) - (_n_ph * 9)))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_L = _S.read(_parent,"L")
	var _n_d_b0 = _S.arg(_args,0)
	return (0.5 + ((sin(((_n_d_b0 * 0.09) + (_n_ph * 2))) * (float(_n_d_b0)/_n_L)) * 0.8))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_HOT = _S.read(_parent,"HOT")
	var _n_ph = _S.read(_parent,"ph")
	var _n_yAt = _S.read(_parent,"yAt")
	var _n_heat = _S.read(_parent,"heat")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_F = _S.read(_parent,"F")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = (-_n_x_b0)
	var _n_u_b3 = (float(_n_d_b2)/_n_HOT)
	if _S.truth(((_n_u_b3 < 0) if _S.truth((_n_u_b3 < 0)) else (_n_u_b3 > 1))):
		return null
	var _n_w_b4 = (0.7 + ((2.3 * pow((1 - _n_u_b3),1.4)) * (0.9 + (0.1 * sin(((_n_d_b2 * 0.8) - (_n_ph * 12)))))))
	var _n_v_b5 = (float(absf((_n_y_b1 - _S.call_value(_n_yAt,[_n_d_b2]))))/_n_w_b4)
	if _S.truth((_n_v_b5 > 1)):
		return null
	var _n_h_b6 = _S.call_value(_n_heat,[_n_d_b2])
	return ((_n_WHITE if _S.truth((_n_h_b6 > 0.8)) else _S.index_value(_n_F,7)) if _S.truth((_n_v_b5 < 0.38)) else ((_S.index_value(_n_F,7) if _S.truth((_n_h_b6 > 0.75)) else (_S.index_value(_n_F,6) if _S.truth((_n_h_b6 > 0.6)) else _S.index_value(_n_F,5))) if _S.truth((_n_v_b5 < 0.7)) else (_S.index_value(_n_F,5) if _S.truth((_n_u_b3 < 0.5)) else _S.index_value(_n_F,4))))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.1, 0.28])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_wake,[(-_S.invoke(_n_r_b2,"range",[4, (_n_L * 0.5)])), (0.5 + _S.invoke(_n_r_b2,"range",[(-0.5), 1])), (-_S.invoke(_n_r_b2,"range",[10, 80])), _S.invoke(_n_r_b2,"range",[(-60), 50]), _n_age_b0, (_n_V * 0.35), 3, 260])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	if _S.truth((_n_x_b3 > (_n_left + 8))):
		_S.call_value(_n_spark,[_n_p, _n_x_b3, _n_y_b4, _n_vx_b5, _n_vy_b6, (1 - (float(_n_age_b0)/_n_life_b1)), _n_SP, 0.45, 0.012, 6])
	return null
