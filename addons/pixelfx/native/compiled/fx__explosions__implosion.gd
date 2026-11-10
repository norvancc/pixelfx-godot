@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/implosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Implosion"}, {"desc": "Everything is sucked in: streaks and grit rush inward, rings contract and a dark sphere collapses onto a crushed white point; a beat of stillness, then a sharp pop."}, {"tags": ["implosion", "energy", "magic", "collapse", "pop", "one-shot"]}, {"size": [208, 184]}, {"origin": [104, 92]}, {"duration": 1.65}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a0614", "#1c1236", "#3a2470", "#6a44c0", "#a080f0", "#d8c8ff", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SUCK", 0.8)
	_S.define(_e, "STILL", 1.02)
	_S.define(_e, "VOID", _S.call_value(_S.read(_e, "hex"), ["#05040a"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "grit", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 70}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 4}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_SUCK = _S.read(_parent,"SUCK")
	var _n_C = _S.read(_parent,"C")
	var _n_hex = _S.read(_parent,"hex")
	var _n_t0_b0 = _S.invoke(_n_R,"range",[0, 0.4])
	return {"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"d":_S.invoke(_n_R,"range",[40, 86]),"t0":_n_t0_b0,"T":_S.invoke(_n_R,"range",[0.3, ((_n_SUCK - 0.04) - _n_t0_b0)]),"spin":(_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[0.6, 1.6])),"c":_S.invoke(_n_R,"pick",[[_S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.call_value(_n_hex,["#4a4458"]), _S.call_value(_n_hex,["#6e6880"])]])}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return ((float((_n_i_b1 * _n_TAU))/4) + (float(PI)/4))
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SUCK"), 0.26))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "k", _S.binary("/", _S.read(_v0, "t"), _S.read(_v0, "SUCK")))
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "n"), _S.binary("+", 1, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.read(_v1, "k"), 4)])))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "R"), "chance", [0.9]))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "n", 1, "+=", true)
				continue
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
			_S.define(_v2, "D", _S.binary("*", _S.invoke(_S.read(_v2, "R"), "range", [34, 82]), _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v2, "k")))))
			_S.define(_v2, "T", _S.invoke(_S.read(_v2, "R"), "range", [0.14, 0.24]))
			_S.define(_v2, "v", _S.binary("/", _S.binary("*", _S.read(_v2, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "exp", [_S.binary("*", 3, _S.read(_v2, "T"))]), 1)))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "D")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "D")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.read(_v2, "T"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 4))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "n", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [_S.binary("*", 14, _S.read(_v0, "dt"))])):
			var _v3 = _S.scope(_v0)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "D", _S.invoke(_S.read(_v3, "R"), "range", [50, 80]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "D")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "D")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")])), 90), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")])), 90), _S.invoke(_S.read(_v3, "R"), "range", [0.4, 0.6]), _S.prop(_S.read(_v3, "C"), 3), _S.invoke(_S.read(_v3, "R"), "range", [3, 5])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "STILL")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "popped", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 90, _S.prop(_S.read(_v4, "C"), 4), 1, 0.4])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 30, _S.read(_v4, "WHITE"), 0.9, 0.08])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 34)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [120, 330]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [(_S.prop(_S.read(_v6, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.6])) else _S.prop(_S.read(_v6, "P"), "STAR")), 0, 0, _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.45]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 6), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 4)]]), _S.invoke(_S.read(_v6, "R"), "range", [0.8, 1.8])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_SUCK = _S.read(_parent,"SUCK")
	var _n_STILL = _S.read(_parent,"STILL")
	var _n_ease = _S.read(_parent,"ease")
	var _n_VOID = _S.read(_parent,"VOID")
	var _n_C = _S.read(_parent,"C")
	var _n_grit = _S.read(_parent,"grit")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_rays = _S.read(_parent,"rays")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = clampf((float(_n_t)/_n_SUCK),0.0,1.0)
	if _S.truth((_n_t < _n_STILL)):
		var _n_vr_b2 = ((64 * (1 - _S.invoke(_n_ease,"inCubic",[_n_k_b1]))) + 3)
		if _S.truth((_n_k_b1 < 1)):
			_S.invoke(_n_p_b0,"disc",[0, 0, _n_vr_b2, _n_VOID, (0.35 + (0.35 * _n_k_b1))])
			_S.invoke(_n_p_b0,"ring",[0, 0, (_n_vr_b2 + 1), 1, (_S.index_value(_n_C,3) if _S.truth((_n_k_b1 < 0.5)) else _S.index_value(_n_C,4)), (0.5 + (0.5 * _n_k_b1))])
			_S.invoke(_n_p_b0,"glowRing",[0, 0, _n_vr_b2, 5, _S.index_value(_n_C,4), (0.18 + (0.3 * _n_k_b1))])
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < 4)):
				var _n_u_b7 = (float((_n_t - (_n_i_b6 * 0.17)))/0.34)
				if _S.truth(((_n_u_b7 <= 0) if _S.truth((_n_u_b7 <= 0)) else (_n_u_b7 >= 1))):
					_n_i_b6 += 1.0
					continue
				var _n_r_b8 = (((70 - (_n_i_b6 * 8)) * (1 - _S.invoke(_n_ease,"inQuad",[_n_u_b7]))) + 2)
				_S.invoke(_n_p_b0,"ring",[0, 0, _n_r_b8, (2 if _S.truth((_n_u_b7 > 0.7)) else 1), (_S.index_value(_n_C,5) if _S.truth((_n_u_b7 > 0.6)) else _S.index_value(_n_C,3)), (0.4 + (0.6 * _n_u_b7))])
				_n_i_b6 += 1.0
		for _iter_0 in _S.array(_n_grit):
			var _n_q_b9 = _iter_0
			var _n_u_b10 = (float((_n_t - _S.named_value(_n_q_b9,"t0")))/_S.named_value(_n_q_b9,"T"))
			if _S.truth(((_n_u_b10 <= 0) if _S.truth((_n_u_b10 <= 0)) else (_n_u_b10 >= 1))):
				continue
			var _n_d_b11 = (_S.named_value(_n_q_b9,"d") * (1 - _S.invoke(_n_ease,"inCubic",[_n_u_b10])))
			var _n_a_b12 = (_S.named_value(_n_q_b9,"a") + ((_S.named_value(_n_q_b9,"spin") * _S.invoke(_n_ease,"inQuad",[_n_u_b10])) * 2))
			var _n_x_b13 = (cos(_n_a_b12) * _n_d_b11)
			var _n_y_b14 = (sin(_n_a_b12) * _n_d_b11)
			var _n_x2_b15 = (cos((_n_a_b12 - (_S.named_value(_n_q_b9,"spin") * 0.1))) * ((_n_d_b11 + ((4 * _n_u_b10) * _n_u_b10)) + 0.5))
			var _n_y2_b16 = (sin((_n_a_b12 - (_S.named_value(_n_q_b9,"spin") * 0.1))) * ((_n_d_b11 + ((4 * _n_u_b10) * _n_u_b10)) + 0.5))
			_S.invoke(_n_p_b0,"line",[_n_x2_b15, _n_y2_b16, _n_x_b13, _n_y_b14, _S.function_value(_S.capture(_parent,{"q":_n_q_b9,"this":_this}),"_f5")])
		var _n_still_b3 = (_n_t > _n_SUCK)
		var _n_jit_b4 = ((0.5 if _S.truth(fmod(floori((_n_t * 40)),2)) else (-0.5)) if _S.truth(_n_still_b3) else 0)
		var _n_cr_b5 = (1.6 if _S.truth(_n_still_b3) else (1 + (((3.5 * (1 - _n_k_b1)) * _n_k_b1) * 4)))
		_S.invoke(_n_p_b0,"disc",[_n_jit_b4, 0, (_n_cr_b5 + 3.5), _n_VOID, 0.85])
		_S.invoke(_n_p_b0,"circle",[_n_jit_b4, 0, (_n_cr_b5 + 1.2), _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[_n_jit_b4, 0, _n_cr_b5, _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, 0, (10 + (26 * _n_k_b1)), _S.index_value(_n_C,4), (0.3 + (0.5 * _n_k_b1))])
		if _S.truth(_n_still_b3):
			_S.invoke(_n_p_b0,"glow",[0, 0, 8, _n_WHITE, (0.4 + (0.2 * sin((_n_t * 60))))])
	else:
		var _n_q_b17 = (float((_n_t - _n_STILL))/0.5)
		var _n_e_b18 = _S.invoke(_n_ease,"outCubic",[clampf(_n_q_b17,0.0,1.0)])
		if _S.truth((_n_q_b17 < 0.08)):
			_S.invoke(_n_p_b0,"circle",[0, 0, ((6 * (1 - (float(_n_q_b17)/0.08))) + 1), _n_WHITE])
		if _S.truth((_n_q_b17 < 0.35)):
			var _n_L_b19 = (((1 - (float(_n_q_b17)/0.35)) * 34) + 3)
			for _iter_1 in _S.array(_n_rays):
				var _n_a_b20 = _iter_1
				if true:
					var _n_d_b21 = 0
					while _S.truth((_n_d_b21 <= _n_L_b19)):
						_S.invoke(_n_p_b0,"dot",[(cos(_n_a_b20) * _n_d_b21), (sin(_n_a_b20) * _n_d_b21), (_n_WHITE if _S.truth((_n_d_b21 < (_n_L_b19 * 0.4))) else _S.index_value(_n_C,5)), (1 if _S.truth((_n_d_b21 < (_n_L_b19 * 0.7))) else (1 - (float(((float(_n_d_b21)/_n_L_b19) - 0.7))/0.3)))])
						_n_d_b21 += 0.5
			for _iter_2 in _S.array(_n_rays):
				var _n_a_b22 = _iter_2
				if true:
					var _n_d_b23 = 0
					while _S.truth((_n_d_b23 <= (_n_L_b19 * 0.45))):
						_S.invoke(_n_p_b0,"dot",[(cos((_n_a_b22 + (float(PI)/4))) * _n_d_b23), (sin((_n_a_b22 + (float(PI)/4))) * _n_d_b23), _S.index_value(_n_C,5), (1 - (float(_n_d_b23)/(_n_L_b19 * 0.45)))])
						_n_d_b23 += 0.5
		if _S.truth((_n_q_b17 < 1)):
			_S.invoke(_n_p_b0,"ring",[0, 0, (4 + (74 * _n_e_b18)), maxf(1,(2.5 * (1 - _n_q_b17))), (_n_WHITE if _S.truth((_n_q_b17 < 0.2)) else _S.index_value(_n_C,5)), (1.15 - _n_q_b17)])
			_S.invoke(_n_p_b0,"ring",[0, 0, (2 + (40 * _S.invoke(_n_ease,"outCubic",[clampf((_n_q_b17 * 1.4),0.0,1.0)]))), 1, _S.index_value(_n_C,4), (1 - _n_q_b17)])
		if _S.truth((_n_q_b17 < 0.6)):
			_S.call_value(_n_sparkle,[_n_p_b0, 0, 0, (5 * (1 - (float(_n_q_b17)/0.6))), _n_WHITE, _S.index_value(_n_C,5), 0.6])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_VOID = _S.read(_parent,"VOID")
	var _n_v_b0 = _S.arg(_args,0)
	return (_S.ColorFX.mix(_S.named_value(_n_q,"c"),_n_VOID,0.4) if _S.truth((_n_v_b0 < 0.5)) else _S.named_value(_n_q,"c"))
	return null
