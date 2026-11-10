@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/smite.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "chip", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Smite"}, {"desc": "A glint marks the spot, then a bolt of light drops like a hammer: a white flash, a shockwave over the floor, stone chips flying and cracks that glow and cool."}, {"tags": ["holy", "smite", "strike", "impact", "light", "ground", "one-shot"]}, {"size": [224, 176]}, {"origin": [112, 148]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"stone": "#5a5066"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TOP", _S.unary("-", 148))
	_S.define(_e, "SY", 0.38)
	_S.define(_e, "MARK", 0.42)
	_S.define(_e, "HIT", 0.54)
	_S.define(_e, "LEN", 44)
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_r_b3 = (0.6 + (_S.named_value(_n_b_b1,"s") * 0.7))
	var _n_fade_b4 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_lx_b5 = ((cos(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	var _n_ly_b6 = ((sin(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"y") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"x") + _n_r_b3) + 1), ((_S.named_value(_n_b_b1,"y") + _n_r_b3) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"r":_n_r_b3,"lx":_n_lx_b5,"ly":_n_ly_b6,"st":_n_st_b2,"fade":_n_fade_b4,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_st = _S.read(_parent,"st")
	var _n_fade = _S.read(_parent,"fade")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.2), _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_r + 0.9))):
		return null
	var _n_lit_b6 = ((_n_dx_b3 * _n_lx) + (_n_dy_b4 * _n_ly))
	_S.set_prop(_n_out_b2,"c",(_n_OUTLINE if _S.truth((_n_d_b5 > _n_r)) else (_S.index_value(_n_st,3) if _S.truth((_n_lit_b6 < (-0.3))) else (_S.index_value(_n_st,1) if _S.truth((_n_lit_b6 > 0.5)) else _S.index_value(_n_st,2)))),"=")
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "hammer", _S.function_value(_e, "_f3"))
	_S.define(_e, "crack", _S.function_value(_e, "_f8"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "s0", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "st", [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 0.5]), _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 0.75]), _S.read(_e, "s0"), _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "s0"), 1.4]), _S.read(_e, "WHITE"), 0.1])])
	_S.define(_e, "dust", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "s0"), _S.call_value(_S.read(_e, "hex"), ["#8a8094"]), 0.4]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f9")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "chips", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.function_value(_e, "_f10")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "cracks", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "tipY", _S.function_value(_e, "_f13"))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f15")}, {"draw": _S.function_value(_e, "_f17")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_MARK = _S.read(_parent,"MARK")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_tipY = _S.read(_parent,"tipY")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t < _n_MARK) if _S.truth((_n_t < _n_MARK)) else (_n_t >= (_n_HIT + 0.06)))):
		return null
	var _n_y1_b1 = (0 if _S.truth((_n_t >= _n_HIT)) else _S.call_value(_n_tipY,[_n_t]))
	var _n_y0_b2 = maxf((_n_TOP + 5),(_n_y1_b1 - (_n_LEN * ((1 - (float((_n_t - _n_HIT))/0.06)) if _S.truth((_n_t >= _n_HIT)) else 1))))
	var _n_white_b3 = (_n_t >= _n_HIT)
	if _S.truth((_n_y1_b1 < (_n_TOP + 12))):
		return null
	for _iter_0 in _S.array([[(-5), 0.6], [(-2), 0.9], [2, 0.8], [5, 0.5]]):
		var _tuple_1 = _iter_0
		var _n_dx_b4 = _S.prop(_tuple_1,0)
		var _n_k_b5 = _S.prop(_tuple_1,1)
		if _S.truth((_n_y0_b2 > (_n_TOP + 2))):
			_S.invoke(_n_p_b0,"line",[_n_dx_b4, maxf(_n_TOP,(_n_y0_b2 - 70)), _n_dx_b4, _n_y0_b2, _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"k":_n_k_b5,"this":_this}),"_f5")])
	if _S.truth(((_n_y1_b1 - 3) > _n_y0_b2)):
		_S.invoke(_n_p_b0,"beam",[0, _n_y0_b2, 0, (_n_y1_b1 - 3), 9, _S.function_value(_S.capture(_parent,{"white":_n_white_b3,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"beam",[0, (_n_y1_b1 - 6), 0, (_n_y1_b1 - 1), 13, _S.function_value(_S.capture(_parent,{"white":_n_white_b3,"this":_this}),"_f7")])
	_S.invoke(_n_p_b0,"glowLine",[0, (_n_y0_b2 + 10), 0, _n_y1_b1, 16, _S.index_value(_n_C,5), 0.6])
	_S.invoke(_n_p_b0,"glow",[0, (_n_y1_b1 - 4), minf(22,((_n_y1_b1 - _n_TOP) - 6)), _n_WHITE, 0.5])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.7)) else _S.index_value(_n_C,4))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_u_b0 * _n_k)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_white = _S.read(_parent,"white")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth((_n_white if _S.truth(_n_white) else (_n_v_b1 < 0.35))) else (_S.index_value(_n_C,6) if _S.truth((_n_v_b1 < 0.7)) else _S.index_value(_n_C,5)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_white = _S.read(_parent,"white")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth(((_n_v_b1 < 0.6) if _S.truth((_n_v_b1 < 0.6)) else _n_white)) else _S.index_value(_n_C,6))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_oval = _S.read(_parent,"oval")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_HIT)):
		return null
	var _n_grow_b1 = _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t,_n_HIT,(_n_HIT + 0.1))])
	for _iter_0 in _S.array(_n_cracks):
		var _n_c_b3 = _iter_0
		for _iter_1 in _S.array(([_S.named_value(_n_c_b3,"pts"), _S.named_value(_n_c_b3,"fork")] if _S.truth(_S.named_value(_n_c_b3,"fork")) else [_S.named_value(_n_c_b3,"pts")])):
			var _n_path_b4 = _iter_1
			var _n_n_b5 = maxf(1,floori(((_S.prop(_n_path_b4,"length") - 1) * _n_grow_b1)+0.5))
			if true:
				var _n_i_b6 = 0
				while _S.truth((_n_i_b6 < _n_n_b5)):
					var _tuple_2 = _S.index_value(_n_path_b4,_n_i_b6)
					var _n_x0_b7 = _S.prop(_tuple_2,0)
					var _n_y0_b8 = _S.prop(_tuple_2,1)
					var _tuple_3 = _S.index_value(_n_path_b4,(_n_i_b6 + 1))
					var _n_x1_b9 = _S.prop(_tuple_3,0)
					var _n_y1_b10 = _S.prop(_tuple_3,1)
					var _n_d_b11 = (float(_S.Bridge.hypot([_n_x0_b7, (float(_n_y0_b8)/_n_SY)]))/_S.named_value(_n_c_b3,"L"))
					var _n_heat_b12 = clampf(((1 - (float((_n_t - _n_HIT))/_S.named_value(_n_c_b3,"cool"))) - (_n_d_b11 * 0.5)),0.0,1.0)
					if _S.truth((_n_heat_b12 <= 0)):
						_n_i_b6 += 1.0
						continue
					var _n_col_b13 = (_n_WHITE if _S.truth((_n_heat_b12 > 0.85)) else (_S.index_value(_n_C,6) if _S.truth((_n_heat_b12 > 0.65)) else (_S.index_value(_n_C,5) if _S.truth((_n_heat_b12 > 0.45)) else (_S.index_value(_n_C,4) if _S.truth((_n_heat_b12 > 0.3)) else (_S.index_value(_n_C,3) if _S.truth((_n_heat_b12 > 0.18)) else _S.index_value(_n_C,2))))))
					_S.invoke(_n_p_b0,"line",[_n_x0_b7, _n_y0_b8, _n_x1_b9, _n_y1_b10, _n_col_b13, ((float(_n_heat_b12)/0.12) if _S.truth((_n_heat_b12 < 0.12)) else 1)])
					if _S.truth((_S.binary("===",_n_path_b4,_S.named_value(_n_c_b3,"pts")) if _S.truth((_n_d_b11 < 0.45)) else (_n_d_b11 < 0.45))):
						_S.invoke(_n_p_b0,"line",[_n_x0_b7, (_n_y0_b8 + 1), _n_x1_b9, (_n_y1_b10 + 1), (_S.index_value(_n_C,4) if _S.truth((_n_heat_b12 > 0.5)) else _S.index_value(_n_C,2)), ((float(_n_heat_b12)/0.12) if _S.truth((_n_heat_b12 < 0.12)) else 1)])
					if _S.truth(_S.binary("===",fmod(_n_i_b6,2),0)):
						_S.invoke(_n_p_b0,"glow",[_n_x0_b7, _n_y0_b8, 10, _S.index_value(_n_C,4), (0.45 * _n_heat_b12)])
					_n_i_b6 += 1.0
	var _n_h_b2 = clampf((1 - (float((_n_t - _n_HIT))/1.6)),0.0,1.0)
	if _S.truth((_n_h_b2 > 0)):
		_S.call_value(_n_oval,[_n_p_b0, 0, 0, 5, 1.6, (_n_WHITE if _S.truth((_n_h_b2 > 0.6)) else (_S.index_value(_n_C,5) if _S.truth((_n_h_b2 > 0.3)) else _S.index_value(_n_C,3))), minf(1,(_n_h_b2 * 3))])
		_S.invoke(_n_p_b0,"glow",[0, 0, 18, _S.index_value(_n_C,4), (0.45 * _n_h_b2)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f10(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("+", 0.12, _S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), 0.24))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.12), 0.12])))
	_S.define(_e, "L", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [30, 54]), (0.6 if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])]), 0.7)) else 1)))
	_S.define(_e, "pts", _S.invoke(_S.call_value(_S.read(_e, "bolt"), [_S.read(_e, "R"), 0, 0, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "L")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "L")), _S.merge([{"jag": 0.28}, {"depth": 4}])]), "map", [_S.function_value(_e, "_f12")]))
	_S.define(_e, "fork", (_S.call_value(_S.read(_e, "bolt"), _S.concat([[_S.read(_e, "R")], _S.array(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)]))), [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)])), 0), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), 0.7))]), _S.read(_e, "L")), 0.35))], [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "pts"), "length"), 0.5)])), 1), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), 0.7))]), _S.read(_e, "L")), 0.35), _S.read(_e, "SY")))], [_S.merge([{"jag": 0.3}, {"depth": 3}])]])) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "pts"), "length"), 6)) else null))
	return _S.merge([{"pts": _S.read(_e, "pts")}, {"fork": _S.read(_e, "fork")}, {"L": _S.read(_e, "L")}, {"cool": _S.invoke(_S.read(_e, "R"), "range", [1.6, 2.1])}])

static func _f12(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_z_b1 = _S.prop(_tuple_0,1)
	return [_n_x_b0, (_n_z_b1 * _n_SY)]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_MARK = _S.read(_parent,"MARK")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_tt_b0 = _S.arg(_args,0)
	return _S.numeric_lerp((_n_TOP - 6),0,_S.invoke(_n_ease,"inCubic",[_S.MathFX.seg(_n_tt_b0,_n_MARK,_n_HIT)]))
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "MARK")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.25]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 18])), 0, _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 12])), _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.4]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.5, 1.2])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "MARK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))), func(): return _S.binary(">", _S.call_value(_S.read(_e, "tipY"), [_S.read(_e, "t")]), _S.binary("+", _S.read(_e, "TOP"), 50))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [4, 7])), _S.binary("-", _S.call_value(_S.read(_e, "tipY"), [_S.read(_e, "t")]), _S.invoke(_S.read(_e, "R"), "range", [4, 30])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [10, 40])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3]), _S.prop(_S.read(_e, "C"), 6), 0.7])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "hit", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 24), 92, _S.prop(_S.read(_v15, "C"), 5), 1, 0.6])
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 8), 40, _S.read(_v15, "WHITE"), 0.9, 0.12])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 60)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.25), 1.25])))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [110, 280]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "R"), "range", [0.25, 0.75])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 16)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1])))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [60, 160]))
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "STAR"), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 4), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.4, 0.9]), (_S.read(_v19, "WHITE") if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.5])) else _S.prop(_S.read(_v19, "C"), 6)), _S.invoke(_S.read(_v19, "R"), "range", [0.8, 2.4])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v15)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 14)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [90, 230]))
			_S.invoke(_S.read(_v21, "chips"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp"))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [1.2, 1.8])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v21, "R"), "int", [1, 3])}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v15)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 34)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v23, "Math"), "PI")), 2), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1), 1])))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [60, 220]))
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "GRIT"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.invoke(_S.read(_v23, "R"), "range", [0.9, 1.5]), _S.invoke(_S.read(_v23, "R"), "pick", [_S.invoke(_S.read(_v23, "st"), "slice", [1])]), (2 if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.4])) else 1)])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v24 = _S.scope(_v15)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 9)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "s", _S.invoke(_S.read(_v25, "R"), "sign", []))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SMOKE"), _S.binary("*", _S.read(_v25, "s"), _S.invoke(_S.read(_v25, "R"), "range", [2, 10])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v25, "s"), _S.invoke(_S.read(_v25, "R"), "range", [50, 130])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [2, 12])), _S.invoke(_S.read(_v25, "R"), "range", [0.7, 1.2]), _S.call_value(_S.read(_v25, "mix"), [_S.read(_v25, "dust"), _S.prop(_S.read(_v25, "C"), 4), 0.18]), _S.invoke(_S.read(_v25, "R"), "range", [3.5, 6]), _S.invoke(_S.read(_v25, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v25, "PF"), "BIG")])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v15)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 4)):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "SMOKE"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [2, 8])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [20, 45])), _S.invoke(_S.read(_v26, "R"), "range", [1.2, 1.8]), _S.call_value(_S.read(_v26, "mix"), [_S.read(_v26, "dust"), _S.prop(_S.read(_v26, "C"), 5), 0.25]), _S.invoke(_S.read(_v26, "R"), "range", [4, 6]), _S.invoke(_S.read(_v26, "R"), "range", [0.05, 0.3])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 1.3))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "c", _S.invoke(_S.read(_v27, "R"), "pick", [_S.read(_v27, "cracks")]))
		_S.define(_v27, "q", _S.invoke(_S.read(_v27, "R"), "pick", [_S.prop(_S.read(_v27, "c"), "pts")]))
		if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.75])):
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "EMBER"), _S.prop(_S.read(_v27, "q"), 0), _S.binary("-", _S.prop(_S.read(_v27, "q"), 1), 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [15, 35])), _S.invoke(_S.read(_v27, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v27, "C"), 5)])
		else:
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "STAR"), _S.prop(_S.read(_v27, "q"), 0), _S.binary("-", _S.prop(_S.read(_v27, "q"), 1), 2), 0, _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [4, 12])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), (_S.read(_v27, "WHITE") if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.5])) else _S.prop(_S.read(_v27, "C"), 6)), _S.invoke(_S.read(_v27, "R"), "range", [0.8, 1.8])])
	_S.invoke(_S.read(_e, "chips"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_crack = _S.read(_parent,"crack")
	var _n_ps = _S.read(_parent,"ps")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_crack,[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	var _n_k_b1 = _S.MathFX.seg(_n_t,_n_HIT,(_n_HIT + 0.42))
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (6 + (84 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), (_n_SY * 0.8), maxf(1,(5 * (1 - _n_k_b1))), (1.15 - _n_k_b1), _S.invoke(_n_C,"slice",[3]), _S.function_value(_S.capture(_parent,{"this":_this}),"_f16"), (_n_k_b1 < 0.12)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_MARK = _S.read(_parent,"MARK")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_oval = _S.read(_parent,"oval")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_hammer = _S.read(_parent,"hammer")
	var _n_band = _S.read(_parent,"band")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_chip = _S.read(_parent,"chip")
	var _n_st = _S.read(_parent,"st")
	var _n_chips = _S.read(_parent,"chips")
	var _n_ps = _S.read(_parent,"ps")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_HIT)):
		var _n_u_b4 = _S.MathFX.seg(_n_t,0,_n_MARK)
		var _n_k_b5 = _S.MathFX.smooth(0,0.08,_n_t)
		var _n_spin_b6 = (_n_t * 3)
		var _n_rr_b7 = _S.numeric_lerp(26,8,_S.invoke(_n_ease,"inOutCubic",[_n_u_b4]))
		_S.call_value(_n_oval,[_n_p_b0, 0, 0, _n_rr_b7, (_n_rr_b7 * _n_SY), _S.function_value(_S.capture(_parent,{"spin":_n_spin_b6,"this":_this}),"_f18"), (_n_k_b5 * (0.65 + (0.35 * sin((_n_t * 40)))))])
		_S.call_value(_n_oval,[_n_p_b0, 0, 1, _n_rr_b7, (_n_rr_b7 * _n_SY), _S.index_value(_n_C,3), (_n_k_b5 * 0.6), _S.function_value(_S.capture(_parent,{"this":_this}),"_f19")])
		var _n_L_b8 = ((3 + (8 * _S.invoke(_n_ease,"outBack",[clampf((float(_n_t)/0.2),0.0,1.0), 2]))) * ((1 + (0.6 * _S.MathFX.seg(_n_t,_n_MARK,_n_HIT))) if _S.truth((_n_t > _n_MARK)) else 1))
		if true:
			var _n_i_b9 = 0
			while _S.truth((_n_i_b9 < 4)):
				var _n_a_b10 = ((_n_spin_b6 * 0.3) + (float((_n_i_b9 * PI))/2))
				var _n_len_b11 = ((_n_L_b8 * 0.6) if _S.truth(fmod(_n_i_b9,2)) else _n_L_b8)
				_S.invoke(_n_p_b0,"line",[0, (-2), (cos(_n_a_b10) * _n_len_b11), ((-2) + (sin(_n_a_b10) * _n_len_b11)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f20"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f21")])
				_n_i_b9 += 1.0
		_S.invoke(_n_p_b0,"px",[0, (-2), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, (-2), (14 + (10 * _n_u_b4)), _S.index_value(_n_C,5), (0.5 * _n_k_b5)])
		_S.invoke(_n_p_b0,"glowLine",[0, (_n_TOP + 6), 0, (-2), 5, _S.index_value(_n_C,4), (0.12 * _n_u_b4)])
	_S.call_value(_n_hammer,[_n_p_b0])
	var _n_ai_b1 = _S.MathFX.seg(_n_t,(_n_HIT + 0.04),(_n_HIT + 0.55))
	if _S.truth(((_n_ai_b1 < 1) if _S.truth((_n_t > (_n_HIT + 0.04))) else (_n_t > (_n_HIT + 0.04)))):
		var _n_w_b12 = (1 + (4 * pow((1 - _n_ai_b1),2)))
		_S.invoke(_n_p_b0,"beam",[0, (_n_TOP + 4), 0, (-4), _n_w_b12, _S.function_value(_S.capture(_parent,{"this":_this}),"_f22"), _S.function_value(_S.capture(_parent,{"ai":_n_ai_b1,"this":_this}),"_f23")])
		_S.invoke(_n_p_b0,"glowLine",[0, (_n_TOP + 16), 0, (-6), 10, _S.index_value(_n_C,5), (0.4 * (1 - _n_ai_b1))])
	var _n_k_b2 = _S.MathFX.seg(_n_t,_n_HIT,(_n_HIT + 0.42))
	if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (6 + (84 * _S.invoke(_n_ease,"outCubic",[_n_k_b2]))), (_n_SY * 0.8), maxf(1,(5 * (1 - _n_k_b2))), (1.15 - _n_k_b2), _S.invoke(_n_C,"slice",[3]), _S.function_value(_S.capture(_parent,{"this":_this}),"_f24"), (_n_k_b2 < 0.12)])
	var _n_d_b3 = _S.MathFX.seg(_n_t,_n_HIT,(_n_HIT + 0.28))
	if _S.truth(((_n_d_b3 < 1) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))):
		var _n_r_b13 = (8 + (40 * _S.invoke(_n_ease,"outCubic",[_n_d_b3])))
		_S.invoke(_n_p_b0,"arc",[0, 0, _n_r_b13, maxf(1,(3 * (1 - _n_d_b3))), PI, _n_TAU, _S.function_value(_S.capture(_parent,{"d":_n_d_b3,"this":_this}),"_f25"), (1.1 - _n_d_b3)])
		if true:
			var _n_g_b14 = (PI * 1.1)
			while _S.truth((_n_g_b14 < (_n_TAU - 0.2))):
				_S.invoke(_n_p_b0,"glow",[(cos(_n_g_b14) * _n_r_b13), (sin(_n_g_b14) * _n_r_b13), 8, _S.index_value(_n_C,5), (0.3 * (1 - _n_d_b3))])
				_n_g_b14 += 0.5
	if _S.truth(((_n_t < (_n_HIT + 0.07)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))):
		_S.invoke(_n_p_b0,"circle",[0, (-6), 16, _n_WHITE])
		_S.invoke(_n_p_b0,"circle",[0, (-6), 19, _S.index_value(_n_C,6), 0.6])
	for _iter_0 in _S.array(_S.named_value(_n_chips,"list")):
		var _n_b_b15 = _iter_0
		_S.call_value(_n_chip,[_n_p_b0, _n_b_b15, _n_st])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	if _S.truth(((_n_t < (_n_HIT + 0.25)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-8), (16 * (1 - (float((_n_t - _n_HIT))/0.25))), _n_WHITE, _S.index_value(_n_C,5), 0.7])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_spin = _S.read(_parent,"spin")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((sin(((_n_g_b0 * 4) + _n_spin)) > 0)) else _S.index_value(_n_C,5))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) > 0)
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_v_b0 < 0.4)) else _S.index_value(_n_C,5))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (1.2 - _n_v_b0)
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth((_n_v_b1 < 0.5)) else _S.index_value(_n_C,5))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_ai = _S.read(_parent,"ai")
	var _n_u_b0 = _S.arg(_args,0)
	return ((0.3 + (0.7 * _n_u_b0)) * (1 - (_n_ai * 0.5)))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_d = _S.read(_parent,"d")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth(((_n_d < 0.2) if _S.truth((_n_d < 0.2)) else (_n_v_b1 > 0.6))) else _S.index_value(_n_C,5))
	return null
