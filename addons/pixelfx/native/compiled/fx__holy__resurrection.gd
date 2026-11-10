@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/resurrection.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"wing_along","_f3":"resurrection_wing","_f7":"resurrection_draw_wing","_f11":"resurrection_shaft","_f13":"resurrection_pool","_f14":"resurrection_halo","_f15":"resurrection_body","_f33":"resurrection_back","_f34":"resurrection_draw"}
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
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "ASH", _S.import_value("fx/holy/_lib.js", "ASH"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "recolor", _S.import_value("fx/holy/_lib.js", "recolor"))
	_S.define(_e, "toneOf", _S.import_value("fx/holy/_lib.js", "toneOf"))
	_S.define(_e, "feather", _S.import_value("fx/holy/_lib.js", "feather"))
	_S.define(_e, "Feathers", _S.import_value("fx/holy/_lib.js", "Feathers"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "FAR", _S.import_value("fx/holy/_lib.js", "FAR"))
	_S.define(_e, "NEAR", _S.import_value("fx/holy/_lib.js", "NEAR"))
	_S.define(_e, "along", _S.function_value(_e, "_f0"))
	_S.define(_e, "beat", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Resurrection"}, {"desc": "Light pours down on the fallen and life climbs back up the body; wings of light unfold, a halo forms, one great wingbeat, then the wings scatter into feathers."}, {"tags": ["holy", "revive", "resurrect", "wings", "halo", "light", "character", "one-shot"]}, {"size": [192, 160]}, {"origin": [96, 140]}, {"duration": 4.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"ash": _S.read(_e, "ASH")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "DOWN", _S.merge([{"turn": 0.9}, {"crouch": 8}, {"lean": 6}, {"hy": 2}, {"fx": _S.unary("-", 4)}, {"fy": _S.unary("-", 10)}, {"bx": 9}, {"by": _S.unary("-", 10)}, {"ffx": 8}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "RISEN", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 33)}, {"bx": 16}, {"by": _S.unary("-", 33)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 5)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0.6}, {"poses": [[0, _S.read(_e, "DOWN")], [0.5, _S.read(_e, "DOWN")], [0.85, _S.merge([_S.read(_e, "DOWN"), {"crouch": 6}, {"lean": 4}, {"hy": 1}])], [1.15, _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}])], [1.5, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 2)}])], [1.95, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 3)}])], [2.1, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 2)}, {"crouch": 1}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 37)}])], [2.3, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 9)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 38)}, {"bx": 16}, {"by": _S.unary("-", 38)}])], [2.95, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 6)}])], [3.8, _S.merge([{"turn": 1}, {"y": 0}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}])], [4.3, _S.read(_e, "READY")], [4.8, _S.read(_e, "READY")]]}, {"dust": [_S.merge([{"t": 3.8}, {"x": 0}, {"n": 5}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "TOP", _S.unary("-", 140))
	_S.define(_e, "POUR", 0.34)
	_S.define(_e, "CL0", 0.5)
	_S.define(_e, "CL1", 1.15)
	_S.define(_e, "W0", 1.1)
	_S.define(_e, "H0", 1.24)
	_S.define(_e, "H1", 1.5)
	_S.define(_e, "B0", 1.95)
	_S.define(_e, "B1", 2.25)
	_S.define(_e, "B2", 2.37)
	_S.define(_e, "B3", 2.8)
	_S.define(_e, "SC", 2.95)
	_S.define(_e, "GONE", 3.85)
	_S.define(_e, "HX", 0)
	_S.define(_e, "HY", _S.unary("-", 47))
	_S.define(_e, "HRX", 9.5)
	_S.define(_e, "HRY", 2.6)
	_S.define(_e, "SHOULDER", [4, _S.unary("-", 20)])
	_S.define(_e, "ARM_OPEN", [[0, 0], [7, _S.unary("-", 9)], [15, _S.unary("-", 19)], [20, _S.unary("-", 27)]])
	_S.define(_e, "ARM_FOLD", [[0, 0], [2, _S.unary("-", 2)], [3, _S.unary("-", 3)], [4, _S.unary("-", 3)]])
	_S.define(_e, "QUILLS", [[0.14, 1.35, 11, 2.6, 1], [0.26, 1.12, 14, 2.8, 1], [0.38, 0.88, 17, 3, 1], [0.5, 0.62, 19, 3.1, 1], [0.62, 0.35, 21, 3.2, 1], [0.72, 0.08, 23, 3.3, 1], [0.8, _S.unary("-", 0.2), 26, 3.4, 0], [0.85, _S.unary("-", 0.45), 29, 3.5, 0], [0.9, _S.unary("-", 0.72), 31, 3.6, 0], [0.95, _S.unary("-", 1), 30, 3.6, 0], [1, _S.unary("-", 1.3), 26, 3.4, 0], [0.22, 1.2, 7, 2.2, 2], [0.34, 0.98, 8, 2.3, 2], [0.46, 0.75, 9, 2.4, 2], [0.58, 0.5, 10, 2.5, 2], [0.7, 0.22, 10, 2.5, 2], [0.81, _S.unary("-", 0.1), 11, 2.6, 2], [0.92, _S.unary("-", 0.5), 11, 2.6, 2]])
	_S.define(_e, "FLEX", [1, 0.5, 0.3])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_L_b2 = 0
	var _n_seglen_b3 = []
	if true:
		var _n_i_b5 = 1
		while _S.truth((_n_i_b5 < _S.prop(_n_pts_b0,"length"))):
			_n_L_b2 += _S.set_prop(_n_seglen_b3,(_n_i_b5 - 1),_S.Bridge.hypot([(_S.index_value(_S.index_value(_n_pts_b0,_n_i_b5),0) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b5 - 1)),0)), (_S.index_value(_S.index_value(_n_pts_b0,_n_i_b5),1) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b5 - 1)),1))]),"=")
			_n_i_b5 += 1.0
	var _n_d_b4 = (_n_s_b1 * _n_L_b2)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < _S.prop(_n_seglen_b3,"length"))):
			if _S.truth(((_n_d_b4 <= _S.index_value(_n_seglen_b3,_n_i_b6)) if _S.truth((_n_d_b4 <= _S.index_value(_n_seglen_b3,_n_i_b6))) else _S.binary("===",_n_i_b6,(_S.prop(_n_seglen_b3,"length") - 1)))):
				var _n_f_b7 = (clampf((float(_n_d_b4)/_S.index_value(_n_seglen_b3,_n_i_b6)),0.0,1.0) if _S.truth(_S.index_value(_n_seglen_b3,_n_i_b6)) else 0)
				return [_S.numeric_lerp(_S.index_value(_S.index_value(_n_pts_b0,_n_i_b6),0),_S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 + 1)),0),_n_f_b7), _S.numeric_lerp(_S.index_value(_S.index_value(_n_pts_b0,_n_i_b6),1),_S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 + 1)),1),_n_f_b7)]
			_n_d_b4 -= _S.index_value(_n_seglen_b3,_n_i_b6)
			_n_i_b6 += 1.0
	return _S.index_value(_n_pts_b0,(_S.prop(_n_pts_b0,"length") - 1))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_B0 = _S.read(_parent,"B0")
	var _n_B1 = _S.read(_parent,"B1")
	var _n_ease = _S.read(_parent,"ease")
	var _n_B2 = _S.read(_parent,"B2")
	var _n_B3 = _S.read(_parent,"B3")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _n_B0)):
		return 0
	if _S.truth((_n_t_b0 < _n_B1)):
		return ((-0.34) * _S.invoke(_n_ease,"inOutSine",[_S.MathFX.seg(_n_t_b0,_n_B0,_n_B1)]))
	if _S.truth((_n_t_b0 < _n_B2)):
		return _S.numeric_lerp((-0.34),0.66,_S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_t_b0,_n_B1,_n_B2)]))
	return (0.66 * (1 - _S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_t_b0,_n_B2,_n_B3), 1.3])))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "wing", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawWing", _S.function_value(_e, "_f7"))
	_S.define(_e, "shaft", _S.function_value(_e, "_f11"))
	_S.define(_e, "pool", _S.function_value(_e, "_f13"))
	_S.define(_e, "halo", _S.function_value(_e, "_f14"))
	_S.define(_e, "body", _S.function_value(_e, "_f15"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "AS", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ash"), 6]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "WING", [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f18")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "loose", _S.construct(_S.read(_e, "Feathers"), [_S.read(_e, "R"), 0]))
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	for _v52 in _S.array(_S.prop(_S.read(_e, "S"), "edge")):
		var _v53 = _S.scope(_e)
		var _v54 = _v52
		_S.define(_v53, "x", _S.prop(_v54, 0))
		_S.define(_v53, "y", _S.prop(_v54, 1))
		_S.invoke(_S.logical("??", _S.invoke(_S.read(_v53, "rows"), "get", [_S.read(_v53, "y")]), func(): return _S.invoke(_S.invoke(_S.read(_v53, "rows"), "set", [_S.read(_v53, "y"), []]), "get", [_S.read(_v53, "y")])), "push", [_S.read(_v53, "x")])
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f19")]))
	_S.define(_e, "cores", _S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "rays"))]), "sort", [_S.function_value(_e, "_f20")]), "slice", [0, 2]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 34}]), _S.function_value(_e, "_f21")]))
	_S.define(_e, "reach", _S.invoke(_S.read(_e, "QUILLS"), "map", [_S.function_value(_e, "_f22")]))
	_S.define(_e, "far", _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.read(_e, "reach"))])))
	_S.define(_e, "quills", _S.invoke(_S.read(_e, "QUILLS"), "map", [_S.function_value(_e, "_f23")]))
	_S.define(_e, "profile", _S.construct(_S.read(_e, "Float32Array"), [121]))
	_S.define(_e, "t", 0)
	_S.define(_e, "poured", false)
	_S.define(_e, "flashed", false)
	_S.define(_e, "formed", false)
	_S.define(_e, "beaten", false)
	_S.define(_e, "climbY", _S.function_value(_e, "_f25"))
	_S.define(_e, "shaftK", _S.function_value(_e, "_f26"))
	_S.define(_e, "shaftW", _S.function_value(_e, "_f27"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f28"))
	return _S.merge([{"update": _S.function_value(_e, "_f29")}, {"drawBack": _S.function_value(_e, "_f33")}, {"draw": _S.function_value(_e, "_f34")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_beat = _S.read(_parent,"beat")
	var _n_ARM_FOLD = _S.read(_parent,"ARM_FOLD")
	var _n_quills = _S.read(_parent,"quills")
	var _n_tt_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.arg(_args,1)
	var _n_oa_b2 = _S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_tt_b0,_n_W0,(_n_W0 + 0.4)), 1.6])
	var _n_rot_b3 = _S.call_value(_n_beat,[_n_tt_b0])
	var _n_om_b4 = (float((_S.call_value(_n_beat,[_n_tt_b0]) - _S.call_value(_n_beat,[(_n_tt_b0 - 0.03)])))/0.03)
	var _n_arm_b5 = _S.invoke(_n_ARM_FOLD,"map",[_S.function_value(_S.capture(_parent,{"oa":_n_oa_b2,"this":_this}),"_f4")])
	var _n_cr_b6 = cos(_n_rot_b3)
	var _n_sr_b7 = sin(_n_rot_b3)
	var _n_place_b8 = _S.function_value(_S.capture(_parent,{"side":_n_side_b1,"cr":_n_cr_b6,"sr":_n_sr_b7,"this":_this}),"_f5")
	var _n_a0_b9 = _S.MathFX.smooth(_n_W0,(_n_W0 + 0.1),_n_tt_b0)
	var _n_out_b10 = []
	_S.invoke(_n_quills,"forEach",[_S.function_value(_S.capture(_parent,{"tt":_n_tt_b0,"side":_n_side_b1,"place":_n_place_b8,"arm":_n_arm_b5,"rot":_n_rot_b3,"om":_n_om_b4,"out":_n_out_b10,"a0":_n_a0_b9,"this":_this}),"_f6")])
	return {"out":_n_out_b10,"arm":_S.invoke(_n_arm_b5,"map",[_n_place_b8])}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ARM_OPEN = _S.read(_parent,"ARM_OPEN")
	var _n_oa = _S.read(_parent,"oa")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [_S.numeric_lerp(_S.index_value(_n_f_b0,0),_S.index_value(_S.index_value(_n_ARM_OPEN,_n_i_b1),0),_n_oa), _S.numeric_lerp(_S.index_value(_n_f_b0,1),_S.index_value(_S.index_value(_n_ARM_OPEN,_n_i_b1),1),_n_oa)]
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_side = _S.read(_parent,"side")
	var _n_SHOULDER = _S.read(_parent,"SHOULDER")
	var _n_cr = _S.read(_parent,"cr")
	var _n_sr = _S.read(_parent,"sr")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_side * ((_S.index_value(_n_SHOULDER,0) + (_n_x_b0 * _n_cr)) - (_n_y_b1 * _n_sr))), ((_S.index_value(_n_SHOULDER,1) + (_n_x_b0 * _n_sr)) + (_n_y_b1 * _n_cr))]
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_tt = _S.read(_parent,"tt")
	var _n_side = _S.read(_parent,"side")
	var _n_ease = _S.read(_parent,"ease")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_place = _S.read(_parent,"place")
	var _n_along = _S.read(_parent,"along")
	var _n_arm = _S.read(_parent,"arm")
	var _n_rot = _S.read(_parent,"rot")
	var _n_om = _S.read(_parent,"om")
	var _n_FLEX = _S.read(_parent,"FLEX")
	var _n_out = _S.read(_parent,"out")
	var _n_a0 = _S.read(_parent,"a0")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	if _S.truth((_n_tt >= (_S.index_value(_S.named_value(_n_q_b0,"off"),(0 if _S.truth((_n_side > 0)) else 1)) + 0.05))):
		return null
	var _n_of_b2 = _S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_tt,(_n_W0 + _S.named_value(_n_q_b0,"open")),((_n_W0 + _S.named_value(_n_q_b0,"open")) + 0.42)), 2])
	var _tuple_0 = _S.call_value(_n_place,[_S.call_value(_n_along,[_n_arm, _S.named_value(_n_q_b0,"s")])])
	var _n_bx_b3 = _S.prop(_tuple_0,0)
	var _n_by_b4 = _S.prop(_tuple_0,1)
	var _n_ang_b5 = ((_S.numeric_lerp(_S.named_value(_n_q_b0,"fold"),_S.named_value(_n_q_b0,"ang"),_n_of_b2) + _n_rot) - clampf(((_n_om * 0.045) * _S.index_value(_n_FLEX,_S.named_value(_n_q_b0,"kind"))),(-0.5),0.5))
	_S.invoke(_n_out,"push",[{"i":_n_i_b1,"q":_n_q_b0,"x":_n_bx_b3,"y":_n_by_b4,"ang":(_n_ang_b5 if _S.truth((_n_side > 0)) else (PI - _n_ang_b5)),"len":(_S.named_value(_n_q_b0,"len") * _S.numeric_lerp(0.3,1,_n_of_b2)),"wid":_S.named_value(_n_q_b0,"wid"),"a":_n_a0,"hot":(1 if _S.truth(((_n_tt < ((_n_W0 + _S.named_value(_n_q_b0,"open")) + 0.07)) if _S.truth((_n_tt < ((_n_W0 + _S.named_value(_n_q_b0,"open")) + 0.07))) else (_n_tt >= _S.index_value(_S.named_value(_n_q_b0,"off"),(0 if _S.truth((_n_side > 0)) else 1))))) else 0)}])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_wing = _S.read(_parent,"wing")
	var _n_t = _S.read(_parent,"t")
	var _n_WING = _S.read(_parent,"WING")
	var _n_feather = _S.read(_parent,"feather")
	var _n_quills = _S.read(_parent,"quills")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_along = _S.read(_parent,"along")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_B1 = _S.read(_parent,"B1")
	var _n_B2 = _S.read(_parent,"B2")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.arg(_args,1)
	var _object_0 = _S.call_value(_n_wing,[_n_t, _n_side_b1])
	var _n_out_b2 = _S.named_value(_object_0,"out")
	var _n_arm_b3 = _S.named_value(_object_0,"arm")
	if _S.truth(not _S.truth(_S.prop(_n_out_b2,"length"))):
		return null
	var _n_order_b4 = _S.invoke(_S.concat([_S.array(_n_out_b2)]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
	for _iter_1 in _S.array(_n_order_b4):
		var _n_f_b7 = _iter_1
		if _S.truth(_S.binary("!==",_S.named_value(_S.named_value(_n_f_b7,"q"),"kind"),2)):
			_S.call_value(_n_feather,[_n_p_b0, _S.named_value(_n_f_b7,"x"), _S.named_value(_n_f_b7,"y"), _S.named_value(_n_f_b7,"ang"), _S.named_value(_n_f_b7,"len"), _S.named_value(_n_f_b7,"wid"), _n_WING, _S.named_value(_n_f_b7,"a"), _n_side_b1, _S.named_value(_n_f_b7,"hot")])
	for _iter_2 in _S.array(_n_order_b4):
		var _n_f_b8 = _iter_2
		if _S.truth(_S.binary("===",_S.named_value(_S.named_value(_n_f_b8,"q"),"kind"),2)):
			_S.call_value(_n_feather,[_n_p_b0, _S.named_value(_n_f_b8,"x"), _S.named_value(_n_f_b8,"y"), _S.named_value(_n_f_b8,"ang"), _S.named_value(_n_f_b8,"len"), _S.named_value(_n_f_b8,"wid"), _n_WING, _S.named_value(_n_f_b8,"a"), _n_side_b1, _S.named_value(_n_f_b8,"hot")])
	var _n_k_b5 = (float(_S.prop(_n_out_b2,"length"))/_S.prop(_n_quills,"length"))
	if _S.truth((_n_k_b5 > 0.5)):
		_S.invoke(_n_p_b0,"polyline",[_S.invoke(_n_arm_b3,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f9")]), _S.index_value(_n_C,5), _S.named_value(_S.index_value(_n_out_b2,0),"a")])
		_S.invoke(_n_p_b0,"polyline",[_n_arm_b3, _n_WHITE, _S.named_value(_S.index_value(_n_out_b2,0),"a")])
	_S.invoke(_n_p_b0,"glow",[(_n_side_b1 * 28), (-36), 38, _S.index_value(_n_C,4), ((0.26 * _S.named_value(_S.index_value(_n_out_b2,0),"a")) * _n_k_b5)])
	var _n_g_b6 = fmod((((_n_t - _n_W0) - 0.45) * 1.3),1)
	if _S.truth(((_n_g_b6 < 0.8) if _S.truth(((_n_t > (_n_W0 + 0.45)) if _S.truth((_n_k_b5 > 0.9)) else (_n_k_b5 > 0.9))) else ((_n_t > (_n_W0 + 0.45)) if _S.truth((_n_k_b5 > 0.9)) else (_n_k_b5 > 0.9)))):
		var _tuple_3 = _S.call_value(_n_along,[_n_arm_b3, (float(_n_g_b6)/0.8)])
		var _n_gx_b9 = _S.prop(_tuple_3,0)
		var _n_gy_b10 = _S.prop(_tuple_3,1)
		_S.call_value(_n_sparkle,[_n_p_b0, _n_gx_b9, _n_gy_b10, (2 + (sin(((float(_n_g_b6)/0.8) * PI)) * 2)), _n_WHITE, _S.index_value(_n_C,6), 0.4])
	_S.invoke(_n_p_b0,"glowLine",[_S.index_value(_S.index_value(_n_arm_b3,0),0), _S.index_value(_S.index_value(_n_arm_b3,0),1), _S.index_value(_S.index_value(_n_arm_b3,3),0), _S.index_value(_S.index_value(_n_arm_b3,3),1), 7, _S.index_value(_n_C,5), ((0.25 * _S.named_value(_S.index_value(_n_out_b2,0),"a")) * _n_k_b5)])
	if _S.truth(((_n_t < (_n_B2 + 0.14)) if _S.truth((_n_t > (_n_B1 + 0.03))) else (_n_t > (_n_B1 + 0.03)))):
		for _iter_4 in _S.array([6, 8, 10]):
			var _n_i_b11 = _iter_4
			var _n_pts_b12 = []
			if true:
				var _n_j_b14 = 0
				while _S.truth((_n_j_b14 < 10)):
					var _n_tt_b15 = maxf((_n_B1 + 0.01),(_n_t - (_n_j_b14 * 0.012)))
					var _n_w_b16 = _S.invoke(_S.named_value(_S.call_value(_n_wing,[_n_tt_b15, _n_side_b1]),"out"),"find",[_S.function_value(_S.capture(_parent,{"i":_n_i_b11,"this":_this}),"_f10")])
					if _S.truth(_n_w_b16):
						_S.invoke(_n_pts_b12,"push",[[(_S.named_value(_n_w_b16,"x") + (cos(_S.named_value(_n_w_b16,"ang")) * (_S.named_value(_n_w_b16,"len") - 1))), (_S.named_value(_n_w_b16,"y") + (sin(_S.named_value(_n_w_b16,"ang")) * (_S.named_value(_n_w_b16,"len") - 1)))]])
					_n_j_b14 += 1.0
			var _n_fade_b13 = (1 - _S.MathFX.smooth(_n_B2,(_n_B2 + 0.14),_n_t))
			if true:
				var _n_j_b17 = 1
				while _S.truth((_n_j_b17 < _S.prop(_n_pts_b12,"length"))):
					_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_n_pts_b12,(_n_j_b17 - 1)),0), _S.index_value(_S.index_value(_n_pts_b12,(_n_j_b17 - 1)),1), _S.index_value(_S.index_value(_n_pts_b12,_n_j_b17),0), _S.index_value(_S.index_value(_n_pts_b12,_n_j_b17),1), (_n_WHITE if _S.truth((_n_j_b17 < 3)) else (_S.index_value(_n_C,6) if _S.truth((_n_j_b17 < 6)) else _S.index_value(_n_C,4))), (_n_fade_b13 * (1.1 - (float(_n_j_b17)/10)))])
					_n_j_b17 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_S.named_value(_n_b_b1,"q"),"ang") - _S.named_value(_S.named_value(_n_a_b0,"q"),"ang"))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [_n_x_b0, (_n_y_b1 + 1)]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_i = _S.read(_parent,"i")
	var _n_f_b0 = _S.arg(_args,0)
	return _S.binary("===",_S.named_value(_n_f_b0,"i"),_n_i)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_shaftK = _S.read(_parent,"shaftK")
	var _n_t = _S.read(_parent,"t")
	var _n_rays = _S.read(_parent,"rays")
	var _n_profile = _S.read(_parent,"profile")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_POUR = _S.read(_parent,"POUR")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_cores = _S.read(_parent,"cores")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_shaftK,[_n_t])
	if _S.truth((_n_k_b1 <= 0)):
		return null
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _S.prop(_n_profile,"length"))):
			var _n_q_b5 = (float((_n_i_b4 - 60))/40)
			var _n_I_b6 = 0
			for _iter_0 in _S.array(_n_rays):
				var _n_r_b7 = _iter_0
				var _n_d_b8 = (float((_n_q_b5 - _S.named_value(_n_r_b7,"o")))/_S.named_value(_n_r_b7,"w"))
				_n_I_b6 += ((_S.named_value(_n_r_b7,"b") * exp(((-_n_d_b8) * _n_d_b8))) * (0.72 + (0.28 * sin(((_n_t * _S.named_value(_n_r_b7,"f")) + _S.named_value(_n_r_b7,"ph"))))))
			_S.set_prop(_n_profile,_n_i_b4,(((_n_I_b6 * 0.6) + (0.35 * maxf(0,(1 - (_n_q_b5 * _n_q_b5))))) * _S.MathFX.smooth(1.25,0.7,absf(_n_q_b5))),"=")
			_n_i_b4 += 1.0
	var _n_front_b2 = _S.numeric_lerp(_n_TOP,1,_S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_t,0,_n_POUR)]))
	var _n_w0_b3 = (_S.call_value(_n_halfW,[0, _n_t]) * 1.3)
	_S.invoke(_n_p_b0,"each",[((-_n_w0_b3) - 1), _n_TOP, (_n_w0_b3 + 1), minf(_n_front_b2,0.5), _S.function_value(_S.capture(_parent,{"k":_n_k_b1,"front":_n_front_b2,"p":_n_p_b0,"this":_this}),"_f12")])
	for _iter_1 in _S.array(_n_cores):
		var _n_r_b9 = _iter_1
		var _n_sh_b10 = (0.75 + (0.25 * sin(((_n_t * _S.named_value(_n_r_b9,"f")) + _S.named_value(_n_r_b9,"ph")))))
		if true:
			var _n_y_b11 = _n_TOP
			while _S.truth((_n_y_b11 < minf(_n_front_b2,0))):
				var _n_pulse_b12 = (0.5 + (0.5 * sin((((_n_y_b11 * 0.13) - (_n_t * 11)) + _S.named_value(_n_r_b9,"ph")))))
				_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_r_b9,"o") * _S.call_value(_n_halfW,[_n_y_b11, _n_t])), _n_y_b11, (_n_WHITE if _S.truth((_n_pulse_b12 > 0.8)) else _S.index_value(_n_C,6)), (((_n_k_b1 * _n_sh_b10) * (0.15 + (0.55 * _n_pulse_b12))) * _S.MathFX.smooth(_n_front_b2,(_n_front_b2 - 10),_n_y_b11))])
				_n_y_b11 += 1.0
	if _S.truth(((_n_front_b2 > (_n_TOP + 14)) if _S.truth((_n_t < (_n_POUR + 0.05))) else (_n_t < (_n_POUR + 0.05)))):
		var _n_fy_b13 = minf(_n_front_b2,0)
		_S.invoke(_n_p_b0,"glow",[0, _n_fy_b13, 14, _S.index_value(_n_C,5), (0.7 * _n_k_b1)])
		if true:
			var _n_dy_b14 = (-6)
			while _S.truth((_n_dy_b14 <= 0)):
				_S.invoke(_n_p_b0,"dot",[0, (_n_fy_b13 + _n_dy_b14), (_n_WHITE if _S.truth((_n_dy_b14 > (-3))) else _S.index_value(_n_C,6)), (1 + (float(_n_dy_b14)/7))])
				_n_dy_b14 += 1.0
	for _iter_2 in _S.array(_n_motes):
		var _n_m_b15 = _iter_2
		var _n_y_b16 = (_n_TOP + fmod((fmod(((_S.named_value(_n_m_b15,"y") * (-_n_TOP)) + (_n_t * _S.named_value(_n_m_b15,"v"))),(-_n_TOP)) + (-_n_TOP)),(-_n_TOP)))
		if _S.truth((_n_y_b16 > _n_front_b2)):
			continue
		var _n_w_b17 = _S.call_value(_n_halfW,[_n_y_b16, _n_t])
		var _n_x_b18 = ((_S.named_value(_n_m_b15,"q") * _n_w_b17) + (sin(((_n_t * _S.named_value(_n_m_b15,"f")) + _S.named_value(_n_m_b15,"ph"))) * _S.named_value(_n_m_b15,"amp")))
		var _n_I_b19 = (_S.index_value(_n_profile,(floori(((float(_n_x_b18)/_n_w_b17) * 40)+0.5) + 60)) * _n_k_b1)
		if _S.truth((_n_I_b19 < 0.25)):
			continue
		_S.invoke(_n_p_b0,"dot",[_n_x_b18, _n_y_b16, (_n_WHITE if _S.truth((_n_I_b19 > 0.75)) else (_S.index_value(_n_C,6) if _S.truth((_n_I_b19 > 0.5)) else _S.index_value(_n_C,5))), minf(1,(_n_I_b19 * 1.4))])
		_S.invoke(_n_p_b0,"light",[_n_x_b18, _n_y_b16, _S.index_value(_n_C,5), (_n_I_b19 * 0.5)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_t = _S.read(_parent,"t")
	var _n_profile = _S.read(_parent,"profile")
	var _n_k = _S.read(_parent,"k")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_front = _S.read(_parent,"front")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.call_value(_n_halfW,[_n_y_b1, _n_t])
	var _n_q_b5 = (float(_n_x_b0)/_n_w_b4)
	if _S.truth(((_n_q_b5 < (-1.5)) if _S.truth((_n_q_b5 < (-1.5))) else (_n_q_b5 > 1.5))):
		return null
	var _n_I_b6 = (((_S.index_value(_n_profile,(floori((_n_q_b5 * 40)+0.5) + 60)) * _n_k) * (0.75 + (0.25 * _S.MathFX.smooth(_n_TOP,0,_n_y_b1)))) * _S.MathFX.smooth(_n_front,(_n_front - 10),_n_y_b1))
	if _S.truth((_n_I_b6 <= 0.01)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,6), (_n_I_b6 * 0.24)])
	_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,4), (_n_I_b6 * 0.3)])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_shaftK = _S.read(_parent,"shaftK")
	var _n_t = _S.read(_parent,"t")
	var _n_POUR = _S.read(_parent,"POUR")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_k_b2 = (_S.call_value(_n_shaftK,[_n_t]) * _S.MathFX.smooth((_n_POUR - 0.05),(_n_POUR + 0.1),_n_t))
	var _n_w_b3 = (_S.call_value(_n_halfW,[0, _n_t]) * 1.25)
	if _S.truth((_n_k_b2 <= 0)):
		return null
	if _S.truth(_n_back_b1):
		_S.invoke(_n_p_b0,"glow",[0, (-2), (_n_w_b3 * 1.6), _S.index_value(_n_C,4), (0.3 * _n_k_b2)])
		return null
	if true:
		var _n_y_b4 = 0
		while _S.truth((_n_y_b4 <= 3)):
			if true:
				var _n_x_b5 = floori((-_n_w_b3))
				while _S.truth((_n_x_b5 <= _n_w_b3)):
					var _n_u_b6 = _S.Bridge.hypot([(float(_n_x_b5)/_n_w_b3), (float(_n_y_b4)/4)])
					if _S.truth((_n_u_b6 >= 1)):
						_n_x_b5 += 1.0
						continue
					var _n_a_b7 = (_n_k_b2 * ((sqrt((1 - _n_u_b6)) * 1.2) if _S.truth(_S.binary("===",_n_y_b4,0)) else ((1 - _n_u_b6) * 0.9)))
					_S.invoke(_n_p_b0,"dot",[_n_x_b5, _n_y_b4, ((_S.index_value(_n_C,5) if _S.truth(_n_y_b4) else _n_WHITE) if _S.truth((_n_u_b6 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b6 < 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b6 < 0.85)) else _S.index_value(_n_C,3)))), _n_a_b7])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_H0 = _S.read(_parent,"H0")
	var _n_H1 = _S.read(_parent,"H1")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HRX = _S.read(_parent,"HRX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_HRY = _S.read(_parent,"HRY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_form_b1 = _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t,_n_H0,_n_H1)])
	var _n_k_b2 = (1 - _S.MathFX.smooth(3.35,3.9,_n_t))
	if _S.truth(((_n_form_b1 <= 0) if _S.truth((_n_form_b1 <= 0)) else (_n_k_b2 <= 0))):
		return null
	var _n_white_b3 = ((_n_t < (_n_H1 + 0.06)) if _S.truth((_n_t >= _n_H1)) else (_n_t >= _n_H1))
	var _n_gl_b4 = (((_n_t - _n_H1) * 4.2) + (float(PI)/2))
	var _n_n_b5 = 96
	if true:
		var _n_j_b8 = 0
		while _S.truth((_n_j_b8 < _n_n_b5)):
			var _n_g_b9 = ((float(_n_j_b8)/_n_n_b5) * _n_TAU)
			var _n_fromFront_b10 = absf((fmod((fmod(((_n_g_b9 - (float(PI)/2)) + PI),_n_TAU) + _n_TAU),_n_TAU) - PI))
			if _S.truth((_n_fromFront_b10 > ((_n_form_b1 * PI) + 0.02))):
				_n_j_b8 += 1.0
				continue
			var _n_x_b11 = (_n_HX + ((cos(_n_g_b9) * _n_HRX) * (0.9 + (0.1 * _n_form_b1))))
			var _n_y_b12 = (_n_HY + (sin(_n_g_b9) * _n_HRY))
			var _n_near_b13 = (sin(_n_g_b9) >= 0)
			var _n_dg_b14 = absf((fmod((fmod(((_n_g_b9 - _n_gl_b4) + PI),_n_TAU) + _n_TAU),_n_TAU) - PI))
			var _n_hot_b15 = ((_n_white_b3 if _S.truth(_n_white_b3) else (_n_dg_b14 < 0.22)) if _S.truth((_n_white_b3 if _S.truth(_n_white_b3) else (_n_dg_b14 < 0.22))) else (_n_fromFront_b10 > ((_n_form_b1 * PI) - 0.3)))
			if _S.truth(_n_near_b13):
				_S.invoke(_n_p_b0,"dot",[_n_x_b11, _n_y_b12, (_n_WHITE if _S.truth(_n_hot_b15) else _S.index_value(_n_C,6)), _n_k_b2])
				_S.invoke(_n_p_b0,"dot",[_n_x_b11, (_n_y_b12 + 1), (_S.index_value(_n_C,6) if _S.truth(_n_hot_b15) else _S.index_value(_n_C,4)), _n_k_b2])
			else:
				_S.invoke(_n_p_b0,"dot",[_n_x_b11, _n_y_b12, (_S.index_value(_n_C,6) if _S.truth(_n_hot_b15) else _S.index_value(_n_C,5)), (_n_k_b2 * 0.9)])
			_n_j_b8 += 1.0
	_S.invoke(_n_p_b0,"glow",[_n_HX, _n_HY, 20, _S.index_value(_n_C,4), ((0.4 * _n_k_b2) * _n_form_b1)])
	_S.invoke(_n_p_b0,"glow",[_n_HX, (_n_HY + 1), 9, _n_WHITE, ((0.2 * _n_k_b2) * _n_form_b1)])
	var _n_gx_b6 = (_n_HX + (cos(_n_gl_b4) * _n_HRX))
	var _n_gy_b7 = (_n_HY + (sin(_n_gl_b4) * _n_HRY))
	if _S.truth(((sin(_n_gl_b4) > 0.2) if _S.truth((_n_t > _n_H1)) else (_n_t > _n_H1))):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_gx_b6, (_n_gy_b7 + 0.5), (2 + (2 * sin(_n_gl_b4))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), (0.35 * _n_k_b2)])
	if _S.truth(((_n_t < (_n_H1 + 0.3)) if _S.truth((_n_t >= _n_H1)) else (_n_t >= _n_H1))):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_HX, ((_n_HY + _n_HRY) + 0.5), (7 * (1 - (float((_n_t - _n_H1))/0.3))), _n_WHITE, _S.index_value(_n_C,5), 0.6])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CL1 = _S.read(_parent,"CL1")
	var _n_climbY = _S.read(_parent,"climbY")
	var _n_A = _S.read(_parent,"A")
	var _n_recolor = _S.read(_parent,"recolor")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_S = _S.read(_parent,"S")
	var _n_CL0 = _S.read(_parent,"CL0")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t >= (_n_CL1 + 0.6))):
		return null
	var _n_Ly_b1 = _S.call_value(_n_climbY,[_n_t])
	if _S.truth((_n_t < _n_CL1)):
		_S.call_value(_n_recolor,[_n_p_b0, _n_A, _S.function_value(_S.capture(_parent,{"Ly":_n_Ly_b1,"this":_this}),"_f16")])
		for _iter_0 in _S.array(_S.named_value(_n_S,"out")):
			var _tuple_1 = _iter_0
			var _n_x_b3 = _S.prop(_tuple_1,0)
			var _n_y_b4 = _S.prop(_tuple_1,1)
			var _n_d_b5 = (_n_y_b4 - _n_Ly_b1)
			if _S.truth(((_n_d_b5 < (-0.5)) if _S.truth((_n_d_b5 < (-0.5))) else (_n_d_b5 > 12))):
				continue
			_S.invoke(_n_p_b0,"dot",[_n_x_b3, _n_y_b4, (_n_WHITE if _S.truth((_n_d_b5 < 1)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b5 < 5)) else _S.index_value(_n_C,4))), (1 if _S.truth((_n_d_b5 < 1)) else (1.1 - (float(_n_d_b5)/12)))])
		if _S.truth((_n_t > _n_CL0)):
			_S.invoke(_n_p_b0,"glow",[0, _n_Ly_b1, 26, _S.index_value(_n_C,4), 0.5])
			_S.invoke(_n_p_b0,"glow",[0, _n_Ly_b1, 8, _n_WHITE, 0.3])
			_S.invoke(_n_p_b0,"glow",[0, (-18), 36, _S.index_value(_n_C,5), (0.16 * _S.MathFX.seg(_n_t,_n_CL0,_n_CL1))])
		return null
	var _n_u_b2 = (_n_t - _n_CL1)
	_S.call_value(_n_recolor,[_n_p_b0, _n_A, _S.function_value(_S.capture(_parent,{"u":_n_u_b2,"this":_this}),"_f17")])
	if _S.truth((_n_u_b2 < 0.25)):
		for _iter_2 in _S.array(_S.named_value(_n_S,"out")):
			var _tuple_3 = _iter_2
			var _n_x_b6 = _S.prop(_tuple_3,0)
			var _n_y_b7 = _S.prop(_tuple_3,1)
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b7, (_n_WHITE if _S.truth((_n_u_b2 < 0.08)) else _S.index_value(_n_C,5)), (1 - (float(_n_u_b2)/0.25))])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_Ly = _S.read(_parent,"Ly")
	var _n_AS = _S.read(_parent,"AS")
	var _n_toneOf = _S.read(_parent,"toneOf")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_d_b3 = (_n_y_b2 - _n_Ly)
	if _S.truth((_n_d_b3 < (-0.5))):
		return _S.call_value(_n_toneOf,[_n_AS, _n_c_b0])
	if _S.truth((_n_d_b3 < 0.5)):
		return _n_WHITE
	if _S.truth((_n_d_b3 < 1.5)):
		return _S.index_value(_n_C,6)
	var _n_k_b4 = (exp((float((-(_n_d_b3 - 1.5)))/4)) * 0.7)
	return (_S.ColorFX.mix(_n_c_b0,_S.index_value(_n_C,5),_n_k_b4) if _S.truth((_n_k_b4 > 0.08)) else 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_u = _S.read(_parent,"u")
	var _n_C = _S.read(_parent,"C")
	var _n_c_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u < 0.06)) else (_S.ColorFX.mix(_n_c_b0,_S.index_value(_n_C,5),(0.55 * pow((1 - (float(_n_u)/0.45)),2))) if _S.truth((_n_u < 0.45)) else 0))
	return null

static func _f18(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"o":(((-0.75) + (_n_i_b1 * 0.3)) + _S.invoke(_n_R,"range",[(-0.08), 0.08])),"w":_S.invoke(_n_R,"range",[0.1, 0.2]),"b":_S.invoke(_n_R,"range",[0.55, 1]),"f":_S.invoke(_n_R,"range",[1.5, 3.5]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_b_b1,"b") - _S.named_value(_n_a_b0,"b"))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	return {"q":_S.invoke(_n_R,"range",[(-1), 1]),"y":_S.invoke(_n_R,"range",[0, 1]),"v":_S.invoke(_n_R,"range",[4, 11]),"amp":_S.invoke(_n_R,"range",[0.6, 2.4]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"f":_S.invoke(_n_R,"range",[0.6, 1.4])}
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_along = _S.read(_parent,"along")
	var _n_ARM_OPEN = _S.read(_parent,"ARM_OPEN")
	var _tuple_0 = _S.arg(_args,0)
	var _n_s_b0 = _S.prop(_tuple_0,0)
	var _n_ang_b1 = _S.prop(_tuple_0,1)
	var _n_len_b2 = _S.prop(_tuple_0,2)
	var _n_b_b3 = _S.call_value(_n_along,[_n_ARM_OPEN, _n_s_b0])
	return _S.Bridge.hypot([(_S.index_value(_n_b_b3,0) + (cos(_n_ang_b1) * _n_len_b2)), (_S.index_value(_n_b_b3,1) + (sin(_n_ang_b1) * _n_len_b2))])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _tuple_0 = _S.arg(_args,0)
	var _n_s_b0 = _S.prop(_tuple_0,0)
	var _n_ang_b1 = _S.prop(_tuple_0,1)
	var _n_len_b2 = _S.prop(_tuple_0,2)
	var _n_wid_b3 = _S.prop(_tuple_0,3)
	var _n_kind_b4 = _S.prop(_tuple_0,4)
	var _n_i_b5 = _S.arg(_args,1)
	var _n_off_b6 = _S.function_value(_S.capture(_parent,{"i":_n_i_b5,"this":_n_this}),"_f24")
	return {"s":_n_s_b0,"ang":_n_ang_b1,"len":_n_len_b2,"wid":_n_wid_b3,"kind":_n_kind_b4,"fold":(1.45 + (fmod(_n_i_b5,6) * 0.04)),"open":((0.06 + ((_n_s_b0 - 0.8) * 0.45)) if _S.truth(_S.binary("===",_n_kind_b4,0)) else ((_n_s_b0 * 0.06) if _S.truth(_S.binary("===",_n_kind_b4,1)) else (0.03 + (_n_s_b0 * 0.05)))),"off":[_S.call_value(_n_off_b6,[]), _S.call_value(_n_off_b6,[])],"gone":[false, false]}
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_SC = _S.read(_parent,"SC")
	var _n_reach = _S.read(_parent,"reach")
	var _n_i = _S.read(_parent,"i")
	var _n_far = _S.read(_parent,"far")
	var _n_R = _S.read(_parent,"R")
	return ((_n_SC + ((1 - (float(_S.index_value(_n_reach,_n_i))/_n_far)) * 0.2)) + _S.invoke(_n_R,"range",[0, 0.04]))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_ease = _S.read(_parent,"ease")
	var _n_CL0 = _S.read(_parent,"CL0")
	var _n_CL1 = _S.read(_parent,"CL1")
	var _n_tt_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(1,(_S.named_value(_n_S,"top") - 2),_S.invoke(_n_ease,"inOutSine",[_S.MathFX.seg(_n_tt_b0,_n_CL0,_n_CL1)]))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.MathFX.smooth(0,0.12,_n_tt_b0) * (1 - _S.MathFX.smooth(3,3.75,_n_tt_b0)))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.numeric_lerp(0.4,1,_S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_tt_b0,0,0.6)])) * _S.numeric_lerp(1,0.12,_S.invoke(_n_ease,"inCubic",[_S.MathFX.seg(_n_tt_b0,2.9,3.6)])))
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_shaftW = _S.read(_parent,"shaftW")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	return (_S.numeric_lerp(8,25,(float((_n_y_b0 - _n_TOP))/(-_n_TOP))) * _S.call_value(_n_shaftW,[_n_tt_b1]))
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.05), func(): return _S.binary("<", _S.read(_e, "t"), 2.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "q", _S.invoke(_S.read(_v57, "R"), "range", [_S.unary("-", 0.9), 0.9]))
		_S.define(_v57, "y", _S.binary("+", _S.read(_v57, "TOP"), _S.invoke(_S.read(_v57, "R"), "range", [8, 24])))
		_S.define(_v57, "v0", _S.invoke(_S.read(_v57, "R"), "range", [50, 90]))
		_S.define(_v57, "life", _S.binary("/", _S.invoke(_S.read(_v57, "Math"), "log", [_S.binary("+", 1, _S.binary("/", _S.binary("*", 3, _S.binary("-", _S.unary("-", _S.read(_v57, "y")), 2)), _S.read(_v57, "v0")))]), 3))
		_S.invoke(_S.read(_v57, "ps"), "spawn", [_S.prop(_S.read(_v57, "P"), "STREAK"), _S.binary("*", _S.read(_v57, "q"), _S.call_value(_S.read(_v57, "halfW"), [_S.read(_v57, "y"), _S.read(_v57, "t")])), _S.read(_v57, "y"), _S.binary("*", _S.read(_v57, "q"), 2), _S.read(_v57, "v0"), _S.read(_v57, "life"), (_S.prop(_S.read(_v57, "C"), 6) if _S.truth(_S.invoke(_S.read(_v57, "R"), "chance", [0.5])) else _S.prop(_S.read(_v57, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 2.8)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), _S.call_value(_S.read(_e, "halfW"), [_S.unary("-", 30), _S.read(_e, "t")])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 90])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 6]), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.read(_e, "WHITE")), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "poured")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POUR")))):
		var _v58 = _S.scope(_e)
		_S.write(_v58, "poured", true, "=", false)
		_S.invoke(_S.read(_v58, "lights"), "add", [0, _S.unary("-", 12), 42, _S.prop(_S.read(_v58, "C"), 5), 0.9, 0.4])
		_S.invoke(_S.read(_v58, "lights"), "add", [0, _S.unary("-", 6), 16, _S.read(_v58, "WHITE"), 0.6, 0.1])
		var _v59 = _S.scope(_v58)
		_S.define(_v59, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "i"), 14)):
			_S.invoke(_S.read(_v59, "ps"), "spawn", [_S.prop(_S.read(_v59, "P"), "STAR"), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 18), 18]), _S.unary("-", _S.invoke(_S.read(_v59, "R"), "range", [0, 6])), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v59, "R"), "range", [10, 50])), _S.invoke(_S.read(_v59, "R"), "range", [0.5, 1.1]), (_S.read(_v59, "WHITE") if _S.truth(_S.invoke(_S.read(_v59, "R"), "chance", [0.5])) else _S.prop(_S.read(_v59, "C"), 6)), _S.invoke(_S.read(_v59, "R"), "range", [0.6, 2.2])])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "+=", true)
		var _v60 = _S.scope(_v58)
		_S.define(_v60, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v60, "i"), 10)):
			var _v61 = _S.scope(_v60)
			_S.define(_v61, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v61, "Math"), "PI")), 2), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v61, "sp", _S.invoke(_S.read(_v61, "R"), "range", [60, 150]))
			_S.invoke(_S.read(_v61, "ps"), "spawn", [_S.prop(_S.read(_v61, "P"), "SPARK"), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v61, "Math"), "cos", [_S.read(_v61, "a")]), _S.read(_v61, "sp")), _S.binary("*", _S.invoke(_S.read(_v61, "Math"), "sin", [_S.read(_v61, "a")]), _S.read(_v61, "sp")), _S.invoke(_S.read(_v61, "R"), "range", [0.25, 0.5])])
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CL0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CL1")))):
		var _v62 = _S.scope(_e)
		_S.define(_v62, "Ly", _S.invoke(_S.read(_v62, "Math"), "round", [_S.call_value(_S.read(_v62, "climbY"), [_S.read(_v62, "t")])]))
		for _v63 in _S.array([_S.read(_v62, "Ly"), _S.binary("+", _S.read(_v62, "Ly"), 1)]):
			var _v64 = _S.scope(_v62)
			_S.define(_v64, "y", _v63)
			var _v65 = _S.scope(_v64)
			_S.define(_v65, "xs", _S.invoke(_S.read(_v65, "rows"), "get", [_S.read(_v65, "y")]))
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v65, "xs")), func(): return _S.unary("!", _S.invoke(_S.read(_v65, "R"), "chance", [0.35])))):
				continue
			_S.define(_v65, "x", _S.invoke(_S.read(_v65, "R"), "pick", [_S.read(_v65, "xs")]))
			_S.define(_v65, "s", _S.invoke(_S.read(_v65, "Math"), "sign", [_S.binary("+", _S.read(_v65, "x"), 0.5)]))
			_S.invoke(_S.read(_v65, "ps"), "spawn", [(_S.prop(_S.read(_v65, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.6])) else _S.prop(_S.read(_v65, "P"), "STAR")), _S.binary("+", _S.read(_v65, "x"), _S.read(_v65, "s")), _S.read(_v65, "y"), _S.binary("*", _S.read(_v65, "s"), _S.invoke(_S.read(_v65, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [15, 45])), _S.invoke(_S.read(_v65, "R"), "range", [0.35, 0.7]), (_S.prop(_S.read(_v65, "C"), 6) if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.5])) else _S.prop(_S.read(_v65, "C"), 5)), _S.invoke(_S.read(_v65, "R"), "range", [0.5, 1.1])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "flashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CL1")))):
		var _v66 = _S.scope(_e)
		_S.write(_v66, "flashed", true, "=", false)
		_S.invoke(_S.read(_v66, "lights"), "add", [0, _S.unary("-", 24), 64, _S.prop(_S.read(_v66, "C"), 5), 0.7, 0.5])
		_S.invoke(_S.read(_v66, "lights"), "add", [0, _S.unary("-", 30), 28, _S.read(_v66, "WHITE"), 0.7, 0.1])
		var _v67 = _S.scope(_v66)
		_S.define(_v67, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v67, "i"), 18)):
			var _v68 = _S.scope(_v67)
			_S.define(_v68, "a", _S.invoke(_S.read(_v68, "R"), "range", [0, _S.read(_v68, "TAU")]))
			_S.define(_v68, "sp", _S.invoke(_S.read(_v68, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v68, "ps"), "spawn", [_S.prop(_S.read(_v68, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "cos", [_S.read(_v68, "a")]), 6), _S.binary("+", _S.unary("-", 24), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "sin", [_S.read(_v68, "a")]), 12)), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "cos", [_S.read(_v68, "a")]), _S.read(_v68, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "sin", [_S.read(_v68, "a")]), _S.read(_v68, "sp")), 0.7), 20), _S.invoke(_S.read(_v68, "R"), "range", [0.4, 0.9]), (_S.read(_v68, "WHITE") if _S.truth(_S.invoke(_S.read(_v68, "R"), "chance", [0.5])) else _S.prop(_S.read(_v68, "C"), 6)), _S.invoke(_S.read(_v68, "R"), "range", [0.6, 2])])
			_v67 = _S.iteration(_v67)
			_S.write(_v67, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "H0"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "H0"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "g", _S.invoke(_S.read(_v69, "R"), "range", [0, _S.read(_v69, "TAU")]))
		_S.define(_v69, "D", _S.invoke(_S.read(_v69, "R"), "range", [14, 24]))
		_S.define(_v69, "x", _S.binary("+", _S.read(_v69, "HX"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.read(_v69, "g")]), _S.read(_v69, "D"))))
		_S.define(_v69, "y", _S.binary("+", _S.read(_v69, "HY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.read(_v69, "g")]), _S.read(_v69, "D")), 0.5)))
		_S.define(_v69, "tx", _S.binary("+", _S.read(_v69, "HX"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.binary("+", _S.read(_v69, "g"), 0.6)]), _S.read(_v69, "HRX"))))
		_S.define(_v69, "ty", _S.binary("+", _S.read(_v69, "HY"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.binary("+", _S.read(_v69, "g"), 0.6)]), _S.read(_v69, "HRY"))))
		_S.define(_v69, "T", _S.invoke(_S.read(_v69, "R"), "range", [0.16, 0.24]))
		_S.define(_v69, "l", _S.logical("||", _S.invoke(_S.read(_v69, "Math"), "hypot", [_S.binary("-", _S.read(_v69, "tx"), _S.read(_v69, "x")), _S.binary("-", _S.read(_v69, "ty"), _S.read(_v69, "y"))]), func(): return 1))
		_S.define(_v69, "v", _S.binary("/", _S.binary("*", _S.read(_v69, "l"), 3), _S.binary("-", _S.invoke(_S.read(_v69, "Math"), "exp", [_S.binary("*", 3, _S.read(_v69, "T"))]), 1)))
		_S.invoke(_S.read(_v69, "ps"), "spawn", [_S.prop(_S.read(_v69, "P"), "STREAK"), _S.read(_v69, "x"), _S.read(_v69, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v69, "tx"), _S.read(_v69, "x")), _S.read(_v69, "l")), _S.read(_v69, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v69, "ty"), _S.read(_v69, "y")), _S.read(_v69, "l")), _S.read(_v69, "v")), _S.read(_v69, "T"), (_S.prop(_S.read(_v69, "C"), 6) if _S.truth(_S.invoke(_S.read(_v69, "R"), "chance", [0.5])) else _S.prop(_S.read(_v69, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "formed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "H1")))):
		var _v70 = _S.scope(_e)
		_S.write(_v70, "formed", true, "=", false)
		_S.invoke(_S.read(_v70, "lights"), "add", [_S.read(_v70, "HX"), _S.read(_v70, "HY"), 30, _S.prop(_S.read(_v70, "C"), 6), 0.8, 0.3])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "W0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "W0"), 0.35))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		for _v71 in _S.array([_S.unary("-", 1), 1]):
			var _v72 = _S.scope(_e)
			_S.define(_v72, "side", _v71)
			var _v73 = _S.scope(_v72)
			_S.define(_v73, "f", _S.invoke(_S.read(_v73, "R"), "pick", [_S.prop(_S.call_value(_S.read(_v73, "wing"), [_S.read(_v73, "t"), _S.read(_v73, "side")]), "out")]))
			if _S.truth(_S.read(_v73, "f")):
				_S.invoke(_S.read(_v73, "ps"), "spawn", [_S.prop(_S.read(_v73, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v73, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v73, "Math"), "cos", [_S.prop(_S.read(_v73, "f"), "ang")]), _S.prop(_S.read(_v73, "f"), "len"))), _S.binary("+", _S.prop(_S.read(_v73, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v73, "Math"), "sin", [_S.prop(_S.read(_v73, "f"), "ang")]), _S.prop(_S.read(_v73, "f"), "len"))), _S.binary("*", _S.read(_v73, "side"), _S.invoke(_S.read(_v73, "R"), "range", [5, 25])), _S.unary("-", _S.invoke(_S.read(_v73, "R"), "range", [5, 25])), _S.invoke(_S.read(_v73, "R"), "range", [0.3, 0.6]), (_S.read(_v73, "WHITE") if _S.truth(_S.invoke(_S.read(_v73, "R"), "chance", [0.5])) else _S.prop(_S.read(_v73, "C"), 6)), _S.invoke(_S.read(_v73, "R"), "range", [0.6, 1.6])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "W0"), 0.45)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SC")))):
		for _v74 in _S.array([_S.unary("-", 1), 1]):
			var _v75 = _S.scope(_e)
			_S.define(_v75, "side", _v74)
			var _v76 = _S.scope(_v75)
			if _S.truth(_S.invoke(_S.read(_v76, "R"), "chance", [0.045])):
				var _v77 = _S.scope(_v76)
				_S.define(_v77, "f", _S.invoke(_S.read(_v77, "R"), "pick", [_S.invoke(_S.prop(_S.call_value(_S.read(_v77, "wing"), [_S.read(_v77, "t"), _S.read(_v77, "side")]), "out"), "filter", [_S.function_value(_v77, "_f30")])]))
				if _S.truth(_S.read(_v77, "f")):
					_S.invoke(_S.read(_v77, "ps"), "spawn", [_S.prop(_S.read(_v77, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v77, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "cos", [_S.prop(_S.read(_v77, "f"), "ang")]), _S.binary("-", _S.prop(_S.read(_v77, "f"), "len"), 2))), _S.binary("+", _S.prop(_S.read(_v77, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "sin", [_S.prop(_S.read(_v77, "f"), "ang")]), _S.binary("-", _S.prop(_S.read(_v77, "f"), "len"), 2))), 0, _S.unary("-", _S.invoke(_S.read(_v77, "R"), "range", [2, 8])), _S.invoke(_S.read(_v77, "R"), "range", [0.3, 0.6]), (_S.read(_v77, "WHITE") if _S.truth(_S.invoke(_S.read(_v77, "R"), "chance", [0.5])) else _S.prop(_S.read(_v77, "C"), 6)), _S.invoke(_S.read(_v77, "R"), "range", [1, 2.4])])
			if _S.truth(_S.invoke(_S.read(_v76, "R"), "chance", [0.03])):
				var _v78 = _S.scope(_v76)
				_S.define(_v78, "f", _S.invoke(_S.read(_v78, "R"), "pick", [_S.prop(_S.call_value(_S.read(_v78, "wing"), [_S.read(_v78, "t"), _S.read(_v78, "side")]), "out")]))
				if _S.truth(_S.read(_v78, "f")):
					_S.invoke(_S.read(_v78, "ps"), "spawn", [_S.prop(_S.read(_v78, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v78, "f"), "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v78, "Math"), "cos", [_S.prop(_S.read(_v78, "f"), "ang")]), _S.prop(_S.read(_v78, "f"), "len")), 0.7)), _S.binary("+", _S.prop(_S.read(_v78, "f"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v78, "Math"), "sin", [_S.prop(_S.read(_v78, "f"), "ang")]), _S.prop(_S.read(_v78, "f"), "len")), 0.7)), _S.invoke(_S.read(_v78, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v78, "R"), "range", [8, 25])), _S.invoke(_S.read(_v78, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v78, "C"), 5)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "beaten")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "B2"), 0.03)))):
		var _v79 = _S.scope(_e)
		_S.write(_v79, "beaten", true, "=", false)
		for _v80 in _S.array([_S.unary("-", 1), 1]):
			var _v81 = _S.scope(_v79)
			_S.define(_v81, "side", _v80)
			var _v82 = _S.scope(_v81)
			_S.invoke(_S.read(_v82, "lights"), "add", [_S.binary("*", _S.read(_v82, "side"), 30), _S.unary("-", 34), 46, _S.prop(_S.read(_v82, "C"), 5), 0.6, 0.4])
			var _v83 = _S.scope(_v82)
			_S.define(_v83, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v83, "i"), 7)):
				_S.invoke(_S.read(_v83, "ps"), "spawn", [_S.prop(_S.read(_v83, "P"), "MOTE"), _S.binary("*", _S.read(_v83, "side"), _S.invoke(_S.read(_v83, "R"), "range", [8, 22])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v83, "side"), _S.invoke(_S.read(_v83, "R"), "range", [90, 160])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [0, 8])), _S.invoke(_S.read(_v83, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v83, "C"), 6) if _S.truth(_S.invoke(_S.read(_v83, "R"), "chance", [0.5])) else _S.prop(_S.read(_v83, "C"), 5)), _S.invoke(_S.read(_v83, "R"), "range", [0.6, 1])])
				_v83 = _S.iteration(_v83)
				_S.write(_v83, "i", 1, "+=", true)
			for _v84 in _S.array(_S.prop(_S.call_value(_S.read(_v82, "wing"), [_S.read(_v82, "t"), _S.read(_v82, "side")]), "out")):
				var _v85 = _S.scope(_v82)
				_S.define(_v85, "f", _v84)
				if _S.truth(_S.binary("===", _S.prop(_S.prop(_S.read(_v85, "f"), "q"), "kind"), 0)):
					var _v86 = _S.scope(_v85)
					_S.define(_v86, "tx", _S.binary("+", _S.prop(_S.read(_v86, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v86, "Math"), "cos", [_S.prop(_S.read(_v86, "f"), "ang")]), _S.prop(_S.read(_v86, "f"), "len"))))
					_S.define(_v86, "ty", _S.binary("+", _S.prop(_S.read(_v86, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v86, "Math"), "sin", [_S.prop(_S.read(_v86, "f"), "ang")]), _S.prop(_S.read(_v86, "f"), "len"))))
					_S.invoke(_S.read(_v86, "ps"), "spawn", [_S.prop(_S.read(_v86, "P"), "SPARK"), _S.read(_v86, "tx"), _S.read(_v86, "ty"), _S.binary("*", _S.read(_v86, "side"), _S.invoke(_S.read(_v86, "R"), "range", [30, 90])), _S.invoke(_S.read(_v86, "R"), "range", [60, 160]), _S.invoke(_S.read(_v86, "R"), "range", [0.3, 0.6])])
			var _v87 = _S.scope(_v82)
			_S.define(_v87, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v87, "i"), 3)):
				var _v88 = _S.scope(_v87)
				_S.define(_v88, "f", _S.invoke(_S.read(_v88, "R"), "pick", [_S.invoke(_S.prop(_S.call_value(_S.read(_v88, "wing"), [_S.read(_v88, "t"), _S.read(_v88, "side")]), "out"), "filter", [_S.function_value(_v88, "_f31")])]))
				if _S.truth(_S.read(_v88, "f")):
					_S.invoke(_S.read(_v88, "loose"), "add", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v88, "f"), "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v88, "Math"), "cos", [_S.prop(_S.read(_v88, "f"), "ang")]), _S.prop(_S.read(_v88, "f"), "len")), 0.6))}, {"y": _S.binary("+", _S.prop(_S.read(_v88, "f"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v88, "Math"), "sin", [_S.prop(_S.read(_v88, "f"), "ang")]), _S.prop(_S.read(_v88, "f"), "len")), 0.6))}, {"vx": _S.binary("*", _S.read(_v88, "side"), _S.invoke(_S.read(_v88, "R"), "range", [20, 70]))}, {"vy": _S.invoke(_S.read(_v88, "R"), "range", [10, 50])}, {"a": _S.prop(_S.read(_v88, "f"), "ang")}, {"len": _S.invoke(_S.read(_v88, "R"), "range", [9, 12])}, {"wid": _S.invoke(_S.read(_v88, "R"), "range", [2.2, 2.8])}, {"life": _S.invoke(_S.read(_v88, "R"), "range", [1.2, 1.6])}, {"side": _S.read(_v88, "side")}])])
				_v87 = _S.iteration(_v87)
				_S.write(_v87, "i", 1, "+=", true)
	for _v89 in _S.array([_S.unary("-", 1), 1]):
		var _v90 = _S.scope(_e)
		_S.define(_v90, "side", _v89)
		var _v91 = _S.scope(_v90)
		_S.define(_v91, "si", (0 if _S.truth(_S.binary(">", _S.read(_v91, "side"), 0)) else 1))
		for _v92 in _S.array(_S.read(_v91, "quills")):
			var _v93 = _S.scope(_v91)
			_S.define(_v93, "q", _v92)
			var _v94 = _S.scope(_v93)
			if _S.truth(_S.logical("||", _S.prop(_S.prop(_S.read(_v94, "q"), "gone"), _S.read(_v94, "si")), func(): return _S.binary("<", _S.read(_v94, "t"), _S.prop(_S.prop(_S.read(_v94, "q"), "off"), _S.read(_v94, "si"))))):
				continue
			_S.set_prop(_S.prop(_S.read(_v94, "q"), "gone"), _S.read(_v94, "si"), true, "=", false)
			_S.define(_v94, "f", _S.invoke(_S.prop(_S.call_value(_S.read(_v94, "wing"), [_S.binary("-", _S.prop(_S.prop(_S.read(_v94, "q"), "off"), _S.read(_v94, "si")), 0.001), _S.read(_v94, "side")]), "out"), "find", [_S.function_value(_v94, "_f32")]))
			if _S.truth(_S.unary("!", _S.read(_v94, "f"))):
				continue
			_S.define(_v94, "ca", _S.invoke(_S.read(_v94, "Math"), "cos", [_S.prop(_S.read(_v94, "f"), "ang")]))
			_S.define(_v94, "sa", _S.invoke(_S.read(_v94, "Math"), "sin", [_S.prop(_S.read(_v94, "f"), "ang")]))
			_S.define(_v94, "n", (0 if _S.truth(_S.binary("===", _S.prop(_S.read(_v94, "q"), "kind"), 2)) else 1))
			var _v95 = _S.scope(_v94)
			_S.define(_v95, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v95, "j"), _S.read(_v95, "n"))):
				var _v96 = _S.scope(_v95)
				_S.define(_v96, "u", 0.55)
				_S.define(_v96, "x", _S.binary("+", _S.prop(_S.read(_v96, "f"), "x"), _S.binary("*", _S.binary("*", _S.read(_v96, "ca"), _S.prop(_S.read(_v96, "f"), "len")), _S.read(_v96, "u"))))
				_S.define(_v96, "y", _S.binary("+", _S.prop(_S.read(_v96, "f"), "y"), _S.binary("*", _S.binary("*", _S.read(_v96, "sa"), _S.prop(_S.read(_v96, "f"), "len")), _S.read(_v96, "u"))))
				_S.define(_v96, "ox", _S.binary("-", _S.read(_v96, "x"), _S.binary("*", _S.read(_v96, "side"), 4)))
				_S.define(_v96, "oy", _S.binary("+", _S.read(_v96, "y"), 20))
				_S.define(_v96, "l", _S.logical("||", _S.invoke(_S.read(_v96, "Math"), "hypot", [_S.read(_v96, "ox"), _S.read(_v96, "oy")]), func(): return 1))
				_S.define(_v96, "sp", _S.invoke(_S.read(_v96, "R"), "range", [60, 150]))
				_S.invoke(_S.read(_v96, "loose"), "add", [_S.merge([{"x": _S.read(_v96, "x")}, {"y": _S.read(_v96, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v96, "ox"), _S.read(_v96, "l")), _S.read(_v96, "sp")), _S.invoke(_S.read(_v96, "R"), "range", [_S.unary("-", 15), 15]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v96, "oy"), _S.read(_v96, "l")), _S.read(_v96, "sp")), 0.5), _S.invoke(_S.read(_v96, "R"), "range", [20, 50]))}, {"a": _S.binary("+", _S.prop(_S.read(_v96, "f"), "ang"), _S.invoke(_S.read(_v96, "R"), "range", [_S.unary("-", 0.4), 0.4]))}, {"len": _S.invoke(_S.read(_v96, "R"), "range", [9, 12])}, {"wid": _S.invoke(_S.read(_v96, "R"), "range", [2.2, 2.8])}, {"life": _S.invoke(_S.read(_v96, "R"), "range", [1, 1.45])}, {"side": _S.read(_v96, "side")}, {"back": _S.invoke(_S.read(_v96, "R"), "chance", [0.35])}])])
				_v95 = _S.iteration(_v95)
				_S.write(_v95, "j", 1, "+=", true)
			var _v97 = _S.scope(_v94)
			_S.define(_v97, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v97, "j"), 2)):
				_S.invoke(_S.read(_v97, "ps"), "spawn", [_S.prop(_S.read(_v97, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v97, "f"), "x"), _S.binary("*", _S.binary("*", _S.read(_v97, "ca"), _S.prop(_S.read(_v97, "f"), "len")), _S.invoke(_S.read(_v97, "R"), "range", [0.3, 1]))), _S.binary("+", _S.prop(_S.read(_v97, "f"), "y"), _S.binary("*", _S.binary("*", _S.read(_v97, "sa"), _S.prop(_S.read(_v97, "f"), "len")), _S.invoke(_S.read(_v97, "R"), "range", [0.3, 1]))), _S.invoke(_S.read(_v97, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v97, "R"), "range", [10, 40])), _S.invoke(_S.read(_v97, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v97, "C"), 5)])
				_v97 = _S.iteration(_v97)
				_S.write(_v97, "j", 1, "+=", true)
			if _S.truth(_S.invoke(_S.read(_v94, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v94, "ps"), "spawn", [_S.prop(_S.read(_v94, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v94, "f"), "x"), _S.binary("*", _S.read(_v94, "ca"), _S.prop(_S.read(_v94, "f"), "len"))), _S.binary("+", _S.prop(_S.read(_v94, "f"), "y"), _S.binary("*", _S.read(_v94, "sa"), _S.prop(_S.read(_v94, "f"), "len"))), 0, _S.unary("-", _S.invoke(_S.read(_v94, "R"), "range", [5, 15])), _S.invoke(_S.read(_v94, "R"), "range", [0.3, 0.6]), _S.read(_v94, "WHITE"), _S.invoke(_S.read(_v94, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 3.35), func(): return _S.binary("<", _S.read(_e, "t"), 3.75)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.4]))):
		var _v98 = _S.scope(_e)
		_S.define(_v98, "g", _S.invoke(_S.read(_v98, "R"), "range", [0, _S.read(_v98, "TAU")]))
		_S.invoke(_S.read(_v98, "ps"), "spawn", [_S.prop(_S.read(_v98, "P"), "EMBER"), _S.binary("+", _S.read(_v98, "HX"), _S.binary("*", _S.invoke(_S.read(_v98, "Math"), "cos", [_S.read(_v98, "g")]), _S.read(_v98, "HRX"))), _S.binary("+", _S.read(_v98, "HY"), _S.binary("*", _S.invoke(_S.read(_v98, "Math"), "sin", [_S.read(_v98, "g")]), _S.read(_v98, "HRY"))), _S.invoke(_S.read(_v98, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v98, "R"), "range", [10, 25])), _S.invoke(_S.read(_v98, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v98, "C"), 5)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "loose"), "update", [_S.read(_e, "dt")])
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_w_b0 = _S.arg(_args,0)
	return _S.binary("===",_S.named_value(_S.named_value(_n_w_b0,"q"),"kind"),0)
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_w_b0 = _S.arg(_args,0)
	return _S.binary("===",_S.named_value(_S.named_value(_n_w_b0,"q"),"kind"),1)
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_w_b0 = _S.arg(_args,0)
	return _S.binary("===",_S.named_value(_n_w_b0,"q"),_n_q)
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_shaft = _S.read(_parent,"shaft")
	var _n_pool = _S.read(_parent,"pool")
	var _n_t = _S.read(_parent,"t")
	var _n_POUR = _S.read(_parent,"POUR")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_FAR = _S.read(_parent,"FAR")
	var _n_band = _S.read(_parent,"band")
	var _n_drawWing = _S.read(_parent,"drawWing")
	var _n_loose = _S.read(_parent,"loose")
	var _n_WING = _S.read(_parent,"WING")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_shaft,[_n_p_b0])
	_S.call_value(_n_pool,[_n_p_b0, true])
	if _S.truth(((_n_t < (_n_POUR + 0.4)) if _S.truth((_n_t > _n_POUR)) else (_n_t > _n_POUR))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (32 * _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4))]))), 0.18, ((2.5 * (1 - _S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4)))) + 0.5), (1.1 - _S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4))), _S.invoke(_n_C,"slice",[3]), _n_FAR, (_n_t < (_n_POUR + 0.06))])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_side_b1 = _iter_0
		_S.call_value(_n_drawWing,[_n_p_b0, _n_side_b1])
	_S.invoke(_n_loose,"draw",[_n_p_b0, _n_WING, "back"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_pool = _S.read(_parent,"pool")
	var _n_t = _S.read(_parent,"t")
	var _n_POUR = _S.read(_parent,"POUR")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_NEAR = _S.read(_parent,"NEAR")
	var _n_band = _S.read(_parent,"band")
	var _n_body = _S.read(_parent,"body")
	var _n_B2 = _S.read(_parent,"B2")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_SC = _S.read(_parent,"SC")
	var _n_S = _S.read(_parent,"S")
	var _n_halo = _S.read(_parent,"halo")
	var _n_CL1 = _S.read(_parent,"CL1")
	var _n_flare = _S.read(_parent,"flare")
	var _n_loose = _S.read(_parent,"loose")
	var _n_WING = _S.read(_parent,"WING")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_pool,[_n_p_b0, false])
	if _S.truth(((_n_t < (_n_POUR + 0.4)) if _S.truth((_n_t > _n_POUR)) else (_n_t > _n_POUR))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (32 * _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4))]))), 0.18, ((2.5 * (1 - _S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4)))) + 0.5), (1.1 - _S.MathFX.seg(_n_t,_n_POUR,(_n_POUR + 0.4))), _S.invoke(_n_C,"slice",[3]), _n_NEAR, (_n_t < (_n_POUR + 0.06))])
	_S.call_value(_n_body,[_n_p_b0])
	if _S.truth(((_n_t < (_n_B2 + 0.45)) if _S.truth((_n_t > (_n_B2 - 0.03))) else (_n_t > (_n_B2 - 0.03)))):
		var _n_u_b2 = _S.MathFX.seg(_n_t,(_n_B2 - 0.03),(_n_B2 + 0.45))
		var _n_fx_b3 = (10 + (70 * _S.invoke(_n_ease,"outCubic",[_n_u_b2])))
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b4 = _iter_0
			if true:
				var _n_d_b5 = 0
				while _S.truth((_n_d_b5 < 12)):
					_S.invoke(_n_p_b0,"dot",[(_n_s_b4 * (_n_fx_b3 - _n_d_b5)), 0, (_n_WHITE if _S.truth((_n_d_b5 < 2)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b5 < 5)) else _S.index_value(_n_C,4))), (((1 - _n_u_b2) * (1 - (float(_n_d_b5)/12))) * 1.3)])
					_n_d_b5 += 1.0
	var _n_wk_b1 = (_S.MathFX.smooth(_n_W0,(_n_W0 + 0.2),_n_t) * (1 - _S.MathFX.smooth(_n_SC,(_n_SC + 0.3),_n_t)))
	if _S.truth((_n_wk_b1 > 0)):
		for _iter_1 in _S.array(_S.named_value(_n_S,"out")):
			var _tuple_2 = _iter_1
			var _n_x_b6 = _S.prop(_tuple_2,0)
			var _n_y_b7 = _S.prop(_tuple_2,1)
			if _S.truth((_n_y_b7 < (-8))):
				_S.invoke(_n_p_b0,"light",[_n_x_b6, _n_y_b7, _S.index_value(_n_C,5), (0.55 * _n_wk_b1)])
		_S.invoke(_n_p_b0,"glow",[0, (-34), 76, _S.index_value(_n_C,4), (0.14 * _n_wk_b1)])
	_S.call_value(_n_halo,[_n_p_b0])
	if _S.truth(((_n_t < (_n_CL1 + 0.22)) if _S.truth((_n_t >= _n_CL1)) else (_n_t >= _n_CL1))):
		_S.call_value(_n_flare,[_n_p_b0, 0, (_S.named_value(_n_S,"top") - 1), (22 * (1 - (float((_n_t - _n_CL1))/0.22))), (1 - (float((_n_t - _n_CL1))/0.22)), _S.invoke(_n_C,"slice",[3])])
	_S.invoke(_n_loose,"draw",[_n_p_b0, _n_WING, "front"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
