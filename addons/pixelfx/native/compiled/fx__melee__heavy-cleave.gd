@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/heavy-cleave.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "trace", _S.import_value("fx/melee/_lib.js", "trace"))
	_S.define(_e, "glowAlong", _S.import_value("fx/melee/_lib.js", "glowAlong"))
	_S.define(_e, "stone", _S.import_value("fx/melee/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/melee/_lib.js", "rock"))
	_S.define(_e, "cracks", _S.import_value("fx/melee/_lib.js", "cracks"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "along", _S.import_value("fx/melee/_lib.js", "along"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Heavy cleave"}, {"desc": "A glint over the head, then a thick ember arc accelerates over the top into the floor: a white slam, glowing cracks, dust rolling both ways, grit and rising embers."}, {"tags": ["melee", "slash", "cleave", "axe", "heavy", "ground", "fire", "combat", "directional", "one-shot"]}, {"size": [208, 116]}, {"origin": [68, 96]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0c10", "#5c1414", "#a3241a", "#e0481c", "#ff8a2a", "#ffc23d", "#fff0a0", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "greatsword"}, {"two": true}, {"sa": _S.unary("-", 1)}, {"fx": 11}, {"fy": _S.unary("-", 21)}]))
	_S.define(_e, "OVER", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}, {"crouch": 2}, {"lean": _S.unary("-", 2)}, {"fx": 1}, {"fy": _S.unary("-", 42)}, {"sa": _S.unary("-", 2.45)}, {"ffx": 8}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "FLOOR", _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"crouch": 7}, {"lean": 6}, {"fx": 17}, {"fy": _S.unary("-", 21)}, {"sa": 0.72}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 66}])}, {"poses": [[_S.unary("-", 0.42), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}])], [_S.unary("-", 0.3), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"fx": 13}, {"fy": _S.unary("-", 29)}, {"sa": _S.unary("-", 1.3)}])], [_S.unary("-", 0.12), _S.merge([_S.read(_e, "OVER"), {"crouch": 4}])], [0.2, _S.merge([_S.read(_e, "OVER"), {"crouch": 3}])], [0.27, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 1)}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"lean": 2}, {"fx": 11}, {"fy": _S.unary("-", 42)}, {"sa": _S.unary("-", 1.45)}, {"ffx": 10}, {"ghost": 1}]), "snap"], [0.31, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 1)}, {"crouch": 3}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 33)}, {"sa": _S.unary("-", 0.45)}, {"ffx": 12}, {"ghost": 1}]), "snap"], [0.335, _S.read(_e, "FLOOR"), "snap"], [0.85, _S.merge([_S.read(_e, "FLOOR"), {"crouch": 6}, {"lean": 5}])], [1.3, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 2)}, {"crouch": 4}, {"lean": 2}, {"fx": 15}, {"fy": _S.unary("-", 23)}, {"sa": 0.1}])], [1.7, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}])]]}, {"hits": [_S.merge([{"t": 0.335}, {"stop": 0.2}, {"shake": 0.34}, {"amp": 3}, {"push": 3.2}, {"straw": 28}, {"y": _S.unary("-", 8)}])]}, {"dust": [_S.merge([{"t": 0.335}, {"x": 18}, {"n": 8}, {"dir": 1}]), _S.merge([{"t": 0.335}, {"x": _S.unary("-", 12)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "RAISE", 0.2)
	_S.define(_e, "SWING", 0.135)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "RAISE"), _S.read(_e, "SWING")))
	_S.define(_e, "HOLD", 0.05)
	_S.define(_e, "TRAIL", 0.22)
	_S.define(_e, "head", _S.function_value(_e, "_f14"))
	_S.define(_e, "passedAt", _S.function_value(_e, "_f15"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 3}, {"cy": _S.unary("-", 22)}, {"R": 37}, {"sy": 0.88}, {"rot": 0.32}, {"a0": _S.unary("-", 2.45)}, {"dir": 1}])]))
	_S.define(_e, "U1", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.prop(_S.read(_e, "A"), "R"), _S.read(_e, "U1")]), 1), _S.unary("-", 0.5)), func(): return _S.binary("<", _S.read(_e, "U1"), 4))):
		_S.write(_e, "U1", 0.005, "+=", false)
	_S.define(_e, "E", _S.merge([_S.read(_e, "A"), {"R": _S.binary("*", _S.prop(_S.read(_e, "A"), "R"), 0.76)}]))
	_S.define(_e, "W", 16)
	_S.define(_e, "WE", 5)
	var _v0 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 2), _S.read(_e, "U1")])
	_S.define(_e, "X", _S.prop(_v0, 0))
	_S.define(_e, "GLINT", _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 3), 0]))
	_S.define(_e, "lines", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R"), _S.read(_e, "X"), 4, 40, 7, 0.4]))
	_S.define(_e, "spikes", _S.invoke([_S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), _S.unary("-", 2.7), _S.unary("-", 2.15), _S.unary("-", 1.62), _S.unary("-", 1.05), _S.unary("-", 0.45), 0], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "shards", _S.invoke([_S.unary("-", 2.5), _S.unary("-", 1.9), _S.unary("-", 1.2), _S.unary("-", 0.6)], "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "arc", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(_n_a_b0 + _S.invoke(_n_R,"range",[(-0.08), 0.08])),"len":((20 if _S.truth((_S.binary("===",_n_i_b1,0) if _S.truth(_S.binary("===",_n_i_b1,0)) else _S.binary("===",_n_i_b1,6))) else (15 if _S.truth(_S.binary("===",_n_i_b1,3)) else 9)) + _S.invoke(_n_R,"range",[0, 4])),"w":(1.6 + _S.invoke(_n_R,"range",[0, 0.6]))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_a_b0 = _S.arg(_args,0)
	return {"a":(_n_a_b0 + _S.invoke(_n_R,"range",[(-0.15), 0.15])),"r":(8 + _S.invoke(_n_R,"range",[0, 3])),"v":_S.invoke(_n_R,"range",[80, 130]),"arc":_S.invoke(_n_R,"range",[0.35, 0.6])}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_U1 = _S.read(_parent,"U1")
	var _n_head = _S.read(_parent,"head")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_TRAIL = _S.read(_parent,"TRAIL")
	var _n_this = _S.read(_parent,"this")
	var _n_smear = _S.read(_parent,"smear")
	var _n_C = _S.read(_parent,"C")
	var _n_glowAlong = _S.read(_parent,"glowAlong")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_w0_b2 = _S.arg(_args,2)
	var _n_lag_b3 = _S.arg(_args,3)
	var _n_rim_b4 = _S.arg(_args,4)
	var _n_tt_b5 = (_n_t - _n_lag_b3)
	var _n_U_b6 = (_n_U1 * _S.call_value(_n_head,[_n_tt_b5]))
	var _n_T_b7 = (_n_U1 * _S.MathFX.smooth((_n_HIT + _n_HOLD),((_n_HIT + _n_HOLD) + _n_TRAIL),_n_tt_b5))
	if _S.truth(((_n_U_b6 < 0.02) if _S.truth((_n_U_b6 < 0.02)) else (_n_T_b7 >= (_n_U_b6 - 0.02)))):
		return null
	var _n_gone_b8 = _S.MathFX.smooth((_n_HIT + _n_HOLD),((_n_HIT + _n_HOLD) + _n_TRAIL),_n_tt_b5)
	var _n_shrink_b9 = (1 - (0.75 * _n_gone_b8))
	_S.call_value(_n_smear,[_n_p_b0, _n_s_b1, _n_T_b7, _n_U_b6, _n_w0_b2, _S.function_value(_S.capture(_parent,{"tt":_n_tt_b5,"T":_n_T_b7,"U":_n_U_b6,"w0":_n_w0_b2,"shrink":_n_shrink_b9,"s":_n_s_b1,"rim":_n_rim_b4,"gone":_n_gone_b8,"this":_n_this}),"_f5")])
	if _S.truth(_n_rim_b4):
		_S.call_value(_n_glowAlong,[_n_p_b0, _n_s_b1, (_S.named_value(_n_s_b1,"R") - (_n_w0_b2 * 0.4)), _n_T_b7, _n_U_b6, (7 + (_n_w0_b2 * 0.5)), _S.index_value(_n_C,4), _S.function_value(_S.capture(_parent,{"tt":_n_tt_b5,"T":_n_T_b7,"U":_n_U_b6,"this":_n_this}),"_f6")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_tt = _S.read(_parent,"tt")
	var _n_passedAt = _S.read(_parent,"passedAt")
	var _n_U1 = _S.read(_parent,"U1")
	var _n_T = _S.read(_parent,"T")
	var _n_U = _S.read(_parent,"U")
	var _n_w0 = _S.read(_parent,"w0")
	var _n_shrink = _S.read(_parent,"shrink")
	var _n_s = _S.read(_parent,"s")
	var _n_rim = _S.read(_parent,"rim")
	var _n_n = _S.read(_parent,"n")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_C = _S.read(_parent,"C")
	var _n_gone = _S.read(_parent,"gone")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_age_b3 = maxf(0,(_n_tt - _S.call_value(_n_passedAt,[(float(_n_u_b0)/_n_U1)])))
	var _n_v_b4 = (float((_n_u_b0 - _n_T))/(_n_U - _n_T))
	var _n_w_b5 = ((_n_w0 * _n_shrink) * pow(sin((PI * pow(_n_v_b4,2.2))),0.6))
	if _S.truth((_n_w_b5 < 0.4)):
		return null
	var _n_q_b6 = (float((_S.named_value(_n_s,"R") - _n_r_b1))/_n_w_b5)
	if _S.truth(((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_q_b6 > 1))):
		return null
	var _n_ci_b7 = (0 if _S.truth(((_n_age_b3 < 0.12) if _S.truth(((_n_q_b6 < 0.22) if _S.truth(_n_rim) else _n_rim)) else ((_n_q_b6 < 0.22) if _S.truth(_n_rim) else _n_rim))) else floori(((((((_n_q_b6 * (_n_n - 1)) * 0.62) + (_n_age_b3 * 7)) + (maxf(0,(_n_tt - _n_HIT)) * 10)) - (_n_v_b4 * 0.8)) + (0.7 if _S.truth(_n_rim) else 1.7))+0.5))
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,((_n_n - 1) - clampf(_n_ci_b7,0,(_n_n - 1)))),"=")
	_S.set_prop(_n_out_b2,"a",(minf(1,(float(_n_v_b4)/0.35)) * (1.2 - _n_gone)),"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_tt = _S.read(_parent,"tt")
	var _n_passedAt = _S.read(_parent,"passedAt")
	var _n_U1 = _S.read(_parent,"U1")
	var _n_T = _S.read(_parent,"T")
	var _n_U = _S.read(_parent,"U")
	var _n_u_b0 = _S.arg(_args,0)
	return ((0.26 * exp((float((-maxf(0,(_n_tt - _S.call_value(_n_passedAt,[(float(_n_u_b0)/_n_U1)])))))/0.2))) * (float((_n_u_b0 - _n_T))/(_n_U - _n_T)))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "RAISE"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "D", _S.invoke(_S.read(_v1, "R"), "range", [14, 26]))
		_S.define(_v1, "T", _S.invoke(_S.read(_v1, "R"), "range", [0.14, 0.2]))
		_S.define(_v1, "v", _S.binary("/", _S.binary("*", _S.read(_v1, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v1, "Math"), "exp", [_S.binary("*", 3, _S.read(_v1, "T"))]), 1)))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "STREAK"), _S.binary("+", _S.prop(_S.read(_v1, "GLINT"), 0), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "D"))), _S.binary("+", _S.prop(_S.read(_v1, "GLINT"), 1), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")])), _S.read(_v1, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")])), _S.read(_v1, "v")), _S.read(_v1, "T"), (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.invoke(_S.read(_v1, "R"), "chance", [0.5])) else _S.prop(_S.read(_v1, "C"), 4))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RAISE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "u", _S.binary("*", _S.binary("*", _S.read(_v2, "U1"), _S.call_value(_S.read(_v2, "head"), [_S.read(_v2, "t")])), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1])))
		var _v3 = _S.call_value(_S.read(_v2, "onSwing"), [_S.read(_v2, "A"), _S.binary("-", _S.prop(_S.read(_v2, "A"), "R"), _S.invoke(_S.read(_v2, "R"), "range", [0, 6])), _S.read(_v2, "u")])
		_S.define(_v2, "x", _S.prop(_v3, 0))
		_S.define(_v2, "y", _S.prop(_v3, 1))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "EMBER"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v2, "R"), "range", [0.5, 1.1]), _S.prop(_S.read(_v2, "C"), 4), _S.invoke(_S.read(_v2, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "hit", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X"), _S.unary("-", 6), 26, _S.read(_v4, "WHITE"), 0.9, 0.1])
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X"), _S.unary("-", 12), 64, _S.prop(_S.read(_v4, "C"), 4), 0.5, 0.8])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 26)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v6, "Math"), "PI")), 2), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1.2), 1.35])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [140, 360]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.read(_v6, "X"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.15, 0.5])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 20)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v8, "i"), 2)) else 1))
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("+", _S.read(_v8, "X"), _S.binary("*", _S.read(_v8, "s"), _S.invoke(_S.read(_v8, "R"), "range", [0, 8]))), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 6])), _S.binary("*", _S.read(_v8, "s"), _S.invoke(_S.read(_v8, "R"), "range", [45, 135])), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 12])), _S.invoke(_S.read(_v8, "R"), "range", [1, 1.45]), _S.prop(_S.read(_v8, "st"), "dust"), _S.invoke(_S.read(_v8, "R"), "range", [5, 8.5]), _S.invoke(_S.read(_v8, "R"), "range", [0, 0.07]), _S.prop(_S.read(_v8, "PF"), "BIG")])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		var _v9 = _S.scope(_v4)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 4)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SMOKE"), _S.binary("+", _S.read(_v9, "X"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [3, 8])), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [40, 90])), _S.invoke(_S.read(_v9, "R"), "range", [1, 1.45]), _S.prop(_S.read(_v9, "st"), "dust"), _S.invoke(_S.read(_v9, "R"), "range", [4, 6.5]), _S.invoke(_S.read(_v9, "R"), "range", [0.02, 0.1]), _S.prop(_S.read(_v9, "PF"), "BIG")])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v10 = _S.scope(_v4)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 8)):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.binary("+", _S.read(_v10, "X"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [1, 4])), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [8, 30])), _S.invoke(_S.read(_v10, "R"), "range", [0.35, 0.7]), _S.prop(_S.read(_v10, "st"), "dust"), _S.invoke(_S.read(_v10, "R"), "range", [2, 3.5])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v11 = _S.scope(_v4)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 44)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 0.7), 1])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [60, 230]))
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "GRIT"), _S.binary("+", _S.read(_v12, "X"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.invoke(_S.read(_v12, "R"), "range", [1, 1.5]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "st"), "light"), _S.prop(_S.read(_v12, "st"), "body"), _S.prop(_S.read(_v12, "st"), "body"), _S.prop(_S.read(_v12, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.35])) else 1)])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v4)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 6)):
			_S.invoke(_S.read(_v13, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v13, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v13, "X"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [120, 260]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v13, "R"), "range", [1.15, 1.5])}, {"a": _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")])}, {"va": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v13, "R"), "int", [1, 2])}])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v14 = _S.scope(_v4)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 16)):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "EMBER"), _S.binary("+", _S.read(_v14, "X"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [1, 6])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 50), 60]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [30, 110])), _S.invoke(_S.read(_v14, "R"), "range", [0.7, 1.5]), _S.prop(_S.read(_v14, "C"), 4), _S.invoke(_S.read(_v14, "R"), "range", [1, 2])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "hit"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.6))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "c", _S.invoke(_S.read(_v15, "R"), "pick", [_S.read(_v15, "lines")]))
		_S.define(_v15, "pt", _S.invoke(_S.read(_v15, "R"), "pick", [_S.prop(_S.read(_v15, "c"), "pts")]))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "EMBER"), _S.prop(_S.read(_v15, "pt"), 0), _S.binary("-", _S.prop(_S.read(_v15, "pt"), 1), 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [20, 50])), _S.invoke(_S.read(_v15, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v15, "C"), 4), 1])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v16 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "b", _v16)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v17, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v17, "b"), "dusted")))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "b"), "dusted", true, "=", false)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 2)):
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v19, "b"), "x"), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v19, "R"), "sign", []), _S.invoke(_S.read(_v19, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 12])), _S.invoke(_S.read(_v19, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v19, "st"), "dust"), _S.invoke(_S.read(_v19, "R"), "range", [1.3, 2.4])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_X = _S.read(_parent,"X")
	var _n_C = _S.read(_parent,"C")
	var _n_st = _S.read(_parent,"st")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = (_n_t - _n_HIT)
	if _S.truth((_n_q_b1 >= 0)):
		var _n_fade_b2 = (1 - _S.MathFX.smooth(1,1.5,_n_q_b1))
		if true:
			var _n_y_b4 = 0
			while _S.truth((_n_y_b4 <= 2)):
				if true:
					var _n_x_b5 = (-9)
					while _S.truth((_n_x_b5 <= 9)):
						var _n_d_b6 = _S.Bridge.hypot([(float((_n_x_b5 + 0.5))/9), (float((_n_y_b4 + 0.5))/3.5)])
						if _S.truth((_n_d_b6 > 1)):
							_n_x_b5 += 1.0
							continue
						var _n_T_b7 = ((pow(clampf((1 - (float(_n_q_b1)/0.8)),0.0,1.0),1.4) * (1.2 - _n_d_b6)) - (_S.MathFX.rand([_n_x_b5,_n_y_b4,3]) * 0.3))
						if _S.truth((_n_T_b7 > 0.08)):
							_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b5), _n_y_b4, _S.index_value(_n_C,clampf(floori((_n_T_b7 * 9)+0.5),1,7)), _n_fade_b2])
						else:
							_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b5), _n_y_b4, (_S.named_value(_n_st,"dark") if _S.truth((_n_d_b6 < 0.5)) else _S.named_value(_n_st,"shade")), ((1 if _S.truth((_n_d_b6 < (0.9 - (_S.MathFX.rand([_n_x_b5,_n_y_b4,9]) * 0.3)))) else (1 - _n_d_b6)) * _n_fade_b2)])
						_n_x_b5 += 1.0
				_n_y_b4 += 1.0
		var _n_k_b3 = (float(_n_q_b1)/0.45)
		if _S.truth((_n_k_b3 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_X, 0.5, (6 + (46 * _S.invoke(_n_ease,"outCubic",[_n_k_b3]))), 0.16, maxf(1,(3 * (1 - _n_k_b3))), (1.15 - _n_k_b3), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_C,4), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_RAISE = _S.read(_parent,"RAISE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_GLINT = _S.read(_parent,"GLINT")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_along = _S.read(_parent,"along")
	var _n_lines = _S.read(_parent,"lines")
	var _n_X = _S.read(_parent,"X")
	var _n_st = _S.read(_parent,"st")
	var _n_band = _S.read(_parent,"band")
	var _n_arc = _S.read(_parent,"arc")
	var _n_E = _S.read(_parent,"E")
	var _n_WE = _S.read(_parent,"WE")
	var _n_A = _S.read(_parent,"A")
	var _n_W = _S.read(_parent,"W")
	var _n_U1 = _S.read(_parent,"U1")
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_TRAIL = _S.read(_parent,"TRAIL")
	var _n_trace = _S.read(_parent,"trace")
	var _n_head = _S.read(_parent,"head")
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_star = _S.read(_parent,"star")
	var _n_sliver = _S.read(_parent,"sliver")
	var _n_shards = _S.read(_parent,"shards")
	var _n_rock = _S.read(_parent,"rock")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = (_n_t - _n_HIT)
	if _S.truth((_n_t < (_n_RAISE + 0.03))):
		var _n_g_b4 = ((_S.invoke(_n_ease,"outBack",[clampf((float(_n_t)/0.1),0.0,1.0)]) * (1 + (0.15 * sin((_n_t * 60))))) * ((1 - (float((_n_t - _n_RAISE))/0.03)) if _S.truth((_n_t > _n_RAISE)) else 1))
		_S.call_value(_n_sparkle,[_n_p_b0, _S.index_value(_n_GLINT,0), _S.index_value(_n_GLINT,1), (1 + (7 * _n_g_b4)), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.5])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_GLINT,0), _S.index_value(_n_GLINT,1), 22, _S.index_value(_n_C,4), (0.3 * _n_g_b4)])
	if _S.truth((_n_q_b1 >= 0)):
		var _n_heat_b5 = pow(clampf((1 - (float(_n_q_b1)/1.2)),0.0,1.0),1.2)
		var _n_fade_b6 = (1 - _S.MathFX.smooth(1.15,1.5,_n_q_b1))
		for _iter_0 in _S.array(_n_lines):
			var _n_c_b8 = _iter_0
			var _n_reach_b9 = ((40 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_q_b1 - (_S.named_value(_n_c_b8,"at") * 0.1)))/0.13),0.0,1.0)])) * (0.3 if _S.truth(_S.named_value(_n_c_b8,"fork")) else 1))
			if _S.truth((_n_reach_b9 <= 0)):
				continue
			_S.call_value(_n_along,[_S.named_value(_n_c_b8,"pts"), _n_reach_b9, _S.function_value(_S.capture(_parent,{"heat":_n_heat_b5,"c":_n_c_b8,"p":_n_p_b0,"fade":_n_fade_b6,"this":_this}),"_f11")])
		if _S.truth((_n_heat_b5 > 0)):
			_S.invoke(_n_p_b0,"glow",[_n_X, (-2), 34, _S.index_value(_n_C,4), ((0.32 * _n_heat_b5) * _n_fade_b6)])
		var _n_k_b7 = (float(_n_q_b1)/0.45)
		if _S.truth((_n_k_b7 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_X, 0.5, (6 + (46 * _S.invoke(_n_ease,"outCubic",[_n_k_b7]))), 0.16, maxf(1,(3 * (1 - _n_k_b7))), (1.15 - _n_k_b7), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_C,4), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	_S.call_value(_n_arc,[_n_p_b0, _n_E, _n_WE, 0.02, false])
	_S.call_value(_n_arc,[_n_p_b0, _n_A, _n_W, 0, true])
	var _n_tail_b2 = (_n_U1 * _S.MathFX.smooth((_n_HIT + _n_HOLD),((_n_HIT + _n_HOLD) + _n_TRAIL),_n_t))
	var _n_th_b3 = (0.8 * (1 - clampf((float(((_n_t - _n_HIT) - _n_HOLD))/(_n_TRAIL + 0.25)),0.0,1.0)))
	if _S.truth(((_n_th_b3 > 0) if _S.truth((_n_tail_b2 > 0.02)) else (_n_tail_b2 > 0.02))):
		_S.call_value(_n_trace,[_n_p_b0, _n_A, (_S.named_value(_n_A,"R") - 0.5), 0, _n_tail_b2, _S.index_value(_n_C,3), _S.function_value(_S.capture(_parent,{"th":_n_th_b3,"this":_this}),"_f13")])
	if _S.truth(((_n_t < (_n_HIT + 0.05)) if _S.truth((_n_t > _n_RAISE)) else (_n_t > _n_RAISE))):
		var _tuple_1 = _S.call_value(_n_onSwing,[_n_A, (_S.named_value(_n_A,"R") - 5), (_n_U1 * _S.call_value(_n_head,[_n_t]))])
		var _n_x_b10 = _S.prop(_tuple_1,0)
		var _n_y_b11 = _S.prop(_tuple_1,1)
		_S.invoke(_n_p_b0,"glow",[_n_x_b10, _n_y_b11, 40, _S.index_value(_n_C,4), 0.5])
	if _S.truth(((_n_q_b1 < 0.035) if _S.truth((_n_q_b1 >= 0)) else (_n_q_b1 >= 0))):
		_S.call_value(_n_star,[_n_p_b0, _n_X, (-1), _n_spikes, 1, 1, _n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,7), _S.index_value(_n_C,5)])
	else:
		if _S.truth(((_n_q_b1 < 0.07) if _S.truth((_n_q_b1 >= 0.035)) else (_n_q_b1 >= 0.035))):
			_S.call_value(_n_star,[_n_p_b0, _n_X, (-1), _n_spikes, 1.25, 0.55, _S.index_value(_n_C,7), _S.index_value(_n_C,6), _S.index_value(_n_C,6), _S.index_value(_n_C,4)])
	if _S.truth(((_n_q_b1 < 0.16) if _S.truth((_n_q_b1 >= 0.05)) else (_n_q_b1 >= 0.05))):
		var _n_k_b12 = (float((_n_q_b1 - 0.05))/0.11)
		for _iter_2 in _S.array(_n_shards):
			var _n_s_b13 = _iter_2
			_S.call_value(_n_sliver,[_n_p_b0, _n_X, (-1), _S.named_value(_n_s_b13,"a"), (_S.named_value(_n_s_b13,"r") + (_S.named_value(_n_s_b13,"v") * (_n_q_b1 - 0.05))), (_S.named_value(_n_s_b13,"arc") * (1 - (0.4 * _n_k_b12))), (_S.index_value(_n_C,6) if _S.truth((_n_k_b12 < 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b12 < 0.7)) else _S.index_value(_n_C,4))), (1 - _n_k_b12)])
	if _S.truth(((_n_q_b1 < 0.2) if _S.truth((_n_q_b1 >= 0)) else (_n_q_b1 >= 0))):
		var _n_pop_b14 = exp((float((-_n_q_b1))/0.05))
		_S.invoke(_n_p_b0,"glow",[_n_X, (-6), 30, _S.index_value(_n_C,5), (0.8 * _n_pop_b14)])
		_S.invoke(_n_p_b0,"glow",[_n_X, (-2), 10, _n_WHITE, (0.7 * _n_pop_b14)])
	for _iter_3 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b15 = _iter_3
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b15, _n_st])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_heat = _S.read(_parent,"heat")
	var _n_c = _S.read(_parent,"c")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_st = _S.read(_parent,"st")
	var _n_p = _S.read(_parent,"p")
	var _n_fade = _S.read(_parent,"fade")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_d_b4 = _S.arg(_args,4)
	var _n_h_b5 = ((_n_heat * (1 - (float(_n_d_b4)/46))) - (0.12 if _S.truth(_S.named_value(_n_c,"fork")) else 0))
	var _n_col_b6 = (_n_WHITE if _S.truth((_n_h_b5 > 0.72)) else (_S.index_value(_n_C,clampf(floori((_n_h_b5 * 8)+0.5),1,6)) if _S.truth((_n_h_b5 > 0.08)) else _S.named_value(_n_st,"dark")))
	if _S.truth((_n_y1_b3 > 0.5)):
		_S.invoke(_n_p,"line",[(_n_x0_b0 + 1), _n_y0_b1, (_n_x1_b2 + 1), _n_y1_b3, _S.named_value(_n_st,"dark"), _n_fade])
	_S.invoke(_n_p,"line",[_n_x0_b0, _n_y0_b1, _n_x1_b2, _n_y1_b3, _n_col_b6, _n_fade])
	if _S.truth(((fmod(_S.binary("|",_n_d_b4,0),6) < 2) if _S.truth((_n_h_b5 > 0.25)) else (_n_h_b5 > 0.25))):
		_S.invoke(_n_p,"glow",[_n_x1_b2, _n_y1_b3, 6, _S.index_value(_n_C,4), ((0.2 * _n_h_b5) * _n_fade)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_th = _S.read(_parent,"th")
	var _n_U1 = _S.read(_parent,"U1")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_th * (0.4 + (float((0.6 * _n_u_b0))/_n_U1)))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_RAISE = _S.read(_parent,"RAISE")
	var _n_SWING = _S.read(_parent,"SWING")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.invoke(_n_ease,"inQuad",[clampf((float((_n_t_b0 - _n_RAISE))/_n_SWING),0.0,1.0)])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_RAISE = _S.read(_parent,"RAISE")
	var _n_SWING = _S.read(_parent,"SWING")
	var _n_f_b0 = _S.arg(_args,0)
	return (_n_RAISE + (_n_SWING * sqrt(clampf(_n_f_b0,0.0,1.0))))
	return null
