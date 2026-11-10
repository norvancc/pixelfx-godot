@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/heal-aoe.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GREEN", _S.import_value("fx/holy/_lib.js", "GREEN"))
	_S.define(_e, "plus", _S.import_value("fx/holy/_lib.js", "plus"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Healing ring"}, {"desc": "A seed of green light sinks into the floor and a soft ring rolls out from it; the floor glows where it passes and plus signs sprout and float up."}, {"tags": ["holy", "heal", "aoe", "ring", "plus", "ground", "one-shot"]}, {"size": [256, 136]}, {"origin": [128, 104]}, {"duration": 2.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GREEN")}, {"reach": 104}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.2)
	_S.define(_e, "SEED", 0.3)
	_S.define(_e, "ROLL", 1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "wash", _S.function_value(_e, "_f1"))
	_S.define(_e, "ring", _S.function_value(_e, "_f3"))
	_S.define(_e, "sprouts", _S.function_value(_e, "_f7"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f8")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "front", _S.function_value(_e, "_f9"))
	_S.define(_e, "passed", _S.function_value(_e, "_f10"))
	_S.define(_e, "sites", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 26}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "riders", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fr_b1 = _S.call_value(_n_front,[_n_t])
	if _S.truth(((_n_fr_b1 < 2) if _S.truth((_n_fr_b1 < 2)) else (_n_t > 2.6))):
		return null
	_S.invoke(_n_p_b0,"shade",[((-_n_fr_b1) - 1), (((-_n_fr_b1) * _n_SY) - 1), (_n_fr_b1 + 1), ((_n_fr_b1 * _n_SY) + 1), _S.function_value(_S.capture(_parent,{"fr":_n_fr_b1,"this":_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_fr = _S.read(_parent,"fr")
	var _n_t = _S.read(_parent,"t")
	var _n_passed = _S.read(_parent,"passed")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([_n_x_b0, (float(_n_y_b1)/_n_SY)])
	if _S.truth((_n_d_b3 > _n_fr)):
		return null
	var _n_age_b4 = (_n_t - _S.call_value(_n_passed,[_n_d_b3]))
	var _n_k_b5 = ((exp((float((-_n_age_b4))/0.35)) * _S.MathFX.smooth(_n_fr,(_n_fr - 6),_n_d_b3)) * (1 - _S.MathFX.smooth(1.4,1.9,_n_t)))
	if _S.truth((_n_k_b5 < 0.04)):
		return null
	_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,4),"=")
	_S.set_prop(_n_out_b2,"k",(0.32 * _n_k_b5),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_SEED = _S.read(_parent,"SEED")
	var _n_ROLL = _S.read(_parent,"ROLL")
	var _n_front = _S.read(_parent,"front")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_oval = _S.read(_parent,"oval")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_riders = _S.read(_parent,"riders")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	if _S.truth((_n_t < _n_SEED)):
		return null
	var _n_u_b2 = _S.MathFX.seg(_n_t,_n_SEED,((_n_SEED + _n_ROLL) + 0.25))
	var _n_fr_b3 = _S.call_value(_n_front,[_n_t])
	var _n_k_b4 = (1 if _S.truth((_n_u_b2 < 0.7)) else (float((1 - _n_u_b2))/0.3))
	if _S.truth((_n_k_b4 <= 0)):
		return null
	var _n_keep_b5 = (_S.function_value(_S.capture(_parent,{"this":_this}),"_f4") if _S.truth(_n_back_b1) else _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"))
	_S.call_value(_n_band,[_n_p_b0, 0, 0, _n_fr_b3, _n_SY, maxf(2,(7 * (1 - (_n_u_b2 * 0.7)))), _n_k_b4, _S.invoke(_n_C,"slice",[2]), _n_keep_b5, (_n_t < (_n_SEED + 0.08))])
	_S.call_value(_n_oval,[_n_p_b0, 0, 0, (_n_fr_b3 + 1), ((_n_fr_b3 + 1) * _n_SY), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), (_n_k_b4 * (0.7 if _S.truth(_n_back_b1) else 1)), _n_keep_b5])
	if true:
		var _n_j_b6 = 0
		var _n_n_b7 = ceili((_n_fr_b3 * 0.9))
		while _S.truth((_n_j_b6 < _n_n_b7)):
			var _n_g_b8 = ((float(_n_j_b6)/_n_n_b7) * _n_TAU)
			var _n_near_b9 = (sin(_n_g_b8) >= 0)
			if _S.truth((_S.binary("===",_n_near_b9,_n_back_b1) if _S.truth(_S.binary("===",_n_near_b9,_n_back_b1)) else (_S.MathFX.rand([_n_j_b6,floori((_n_t * 20))]) > 0.45))):
				_n_j_b6 += 1.0
				continue
			var _n_x_b10 = (cos(_n_g_b8) * _n_fr_b3)
			var _n_y_b11 = ((sin(_n_g_b8) * _n_fr_b3) * _n_SY)
			var _n_h_b12 = (((1 + (_S.MathFX.rand([_n_j_b6,7]) * 4)) * _n_k_b4) * (1 if _S.truth(_n_near_b9) else 0.6))
			if true:
				var _n_i_b13 = 1
				while _S.truth((_n_i_b13 <= _n_h_b12)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b10, (_n_y_b11 - _n_i_b13), (_n_WHITE if _S.truth((_n_i_b13 > (_n_h_b12 - 1))) else _S.index_value(_n_C,6)), (_n_k_b4 * (1.2 - (float(_n_i_b13)/(_n_h_b12 + 1))))])
					_n_i_b13 += 1.0
			_n_j_b6 += 1.0
	for _iter_0 in _S.array(_n_riders):
		var _n_r_b14 = _iter_0
		var _n_g_b15 = (_S.named_value(_n_r_b14,"a") + ((_S.named_value(_n_r_b14,"w") * (_n_t - _n_SEED)) * 2.2))
		var _n_near_b16 = (sin(_n_g_b15) >= 0)
		if _S.truth(_S.binary("===",_n_near_b16,_n_back_b1)):
			continue
		var _n_x_b17 = (cos(_n_g_b15) * _n_fr_b3)
		var _n_y_b18 = ((sin(_n_g_b15) * _n_fr_b3) * _n_SY)
		if _S.truth(_n_near_b16):
			_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b17, (_n_y_b18 - 1), (2 + (1 if _S.truth((sin(((_n_t * 9) + (_S.named_value(_n_r_b14,"a") * 5))) > 0.3)) else 0)), _n_WHITE, _S.index_value(_n_C,6), (0.35 * _n_k_b4)])
		else:
			_S.invoke(_n_p_b0,"dot",[_n_x_b17, _n_y_b18, _S.index_value(_n_C,6), _n_k_b4])
	if _S.truth(not _S.truth(_n_back_b1)):
		if true:
			var _n_i_b19 = 0
			while _S.truth((_n_i_b19 < 8)):
				var _n_g_b20 = ((float(_n_i_b19)/8) * _n_TAU)
				_S.invoke(_n_p_b0,"glow",[(cos(_n_g_b20) * _n_fr_b3), (((sin(_n_g_b20) * _n_fr_b3) * _n_SY) - 2), 16, _S.index_value(_n_C,4), (0.22 * _n_k_b4)])
				_n_i_b19 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((sin(_n_g_b0) > 0.3)) else _S.index_value(_n_C,6))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_plus = _S.read(_parent,"plus")
	var _n_sites = _S.read(_parent,"sites")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array(_n_sites):
		var _n_s_b2 = _iter_0
		var _n_a_b3 = (_n_t - _S.named_value(_n_s_b2,"t0"))
		if _S.truth((((_n_a_b3 < 0) if _S.truth((_n_a_b3 < 0)) else (_n_a_b3 > _S.named_value(_n_s_b2,"life"))) if _S.truth(((_n_a_b3 < 0) if _S.truth((_n_a_b3 < 0)) else (_n_a_b3 > _S.named_value(_n_s_b2,"life")))) else _S.binary("!==",(_S.named_value(_n_s_b2,"z") < 0),_n_back_b1))):
			continue
		var _n_u_b4 = (float(_n_a_b3)/_S.named_value(_n_s_b2,"life"))
		var _n_h_b5 = (_S.named_value(_n_s_b2,"rise") * _S.invoke(_n_ease,"outCubic",[_n_u_b4]))
		var _n_x_b6 = (_S.named_value(_n_s_b2,"x") + ((sin(((_n_a_b3 * 4) + _S.named_value(_n_s_b2,"sway"))) * 1.5) * _n_u_b4))
		var _n_y_b7 = (((_S.named_value(_n_s_b2,"z") * _n_SY) - 2) - _n_h_b5)
		var _n_pop_b8 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_a_b3)/0.12),0.0,1.0), 2.6])
		var _n_end_b9 = (_S.named_value(_n_s_b2,"life") - 0.15)
		var _n_L_b10 = maxf(1,floori(((_S.named_value(_n_s_b2,"L") * _n_pop_b8) - (1 if _S.truth(_n_back_b1) else 0))+0.5))
		if _S.truth((_n_a_b3 < 0.04)):
			_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b6, _n_y_b7, 3, _n_WHITE, _S.index_value(_n_C,6), 0.5])
		else:
			if _S.truth((_n_a_b3 < _n_end_b9)):
				_S.call_value(_n_plus,[_n_p_b0, _n_x_b6, _n_y_b7, _n_L_b10, (1 if _S.truth(((_n_L_b10 < 3) if _S.truth(_n_back_b1) else _n_back_b1)) else _S.named_value(_n_s_b2,"thick")), (_S.invoke(_n_C,"slice",[0, 7]) if _S.truth(_n_back_b1) else _n_C), (0.8 if _S.truth(_n_back_b1) else 1), ((sin(((_n_a_b3 * 12) + (_S.named_value(_n_s_b2,"sway") * 3))) > 0.8) if _S.truth(not _S.truth(_n_back_b1)) else not _S.truth(_n_back_b1))])
			else:
				var _n_v_b11 = (float((_n_a_b3 - _n_end_b9))/0.15)
				for _iter_1 in _S.array([[1, 1], [1, (-1)], [(-1), 1], [(-1), (-1)]]):
					var _tuple_2 = _iter_1
					var _n_dx_b12 = _S.prop(_tuple_2,0)
					var _n_dy_b13 = _S.prop(_tuple_2,1)
					_S.invoke(_n_p_b0,"dot",[(_n_x_b6 + (_n_dx_b12 * (2 + (_n_v_b11 * 5)))), ((_n_y_b7 + (_n_dy_b13 * (2 + (_n_v_b11 * 5)))) - (_n_v_b11 * 2)), (_n_WHITE if _S.truth((_n_v_b11 < 0.4)) else _S.index_value(_n_C,6)), (1 - _n_v_b11)])
		if _S.truth((_n_u_b4 < 0.5)):
			if true:
				var _n_j_b14 = 1
				while _S.truth((_n_j_b14 < (_n_h_b5 * (1 - (_n_u_b4 * 2))))):
					_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b2,"x"), (((((_S.named_value(_n_s_b2,"z") * _n_SY) - 2) - _n_h_b5) + _n_j_b14) + 3), _S.index_value(_n_C,5), (((1 - (float(_n_j_b14)/_n_h_b5)) * (1 - (_n_u_b4 * 2))) * (0.5 if _S.truth(_n_back_b1) else 0.8))])
					_n_j_b14 += 1.5
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, (7 + (_n_L_b10 * 2)), _S.index_value(_n_C,5), ((0.2 if _S.truth(_n_back_b1) else 0.34) * (1 if _S.truth((_n_a_b3 < _n_end_b9)) else (1 - (float((_n_a_b3 - _n_end_b9))/0.15))))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_SEED = _S.read(_parent,"SEED")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ROLL = _S.read(_parent,"ROLL")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_tt_b0 < _n_SEED)) else (_n_REACH * _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_tt_b0,_n_SEED,(_n_SEED + _n_ROLL))])))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_SEED = _S.read(_parent,"SEED")
	var _n_ROLL = _S.read(_parent,"ROLL")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_SEED + (_n_ROLL * (1 - (signf((1 - minf(0.999,(float(_n_d_b0)/_n_REACH))))*pow(absf((1 - minf(0.999,(float(_n_d_b0)/_n_REACH)))),1.0/3)))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_passed = _S.read(_parent,"passed")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.invoke(_n_R,"range",[0, _n_TAU])
	var _n_d_b3 = (_n_REACH * sqrt(_S.invoke(_n_R,"range",[0.04, 0.92])))
	var _n_big_b4 = (fmod(_n_i_b1,5) < 2)
	return {"x":(cos(_n_a_b2) * _n_d_b3),"z":(sin(_n_a_b2) * _n_d_b3),"t0":(_S.call_value(_n_passed,[_n_d_b3]) + _S.invoke(_n_R,"range",[0, 0.06])),"rise":_S.invoke(_n_R,"range",[18, 34]),"life":_S.invoke(_n_R,"range",[0.9, 1.3]),"sway":_S.invoke(_n_R,"range",[0, _n_TAU]),"L":((3 + (1 if _S.truth(_S.binary("===",fmod(_n_i_b1,5),0)) else 0)) if _S.truth(_n_big_b4) else (1 if _S.truth(_S.binary("===",fmod(_n_i_b1,5),2)) else 2)),"thick":(3 if _S.truth(_n_big_b4) else 1),"popped":false}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_i_b1)/14) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.2), 0.2])),"w":(_S.invoke(_n_R,"range",[0.6, 1.1]) * (1 if _S.truth(fmod(_n_i_b1,2)) else (-1)))}
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SEED"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "D", _S.invoke(_S.read(_v16, "R"), "range", [24, 48]))
		_S.define(_v16, "x", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "D")))
		_S.define(_v16, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "D")), _S.read(_v16, "SY")), _S.invoke(_S.read(_v16, "R"), "range", [1, 8])))
		_S.define(_v16, "T", _S.invoke(_S.read(_v16, "R"), "range", [0.16, 0.24]))
		_S.define(_v16, "l", _S.logical("||", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), 3)]), func(): return 1))
		_S.define(_v16, "v", _S.binary("/", _S.binary("*", _S.read(_v16, "l"), 3), _S.binary("-", _S.invoke(_S.read(_v16, "Math"), "exp", [_S.binary("*", 3, _S.read(_v16, "T"))]), 1)))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STREAK"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v16, "x")), _S.read(_v16, "l")), _S.read(_v16, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.unary("-", 3), _S.read(_v16, "y")), _S.read(_v16, "l")), _S.read(_v16, "v")), _S.read(_v16, "T"), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "released")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SEED")))):
		var _v17 = _S.scope(_e)
		_S.write(_v17, "released", true, "=", false)
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 16), 76, _S.prop(_S.read(_v17, "C"), 5), 0.85, 0.55])
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 6), 28, _S.read(_v17, "WHITE"), 0.8, 0.12])
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 10)):
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "MOTE"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, 10])), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [80, 170])), _S.invoke(_S.read(_v18, "R"), "range", [0.3, 0.6]), (_S.read(_v18, "WHITE") if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.5])) else _S.prop(_S.read(_v18, "C"), 6)), _S.invoke(_S.read(_v18, "R"), "range", [0.6, 1])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v19 = _S.scope(_v17)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 16)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [_S.binary("*", _S.prop(_S.read(_v20, "Math"), "PI"), 1.05), _S.binary("*", _S.prop(_S.read(_v20, "Math"), "PI"), 1.95)]))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 120]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STAR"), 0, _S.unary("-", 3), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.4, 0.8]), (_S.read(_v20, "WHITE") if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 6)), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 2])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
	for _v21 in _S.array(_S.read(_e, "sites")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "s", _v21)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v22, "s"), "popped")), func(): return _S.binary(">=", _S.read(_v22, "t"), _S.prop(_S.read(_v22, "s"), "t0")))):
			var _v23 = _S.scope(_v22)
			_S.set_prop(_S.read(_v23, "s"), "popped", true, "=", false)
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v24, "i"), 3)):
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v24, "s"), "x"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v24, "s"), "z"), _S.read(_v24, "SY")), 1), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [15, 40])), _S.invoke(_S.read(_v24, "R"), "range", [0.3, 0.6]), (_S.read(_v24, "WHITE") if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.prop(_S.read(_v24, "C"), 6)), _S.invoke(_S.read(_v24, "R"), "range", [0.5, 1.2]), 0, (4 if _S.truth(_S.binary("<", _S.prop(_S.read(_v24, "s"), "z"), 0)) else 0)])
				_v24 = _S.iteration(_v24)
				_S.write(_v24, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SEED"), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), 1.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "fr", _S.call_value(_S.read(_v25, "front"), [_S.read(_v25, "t")]))
		_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
		_S.define(_v25, "d", _S.binary("*", _S.read(_v25, "fr"), _S.invoke(_S.read(_v25, "Math"), "sqrt", [_S.invoke(_S.read(_v25, "R"), "next", [])])))
		_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "d")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "d")), _S.read(_v25, "SY")), 1), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [10, 30])), _S.invoke(_S.read(_v25, "R"), "range", [0.5, 1]), _S.prop(_S.read(_v25, "C"), 5), 1, 0, (4 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), 0)) else 0)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_wash = _S.read(_parent,"wash")
	var _n_ring = _S.read(_parent,"ring")
	var _n_sprouts = _S.read(_parent,"sprouts")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_wash,[_n_p_b0])
	_S.call_value(_n_ring,[_n_p_b0, true])
	_S.call_value(_n_sprouts,[_n_p_b0, true])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_ring = _S.read(_parent,"ring")
	var _n_t = _S.read(_parent,"t")
	var _n_SEED = _S.read(_parent,"SEED")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_flare = _S.read(_parent,"flare")
	var _n_ease = _S.read(_parent,"ease")
	var _n_sprouts = _S.read(_parent,"sprouts")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_ring,[_n_p_b0, false])
	if _S.truth((_n_t < _n_SEED)):
		var _n_k_b2 = (float(_n_t)/_n_SEED)
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-3), (2 + ((4 * _n_k_b2) * _n_k_b2)), _n_WHITE, _S.index_value(_n_C,6), (0.3 + (0.4 * _n_k_b2))])
		_S.invoke(_n_p_b0,"glow",[0, (-3), (10 + (16 * _n_k_b2)), _S.index_value(_n_C,4), (0.5 * _n_k_b2)])
	else:
		if _S.truth((_n_t < (_n_SEED + 0.2))):
			_S.call_value(_n_flare,[_n_p_b0, 0, (-3), (22 * pow((1 - (float((_n_t - _n_SEED))/0.2)),1.5)), (1 - (float((_n_t - _n_SEED))/0.2)), _S.invoke(_n_C,"slice",[3])])
	var _n_g_b1 = _S.MathFX.seg(_n_t,_n_SEED,(_n_SEED + 0.5))
	if _S.truth(((_n_g_b1 < 1) if _S.truth((_n_g_b1 > 0)) else (_n_g_b1 > 0))):
		var _n_top_b3 = (((-4) - (46 * _S.invoke(_n_ease,"outCubic",[minf(1,(_n_g_b1 * 2.2))]))) - (10 * _n_g_b1))
		var _n_bot_b4 = ((-2) - (50 * _S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_g_b1,0.35,1)])))
		var _n_w_b5 = (1 + (2.4 * (1 - _n_g_b1)))
		if _S.truth(((_n_bot_b4 - _n_top_b3) > 2)):
			_S.invoke(_n_p_b0,"beam",[0, _n_bot_b4, 0, _n_top_b3, (_n_w_b5 * 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f16")])
			_S.invoke(_n_p_b0,"glowLine",[0, _n_bot_b4, 0, _n_top_b3, 12, _S.index_value(_n_C,5), (0.55 * (1 - _n_g_b1))])
			_S.call_value(_n_sparkle,[_n_p_b0, 0, _n_top_b3, ((4 * (1 - _n_g_b1)) + 1), _n_WHITE, _S.index_value(_n_C,6), (0.5 * (1 - _n_g_b1))])
	_S.call_value(_n_sprouts,[_n_p_b0, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth((_n_v_b1 < 0.45)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b0 > 0.8)) else _S.index_value(_n_C,6)))
	return null
