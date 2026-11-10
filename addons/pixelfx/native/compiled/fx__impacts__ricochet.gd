@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/ricochet.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "SOOT", _S.import_value("fx/impacts/_lib.js", "SOOT"))
	_S.define(_e, "tracer", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Ricochet"}, {"desc": "A tracer streaks down onto the floor, glances off with a white-hot star and skips away at an angle, leaving a glowing skid while sparks skitter along the ground."}, {"tags": ["impact", "ricochet", "bullet", "tracer", "sparks", "ground", "directional", "one-shot"]}, {"size": [232, 84]}, {"origin": [64, 60]}, {"duration": 1.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#5b5079"}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.05)
	_S.define(_e, "SPEED", 760)
	_S.define(_e, "IN", 0.32)
	_S.define(_e, "OUT", _S.unary("-", 0.21))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_hx_b1 = _S.arg(_args,1)
	var _n_hy_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_c_b7 = cos(_n_a_b3)
	var _n_s_b8 = sin(_n_a_b3)
	if true:
		var _n_d_b9 = 0
		while _S.truth((_n_d_b9 <= _n_L_b4)):
			var _n_u_b10 = (float(_n_d_b9)/_n_L_b4)
			_S.invoke(_n_p_b0,"dot",[(_n_hx_b1 - (_n_c_b7 * _n_d_b9)), (_n_hy_b2 - (_n_s_b8 * _n_d_b9)), (_n_WHITE if _S.truth((_n_u_b10 < 0.12)) else (_S.index_value(_n_C_b5,5) if _S.truth((_n_u_b10 < 0.45)) else (_S.index_value(_n_C_b5,4) if _S.truth((_n_u_b10 < 0.75)) else _S.index_value(_n_C_b5,2)))), (1 if _S.truth((_n_u_b10 < 0.45)) else (_n_k_b6 * (1.25 - _n_u_b10)))])
			_n_d_b9 += 0.5
	_S.invoke(_n_p_b0,"glow",[_n_hx_b1, _n_hy_b2, 9, _S.index_value(_n_C_b5,4), (0.6 * _n_k_b6)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 9, _S.read(_e, "OUT"), _S.merge([{"len": [6, 9]}, {"w": [1.4, 1.9]}, {"fwd": 2.6}, {"back": 0.6}])]))
	for _v2 in _S.array(_S.read(_e, "sp")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "s", _v2)
		var _v4 = _S.scope(_v3)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.prop(_S.read(_v4, "s"), "a")]), 0.2)):
			_S.set_prop(_S.read(_v4, "s"), "len", 0.3, "*=", false)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("-", _S.prop(_S.read(_v4, "s"), "a"), _S.read(_v4, "OUT"))])]), 0.6)):
			_S.set_prop(_S.read(_v4, "s"), "len", 0.65, "*=", false)
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "hit", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 2), 44, _S.prop(_S.read(_v5, "C"), 4), 0.65, 0.25])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 1), 14, _S.read(_v5, "WHITE"), 0.6, 0.06])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 18)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "low", _S.binary("<", _S.read(_v7, "i"), 12))
			_S.define(_v7, "a", _S.binary("+", _S.read(_v7, "OUT"), (_S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.22), 0.12]) if _S.truth(_S.read(_v7, "low")) else _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.7), 0.25]))))
			_S.define(_v7, "v", _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [260, 520]), (1 if _S.truth(_S.read(_v7, "low")) else 0.7)))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 1), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.42]), (1.3 if _S.truth(_S.read(_v7, "low")) else 1)), _S.read(_v7, "WHITE"), 1, (_S.invoke(_S.read(_v7, "R"), "range", [0, 0.05]) if _S.truth(_S.read(_v7, "low")) else 0)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 7)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v9, "Math"), "PI")), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.2), 0.9])))
			_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [60, 170]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "GRIT"), _S.invoke(_S.read(_v9, "R"), "range", [0, 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 0.95]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "st"), "light"), _S.prop(_S.read(_v9, "st"), "body"), _S.prop(_S.read(_v9, "st"), "lip")]]), (2 if _S.truth(_S.binary("<", _S.read(_v9, "i"), 2)) else 1)])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v10 = _S.scope(_v5)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 4)):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.invoke(_S.read(_v10, "R"), "range", [0, 8]), _S.unary("-", 1), _S.invoke(_S.read(_v10, "R"), "range", [20, 70]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [4, 16])), _S.invoke(_S.read(_v10, "R"), "range", [0.25, 0.45]), _S.call_value(_S.read(_v10, "mix"), [_S.prop(_S.read(_v10, "st"), "dust"), _S.read(_v10, "WHITE"), _S.invoke(_S.read(_v10, "R"), "range", [0.1, 0.3])]), _S.invoke(_S.read(_v10, "R"), "range", [1.2, 2])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_u_b1 = (_n_t - _n_HIT)
	if _S.truth((_n_u_b1 >= 0)):
		var _n_heat_b2 = pow(clampf((1 - (float(_n_u_b1)/0.85)),0.0,1.0),1.2)
		var _n_fade_b3 = (1 - _S.MathFX.smooth((_n_D - 0.4),(_n_D - 0.05),_n_t))
		var _n_L_b4 = (12 * minf(1,(float(_n_u_b1)/0.03)))
		if true:
			var _n_x_b5 = (-3)
			while _S.truth((_n_x_b5 <= _n_L_b4)):
				var _n_q_b6 = (float((_n_x_b5 + 3))/15)
				var _n_h_b7 = (_n_heat_b2 * (1.15 - (_n_q_b6 * 0.6)))
				_S.invoke(_n_p_b0,"dot",[_n_x_b5, 0, (_n_WHITE if _S.truth((_n_h_b7 > 0.8)) else (_S.index_value(_n_C,5) if _S.truth((_n_h_b7 > 0.55)) else (_S.index_value(_n_C,4) if _S.truth((_n_h_b7 > 0.35)) else (_S.index_value(_n_C,3) if _S.truth((_n_h_b7 > 0.18)) else (_S.index_value(_n_C,2) if _S.truth((_n_h_b7 > 0.08)) else _n_SOOT))))), _n_fade_b3])
				if _S.truth((_S.binary("===",_S.binary("&",_n_x_b5,1),0) if _S.truth(((_n_x_b5 < (_n_L_b4 - 2)) if _S.truth((_n_x_b5 > (-2))) else (_n_x_b5 > (-2)))) else ((_n_x_b5 < (_n_L_b4 - 2)) if _S.truth((_n_x_b5 > (-2))) else (_n_x_b5 > (-2))))):
					_S.invoke(_n_p_b0,"dot",[_n_x_b5, 1, (_S.index_value(_n_C,3) if _S.truth((_n_h_b7 > 0.4)) else _n_SOOT), (_n_fade_b3 * 0.7)])
				_n_x_b5 += 1.0
		if _S.truth((_n_heat_b2 > 0)):
			_S.invoke(_n_p_b0,"glowLine",[(-3), 0, _n_L_b4, 0, 5, _S.index_value(_n_C,3), (0.45 * _n_heat_b2)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_SPEED = _S.read(_parent,"SPEED")
	var _n_tracer = _S.read(_parent,"tracer")
	var _n_IN = _S.read(_parent,"IN")
	var _n_C = _S.read(_parent,"C")
	var _n_sp = _S.read(_parent,"sp")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_star = _S.read(_parent,"star")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	if _S.truth((_n_t < _n_HIT)):
		var _n_d_b1 = ((_n_HIT - _n_t) * _n_SPEED)
		_S.call_value(_n_tracer,[_n_p_b0, ((-cos(_n_IN)) * _n_d_b1), ((-sin(_n_IN)) * _n_d_b1), _n_IN, 22, _n_C])
	else:
		var _n_u_b2 = (_n_t - _n_HIT)
		if _S.truth((_n_u_b2 < 0.03)):
			_S.call_value(_n_star,[_n_p_b0, 0, (-1), _n_sp, 1, 1, [_S.index_value(_n_C,2), _S.index_value(_n_C,5), _S.index_value(_n_C,4), _n_WHITE], 1, 2])
		else:
			if _S.truth((_n_u_b2 < 0.06)):
				_S.call_value(_n_star,[_n_p_b0, 0, (-1), _n_sp, 1.25, 0.55, [_S.index_value(_n_C,1), _S.index_value(_n_C,4), _S.index_value(_n_C,3), _S.index_value(_n_C,5)], 1, 2])
		if _S.truth((_n_u_b2 < 0.2)):
			var _n_head_b5 = (4 + (_n_u_b2 * _n_SPEED))
			var _n_k_b6 = (1 - (float(_n_u_b2)/0.2))
			_S.call_value(_n_tracer,[_n_p_b0, (cos(_n_OUT) * _n_head_b5), ((-1) + (sin(_n_OUT) * _n_head_b5)), _n_OUT, minf((_n_head_b5 - 2),(18 + (_n_u_b2 * 200))), _n_C, _n_k_b6])
		var _n_g_b3 = (float((_n_u_b2 - 0.02))/0.2)
		if _S.truth(((_n_g_b3 < 1) if _S.truth((_n_g_b3 >= 0)) else (_n_g_b3 >= 0))):
			var _n_r_b7 = (5 + (12 * (1 - pow((1 - _n_g_b3),3))))
			var _n_c_b8 = (_S.index_value(_n_C,5) if _S.truth((_n_g_b3 < 0.3)) else (_S.index_value(_n_C,4) if _S.truth((_n_g_b3 < 0.6)) else _S.index_value(_n_C,3)))
			if true:
				var _n_j_b9 = 0
				var _n_n_b10 = ceili(((_n_r_b7 * PI) * 1.3))
				while _S.truth((_n_j_b9 <= _n_n_b10)):
					var _n_a_b11 = ((-PI) + ((float(_n_j_b9)/_n_n_b10) * PI))
					_S.invoke(_n_p_b0,"dot",[(cos(_n_a_b11) * _n_r_b7), ((-1) + (sin(_n_a_b11) * _n_r_b7)), _n_c_b8, (1.15 - _n_g_b3)])
					_n_j_b9 += 1.0
		var _n_pop_b4 = exp((float((-_n_u_b2))/0.045))
		if _S.truth((_n_pop_b4 > 0.02)):
			_S.invoke(_n_p_b0,"glow",[0, (-2), 22, _S.index_value(_n_C,3), (0.75 * _n_pop_b4)])
			_S.invoke(_n_p_b0,"glow",[0, (-1), 8, _n_WHITE, (0.5 * _n_pop_b4)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
