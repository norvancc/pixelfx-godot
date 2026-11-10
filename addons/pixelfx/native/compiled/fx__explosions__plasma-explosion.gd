@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/plasma-explosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "shell", _S.function_value(_e, "_f5"))
	_S.define(_e, "tilted", _S.function_value(_e, "_f6"))
	_S.define(_e, "arc", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma explosion"}, {"desc": "A blue-violet energy blast with no smoke: a white flash, a ball of plasma swelling into a thinning shell, shock rings in and out of depth, lightning arcs crackling off it."}, {"tags": ["explosion", "plasma", "energy", "electric", "magic", "sci-fi", "one-shot"]}, {"size": [224, 200]}, {"origin": [112, 100]}, {"duration": 1.7}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a0828", "#1a1c6e", "#2c3cc0", "#4a7cf0", "#7cc0ff", "#c8ecff", "#ffffff"]}, {"accent": ["#1c0a30", "#4a1a8c", "#8a3ce0", "#c48cff", "#f0d8ff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BALL", 0.55)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "V", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "accent"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "V"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 96, _S.prop(_S.read(_e, "C"), 4), 1, 0.6])
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 40, _S.read(_e, "WHITE"), 0.9, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 70, _S.prop(_S.read(_e, "V"), 2), 0.5, 1.1])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 46)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [140, 360]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), 4), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), 4), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.invoke(_S.read(_v1, "R"), "range", [0.2, 0.42]), _S.invoke(_S.read(_v1, "R"), "pick", [[_S.prop(_S.read(_v1, "C"), 6), _S.prop(_S.read(_v1, "C"), 5), _S.prop(_S.read(_v1, "C"), 4), _S.prop(_S.read(_v1, "V"), 3)]]), _S.invoke(_S.read(_v1, "R"), "range", [0.7, 1.1])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 26)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [40, 140]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), 10), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 10), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.8, 1.5]), _S.invoke(_S.read(_v3, "R"), "pick", [[_S.prop(_S.read(_v3, "C"), 5), _S.prop(_S.read(_v3, "V"), 3), _S.prop(_S.read(_v3, "V"), 4)]]), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 1.6])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f1")}, {"drawBack": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), 0.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 30, _S.read(_e, "dt"))]))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
		_S.define(_v4, "r", _S.call_value(_S.read(_v4, "shell"), [_S.read(_v4, "t")]))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "r")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "r")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.invoke(_S.read(_v4, "R"), "range", [10, 40])), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.invoke(_S.read(_v4, "R"), "range", [10, 40])), _S.invoke(_S.read(_v4, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.5])) else _S.prop(_S.read(_v4, "V"), 4)), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1.8])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_tilted = _S.read(_parent,"tilted")
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_V = _S.read(_parent,"V")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_tilted,[_n_p_b0, _n_t, _n_C, _n_V, true])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BALL = _S.read(_parent,"BALL")
	var _n_shell = _S.read(_parent,"shell")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_ease = _S.read(_parent,"ease")
	var _n_V = _S.read(_parent,"V")
	var _n_o = _S.read(_parent,"o")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_arc = _S.read(_parent,"arc")
	var _n_forks = _S.read(_parent,"forks")
	var _n_tilted = _S.read(_parent,"tilted")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_BALL)):
		var _n_u_b5 = (float(_n_t)/_n_BALL)
		var _n_r_b6 = _S.call_value(_n_shell,[_n_t])
		var _n_hollow_b7 = _S.MathFX.smooth(0.35,1,_n_u_b5)
		var _n_boil_b8 = floori((_n_t * 20))
		_S.invoke(_n_p_b0,"shade",[((-_n_r_b6) - 3), ((-_n_r_b6) - 3), (_n_r_b6 + 3), (_n_r_b6 + 3), _S.function_value(_S.capture(_parent,{"r":_n_r_b6,"boil":_n_boil_b8,"hollow":_n_hollow_b7,"u":_n_u_b5,"this":_this}),"_f4")])
		_S.invoke(_n_p_b0,"glow",[0, 0, ((_n_r_b6 * 1.6) + 6), _S.index_value(_n_C,4), (0.6 * (1 - _n_u_b5))])
	if _S.truth((_n_t < 0.07)):
		_S.invoke(_n_p_b0,"circle",[0, 0, (9 - (_n_t * 60)), _n_WHITE])
	if _S.truth((_n_t < 0.25)):
		_S.call_value(_n_flare,[_n_p_b0, 0, 0, (52 * pow((1 - (float(_n_t)/0.25)),1.3)), (1 - (float(_n_t)/0.25)), _n_C])
	var _n_u1_b1 = (float(_n_t)/0.42)
	if _S.truth((_n_u1_b1 < 1)):
		_S.invoke(_n_p_b0,"ring",[0, 0, (8 + (84 * _S.invoke(_n_ease,"outCubic",[_n_u1_b1]))), maxf(1,(3 * (1 - _n_u1_b1))), (_n_WHITE if _S.truth((_n_u1_b1 < 0.25)) else _S.index_value(_n_C,5)), (1.15 - _n_u1_b1)])
		_S.invoke(_n_p_b0,"glowRing",[0, 0, (8 + (84 * _S.invoke(_n_ease,"outCubic",[_n_u1_b1]))), 5, _S.index_value(_n_C,4), (0.35 * (1 - _n_u1_b1))])
	var _n_u2_b2 = (float((_n_t - 0.06))/0.6)
	if _S.truth(((_n_u2_b2 < 1) if _S.truth((_n_u2_b2 > 0)) else (_n_u2_b2 > 0))):
		_S.invoke(_n_p_b0,"ring",[0, 0, (6 + (60 * _S.invoke(_n_ease,"outCubic",[_n_u2_b2]))), maxf(1,(2 * (1 - _n_u2_b2))), _S.index_value(_n_V,3), (1.1 - _n_u2_b2)])
	var _n_left_b3 = (1 - _S.MathFX.smooth(0.15,0.85,_n_t))
	var _n_strike_b4 = floori((_n_t * 18))
	if _S.truth((_n_left_b3 > 0)):
		var _n_r_b9 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),_n_strike_b4,17])
		var _n_n_b10 = (2 + floori((4 * _n_left_b3)+0.5))
		if true:
			var _n_i_b12 = 0
			while _S.truth((_n_i_b12 < _n_n_b10)):
				var _n_a_b13 = _S.invoke(_n_r_b9,"range",[0, _n_TAU])
				var _n_L_b14 = (_S.invoke(_n_r_b9,"range",[26, 58]) * (0.45 + (0.55 * _n_left_b3)))
				var _n_path_b15 = _S.call_value(_n_bolt,[_n_r_b9, 0, 0, (cos(_n_a_b13) * _n_L_b14), (sin(_n_a_b13) * _n_L_b14), {"jag":0.28,"depth":4}])
				_S.call_value(_n_arc,[_n_p_b0, _n_path_b15, _n_C, _n_V, (0.8 * _n_left_b3)])
				if _S.truth(_S.invoke(_n_r_b9,"chance",[0.5])):
					for _iter_0 in _S.array(_S.call_value(_n_forks,[_n_r_b9, _n_path_b15, {"count":1,"len":14,"jag":0.35}])):
						var _n_f_b16 = _iter_0
						_S.call_value(_n_arc,[_n_p_b0, _n_f_b16, _n_C, _n_V, (0.5 * _n_left_b3)])
				_n_i_b12 += 1.0
		var _n_rs_b11 = _S.call_value(_n_shell,[_n_t])
		if true:
			var _n_i_b17 = 0
			while _S.truth((_n_i_b17 < 3)):
				var _n_a_b18 = _S.invoke(_n_r_b9,"range",[0, _n_TAU])
				var _n_b_b19 = (_n_a_b18 + _S.invoke(_n_r_b9,"range",[0.3, 0.6]))
				_S.call_value(_n_arc,[_n_p_b0, _S.call_value(_n_bolt,[_n_r_b9, (cos(_n_a_b18) * _n_rs_b11), (sin(_n_a_b18) * _n_rs_b11), (cos(_n_b_b19) * _n_rs_b11), (sin(_n_b_b19) * _n_rs_b11), {"jag":0.4,"depth":3}]), _n_C, _n_V, (0.6 * _n_left_b3)])
				_n_i_b17 += 1.0
	_S.call_value(_n_tilted,[_n_p_b0, _n_t, _n_C, _n_V, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_boil = _S.read(_parent,"boil")
	var _n_hollow = _S.read(_parent,"hollow")
	var _n_t = _S.read(_parent,"t")
	var _n_u = _S.read(_parent,"u")
	var _n_V = _S.read(_parent,"V")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	var _n_a_b4 = atan2(_n_y_b1,_n_x_b0)
	var _n_edge_b5 = (_n_r * (1 + (0.1 * _S.MathFX.noise(((_n_a_b4 * 3) + (_n_boil * 0.7)),3))))
	if _S.truth((_n_d_b3 > _n_edge_b5)):
		return null
	var _n_v_b6 = (float(_n_d_b3)/_n_edge_b5)
	if _S.truth((_n_v_b6 < (_n_hollow * 0.92))):
		return null
	var _n_n_b7 = _S.MathFX.noise((((_n_a_b4 * 4) + (_n_d_b3 * 0.25)) + (_n_boil * 0.5)),5)
	var _n_w_b8 = (_n_v_b6 + (_n_n_b7 * 0.14))
	var _n_fil_b9 = (absf(sin(((((_n_a_b4 * 5) + (_n_d_b3 * 0.32)) - (_n_t * 14)) + (_n_n_b7 * 2.5)))) < 0.1)
	_S.set_prop(_n_out_b2,"k",(0.25 * (1 - _n_u)),"=")
	if _S.truth((_n_v_b6 > 0.9)):
		return _S.index_value(_n_V,2)
	if _S.truth(((_n_v_b6 > 0.3) if _S.truth(_n_fil_b9) else _n_fil_b9)):
		return (_n_WHITE if _S.truth((_n_u < 0.5)) else _S.index_value(_n_C,5))
	return (_n_WHITE if _S.truth((_n_w_b8 < (0.32 - (_n_u * 0.25)))) else (_S.index_value(_n_C,5) if _S.truth((_n_w_b8 < 0.52)) else (_S.index_value(_n_C,4) if _S.truth((_n_w_b8 < 0.72)) else ((_S.index_value(_n_C,3) if _S.truth((_n_u < 0.5)) else _S.index_value(_n_V,3)) if _S.truth((_n_w_b8 < 0.86)) else _S.index_value(_n_V,2)))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_BALL = _S.read(_parent,"BALL")
	var _n_t_b0 = _S.arg(_args,0)
	return (5 + (30 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_t_b0)/_n_BALL),0.0,1.0)])))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_u_b5 = (float((_n_t_b1 - 0.03))/0.5)
	if _S.truth(((_n_u_b5 <= 0) if _S.truth((_n_u_b5 <= 0)) else (_n_u_b5 >= 1))):
		return null
	_S.call_value(_n_band,[_n_p_b0, 0, 4, (12 + (86 * _S.invoke(_n_ease,"outCubic",[_n_u_b5]))), 0.28, maxf(1,(4 * (1 - _n_u_b5))), (1.15 - _n_u_b5), [_S.index_value(_n_V_b3,1), _S.index_value(_n_V_b3,2), _S.index_value(_n_C_b2,4), _S.index_value(_n_C_b2,5)], _S.function_value(_S.capture(_parent,{"back":_n_back_b4,"this":_this}),"_f7"), (_n_u_b5 < 0.15)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_back)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_path_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	if _S.truth((_n_k_b4 <= 0.05)):
		return null
	if true:
		var _n_i_b5 = 1
		while _S.truth((_n_i_b5 < _S.prop(_n_path_b1,"length"))):
			var _tuple_0 = _S.index_value(_n_path_b1,(_n_i_b5 - 1))
			var _n_ax_b6 = _S.prop(_tuple_0,0)
			var _n_ay_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_path_b1,_n_i_b5)
			var _n_bx_b8 = _S.prop(_tuple_1,0)
			var _n_by_b9 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"glowLine",[_n_ax_b6, _n_ay_b7, _n_bx_b8, _n_by_b9, 5, _S.index_value(_n_V_b3,2), (0.18 * _n_k_b4)])
			_S.invoke(_n_p_b0,"line",[(_n_ax_b6 + 1), _n_ay_b7, (_n_bx_b8 + 1), _n_by_b9, _S.index_value(_n_C_b2,4), (_n_k_b4 * 0.8)])
			_S.invoke(_n_p_b0,"line",[_n_ax_b6, _n_ay_b7, _n_bx_b8, _n_by_b9, (_n_WHITE if _S.truth((_n_i_b5 < (_S.prop(_n_path_b1,"length") * 0.6))) else _S.index_value(_n_C_b2,5)), minf(1,(_n_k_b4 * 1.4))])
			_n_i_b5 += 1.0
	return null
