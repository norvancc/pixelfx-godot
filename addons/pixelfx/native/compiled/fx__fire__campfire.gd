@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/campfire.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "lick", _S.import_value("fx/fire/_lib.js", "lick"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "sparkAt", _S.import_value("fx/fire/_lib.js", "sparkAt"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "log", _S.function_value(_e, "_f0"))
	_S.define(_e, "coals", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Campfire"}, {"desc": "Crossed logs on a bed of coals and a lively fire: tongues that lick and leap, popping sparks, embers drifting up, smoke curling off, a warm pool of light."}, {"tags": ["fire", "campfire", "prop", "light", "smoke", "ambient", "loop"]}, {"size": [128, 128]}, {"origin": [64, 112]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"wood": ["#0e080a", "#24130f", "#3b2216", "#5a3520", "#8a5a34", "#b9884f"]}, {"height": 22}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "ASH", [_S.call_value(_S.read(_e, "hex"), ["#2a2530"]), _S.call_value(_S.read(_e, "hex"), ["#4a4350"]), _S.call_value(_S.read(_e, "hex"), ["#6b6270"])])
	_S.define(_e, "LOGS", [[_S.unary("-", 19), 2, 15, _S.unary("-", 12), 3.4], [19, 2, _S.unary("-", 15), _S.unary("-", 12), 3.4]])
	_S.define(_e, "CROSS", 0.56)
	_S.define(_e, "BIG_LAYERS", [[1, 1, 6], [0.8, 0.9, 5], [0.62, 0.78, 4], [0.44, 0.6, 3], [0.26, 0.4, 1], [0.12, 0.22, 0]])
	_S.define(_e, "TONGUES", [[_S.unary("-", 7.5), _S.unary("-", 7), 0.42, 1.8, 1], [7.5, _S.unary("-", 7), 0.46, 1.8, 1], [_S.unary("-", 3), _S.unary("-", 9), 0.78, 2, 1], [3.2, _S.unary("-", 9), 0.82, 2, 1], [_S.unary("-", 12), _S.unary("-", 3), 0.14, 1.3, 0], [12.5, _S.unary("-", 3), 0.16, 1.3, 0], [_S.unary("-", 9.5), _S.unary("-", 4.5), 0.3, 1.9, 0], [9.5, _S.unary("-", 4.5), 0.34, 1.9, 0], [_S.unary("-", 5), _S.unary("-", 6), 0.6, 2.6, 0], [5.2, _S.unary("-", 6), 0.66, 2.6, 0], [0, _S.unary("-", 7), 1, 3.4, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "W", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "u0", _S.arg(_args, 4))
	_S.define(_e, "u1", _S.arg(_args, 5))
	_S.define(_e, "t", _S.arg(_args, 6))
	_S.define(_e, "S", _S.arg(_args, 7))
	var _v0 = _S.read(_e, "L")
	_S.define(_e, "x0", _S.prop(_v0, 0))
	_S.define(_e, "y0", _S.prop(_v0, 1))
	_S.define(_e, "x1", _S.prop(_v0, 2))
	_S.define(_e, "y1", _S.prop(_v0, 3))
	_S.define(_e, "r", _S.prop(_v0, 4))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "ax", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "len")))
	_S.define(_e, "ay", _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "len")))
	_S.define(_e, "nx", _S.unary("-", _S.read(_e, "ay")))
	_S.define(_e, "ny", _S.read(_e, "ax"))
	if _S.truth(_S.binary("<", _S.read(_e, "ny"), 0)):
		_S.last([_S.write(_e, "nx", _S.unary("-", _S.read(_e, "nx")), "=", false), _S.write(_e, "ny", _S.unary("-", _S.read(_e, "ny")), "=", false)])
	_S.define(_e, "rim", _S.binary("-", 1, _S.binary("/", 1.05, _S.read(_e, "r"))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x0"), _S.read(_e, "x1")]), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y0"), _S.read(_e, "y1")]), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "x0"), _S.read(_e, "x1")]), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "y0"), _S.read(_e, "y1")]), _S.read(_e, "r")), 1), _S.function_value(_e, "_f1")])
	if _S.truth(_S.binary("<=", _S.read(_e, "u0"), 0)):
		_S.invoke(_S.read(_e, "p"), "ellipse", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "r"), 0.62), _S.binary("+", _S.read(_e, "r"), 0.2), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_ax = _S.read(_parent,"ax")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_ay = _S.read(_parent,"ay")
	var _n_len = _S.read(_parent,"len")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_r = _S.read(_parent,"r")
	var _n_u0 = _S.read(_parent,"u0")
	var _n_u1 = _S.read(_parent,"u1")
	var _n_S = _S.read(_parent,"S")
	var _n_rim = _S.read(_parent,"rim")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_along_b3 = (((_n_x_b0 - _n_x0) * _n_ax) + ((_n_y_b1 - _n_y0) * _n_ay))
	var _n_u_b4 = (float(_n_along_b3)/_n_len)
	var _n_s_b5 = (float((((_n_x_b0 - _n_x0) * _n_nx) + ((_n_y_b1 - _n_y0) * _n_ny)))/_n_r)
	if _S.truth((((_n_u_b4 < _n_u0) if _S.truth((_n_u_b4 < _n_u0)) else (_n_u_b4 > _n_u1)) if _S.truth(((_n_u_b4 < _n_u0) if _S.truth((_n_u_b4 < _n_u0)) else (_n_u_b4 > _n_u1))) else (absf(_n_s_b5) > 1))):
		return null
	var _n_burn_b6 = clampf((1.2 - (float(absf(_n_x_b0))/8)),0.0,1.0)
	var _n_lane_b7 = floori(((_n_s_b5 * _n_r) * 0.85)+0.5)
	var _n_run_b8 = _S.MathFX.rand([floori((float(_n_along_b3)/3)),_n_lane_b7,_n_S])
	if _S.truth(_S.logical("||",(absf(_n_s_b5) > _n_rim),func():return (_n_along_b3 > (_n_len - 1)))):
		return (_S.index_value(_n_H,7) if _S.truth(((_n_burn_b6 > 0.4) if _S.truth((_n_s_b5 < 0)) else (_n_s_b5 < 0))) else _S.index_value(_n_W,0))
	if _S.truth(((_n_lane_b7 < 2) if _S.truth((_n_burn_b6 > 0.35)) else (_n_burn_b6 > 0.35))):
		if _S.truth(((_n_lane_b7 > (-2)) if _S.truth((_n_run_b8 < 0.55)) else (_n_run_b8 < 0.55))):
			var _n_g_b9 = (0.5 + (0.5 * sin(((((float(_n_t)/_n_D) * PI) * 6) + (_S.MathFX.rand([floori((float(_n_along_b3)/2)),_n_lane_b7,(_n_S + 1)]) * 6.3)))))
			_S.set_prop(_n_out_b2,"k",((0.3 * _n_burn_b6) * _n_g_b9),"=")
			return (_S.index_value(_n_H,3) if _S.truth((_n_g_b9 > 0.72)) else (_S.index_value(_n_H,4) if _S.truth((_n_g_b9 > 0.4)) else _S.index_value(_n_H,5)))
		return (_S.index_value(_n_W,1) if _S.truth((_n_lane_b7 < (-1))) else _S.index_value(_n_W,0))
	if _S.truth((_n_lane_b7 <= (-2))):
		return (_S.index_value(_n_W,2) if _S.truth((_n_run_b8 < 0.25)) else _S.ColorFX.mix(_S.index_value(_n_W,3),_S.index_value(_n_H,4),(0.45 * _n_burn_b6)))
	if _S.truth(_S.binary("===",_n_lane_b7,(-1))):
		return (_S.index_value(_n_W,1) if _S.truth((_n_run_b8 < 0.45)) else _S.index_value(_n_W,2))
	if _S.truth(_S.binary("===",_n_lane_b7,0)):
		return (_S.index_value(_n_W,1) if _S.truth((_n_run_b8 < 0.2)) else _S.index_value(_n_W,2))
	return (_S.index_value(_n_W,0) if _S.truth((_n_run_b8 < 0.4)) else _S.index_value(_n_W,1))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_W,0) if _S.truth((_n_d_b0 > 0.78)) else (_S.index_value(_n_W,5) if _S.truth((_n_d_b0 > 0.56)) else (_S.index_value(_n_W,4) if _S.truth((_n_d_b0 > 0.32)) else _S.index_value(_n_W,3))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_S_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"shade",[(-15), (-3), 15, 2, _S.function_value(_S.capture(_parent,{"S":_n_S_b4,"t":_n_t_b3,"H":_n_H_b2,"W":_n_W_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_ASH = _S.read(_parent,"ASH")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float(_n_x_b0)/14)
	var _n_dy_b4 = (float((_n_y_b1 + 0.3))/2.2)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 > 1)):
		return null
	var _n_h_b6 = _S.MathFX.rand([floori((float(_n_x_b0)/2)),floori(_n_y_b1),(_n_S + 20)])
	if _S.truth(((_n_h_b6 < 0.55) if _S.truth((_n_d_b5 > 0.55)) else (_n_d_b5 > 0.55))):
		return _S.index_value(_n_ASH,(2 if _S.truth((_n_h_b6 < 0.15)) else (1 if _S.truth((_n_h_b6 < 0.32)) else 0)))
	if _S.truth((_n_h_b6 > 0.5)):
		var _n_g_b7 = ((0.5 + (0.5 * sin(((((float(_n_t)/_n_D) * PI) * 4) + (_n_h_b6 * 40))))) * (1.1 - _n_d_b5))
		_S.set_prop(_n_out_b2,"k",(0.35 * _n_g_b7),"=")
		return (_S.index_value(_n_H,2) if _S.truth((_n_g_b7 > 0.7)) else (_S.index_value(_n_H,3) if _S.truth((_n_g_b7 > 0.5)) else (_S.index_value(_n_H,4) if _S.truth((_n_g_b7 > 0.3)) else _S.index_value(_n_H,5))))
	return (_S.index_value(_n_W,1) if _S.truth((_n_h_b6 > 0.3)) else _S.index_value(_n_W,0))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SMOKE1 = _S.read(_parent,"SMOKE1")
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_D = _S.read(_parent,"D")
	var _n_looped = _S.read(_parent,"looped")
	var _n_coals = _S.read(_parent,"coals")
	var _n_log = _S.read(_parent,"log")
	var _n_CROSS = _S.read(_parent,"CROSS")
	var _n_LOGS = _S.read(_parent,"LOGS")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_W_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"wood"),6)
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_R_b7 = _S.construct(_n_Rng,[_n_S_b6])
	var _n_HC_b8 = _S.named_value(_n_o_b2,"height")
	var _n_N_b9 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f6")
	var _n_fla_b10 = _S.function_value(_S.capture(_parent,{"S":_n_S_b6,"this":_this}),"_f7")
	var _n_fl_b11 = _S.call_value(_n_fla_b10,[_n_t_b1])
	var _n_GLOW_b12 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SMOKE_b13 = _S.ColorFX.mix(_n_SMOKE1,_S.index_value(_n_H_b4,6),0.25)
	var _n_SPARKS_b14 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,5)]
	var _n_EMB_b15 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6)]
	var _n_T_b16 = _S.invoke(_n_TONGUES,"map",[_S.function_value(_S.capture(_parent,{"R":_n_R_b7,"HC":_n_HC_b8,"S":_n_S_b6,"this":_this}),"_f8")])
	var _n_lean_b17 = _S.function_value(_S.capture(_parent,{"S":_n_S_b6,"this":_this}),"_f9")
	var _n_height_b18 = _S.function_value(_S.capture(_parent,{"T":_n_T_b16,"fla":_n_fla_b10,"this":_this}),"_f10")
	var _n_sweep_b19 = _S.function_value(_S.capture(_parent,{"T":_n_T_b16,"lean":_n_lean_b17,"this":_this}),"_f11")
	var _n_tip_b20 = _S.function_value(_S.capture(_parent,{"height":_n_height_b18,"T":_n_T_b16,"sweep":_n_sweep_b19,"this":_this}),"_f12")
	var _n_tongueAt_b21 = _S.function_value(_S.capture(_parent,{"T":_n_T_b16,"height":_n_height_b18,"t":_n_t_b1,"p":_n_p_b0,"sweep":_n_sweep_b19,"N":_n_N_b9,"H":_n_H_b4,"this":_this}),"_f13")
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 48, (_n_S_b6 + 300), _S.function_value(_S.capture(_parent,{"HC":_n_HC_b8,"this":_this}),"_f14"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"t":_n_t_b1,"S":_n_S_b6,"SMOKE":_n_SMOKE_b13,"this":_this}),"_f15")])
	var _n_puffs_b22 = []
	_S.call_value(_n_looped,[_n_t_b1, _n_D, (_S.prop(_n_T_b16,"length") * 24), (_n_S_b6 + 200), _S.function_value(_S.capture(_parent,{"T":_n_T_b16,"this":_this}),"_f16"), _S.function_value(_S.capture(_parent,{"tip":_n_tip_b20,"t":_n_t_b1,"puffs":_n_puffs_b22,"p":_n_p_b0,"this":_this}),"_f17")])
	_S.call_value(_n_coals,[_n_p_b0, _n_W_b5, _n_H_b4, _n_t_b1, _n_S_b6])
	for _iter_0 in _S.array(_n_LOGS):
		var _n_L_b25 = _iter_0
		_S.call_value(_n_log,[_n_p_b0, _n_L_b25, _n_W_b5, _n_H_b4, _n_CROSS, 1, _n_t_b1, (_n_S_b6 + 11)])
	if true:
		var _n_i_b26 = 0
		while _S.truth((_n_i_b26 < _S.prop(_n_T_b16,"length"))):
			if _S.truth(_S.named_value(_S.index_value(_n_T_b16,_n_i_b26),"back")):
				_S.call_value(_n_tongueAt_b21,[_n_i_b26])
			_n_i_b26 += 1.0
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 90, (_n_S_b6 + 210), _S.function_value(_S.capture(_parent,{"this":_this}),"_f18"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f19")])
	if true:
		var _n_i_b27 = 0
		while _S.truth((_n_i_b27 < _S.prop(_n_T_b16,"length"))):
			if _S.truth(not _S.truth(_S.named_value(_S.index_value(_n_T_b16,_n_i_b27),"back"))):
				_S.call_value(_n_tongueAt_b21,[_n_i_b27])
			_n_i_b27 += 1.0
	_S.call_value(_n_looped,[_n_t_b1, _n_D, (_S.prop(_n_T_b16,"length") * 12), (_n_S_b6 + 220), _S.function_value(_S.capture(_parent,{"T":_n_T_b16,"this":_this}),"_f20"), _S.function_value(_S.capture(_parent,{"tip":_n_tip_b20,"t":_n_t_b1,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f21")])
	for _iter_1 in _S.array(_n_puffs_b22):
		var _tuple_2 = _iter_1
		var _n_x_b28 = _S.prop(_tuple_2,0)
		var _n_y_b29 = _S.prop(_tuple_2,1)
		var _n_k_b30 = _S.prop(_tuple_2,2)
		var _n_s_b31 = _S.prop(_tuple_2,3)
		var _n_f_b32 = _S.prop(_tuple_2,4)
		_S.call_value(_n_firePuff,[_n_p_b0, _n_x_b28, _n_y_b29, _n_k_b30, _n_s_b31, _n_f_b32, _n_H_b4])
	for _iter_3 in _S.array(_n_LOGS):
		var _n_L_b33 = _iter_3
		_S.call_value(_n_log,[_n_p_b0, _n_L_b33, _n_W_b5, _n_H_b4, 0, _n_CROSS, _n_t_b1, (_n_S_b6 + 11)])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 4, (_n_S_b6 + 400), _S.function_value(_S.capture(_parent,{"this":_this}),"_f22"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"H":_n_H_b4,"SPARKS":_n_SPARKS_b14,"this":_this}),"_f23")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 36, (_n_S_b6 + 500), _S.function_value(_S.capture(_parent,{"this":_this}),"_f24"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"EMB":_n_EMB_b15,"this":_this}),"_f25")])
	var _n_br_b23 = (0.92 + (0.08 * _S.call_value(_n_N_b9,[0.67, (_n_S_b6 + 3)])))
	var _n_lx_b24 = (_S.call_value(_n_lean_b17,[_n_t_b1]) * 12)
	_S.invoke(_n_p_b0,"glow",[_n_lx_b24, (-8), ((74 * _n_br_b23) * (0.9 + (0.1 * _n_fl_b11))), _n_GLOW_b12, (0.3 * _n_fl_b11)])
	for _iter_4 in _S.array([[(-6), (-17), 0.85], [0, (-21), 1], [6, (-17), 0.85]]):
		var _tuple_5 = _iter_4
		var _n_x_b34 = _S.prop(_tuple_5,0)
		var _n_y_b35 = _S.prop(_tuple_5,1)
		var _n_k_b36 = _S.prop(_tuple_5,2)
		_S.invoke(_n_p_b0,"glow",[(_n_x_b34 + _n_lx_b24), _n_y_b35, (46 * _n_br_b23), _n_GLOW_b12, ((0.3 * _n_k_b36) * _n_fl_b11)])
		_S.invoke(_n_p_b0,"glow",[(_n_x_b34 * 0.6), (_n_y_b35 + 13), 15, _S.index_value(_n_H_b4,2), ((0.16 * _n_k_b36) * _n_fl_b11)])
	_S.invoke(_n_p_b0,"glow",[0, (-3), 9, _S.index_value(_n_H_b4,0), (0.16 * _n_fl_b11)])
	_S.call_value(_n_floorLight,[_n_p_b0, 0, 0.5, 48, 8, _n_GLOW_b12, (0.3 * _n_fl_b11)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, _n_rate_b0, _n_seed_b1, _n_off_b2])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((0.74 + (0.16 * _S.call_value(_n_NL,[_n_tt_b0, 7.3, (_n_S + 1)]))) + (0.1 * _S.call_value(_n_NL,[_n_tt_b0, 19, (_n_S + 2)])))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_HC = _S.read(_parent,"HC")
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_dx_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_h_b2 = _S.prop(_tuple_0,2)
	var _n_w_b3 = _S.prop(_tuple_0,3)
	var _n_back_b4 = _S.prop(_tuple_0,4)
	var _n_i_b5 = _S.arg(_args,1)
	return {"dx":(_n_dx_b0 + _S.invoke(_n_R,"range",[(-0.4), 0.4])),"y":_n_y_b1,"h":(3 + ((_n_HC * _n_h_b2) * _S.invoke(_n_R,"range",[0.92, 1.08]))),"w":(_n_w_b3 * _S.invoke(_n_R,"range",[0.9, 1.1])),"back":_n_back_b4,"env":_n_h_b2,"n":(((_n_S * 7) + _n_i_b5) * 13)}
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_NL,[_n_tt_b0, 0.67, (_n_S + 90)]) * 0.12)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_NL = _S.read(_parent,"NL")
	var _n_fla = _S.read(_parent,"fla")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _object_0 = _S.index_value(_n_T,_n_i_b0)
	var _n_h_b2 = _S.named_value(_object_0,"h")
	var _n_n_b3 = _S.named_value(_object_0,"n")
	var _n_leap_b4 = (maxf(0,(_S.call_value(_n_NL,[_n_tt_b1, 2.6, (_n_n_b3 + 70)]) - 0.55)) * 1.4)
	return (((_n_h_b2 + ((0.25 * _n_h_b2) * _S.call_value(_n_NL,[_n_tt_b1, 3.3, _n_n_b3]))) + (_n_h_b2 * _n_leap_b4)) * (0.9 + (0.1 * _S.call_value(_n_fla,[_n_tt_b1]))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_T = _S.read(_parent,"T")
	var _n_lean = _S.read(_parent,"lean")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.arg(_args,2)
	return (((_S.call_value(_n_NL,[_n_tt_b1, 2.2, (_S.named_value(_S.index_value(_n_T,_n_i_b0),"n") + 40)]) * (1 + (_n_h_b2 * 0.08))) + ((_S.call_value(_n_lean,[_n_tt_b1]) * _n_h_b2) * 0.9)) - clampf((_S.named_value(_S.index_value(_n_T,_n_i_b0),"dx") * 0.3),(-2.5),2.5))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_height = _S.read(_parent,"height")
	var _n_T = _S.read(_parent,"T")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.call_value(_n_height,[_n_i_b0, _n_tt_b1])
	return [(_S.named_value(_S.index_value(_n_T,_n_i_b0),"dx") + (_S.call_value(_n_sweep,[_n_i_b0, _n_tt_b1, _n_h_b2]) * 0.85)), ((_S.named_value(_S.index_value(_n_T,_n_i_b0),"y") - (_n_h_b2 * 0.88)) + 3), _n_h_b2]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_height = _S.read(_parent,"height")
	var _n_t = _S.read(_parent,"t")
	var _n_p = _S.read(_parent,"p")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_N = _S.read(_parent,"N")
	var _n_H = _S.read(_parent,"H")
	var _n_BACK_LAYERS = _S.read(_parent,"BACK_LAYERS")
	var _n_BIG_LAYERS = _S.read(_parent,"BIG_LAYERS")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_i_b0 = _S.arg(_args,0)
	var _object_0 = _S.index_value(_n_T,_n_i_b0)
	var _n_dx_b1 = _S.named_value(_object_0,"dx")
	var _n_y_b2 = _S.named_value(_object_0,"y")
	var _n_w_b3 = _S.named_value(_object_0,"w")
	var _n_n_b4 = _S.named_value(_object_0,"n")
	var _n_back_b5 = _S.named_value(_object_0,"back")
	var _n_h_b6 = _S.call_value(_n_height,[_n_i_b0, _n_t])
	_S.call_value(_n_flameTongue,[_n_p, _n_dx_b1, _n_y_b2, _n_h_b6, _n_w_b3, _S.call_value(_n_sweep,[_n_i_b0, _n_t, _n_h_b6]), _n_N, _n_n_b4, _n_H, (_n_BACK_LAYERS if _S.truth(_n_back_b5) else (_n_BIG_LAYERS if _S.truth((_n_w_b3 > 2.2)) else _n_LAYERS)), 0.5, (1.1 + (_n_h_b6 * 0.04))])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_HC = _S.read(_parent,"HC")
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-5), 5]),"y":(((-_n_HC) * 0.8) - _S.invoke(_n_r_b0,"range",[0, 8])),"vx":_S.invoke(_n_r_b0,"range",[(-2), 2]),"vy":(-_S.invoke(_n_r_b0,"range",[10, 17])),"life":_S.invoke(_n_r_b0,"range",[2, 2.9]),"s":_S.invoke(_n_r_b0,"range",[2.4, 3.8])}
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_SMOKE = _S.read(_parent,"SMOKE")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 4, (-20), 1.6, 1])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_smokePuff,[_n_p, (_n_x_b2 + (_S.call_value(_n_NL,[(_n_t - _n_age_b1), 0.8, (_n_S + 60)]) * (2 + (3 * _n_age_b1)))), _n_y_b3, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_SMOKE])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	var _n_i_b2 = fmod(_n_j_b1,_S.prop(_n_T,"length"))
	var _n_fire_b3 = _S.invoke(_n_r_b0,"range",[0.14, 0.3])
	var _n_smokes_b4 = _S.invoke(_n_r_b0,"chance",[0.45])
	return {"i":_n_i_b2,"fire":_n_fire_b3,"smokes":_n_smokes_b4,"sl":_S.invoke(_n_r_b0,"range",[0.8, 1.4]),"ox":_S.invoke(_n_r_b0,"range",[(-1), 1]),"oy":_S.invoke(_n_r_b0,"range",[0, 4]),"vx":_S.invoke(_n_r_b0,"range",[(-4), 4]),"vy":(-_S.invoke(_n_r_b0,"range",[15, 30])),"s":(_S.invoke(_n_r_b0,"range",[0.8, 1.6]) * (0.8 + (0.6 * _S.named_value(_S.index_value(_n_T,_n_i_b2),"env")))),"f":_S.invoke(_n_r_b0,"next",[]),"life":(_n_fire_b3 + (1.4 if _S.truth(_n_smokes_b4) else 0))}
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_tip = _S.read(_parent,"tip")
	var _n_t = _S.read(_parent,"t")
	var _n_drift = _S.read(_parent,"drift")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_p = _S.read(_parent,"p")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_tip,[_S.named_value(_n_q_b0,"i"), (_n_t - _n_age_b1)])
	var _n_tx_b2 = _S.prop(_tuple_0,0)
	var _n_ty_b3 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_drift,[(_n_tx_b2 + _S.named_value(_n_q_b0,"ox")), (_n_ty_b3 + _S.named_value(_n_q_b0,"oy")), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), minf(_n_age_b1,_S.named_value(_n_q_b0,"fire")), 0, (-95), 5, 3.2])
	var _n_x_b4 = _S.prop(_tuple_1,0)
	var _n_y_b5 = _S.prop(_tuple_1,1)
	var _n_vx_b6 = _S.prop(_tuple_1,2)
	var _n_vy_b7 = _S.prop(_tuple_1,3)
	if _S.truth((_n_age_b1 < _S.named_value(_n_q_b0,"fire"))):
		return _S.invoke(_n_puffs,"push",[[_n_x_b4, _n_y_b5, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"fire"))), _S.named_value(_n_q_b0,"s"), _S.named_value(_n_q_b0,"f")]])
	if _S.truth(((_n_age_b1 - _S.named_value(_n_q_b0,"fire")) > _S.named_value(_n_q_b0,"sl"))):
		return null
	var _tuple_2 = _S.call_value(_n_drift,[_n_x_b4, _n_y_b5, (_n_vx_b6 * 0.6), ((_n_vy_b7 * 0.6) - 6), (_n_age_b1 - _S.named_value(_n_q_b0,"fire")), 2, (-16), 1.6, 1.2])
	var _n_sx_b8 = _S.prop(_tuple_2,0)
	var _n_sy_b9 = _S.prop(_tuple_2,1)
	_S.call_value(_n_smokePuff,[_n_p, _n_sx_b8, _n_sy_b9, (1 - (float((_n_age_b1 - _S.named_value(_n_q_b0,"fire")))/_S.named_value(_n_q_b0,"sl"))), (_S.named_value(_n_q_b0,"s") * 0.7), 0])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-10), 10]),"y":(-_S.invoke(_n_r_b0,"range",[3, 8])),"vx":_S.invoke(_n_r_b0,"range",[(-5), 5]),"vy":(-_S.invoke(_n_r_b0,"range",[20, 40])),"life":_S.invoke(_n_r_b0,"range",[0.16, 0.3]),"s":_S.invoke(_n_r_b0,"range",[1, 1.8]),"f":_S.invoke(_n_r_b0,"next",[])}
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-95), 5, 3.2])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_firePuff,[_n_p, _n_x_b2, _n_y_b3, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _S.named_value(_n_q_b0,"f"), _n_H])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return {"i":fmod(_n_j_b1,_S.prop(_n_T,"length")),"vx":_S.invoke(_n_r_b0,"range",[(-3), 3]),"vy":(-_S.invoke(_n_r_b0,"range",[12, 22])),"s":(_S.invoke(_n_r_b0,"range",[0.9, 1.6]) * (0.8 + (0.5 * _S.named_value(_S.index_value(_n_T,fmod(_n_j_b1,_S.prop(_n_T,"length"))),"env")))),"life":0.26}
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_tip = _S.read(_parent,"tip")
	var _n_t = _S.read(_parent,"t")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_lick = _S.read(_parent,"lick")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_tip,[_S.named_value(_n_q_b0,"i"), (_n_t - _n_age_b1)])
	var _n_tx_b2 = _S.prop(_tuple_0,0)
	var _n_ty_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_lick,[_n_p, (_n_tx_b2 + (_S.named_value(_n_q_b0,"vx") * _n_age_b1)), ((_n_ty_b3 - 2) + (_S.named_value(_n_q_b0,"vy") * _n_age_b1)), (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_H])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-9), 9]),"y":(-_S.invoke(_n_r_b0,"range",[4, 9])),"n":_S.invoke(_n_r_b0,"int",[3, 5]),"seed":_S.invoke(_n_r_b0,"int",[0, 1000000]),"life":0.7}
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_H = _S.read(_parent,"H")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_sparkAt = _S.read(_parent,"sparkAt")
	var _n_SPARKS = _S.read(_parent,"SPARKS")
	var _n_spark = _S.read(_parent,"spark")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	if _S.truth((_n_age_b1 < 0.08)):
		_S.invoke(_n_p,"px",[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _n_WHITE])
		_S.invoke(_n_p,"glow",[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), 12, _S.index_value(_n_H,1), (0.7 * (1 - (float(_n_age_b1)/0.08)))])
	var _n_r_b2 = _S.construct(_n_Rng,[_S.named_value(_n_q_b0,"seed")])
	if true:
		var _n_j_b3 = 0
		while _S.truth((_n_j_b3 < _S.named_value(_n_q_b0,"n"))):
			var _n_a_b4 = ((float((-PI))/2) + _S.invoke(_n_r_b2,"range",[(-0.8), 0.8]))
			var _n_sp_b5 = _S.invoke(_n_r_b2,"range",[110, 220])
			var _n_life_b6 = _S.invoke(_n_r_b2,"range",[0.25, 0.6])
			if _S.truth((_n_age_b1 >= _n_life_b6)):
				_n_j_b3 += 1.0
				continue
			var _tuple_0 = _S.call_value(_n_sparkAt,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), (cos(_n_a_b4) * _n_sp_b5), (sin(_n_a_b4) * _n_sp_b5), _n_age_b1, 0])
			var _n_x_b7 = _S.prop(_tuple_0,0)
			var _n_y_b8 = _S.prop(_tuple_0,1)
			var _n_vx_b9 = _S.prop(_tuple_0,2)
			var _n_vy_b10 = _S.prop(_tuple_0,3)
			_S.call_value(_n_spark,[_n_p, _n_x_b7, _n_y_b8, _n_vx_b9, _n_vy_b10, (1 - (float(_n_age_b1)/_n_life_b6)), _n_SPARKS])
			_n_j_b3 += 1.0
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-7), 7]),"y":(-_S.invoke(_n_r_b0,"range",[8, 18])),"vx":_S.invoke(_n_r_b0,"range",[(-15), 15]),"vy":(-_S.invoke(_n_r_b0,"range",[25, 60])),"life":_S.invoke(_n_r_b0,"range",[1.1, 2.5]),"s":(2 if _S.truth(_S.invoke(_n_r_b0,"chance",[0.15])) else _S.invoke(_n_r_b0,"range",[1, 1.6])),"a":_S.invoke(_n_r_b0,"range",[0, 6.3]),"b":_S.invoke(_n_r_b0,"range",[0, 6.3])}
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_ember = _S.read(_parent,"ember")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-30), 1.6, 1.6])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_ember,[_n_p, (_n_x_b2 + (7 * (sin(((_n_age_b1 * 2.3) + _S.named_value(_n_q_b0,"a"))) - sin(_S.named_value(_n_q_b0,"a"))))), (_n_y_b3 + (2 * (sin(((_n_age_b1 * 3) + _S.named_value(_n_q_b0,"b"))) - sin(_S.named_value(_n_q_b0,"b"))))), (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_EMB, ((_n_age_b1 * 40) + _S.named_value(_n_q_b0,"a"))])
	return null
