@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/blunt-hit.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/impacts/_lib.js", "rock"))
	_S.define(_e, "rockShape", _S.import_value("fx/impacts/_lib.js", "rockShape"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Blunt hit"}, {"desc": "A heavy, soft thud: a white-hot lumpy blob cools to cream in a warm pool of light, inked wedges jab out and snap back, a squashed ring of dust puffs swells and drifts, clods drop."}, {"tags": ["impact", "hit", "blunt", "punch", "club", "thump", "dust", "comic", "one-shot"]}, {"size": [128, 88]}, {"origin": [64, 72]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1d1620", "#4a3a3c", "#7d6a66", "#b09c90", "#dccab4", "#f6ead2", "#ffffff"]}, {"warm": "#ffc98a"}, {"dust": "#b7a8a6"}, {"clod": "#6e5a5a"}, {"height": 22}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "lump", _S.function_value(_e, "_f10"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "PH", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "warm")]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "dust")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "clod")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 48, _S.read(_e, "WARM"), 0.6, 0.4])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 16, _S.read(_e, "WHITE"), 0.6, 0.07])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 2), 36, _S.read(_e, "WARM"), 0.25, 0.4])
	_S.define(_e, "wedges", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "puffs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 30}]), _S.function_value(_e, "_f3")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 5)):
		_S.invoke(_S.read(_v0, "puffs"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v0, "X"), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 6), 6]))}, {"y": _S.binary("-", _S.read(_v0, "Y"), _S.invoke(_S.read(_v0, "R"), "range", [3, 6]))}, {"vx": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 30), 30])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [20, 45]))}, {"r": _S.invoke(_S.read(_v0, "R"), "range", [3.5, 5.5])}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [0.6, 0.85])}, {"max": 0}, {"t0": _S.invoke(_S.read(_v0, "R"), "range", [0.05, 0.1])}, {"lift": _S.invoke(_S.read(_v0, "R"), "range", [14, 24])}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	for _v1 in _S.array(_S.read(_e, "puffs")):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "q", _v1)
		_S.set_prop(_S.read(_v2, "q"), "max", _S.prop(_S.read(_v2, "q"), "life"), "=", false)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 5)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "s", _S.invoke(_S.read(_v4, "R"), "sign", []))
		_S.define(_v4, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 2), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1.3]))))
		_S.define(_v4, "v", _S.invoke(_S.read(_v4, "R"), "range", [70, 140]))
		_S.invoke(_S.read(_v4, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v4, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v4, "X"), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [4, 8])))}, {"y": _S.binary("+", _S.read(_v4, "Y"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 3), 3]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "v"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "v"))}, {"g": 1}, {"drag": 0.6}, {"bounce": 0.28}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [0.65, 0.85])}, {"a": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"va": _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [8, 16]))}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.4])) else 1)}, {"pts": _S.call_value(_S.read(_v4, "rockShape"), [_S.read(_v4, "R")])}, {"pvy": 0}])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "kicks", [])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_i_b1)/9) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.2), 0.2])),"len":_S.invoke(_n_R,"range",[6, 15]),"w":_S.invoke(_n_R,"range",[3.2, 5]),"r0":_S.invoke(_n_R,"range",[13, 16]),"t0":_S.invoke(_n_R,"range",[0.015, 0.04]),"out":_S.invoke(_n_R,"range",[0.04, 0.06]),"back":_S.invoke(_n_R,"range",[0.09, 0.14])}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/30) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.12), 0.12]))
	var _n_side_b3 = absf(cos(_n_a_b2))
	var _n_v_b4 = (_S.invoke(_n_R,"range",[40, 140]) * (0.6 + (0.5 * _n_side_b3)))
	return {"x":(_n_X + (cos(_n_a_b2) * 9)),"y":(_n_Y + (sin(_n_a_b2) * 6)),"vx":(cos(_n_a_b2) * _n_v_b4),"vy":((sin(_n_a_b2) * _n_v_b4) * 0.5),"r":(_S.invoke(_n_R,"range",[2.4, 6.2]) * (0.75 + (0.35 * _n_side_b3))),"life":_S.invoke(_n_R,"range",[0.35, 0.85]),"max":0,"t0":_S.invoke(_n_R,"range",[0.03, 0.1]),"lift":_S.invoke(_n_R,"range",[4, 16])}
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v5 in _S.array(_S.read(_e, "puffs")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "q", _v5)
		var _v7 = _S.scope(_v6)
		if _S.truth(_S.binary("<", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "q"), "t0"))):
			continue
		_S.set_prop(_S.read(_v7, "q"), "life", _S.read(_v7, "dt"), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vx"), 4.5), _S.read(_v7, "dt")), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vy"), 4.5), _S.read(_v7, "dt")), _S.binary("*", _S.logical("??", _S.prop(_S.read(_v7, "q"), "lift"), func(): return 6), _S.read(_v7, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "x", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vx"), _S.read(_v7, "dt")), "+=", false)
		_S.set_prop(_S.read(_v7, "q"), "y", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vy"), _S.read(_v7, "dt")), "+=", false)
	for _v8 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "b", _v8)
		_S.set_prop(_S.read(_v9, "b"), "pvy", _S.prop(_S.read(_v9, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v10 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "b", _v10)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v11, "b"), "pvy"), 60), func(): return _S.binary("<=", _S.prop(_S.read(_v11, "b"), "vy"), 0))):
			var _v12 = _S.scope(_v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "i"), 2)):
				_S.invoke(_S.read(_v13, "kicks"), "push", [_S.merge([{"x": _S.prop(_S.read(_v13, "b"), "x")}, {"y": _S.unary("-", 1)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v13, "R"), "sign", []), _S.invoke(_S.read(_v13, "R"), "range", [8, 22]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [3, 10]))}, {"r": _S.invoke(_S.read(_v13, "R"), "range", [1.2, 2])}, {"life": 0.4}, {"max": 0.4}, {"t0": 0}])])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
			_S.set_prop(_S.read(_v12, "b"), "pvy", 0, "=", false)
	for _v14 in _S.array(_S.read(_e, "kicks")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "q", _v14)
		var _v16 = _S.scope(_v15)
		_S.set_prop(_S.read(_v16, "q"), "life", _S.read(_v16, "dt"), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vx"), 4), _S.read(_v16, "dt")), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vy"), 4), _S.read(_v16, "dt")), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "x", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vx"), _S.read(_v16, "dt")), "+=", false)
		_S.set_prop(_S.read(_v16, "q"), "y", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vy"), _S.read(_v16, "dt")), "+=", false)
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_WARM = _S.read(_parent,"WARM")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_kicks = _S.read(_parent,"kicks")
	var _n_st = _S.read(_parent,"st")
	var _n_rock = _S.read(_parent,"rock")
	var _n_bits = _S.read(_parent,"bits")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_wedges = _S.read(_parent,"wedges")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_S.concat([_S.array(_n_puffs),_S.array(_n_kicks)])):
		var _n_q_b2 = _iter_0
		var _n_k_b3 = (float(_S.named_value(_n_q_b2,"life"))/_S.named_value(_n_q_b2,"max"))
		if _S.truth(((_n_t < _S.named_value(_n_q_b2,"t0")) if _S.truth((_n_t < _S.named_value(_n_q_b2,"t0"))) else (_n_k_b3 <= 0))):
			continue
		var _n_r_b4 = (_S.named_value(_n_q_b2,"r") * (0.7 + ((1 - _n_k_b3) * 0.85)))
		var _n_a_b5 = (pow(_n_k_b3,1.25) * minf(1,(float((_n_t - _S.named_value(_n_q_b2,"t0")))/0.03)))
		var _n_c_b6 = _S.ColorFX.mix(_n_DUST,_n_WARM,(clampf((1 - (float((_n_t - 0.03))/0.25)),0.0,1.0) * 0.55))
		_S.invoke(_n_p_b0,"disc",[_S.named_value(_n_q_b2,"x"), _S.named_value(_n_q_b2,"y"), _n_r_b4, _n_c_b6, _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"this":_this}),"_f6")])
		_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_q_b2,"x") - (_n_r_b4 * 0.22)), (_S.named_value(_n_q_b2,"y") - (_n_r_b4 * 0.32)), (_n_r_b4 * 0.58), _S.ColorFX.mix(_n_c_b6,_n_WHITE,0.55), _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"this":_this}),"_f7")])
	for _iter_1 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b7 = _iter_1
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b7, _n_st])
	if _S.truth((_n_t < 0.058)):
		var _n_f_b8 = (0 if _S.truth((_n_t < 0.025)) else 1)
		var _n_R0_b9 = (13.5 if _S.truth(_n_f_b8) else 11.5)
		_S.invoke(_n_p_b0,"shade",[(_n_X - (_n_R0_b9 * 1.4)), (_n_Y - (_n_R0_b9 * 1.4)), (_n_X + (_n_R0_b9 * 1.4)), (_n_Y + (_n_R0_b9 * 1.4)), _S.function_value(_S.capture(_parent,{"f":_n_f_b8,"R0":_n_R0_b9,"this":_this}),"_f8")])
	for _iter_2 in _S.array(_n_wedges):
		var _n_w_b10 = _iter_2
		var _n_u_b11 = (_n_t - _S.named_value(_n_w_b10,"t0"))
		if _S.truth(((_n_u_b11 < 0) if _S.truth((_n_u_b11 < 0)) else (_n_u_b11 > (_S.named_value(_n_w_b10,"out") + _S.named_value(_n_w_b10,"back"))))):
			continue
		var _n_s_b12 = (_S.invoke(_n_ease,"outCubic",[(float(_n_u_b11)/_S.named_value(_n_w_b10,"out"))]) if _S.truth((_n_u_b11 < _S.named_value(_n_w_b10,"out"))) else (1 - _S.invoke(_n_ease,"inQuad",[(float((_n_u_b11 - _S.named_value(_n_w_b10,"out")))/_S.named_value(_n_w_b10,"back"))])))
		var _n_L_b13 = (_S.named_value(_n_w_b10,"len") * _n_s_b12)
		if _S.truth((_n_L_b13 < 1.5)):
			continue
		var _n_ca_b14 = cos(_S.named_value(_n_w_b10,"a"))
		var _n_sa_b15 = sin(_S.named_value(_n_w_b10,"a"))
		var _n_r0_b16 = (_S.named_value(_n_w_b10,"r0") + (2 * _n_s_b12))
		var _n_hw_b17 = (float((_S.named_value(_n_w_b10,"w") * (0.6 + (0.4 * _n_s_b12))))/2)
		var _n_tip_b18 = [(_n_X + (_n_ca_b14 * _n_r0_b16)), (_n_Y + (_n_sa_b15 * _n_r0_b16))]
		var _n_end_b19 = [(_n_X + (_n_ca_b14 * (_n_r0_b16 + _n_L_b13))), (_n_Y + (_n_sa_b15 * (_n_r0_b16 + _n_L_b13)))]
		var _n_n_b20 = [((-_n_sa_b15) * _n_hw_b17), (_n_ca_b14 * _n_hw_b17)]
		var _n_wedge_b21 = _S.function_value(_S.capture(_parent,{"tip":_n_tip_b18,"ca":_n_ca_b14,"sa":_n_sa_b15,"end":_n_end_b19,"n":_n_n_b20,"this":_this}),"_f9")
		_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_wedge_b21,[1]), _S.index_value(_n_C,1)])
		_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_wedge_b21,[0]), (_n_WHITE if _S.truth((_n_u_b11 < (_S.named_value(_n_w_b10,"out") + 0.02))) else _S.index_value(_n_C,5))])
	var _n_pop_b1 = exp((float((-_n_t))/0.06))
	if _S.truth((_n_pop_b1 > 0.02)):
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 28, _n_WARM, (0.5 * _n_pop_b1)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return ((0.58 * _n_a) * (1 - ((_n_d_b0 * _n_d_b0) * 0.75)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return ((0.48 * _n_a) * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_f = _S.read(_parent,"f")
	var _n_lump = _S.read(_parent,"lump")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_PH = _S.read(_parent,"PH")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_x_b0 - _n_X)
	var _n_dy_b3 = ((_n_y_b1 - _n_Y) * (1.25 if _S.truth(_n_f) else 1.1))
	var _n_d_b4 = _S.Bridge.hypot([_n_dx_b2, _n_dy_b3])
	var _n_ro_b5 = _S.call_value(_n_lump,[_n_R0, atan2(_n_dy_b3,_n_dx_b2), (_n_PH + (_n_f * 0.6))])
	if _S.truth((_n_d_b4 > _n_ro_b5)):
		return null
	var _n_q_b6 = (float(_n_d_b4)/_n_ro_b5)
	return ((_n_WHITE if _S.truth((_n_q_b6 < 0.55)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b6 < 0.86)) else _S.index_value(_n_C,4))) if _S.truth(_S.binary("===",_n_f,0)) else (_n_WHITE if _S.truth((_n_q_b6 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b6 < 0.72)) else (_S.index_value(_n_C,4) if _S.truth((_n_q_b6 < 0.9)) else _S.index_value(_n_C,3)))))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_tip = _S.read(_parent,"tip")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_end = _S.read(_parent,"end")
	var _n_n = _S.read(_parent,"n")
	var _n_g_b0 = _S.arg(_args,0)
	return [[(_S.index_value(_n_tip,0) - (_n_ca * _n_g_b0)), (_S.index_value(_n_tip,1) - (_n_sa * _n_g_b0))], [((_S.index_value(_n_end,0) + (_S.index_value(_n_n,0) * (1 + (_n_g_b0 * 0.45)))) + (_n_ca * _n_g_b0)), ((_S.index_value(_n_end,1) + (_S.index_value(_n_n,1) * (1 + (_n_g_b0 * 0.45)))) + (_n_sa * _n_g_b0))], [((_S.index_value(_n_end,0) - (_S.index_value(_n_n,0) * (1 + (_n_g_b0 * 0.45)))) + (_n_ca * _n_g_b0)), ((_S.index_value(_n_end,1) - (_S.index_value(_n_n,1) * (1 + (_n_g_b0 * 0.45)))) + (_n_sa * _n_g_b0))]]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	return (_n_r_b0 * ((1 + (0.15 * sin(((5 * _n_a_b1) + _n_ph_b2)))) + (0.08 * sin(((9 * _n_a_b1) + (_n_ph_b2 * 2.3))))))
	return null
