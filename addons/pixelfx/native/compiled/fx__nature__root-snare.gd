@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/root-snare.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "floorCrack", _S.import_value("fx/nature/_lib.js", "floorCrack"))
	_S.define(_e, "path", _S.function_value(_e, "_f0"))
	_S.define(_e, "root", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Root snare"}, {"desc": "The floor cracks and roots burst up round the character, spiralling round its legs; they cinch tight with a snap, hold, then crack and crumble into bark and dust."}, {"tags": ["nature", "roots", "plant", "snare", "root", "status", "actor", "one-shot"]}, {"size": [128, 96]}, {"origin": [64, 78]}, {"duration": 2.7}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#140c08", "#2a1a10", "#46301e", "#64462a", "#86623a", "#a8824e", "#ccaa70", "#ecd6a0"]}, {"glow": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GRAB", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"fx": _S.unary("-", 12)}, {"fy": _S.unary("-", 34)}, {"bx": 12}, {"by": _S.unary("-", 28)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.24), _S.merge([_S.read(_e, "READY"), {"ffx": _S.unary("-", 2)}, {"fbx": 3}])], [0.3, _S.merge([{"turn": 0.9}, {"lean": _S.unary("-", 1)}, {"crouch": 2}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 24)}, {"bx": 11}, {"by": _S.unary("-", 24)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}])], [0.62, _S.read(_e, "GRAB"), "snap"], [0.86, _S.merge([_S.read(_e, "GRAB"), {"lean": _S.unary("-", 3)}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 27)}])], [1.1, _S.merge([_S.read(_e, "GRAB"), {"lean": 3}, {"fy": _S.unary("-", 27)}, {"by": _S.unary("-", 37)}])], [1.34, _S.merge([_S.read(_e, "GRAB"), {"lean": _S.unary("-", 3)}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 27)}])], [1.58, _S.merge([_S.read(_e, "GRAB"), {"lean": 3}, {"fy": _S.unary("-", 27)}, {"by": _S.unary("-", 37)}])], [1.75, _S.merge([_S.read(_e, "GRAB"), {"crouch": 6}])], [1.8, _S.merge([{"turn": 1.1}, {"crouch": _S.unary("-", 1)}, {"y": _S.unary("-", 3)}, {"fx": _S.unary("-", 14)}, {"fy": _S.unary("-", 36)}, {"bx": 15}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 6)}, {"fbx": 4}, {"fby": _S.unary("-", 6)}]), "snap"], [2.05, _S.merge([_S.read(_e, "READY"), {"y": 0}, {"crouch": 5}])], [2.7, _S.merge([_S.read(_e, "READY"), {"ffx": _S.unary("-", 2)}, {"fbx": 3}])]]}, {"hits": [_S.merge([{"t": 0.62}, {"stop": 0.05}, {"shake": 0.1}, {"amp": 1}]), _S.merge([{"t": 1.75}, {"stop": 0.04}, {"shake": 0.14}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "CINCH", 0.62)
	_S.define(_e, "BREAK", 1.75)
	_S.define(_e, "NP", 48)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_NP = _S.read(_parent,"NP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_cinch_b1 = _S.arg(_args,1)
	var _n_pts_b2 = []
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 <= _n_NP)):
			var _n_s_b4 = (float(_n_i_b3)/_n_NP)
			var _n_th_b5 = (_S.named_value(_n_r_b0,"th0") + (((_S.named_value(_n_r_b0,"dir") * _n_TAU) * _S.named_value(_n_r_b0,"turns")) * _n_s_b4))
			var _n_rad_b6 = _S.numeric_lerp(_S.named_value(_n_r_b0,"r0"),(_S.named_value(_n_r_b0,"leg") - (_n_cinch_b1 * 1.6)),_S.invoke(_n_ease,"outCubic",[minf(1,(_n_s_b4 * 3.5))]))
			_S.invoke(_n_pts_b2,"push",[{"x":(cos(_n_th_b5) * _n_rad_b6),"y":(((-_S.named_value(_n_r_b0,"h")) * pow(_n_s_b4,1.05)) + ((sin(_n_th_b5) * _n_rad_b6) * _n_SY)),"z":sin(_n_th_b5),"s":_n_s_b4}])
			_n_i_b3 += 1.0
	return _n_pts_b2
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_NP = _S.read(_parent,"NP")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_n_b6 = floori((_n_NP * _n_g_b2))
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_n_b6)):
			var _n_A_b8 = _S.index_value(_n_pts_b1,_n_i_b7)
			var _n_Bp_b9 = _S.index_value(_n_pts_b1,(_n_i_b7 + 1))
			var _n_front_b10 = ((float((_S.named_value(_n_A_b8,"z") + _S.named_value(_n_Bp_b9,"z")))/2) >= 0)
			if _S.truth(_S.binary("===",_n_front_b10,_n_back_b4)):
				_n_i_b7 += 1.0
				continue
			var _n_dx_b11 = (_S.named_value(_n_Bp_b9,"x") - _S.named_value(_n_A_b8,"x"))
			var _n_dy_b12 = (_S.named_value(_n_Bp_b9,"y") - _S.named_value(_n_A_b8,"y"))
			var _n_L_b13 = _S.logical("||",_S.Bridge.hypot([_n_dx_b11, _n_dy_b12]),func():return 1)
			var _n_nx_b14 = (float((-_n_dy_b12))/_n_L_b13)
			var _n_ny_b15 = (float(_n_dx_b11)/_n_L_b13)
			var _n_up_b16 = (1 if _S.truth((((_n_nx_b14 * (-0.6)) + (_n_ny_b15 * (-0.8))) > 0)) else (-1))
			var _n_w_b17 = ((float((1.4 + (3.6 * pow((1 - _S.named_value(_n_A_b8,"s")),0.8))))/2) + 0.35)
			var _n_dim_b18 = (1 if _S.truth(_n_back_b4) else 0)
			if true:
				var _n_y_b19 = floori(((minf(_S.named_value(_n_A_b8,"y"),_S.named_value(_n_Bp_b9,"y")) - _n_w_b17) - 1))
				while _S.truth((_n_y_b19 <= ceili(((maxf(_S.named_value(_n_A_b8,"y"),_S.named_value(_n_Bp_b9,"y")) + _n_w_b17) + 1)))):
					if true:
						var _n_x_b20 = floori(((minf(_S.named_value(_n_A_b8,"x"),_S.named_value(_n_Bp_b9,"x")) - _n_w_b17) - 1))
						while _S.truth((_n_x_b20 <= ceili(((maxf(_S.named_value(_n_A_b8,"x"),_S.named_value(_n_Bp_b9,"x")) + _n_w_b17) + 1)))):
							if _S.truth((_n_y_b19 > 0)):
								_n_x_b20 += 1.0
								continue
							var _n_px_b21 = ((_n_x_b20 + 0.5) - _S.named_value(_n_A_b8,"x"))
							var _n_py_b22 = ((_n_y_b19 + 0.5) - _S.named_value(_n_A_b8,"y"))
							var _n_u_b23 = (float(((_n_px_b21 * _n_dx_b11) + (_n_py_b22 * _n_dy_b12)))/(_n_L_b13 * _n_L_b13))
							if _S.truth(((_n_u_b23 < (-0.2)) if _S.truth((_n_u_b23 < (-0.2))) else (_n_u_b23 > 1.2))):
								_n_x_b20 += 1.0
								continue
							var _n_d_b24 = ((_n_px_b21 * _n_nx_b14) + (_n_py_b22 * _n_ny_b15))
							if _S.truth((absf(_n_d_b24) > _n_w_b17)):
								_n_x_b20 += 1.0
								continue
							var _n_side_b25 = (signf(_n_d_b24) * _n_up_b16)
							var _n_q_b26 = (float(absf(_n_d_b24))/_n_w_b17)
							var _n_i2_b27 = ((7 if _S.truth((_n_side_b25 > 0)) else 1) if _S.truth((_n_q_b26 > 0.72)) else ((6 if _S.truth((_n_q_b26 > 0.3)) else 5) if _S.truth((_n_side_b25 > 0)) else (2 if _S.truth((_n_q_b26 > 0.35)) else 3)))
							if _S.truth(((_S.MathFX.rand([floori((_S.named_value(_n_A_b8,"s") * 40)+0.5),3]) < 0.4) if _S.truth((_n_q_b26 < 0.25)) else (_n_q_b26 < 0.25))):
								_n_i2_b27 = 4
							_S.invoke(_n_p_b0,"dot",[_n_x_b20, _n_y_b19, _S.index_value(_n_C_b3,maxf(1,(_n_i2_b27 - _n_dim_b18))), _n_a_b5])
							_n_x_b20 += 1.0
					_n_y_b19 += 1.0
			if _S.truth(((_n_w_b17 > 1.2) if _S.truth(_S.binary("===",fmod(_n_i_b7,7),3)) else _S.binary("===",fmod(_n_i_b7,7),3))):
				_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_A_b8,"x") - ((_n_nx_b14 * _n_up_b16) * (_n_w_b17 + 1))), (_S.named_value(_n_A_b8,"y") - ((_n_ny_b15 * _n_up_b16) * (_n_w_b17 + 1))), _S.index_value(_n_C_b3,(2 - _n_dim_b18)), _n_a_b5])
			_n_i_b7 += 1.0
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.prop(_S.read(_e, "G"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "chips", [])
	_S.define(_e, "roots", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 5}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "cracks", [_S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [18, 26])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [18, 26])])])
	_S.define(_e, "t", 0)
	_S.define(_e, "cinched", false)
	_S.define(_e, "broken", false)
	_S.define(_e, "grow", _S.function_value(_e, "_f5"))
	_S.define(_e, "squeeze", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"th0":(((float(_n_i_b1)/5) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.3), 0.3])),"dir":(1 if _S.truth(fmod(_n_i_b1,2)) else (-1)),"turns":_S.invoke(_n_R,"range",[1.1, 1.6]),"r0":_S.invoke(_n_R,"range",[14, 19]),"leg":_S.invoke(_n_R,"range",[8, 10]),"h":_S.invoke(_n_R,"range",[13, 21]),"at":((0.16 + (_n_i_b1 * 0.07)) + _S.invoke(_n_R,"range",[0, 0.04])),"buds":[_S.invoke(_n_R,"range",[0.35, 0.55]), _S.invoke(_n_R,"range",[0.6, 0.85])]}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _S.named_value(_n_r_b0,"at")))/0.32),0.0,1.0)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_CINCH = _S.read(_parent,"CINCH")
	var _n_t = _S.read(_parent,"t")
	return (_S.MathFX.smooth((_n_CINCH - 0.03),(_n_CINCH + 0.05),_n_t) * (1 - (0.4 * _S.MathFX.smooth((_n_CINCH + 0.05),(_n_CINCH + 0.25),_n_t))))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), 0.4), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.3, _S.read(_e, "f"))]))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "sd", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "GRIT"), _S.binary("*", _S.read(_v7, "sd"), _S.invoke(_S.read(_v7, "R"), "range", [4, 22])), _S.unary("-", 1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [30, 90])), _S.invoke(_S.read(_v7, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.prop(_S.read(_v7, "C"), 5), _S.prop(_S.read(_v7, "C"), 4)]]), 1])
	for _v8 in _S.array(_S.read(_e, "roots")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "r", _v8)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v9, "r"), "burst")), func(): return _S.binary(">=", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "r"), "at")))):
			var _v10 = _S.scope(_v9)
			_S.set_prop(_S.read(_v10, "r"), "burst", true, "=", false)
			_S.define(_v10, "x", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.prop(_S.read(_v10, "r"), "th0")]), _S.prop(_S.read(_v10, "r"), "r0")))
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
				_S.invoke(_S.read(_v11, "chips"), "push", [_S.merge([{"x": _S.read(_v11, "x")}, {"y": _S.unary("-", 1)}, {"vx": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 60), 60])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [60, 160]))}, {"a": _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")])}, {"va": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 15), 15])}, {"s": _S.invoke(_S.read(_v11, "R"), "range", [1.2, 2])}, {"pts": _S.call_value(_S.read(_v11, "stoneShape"), [_S.read(_v11, "R")])}, {"life": _S.invoke(_S.read(_v11, "R"), "range", [0.6, 0.9])}])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), 3)):
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "DUST"), _S.read(_v12, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [4, 18])), _S.invoke(_S.read(_v12, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v12, "C"), 5), _S.invoke(_S.read(_v12, "R"), "range", [2, 3.5])])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
			_S.invoke(_S.read(_v10, "lights"), "add", [_S.read(_v10, "x"), _S.unary("-", 4), 20, _S.prop(_S.read(_v10, "G"), 2), 0.35, 0.3])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cinched")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CINCH")))):
		var _v13 = _S.scope(_e)
		_S.write(_v13, "cinched", true, "=", false)
		_S.invoke(_S.read(_v13, "lights"), "add", [0, _S.unary("-", 10), 40, _S.prop(_S.read(_v13, "G"), 3), 0.5, 0.3])
		_S.invoke(_S.read(_v13, "lights"), "add", [0, _S.unary("-", 10), 16, _S.read(_v13, "WHITE"), 0.4, 0.06])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 8)):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "DUST"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [0, 4])), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "sign", []), _S.invoke(_S.read(_v14, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [4, 14])), _S.invoke(_S.read(_v14, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v14, "C"), 5), _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STAR"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [4, 20])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v15, "G"), 3), _S.invoke(_S.read(_v15, "R"), "range", [0.8, 1.8]), _S.invoke(_S.read(_v15, "R"), "range", [0, 0.1])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CINCH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.06, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [3, 18])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [14, 30])), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_e, "G"), 3), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broken")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "broken", true, "=", false)
		_S.invoke(_S.read(_v16, "lights"), "add", [0, _S.unary("-", 10), 36, _S.prop(_S.read(_v16, "G"), 2), 0.4, 0.25])
		for _v17 in _S.array(_S.read(_v16, "roots")):
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "r", _v17)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "pts", _S.call_value(_S.read(_v19, "path"), [_S.read(_v19, "r"), 1]))
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "i", 2)
			while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "NP"))):
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "q", _S.prop(_S.read(_v21, "pts"), _S.read(_v21, "i")))
				_S.define(_v21, "w", _S.binary("+", 1.4, _S.binary("*", 3.6, _S.invoke(_S.read(_v21, "Math"), "pow", [_S.binary("-", 1, _S.prop(_S.read(_v21, "q"), "s")), 0.8]))))
				_S.invoke(_S.read(_v21, "chips"), "push", [_S.merge([{"x": _S.prop(_S.read(_v21, "q"), "x")}, {"y": _S.invoke(_S.read(_v21, "Math"), "min", [_S.prop(_S.read(_v21, "q"), "y"), _S.unary("-", 1)])}, {"vx": _S.binary("+", _S.binary("*", _S.logical("||", _S.invoke(_S.read(_v21, "Math"), "sign", [_S.prop(_S.read(_v21, "q"), "x")]), func(): return 1), _S.invoke(_S.read(_v21, "R"), "range", [25, 85])), _S.binary("*", _S.prop(_S.read(_v21, "q"), "x"), 3))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [50, 150]))}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 10), 10])}, {"s": _S.call_value(_S.read(_v21, "clamp"), [_S.binary("*", _S.read(_v21, "w"), 0.75), 1.5, 3])}, {"pts": _S.call_value(_S.read(_v21, "stoneShape"), [_S.read(_v21, "R")])}, {"life": _S.invoke(_S.read(_v21, "Math"), "min", [_S.invoke(_S.read(_v21, "R"), "range", [0.7, 0.95]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v21, "meta"), "duration"), 0.05), _S.read(_v21, "t"))])}])])
				if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v21, "i"), 10), 2)):
					_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "GRIT"), _S.prop(_S.read(_v21, "q"), "x"), _S.invoke(_S.read(_v21, "Math"), "min", [_S.prop(_S.read(_v21, "q"), "y"), _S.unary("-", 1)]), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [20, 80])), _S.invoke(_S.read(_v21, "Math"), "min", [_S.invoke(_S.read(_v21, "R"), "range", [0.6, 0.9]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v21, "meta"), "duration"), 0.05), _S.read(_v21, "t"))]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "C"), 4), _S.prop(_S.read(_v21, "C"), 3), _S.prop(_S.read(_v21, "C"), 2)]]), (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.3])) else 1)])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "i", 4, "+=", false)
		var _v22 = _S.scope(_v16)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 10)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 16])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [5, 20])), _S.invoke(_S.read(_v22, "Math"), "min", [_S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.9]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v22, "meta"), "duration"), 0.05), _S.read(_v22, "t"))]), _S.prop(_S.read(_v22, "C"), 5), _S.invoke(_S.read(_v22, "R"), "range", [3, 5]), 0, 0])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", _S.binary("-", _S.prop(_S.read(_v23, "chips"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v23, "i"), 0)):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "c", _S.prop(_S.read(_v24, "chips"), _S.read(_v24, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v24, "c"), "life", _S.read(_v24, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v24, "chips"), "splice", [_S.read(_v24, "i"), 1])
		_S.set_prop(_S.read(_v24, "c"), "vy", _S.binary("*", 950, _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "x", _S.binary("*", _S.prop(_S.read(_v24, "c"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "y", _S.binary("*", _S.prop(_S.read(_v24, "c"), "vy"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "a", _S.binary("*", _S.prop(_S.read(_v24, "c"), "va"), _S.read(_v24, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v24, "c"), "y"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v24, "c"), "vy"), 0))):
			(_S.last([_S.set_prop(_S.read(_v24, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v24, "c"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v24, "c"), "vx", 0.5, "*=", false)]) if _S.truth(_S.binary(">", _S.prop(_S.read(_v24, "c"), "vy"), 110)) else _S.last([_S.set_prop(_S.read(_v24, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v24, "c"), "vy", _S.set_prop(_S.read(_v24, "c"), "vx", _S.set_prop(_S.read(_v24, "c"), "va", 0, "=", false), "=", false), "=", false)]))
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_C = _S.read(_parent,"C")
	var _n_G = _S.read(_parent,"G")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_CINCH = _S.read(_parent,"CINCH")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_root = _S.read(_parent,"root")
	var _n_path = _S.read(_parent,"path")
	var _n_squeeze = _S.read(_parent,"squeeze")
	var _n_grow = _S.read(_parent,"grow")
	var _n_roots = _S.read(_parent,"roots")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_open_b1 = _S.invoke(_n_ease,"outCubic",[clampf((float(_n_t)/0.25),0.0,1.0)])
	var _n_hot_b2 = (_S.MathFX.smooth(0,0.3,_n_t) * (1 - _S.MathFX.smooth(0.5,1.4,_n_t)))
	var _n_fade_b3 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.6),(_S.named_value(_n_meta,"duration") - 0.15),_n_t))
	for _iter_0 in _S.array(_n_cracks):
		var _n_c_b5 = _iter_0
		var _n_m_b6 = maxf(2,ceili((_S.prop(_n_c_b5,"length") * _n_open_b1)))
		if true:
			var _n_k_b7 = 1
			while _S.truth((_n_k_b7 < _n_m_b6)):
				var _tuple_1 = _S.index_value(_n_c_b5,(_n_k_b7 - 1))
				var _n_x0_b8 = _S.prop(_tuple_1,0)
				var _n_y0_b9 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_n_c_b5,_n_k_b7)
				var _n_x1_b10 = _S.prop(_tuple_2,0)
				var _n_y1_b11 = _S.prop(_tuple_2,1)
				_S.invoke(_n_p_b0,"line",[_n_x0_b8, (_n_y0_b9 + 1), _n_x1_b10, (_n_y1_b11 + 1), _S.index_value(_n_C,0), _n_fade_b3])
				_S.invoke(_n_p_b0,"line",[_n_x0_b8, _n_y0_b9, _n_x1_b10, _n_y1_b11, (_S.index_value(_n_G,3) if _S.truth((_n_hot_b2 > 0.5)) else (_S.index_value(_n_G,2) if _S.truth((_n_hot_b2 > 0.2)) else _S.index_value(_n_C,1))), _n_fade_b3])
				if _S.truth(_S.binary("===",fmod(_n_k_b7,2),0)):
					_S.invoke(_n_p_b0,"glow",[_n_x1_b10, _n_y1_b11, 6, _S.index_value(_n_G,2), (0.3 * _n_hot_b2)])
				_n_k_b7 += 1.0
	var _n_hold_b4 = ((_S.MathFX.smooth(0.3,_n_CINCH,_n_t) * (1 - _S.MathFX.smooth(_n_BREAK,(_n_BREAK + 0.3),_n_t))) * (0.8 + (0.2 * sin((_n_t * 8)))))
	if _S.truth((_n_hold_b4 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-12), 30, _S.index_value(_n_G,2), (0.3 * _n_hold_b4)])
		_S.invoke(_n_p_b0,"glow",[0, (-1), 22, _S.index_value(_n_G,3), (0.16 * _n_hold_b4)])
	if _S.truth((_n_t < _n_BREAK)):
		for _iter_3 in _S.array(_n_roots):
			var _n_r_b12 = _iter_3
			if _S.truth((_n_t > _S.named_value(_n_r_b12,"at"))):
				_S.call_value(_n_root,[_n_p_b0, _S.call_value(_n_path,[_n_r_b12, _S.call_value(_n_squeeze,[])]), _S.call_value(_n_grow,[_n_r_b12]), _n_C, true, 1])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_path = _S.read(_parent,"path")
	var _n_squeeze = _S.read(_parent,"squeeze")
	var _n_grow = _S.read(_parent,"grow")
	var _n_root = _S.read(_parent,"root")
	var _n_C = _S.read(_parent,"C")
	var _n_NP = _S.read(_parent,"NP")
	var _n_CINCH = _S.read(_parent,"CINCH")
	var _n_G = _S.read(_parent,"G")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_roots = _S.read(_parent,"roots")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_chips = _S.read(_parent,"chips")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_BREAK)):
		for _iter_0 in _S.array(_n_roots):
			var _n_r_b4 = _iter_0
			if _S.truth((_n_t <= _S.named_value(_n_r_b4,"at"))):
				continue
			var _n_pts_b5 = _S.call_value(_n_path,[_n_r_b4, _S.call_value(_n_squeeze,[])])
			var _n_g_b6 = _S.call_value(_n_grow,[_n_r_b4])
			_S.call_value(_n_root,[_n_p_b0, _n_pts_b5, _n_g_b6, _n_C, false, 1])
			for _iter_1 in _S.array(_S.named_value(_n_r_b4,"buds")):
				var _n_b_b7 = _iter_1
				var _n_q_b8 = _S.index_value(_n_pts_b5,floori((_n_b_b7 * _n_NP)))
				var _n_lk_b9 = clampf((float((((_n_t - _n_CINCH) - 0.1) - (_n_b_b7 * 0.2)))/0.25),0.0,1.0)
				if _S.truth((((_n_b_b7 > _n_g_b6) if _S.truth((_n_b_b7 > _n_g_b6)) else (_n_lk_b9 <= 0)) if _S.truth(((_n_b_b7 > _n_g_b6) if _S.truth((_n_b_b7 > _n_g_b6)) else (_n_lk_b9 <= 0))) else (_S.named_value(_n_q_b8,"z") < 0))):
					continue
				_S.call_value(_n_drawLeaf,[_n_p_b0, (_S.named_value(_n_q_b8,"x") + 2), (_S.named_value(_n_q_b8,"y") - 2), (5 * _n_lk_b9), 1.6, ((-0.6) + (sin(((_n_t * 5) + (_n_b_b7 * 9))) * 0.2)), 0.3, [_S.index_value(_n_G,0), _S.index_value(_n_G,1), _S.index_value(_n_G,2), _S.index_value(_n_G,3)]])
		var _n_e_b2 = (_n_t - _n_CINCH)
		if _S.truth(((_n_e_b2 < 0.12) if _S.truth((_n_e_b2 > 0)) else (_n_e_b2 > 0))):
			for _iter_2 in _S.array([[(-8), (-6)], [8, (-10)], [(-7), (-15)]]):
				var _tuple_3 = _iter_2
				var _n_x_b10 = _S.prop(_tuple_3,0)
				var _n_y_b11 = _S.prop(_tuple_3,1)
				_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b10, _n_y_b11, (5 * (1 - (float(_n_e_b2)/0.12))), _S.index_value(_n_C,7), _S.index_value(_n_G,3), 0.4])
		var _n_w_b3 = (_n_BREAK - _n_t)
		if _S.truth(((_n_w_b3 < 0.05) if _S.truth((_n_w_b3 > 0)) else (_n_w_b3 > 0))):
			for _iter_4 in _S.array(_n_roots):
				var _n_r_b12 = _iter_4
				for _iter_5 in _S.array(_S.call_value(_n_path,[_n_r_b12, 1])):
					var _n_q_b13 = _iter_5
					if _S.truth((_S.named_value(_n_q_b13,"z") >= 0)):
						_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b13,"x"), _S.named_value(_n_q_b13,"y"), _n_WHITE])
	var _n_BARK_b1 = [_S.index_value(_n_C,0), _S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5)]
	for _iter_6 in _S.array(_n_chips):
		var _n_c_b14 = _iter_6
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_c_b14,"x"), _S.named_value(_n_c_b14,"y"), _S.named_value(_n_c_b14,"s"), _S.named_value(_n_c_b14,"a"), _S.named_value(_n_c_b14,"pts"), _n_BARK_b1, minf(1,(float(_S.named_value(_n_c_b14,"life"))/0.25))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
