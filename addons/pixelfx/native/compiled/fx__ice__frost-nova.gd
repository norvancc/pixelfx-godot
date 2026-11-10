@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/frost-nova.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"nova_frost","_f8":"nova_crystals","_f9":"nova_ring","_f13":"nova_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "crystal", _S.import_value("core/index.js", "crystal"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "frost", _S.function_value(_e, "_f0"))
	_S.define(_e, "snowflake", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Frost nova"}, {"desc": "Frost spirals into a spinning snowflake, then a wave blooms three rings of ice crystals round the caster; snow drifts, frost creeps, and the ice melts back into the floor."}, {"tags": ["ice", "nova", "aoe", "frost", "magic", "one-shot"]}, {"size": [288, 192]}, {"origin": [144, 150]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"reach": 104}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIGH", _S.merge([{"turn": 1.15}, {"crouch": 0}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "SLAM", _S.merge([{"turn": 1.15}, {"crouch": 8}, {"lean": 3}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 8)}, {"bx": 11}, {"by": _S.unary("-", 8)}, {"ffx": _S.unary("-", 8)}, {"fbx": 9}]))
	_S.define(_e, "EASE", _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 76}])}, {"poses": [[_S.unary("-", 0.34), _S.read(_e, "READY")], [_S.unary("-", 0.04), _S.merge([_S.read(_e, "HIGH"), {"crouch": 2}, {"fy": _S.unary("-", 36)}, {"by": _S.unary("-", 36)}])], [0.36, _S.read(_e, "HIGH")], [0.42, _S.read(_e, "SLAM"), "snap"], [0.9, _S.merge([_S.read(_e, "SLAM"), {"crouch": 7}])], [1.9, _S.merge([_S.read(_e, "SLAM"), {"crouch": 6}])], [2.6, _S.read(_e, "EASE")], [3.4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.42}, {"stop": 0.1}, {"shake": 0.26}, {"amp": 2}, {"target": false}]), _S.merge([{"t": 0.66}, {"push": 0.9}, {"straw": 6}, {"y": _S.unary("-", 10)}, {"skin": "ice"}, {"shiver": 1.7}]), _S.merge([{"t": 2.9}, {"push": 0.2}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": 0.42}, {"x": 10}, {"n": 5}, {"dir": 1}, {"c": "#d8f2ff"}]), _S.merge([{"t": 0.42}, {"x": _S.unary("-", 10)}, {"n": 5}, {"dir": _S.unary("-", 1)}, {"c": "#d8f2ff"}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CHARGE", 0.42)
	_S.define(_e, "SPREAD", 0.62)
	_S.define(_e, "HOLD", 1.95)
	_S.define(_e, "MELT", 0.7)
	_S.define(_e, "CORE_Y", _S.unary("-", 24))
	_S.define(_e, "RINGS", [_S.merge([{"q": [0.15, 0.24]}, {"h": [24, 32]}, {"w": [10, 13]}, {"n": 2}, {"kids": 2}]), _S.merge([{"q": [0.36, 0.52]}, {"h": [13, 19]}, {"w": [7, 9]}, {"n": 3}, {"kids": 1}]), _S.merge([{"q": [0.62, 0.9]}, {"h": [5, 10]}, {"w": [4, 6]}, {"n": 4}, {"kids": 0}])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_reach_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_edge_b6 = _S.arg(_args,6)
	if true:
		var _n_x_b7 = floori(_n_x0_b2)
		while _S.truth((_n_x_b7 <= ceili(_n_x1_b3))):
			var _n_d_b8 = absf((_n_x_b7 + 0.5))
			var _n_q_b9 = (float(_n_d_b8)/_n_reach_b4)
			var _n_k_b10 = clampf((float(((_n_a_b5 * 1.15) - _n_q_b9))/0.15),0.0,1.0)
			if _S.truth((_n_k_b10 <= 0)):
				_n_x_b7 += 1.0
				continue
			var _n_h_b11 = _S.MathFX.rand([_n_x_b7,17])
			var _n_fresh_b12 = ((_n_d_b8 > (_n_edge_b6 - 3)) if _S.truth((_n_edge_b6 > 0)) else (_n_edge_b6 > 0))
			var _n_tuft_b13 = (floori(((1 + (_S.MathFX.rand([_n_x_b7,5]) * 3)) * (1 - (_n_q_b9 * 0.6)))+0.5) if _S.truth((_n_h_b11 < 0.45)) else 0)
			var _n_D_b14 = ((4 + (_S.MathFX.rand([_n_x_b7,11]) * 4)) * (1 - (_n_q_b9 * 0.5)))
			_S.invoke(_n_p_b0,"dot",[_n_x_b7, 0, (_n_WHITE if _S.truth((_n_fresh_b12 if _S.truth(_n_fresh_b12) else (_n_h_b11 < 0.25))) else _S.index_value(_n_C_b1,6)), _n_k_b10])
			if true:
				var _n_j_b15 = 1
				while _S.truth((_n_j_b15 <= _n_tuft_b13)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b7, (-_n_j_b15), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b15,_n_tuft_b13)) else _S.index_value(_n_C_b1,5)), _n_k_b10])
					_n_j_b15 += 1.0
			if _S.truth(((_S.MathFX.rand([_n_x_b7,9]) < 0.5) if _S.truth((_n_tuft_b13 > 1)) else (_n_tuft_b13 > 1))):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b7 + ((-1) if _S.truth((_S.MathFX.rand([_n_x_b7,3]) < 0.5)) else 1)), ((-_n_tuft_b13) + 1), _S.index_value(_n_C_b1,6), _n_k_b10])
			if true:
				var _n_j_b16 = 1
				while _S.truth((_n_j_b16 <= _n_D_b14)):
					var _n_v_b17 = (float(_n_j_b16)/_n_D_b14)
					_S.invoke(_n_p_b0,"dot",[_n_x_b7, _n_j_b16, (_n_WHITE if _S.truth((_S.MathFX.rand([((_n_x_b7 * 31) + _n_j_b16),7]) < 0.06)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_v_b17 < 0.25)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_v_b17 < 0.55)) else _S.index_value(_n_C_b1,4)))), ((_n_k_b10 * (1.1 - _n_v_b17)) * (1.3 if _S.truth(_n_fresh_b12) else 1))])
					_n_j_b16 += 1.0
			_n_x_b7 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_spin_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth((_n_L_b4 < 0.8)):
		return null
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 6)):
			var _n_a_b8 = (_n_spin_b5 + (float((_n_i_b7 * _n_TAU))/6))
			var _n_ca_b9 = cos(_n_a_b8)
			var _n_sa_b10 = sin(_n_a_b8)
			if true:
				var _n_d_b11 = 0
				while _S.truth((_n_d_b11 <= _n_L_b4)):
					_S.invoke(_n_p_b0,"dot",[(_n_x_b2 + (_n_ca_b9 * _n_d_b11)), (_n_y_b3 + (_n_sa_b10 * _n_d_b11)), (_n_WHITE if _S.truth((_n_d_b11 < (_n_L_b4 * 0.4))) else _S.index_value(_n_C_b1,6)), (_n_k_b6 + 0.2)])
					_n_d_b11 += 0.5
			if _S.truth((_n_L_b4 > 3)):
				for _iter_0 in _S.array([(-1), 1]):
					var _n_s_b12 = _iter_0
					var _n_bx_b13 = (_n_x_b2 + ((_n_ca_b9 * _n_L_b4) * 0.6))
					var _n_by_b14 = (_n_y_b3 + ((_n_sa_b10 * _n_L_b4) * 0.6))
					var _n_ba_b15 = (_n_a_b8 + (_n_s_b12 * 0.9))
					if true:
						var _n_d_b16 = 0
						while _S.truth((_n_d_b16 <= (_n_L_b4 * 0.35))):
							_S.invoke(_n_p_b0,"dot",[(_n_bx_b13 + (cos(_n_ba_b15) * _n_d_b16)), (_n_by_b14 + (sin(_n_ba_b15) * _n_d_b16)), _S.index_value(_n_C_b1,5), _n_k_b6])
							_n_d_b16 += 0.5
			_n_i_b7 += 1.0
	_S.invoke(_n_p_b0,"px",[_n_x_b2, _n_y_b3, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, (10 + (_n_L_b4 * 3)), _S.index_value(_n_C_b1,5), (0.35 + (0.5 * _n_k_b6))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "front", _S.function_value(_e, "_f4"))
	_S.define(_e, "reachedAt", _S.function_value(_e, "_f5"))
	_S.define(_e, "sites", [])
	for _v12 in _S.array([_S.unary("-", 1), 1]):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "side", _v12)
		_S.invoke(_S.read(_v13, "RINGS"), "forEach", [_S.function_value(_v13, "_f6")])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "sink", _S.function_value(_e, "_f7"))
	_S.define(_e, "drawCrystals", _S.function_value(_e, "_f8"))
	_S.define(_e, "ring", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < _n_CHARGE)) else (_n_REACH * (1 - pow((1 - clampf((float((_n_t_b0 - _n_CHARGE))/_n_SPREAD),0.0,1.0)),3))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_CHARGE + (_n_SPREAD * (1 - (signf((1 - minf(1,(float(_n_d_b0)/_n_REACH))))*pow(absf((1 - minf(1,(float(_n_d_b0)/_n_REACH)))),1.0/3)))))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ring", _S.arg(_args, 0))
	_S.define(_e, "ri", _S.arg(_args, 1))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.prop(_S.read(_v14, "ring"), "n"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "q", _S.binary("+", _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 1), _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 0)), _S.binary("+", _S.read(_v15, "i"), _S.invoke(_S.read(_v15, "R"), "range", [0.2, 0.8]))), _S.prop(_S.read(_v15, "ring"), "n"))))
		_S.define(_v15, "h", _S.invoke(_S.read(_v15, "R"), "range", _S.concat([_S.array(_S.prop(_S.read(_v15, "ring"), "h"))])))
		_S.define(_v15, "w", _S.invoke(_S.read(_v15, "R"), "range", _S.concat([_S.array(_S.prop(_S.read(_v15, "ring"), "w"))])))
		_S.define(_v15, "parts", [_S.merge([{"dx": 0}, {"h": _S.read(_v15, "h")}, {"w": _S.read(_v15, "w")}, {"lean": _S.binary("*", _S.binary("*", _S.read(_v15, "side"), _S.read(_v15, "h")), _S.invoke(_S.read(_v15, "R"), "range", [0.1, 0.28]))}])])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "k"), _S.prop(_S.read(_v16, "ring"), "kids"))):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "s", (_S.unary("-", _S.read(_v17, "side")) if _S.truth(_S.binary("%", _S.read(_v17, "k"), 2)) else _S.read(_v17, "side")))
			_S.define(_v17, "kh", _S.binary("*", _S.read(_v17, "h"), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 0.62])))
			_S.invoke(_S.read(_v17, "parts"), "unshift", [_S.merge([{"dx": _S.binary("*", _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.5])), _S.read(_v17, "w"))}, {"h": _S.read(_v17, "kh")}, {"w": _S.binary("*", _S.read(_v17, "w"), 0.62)}, {"lean": _S.binary("*", _S.binary("*", _S.read(_v17, "s"), _S.read(_v17, "kh")), _S.invoke(_S.read(_v17, "R"), "range", [0.35, 0.6]))}])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "k", 1, "+=", true)
		_S.invoke(_S.read(_v15, "sites"), "push", [_S.merge([{"x": _S.binary("*", _S.binary("*", _S.read(_v15, "side"), _S.read(_v15, "q")), _S.read(_v15, "REACH"))}, {"d": _S.binary("*", _S.read(_v15, "q"), _S.read(_v15, "REACH"))}, {"h": _S.read(_v15, "h")}, {"back": _S.binary("===", _S.binary("%", _S.binary("+", _S.binary("+", _S.read(_v15, "i"), _S.read(_v15, "ri")), (1 if _S.truth(_S.binary(">", _S.read(_v15, "side"), 0)) else 0)), 2), 1)}, {"t0": _S.binary("+", _S.call_value(_S.read(_v15, "reachedAt"), [_S.binary("*", _S.read(_v15, "q"), _S.read(_v15, "REACH"))]), _S.invoke(_S.read(_v15, "R"), "range", [0, 0.03]))}, {"up": false}, {"parts": _S.read(_v15, "parts")}, {"phase": _S.invoke(_S.read(_v15, "R"), "next", [])}])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_tt_b0 = _S.arg(_args,0)
	return _S.MathFX.smooth(_n_HOLD,(_n_HOLD + _n_MELT),_n_tt_b0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_sink = _S.read(_parent,"sink")
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_DIM = _S.read(_parent,"DIM")
	var _n_C = _S.read(_parent,"C")
	var _n_crystal = _S.read(_parent,"crystal")
	var _n_sites = _S.read(_parent,"sites")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.call_value(_n_sink,[_n_t])
	for _iter_0 in _S.array(_n_sites):
		var _n_s_b3 = _iter_0
		if _S.truth(((not _S.truth(_S.named_value(_n_s_b3,"up")) if _S.truth(not _S.truth(_S.named_value(_n_s_b3,"up"))) else _S.binary("!==",_S.named_value(_n_s_b3,"back"),_n_back_b1)) if _S.truth((not _S.truth(_S.named_value(_n_s_b3,"up")) if _S.truth(not _S.truth(_S.named_value(_n_s_b3,"up"))) else _S.binary("!==",_S.named_value(_n_s_b3,"back"),_n_back_b1))) else (_n_m_b2 >= 1))):
			continue
		var _n_g_b4 = _S.invoke(_n_ease,"outBack",[clampf((float((_n_t - _S.named_value(_n_s_b3,"t0")))/0.1),0.0,1.0), 2.6])
		var _n_white_b5 = (_n_t < (_S.named_value(_n_s_b3,"t0") + 0.03))
		var _n_sw_b6 = (float(fmod((((_n_t - _S.named_value(_n_s_b3,"t0")) * 0.7) + (_S.named_value(_n_s_b3,"phase") * 3)),1.6))/0.5)
		for _iter_1 in _S.array(_S.named_value(_n_s_b3,"parts")):
			var _n_q_b7 = _iter_1
			_S.call_value(_n_crystal,[_n_p_b0, (_S.named_value(_n_s_b3,"x") + _S.named_value(_n_q_b7,"dx")), ((-1) if _S.truth(_n_back_b1) else 0), ((_S.named_value(_n_q_b7,"h") * _n_g_b4) * (1 - _n_m_b2)), (_S.named_value(_n_q_b7,"w") * (1 - (_n_m_b2 * 0.3))), ((_S.named_value(_n_q_b7,"lean") * _n_g_b4) * (1 - _n_m_b2)), (_n_DIM if _S.truth(_n_back_b1) else _n_C), {"white":_n_white_b5,"glint":(_n_sw_b6 if _S.truth((_n_sw_b6 <= 1)) else (-1))}])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_front = _S.read(_parent,"front")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	if _S.truth((_n_t < _n_CHARGE)):
		return null
	var _n_u_b2 = clampf((float((_n_t - _n_CHARGE))/(_n_SPREAD + 0.15)),0.0,1.0)
	if _S.truth((_n_u_b2 >= 1)):
		return null
	_S.call_value(_n_band,[_n_p_b0, 0, 0, (_S.call_value(_n_front,[_n_t]) + 2), 0.16, maxf(2,(10 * pow((1 - _n_u_b2),0.7))), (1 if _S.truth((_n_u_b2 < 0.75)) else (float((1 - _n_u_b2))/0.25)), _n_C, _S.function_value(_S.capture(_parent,{"back":_n_back_b1,"this":_n_this}),"_f10"), ((_n_t - _n_CHARGE) < 0.1)])
	if _S.truth(not _S.truth(_n_back_b1)):
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b3 = _iter_0
			_S.invoke(_n_p_b0,"glow",[(_n_s_b3 * (_S.call_value(_n_front,[_n_t]) + 2)), (-2), 22, _S.index_value(_n_C,5), (0.55 * (1 - _n_u_b2))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_back)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CHARGE"), 0.06))):
		var _v25 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.9])):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")]))
			_S.define(_v26, "D", _S.invoke(_S.read(_v26, "R"), "range", [26, 58]))
			_S.define(_v26, "T", _S.invoke(_S.read(_v26, "R"), "range", [0.2, 0.3]))
			_S.define(_v26, "v", _S.binary("/", _S.binary("*", _S.read(_v26, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v26, "Math"), "exp", [_S.binary("*", 3, _S.read(_v26, "T"))]), 1)))
			_S.define(_v26, "x", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "D")))
			_S.define(_v26, "y", _S.invoke(_S.read(_v26, "Math"), "min", [_S.binary("+", _S.read(_v26, "CORE_Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "D")), 0.8)), _S.unary("-", 2)]))
			_S.define(_v26, "l", _S.logical("||", _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.read(_v26, "x"), _S.binary("-", _S.read(_v26, "y"), _S.read(_v26, "CORE_Y"))]), func(): return 1))
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STREAK"), _S.read(_v26, "x"), _S.read(_v26, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v26, "x")), _S.read(_v26, "l")), _S.read(_v26, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v26, "CORE_Y"), _S.read(_v26, "y")), _S.read(_v26, "l")), _S.read(_v26, "v")), _S.read(_v26, "T"), (_S.prop(_S.read(_v26, "C"), 6) if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.5])) else _S.prop(_S.read(_v26, "C"), 5))])
		if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.14])):
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "s", _S.invoke(_S.read(_v27, "R"), "sign", []))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "VAPOUR"), _S.binary("*", _S.read(_v27, "s"), _S.invoke(_S.read(_v27, "R"), "range", [28, 60])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [0, 2])), _S.binary("*", _S.unary("-", _S.read(_v27, "s")), _S.invoke(_S.read(_v27, "R"), "range", [35, 70])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [0, 3])), _S.invoke(_S.read(_v27, "R"), "range", [0.35, 0.5]), _S.prop(_S.read(_v27, "C"), 6), _S.invoke(_S.read(_v27, "R"), "range", [2, 3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.unary("!", _S.read(_e, "released")))):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "released", true, "=", false)
		_S.invoke(_S.read(_v28, "lights"), "add", [0, _S.read(_v28, "CORE_Y"), 84, _S.prop(_S.read(_v28, "C"), 4), 0.8, 0.55])
		_S.invoke(_S.read(_v28, "lights"), "add", [0, _S.read(_v28, "CORE_Y"), 45, _S.read(_v28, "WHITE"), 0.7, 0.12])
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 22)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.25]))
			_S.define(_v30, "sp", _S.invoke(_S.read(_v30, "R"), "range", [110, 280]))
			_S.invoke(_S.read(_v30, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v30, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.read(_v30, "CORE_Y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "sp"))}, {"g": 0.7}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v30, "R"), "range", [0.9, 1.5])}, {"a": _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")])}, {"va": _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v30, "R"), "range", [1.5, 3.5])}, {"c": _S.invoke(_S.read(_v30, "R"), "pick", [[_S.prop(_S.read(_v30, "C"), 7), _S.prop(_S.read(_v30, "C"), 6), _S.prop(_S.read(_v30, "C"), 5)]])}])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v31 = _S.scope(_v28)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), 14)):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 0]))
			_S.define(_v32, "sp", _S.invoke(_S.read(_v32, "R"), "range", [40, 160]))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "FLAKE"), 0, _S.read(_v32, "CORE_Y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.invoke(_S.read(_v32, "R"), "range", [1.2, 1.8]), (_S.read(_v32, "WHITE") if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.6])) else _S.prop(_S.read(_v32, "C"), 6)), _S.invoke(_S.read(_v32, "R"), "range", [0.5, 1.6])])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "SPREAD"))))):
		for _v33 in _S.array([_S.unary("-", 1), 1]):
			var _v34 = _S.scope(_e)
			_S.define(_v34, "s", _v33)
			var _v35 = _S.scope(_v34)
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "VAPOUR"), _S.binary("+", _S.binary("*", _S.read(_v35, "s"), _S.read(_v35, "fr")), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [0, 5])), _S.binary("*", _S.read(_v35, "s"), _S.invoke(_S.read(_v35, "R"), "range", [15, 75])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [2, 15])), _S.invoke(_S.read(_v35, "R"), "range", [0.6, 1]), (_S.prop(_S.read(_v35, "C"), 6) if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.7])) else _S.prop(_S.read(_v35, "C"), 5)), _S.binary("*", _S.invoke(_S.read(_v35, "R"), "range", [3, 5.5]), _S.binary("-", 1, _S.binary("*", 0.4, _S.binary("/", _S.read(_v35, "fr"), _S.read(_v35, "REACH")))))])
			if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.45])):
				_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "FLAKE"), _S.binary("*", _S.read(_v35, "s"), _S.read(_v35, "fr")), _S.unary("-", 2), _S.binary("*", _S.read(_v35, "s"), _S.invoke(_S.read(_v35, "R"), "range", [10, 45])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [30, 85])), _S.invoke(_S.read(_v35, "R"), "range", [1.1, 1.9]), (_S.read(_v35, "WHITE") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.5])) else _S.prop(_S.read(_v35, "C"), 6)), _S.invoke(_S.read(_v35, "R"), "range", [0.5, 1.2])])
	for _v36 in _S.array(_S.read(_e, "sites")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "s", _v36)
		var _v38 = _S.scope(_v37)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v38, "s"), "up")), func(): return _S.binary(">=", _S.read(_v38, "t"), _S.prop(_S.read(_v38, "s"), "t0")))):
			var _v39 = _S.scope(_v38)
			_S.set_prop(_S.read(_v39, "s"), "up", true, "=", false)
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v40, "i"), _S.binary("+", 2, _S.invoke(_S.read(_v40, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v40, "s"), "h"), 8)])))):
				var _v41 = _S.scope(_v40)
				_S.define(_v41, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v41, "Math"), "PI")), 2), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 1.3), 1.3])))
				_S.define(_v41, "sp", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [60, 200]), _S.binary("+", 0.5, _S.binary("/", _S.prop(_S.read(_v41, "s"), "h"), 40))))
				_S.invoke(_S.read(_v41, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v41, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v41, "s"), "x"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": 0}, {"vx": _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "a")]), _S.read(_v41, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "a")]), _S.read(_v41, "sp"))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v41, "R"), "range", [0.9, 1.6])}, {"a": _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")])}, {"va": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v41, "R"), "range", [1.5, 3])}, {"c": _S.invoke(_S.read(_v41, "R"), "pick", [[_S.prop(_S.read(_v41, "C"), 7), _S.prop(_S.read(_v41, "C"), 6), _S.prop(_S.read(_v41, "C"), 5)]])}])])
				_v40 = _S.iteration(_v40)
				_S.write(_v40, "i", 1, "+=", true)
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "VAPOUR"), _S.prop(_S.read(_v39, "s"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [2, 8])), _S.invoke(_S.read(_v39, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v39, "C"), 6), _S.invoke(_S.read(_v39, "R"), "range", [2.5, 4])])
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v39, "s"), "h"), 10)):
				_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v39, "s"), "x"), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [4, _S.binary("*", _S.prop(_S.read(_v39, "s"), "h"), 0.8)])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v39, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v39, "C"), 6), _S.invoke(_S.read(_v39, "R"), "range", [1, 2.4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HOLD"), 0.2)))):
		var _v42 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v42, "R"), "chance", [0.5])):
			var _v43 = _S.scope(_v42)
			_S.define(_v43, "s", _S.invoke(_S.read(_v43, "R"), "pick", [_S.read(_v43, "sites")]))
			if _S.truth(_S.prop(_S.read(_v43, "s"), "up")):
				_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v43, "s"), "x"), _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v43, "R"), "range", [2, _S.binary("*", _S.prop(_S.read(_v43, "s"), "h"), 0.9)])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v43, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v43, "C"), 6) if _S.truth(_S.invoke(_S.read(_v43, "R"), "chance", [0.6])) else _S.read(_v43, "WHITE")), _S.invoke(_S.read(_v43, "R"), "range", [0.6, 2.2])])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v42, "t"), _S.binary("-", _S.read(_v42, "HOLD"), 0.3)), func(): return _S.invoke(_S.read(_v42, "R"), "chance", [0.16]))):
			_S.invoke(_S.read(_v42, "ps"), "spawn", [_S.prop(_S.read(_v42, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v42, "fr")), _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [40, 90])), _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 5), 5]), _S.invoke(_S.read(_v42, "R"), "range", [3, 10]), _S.invoke(_S.read(_v42, "R"), "range", [1.1, 1.5]), (_S.read(_v42, "WHITE") if _S.truth(_S.invoke(_S.read(_v42, "R"), "chance", [0.5])) else _S.prop(_S.read(_v42, "C"), 6)), _S.invoke(_S.read(_v42, "R"), "range", [0.5, 1.4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HOLD")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HOLD"), _S.read(_e, "MELT"))))):
		var _v44 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v44, "R"), "chance", [0.5])):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "s", _S.invoke(_S.read(_v45, "R"), "pick", [_S.read(_v45, "sites")]))
			_S.invoke(_S.read(_v45, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v45, "B"), "DRIP")}, {"x": _S.binary("+", _S.prop(_S.read(_v45, "s"), "x"), _S.invoke(_S.read(_v45, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [3, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v45, "s"), "h"), 0.6), _S.binary("-", 1, _S.call_value(_S.read(_v45, "sink"), [_S.read(_v45, "t")])))]))}, {"vy": 10}, {"g": 0.6}, {"life": 1}, {"c": _S.prop(_S.read(_v45, "C"), 5)}])])
		if _S.truth(_S.invoke(_S.read(_v44, "R"), "chance", [0.25])):
			_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "VAPOUR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "REACH")), 0.8), _S.unary("-", _S.invoke(_S.read(_v44, "R"), "range", [0, 3])), _S.invoke(_S.read(_v44, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v44, "R"), "range", [6, 16])), _S.invoke(_S.read(_v44, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v44, "C"), 5), _S.invoke(_S.read(_v44, "R"), "range", [3, 5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_t = _S.read(_parent,"t")
	var _n_front = _S.read(_parent,"front")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_frost = _S.read(_parent,"frost")
	var _n_C = _S.read(_parent,"C")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ring = _S.read(_parent,"ring")
	var _n_drawCrystals = _S.read(_parent,"drawCrystals")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_out_b1 = (1 - _S.MathFX.smooth((_n_HOLD + 0.2),((_n_HOLD + _n_MELT) + 0.6),_n_t))
	var _n_fr_b2 = _S.call_value(_n_front,[_n_t])
	if _S.truth(((_n_t > _n_CHARGE) if _S.truth((_n_out_b1 > 0)) else (_n_out_b1 > 0))):
		_S.call_value(_n_frost,[_n_p_b0, _n_C, (-maxf(12,(_n_fr_b2 + 1))), maxf(12,(_n_fr_b2 + 1)), _n_REACH, _n_out_b1, _n_fr_b2])
	_S.call_value(_n_ring,[_n_p_b0, true])
	_S.call_value(_n_drawCrystals,[_n_p_b0, true])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_ring = _S.read(_parent,"ring")
	var _n_drawCrystals = _S.read(_parent,"drawCrystals")
	var _n_t = _S.read(_parent,"t")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_snowflake = _S.read(_parent,"snowflake")
	var _n_C = _S.read(_parent,"C")
	var _n_CORE_Y = _S.read(_parent,"CORE_Y")
	var _n_flare = _S.read(_parent,"flare")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_front = _S.read(_parent,"front")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_ring,[_n_p_b0, false])
	_S.call_value(_n_drawCrystals,[_n_p_b0, false])
	if _S.truth((_n_t < _n_CHARGE)):
		var _n_k_b1 = (float(_n_t)/_n_CHARGE)
		var _n_beat_b2 = ((1 + (0.25 * exp((float((-pow((_n_t - (_n_CHARGE * 0.55)),2)))/0.002)))) + (0.3 * exp((float((-pow((_n_t - (_n_CHARGE * 0.85)),2)))/0.002))))
		_S.call_value(_n_snowflake,[_n_p_b0, _n_C, 0, _n_CORE_Y, ((2 + ((5.5 * _n_k_b1) * _n_k_b1)) * _n_beat_b2), (_n_t * 4), _n_k_b1])
	else:
		if _S.truth((_n_t < (_n_CHARGE + 0.22))):
			var _n_a_b3 = (float((_n_t - _n_CHARGE))/0.22)
			_S.call_value(_n_flare,[_n_p_b0, 0, _n_CORE_Y, (36 * pow((1 - _n_a_b3),1.5)), (1 - _n_a_b3), _n_C])
			_S.invoke(_n_p_b0,"glow",[0, _n_CORE_Y, 46, _n_WHITE, (0.6 * (1 - _n_a_b3))])
	if _S.truth((_n_t > _n_CHARGE)):
		var _n_k_b4 = ((1 - _S.MathFX.smooth(_n_HOLD,((_n_HOLD + _n_MELT) + 0.3),_n_t)) * (0.85 + (0.15 * sin((_n_t * 2.4)))))
		var _n_fr_b5 = _S.call_value(_n_front,[_n_t])
		if true:
			var _n_i_b6 = (-3)
			while _S.truth((_n_i_b6 <= 3)):
				_S.invoke(_n_p_b0,"glow",[((float(_n_i_b6)/3.5) * _n_fr_b5), (-4), 26, _S.index_value(_n_C,4), (0.16 * _n_k_b4)])
				_n_i_b6 += 1.0
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
