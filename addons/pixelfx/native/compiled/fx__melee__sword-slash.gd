@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/sword-slash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "onArc", _S.function_value(_e, "_f0"))
	_S.define(_e, "crescent", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSlash", _S.function_value(_e, "_f3"))
	_S.define(_e, "tipOf", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Sword slash"}, {"desc": "A tilted crescent whips round in two frames, cools from white to deep blue as it trails off, glints at the tip and throws sparks."}, {"tags": ["melee", "slash", "sword", "combat", "directional", "one-shot"]}, {"size": [136, 104]}, {"origin": [44, 92]}, {"duration": 0.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#b8c9e8", "#e8f1ff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"radius": 42}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GUARD", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.85)}]))
	_S.define(_e, "WIND", _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}, {"crouch": 4}, {"lean": _S.unary("-", 4)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 35)}, {"sa": _S.unary("-", 2.65)}, {"bx": 9}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "CUT", _S.merge([_S.read(_e, "GUARD"), {"x": 0}, {"crouch": 2}, {"lean": 3}, {"fx": 16}, {"fy": _S.unary("-", 37)}, {"sa": _S.unary("-", 1.45)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}, {"ghost": 1}]))
	_S.define(_e, "DOWN", _S.merge([_S.read(_e, "GUARD"), {"x": 2}, {"crouch": 5}, {"lean": 5}, {"fx": 20}, {"fy": _S.unary("-", 21)}, {"sa": 0.62}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 58}])}, {"poses": [[_S.unary("-", 0.55), _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}])], [_S.unary("-", 0.3), _S.read(_e, "WIND")], [_S.unary("-", 0.08), _S.merge([_S.read(_e, "WIND"), {"crouch": 5}, {"lean": _S.unary("-", 5)}])], [0, _S.read(_e, "CUT"), "snap"], [0.06, _S.read(_e, "DOWN"), "snap"], [0.3, _S.merge([_S.read(_e, "DOWN"), {"x": 3}, {"crouch": 6}])], [0.58, _S.merge([_S.read(_e, "GUARD"), {"x": 1}, {"crouch": 3}, {"fx": 15}, {"fy": _S.unary("-", 21)}, {"sa": 0.1}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 21)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}])], [0.86, _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}])]]}, {"hits": [_S.merge([{"t": 0.06}, {"stop": 0.14}, {"shake": 0.18}, {"amp": 2}, {"push": 2.8}, {"straw": 18}])]}, {"dust": [_S.merge([{"t": 0.06}, {"x": 16}, {"n": 7}, {"dir": 1}]), _S.merge([{"t": 0.06}, {"x": _S.unary("-", 11)}, {"n": 4}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_lx_b3 = (cos(_n_a_b2) * _n_r_b1)
	var _n_ly_b4 = ((sin(_n_a_b2) * _n_r_b1) * _S.named_value(_n_s_b0,"sy"))
	var _n_c_b5 = cos(_S.named_value(_n_s_b0,"rot"))
	var _n_n_b6 = sin(_S.named_value(_n_s_b0,"rot"))
	return [((_S.named_value(_n_s_b0,"cx") + (_n_lx_b3 * _n_c_b5)) - (_n_ly_b4 * _n_n_b6)), ((_S.named_value(_n_s_b0,"cy") + (_n_lx_b3 * _n_n_b6)) + (_n_ly_b4 * _n_c_b5))]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_onArc = _S.read(_parent,"onArc")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_ta_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_W_b4 = _S.arg(_args,4)
	var _n_age_b5 = _S.arg(_args,5)
	if _S.truth(_S.logical("||",(absf(_n_L_b3) < 0.02),func():return (_n_W_b4 < 0.3))):
		return null
	var _n_R_b6 = _S.named_value(_n_s_b1,"ramp")
	var _n_n_b7 = _S.prop(_n_R_b6,"length")
	var _n_dir_b8 = signf(_n_L_b3)
	var _n_span_b9 = absf(_n_L_b3)
	var _n_c_b10 = cos(_S.named_value(_n_s_b1,"rot"))
	var _n_sn_b11 = sin(_S.named_value(_n_s_b1,"rot"))
	var _n_B_b12 = (_S.named_value(_n_s_b1,"R") + 2)
	_S.invoke(_n_p_b0,"shade",[(_S.named_value(_n_s_b1,"cx") - _n_B_b12), (_S.named_value(_n_s_b1,"cy") - _n_B_b12), (_S.named_value(_n_s_b1,"cx") + _n_B_b12), (_S.named_value(_n_s_b1,"cy") + _n_B_b12), _S.function_value(_S.capture(_parent,{"s":_n_s_b1,"c":_n_c_b10,"sn":_n_sn_b11,"W":_n_W_b4,"dir":_n_dir_b8,"ta":_n_ta_b2,"span":_n_span_b9,"age":_n_age_b5,"n":_n_n_b7,"R":_n_R_b6,"this":_this}),"_f2")])
	if true:
		var _n_u_b13 = 0
		while _S.truth((_n_u_b13 <= _n_span_b9)):
			var _tuple_0 = _S.call_value(_n_onArc,[_n_s_b1, (_S.named_value(_n_s_b1,"R") - (_n_W_b4 * 0.4)), (_n_ta_b2 + (_n_dir_b8 * _n_u_b13))])
			var _n_x_b14 = _S.prop(_tuple_0,0)
			var _n_y_b15 = _S.prop(_tuple_0,1)
			_S.invoke(_n_p_b0,"glow",[_n_x_b14, _n_y_b15, (5 + _n_W_b4), _S.index_value(_n_R_b6,(_n_n_b7 - 3)), ((0.22 * (1 - _n_age_b5)) * (float(_n_u_b13)/_n_span_b9))])
			_n_u_b13 += 0.3
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _n_c = _S.read(_parent,"c")
	var _n_sn = _S.read(_parent,"sn")
	var _n_W = _S.read(_parent,"W")
	var _n_dir = _S.read(_parent,"dir")
	var _n_ta = _S.read(_parent,"ta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_span = _S.read(_parent,"span")
	var _n_age = _S.read(_parent,"age")
	var _n_n = _S.read(_parent,"n")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_s,"cx"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_s,"cy"))
	var _n_lx_b5 = ((_n_dx_b3 * _n_c) + (_n_dy_b4 * _n_sn))
	var _n_ly_b6 = (float((((-_n_dx_b3) * _n_sn) + (_n_dy_b4 * _n_c)))/_S.named_value(_n_s,"sy"))
	var _n_r_b7 = _S.Bridge.hypot([_n_lx_b5, _n_ly_b6])
	if _S.truth(((_n_r_b7 > (_S.named_value(_n_s,"R") + 0.5)) if _S.truth((_n_r_b7 > (_S.named_value(_n_s,"R") + 0.5))) else (_n_r_b7 < ((_S.named_value(_n_s,"R") - _n_W) - 1)))):
		return null
	var _n_u_b8 = fmod((_n_dir * (atan2(_n_ly_b6,_n_lx_b5) - _n_ta)),_n_TAU)
	if _S.truth((_n_u_b8 < 0)):
		_n_u_b8 += _n_TAU
	if _S.truth((_n_u_b8 > _n_span)):
		return null
	var _n_v_b9 = (float(_n_u_b8)/_n_span)
	var _n_w_b10 = (_n_W * pow(sin((PI * pow(_n_v_b9,2.2))),0.6))
	if _S.truth((_n_w_b10 < 0.35)):
		return null
	var _n_q_b11 = (float((_S.named_value(_n_s,"R") - _n_r_b7))/_n_w_b10)
	if _S.truth(((_n_q_b11 < 0) if _S.truth((_n_q_b11 < 0)) else (_n_q_b11 > 1))):
		return null
	var _n_ci_b12 = (0 if _S.truth(((_n_age < 0.5) if _S.truth((_n_q_b11 < 0.22)) else (_n_q_b11 < 0.22))) else floori((((((_n_q_b11 * (_n_n - 1)) * 0.75) + (_n_age * 2.4)) - (_n_v_b9 * 0.8)) + 0.4)+0.5))
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_R,((_n_n - 1) - clampf(_n_ci_b12,0,(_n_n - 1)))),"=")
	_S.set_prop(_n_out_b2,"a",minf(1,(float(_n_v_b9)/0.4)),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_crescent = _S.read(_parent,"crescent")
	var _n_onArc = _S.read(_parent,"onArc")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_u_b3 = (_n_t_b2 - _S.named_value(_n_s_b1,"t0"))
	if _S.truth((_n_u_b3 < 0)):
		return null
	var _n_span_b4 = (_S.named_value(_n_s_b1,"a1") - _S.named_value(_n_s_b1,"a0"))
	var _n_head_b5 = _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b3)/_S.named_value(_n_s_b1,"sweep")),0.0,1.0)])
	var _n_tail_b6 = _S.MathFX.smooth((_S.named_value(_n_s_b1,"sweep") + _S.named_value(_n_s_b1,"hold")),((_S.named_value(_n_s_b1,"sweep") + _S.named_value(_n_s_b1,"hold")) + _S.named_value(_n_s_b1,"trail")),_n_u_b3)
	var _n_age_b7 = clampf((float(_n_u_b3)/((_S.named_value(_n_s_b1,"sweep") + _S.named_value(_n_s_b1,"hold")) + _S.named_value(_n_s_b1,"trail"))),0.0,1.0)
	if _S.truth((_n_tail_b6 < 1)):
		_S.call_value(_n_crescent,[_n_p_b0, _n_s_b1, (_S.named_value(_n_s_b1,"a0") + (_n_span_b4 * _n_tail_b6)), (_n_span_b4 * (_n_head_b5 - _n_tail_b6)), (_S.named_value(_n_s_b1,"W") * (1 - (_n_tail_b6 * 0.55))), _n_age_b7])
	var _n_th_b8 = (0.7 * (1 - clampf((float(((_n_u_b3 - _S.named_value(_n_s_b1,"sweep")) - _S.named_value(_n_s_b1,"hold")))/(_S.named_value(_n_s_b1,"trail") + 0.2)),0.0,1.0)))
	if _S.truth(((_n_th_b8 > 0) if _S.truth((_n_tail_b6 > 0.02)) else (_n_tail_b6 > 0.02))):
		if true:
			var _n_k_b9 = 0
			while _S.truth((_n_k_b9 <= _n_tail_b6)):
				var _tuple_0 = _S.call_value(_n_onArc,[_n_s_b1, (_S.named_value(_n_s_b1,"R") - 0.5), (_S.named_value(_n_s_b1,"a0") + (_n_span_b4 * _n_k_b9))])
				var _n_x_b10 = _S.prop(_tuple_0,0)
				var _n_y_b11 = _S.prop(_tuple_0,1)
				_S.invoke(_n_p_b0,"dot",[_n_x_b10, _n_y_b11, _S.index_value(_S.named_value(_n_s_b1,"ramp"),1), (_n_th_b8 * (0.4 + (0.6 * _n_k_b9)))])
				_n_k_b9 += (float(0.6)/(absf(_n_span_b4) * _S.named_value(_n_s_b1,"R")))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_onArc = _S.read(_parent,"onArc")
	var _n_s_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.call_value(_n_onArc,[_n_s_b0, (_S.named_value(_n_s_b0,"R") - (_S.named_value(_n_s_b0,"W") * 0.3)), _S.named_value(_n_s_b0,"a1")])
	var _n_x_b1 = _S.prop(_tuple_0,0)
	var _n_y_b2 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_onArc,[_n_s_b0, (_S.named_value(_n_s_b0,"R") - (_S.named_value(_n_s_b0,"W") * 0.3)), (_S.named_value(_n_s_b0,"a1") + (signf((_S.named_value(_n_s_b0,"a1") - _S.named_value(_n_s_b0,"a0"))) * 0.05))])
	var _n_x2_b3 = _S.prop(_tuple_1,0)
	var _n_y2_b4 = _S.prop(_tuple_1,1)
	var _n_l_b5 = _S.logical("||",_S.Bridge.hypot([(_n_x2_b3 - _n_x_b1), (_n_y2_b4 - _n_y_b2)]),func():return 1)
	return {"x":_n_x_b1,"y":_n_y_b2,"dx":(float((_n_x2_b3 - _n_x_b1))/_n_l_b5),"dy":(float((_n_y2_b4 - _n_y_b2))/_n_l_b5)}
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f6")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "R0", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "a0", _S.unary("-", 2.55))
	_S.define(_e, "a1", 0.95)
	_S.define(_e, "A", _S.merge([{"cx": 6}, {"cy": _S.unary("-", 26)}, {"R": _S.read(_e, "R0")}, {"sy": 0.6}, {"rot": _S.unary("-", 0.38)}, {"a0": _S.read(_e, "a0")}, {"a1": _S.read(_e, "a1")}, {"W": 12}, {"t0": 0}, {"sweep": 0.06}, {"hold": 0.06}, {"trail": 0.24}, {"ramp": _S.read(_e, "C")}]))
	_S.define(_e, "E", _S.merge([_S.read(_e, "A"), {"R": _S.binary("*", _S.read(_e, "R0"), _S.binary("/", 33, 42))}, {"W": _S.binary("*", _S.read(_e, "R0"), _S.binary("/", 4.5, 42))}, {"a0": _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("-", _S.read(_e, "a1"), _S.read(_e, "a0")), 0.1))}, {"a1": _S.binary("-", _S.read(_e, "a1"), _S.binary("*", _S.binary("-", _S.read(_e, "a1"), _S.read(_e, "a0")), _S.binary("/", 0.15, 3.5)))}, {"t0": 0.017}, {"hold": 0.03}, {"trail": 0.2}, {"ramp": _S.invoke(_S.read(_e, "C"), "slice", [0, 6])}]))
	_S.define(_e, "tip", _S.call_value(_S.read(_e, "tipOf"), [_S.read(_e, "A")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "landed", false)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f6(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "landed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "sweep")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "landed", true, "=", false)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "a", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "atan2", [_S.prop(_S.read(_v10, "tip"), "dy"), _S.prop(_S.read(_v10, "tip"), "dx")]), _S.invoke(_S.read(_v10, "Rg"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "Rg"), "range", [150, 400]))
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.prop(_S.read(_v10, "tip"), "x"), _S.prop(_S.read(_v10, "tip"), "y"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "Rg"), "range", [0.12, 0.35])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v11 = _S.scope(_v8)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 16)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.read(_v12, "a0"), _S.binary("*", _S.binary("-", _S.read(_v12, "a1"), _S.read(_v12, "a0")), _S.invoke(_S.read(_v12, "Rg"), "range", [0.3, 1]))))
			var _v13 = _S.call_value(_S.read(_v12, "onArc"), [_S.read(_v12, "A"), _S.prop(_S.read(_v12, "A"), "R"), _S.read(_v12, "a")])
			_S.define(_v12, "x", _S.prop(_v13, 0))
			_S.define(_v12, "y", _S.prop(_v13, 1))
			_S.define(_v12, "ox", _S.binary("-", _S.read(_v12, "x"), _S.prop(_S.read(_v12, "A"), "cx")))
			_S.define(_v12, "oy", _S.binary("-", _S.read(_v12, "y"), _S.prop(_S.read(_v12, "A"), "cy")))
			_S.define(_v12, "l", _S.logical("||", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "ox"), _S.read(_v12, "oy")]), func(): return 1))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "Rg"), "range", [30, 100]))
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "MOTE"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", _S.binary("/", _S.read(_v12, "ox"), _S.read(_v12, "l")), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v12, "oy"), _S.read(_v12, "l")), _S.read(_v12, "sp")), 10), _S.invoke(_S.read(_v12, "Rg"), "range", [0.25, 0.55]), _S.prop(_S.read(_v12, "C"), _S.binary("+", 4, _S.invoke(_S.read(_v12, "Rg"), "int", [0, 1]))), 0.6])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_drawSlash = _S.read(_parent,"drawSlash")
	var _n_E = _S.read(_parent,"E")
	var _n_t = _S.read(_parent,"t")
	var _n_A = _S.read(_parent,"A")
	var _n_tip = _S.read(_parent,"tip")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_onArc = _S.read(_parent,"onArc")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawSlash,[_n_p_b0, _n_E, _n_t])
	_S.call_value(_n_drawSlash,[_n_p_b0, _n_A, _n_t])
	var _n_g_b1 = (_n_t - (_S.named_value(_n_A,"sweep") * 0.6))
	if _S.truth(((_n_g_b1 < 0.22) if _S.truth((_n_g_b1 > 0)) else (_n_g_b1 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_tip,"x"), _S.named_value(_n_tip,"y"), ((9 * _S.invoke(_n_ease,"outBack",[minf(1,(float(_n_g_b1)/0.05))])) * (1 - (float(_n_g_b1)/0.22))), _S.index_value(_n_C,5), _S.index_value(_n_C,3), 0.6])
	if _S.truth((_n_t < 0.3)):
		var _tuple_0 = _S.call_value(_n_onArc,[_n_A, (_S.named_value(_n_A,"R") - 4), (_S.named_value(_n_A,"a0") + ((_S.named_value(_n_A,"a1") - _S.named_value(_n_A,"a0")) * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_t)/_S.named_value(_n_A,"sweep")),0.0,1.0)])))])
		var _n_x_b2 = _S.prop(_tuple_0,0)
		var _n_y_b3 = _S.prop(_tuple_0,1)
		_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, 40, _S.index_value(_n_C,3), (0.5 * (1 - (float(_n_t)/0.3)))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	return null
