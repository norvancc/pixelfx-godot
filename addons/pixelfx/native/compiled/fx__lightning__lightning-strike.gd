@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/lightning-strike.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "SOOT", _S.import_value("fx/lightning/_lib.js", "SOOT"))
	_S.define(_e, "SOOT2", _S.import_value("fx/lightning/_lib.js", "SOOT2"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "bend", _S.import_value("fx/lightning/_lib.js", "bend"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "trace", _S.import_value("fx/lightning/_lib.js", "trace"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "heat", _S.import_value("fx/lightning/_lib.js", "heat"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f2"))
	_S.define(_e, "keep", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Lightning strike"}, {"desc": "A targeted strike: a sigil charges on the floor, the scene darkens, a thick bolt slams into it, arcs race out along the cracks it splits, the channel crumbles to a scorch."}, {"tags": ["lightning", "electric", "strike", "spell", "target", "impact", "ground", "one-shot"]}, {"size": [240, 264]}, {"origin": [120, 228]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "W", 120)
	_S.define(_e, "TOP", _S.unary("-", 224))
	_S.define(_e, "RX", 28)
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "REACH", 52)
	_S.define(_e, "LEAD0", 0.48)
	_S.define(_e, "STEPS", 9)
	_S.define(_e, "MEET", _S.unary("-", 30))
	_S.define(_e, "STROKES", [_S.merge([{"t": 0.76}, {"k": 1}]), _S.merge([{"t": 1.04}, {"k": 0.8}]), _S.merge([{"t": 1.26}, {"k": 0.55}])])
	_S.define(_e, "FLICK", [1, 0.72, 0.3, 0.95, 0.5, 0.8, 0.22])
	_S.define(_e, "level", _S.function_value(_e, "_f22"))
	_S.define(_e, "NIGHT", _S.call_value(_S.read(_e, "hex"), ["#04030a"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#6e6382"]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "STONE", _S.invoke(["#655b7a", "#4a4263", "#342d45"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "S1", _S.prop(_S.prop(_S.read(_e, "STROKES"), 0), "t"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	_S.define(_e, "grow", _S.function_value(_e, "_f1"))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 6)):
		_S.call_value(_S.read(_v2, "grow"), [_S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 1), 1]), _S.invoke(_S.read(_v2, "R"), "range", [0, 1]), (_S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.5), 0.7]) if _S.truth(_S.binary("%", _S.read(_v2, "i"), 2)) else _S.binary("+", _S.prop(_S.read(_v2, "Math"), "PI"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.7), 0.5]))), _S.binary("*", _S.read(_v2, "REACH"), _S.invoke(_S.read(_v2, "R"), "range", [0.55, 1])), 1, 0, 0])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_grow = _S.read(_parent,"grow")
	var _n_out = _S.read(_parent,"out")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_d_b5 = _S.arg(_args,5)
	var _n_depth_b6 = _S.arg(_args,6)
	var _n_pts_b7 = [[_n_x_b0, _n_y_b1, _n_d_b5]]
	if true:
		var _n_s_b8 = 0
		while _S.truth((_n_s_b8 < _n_len_b3)):
			_n_a_b2 += _S.invoke(_n_R,"range",[(-0.32), 0.32])
			_n_x_b0 += (cos(_n_a_b2) * 1.5)
			_n_y_b1 = clampf((_n_y_b1 + (sin(_n_a_b2) * 0.45)),0,5)
			_n_d_b5 += 1.5
			_S.invoke(_n_pts_b7,"push",[[_n_x_b0, _n_y_b1, _n_d_b5]])
			if _S.truth((_S.invoke(_n_R,"chance",[0.09]) if _S.truth(((_n_s_b8 > 3) if _S.truth((_n_depth_b6 < 2)) else (_n_depth_b6 < 2))) else ((_n_s_b8 > 3) if _S.truth((_n_depth_b6 < 2)) else (_n_depth_b6 < 2)))):
				_S.call_value(_n_grow,[_n_x_b0, _n_y_b1, (_n_a_b2 + (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[0.5, 1.2]))), ((_n_len_b3 - _n_s_b8) * _S.invoke(_n_R,"range",[0.3, 0.6])), (_n_w_b4 * 0.6), _n_d_b5, (_n_depth_b6 + 1)])
			_n_s_b8 += 1.5
	_S.invoke(_n_out,"push",[{"pts":_n_pts_b7,"w":_n_w_b4}])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_S1 = _S.read(_parent,"S1")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_reveal_b5 = clampf((float(_n_t_b1)/0.22),0.0,1.0)
	var _n_spin_b6 = (_n_t_b1 * 0.8)
	var _n_burnt_b7 = ((_n_t_b1 - _n_S1) if _S.truth((_n_t_b1 > _n_S1)) else (-1))
	if _S.truth((_n_burnt_b7 > 0.45)):
		return null
	var _n_a0_b8 = (1 if _S.truth((_n_burnt_b7 < 0)) else (1 if _S.truth((_n_burnt_b7 < 0.07)) else (1 - (float((_n_burnt_b7 - 0.07))/0.38))))
	var _n_hot_b9 = ((_n_burnt_b7 < 0.07) if _S.truth((_n_burnt_b7 >= 0)) else (_n_burnt_b7 >= 0))
	var _n_on_b10 = _S.function_value(_S.capture(_parent,{"near":_n_near_b4,"this":_this}),"_f3")
	var _n_from_b11 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < 22)):
			var _n_a_b13 = (((float(_n_i_b12)/22) * _n_TAU) + _n_spin_b6)
			if _S.truth(_S.logical("||",not _S.truth(_S.call_value(_n_on_b10,[_n_a_b13])),func():return (_S.call_value(_n_from_b11,[_n_a_b13]) > _n_reveal_b5))):
				_n_i_b12 += 1.0
				continue
			for _iter_0 in _S.array([0, 0.06, 0.12]):
				var _n_da_b14 = _iter_0
				var _n_x_b15 = (cos((_n_a_b13 + _n_da_b14)) * _n_RX)
				var _n_y_b16 = ((sin((_n_a_b13 + _n_da_b14)) * _n_RX) * _n_SY)
				_S.invoke(_n_p_b0,"dot",[_n_x_b15, _n_y_b16, (_n_WHITE if _S.truth(_n_hot_b9) else ((_S.index_value(_n_C_b2,6) if _S.truth((_n_k_b3 > 0.7)) else _S.index_value(_n_C_b2,5)) if _S.truth(_n_near_b4) else (_S.index_value(_n_C_b2,4) if _S.truth((_n_k_b3 > 0.7)) else _S.index_value(_n_C_b2,3)))), _n_a0_b8])
				if _S.truth(_n_near_b4):
					_S.invoke(_n_p_b0,"dot",[_n_x_b15, (_n_y_b16 + 1), (_S.index_value(_n_C_b2,6) if _S.truth(_n_hot_b9) else _S.index_value(_n_C_b2,2)), _n_a0_b8])
			if _S.truth(_S.binary("===",fmod(_n_i_b12,3),0)):
				_S.invoke(_n_p_b0,"glow",[(cos(_n_a_b13) * _n_RX), ((sin(_n_a_b13) * _n_RX) * _n_SY), 5, _S.index_value(_n_C_b2,4), ((0.3 * _n_k_b3) * _n_a0_b8)])
			_n_i_b12 += 1.0
	if true:
		var _n_j_b17 = 0
		while _S.truth((_n_j_b17 < 4)):
			var _n_a_b18 = (((_n_spin_b6 * (-0.5)) + (float((_n_j_b17 * _n_TAU))/4)) + (float(PI)/4))
			if _S.truth(_S.logical("||",not _S.truth(_S.call_value(_n_on_b10,[_n_a_b18])),func():return (_n_reveal_b5 < 1))):
				_n_j_b17 += 1.0
				continue
			_S.invoke(_n_p_b0,"line",[(cos(_n_a_b18) * (_n_RX - 5)), ((sin(_n_a_b18) * (_n_RX - 5)) * _n_SY), (cos(_n_a_b18) * (_n_RX + 5)), ((sin(_n_a_b18) * (_n_RX + 5)) * _n_SY), (_n_WHITE if _S.truth(_n_hot_b9) else (_S.index_value(_n_C_b2,6) if _S.truth(_n_near_b4) else _S.index_value(_n_C_b2,4))), _n_a0_b8])
			_n_j_b17 += 1.0
	if _S.truth((_n_t_b1 > 0.3)):
		if true:
			var _n_a_b19 = 0
			while _S.truth((_n_a_b19 < _n_TAU)):
				if _S.truth(not _S.truth(_S.call_value(_n_on_b10,[_n_a_b19]))):
					_n_a_b19 += 0.09
					continue
				_S.invoke(_n_p_b0,"dot",[(cos(_n_a_b19) * 14), ((sin(_n_a_b19) * 14) * _n_SY), (_n_WHITE if _S.truth(_n_hot_b9) else (_S.index_value(_n_C_b2,4) if _S.truth(_n_near_b4) else _S.index_value(_n_C_b2,2))), (_n_a0_b8 * clampf((float((_n_t_b1 - 0.3))/0.12),0.0,1.0))])
				_n_a_b19 += 0.09
	if _S.truth(((_n_burnt_b7 < 0) if _S.truth(_n_near_b4) else _n_near_b4)):
		var _n_pulse_b20 = (0.6 + (0.4 * sin((_n_t_b1 * (10 + (30 * _n_k_b3))))))
		_S.invoke(_n_p_b0,"px",[0, 0, (_n_WHITE if _S.truth((_n_k_b3 > 0.5)) else _S.index_value(_n_C_b2,6))])
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b21 = _S.prop(_tuple_2,0)
			var _n_dy_b22 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[_n_dx_b21, _n_dy_b22, _S.index_value(_n_C_b2,5)])
		_S.invoke(_n_p_b0,"glow",[0, (-1), (10 + (10 * _n_k_b3)), _S.index_value(_n_C_b2,5), (0.3 + ((0.4 * _n_k_b3) * _n_pulse_b20))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_a_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_a_b0) >= 0),_n_near)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	return (float(absf((fmod(((fmod((_n_a_b0 - (float(PI)/2)),_n_TAU) + _n_TAU) + PI),_n_TAU) - PI)))/PI)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_paths_b1 = []
	for _iter_0 in _S.array(_S.named_value(_n_b_b0,"paths")):
		var _n_q_b2 = _iter_0
		var _n_pts_b3 = []
		for _iter_1 in _S.array(_S.named_value(_n_q_b2,"pts")):
			var _n_pt_b4 = _iter_1
			if _S.truth(_S.logical("||",_S.logical("||",(absf(_S.index_value(_n_pt_b4,0)) > (_n_W - 5)),func():return (_S.index_value(_n_pt_b4,1) > (-3))),func():return (_S.index_value(_n_pt_b4,1) < (_n_TOP + 6)))):
				break
			_S.invoke(_n_pts_b3,"push",[_n_pt_b4])
		if _S.truth(((_S.named_value(_n_q_b2,"w") >= 1) if _S.truth((_S.named_value(_n_q_b2,"w") >= 1)) else (_S.prop(_n_pts_b3,"length") > 3))):
			_S.invoke(_n_paths_b1,"push",[{"w":_S.named_value(_n_q_b2,"w"),"pts":(_S.named_value(_n_q_b2,"pts") if _S.truth((_S.named_value(_n_q_b2,"w") >= 1)) else _n_pts_b3)}])
	return {"paths":_n_paths_b1}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "X0", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [8, 18]), (1 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.unary("-", 1))))
	_S.define(_e, "main", _S.call_value(_S.read(_e, "keep"), [_S.call_value(_S.read(_e, "zigzag"), [_S.read(_e, "R"), _S.read(_e, "X0"), _S.read(_e, "TOP"), 0, _S.unary("-", 1), 0.17, 0.5])]))
	_S.define(_e, "trunk", _S.prop(_S.prop(_S.prop(_S.read(_e, "main"), "paths"), 0), "pts"))
	_S.define(_e, "drift", _S.function_value(_e, "_f8"))
	_S.define(_e, "bolts", [_S.read(_e, "main"), _S.call_value(_S.read(_e, "bend"), [_S.merge([{"paths": [_S.merge([{"pts": _S.read(_e, "trunk")}, {"w": 1}])]}]), _S.call_value(_S.read(_e, "drift"), [1.5])]), _S.call_value(_S.read(_e, "bend"), [_S.merge([{"paths": [_S.merge([{"pts": _S.read(_e, "trunk")}, {"w": 1}])]}]), _S.call_value(_S.read(_e, "drift"), [3])])])
	_S.define(_e, "chan", _S.function_value(_e, "_f10"))
	_S.define(_e, "last", _S.prop(_S.read(_e, "STROKES"), _S.binary("-", _S.prop(_S.read(_e, "STROKES"), "length"), 1)))
	_S.define(_e, "end", _S.call_value(_S.read(_e, "chan"), [_S.binary("-", _S.prop(_S.read(_e, "STROKES"), "length"), 1)]))
	_S.define(_e, "tree", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R")]))
	_S.define(_e, "gone", _S.invoke(_S.read(_e, "end"), "map", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", _S.unary("-", 1))
	_S.define(_e, "now", _S.function_value(_e, "_f12"))
	_S.define(_e, "charge", _S.function_value(_e, "_f13"))
	_S.define(_e, "heatAt", _S.function_value(_e, "_f14"))
	return _S.merge([{"update": _S.function_value(_e, "_f16")}, {"drawBack": _S.function_value(_e, "_f17")}, {"draw": _S.function_value(_e, "_f18")}])

static func _f7(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_dx_b0 = _S.arg(_args,0)
	return _S.function_value(_S.capture(_parent,{"dx":_n_dx_b0,"this":_n_this}),"_f9")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_dx = _S.read(_parent,"dx")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return [(_n_x_b0 + (_n_dx * sin((float((PI * _n_y_b1))/_n_TOP)))), _n_y_b1]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.named_value(_S.index_value(_S.named_value(_S.index_value(_n_bolts,_n_i_b0),"paths"),0),"pts")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_last = _S.read(_parent,"last")
	var _n_o = _S.read(_parent,"o")
	var _n_TOP = _S.read(_parent,"TOP")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	var _n_i_b1 = _S.arg(_args,1)
	return ((_S.named_value(_n_last,"t") + 0.25) + (0.75 * ((0.55 * _S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_i_b1,5])) + (0.45 * (1 - (float(_n_y_b0)/_n_TOP))))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_STROKES = _S.read(_parent,"STROKES")
	var _n_t = _S.read(_parent,"t")
	var _n_level = _S.read(_parent,"level")
	if true:
		var _n_i_b0 = (_S.prop(_n_STROKES,"length") - 1)
		while _S.truth((_n_i_b0 >= 0)):
			if _S.truth((_n_t >= _S.named_value(_S.index_value(_n_STROKES,_n_i_b0),"t"))):
				return {"i":_n_i_b0,"s":_S.index_value(_n_STROKES,_n_i_b0),"a":(_n_t - _S.named_value(_S.index_value(_n_STROKES,_n_i_b0),"t")),"k":(_S.call_value(_n_level,[(_n_t - _S.named_value(_S.index_value(_n_STROKES,_n_i_b0),"t"))]) * _S.named_value(_S.index_value(_n_STROKES,_n_i_b0),"k"))}
			_n_i_b0 -= 1.0
	return null
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_S1 = _S.read(_parent,"S1")
	return pow(clampf((float(_n_t)/_n_S1),0.0,1.0),1.5)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "struck"), 0)) else _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.invoke(_S.read(_e, "STROKES"), "slice", [0, _S.binary("+", _S.read(_e, "struck"), 1)]), "map", [_S.function_value(_e, "_f15")]))])))

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_s_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_s_b0,"k") * pow(clampf((1 - (float((_n_t - _S.named_value(_n_s_b0,"t")))/1.6)),0.0,1.0),1.4))
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v24 in _S.array(_S.invoke(_S.read(_e, "STROKES"), "entries", [])):
		var _v25 = _S.scope(_e)
		var _v26 = _v24
		_S.define(_v25, "i", _S.prop(_v26, 0))
		_S.define(_v25, "s", _S.prop(_v26, 1))
		var _v27 = _S.scope(_v25)
		if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v27, "struck"), _S.read(_v27, "i")), func(): return _S.binary("<", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "t")))):
			continue
		_S.write(_v27, "struck", _S.read(_v27, "i"), "=", false)
		_S.define(_v27, "k", _S.prop(_S.read(_v27, "s"), "k"))
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.unary("-", 50), 120, _S.prop(_S.read(_v27, "C"), 4), _S.binary("*", 0.55, _S.read(_v27, "k")), 0.4])
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.unary("-", 3), 24, _S.read(_v27, "WHITE"), _S.binary("*", 0.5, _S.read(_v27, "k")), 0.1])
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "j"), _S.invoke(_S.read(_v28, "Math"), "round", [_S.binary("*", 44, _S.read(_v28, "k"))]))):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v29, "Math"), "PI")), 2), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v29, "sp", _S.binary("*", _S.invoke(_S.read(_v29, "R"), "range", [110, 320]), _S.binary("+", 0.65, _S.binary("*", 0.35, _S.read(_v29, "k")))))
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "SPARK"), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1.5), 1.5]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.read(_v29, "sp")), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.read(_v29, "sp")), _S.invoke(_S.read(_v29, "R"), "range", [0.2, 0.55])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "j", 1, "+=", true)
		var _v30 = _S.scope(_v27)
		_S.define(_v30, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "j"), _S.invoke(_S.read(_v30, "Math"), "round", [_S.binary("*", 12, _S.read(_v30, "k"))]))):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v31, "Math"), "PI")), 2), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v31, "sp", _S.invoke(_S.read(_v31, "R"), "range", [70, 220]))
			_S.invoke(_S.read(_v31, "hot"), "spawn", [_S.prop(_S.read(_v31, "P"), "SPARK"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "sp")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "sp")), _S.invoke(_S.read(_v31, "R"), "range", [0.5, 1])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "j", 1, "+=", true)
		var _v32 = _S.scope(_v27)
		_S.define(_v32, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "j"), _S.invoke(_S.read(_v32, "Math"), "round", [_S.binary("*", 5, _S.read(_v32, "k"))]))):
			_S.invoke(_S.read(_v32, "hot"), "spawn", [_S.prop(_S.read(_v32, "P"), "EMBER"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 2), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [30, 80])), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.5])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "j", 1, "+=", true)
		var _v33 = _S.scope(_v27)
		_S.define(_v33, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "j"), _S.invoke(_S.read(_v33, "Math"), "round", [_S.binary("*", 18, _S.read(_v33, "k"))]))):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v34, "Math"), "PI")), 2), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v34, "sp", _S.invoke(_S.read(_v34, "R"), "range", [50, 190]))
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "GRIT"), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.invoke(_S.read(_v34, "R"), "range", [1, 1.5]), _S.invoke(_S.read(_v34, "R"), "pick", [_S.read(_v34, "STONE")]), (2 if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.35])) else 1)])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "j", 1, "+=", true)
		var _v35 = _S.scope(_v27)
		_S.define(_v35, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "j"), 8)):
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "DUST"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v35, "R"), "sign", []), _S.invoke(_S.read(_v35, "R"), "range", [30, 110])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 24])), _S.invoke(_S.read(_v35, "R"), "range", [0.4, 0.8]), _S.read(_v35, "DUST"), _S.invoke(_S.read(_v35, "R"), "range", [1.5, 3])])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "j", 1, "+=", true)
		var _v36 = _S.scope(_v27)
		_S.define(_v36, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "j"), _S.invoke(_S.read(_v36, "Math"), "round", [_S.binary("*", 4, _S.read(_v36, "k"))]))):
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SMOKE"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 4), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [10, 25])), _S.invoke(_S.read(_v36, "R"), "range", [1.1, 1.6]), _S.call_value(_S.read(_v36, "mix"), [_S.read(_v36, "ASH"), _S.prop(_S.read(_v36, "C"), 2), 0.3]), _S.invoke(_S.read(_v36, "R"), "range", [3, 6]), _S.invoke(_S.read(_v36, "R"), "range", [0.05, 0.25])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "struck"), 0), func(): return _S.binary("<", _S.read(_e, "t"), 1.7)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 6, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [9, 17])), _S.invoke(_S.read(_e, "R"), "range", [1, 1.3]), 0, _S.invoke(_S.read(_e, "R"), "range", [2, 3.5])])
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v37, "i"), _S.binary("-", _S.prop(_S.read(_v37, "gone"), "length"), 1))):
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v37, "gone"), _S.read(_v37, "i")), _S.read(_v37, "t")), func(): return _S.binary(">", _S.prop(_S.read(_v37, "gone"), _S.read(_v37, "i")), _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "dt")))), func(): return _S.binary("<", _S.call_value(_S.read(_v37, "rand"), [_S.prop(_S.read(_v37, "o"), "seed"), _S.read(_v37, "i"), 6]), 0.5))):
			var _v38 = _S.scope(_v37)
			var _v39 = _S.prop(_S.read(_v38, "end"), _S.read(_v38, "i"))
			_S.define(_v38, "x", _S.prop(_v39, 0))
			_S.define(_v38, "y", _S.prop(_v39, 1))
			_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "MOTE"), _S.read(_v38, "x"), _S.read(_v38, "y"), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_v38, "R"), "range", [6, 22]), _S.invoke(_S.read(_v38, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v38, "C"), 5) if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.5])) else _S.prop(_S.read(_v38, "C"), 4)), _S.invoke(_S.read(_v38, "R"), "range", [0.5, 0.9])])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_S1 = _S.read(_parent,"S1")
	var _n_W = _S.read(_parent,"W")
	var _n_NIGHT = _S.read(_parent,"NIGHT")
	var _n_sigil = _S.read(_parent,"sigil")
	var _n_C = _S.read(_parent,"C")
	var _n_charge = _S.read(_parent,"charge")
	var _n_struck = _S.read(_parent,"struck")
	var _n_now = _S.read(_parent,"now")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_heatAt = _S.read(_parent,"heatAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_heat = _S.read(_parent,"heat")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_tree = _S.read(_parent,"tree")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_dark_b1 = ((0.5 * _S.MathFX.smooth(0.46,0.66,_n_t)) * (1 - _S.MathFX.smooth((_n_S1 - 0.01),(_n_S1 + 0.02),_n_t)))
	if _S.truth((_n_dark_b1 > 0.01)):
		if true:
			var _n_y_b2 = (-228)
			while _S.truth((_n_y_b2 < 36)):
				if true:
					var _n_x_b3 = (-_n_W)
					while _S.truth((_n_x_b3 < _n_W)):
						var _n_d_b4 = _S.Bridge.hypot([(float(_n_x_b3)/_n_W), (float((_n_y_b2 + 96))/132)])
						var _n_a_b5 = (_n_dark_b1 * (1 - _S.MathFX.smooth(0.55,1,_n_d_b4)))
						if _S.truth((_n_a_b5 > 0.01)):
							_S.invoke(_n_p_b0,"blend",[(_n_x_b3 + 0.5), (_n_y_b2 + 0.5), _n_NIGHT, _n_a_b5])
						_n_x_b3 += 1.0
				_n_y_b2 += 1.0
	_S.call_value(_n_sigil,[_n_p_b0, _n_t, _n_C, _S.call_value(_n_charge,[]), false])
	if _S.truth((_n_struck >= 0)):
		var _n_s_b6 = _S.call_value(_n_now,[])
		var _n_front_b7 = (_n_REACH * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_S1))/0.35),0.0,1.0)]))
		var _n_T0_b8 = _S.call_value(_n_heatAt,[])
		var _n_fade_b9 = (1 - _S.MathFX.smooth(2.3,2.95,_n_t))
		var _n_elec_b10 = ((_S.named_value(_S.named_value(_n_s_b6,"s"),"k") * (1 - (float(_S.named_value(_n_s_b6,"a"))/0.14))) if _S.truth((_S.named_value(_n_s_b6,"a") < 0.14)) else 0)
		for _iter_0 in _S.array(_n_tree):
			var _n_br_b11 = _iter_0
			for _iter_1 in _S.array(_S.named_value(_n_br_b11,"pts")):
				var _tuple_2 = _iter_1
				var _n_x_b12 = _S.prop(_tuple_2,0)
				var _n_y_b13 = _S.prop(_tuple_2,1)
				var _n_d_b14 = _S.prop(_tuple_2,2)
				if _S.truth((_n_d_b14 > _n_front_b7)):
					break
				var _n_q_b15 = (float(_n_d_b14)/_n_REACH)
				var _n_n_b16 = _S.MathFX.rand([floori((_n_x_b12 * 2)+0.5),floori((_n_y_b13 * 2)+0.5),9])
				var _n_fresh_b17 = ((_n_front_b7 < _n_REACH) if _S.truth((_n_d_b14 > (_n_front_b7 - 6))) else (_n_d_b14 > (_n_front_b7 - 6)))
				var _n_T_b18 = (((_n_T0_b8 * (1.15 - _n_q_b15)) * (0.8 if _S.truth((_S.named_value(_n_br_b11,"w") < 1)) else 1)) - (_n_n_b16 * 0.25))
				var _n_c_b19 = ((_n_WHITE if _S.truth((_n_q_b15 < 0.5)) else _S.index_value(_n_C,6)) if _S.truth((_n_fresh_b17 if _S.truth(_n_fresh_b17) else ((_n_n_b16 < 0.85) if _S.truth((_n_elec_b10 > 0.3)) else (_n_elec_b10 > 0.3)))) else _S.logical("||",_S.call_value(_n_heat,[_n_T_b18]),func():return _n_SOOT2))
				_S.invoke(_n_p_b0,"dot",[_n_x_b12, (_n_y_b13 + 1), _n_SOOT, _n_fade_b9])
				_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, _n_c_b19, _n_fade_b9])
				if _S.truth(((_n_d_b14 < 9) if _S.truth((_S.named_value(_n_br_b11,"w") >= 1)) else (_S.named_value(_n_br_b11,"w") >= 1))):
					_S.invoke(_n_p_b0,"dot",[_n_x_b12, (_n_y_b13 + 2), _n_SOOT, _n_fade_b9])
				if _S.truth((_S.binary("===",_S.binary("&",floori(_n_d_b14+0.5),3),0) if _S.truth((_n_fresh_b17 if _S.truth(_n_fresh_b17) else (_n_elec_b10 > 0.3))) else (_n_fresh_b17 if _S.truth(_n_fresh_b17) else (_n_elec_b10 > 0.3)))):
					_S.invoke(_n_p_b0,"glow",[_n_x_b12, _n_y_b13, 7, _S.index_value(_n_C,5), 0.4])
				else:
					if _S.truth((_S.binary("===",_S.binary("&",floori(_n_d_b14+0.5),3),0) if _S.truth((_n_T_b18 > 0.2)) else (_n_T_b18 > 0.2))):
						_S.invoke(_n_p_b0,"glow",[_n_x_b12, _n_y_b13, 5, _n_c_b19, (0.2 * _n_T_b18)])
		_S.call_value(_n_scorch,[_n_p_b0, 0, 0, 12, _n_T0_b8, _n_fade_b9])
		if _S.truth((_n_T0_b8 > 0)):
			_S.invoke(_n_p_b0,"glow",[0, (-2), 34, _S.call_value(_n_heat,[0.55]), (0.3 * _n_T0_b8)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "back"])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_now = _S.read(_parent,"now")
	var _n_t = _S.read(_parent,"t")
	var _n_charge = _S.read(_parent,"charge")
	var _n_sigil = _S.read(_parent,"sigil")
	var _n_C = _S.read(_parent,"C")
	var _n_S1 = _S.read(_parent,"S1")
	var _n_o = _S.read(_parent,"o")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_LEAD0 = _S.read(_parent,"LEAD0")
	var _n_STEPS = _S.read(_parent,"STEPS")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_MEET = _S.read(_parent,"MEET")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_main = _S.read(_parent,"main")
	var _n_ease = _S.read(_parent,"ease")
	var _n_STROKES = _S.read(_parent,"STROKES")
	var _n_chan = _S.read(_parent,"chan")
	var _n_trace = _S.read(_parent,"trace")
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_X0 = _S.read(_parent,"X0")
	var _n_gone = _S.read(_parent,"gone")
	var _n_last = _S.read(_parent,"last")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_tree = _S.read(_parent,"tree")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.call_value(_n_now,[])
	var _n_f_b2 = floori(((_n_t * 30) + 0.0001))
	var _n_k_b3 = _S.call_value(_n_charge,[])
	_S.call_value(_n_sigil,[_n_p_b0, _n_t, _n_C, _n_k_b3, true])
	if _S.truth(((_n_t < _n_S1) if _S.truth((_n_t > 0.15)) else (_n_t > 0.15))):
		var _n_r_b5 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),61,_n_f_b2])
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < floori((1 + (4 * _n_k_b3))+0.5))):
				var _n_a_b7 = _S.invoke(_n_r_b5,"range",[0, _n_TAU])
				var _n_x_b8 = (cos(_n_a_b7) * _n_RX)
				var _n_y_b9 = ((sin(_n_a_b7) * _n_RX) * _n_SY)
				_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b5, _n_x_b8, _n_y_b9, (_n_x_b8 + _S.invoke(_n_r_b5,"range",[(-2.5), 2.5])), (_n_y_b9 - (_S.invoke(_n_r_b5,"range",[4, 9]) * (0.6 + _n_k_b3))), 0.45, 0.3]), (0.45 + (0.4 * _n_k_b3)), _n_C, 0.3])
				_n_i_b6 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, (-2), 36, _S.index_value(_n_C,4), (0.12 + (0.3 * _n_k_b3))])
	if _S.truth(((_n_t < _n_S1) if _S.truth((_n_t >= _n_LEAD0)) else (_n_t >= _n_LEAD0))):
		var _n_u_b10 = clampf((float((_n_t - _n_LEAD0))/(_n_S1 - _n_LEAD0)),0.0,1.0)
		var _n_st_b11 = minf(_n_STEPS,(floori((_n_u_b10 * _n_STEPS)) + 1))
		var _n_fresh_b12 = (1 - fmod((_n_u_b10 * _n_STEPS),1))
		var _n_reach_b13 = (_n_TOP + ((_n_MEET - _n_TOP) * pow((float(_n_st_b11)/_n_STEPS),1.2)))
		var _n_prev_b14 = (_n_TOP + ((_n_MEET - _n_TOP) * pow((float((_n_st_b11 - 1))/_n_STEPS),1.2)))
		for _iter_0 in _S.array(_S.named_value(_n_main,"paths")):
			var _n_q_b15 = _iter_0
			var _n_tk_b16 = (_S.named_value(_n_q_b15,"w") >= 1)
			if true:
				var _n_i_b17 = 0
				while _S.truth((_n_i_b17 < (_S.prop(_S.named_value(_n_q_b15,"pts"),"length") - 1))):
					var _tuple_1 = _S.index_value(_S.named_value(_n_q_b15,"pts"),_n_i_b17)
					var _n_ax_b18 = _S.prop(_tuple_1,0)
					var _n_ay_b19 = _S.prop(_tuple_1,1)
					var _tuple_2 = _S.index_value(_S.named_value(_n_q_b15,"pts"),(_n_i_b17 + 1))
					var _n_bx_b20 = _S.prop(_tuple_2,0)
					var _n_by_b21 = _S.prop(_tuple_2,1)
					if _S.truth((_n_by_b21 > _n_reach_b13)):
						if _S.truth(((_n_i_b17 > 0) if _S.truth((_n_ay_b19 <= _n_reach_b13)) else (_n_ay_b19 <= _n_reach_b13))):
							_S.invoke(_n_p_b0,"px",[_n_ax_b18, _n_ay_b19, _n_WHITE])
							_S.invoke(_n_p_b0,"glow",[_n_ax_b18, _n_ay_b19, 7, _S.index_value(_n_C,5), ((0.5 * _n_fresh_b12) + 0.15)])
						break
					var _n_young_b22 = (_n_by_b21 > _n_prev_b14)
					_S.invoke(_n_p_b0,"line",[_n_ax_b18, _n_ay_b19, _n_bx_b20, _n_by_b21, (((_S.index_value(_n_C,6) if _S.truth(_n_tk_b16) else _S.index_value(_n_C,5)) if _S.truth((_n_fresh_b12 > 0.4)) else _S.index_value(_n_C,4)) if _S.truth(_n_young_b22) else (_S.index_value(_n_C,3) if _S.truth(_n_tk_b16) else _S.index_value(_n_C,2)))])
					if _S.truth(((_n_ay_b19 > (_n_TOP + 14)) if _S.truth(_S.binary("===",fmod(_n_i_b17,4),0)) else _S.binary("===",fmod(_n_i_b17,4),0))):
						_S.invoke(_n_p_b0,"glow",[_n_ax_b18, _n_ay_b19, (8 if _S.truth(_n_young_b22) else 5), _S.index_value(_n_C,4), (((0.3 * _n_fresh_b12) + 0.1) if _S.truth(_n_young_b22) else 0.12)])
					_n_i_b17 += 1.0
		if _S.truth((_n_t > 0.62)):
			var _n_h_b23 = ((-_n_MEET) * _S.invoke(_n_ease,"outQuad",[(float((_n_t - 0.62))/(_n_S1 - 0.62))]))
			var _n_r_b24 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),77,_n_f_b2])
			var _n_b_b25 = _S.call_value(_n_zigzag,[_n_r_b24, 0, (-1), _S.invoke(_n_r_b24,"range",[(-2), 2]), (-maxf(3,_n_h_b23)), 0.3, 0.3])
			var _n_tip_b26 = _S.invoke(_S.named_value(_S.index_value(_S.named_value(_n_b_b25,"paths"),0),"pts"),"at",[(-1)])
			_S.call_value(_n_crackle,[_n_p_b0, _n_b_b25, 0.85, _n_C, 0.45])
			_S.invoke(_n_p_b0,"px",[_S.index_value(_n_tip_b26,0), _S.index_value(_n_tip_b26,1), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_tip_b26,0), _S.index_value(_n_tip_b26,1), 9, _S.index_value(_n_C,5), 0.5])
	var _n_next_b4 = _S.invoke(_n_STROKES,"find",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f19")])
	if _S.truth(((_n_t > (_S.named_value(_n_next_b4,"t") - 0.06)) if _S.truth((_S.binary("!==",_n_next_b4,_S.index_value(_n_STROKES,0)) if _S.truth(_n_next_b4) else _n_next_b4)) else (_S.binary("!==",_n_next_b4,_S.index_value(_n_STROKES,0)) if _S.truth(_n_next_b4) else _n_next_b4))):
		var _n_tr_b27 = _S.call_value(_n_chan,[_S.invoke(_n_STROKES,"indexOf",[_n_next_b4])])
		var _n_u_b28 = (float((_n_t - (_S.named_value(_n_next_b4,"t") - 0.06)))/0.06)
		var _n_i1_b29 = floori((_n_u_b28 * _S.prop(_n_tr_b27,"length")))
		_S.call_value(_n_trace,[_n_p_b0, _n_tr_b27, _S.index_value(_n_C,3), 1])
		_S.call_value(_n_trace,[_n_p_b0, _n_tr_b27, _S.index_value(_n_C,6), 1, (_n_i1_b29 - 18), _n_i1_b29])
		if true:
			var _n_i_b30 = maxf(0,(_n_i1_b29 - 18))
			while _S.truth((_n_i_b30 < minf(_S.prop(_n_tr_b27,"length"),_n_i1_b29))):
				if _S.truth((_S.index_value(_S.index_value(_n_tr_b27,_n_i_b30),1) > (_n_TOP + 14))):
					_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_n_tr_b27,_n_i_b30),0), _S.index_value(_S.index_value(_n_tr_b27,_n_i_b30),1), 9, _S.index_value(_n_C,4), 0.35])
				_n_i_b30 += 4
	else:
		if _S.truth(((_S.named_value(_n_s_b1,"k") > 0) if _S.truth(_n_s_b1) else _n_s_b1)):
			var _n_hero_b31 = ((_S.named_value(_n_s_b1,"a") < (float(1)/30)) if _S.truth(_S.binary("===",_S.named_value(_n_s_b1,"i"),0)) else _S.binary("===",_S.named_value(_n_s_b1,"i"),0))
			_S.call_value(_n_stroke,[_n_p_b0, _S.index_value(_n_bolts,_S.named_value(_n_s_b1,"i")), _S.named_value(_n_s_b1,"k"), _n_C, (1.5 if _S.truth(_S.binary("===",_S.named_value(_n_s_b1,"i"),0)) else 1.2), {"hero":_n_hero_b31,"core":((1.2 if _S.truth(_n_hero_b31) else 0.8) if _S.truth((_S.named_value(_n_s_b1,"k") > 0.6)) else 0),"minY":(_n_TOP + 14)}])
			var _n_r_b32 = (4.5 * _S.named_value(_n_s_b1,"k"))
			_S.invoke(_n_p_b0,"circle",[0, (-1), (_n_r_b32 + 1.5), _S.index_value(_n_C,2)])
			_S.invoke(_n_p_b0,"circle",[0, (-1), (_n_r_b32 + 0.5), _S.index_value(_n_C,5)])
			_S.invoke(_n_p_b0,"circle",[0, (-1), (_n_r_b32 * 0.65), _n_WHITE])
			if _S.truth((_S.named_value(_n_s_b1,"a") < 0.07)):
				_S.call_value(_n_sparkle,[_n_p_b0, 0, (-2), floori(((12 * _S.named_value(_n_s_b1,"k")) * (1 - (float(_S.named_value(_n_s_b1,"a"))/0.07)))+0.5), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.25])
			_S.invoke(_n_p_b0,"glow",[0, (-16), 96, _S.index_value(_n_C,3), (0.42 * _S.named_value(_n_s_b1,"k"))])
			_S.invoke(_n_p_b0,"glow",[0, (-3), 22, _S.index_value(_n_C,5), (0.3 * _S.named_value(_n_s_b1,"k"))])
			if _S.truth(_n_hero_b31):
				_S.invoke(_n_p_b0,"glow",[(_n_X0 * 0.5), (-110), 170, _S.index_value(_n_C,3), 0.3])
		else:
			if _S.truth(_n_s_b1):
				var _n_crumble_b33 = _S.binary("===",_S.named_value(_n_s_b1,"i"),(_S.prop(_n_STROKES,"length") - 1))
				var _n_cool_b34 = clampf((float((_S.named_value(_n_s_b1,"a") - 0.23))/0.45),0.0,1.0)
				var _n_tr_b35 = _S.call_value(_n_chan,[_S.named_value(_n_s_b1,"i")])
				if true:
					var _n_i_b36 = 0
					while _S.truth((_n_i_b36 < (_S.prop(_n_tr_b35,"length") - 1))):
						if _S.truth(((_n_t >= _S.index_value(_n_gone,_n_i_b36)) if _S.truth(_n_crumble_b33) else _n_crumble_b33)):
							_n_i_b36 += 1.0
							continue
						var _n_h_b37 = ((1 - clampf((float(((_n_t - _S.named_value(_n_last,"t")) - 0.23))/((_S.index_value(_n_gone,_n_i_b36) - _S.named_value(_n_last,"t")) - 0.23)),0.0,1.0)) if _S.truth(_n_crumble_b33) else (1 - _n_cool_b34))
						_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_n_tr_b35,_n_i_b36),0), _S.index_value(_S.index_value(_n_tr_b35,_n_i_b36),1), _S.index_value(_S.index_value(_n_tr_b35,(_n_i_b36 + 1)),0), _S.index_value(_S.index_value(_n_tr_b35,(_n_i_b36 + 1)),1), (_S.index_value(_n_C,5) if _S.truth((_n_h_b37 > 0.7)) else (_S.index_value(_n_C,4) if _S.truth((_n_h_b37 > 0.4)) else (_S.index_value(_n_C,3) if _S.truth((_n_h_b37 > 0.15)) else _S.index_value(_n_C,2))))])
						if _S.truth(((_S.index_value(_S.index_value(_n_tr_b35,_n_i_b36),1) > (_n_TOP + 14)) if _S.truth(((_n_h_b37 > 0.3) if _S.truth(_S.binary("===",fmod(_n_i_b36,6),0)) else _S.binary("===",fmod(_n_i_b36,6),0))) else ((_n_h_b37 > 0.3) if _S.truth(_S.binary("===",fmod(_n_i_b36,6),0)) else _S.binary("===",fmod(_n_i_b36,6),0)))):
							_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_n_tr_b35,_n_i_b36),0), _S.index_value(_S.index_value(_n_tr_b35,_n_i_b36),1), 6, _S.index_value(_n_C,4), (0.15 * _n_h_b37)])
						_n_i_b36 += 1.0
	if _S.truth(((_S.named_value(_n_s_b1,"a") < 0.4) if _S.truth(_n_s_b1) else _n_s_b1)):
		var _n_r_b38 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),91,_n_f_b2])
		var _n_run_b39 = ((_n_REACH * _S.invoke(_n_ease,"outCubic",[clampf((float(_S.named_value(_n_s_b1,"a"))/0.35),0.0,1.0)])) if _S.truth(_S.binary("===",_S.named_value(_n_s_b1,"i"),0)) else (_n_REACH * clampf((float(_S.named_value(_n_s_b1,"a"))/0.22),0.0,1.0)))
		for _iter_3 in _S.array(_n_tree):
			var _n_br_b40 = _iter_3
			if _S.truth(((_S.named_value(_n_br_b40,"w") < 1) if _S.truth((_S.named_value(_n_br_b40,"w") < 1)) else (_S.invoke(_n_r_b38,"next",[]) < 0.3))):
				continue
			var _n_i1_b41 = _S.invoke(_S.named_value(_n_br_b40,"pts"),"findIndex",[_S.function_value(_S.capture(_parent,{"run":_n_run_b39,"this":_this}),"_f20")])
			var _n_j1_b42 = (_S.prop(_S.named_value(_n_br_b40,"pts"),"length") if _S.truth((_n_i1_b41 < 0)) else _n_i1_b41)
			var _n_j0_b43 = maxf(0,(_n_j1_b42 - _S.invoke(_n_r_b38,"int",[7, 13])))
			var _n_pts_b44 = _S.invoke(_S.invoke(_S.named_value(_n_br_b40,"pts"),"slice",[_n_j0_b43, _n_j1_b42]),"map",[_S.function_value(_S.capture(_parent,{"r":_n_r_b38,"this":_this}),"_f21")])
			if _S.truth((_S.prop(_n_pts_b44,"length") > 1)):
				_S.call_value(_n_crackle,[_n_p_b0, {"paths":[{"pts":_n_pts_b44,"w":1}]}, ((0.9 * (1 - (float(_S.named_value(_n_s_b1,"a"))/0.4))) + 0.1), _n_C, 0.35])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_q_b0,"t") > _n_t)
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_run = _S.read(_parent,"run")
	var _tuple_0 = _S.arg(_args,0)
	var _n_d_b0 = _S.prop(_tuple_0,2)
	return (_n_d_b0 > _n_run)
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 + _S.invoke(_n_r,"range",[(-0.6), 0.6])), ((_n_y_b1 - 1.5) - _S.invoke(_n_r,"range",[0, 2.5]))]
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_FLICK = _S.read(_parent,"FLICK")
	var _n_a_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_a_b0 < 0)) else _S.logical("??",_S.index_value(_n_FLICK,floori(((_n_a_b0 * 30) + 0.0001))),func():return 0))
	return null
