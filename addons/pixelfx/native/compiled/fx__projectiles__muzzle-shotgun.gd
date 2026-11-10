@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/muzzle-shotgun.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "casing", _S.import_value("fx/projectiles/_lib.js", "casing"))
	_S.define(_e, "fan", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Shotgun blast"}, {"desc": "A shotgun blast from a muzzle `height` px above the floor (the origin): a wide ragged fan of flame, pellet streaks, a heavy rolling smoke cloud, a red shell kicked out on the pump."}, {"tags": ["projectile", "muzzle", "gun", "shotgun", "flash", "smoke", "casing", "directional", "one-shot"]}, {"size": [160, 88]}, {"origin": [44, 82]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"smoke": ["#221e2a", "#36313f", "#4e4858", "#6a6474", "#888192", "#a8a1b1", "#c8c1cf"]}, {"shell": ["#4a0f14", "#9a1e22", "#d8423a", "#8c5c1c", "#e9b54a"]}, {"height": 26}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.arg(_args,1)
	var _n_k_b2 = (1 if _S.truth(_S.binary("===",_n_f_b1,1)) else (0.82 if _S.truth(_S.binary("===",_n_f_b1,2)) else 0.55))
	var _n_w_b3 = (1 if _S.truth(_S.binary("===",_n_f_b1,1)) else 1.25)
	var _n_L_b4 = [{"off":0.5,"a":0,"len":(11 * _n_k_b2),"wid":(3.6 * _n_w_b3),"core":0.5}]
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 9)):
			var _n_u_b6 = ((float(_n_i_b5)/8) - 0.5)
			var _n_a_b7 = ((_n_u_b6 * 1.15) + (_S.index_value(_n_R_b0,(_n_i_b5 * 3)) * 0.12))
			var _n_len_b8 = (((17 + (11 * (1 - (absf(_n_u_b6) * 1.4)))) + (_S.index_value(_n_R_b0,((_n_i_b5 * 3) + 1)) * 7)) * _n_k_b2)
			_S.invoke(_n_L_b4,"push",[{"off":2,"a":_n_a_b7,"len":_n_len_b8,"wid":((1.7 + _S.index_value(_n_R_b0,((_n_i_b5 * 3) + 2))) * _n_w_b3),"core":(0.32 if _S.truth(_S.binary("===",_n_f_b1,1)) else 0)}])
			_n_i_b5 += 1.0
	if _S.truth(_S.binary("===",_n_f_b1,1)):
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b9 = _iter_0
			_S.invoke(_n_L_b4,"push",[{"off":1,"a":(_n_s_b9 * (1.6 + (_S.index_value(_n_R_b0,(27 + (_n_s_b9 > 0))) * 0.4))),"len":(5 + (_S.index_value(_n_R_b0,29) * 3)),"wid":1.2,"core":0}])
	return _n_L_b4
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "SH", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "shell"), 5]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "right", _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "jit", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 32}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "pellets", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f4")]))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 16)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 0.55), 0.55]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [180, 460]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), 4, _S.read(_v5, "MY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 20), _S.invoke(_S.read(_v5, "R"), "range", [0.08, 0.3])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 7)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.5), 0.3]))
		_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [70, 200]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), 4, _S.read(_v7, "MY"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [0.4, 0.9]), _S.prop(_S.read(_v7, "F"), 5)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 26)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.45), 0.35]))
		_S.define(_v9, "sp", _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [60, 230]), (1.15 if _S.truth(_S.binary("<", _S.read(_v9, "i"), 8)) else 0.8)))
		_S.invoke(_S.read(_v9, "smoke"), "add", [_S.merge([{"x": _S.binary("+", 4, _S.invoke(_S.read(_v9, "R"), "range", [0, 4]))}, {"y": _S.binary("+", _S.read(_v9, "MY"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 1.5), 1.5]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"r0": _S.invoke(_S.read(_v9, "R"), "range", [2.5, 3.5])}, {"r1": _S.invoke(_S.read(_v9, "R"), "range", [7, 12.5])}, {"life": _S.invoke(_S.read(_v9, "R"), "range", [2.1, 2.9])}, {"a": _S.invoke(_S.read(_v9, "R"), "range", [0.55, 0.72])}, {"b": _S.invoke(_S.read(_v9, "R"), "range", [0.9, 1])}, {"drag": _S.invoke(_S.read(_v9, "R"), "range", [2.6, 3.6])}, {"rise": _S.invoke(_S.read(_v9, "R"), "range", [9, 15])}, {"grow": _S.invoke(_S.read(_v9, "R"), "range", [1.8, 2.8])}, {"warm": 1}, {"delay": _S.invoke(_S.read(_v9, "R"), "range", [0, 0.04])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 6)):
		_S.invoke(_S.read(_v10, "smoke"), "add", [_S.merge([{"x": 2}, {"y": _S.read(_v10, "MY")}, {"vx": _S.invoke(_S.read(_v10, "R"), "range", [15, 50])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [10, 25]))}, {"r0": 1.5}, {"r1": _S.invoke(_S.read(_v10, "R"), "range", [4, 6])}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [1.8, 2.4])}, {"a": 0.5}, {"b": 1}, {"drag": 2}, {"rise": 10}, {"curl": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [1.5, 3]))}, {"warm": 0.6}, {"delay": _S.binary("+", 0.08, _S.binary("*", _S.read(_v10, "i"), 0.05))}])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "shell", _S.merge([{"t0": 0.42}, {"vx": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 55]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [110, 150]))}, {"va": _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [16, 24]))}, {"a0": _S.invoke(_S.read(_e, "R"), "range", [0, 6.28])}]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return _S.invoke(_n_R,"next",[])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return {"a":_S.invoke(_n_R,"range",[(-0.13), 0.13]),"v":_S.invoke(_n_R,"range",[900, 1150]),"d0":_S.invoke(_n_R,"range",[0, 4])}
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_SM = _S.read(_parent,"SM")
	var _n_F = _S.read(_parent,"F")
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_shell = _S.read(_parent,"shell")
	var _n_meta = _S.read(_parent,"meta")
	var _n_MY = _S.read(_parent,"MY")
	var _n_casing = _S.read(_parent,"casing")
	var _n_SH = _S.read(_parent,"SH")
	var _n_F1 = _S.read(_parent,"F1")
	var _n_fan = _S.read(_parent,"fan")
	var _n_jit = _S.read(_parent,"jit")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flash = _S.read(_parent,"flash")
	var _n_right = _S.read(_parent,"right")
	var _n_pellets = _S.read(_parent,"pellets")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pop_b1 = exp((float((-(_n_t + 0.008)))/0.05))
	var _n_list_b2 = _S.invoke(_n_smoke,"puffs",[])
	for _iter_0 in _S.array(_n_list_b2):
		var _n_q_b3 = _iter_0
		_S.set_prop(_n_q_b3,"w",(0.25 + (_n_pop_b1 * 1.2)),"*=")
	_S.call_value(_n_cloud,[_n_p_b0, _n_list_b2, _n_SM, [_S.index_value(_n_SM,0), _S.ColorFX.mix(_S.index_value(_n_F,1),_S.index_value(_n_SM,1),0.5), _S.ColorFX.mix(_S.index_value(_n_F,2),_S.index_value(_n_SM,2),0.4), _S.index_value(_n_F,3), _S.index_value(_n_F,4), _S.index_value(_n_F,5), _S.index_value(_n_F,7)], {"dens":1.4,"max":0.86,"lit":1.4}])
	if _S.truth(((_n_t < (_S.named_value(_n_meta,"duration") - 0.05)) if _S.truth((_n_t > _S.named_value(_n_shell,"t0"))) else (_n_t > _S.named_value(_n_shell,"t0")))):
		var _n_k_b4 = _S.call_value(_n_casing,[(-9), _n_MY, _S.named_value(_n_shell,"vx"), _S.named_value(_n_shell,"vy"), _S.named_value(_n_shell,"va"), (_n_t - _S.named_value(_n_shell,"t0")), 850, (-1), 0.35, _S.named_value(_n_shell,"a0")])
		var _n_ca_b5 = cos(_S.named_value(_n_k_b4,"a"))
		var _n_sa_b6 = sin(_S.named_value(_n_k_b4,"a"))
		var _n_fade_b7 = clampf((float(((_S.named_value(_n_meta,"duration") - 0.05) - _n_t))/0.3),0.0,1.0)
		if true:
			var _n_d_b8 = (-1.5)
			while _S.truth((_n_d_b8 <= 1.5)):
				_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_k_b4,"x") + (_n_ca_b5 * _n_d_b8)), ((_S.named_value(_n_k_b4,"y") + (_n_sa_b6 * _n_d_b8)) - 0.5), ((_S.index_value(_n_SH,4) if _S.truth((_n_d_b8 > 1.2)) else _S.index_value(_n_SH,3)) if _S.truth((_n_d_b8 > 0.8)) else (_S.index_value(_n_SH,2) if _S.truth((_n_d_b8 > (-0.6))) else _S.index_value(_n_SH,1))), _n_fade_b7])
				_n_d_b8 += 0.5
		if true:
			var _n_d_b9 = (-1)
			while _S.truth((_n_d_b9 <= 1)):
				_S.invoke(_n_p_b0,"dot",[((_S.named_value(_n_k_b4,"x") + (_n_ca_b5 * _n_d_b9)) - _n_sa_b6), (((_S.named_value(_n_k_b4,"y") + (_n_sa_b6 * _n_d_b9)) + _n_ca_b5) - 0.5), (_S.index_value(_n_SH,3) if _S.truth((_n_d_b9 > 0.6)) else _S.index_value(_n_SH,0)), _n_fade_b7])
				_n_d_b9 += 0.5
		if _S.truth(((_S.named_value(_n_k_b4,"hit") < 0.07) if _S.truth((_S.named_value(_n_k_b4,"hit") >= 0)) else (_S.named_value(_n_k_b4,"hit") >= 0))):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_k_b4,"x"), _S.named_value(_n_k_b4,"y"), 5, _S.index_value(_n_SH,4), (0.5 * (1 - (float(_S.named_value(_n_k_b4,"hit"))/0.07)))])
	if _S.truth((_n_t < (3 * _n_F1))):
		var _n_f_b10 = (1 if _S.truth((_n_t < _n_F1)) else (2 if _S.truth((_n_t < (2 * _n_F1))) else 3))
		_S.call_value(_n_flash,[_n_p_b0, 0, _n_MY, 0, _S.call_value(_n_fan,[_n_jit, _n_f_b10]), ([_n_WHITE, _S.index_value(_n_F,7), _S.index_value(_n_F,6), _S.index_value(_n_F,3)] if _S.truth(_S.binary("===",_n_f_b10,1)) else ([_S.index_value(_n_F,7), _S.index_value(_n_F,6), _S.index_value(_n_F,4), _S.index_value(_n_F,2)] if _S.truth(_S.binary("===",_n_f_b10,2)) else [_S.index_value(_n_F,5), _S.index_value(_n_F,4), _S.index_value(_n_F,3), _S.index_value(_n_F,1)])), (_n_f_b10 + 9)])
	if _S.truth((_n_t < 0.2)):
		for _iter_1 in _S.array(_n_pellets):
			var _n_q_b11 = _iter_1
			var _n_head_b12 = ((6 + _S.named_value(_n_q_b11,"d0")) + (_S.named_value(_n_q_b11,"v") * _n_t))
			var _n_tail_b13 = maxf(4,(_n_head_b12 - 26))
			var _n_ca_b14 = cos(_S.named_value(_n_q_b11,"a"))
			var _n_sa_b15 = sin(_S.named_value(_n_q_b11,"a"))
			if true:
				var _n_d_b16 = _n_tail_b13
				while _S.truth((_n_d_b16 <= _n_head_b12)):
					var _n_x_b17 = (_n_ca_b14 * _n_d_b16)
					if _S.truth((_n_x_b17 > _n_right)):
						break
					var _n_u_b18 = (float((_n_d_b16 - _n_tail_b13))/maxf(1,(_n_head_b12 - _n_tail_b13)))
					_S.invoke(_n_p_b0,"dot",[_n_x_b17, (_n_MY + (_n_sa_b15 * _n_d_b16)), (_n_WHITE if _S.truth((_n_u_b18 > 0.85)) else (_S.index_value(_n_F,6) if _S.truth((_n_u_b18 > 0.5)) else _S.index_value(_n_F,4))), (1 if _S.truth((_n_u_b18 > 0.3)) else (float(_n_u_b18)/0.3))])
					_n_d_b16 += 0.5
			if _S.truth(((_n_ca_b14 * _n_head_b12) < _n_right)):
				_S.invoke(_n_p_b0,"glow",[(_n_ca_b14 * _n_head_b12), (_n_MY + (_n_sa_b15 * _n_head_b12)), 4, _S.index_value(_n_F,6), 0.5])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_p_b0,"glow",[8, _n_MY, 46, _S.index_value(_n_F,4), (0.95 * _n_pop_b1)])
	_S.invoke(_n_p_b0,"glow",[4, _n_MY, 12, _n_WHITE, (0.6 * _n_pop_b1)])
	_S.invoke(_n_p_b0,"glow",[10, 0, 30, _S.index_value(_n_F,4), (0.28 * _n_pop_b1)])
	return null
