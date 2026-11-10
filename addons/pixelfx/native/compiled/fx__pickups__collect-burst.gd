@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/collect-burst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Collect burst"}, {"desc": "The moment of pickup: a white flash and a cross of light, a thin ring snapping out ahead of a softer one, twinkles thrown wide on curving paths that brake, hang and wink out."}, {"tags": ["pickup", "collect", "burst", "sparkle", "reward", "one-shot"]}, {"size": [112, 108]}, {"origin": [56, 94]}, {"duration": 1.35}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 36, _S.prop(_S.read(_e, "C"), 5), 0.85, 0.32])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 14, _S.read(_e, "WHITE"), 0.75, 0.08])
	_S.define(_e, "stars", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_CY = _S.read(_parent,"CY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/14) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.2), 0.2]))
	var _n_sp_b3 = (_S.invoke(_n_R,"range",[145, 225]) * (1.12 if _S.truth(_S.binary("===",fmod(_n_i_b1,3),0)) else 0.85))
	return {"x":0,"y":_n_CY,"a":_n_a_b2,"sp":_n_sp_b3,"turn":((1 if _S.truth(fmod(_n_i_b1,2)) else (-1)) * _S.invoke(_n_R,"range",[2.5, 5])),"life":_S.invoke(_n_R,"range",[0.75, 1.15]),"age":0,"size":(2.6 if _S.truth(_S.binary("===",fmod(_n_i_b1,3),0)) else _S.invoke(_n_R,"range",[1.2, 2])),"tr":[],"c":(_n_WHITE if _S.truth(_S.binary("===",fmod(_n_i_b1,4),0)) else (_S.index_value(_n_C,6) if _S.truth(fmod(_n_i_b1,2)) else _S.index_value(_n_C,5))),"ph":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_CY = _S.read(_parent,"CY")
	var _n_TAU = _S.read(_parent,"TAU")
	return {"x":_S.invoke(_n_R,"range",[(-8), 8]),"y":(_n_CY + _S.invoke(_n_R,"range",[(-4), 6])),"vy":(-_S.invoke(_n_R,"range",[12, 30])),"life":_S.invoke(_n_R,"range",[0.5, 0.9]),"d":_S.invoke(_n_R,"range",[0.05, 0.25]),"w":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v0 in _S.array(_S.read(_e, "stars")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "s"), "age"), _S.prop(_S.read(_v2, "s"), "life"))):
			continue
		_S.set_prop(_S.read(_v2, "s"), "age", _S.read(_v2, "dt"), "+=", false)
		_S.invoke(_S.prop(_S.read(_v2, "s"), "tr"), "unshift", [[_S.prop(_S.read(_v2, "s"), "x"), _S.prop(_S.read(_v2, "s"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v2, "s"), "tr"), "length"), 4)):
			_S.invoke(_S.prop(_S.read(_v2, "s"), "tr"), "pop", [])
		_S.set_prop(_S.read(_v2, "s"), "a", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "s"), "turn"), _S.read(_v2, "dt")), _S.invoke(_S.read(_v2, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.prop(_S.read(_v2, "s"), "age"), 1.5))])), "+=", false)
		_S.set_prop(_S.read(_v2, "s"), "sp", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "s"), "sp"), 4.3), _S.read(_v2, "dt")), "-=", false)
		_S.set_prop(_S.read(_v2, "s"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.prop(_S.read(_v2, "s"), "a")]), _S.prop(_S.read(_v2, "s"), "sp")), _S.read(_v2, "dt")), "+=", false)
		_S.set_prop(_S.read(_v2, "s"), "y", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.prop(_S.read(_v2, "s"), "a")]), _S.prop(_S.read(_v2, "s"), "sp")), _S.read(_v2, "dt")), _S.binary("*", _S.binary("*", 6, _S.prop(_S.read(_v2, "s"), "age")), _S.read(_v2, "dt"))), "+=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "s"), "y"), _S.unary("-", 2))):
			_S.last([_S.set_prop(_S.read(_v2, "s"), "y", _S.unary("-", 2), "=", false), _S.set_prop(_S.read(_v2, "s"), "a", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.prop(_S.read(_v2, "s"), "a")])), "=", false), _S.set_prop(_S.read(_v2, "s"), "sp", 0.5, "*=", false)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CY = _S.read(_parent,"CY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_glint = _S.read(_parent,"glint")
	var _n_stars = _S.read(_parent,"stars")
	var _n_motes = _S.read(_parent,"motes")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < 0.07)):
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, ((5.5 * (1 - (float(_n_t)/0.07))) + 1), _n_WHITE])
	if _S.truth((_n_t < 0.16)):
		var _n_k_b3 = (1 - (float(_n_t)/0.16))
		var _n_L_b4 = ((26 * _S.invoke(_n_ease,"outCubic",[minf(1,((float(_n_t)/0.03) + 0.4))])) * _n_k_b3)
		for _iter_0 in _S.array([[1, 0, 1], [(-1), 0, 1], [0, 1, 0.6], [0, (-1), 0.6]]):
			var _tuple_1 = _iter_0
			var _n_dx_b5 = _S.prop(_tuple_1,0)
			var _n_dy_b6 = _S.prop(_tuple_1,1)
			var _n_l_b7 = _S.prop(_tuple_1,2)
			_S.invoke(_n_p_b0,"line",[0, _n_CY, ((_n_dx_b5 * _n_L_b4) * _n_l_b7), (_n_CY + ((_n_dy_b6 * _n_L_b4) * _n_l_b7)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"k":_n_k_b3,"this":_this}),"_f6")])
		_S.invoke(_n_p_b0,"glow",[0, _n_CY, ((20 * _n_k_b3) + 4), _S.index_value(_n_C,5), (0.6 * _n_k_b3)])
	var _n_u1_b1 = (float(_n_t)/0.32)
	if _S.truth((_n_u1_b1 < 1)):
		var _n_r_b8 = (3 + (23 * _S.invoke(_n_ease,"outExpo",[_n_u1_b1])))
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, _n_r_b8, 1, (_n_WHITE if _S.truth((_n_u1_b1 < 0.3)) else _S.index_value(_n_C,6)), (1.3 - (_n_u1_b1 * 1.2))])
		_S.invoke(_n_p_b0,"glowRing",[0, _n_CY, _n_r_b8, 4, _S.index_value(_n_C,5), (0.4 * (1 - _n_u1_b1))])
	var _n_u2_b2 = (float((_n_t - 0.04))/0.5)
	if _S.truth(((_n_u2_b2 < 1) if _S.truth((_n_u2_b2 > 0)) else (_n_u2_b2 > 0))):
		var _n_r_b9 = (2 + (16 * _S.invoke(_n_ease,"outCubic",[_n_u2_b2])))
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, _n_r_b9, maxf(1,(2.6 * (1 - _n_u2_b2))), _S.index_value(_n_C,5), (1 - _n_u2_b2)])
	for _iter_2 in _S.array(_n_stars):
		var _n_s_b10 = _iter_2
		if _S.truth((_S.named_value(_n_s_b10,"age") > _S.named_value(_n_s_b10,"life"))):
			continue
		var _n_k_b11 = (1 - (float(_S.named_value(_n_s_b10,"age"))/_S.named_value(_n_s_b10,"life")))
		var _n_tw_b12 = (0.65 + (0.35 * sin(((_S.named_value(_n_s_b10,"age") * 26) + _S.named_value(_n_s_b10,"ph")))))
		_S.invoke(_S.named_value(_n_s_b10,"tr"),"forEach",[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"k":_n_k_b11,"this":_this}),"_f7")])
		if _S.truth(((sin(((_S.named_value(_n_s_b10,"age") * 40) + _S.named_value(_n_s_b10,"ph"))) < 0) if _S.truth((_n_k_b11 < 0.3)) else (_n_k_b11 < 0.3))):
			continue
		_S.call_value(_n_glint,[_n_p_b0, _S.named_value(_n_s_b10,"x"), _S.named_value(_n_s_b10,"y"), floori(((_S.named_value(_n_s_b10,"size") * _n_tw_b12) * minf(1,(_n_k_b11 * 2.5)))+0.5), _S.named_value(_n_s_b10,"c"), (0.45 * _n_k_b11)])
	for _iter_3 in _S.array(_n_motes):
		var _n_m_b13 = _iter_3
		var _n_a_b14 = (_n_t - _S.named_value(_n_m_b13,"d"))
		if _S.truth(((_n_a_b14 < 0) if _S.truth((_n_a_b14 < 0)) else (_n_a_b14 > _S.named_value(_n_m_b13,"life")))):
			continue
		var _n_k_b15 = (1 - (float(_n_a_b14)/_S.named_value(_n_m_b13,"life")))
		var _n_x_b16 = (_S.named_value(_n_m_b13,"x") + (sin(((_n_a_b14 * 6) + _S.named_value(_n_m_b13,"w"))) * 1.5))
		var _n_y_b17 = (_S.named_value(_n_m_b13,"y") + (_S.named_value(_n_m_b13,"vy") * _n_a_b14))
		_S.invoke(_n_p_b0,"dot",[_n_x_b16, _n_y_b17, (_S.index_value(_n_C,6) if _S.truth((_n_k_b15 > 0.5)) else _S.index_value(_n_C,5)), (_n_k_b15 * 1.5)])
		_S.invoke(_n_p_b0,"glow",[(_n_x_b16 + 0.5), (_n_y_b17 + 0.5), 3, _S.index_value(_n_C,5), (0.3 * _n_k_b15)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.65)) else _S.index_value(_n_C,5)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_u_b0 = _S.arg(_args,0)
	return ((1 if _S.truth((_n_u_b0 < 0.5)) else ((1 - _n_u_b0) * 2)) * (0.5 + _n_k))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_k = _S.read(_parent,"k")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	return (_S.invoke(_n_p,"dot",[_n_x_b0, _n_y_b1, (_S.index_value(_n_C,5) if _S.truth((_n_i_b2 < 2)) else _S.index_value(_n_C,4)), (((1 - (float(_n_i_b2)/4)) * _n_k) * 1.4)]) if _S.truth((_n_i_b2 > 0)) else (_n_i_b2 > 0))
	return null
