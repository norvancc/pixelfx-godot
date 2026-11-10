@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/uppercut.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Uppercut"}, {"desc": "A crescent rises from the floor past the face, and at the top a comic impact star bursts: bold outline, hot core, burst lines, twinkles and sparks."}, {"tags": ["melee", "uppercut", "punch", "rising", "launcher", "comic", "combat", "directional", "one-shot"]}, {"size": [132, 128]}, {"origin": [48, 110]}, {"duration": 0.85}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a1408", "#7a2a10", "#c4501a", "#f08a2a", "#ffc94a", "#fff2a8", "#ffffff"]}, {"outline": "#2a0a08"}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FISTS", _S.merge([_S.read(_e, "READY"), {"fx": 12}, {"fy": _S.unary("-", 25)}, {"bx": 9}, {"by": _S.unary("-", 27)}, {"crouch": 3}, {"lean": 1}]))
	_S.define(_e, "COIL", _S.merge([_S.read(_e, "FISTS"), {"crouch": 7}, {"lean": 3}, {"fx": 8}, {"fy": _S.unary("-", 11)}, {"bx": 8}, {"by": _S.unary("-", 27)}, {"ffx": 10}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "TOP", _S.merge([_S.read(_e, "FISTS"), {"x": 1}, {"y": _S.unary("-", 11)}, {"crouch": _S.unary("-", 1)}, {"lean": 2}, {"fx": 12}, {"fy": _S.unary("-", 42)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 21)}, {"ffx": 8}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 3)}, {"fby": _S.unary("-", 2)}, {"toeB": true}, {"ghost": 1}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 44}])}, {"poses": [[_S.unary("-", 0.42), _S.read(_e, "FISTS")], [_S.unary("-", 0.16), _S.read(_e, "COIL")], [0, _S.merge([_S.read(_e, "COIL"), {"crouch": 8}])], [0.03, _S.merge([_S.read(_e, "FISTS"), {"y": _S.unary("-", 4)}, {"crouch": 1}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 27)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 23)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}, {"toeB": true}, {"ghost": 1}]), "snap"], [0.076, _S.read(_e, "TOP"), "snap"], [0.3, _S.merge([_S.read(_e, "TOP"), {"y": _S.unary("-", 13)}, {"ghost": null}])], [0.56, _S.merge([_S.read(_e, "TOP"), {"y": 0}, {"crouch": 2}, {"fx": 13}, {"fy": _S.unary("-", 31)}, {"ffx": 7}, {"ffy": _S.unary("-", 6)}, {"fbx": _S.unary("-", 5)}, {"fby": _S.unary("-", 5)}, {"ghost": null}]), "in"], [0.6, _S.merge([_S.read(_e, "FISTS"), {"y": 0}, {"crouch": 7}, {"lean": 3}, {"fx": 12}, {"fy": _S.unary("-", 14)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 16)}, {"ffx": 10}, {"fbx": _S.unary("-", 9)}]), "snap"], [0.98, _S.read(_e, "FISTS")]]}, {"hits": [_S.merge([{"t": 0.076}, {"stop": 0.13}, {"shake": 0.18}, {"amp": 2}, {"push": _S.unary("-", 2.6)}, {"straw": 18}, {"y": _S.unary("-", 34)}])]}, {"dust": [_S.merge([{"t": 0.03}, {"x": 8}, {"n": 6}]), _S.merge([{"t": 0.6}, {"x": 0}, {"n": 6}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "outline")]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 8}, {"cy": _S.unary("-", 25)}, {"R": 27}, {"sy": 1}, {"rot": 0}, {"a0": 1.08}, {"dir": _S.unary("-", 1)}, {"span": 2.5}, {"W": 13}, {"t0": 0.02}, {"sweep": 0.07}, {"hold": 0.05}, {"trail": 0.22}, {"ramp": _S.read(_e, "C")}])]))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "slashEnd"), [_S.read(_e, "A")]))
	_S.define(_e, "SX", _S.binary("+", _S.prop(_S.read(_e, "top"), "x"), 3))
	_S.define(_e, "SY", _S.binary("-", _S.prop(_S.read(_e, "top"), "y"), 5))
	_S.define(_e, "HIT", _S.binary("+", _S.prop(_S.read(_e, "A"), "t0"), _S.binary("*", _S.prop(_S.read(_e, "A"), "sweep"), 0.8)))
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "bursts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "kicked", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_Rg = _S.read(_parent,"Rg")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":((((float(_n_i_b1)/10) * _n_TAU) + _S.invoke(_n_Rg,"range",[(-0.12), 0.12])) - (float(PI)/2)),"len":((7 if _S.truth(fmod(_n_i_b1,2)) else 13) + _S.invoke(_n_Rg,"range",[0, 4])),"w":(2.2 if _S.truth(fmod(_n_i_b1,2)) else 3)}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_Rg = _S.read(_parent,"Rg")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":((((float(_n_i_b1)/8) * _n_TAU) + 0.2) + _S.invoke(_n_Rg,"range",[(-0.15), 0.15])),"r0":_S.invoke(_n_Rg,"range",[15, 18]),"L":_S.invoke(_n_Rg,"range",[5, 9])}
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "kicked"))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "kicked", true, "=", false)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 4)):
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "DUST"), _S.binary("+", 18, _S.invoke(_S.read(_v1, "Rg"), "range", [_S.unary("-", 4), 4])), _S.unary("-", 1), _S.invoke(_S.read(_v1, "Rg"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v1, "Rg"), "range", [5, 20])), _S.invoke(_S.read(_v1, "Rg"), "range", [0.3, 0.55]), "#6a6080", _S.invoke(_S.read(_v1, "Rg"), "range", [1.5, 2.6])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "hit", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "SX"), _S.read(_v2, "SY"), 56, _S.prop(_S.read(_v2, "C"), 4), 0.6, 0.4])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "SX"), _S.read(_v2, "SY"), 18, _S.read(_v2, "WHITE"), 0.7, 0.08])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 16)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 2), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 1.6), 1.6])))
			_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "Rg"), "range", [120, 320]))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SPARK"), _S.read(_v4, "SX"), _S.read(_v4, "SY"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.invoke(_S.read(_v4, "Rg"), "range", [0.15, 0.45])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 6)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "Rg"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "d", _S.invoke(_S.read(_v6, "Rg"), "range", [14, 24]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("+", _S.read(_v6, "SX"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("+", _S.read(_v6, "SY"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), 20), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), 20), 10), _S.invoke(_S.read(_v6, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.invoke(_S.read(_v6, "Rg"), "chance", [0.5])) else _S.read(_v6, "WHITE")), _S.invoke(_S.read(_v6, "Rg"), "range", [1.4, 2.6]), _S.invoke(_S.read(_v6, "Rg"), "range", [0.04, 0.18])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_t = _S.read(_parent,"t")
	var _n_slash = _S.read(_parent,"slash")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_SX = _S.read(_parent,"SX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_INK = _S.read(_parent,"INK")
	var _n_star = _S.read(_parent,"star")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bursts = _S.read(_parent,"bursts")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_slash,[_n_p_b0, _n_A, _n_t])
	var _n_u_b1 = (_n_t - _S.named_value(_n_A,"t0"))
	if _S.truth(((_n_u_b1 < 0.16) if _S.truth((_n_u_b1 > 0)) else (_n_u_b1 > 0))):
		for _iter_0 in _S.array([[((_S.named_value(_n_A,"cx") + _S.named_value(_n_A,"R")) + 7), (-16), 18], [((_S.named_value(_n_A,"cx") + _S.named_value(_n_A,"R")) + 11), (-30), 12], [(_S.named_value(_n_A,"cx") - 4), (-40), 10]]):
			var _tuple_1 = _iter_0
			var _n_dx_b3 = _S.prop(_tuple_1,0)
			var _n_y0_b4 = _S.prop(_tuple_1,1)
			var _n_L_b5 = _S.prop(_tuple_1,2)
			var _n_k_b6 = (float(_n_u_b1)/0.16)
			var _n_y_b7 = (_n_y0_b4 - (30 * _n_k_b6))
			if true:
				var _n_d_b8 = 0
				while _S.truth((_n_d_b8 < _n_L_b5)):
					_S.invoke(_n_p_b0,"dot",[_n_dx_b3, (_n_y_b7 + _n_d_b8), (_n_WHITE if _S.truth((_n_d_b8 < 3)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b8 < (_n_L_b5 * 0.5))) else _S.index_value(_n_C,3))), ((1 - (float(_n_d_b8)/_n_L_b5)) * (1 - _n_k_b6))])
					_n_d_b8 += 1
	if _S.truth(((_n_u_b1 < (_S.named_value(_n_A,"sweep") + 0.06)) if _S.truth((_n_u_b1 > 0)) else (_n_u_b1 > 0))):
		var _tuple_2 = _S.call_value(_n_onSwing,[_n_A, (_S.named_value(_n_A,"R") - 5), (_S.named_value(_n_A,"span") * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b1)/_S.named_value(_n_A,"sweep")),0.0,1.0)]))])
		var _n_x_b9 = _S.prop(_tuple_2,0)
		var _n_y_b10 = _S.prop(_tuple_2,1)
		_S.invoke(_n_p_b0,"glow",[_n_x_b9, _n_y_b10, 34, _S.index_value(_n_C,3), (0.45 * (1 - (float(_n_u_b1)/(_S.named_value(_n_A,"sweep") + 0.06))))])
	var _n_q_b2 = (_n_t - _n_HIT)
	if _S.truth(((_n_q_b2 < 0.36) if _S.truth((_n_q_b2 >= 0)) else (_n_q_b2 >= 0))):
		var _n_pop_b11 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_q_b2)/0.05),0.0,1.0), 2.6])
		var _n_out_b12 = (1 - _S.MathFX.smooth(0.16,0.36,_n_q_b2))
		var _n_sc_b13 = (_n_pop_b11 * (0.35 + (0.65 * _n_out_b12)))
		var _n_turn_b14 = (_n_q_b2 * 1.2)
		var _n_sp_b15 = _S.invoke(_n_spikes,"map",[_S.function_value(_S.capture(_parent,{"turn":_n_turn_b14,"this":_this}),"_f6")])
		if _S.truth((_n_sc_b13 > 0.08)):
			_S.call_value(_n_star,[_n_p_b0, _n_SX, _n_SY, _n_sp_b15, (_n_sc_b13 * 1.12), 1, _n_INK, _n_INK, _n_INK, _n_INK])
			_S.call_value(_n_star,[_n_p_b0, _n_SX, _n_SY, _n_sp_b15, _n_sc_b13, 1, (_n_WHITE if _S.truth((_n_q_b2 < 0.05)) else _S.index_value(_n_C,6)), _S.index_value(_n_C,4), _S.index_value(_n_C,3), _S.index_value(_n_C,2)])
		_S.invoke(_n_p_b0,"glow",[_n_SX, _n_SY, 30, _S.index_value(_n_C,4), (0.45 * _n_out_b12)])
	if _S.truth(((_n_q_b2 < 0.24) if _S.truth((_n_q_b2 >= 0.02)) else (_n_q_b2 >= 0.02))):
		var _n_k_b16 = (float((_n_q_b2 - 0.02))/0.22)
		var _n_r_b17 = (7 + (17 * _S.invoke(_n_ease,"outCubic",[_n_k_b16])))
		var _n_th_b18 = maxf(1,(2.2 * (1 - _n_k_b16)))
		var _n_col_b19 = (_n_WHITE if _S.truth((_n_k_b16 < 0.25)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b16 < 0.5)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b16 < 0.75)) else _S.index_value(_n_C,3))))
		if true:
			var _n_a_b20 = 0
			while _S.truth((_n_a_b20 < _n_TAU)):
				if true:
					var _n_o_b21 = 0
					while _S.truth((_n_o_b21 < _n_th_b18)):
						_S.invoke(_n_p_b0,"dot",[(_n_SX + (cos(_n_a_b20) * (_n_r_b17 - _n_o_b21))), (_n_SY + (sin(_n_a_b20) * (_n_r_b17 - _n_o_b21))), _n_col_b19, (1.15 - _n_k_b16)])
						_n_o_b21 += 0.5
				_n_a_b20 += (float(0.6)/_n_r_b17)
	if _S.truth(((_n_q_b2 < 0.2) if _S.truth((_n_q_b2 >= 0.02)) else (_n_q_b2 >= 0.02))):
		var _n_k_b22 = (float((_n_q_b2 - 0.02))/0.18)
		for _iter_3 in _S.array(_n_bursts):
			var _n_b_b23 = _iter_3
			var _n_r0_b24 = (_S.named_value(_n_b_b23,"r0") + (10 * _S.invoke(_n_ease,"outCubic",[_n_k_b22])))
			var _n_ca_b25 = cos(_S.named_value(_n_b_b23,"a"))
			var _n_sa_b26 = sin(_S.named_value(_n_b_b23,"a"))
			_S.invoke(_n_p_b0,"line",[(_n_SX + (_n_ca_b25 * _n_r0_b24)), (_n_SY + (_n_sa_b26 * _n_r0_b24)), (_n_SX + (_n_ca_b25 * (_n_r0_b24 + (_S.named_value(_n_b_b23,"L") * (1 - _n_k_b22))))), (_n_SY + (_n_sa_b26 * (_n_r0_b24 + (_S.named_value(_n_b_b23,"L") * (1 - _n_k_b22))))), (_n_WHITE if _S.truth((_n_k_b22 < 0.4)) else _S.index_value(_n_C,5)), (1.1 - _n_k_b22)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "s"), {"a": _S.binary("+", _S.prop(_S.read(_e, "s"), "a"), _S.read(_e, "turn"))}])
