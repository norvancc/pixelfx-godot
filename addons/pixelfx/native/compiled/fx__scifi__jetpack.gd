@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/jetpack.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f0"))
	_S.define(_e, "pack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Jetpack"}, {"desc": "Twin thrusters fire straight down: white-hot cores with shock diamonds inside ragged flames, puffs that cool into smoke billowing below, lit by the fire."}, {"tags": ["scifi", "jetpack", "thrust", "rocket", "fire", "smoke", "flight", "loop"]}, {"size": [96, 116]}, {"origin": [48, 30]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a0e12", "#5c1818", "#a02818", "#e0501a", "#ff8a2a", "#ffc23d", "#fff3a6", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"length": 26}, {"seed": 30}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GAP", 8)
	_S.define(_e, "FR", 30)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_P = _S.read(_parent,"P")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_PF = _S.read(_parent,"PF")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_key_b2 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + ":" + _S.string(_S.prop(_n_o_b0,"length")) + "")
	if _S.truth(_S.invoke(_n_cache,"has",[_n_key_b2])):
		return _S.invoke(_n_cache,"get",[_n_key_b2])
	var _n_rn_b3 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_L_b4 = _S.prop(_n_o_b0,"length")
	var _n_g_b5 = _S.construct(_n_Ghosts,[_n_D, {"sparks":[_n_WHITE, _S.index_value(_n_F_b1,6), _S.index_value(_n_F_b1,5), _S.index_value(_n_F_b1,4)],"box":[(-46), (-28), 46, 84]}])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b6 = _iter_0
		if true:
			var _n_i_b7 = 0
			while _S.truth((_n_i_b7 < 26)):
				_S.invoke(_n_g_b5,"add",[_S.invoke(_n_rn_b3,"range",[0, _n_D]), _S.named_value(_n_P,"FIRE"), ((_n_s_b6 * _n_GAP) + _S.invoke(_n_rn_b3,"range",[(-1.5), 1.5])), (_n_L_b4 * _S.invoke(_n_rn_b3,"range",[0.55, 0.85])), _S.invoke(_n_rn_b3,"range",[(-10), 10]), _S.invoke(_n_rn_b3,"range",[70, 130]), _S.invoke(_n_rn_b3,"range",[0.22, 0.4]), 0, _S.invoke(_n_rn_b3,"range",[2.2, 3.4]), _S.binary("|",_S.named_value(_n_PF,"SMOKES"),(_S.named_value(_n_PF,"BIG") if _S.truth(_S.invoke(_n_rn_b3,"chance",[0.5])) else 0))])
				_n_i_b7 += 1.0
		if true:
			var _n_i_b8 = 0
			while _S.truth((_n_i_b8 < 10)):
				_S.invoke(_n_g_b5,"add",[_S.invoke(_n_rn_b3,"range",[0, _n_D]), _S.named_value(_n_P,"SMOKE"), ((_n_s_b6 * _n_GAP) + _S.invoke(_n_rn_b3,"range",[(-3), 3])), (_n_L_b4 + _S.invoke(_n_rn_b3,"range",[2, 8])), (_n_s_b6 * _S.invoke(_n_rn_b3,"range",[0, 14])), _S.invoke(_n_rn_b3,"range",[40, 80]), _S.invoke(_n_rn_b3,"range",[1.1, 1.6]), 0, _S.invoke(_n_rn_b3,"range",[3, 5]), _S.named_value(_n_PF,"BIG")])
				_n_i_b8 += 1.0
		if true:
			var _n_i_b9 = 0
			while _S.truth((_n_i_b9 < 10)):
				_S.invoke(_n_g_b5,"add",[_S.invoke(_n_rn_b3,"range",[0, _n_D]), _S.named_value(_n_P,"SPARK"), ((_n_s_b6 * _n_GAP) + _S.invoke(_n_rn_b3,"range",[(-1), 1])), (_n_L_b4 * _S.invoke(_n_rn_b3,"range",[0.3, 0.7])), (_n_s_b6 * _S.invoke(_n_rn_b3,"range",[(-40), 60])), _S.invoke(_n_rn_b3,"range",[80, 200]), _S.invoke(_n_rn_b3,"range",[0.2, 0.45])])
				_n_i_b9 += 1.0
		if true:
			var _n_i_b10 = 0
			while _S.truth((_n_i_b10 < 5)):
				_S.invoke(_n_g_b5,"add",[_S.invoke(_n_rn_b3,"range",[0, _n_D]), _S.named_value(_n_P,"EMBER"), ((_n_s_b6 * _n_GAP) + _S.invoke(_n_rn_b3,"range",[(-2), 2])), (_n_L_b4 * _S.invoke(_n_rn_b3,"range",[0.6, 1])), (_n_s_b6 * _S.invoke(_n_rn_b3,"range",[10, 40])), _S.invoke(_n_rn_b3,"range",[20, 60]), _S.invoke(_n_rn_b3,"range",[0.6, 1.1]), _S.index_value(_n_F_b1,4), _S.invoke(_n_rn_b3,"range",[0.8, 1.6])])
				_n_i_b10 += 1.0
	_S.invoke(_n_cache,"set",[_n_key_b2, _n_g_b5])
	return _n_g_b5
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_F_b2 = _S.arg(_args,2)
	var _n_dy_b3 = _S.arg(_args,3)
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b4 = _iter_0
		var _n_cx_b5 = (_n_s_b4 * _n_GAP)
		_S.invoke(_n_p_b0,"shade",[(_n_cx_b5 - 5), ((-24) + _n_dy_b3), (_n_cx_b5 + 5), ((-3) + _n_dy_b3), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b5,"dy":_n_dy_b3,"H":_n_H_b1,"this":_this}),"_f2")])
		if true:
			var _n_y_b6 = (-3)
			while _S.truth((_n_y_b6 <= 0)):
				var _n_w_b7 = (2 + ((_n_y_b6 + 3) * 0.7))
				if true:
					var _n_x_b8 = floori((_n_cx_b5 - _n_w_b7))
					while _S.truth((_n_x_b8 <= ceili((_n_cx_b5 + _n_w_b7)))):
						var _n_inner_b9 = _S.logical("&&",(absf(((_n_x_b8 + 0.5) - _n_cx_b5)) < (_n_w_b7 - 1.2)),func():return (_n_y_b6 >= (-1)))
						_S.invoke(_n_p_b0,"px",[_n_x_b8, (_n_y_b6 + _n_dy_b3), ((_S.index_value(_n_F_b2,6) if _S.truth(_S.binary("===",_n_y_b6,0)) else _S.index_value(_n_F_b2,4)) if _S.truth(_n_inner_b9) else (_S.index_value(_n_H_b1,0) if _S.truth((absf(((_n_x_b8 + 0.5) - _n_cx_b5)) > (_n_w_b7 - 0.6))) else (_S.index_value(_n_H_b1,3) if _S.truth((_n_x_b8 < _n_cx_b5)) else _S.index_value(_n_H_b1,1))))])
						_n_x_b8 += 1.0
				_n_y_b6 += 1.0
	if true:
		var _n_y_b10 = (-20)
		while _S.truth((_n_y_b10 <= (-6))):
			_S.invoke(_n_p_b0,"px",[(-1), (_n_y_b10 + _n_dy_b3), _S.index_value(_n_H_b1,1)])
			_S.invoke(_n_p_b0,"px",[0, (_n_y_b10 + _n_dy_b3), _S.index_value(_n_H_b1,2)])
			_S.invoke(_n_p_b0,"px",[1, (_n_y_b10 + _n_dy_b3), _S.index_value(_n_H_b1,0)])
			_n_y_b10 += 1.0
	_S.invoke(_n_p_b0,"px",[0, ((-16) + _n_dy_b3), _S.index_value(_n_F_b2,5)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_dy = _S.read(_parent,"dy")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((_n_x_b0 - _n_cx))/4.5)
	var _n_top_b4 = ((-19) + _n_dy)
	var _n_v_b5 = ((float((_n_y_b1 - _n_top_b4))/4.5) if _S.truth((_n_y_b1 < _n_top_b4)) else 0)
	if _S.truth((((_n_u_b3 * _n_u_b3) + (_n_v_b5 * _n_v_b5)) > 1)):
		return null
	var _n_l_b6 = (((-_n_u_b3) * 0.8) - (_n_v_b5 * 0.6))
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((((_n_u_b3 * _n_u_b3) + (_n_v_b5 * _n_v_b5)) > 0.78)) else (_S.index_value(_n_H,1) if _S.truth((absf((_n_y_b1 - ((-12) + _n_dy))) < 0.6)) else (_S.index_value(_n_H,5) if _S.truth((_n_l_b6 > 0.55)) else (_S.index_value(_n_H,4) if _S.truth((_n_l_b6 > 0.15)) else (_S.index_value(_n_H,3) if _S.truth((_n_l_b6 > (-0.35))) else _S.index_value(_n_H,2)))))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_FR = _S.read(_parent,"FR")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_pack = _S.read(_parent,"pack")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_ph_b5 = (float(_n_t_b1)/_n_D)
	var _n_f_b6 = fmod(floori((_n_t_b1 * _n_FR)),floori((_n_D * _n_FR)+0.5))
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_dy_b8 = floori((sin(((_n_TAU * 12) * _n_ph_b5)) * 0.6)+0.5)
	var _n_g_b9 = _S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_F_b3]),"at",[_n_t_b1])
	_S.invoke(_n_g_b9,"draw",[_n_p_b0, "back"])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b10 = _iter_0
		var _n_cx_b11 = ((_n_s_b10 * _n_GAP) + ((_n_s_b10 * 0.5) if _S.truth((_S.MathFX.rand([_n_S_b7,_n_f_b6,_n_s_b10]) < 0.15)) else 0))
		var _n_L_b12 = (_S.prop(_n_o_b2,"length") * ((0.92 + (0.08 * sin((((_n_TAU * 7) * _n_ph_b5) + _n_s_b10)))) + (0.06 * (_S.MathFX.rand([_n_S_b7,_n_f_b6,_n_s_b10,1]) - 0.5))))
		_S.invoke(_n_p_b0,"shade",[(_n_cx_b11 - 7), _n_dy_b8, (_n_cx_b11 + 7), ((_n_dy_b8 + _n_L_b12) + 4), _S.function_value(_S.capture(_parent,{"dy":_n_dy_b8,"L":_n_L_b12,"cx":_n_cx_b11,"s":_n_s_b10,"ph":_n_ph_b5,"S":_n_S_b7,"F":_n_F_b3,"this":_this}),"_f4")])
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < 3)):
				var _n_y_b14 = floori((((_n_dy_b8 + 5) + (_n_i_b13 * 6.5)) + (sin((((_n_TAU * 4) * _n_ph_b5) + _n_i_b13)) * 0.5))+0.5)
				var _n_r_b15 = floori(((2.2 - (_n_i_b13 * 0.45)) + (0.4 * sin((((_n_TAU * 8) * _n_ph_b5) + (_n_i_b13 * 2)))))+0.5)
				if _S.truth(((_n_y_b14 > (_n_dy_b8 + (_n_L_b12 * 0.75))) if _S.truth((_n_y_b14 > (_n_dy_b8 + (_n_L_b12 * 0.75)))) else (_n_r_b15 < 1))):
					break
				if true:
					var _n_yy_b16 = (-_n_r_b15)
					while _S.truth((_n_yy_b16 <= _n_r_b15)):
						if true:
							var _n_xx_b17 = (-_n_r_b15)
							while _S.truth((_n_xx_b17 <= _n_r_b15)):
								var _n_d_b18 = (absf(_n_xx_b17) + absf(_n_yy_b16))
								if _S.truth((_n_d_b18 <= _n_r_b15)):
									_S.invoke(_n_p_b0,"px",[(_n_cx_b11 + _n_xx_b17), (_n_y_b14 + _n_yy_b16), (_n_WHITE if _S.truth((_n_d_b18 < _n_r_b15)) else (_S.index_value(_n_F_b3,6) if _S.truth(_S.binary("===",_n_i_b13,0)) else _S.index_value(_n_F_b3,5)))])
								_n_xx_b17 += 1.0
						_n_yy_b16 += 1.0
				_S.invoke(_n_p_b0,"glow",[_n_cx_b11, _n_y_b14, 6, _S.index_value(_n_F_b3,6), 0.35])
				_n_i_b13 += 1.0
		_S.invoke(_n_p_b0,"glow",[_n_cx_b11, (_n_dy_b8 + 2), 9, _n_WHITE, 0.45])
		_S.invoke(_n_p_b0,"glow",[_n_cx_b11, (_n_dy_b8 + (_n_L_b12 * 0.45)), (_n_L_b12 * 0.8), _S.index_value(_n_F_b3,4), 0.35])
	_S.call_value(_n_pack,[_n_p_b0, _n_H_b4, _n_F_b3, _n_dy_b8])
	_S.invoke(_n_g_b9,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_p_b0,"glow",[0, (_S.prop(_n_o_b2,"length") + 14), 34, _S.index_value(_n_F_b3,4), 0.16])
	_S.invoke(_n_p_b0,"glow",[0, (_S.prop(_n_o_b2,"length") * 0.4), 30, _S.index_value(_n_F_b3,5), 0.18])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_dy = _S.read(_parent,"dy")
	var _n_L = _S.read(_parent,"L")
	var _n_cx = _S.read(_parent,"cx")
	var _n_s = _S.read(_parent,"s")
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_F = _S.read(_parent,"F")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float((_n_y_b1 - _n_dy))/_n_L)
	var _n_w_b4 = (_S.numeric_lerp(3.4,0.6,_n_v_b3) + ((1.4 * sin((_n_v_b3 * PI))) * (1 if _S.truth((_n_v_b3 < 1)) else 0)))
	var _n_n_b5 = _S.NoiseKernels.tile_fbm(((float((_n_x_b0 - _n_cx))/3) + (_n_s * 5)),((float((_n_y_b1 - _n_dy))/4) - (_n_ph * 20)),0,10,(_n_S + (9 if _S.truth((_n_s > 0)) else 0)),2)
	var _n_q_b6 = ((float(absf((_n_x_b0 - _n_cx)))/_n_w_b4) + (_n_n_b5 * 0.45))
	if _S.truth(((_n_v_b3 > 1.15) if _S.truth((_n_v_b3 > 1.15)) else (_n_q_b6 > 1.2))):
		return null
	var _n_heat_b7 = ((((1 - _n_v_b3) * 1.15) - (_n_q_b6 * 0.9)) + (_n_n_b5 * 0.25))
	if _S.truth((_n_q_b6 > 0.95)):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_F,3) if _S.truth((_n_heat_b7 > 0.2)) else _S.index_value(_n_F,2)),"=")
		if _S.truth((_n_heat_b7 < (-0.3))):
			_S.set_prop(_n_out_b2,"a",0.5,"=")
		return null
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_heat_b7 > 0.82)) else (_S.index_value(_n_F,6) if _S.truth((_n_heat_b7 > 0.62)) else (_S.index_value(_n_F,5) if _S.truth((_n_heat_b7 > 0.42)) else (_S.index_value(_n_F,4) if _S.truth((_n_heat_b7 > 0.22)) else (_S.index_value(_n_F,3) if _S.truth((_n_heat_b7 > 0.02)) else _S.index_value(_n_F,2)))))),"=")
	return null
