@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/rig.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "DUMMY_PAL", _S.import_value("core/actor.js", "DUMMY_PAL"))
	_S.define(_e, "ik", _S.function_value(_e, "_f0"))
	_S.define(_e, "frame", _S.function_value(_e, "_f1"))
	_S.define(_e, "boneFrame", _S.function_value(_e, "_f2"))
	_S.define(_e, "solve", _S.function_value(_e, "_f3"))
	_S.define(_e, "plot", _S.function_value(_e, "_f9"))
	_S.define(_e, "sphere", _S.function_value(_e, "_f10"))
	_S.define(_e, "sweep", _S.function_value(_e, "_f11"))
	_S.define(_e, "ellipsoid", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBody", _S.function_value(_e, "_f13"))
	_S.define(_e, "along", _S.function_value(_e, "_f17"))
	_S.define(_e, "blade", _S.function_value(_e, "_f20"))
	_S.define(_e, "finish", _S.function_value(_e, "_f21"))
	_S.define(_e, "render", _S.function_value(_e, "_f27"))
	_S.define(_e, "shortfall", _S.function_value(_e, "_f28"))
	_S.define(_e, "posed", _S.function_value(_e, "_f29"))
	_S.define(_e, "skeleton", _S.function_value(_e, "_f30"))
	_S.define(_e, "posedParts", _S.function_value(_e, "_f33"))
	_S.define(_e, "PAL", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "DUMMY_PAL")]), "map", [_S.function_value(_e, "_f34")])]))
	_S.define(_e, "INK", _S.prop(_S.read(_e, "PAL"), "k"))
	_S.define(_e, "SEAM", _S.prop(_S.read(_e, "PAL"), "J"))
	_S.define(_e, "MARK", _S.prop(_S.read(_e, "PAL"), "m"))
	_S.define(_e, "SHELL", [_S.prop(_S.read(_e, "PAL"), "A"), _S.prop(_S.read(_e, "PAL"), "B"), _S.prop(_S.read(_e, "PAL"), "C"), _S.prop(_S.read(_e, "PAL"), "D")])
	_S.define(_e, "CORE", [_S.prop(_S.read(_e, "PAL"), "E"), _S.prop(_S.read(_e, "PAL"), "F"), _S.prop(_S.read(_e, "PAL"), "G"), _S.prop(_S.read(_e, "PAL"), "G")])
	_S.define(_e, "DEG", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 180))
	_S.define(_e, "W0", 24)
	_S.define(_e, "H0", 38)
	_S.define(_e, "add", _S.function_value(_e, "_f35"))
	_S.define(_e, "sub", _S.function_value(_e, "_f36"))
	_S.define(_e, "mul", _S.function_value(_e, "_f37"))
	_S.define(_e, "dot", _S.function_value(_e, "_f38"))
	_S.define(_e, "cross", _S.function_value(_e, "_f39"))
	_S.define(_e, "len", _S.function_value(_e, "_f40"))
	_S.define(_e, "unit", _S.function_value(_e, "_f41"))
	_S.define(_e, "rotY", _S.function_value(_e, "_f42"))
	_S.define(_e, "rotZ", _S.function_value(_e, "_f43"))
	_S.define(_e, "mm", _S.function_value(_e, "_f44"))
	_S.define(_e, "mv", _S.function_value(_e, "_f45"))
	_S.define(_e, "tv", _S.function_value(_e, "_f46"))
	_S.define(_e, "clamp01", _S.function_value(_e, "_f47"))
	_S.define(_e, "M", _S.merge([{"pelvis": 19.7}, {"spine1": 2.8}, {"spine2": 4.6}, {"shoulderUp": 2.5}, {"shoulderOut": 5.9}, {"neckUp": 4}, {"headUp": 3.1}, {"hipDown": 1.1}, {"hipOut": 2.8}, {"thigh": 8.6}, {"shin": 8.3}, {"upper": 7.6}, {"fore": 7.4}, {"turn": _S.binary("*", 36, _S.read(_e, "DEG"))}]))
	_S.define(_e, "STAND", _S.merge([{"lean": 0}, {"crouch": 0}, {"yaw": 0}, {"fx": _S.unary("-", 3)}, {"fy": _S.unary("-", 15)}, {"bx": 5}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 2)}, {"ffy": _S.unary("-", 4)}, {"fbx": 3}, {"fby": _S.unary("-", 4)}]))
	_exports["STAND"] = _S.read(_e, "STAND")
	_S.define(_e, "weaponOf", _S.function_value(_e, "_f48"))
	_S.define(_e, "BW", 300)
	_S.define(_e, "BH", 240)
	_S.define(_e, "OX", 150)
	_S.define(_e, "OY", 180)
	_S.define(_e, "Zb", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "Tone", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "Part", _S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "Mat", _S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "Fr", _S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "LX", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "LY", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "Col", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))]))
	_S.define(_e, "touched", [])
	_S.define(_e, "LIGHT", _S.call_value(_S.read(_e, "unit"), [[_S.unary("-", 0.55), 0.72, 0.5]]))
	_S.define(_e, "clipBody", false)
	_S.define(_e, "clipWeapon", false)
	_S.define(_e, "curFrameIndex", 0)
	_S.define(_e, "curDim", 0)
	_S.define(_e, "onlyPart", 0)
	_S.define(_e, "FRAME_IDS", ["pelvis", "waist", "chest", "head", "neck", "upperN", "foreN", "upperF", "foreF", "thighN", "shinN", "thighF", "shinF", "footN", "footF"])
	_S.define(_e, "PART", _S.merge([{"pelvis": 1}, {"waist": 2}, {"chest": 3}, {"neck": 4}, {"head": 5}, {"face": 6}, {"upperN": 7}, {"elbowN": 8}, {"foreN": 9}, {"handN": 10}, {"upperF": 11}, {"elbowF": 12}, {"foreF": 13}, {"handF": 14}, {"thighN": 15}, {"kneeN": 16}, {"shinN": 17}, {"footN": 18}, {"thighF": 19}, {"kneeF": 20}, {"shinF": 21}, {"footF": 22}, {"weapon": 23}, {"offWeapon": 24}]))
	_S.define(_e, "useFrame", _S.function_value(_e, "_f49"))
	_S.define(_e, "STEEL", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.merge([{"hi": "#ffffff"}, {"a": "#e8edf6"}, {"b": "#a4afc6"}, {"d": "#68748f"}, {"gold": "#ffd84a"}, {"goldD": "#b8862a"}, {"grip": "#7a3a2a"}, {"gripD": "#4a2018"}, {"wood": "#8a5a32"}, {"woodD": "#5a3820"}, {"dark": "#3a3448"}, {"darkD": "#262033"}, {"olive": "#58663f"}, {"oliveA": "#7d8c58"}, {"oliveD": "#3a4529"}])]), "map", [_S.function_value(_e, "_f50")])]))
	_S.define(_e, "haft", _S.function_value(_e, "_f51"))
	_S.define(_e, "WEAPONS", _S.merge([{"sword": _S.merge([{"two": _S.unary("-", 4.4)}, {"draw": _S.function_value(_e, "_f52")}])}, {"greatsword": _S.merge([{"two": _S.unary("-", 4.8)}, {"draw": _S.function_value(_e, "_f53")}])}, {"dagger": _S.merge([{"draw": _S.function_value(_e, "_f54")}])}, {"spear": _S.merge([{"two": _S.unary("-", 12)}, {"draw": _S.function_value(_e, "_f55")}])}, {"hammer": _S.merge([{"two": _S.unary("-", 7)}, {"draw": _S.function_value(_e, "_f56")}])}, {"scythe": _S.merge([{"two": _S.unary("-", 11)}, {"draw": _S.function_value(_e, "_f57")}])}, {"claw": _S.merge([{"draw": _S.function_value(_e, "_f58")}])}, {"bow": _S.merge([{"across": true}, {"draw": _S.function_value(_e, "_f59")}])}, {"pistol": _S.merge([{"across": true}, {"draw": _S.function_value(_e, "_f61")}])}, {"launcher": _S.merge([{"two": _S.unary("-", 9)}, {"draw": _S.function_value(_e, "_f62")}])}, {"handle": _S.merge([{"draw": _S.function_value(_e, "_f63")}])}]))
	_exports["WEAPONS"] = _S.read(_e, "WEAPONS")
	_S.define(_e, "turnAll", _S.function_value(_e, "_f64"))
	_S.define(_e, "REST_FRAMES", null)
	_S.write(_e, "REST_FRAMES", _S.prop(_S.call_value(_S.read(_e, "solve"), [_S.merge([])]), "B"), "=", false)
	_S.define(_e, "CACHE", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "keyOf", _S.function_value(_e, "_f66"))
	_exports["shortfall"] = _S.read(_e, "shortfall")
	_exports["posed"] = _S.read(_e, "posed")
	_exports["skeleton"] = _S.read(_e, "skeleton")
	_exports["posedParts"] = _S.read(_e, "posedParts")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_sub = _S.read(_parent,"sub")
	var _n_len = _S.read(_parent,"len")
	var _n_mul = _S.read(_parent,"mul")
	var _n_unit = _S.read(_parent,"unit")
	var _n_dot = _S.read(_parent,"dot")
	var _n_cross = _S.read(_parent,"cross")
	var _n_add = _S.read(_parent,"add")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_target_b1 = _S.arg(_args,1)
	var _n_L1_b2 = _S.arg(_args,2)
	var _n_L2_b3 = _S.arg(_args,3)
	var _n_pole_b4 = _S.arg(_args,4)
	var _n_to_b5 = _S.call_value(_n_sub,[_n_target_b1, _n_a_b0])
	var _n_d_b6 = _S.call_value(_n_len,[_n_to_b5])
	var _n_reach_b7 = ((_n_L1_b2 + _n_L2_b3) - 0.02)
	if _S.truth((_n_d_b6 > _n_reach_b7)):
		_n_to_b5 = _S.call_value(_n_mul,[_n_to_b5, (float(_n_reach_b7)/_n_d_b6)])
		_n_d_b6 = _n_reach_b7
	var _n_u_b8 = _S.call_value(_n_unit,[_n_to_b5])
	var _n_along_b9 = (float((((_n_L1_b2 * _n_L1_b2) - (_n_L2_b3 * _n_L2_b3)) + (_n_d_b6 * _n_d_b6)))/(2 * _n_d_b6))
	var _n_h_b10 = sqrt(maxf(0,((_n_L1_b2 * _n_L1_b2) - (_n_along_b9 * _n_along_b9))))
	var _n_v_b11 = _S.call_value(_n_sub,[_n_pole_b4, _S.call_value(_n_mul,[_n_u_b8, _S.call_value(_n_dot,[_n_pole_b4, _n_u_b8])])])
	_n_v_b11 = (_S.call_value(_n_unit,[_S.call_value(_n_cross,[_n_u_b8, [0, 0, 1]])]) if _S.truth((_S.call_value(_n_len,[_n_v_b11]) < 0.0001)) else _S.call_value(_n_unit,[_n_v_b11]))
	return {"joint":_S.call_value(_n_add,[_n_a_b0, _S.call_value(_n_add,[_S.call_value(_n_mul,[_n_u_b8, _n_along_b9]), _S.call_value(_n_mul,[_n_v_b11, _n_h_b10])])]),"end":_S.call_value(_n_add,[_n_a_b0, _n_to_b5]),"u":_n_u_b8,"v":_n_v_b11}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	return {"t":_n_t_b0,"R":_n_R_b1}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_unit = _S.read(_parent,"unit")
	var _n_sub = _S.read(_parent,"sub")
	var _n_mul = _S.read(_parent,"mul")
	var _n_dot = _S.read(_parent,"dot")
	var _n_cross = _S.read(_parent,"cross")
	var _n_len = _S.read(_parent,"len")
	var _n_frame = _S.read(_parent,"frame")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_pole_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.call_value(_n_unit,[_S.call_value(_n_sub,[_n_b_b1, _n_a_b0])])
	var _n_y_b4 = _S.call_value(_n_sub,[_n_pole_b2, _S.call_value(_n_mul,[_n_x_b3, _S.call_value(_n_dot,[_n_pole_b2, _n_x_b3])])])
	_n_y_b4 = (_S.call_value(_n_unit,[_S.call_value(_n_cross,[_n_x_b3, [0, 0, 1]])]) if _S.truth((_S.call_value(_n_len,[_n_y_b4]) < 0.0001)) else _S.call_value(_n_unit,[_n_y_b4]))
	var _n_z_b5 = _S.call_value(_n_cross,[_n_x_b3, _n_y_b4])
	return _S.call_value(_n_frame,[_n_a_b0, [_S.index_value(_n_x_b3,0), _S.index_value(_n_y_b4,0), _S.index_value(_n_z_b5,0), _S.index_value(_n_x_b3,1), _S.index_value(_n_y_b4,1), _S.index_value(_n_z_b5,1), _S.index_value(_n_x_b3,2), _S.index_value(_n_y_b4,2), _S.index_value(_n_z_b5,2)]])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "q", _S.merge([_S.read(_e, "STAND"), _S.read(_e, "pose")]))
	_S.define(_e, "lean", _S.prop(_S.read(_e, "q"), "lean"))
	_S.define(_e, "W", _S.logical("&&", _S.prop(_S.read(_e, "q"), "weapon"), func(): return _S.call_value(_S.read(_e, "weaponOf"), [_S.prop(_S.read(_e, "q"), "weapon")])))
	_S.define(_e, "OW", _S.logical("&&", _S.prop(_S.read(_e, "q"), "offWeapon"), func(): return _S.call_value(_S.read(_e, "weaponOf"), [_S.prop(_S.read(_e, "q"), "offWeapon")])))
	_S.define(_e, "sa", _S.logical("??", _S.prop(_S.read(_e, "q"), "sa"), func(): return 0))
	_S.define(_e, "wl", _S.logical("??", _S.prop(_S.read(_e, "q"), "wl"), func(): return 1))
	_S.define(_e, "axisZ", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_e, "wl"), _S.read(_e, "wl")))])]), _S.logical("??", _S.prop(_S.read(_e, "q"), "wz"), func(): return 1)))
	_S.define(_e, "axis", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")]), _S.read(_e, "wl")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")])), _S.read(_e, "wl")), _S.read(_e, "axisZ")])
	_S.define(_e, "side", [_S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")])), _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")])), 0])
	_S.define(_e, "two", _S.unary("!", _S.unary("!", _S.logical("&&", _S.prop(_S.read(_e, "q"), "two"), func(): return _S.read(_e, "W")))))
	_S.define(_e, "nearZ", _S.logical("??", _S.prop(_S.read(_e, "q"), "fz"), func(): return (3 if _S.truth(_S.read(_e, "two")) else 4.5)))
	_S.define(_e, "fwd", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "q"), "fx"), _S.prop(_S.read(_e, "STAND"), "fx")), 24))
	_S.define(_e, "farFwd", (0 if _S.truth(_S.read(_e, "two")) else _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "q"), "bx"), _S.prop(_S.read(_e, "STAND"), "bx")), 22)))
	_S.define(_e, "turn", _S.binary("+", _S.prop(_S.read(_e, "M"), "turn"), (_S.binary("*", _S.binary("*", _S.unary("-", 44), _S.read(_e, "DEG")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "fwd")])) if _S.truth(_S.binary(">=", _S.read(_e, "fwd"), 0)) else _S.binary("*", _S.binary("*", 28, _S.read(_e, "DEG")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.unary("-", _S.read(_e, "fwd")), 1.8)])))))
	_S.write(_e, "turn", _S.binary("+", (_S.binary("*", _S.binary("*", 34, _S.read(_e, "DEG")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "farFwd")])) if _S.truth(_S.binary(">", _S.read(_e, "farFwd"), 0)) else 0), _S.binary("*", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "twist"), func(): return 0), 4), _S.read(_e, "DEG"))), "+=", false)
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "q"), "turn"), null)):
		_S.write(_e, "turn", _S.prop(_S.read(_e, "q"), "turn"), "=", false)
	_S.define(_e, "hipTurn", _S.binary("+", _S.prop(_S.read(_e, "M"), "turn"), _S.binary("*", _S.binary("-", _S.read(_e, "turn"), _S.prop(_S.read(_e, "M"), "turn")), 0.45)))
	_S.define(_e, "tilt", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "lean"), 13]))
	_S.define(_e, "Rp", _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotZ"), [_S.binary("*", _S.unary("-", _S.read(_e, "tilt")), 0.25)]), _S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.read(_e, "hipTurn"))])]))
	_S.define(_e, "Rc", _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotZ"), [_S.unary("-", _S.read(_e, "tilt"))]), _S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.read(_e, "turn"))])]))
	_S.define(_e, "ankleN", [_S.prop(_S.read(_e, "q"), "ffx"), _S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "q"), "ffy")), 1.8), _S.logical("??", _S.prop(_S.read(_e, "q"), "fzz"), func(): return 2.4)])
	_S.define(_e, "ankleF", [_S.prop(_S.read(_e, "q"), "fbx"), _S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "q"), "fby")), 1.8), _S.logical("??", _S.prop(_S.read(_e, "q"), "bzz"), func(): return _S.unary("-", 2.4))])
	_S.define(_e, "pelvis", [_S.binary("*", _S.read(_e, "lean"), 0.2), _S.binary("-", _S.prop(_S.read(_e, "M"), "pelvis"), _S.prop(_S.read(_e, "q"), "crouch")), 0])
	_S.define(_e, "hipAt", _S.function_value(_e, "_f4"))
	_S.define(_e, "maxLeg", _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "M"), "thigh"), _S.prop(_S.read(_e, "M"), "shin")), 0.995))
	for _v1 in _S.array([[1, _S.read(_e, "ankleN")], [_S.unary("-", 1), _S.read(_e, "ankleF")]]):
		var _v2 = _S.scope(_e)
		var _v3 = _v1
		_S.define(_v2, "s", _S.prop(_v3, 0))
		_S.define(_v2, "a", _S.prop(_v3, 1))
		var _v4 = _S.scope(_v2)
		_S.define(_v4, "h", _S.call_value(_S.read(_v4, "hipAt"), [_S.read(_v4, "s")]))
		_S.define(_v4, "dx", _S.binary("-", _S.prop(_S.read(_v4, "h"), 0), _S.prop(_S.read(_v4, "a"), 0)))
		_S.define(_v4, "dz", _S.binary("-", _S.prop(_S.read(_v4, "h"), 2), _S.prop(_S.read(_v4, "a"), 2)))
		_S.define(_v4, "flat", _S.binary("+", _S.binary("*", _S.read(_v4, "dx"), _S.read(_v4, "dx")), _S.binary("*", _S.read(_v4, "dz"), _S.read(_v4, "dz"))))
		if _S.truth(_S.binary("<", _S.read(_v4, "flat"), _S.binary("*", _S.read(_v4, "maxLeg"), _S.read(_v4, "maxLeg")))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "top", _S.binary("+", _S.prop(_S.read(_v5, "a"), 1), _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v5, "maxLeg"), _S.read(_v5, "maxLeg")), _S.read(_v5, "flat"))])))
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v5, "h"), 1), _S.read(_v5, "top"))):
				_S.write(_v5, "pelvis", [_S.prop(_S.read(_v5, "pelvis"), 0), _S.binary("-", _S.prop(_S.read(_v5, "pelvis"), 1), _S.binary("-", _S.prop(_S.read(_v5, "h"), 1), _S.read(_v5, "top"))), _S.prop(_S.read(_v5, "pelvis"), 2)], "=", false)
	_S.define(_e, "waist", _S.call_value(_S.read(_e, "add"), [_S.read(_e, "pelvis"), [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "tilt"), 0.45)]), _S.prop(_S.read(_e, "M"), "spine1")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "tilt"), 0.45)]), _S.prop(_S.read(_e, "M"), "spine1")), 0]]))
	_S.define(_e, "chest", _S.call_value(_S.read(_e, "add"), [_S.read(_e, "waist"), [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")]), _S.prop(_S.read(_e, "M"), "spine2")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]), _S.prop(_S.read(_e, "M"), "spine2")), 0]]))
	_S.define(_e, "neck", _S.call_value(_S.read(_e, "add"), [_S.read(_e, "chest"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "Rc"), [0, _S.prop(_S.read(_e, "M"), "neckUp"), 0]])]))
	_S.define(_e, "headTurn", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), "turn"), 0.9), _S.binary("*", _S.binary("-", _S.read(_e, "turn"), _S.prop(_S.read(_e, "M"), "turn")), 0.35)))
	_S.define(_e, "nod", _S.binary("+", _S.binary("*", _S.read(_e, "tilt"), 0.35), _S.binary("*", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "hy"), func(): return 0), 7), _S.read(_e, "DEG"))))
	_S.define(_e, "roll", _S.binary("*", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "hx"), func(): return 0), 7), _S.read(_e, "DEG")))
	_S.define(_e, "Rh", _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotZ"), [_S.binary("-", _S.unary("-", _S.read(_e, "nod")), _S.read(_e, "roll"))]), _S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.read(_e, "headTurn"))])]))
	_S.define(_e, "head", _S.call_value(_S.read(_e, "add"), [_S.read(_e, "neck"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "Rh"), [0.15, _S.prop(_S.read(_e, "M"), "headUp"), 0]])]))
	_S.define(_e, "pick", _S.function_value(_e, "_f5"))
	_S.define(_e, "nearT", [_S.prop(_S.read(_e, "q"), "fx"), _S.unary("-", _S.prop(_S.read(_e, "q"), "fy")), _S.read(_e, "nearZ")])
	_S.define(_e, "farT", ([_S.binary("+", _S.prop(_S.read(_e, "q"), "fx"), _S.binary("*", _S.prop(_S.read(_e, "axis"), 0), _S.prop(_S.read(_e, "W"), "two"))), _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "q"), "fy")), _S.binary("*", _S.prop(_S.read(_e, "axis"), 1), _S.prop(_S.read(_e, "W"), "two"))), _S.binary("+", _S.read(_e, "nearZ"), _S.binary("*", _S.prop(_S.read(_e, "axis"), 2), _S.prop(_S.read(_e, "W"), "two")))] if _S.truth(_S.read(_e, "two")) else [_S.prop(_S.read(_e, "q"), "bx"), _S.unary("-", _S.prop(_S.read(_e, "q"), "by")), _S.logical("??", _S.prop(_S.read(_e, "q"), "bz"), func(): return (5.5 if _S.truth(_S.prop(_S.read(_e, "q"), "armsFront")) else _S.unary("-", 4.5)))]))
	_S.define(_e, "sN", _S.call_value(_S.read(_e, "pick"), [1, _S.read(_e, "nearT")]))
	_S.define(_e, "sF", _S.call_value(_S.read(_e, "pick"), [_S.unary("-", 1), _S.read(_e, "farT")]))
	_S.define(_e, "pole", _S.function_value(_e, "_f6"))
	_S.define(_e, "holdN", ((_S.read(_e, "side") if _S.truth(_S.prop(_S.read(_e, "W"), "across")) else _S.read(_e, "axis")) if _S.truth(_S.read(_e, "W")) else null))
	_S.define(_e, "holdF", ((_S.read(_e, "side") if _S.truth(_S.prop(_S.read(_e, "W"), "across")) else _S.read(_e, "axis")) if _S.truth(_S.read(_e, "two")) else ([_S.invoke(_S.read(_e, "Math"), "cos", [_S.logical("??", _S.prop(_S.read(_e, "q"), "sb"), func(): return _S.prop(_S.read(_e, "Math"), "PI"))]), _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.logical("??", _S.prop(_S.read(_e, "q"), "sb"), func(): return _S.prop(_S.read(_e, "Math"), "PI"))])), 0] if _S.truth(_S.read(_e, "OW")) else null)))
	_S.define(_e, "armN", _S.call_value(_S.read(_e, "ik"), [_S.read(_e, "sN"), _S.read(_e, "nearT"), _S.prop(_S.read(_e, "M"), "upper"), _S.prop(_S.read(_e, "M"), "fore"), _S.call_value(_S.read(_e, "pole"), [1, _S.read(_e, "nearT"), _S.read(_e, "sN"), _S.read(_e, "holdN")])]))
	_S.define(_e, "armF", _S.call_value(_S.read(_e, "ik"), [_S.read(_e, "sF"), _S.read(_e, "farT"), _S.prop(_S.read(_e, "M"), "upper"), _S.prop(_S.read(_e, "M"), "fore"), _S.call_value(_S.read(_e, "pole"), [_S.unary("-", 1), _S.read(_e, "farT"), _S.read(_e, "sF"), _S.read(_e, "holdF")])]))
	_S.define(_e, "kneePole", _S.function_value(_e, "_f7"))
	_S.define(_e, "hipN", _S.call_value(_S.read(_e, "hipAt"), [1]))
	_S.define(_e, "hipF", _S.call_value(_S.read(_e, "hipAt"), [_S.unary("-", 1)]))
	_S.define(_e, "legN", _S.call_value(_S.read(_e, "ik"), [_S.read(_e, "hipN"), _S.read(_e, "ankleN"), _S.prop(_S.read(_e, "M"), "thigh"), _S.prop(_S.read(_e, "M"), "shin"), _S.call_value(_S.read(_e, "kneePole"), [1])]))
	_S.define(_e, "legF", _S.call_value(_S.read(_e, "ik"), [_S.read(_e, "hipF"), _S.read(_e, "ankleF"), _S.prop(_S.read(_e, "M"), "thigh"), _S.prop(_S.read(_e, "M"), "shin"), _S.call_value(_S.read(_e, "kneePole"), [_S.unary("-", 1)])]))
	_S.define(_e, "footDir", _S.function_value(_e, "_f8"))
	_S.define(_e, "B", _S.merge([{"pelvis": _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "pelvis"), _S.read(_e, "Rp")])}, {"waist": _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "waist"), _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotZ"), [_S.binary("*", _S.unary("-", _S.read(_e, "tilt")), 0.6)]), _S.call_value(_S.read(_e, "rotY"), [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "turn"), _S.read(_e, "hipTurn"))), 2)])])])}, {"chest": _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "chest"), _S.read(_e, "Rc")])}, {"head": _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "head"), _S.read(_e, "Rh")])}, {"neck": _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "neck"), _S.read(_e, "Rh")])}, {"upperN": _S.call_value(_S.read(_e, "boneFrame"), [_S.read(_e, "sN"), _S.prop(_S.read(_e, "armN"), "joint"), _S.prop(_S.read(_e, "armN"), "v")])}, {"foreN": _S.call_value(_S.read(_e, "boneFrame"), [_S.prop(_S.read(_e, "armN"), "joint"), _S.prop(_S.read(_e, "armN"), "end"), _S.prop(_S.read(_e, "armN"), "v")])}, {"upperF": _S.call_value(_S.read(_e, "boneFrame"), [_S.read(_e, "sF"), _S.prop(_S.read(_e, "armF"), "joint"), _S.prop(_S.read(_e, "armF"), "v")])}, {"foreF": _S.call_value(_S.read(_e, "boneFrame"), [_S.prop(_S.read(_e, "armF"), "joint"), _S.prop(_S.read(_e, "armF"), "end"), _S.prop(_S.read(_e, "armF"), "v")])}, {"thighN": _S.call_value(_S.read(_e, "boneFrame"), [_S.read(_e, "hipN"), _S.prop(_S.read(_e, "legN"), "joint"), _S.prop(_S.read(_e, "legN"), "v")])}, {"shinN": _S.call_value(_S.read(_e, "boneFrame"), [_S.prop(_S.read(_e, "legN"), "joint"), _S.prop(_S.read(_e, "legN"), "end"), _S.prop(_S.read(_e, "legN"), "v")])}, {"thighF": _S.call_value(_S.read(_e, "boneFrame"), [_S.read(_e, "hipF"), _S.prop(_S.read(_e, "legF"), "joint"), _S.prop(_S.read(_e, "legF"), "v")])}, {"shinF": _S.call_value(_S.read(_e, "boneFrame"), [_S.prop(_S.read(_e, "legF"), "joint"), _S.prop(_S.read(_e, "legF"), "end"), _S.prop(_S.read(_e, "legF"), "v")])}]))
	_S.set_prop(_S.read(_e, "B"), "footN", _S.call_value(_S.read(_e, "frame"), [_S.prop(_S.read(_e, "legN"), "end"), _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.prop(_S.call_value(_S.read(_e, "footDir"), [1]), 2), _S.prop(_S.call_value(_S.read(_e, "footDir"), [1]), 0)]))]), _S.call_value(_S.read(_e, "rotZ"), [(_S.binary("*", _S.unary("-", 55), _S.read(_e, "DEG")) if _S.truth(_S.prop(_S.read(_e, "q"), "toeF")) else 0)])])]), "=", false)
	_S.set_prop(_S.read(_e, "B"), "footF", _S.call_value(_S.read(_e, "frame"), [_S.prop(_S.read(_e, "legF"), "end"), _S.call_value(_S.read(_e, "mm"), [_S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.prop(_S.call_value(_S.read(_e, "footDir"), [_S.unary("-", 1)]), 2), _S.prop(_S.call_value(_S.read(_e, "footDir"), [_S.unary("-", 1)]), 0)]))]), _S.call_value(_S.read(_e, "rotZ"), [(_S.binary("*", _S.unary("-", 55), _S.read(_e, "DEG")) if _S.truth(_S.prop(_S.read(_e, "q"), "toeB")) else 0)])])]), "=", false)
	return _S.merge([{"B": _S.read(_e, "B")}, {"W": _S.read(_e, "W")}, {"OW": _S.read(_e, "OW")}, {"q": _S.read(_e, "q")}, {"axis": _S.read(_e, "axis")}, {"side": _S.read(_e, "side")}, {"armN": _S.read(_e, "armN")}, {"armF": _S.read(_e, "armF")}, {"legN": _S.read(_e, "legN")}, {"legF": _S.read(_e, "legF")}, {"sN": _S.read(_e, "sN")}, {"sF": _S.read(_e, "sF")}, {"hipN": _S.read(_e, "hipN")}, {"hipF": _S.read(_e, "hipF")}, {"turn": _S.read(_e, "turn")}])

static func _f4(_parent,_args:Array,_this=null):
	var _n_add = _S.read(_parent,"add")
	var _n_pelvis = _S.read(_parent,"pelvis")
	var _n_mv = _S.read(_parent,"mv")
	var _n_Rp = _S.read(_parent,"Rp")
	var _n_M = _S.read(_parent,"M")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.call_value(_n_add,[_n_pelvis, _S.call_value(_n_mv,[_n_Rp, [0, (-_S.named_value(_n_M,"hipDown")), (_n_s_b0 * _S.named_value(_n_M,"hipOut"))]])])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_add = _S.read(_parent,"add")
	var _n_chest = _S.read(_parent,"chest")
	var _n_mv = _S.read(_parent,"mv")
	var _n_Rc = _S.read(_parent,"Rc")
	var _n_M = _S.read(_parent,"M")
	var _n_sub = _S.read(_parent,"sub")
	var _n_len = _S.read(_parent,"len")
	var _n_mul = _S.read(_parent,"mul")
	var _n_unit = _S.read(_parent,"unit")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_target_b1 = _S.arg(_args,1)
	var _n_base_b2 = _S.call_value(_n_add,[_n_chest, _S.call_value(_n_mv,[_n_Rc, [0, _S.named_value(_n_M,"shoulderUp"), (_n_s_b0 * _S.named_value(_n_M,"shoulderOut"))]])])
	var _n_to_b3 = _S.call_value(_n_sub,[_n_target_b1, _n_base_b2])
	var _n_d_b4 = _S.call_value(_n_len,[_n_to_b3])
	return _S.call_value(_n_add,[_n_base_b2, _S.call_value(_n_mul,[_S.call_value(_n_unit,[_n_to_b3]), minf(1.8,(maxf(0,(_n_d_b4 - 11)) * 0.35))])])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_clamp01 = _S.read(_parent,"clamp01")
	var _n_unit = _S.read(_parent,"unit")
	var _n_sub = _S.read(_parent,"sub")
	var _n_cross = _S.read(_parent,"cross")
	var _n_add = _S.read(_parent,"add")
	var _n_mul = _S.read(_parent,"mul")
	var _n_ik = _S.read(_parent,"ik")
	var _n_M = _S.read(_parent,"M")
	var _n_dot = _S.read(_parent,"dot")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_T_b1 = _S.arg(_args,1)
	var _n_shoulder_b2 = _S.arg(_args,2)
	var _n_hold_b3 = _S.arg(_args,3)
	var _n_up_b4 = _S.call_value(_n_clamp01,[(float(((_S.index_value(_n_T_b1,1) - _S.index_value(_n_shoulder_b2,1)) + 2))/10)])
	var _n_base_b5 = [((-0.55) + (_n_up_b4 * 1.1)), ((-1) + (_n_up_b4 * 0.9)), (_n_s_b0 * (0.45 + (_n_up_b4 * 0.5)))]
	if _S.truth(not _S.truth(_n_hold_b3)):
		return _n_base_b5
	var _n_u_b6 = _S.call_value(_n_unit,[_S.call_value(_n_sub,[_n_T_b1, _n_shoulder_b2])])
	var _n_best_b7 = _n_base_b5
	var _n_score_b8 = INF
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 16)):
			var _n_a_b10 = (((float(_n_i_b9)/16) * PI) * 2)
			var _n_x_b11 = _S.call_value(_n_unit,[_S.call_value(_n_cross,[_n_u_b6, [0.3, 1, 0.2]])])
			var _n_y_b12 = _S.call_value(_n_cross,[_n_u_b6, _n_x_b11])
			var _n_v_b13 = _S.call_value(_n_add,[_S.call_value(_n_mul,[_n_x_b11, cos(_n_a_b10)]), _S.call_value(_n_mul,[_n_y_b12, sin(_n_a_b10)])])
			var _n_A_b14 = _S.call_value(_n_ik,[_n_shoulder_b2, _n_T_b1, _S.named_value(_n_M,"upper"), _S.named_value(_n_M,"fore"), _n_v_b13])
			var _n_f_b15 = _S.call_value(_n_unit,[_S.call_value(_n_sub,[_S.named_value(_n_A_b14,"end"), _S.named_value(_n_A_b14,"joint")])])
			var _n_cost_b16 = ((absf(_S.call_value(_n_dot,[_n_f_b15, _n_hold_b3])) * 0.7) + ((1 - _S.call_value(_n_dot,[_S.call_value(_n_unit,[_n_base_b5]), _n_v_b13])) * 0.55))
			if _S.truth((_n_cost_b16 < _n_score_b8)):
				_n_score_b8 = _n_cost_b16
				_n_best_b7 = _n_v_b13
			_n_i_b9 += 1.0
	return _n_best_b7
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_mv = _S.read(_parent,"mv")
	var _n_Rp = _S.read(_parent,"Rp")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.call_value(_n_mv,[_n_Rp, [1, 0, (_n_s_b0 * 0.35)]])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_hipTurn = _S.read(_parent,"hipTurn")
	var _n_DEG = _S.read(_parent,"DEG")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_t_b1 = ((_n_hipTurn * 0.6) + ((_n_s_b0 * 8) * _n_DEG))
	return [cos(_n_t_b1), 0, sin(_n_t_b1)]
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_onlyPart = _S.read(_parent,"onlyPart")
	var _n_Part = _S.read(_parent,"Part")
	var _n_touched = _S.read(_parent,"touched")
	var _n_Zb = _S.read(_parent,"Zb")
	var _n_Tone = _S.read(_parent,"Tone")
	var _n_Mat = _S.read(_parent,"Mat")
	var _n_Fr = _S.read(_parent,"Fr")
	var _n_curFrameIndex = _S.read(_parent,"curFrameIndex")
	var _n_LX = _S.read(_parent,"LX")
	var _n_LY = _S.read(_parent,"LY")
	var _n_Col = _S.read(_parent,"Col")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_z_b1 = _S.arg(_args,1)
	var _n_tone_b2 = _S.arg(_args,2)
	var _n_part_b3 = _S.arg(_args,3)
	var _n_mat_b4 = _S.arg(_args,4)
	var _n_wx_b5 = _S.arg(_args,5)
	var _n_wy_b6 = _S.arg(_args,6)
	var _n_color_b7 = _S.arg(_args,7)
	if _S.truth((_S.binary("!==",_n_part_b3,_n_onlyPart) if _S.truth(_n_onlyPart) else _n_onlyPart)):
		return null
	if _S.truth(_S.binary("===",_S.index_value(_n_Part,_n_i_b0),0)):
		_S.invoke(_n_touched,"push",[_n_i_b0])
	else:
		if _S.truth((_n_z_b1 <= _S.index_value(_n_Zb,_n_i_b0))):
			return null
	_S.set_prop(_n_Zb,_n_i_b0,_n_z_b1,"=")
	_S.set_prop(_n_Tone,_n_i_b0,_n_tone_b2,"=")
	_S.set_prop(_n_Part,_n_i_b0,_n_part_b3,"=")
	_S.set_prop(_n_Mat,_n_i_b0,_n_mat_b4,"=")
	_S.set_prop(_n_Fr,_n_i_b0,_n_curFrameIndex,"=")
	_S.set_prop(_n_LX,_n_i_b0,_n_wx_b5,"=")
	_S.set_prop(_n_LY,_n_i_b0,_n_wy_b6,"=")
	_S.set_prop(_n_Col,_n_i_b0,_n_color_b7,"=")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_clipBody = _S.read(_parent,"clipBody")
	var _n_OY = _S.read(_parent,"OY")
	var _n_BW = _S.read(_parent,"BW")
	var _n_OX = _S.read(_parent,"OX")
	var _n_plot = _S.read(_parent,"plot")
	var _n_dot = _S.read(_parent,"dot")
	var _n_LIGHT = _S.read(_parent,"LIGHT")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_part_b2 = _S.arg(_args,2)
	var _n_mat_b3 = _S.arg(_args,3)
	var _n_x0_b4 = floori((_S.index_value(_n_c_b0,0) - _n_r_b1))
	var _n_x1_b5 = ceili((_S.index_value(_n_c_b0,0) + _n_r_b1))
	var _n_y0_b6 = floori((_S.index_value(_n_c_b0,1) - _n_r_b1))
	var _n_y1_b7 = ceili((_S.index_value(_n_c_b0,1) + _n_r_b1))
	if true:
		var _n_wy_b8 = _n_y0_b6
		while _S.truth((_n_wy_b8 <= _n_y1_b7)):
			if true:
				var _n_wx_b9 = _n_x0_b4
				while _S.truth((_n_wx_b9 <= _n_x1_b5)):
					var _n_dx_b10 = (_n_wx_b9 - _S.index_value(_n_c_b0,0))
					var _n_dy_b11 = (_n_wy_b8 - _S.index_value(_n_c_b0,1))
					var _n_d2_b12 = ((_n_dx_b10 * _n_dx_b10) + (_n_dy_b11 * _n_dy_b11))
					if _S.truth(((_n_d2_b12 > (_n_r_b1 * _n_r_b1)) if _S.truth((_n_d2_b12 > (_n_r_b1 * _n_r_b1))) else ((_n_wy_b8 < 1.5) if _S.truth(_n_clipBody) else _n_clipBody))):
						_n_wx_b9 += 1.0
						continue
					var _n_dz_b13 = sqrt(((_n_r_b1 * _n_r_b1) - _n_d2_b12))
					var _n_n_b14 = [(float(_n_dx_b10)/_n_r_b1), (float(_n_dy_b11)/_n_r_b1), (float(_n_dz_b13)/_n_r_b1)]
					var _n_i_b15 = (((_n_OY - _n_wy_b8) * _n_BW) + (_n_OX + _n_wx_b9))
					_S.call_value(_n_plot,[_n_i_b15, (_S.index_value(_n_c_b0,2) + _n_dz_b13), _S.call_value(_n_dot,[_n_n_b14, _n_LIGHT]), _n_part_b2, _n_mat_b3, _n_wx_b9, _n_wy_b8, 0])
					_n_wx_b9 += 1.0
			_n_wy_b8 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_len = _S.read(_parent,"len")
	var _n_sub = _S.read(_parent,"sub")
	var _n_sphere = _S.read(_parent,"sphere")
	var _n_add = _S.read(_parent,"add")
	var _n_mul = _S.read(_parent,"mul")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_ra_b2 = _S.arg(_args,2)
	var _n_rb_b3 = _S.arg(_args,3)
	var _n_part_b4 = _S.arg(_args,4)
	var _n_mat_b5 = _S.arg(_args,5)
	var _n_bulge_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_n_b7 = maxf(2,ceili((float(_S.call_value(_n_len,[_S.call_value(_n_sub,[_n_b_b1, _n_a_b0])]))/0.4)))
	if true:
		var _n_k_b8 = 0
		while _S.truth((_n_k_b8 <= _n_n_b7)):
			var _n_u_b9 = (float(_n_k_b8)/_n_n_b7)
			_S.call_value(_n_sphere,[_S.call_value(_n_add,[_n_a_b0, _S.call_value(_n_mul,[_S.call_value(_n_sub,[_n_b_b1, _n_a_b0]), _n_u_b9])]), ((_n_ra_b2 + ((_n_rb_b3 - _n_ra_b2) * _n_u_b9)) + (_n_bulge_b6 * sin((_n_u_b9 * PI)))), _n_part_b4, _n_mat_b5])
			_n_k_b8 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_clipBody = _S.read(_parent,"clipBody")
	var _n_unit = _S.read(_parent,"unit")
	var _n_plot = _S.read(_parent,"plot")
	var _n_OY = _S.read(_parent,"OY")
	var _n_BW = _S.read(_parent,"BW")
	var _n_OX = _S.read(_parent,"OX")
	var _n_dot = _S.read(_parent,"dot")
	var _n_LIGHT = _S.read(_parent,"LIGHT")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_part_b3 = _S.arg(_args,3)
	var _n_mat_b4 = _S.arg(_args,4)
	var _n_big_b5 = maxf(maxf(_S.index_value(_n_r_b2,0),_S.index_value(_n_r_b2,1)),_S.index_value(_n_r_b2,2))
	var _n_x0_b6 = floori((_S.index_value(_n_c_b0,0) - _n_big_b5))
	var _n_x1_b7 = ceili((_S.index_value(_n_c_b0,0) + _n_big_b5))
	var _n_y0_b8 = floori((_S.index_value(_n_c_b0,1) - _n_big_b5))
	var _n_y1_b9 = ceili((_S.index_value(_n_c_b0,1) + _n_big_b5))
	var _n_Rt_b10 = [_S.index_value(_n_R_b1,0), _S.index_value(_n_R_b1,3), _S.index_value(_n_R_b1,6), _S.index_value(_n_R_b1,1), _S.index_value(_n_R_b1,4), _S.index_value(_n_R_b1,7), _S.index_value(_n_R_b1,2), _S.index_value(_n_R_b1,5), _S.index_value(_n_R_b1,8)]
	var _n_D_b11 = [(float(1)/(_S.index_value(_n_r_b2,0) * _S.index_value(_n_r_b2,0))), (float(1)/(_S.index_value(_n_r_b2,1) * _S.index_value(_n_r_b2,1))), (float(1)/(_S.index_value(_n_r_b2,2) * _S.index_value(_n_r_b2,2)))]
	var _n_A_b12 = _S.construct(_n_Array,[9])
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < 3)):
			if true:
				var _n_j_b14 = 0
				while _S.truth((_n_j_b14 < 3)):
					_S.set_prop(_n_A_b12,((_n_i_b13 * 3) + _n_j_b14),((((_S.index_value(_n_R_b1,(_n_i_b13 * 3)) * _S.index_value(_n_D_b11,0)) * _S.index_value(_n_R_b1,(_n_j_b14 * 3))) + ((_S.index_value(_n_R_b1,((_n_i_b13 * 3) + 1)) * _S.index_value(_n_D_b11,1)) * _S.index_value(_n_R_b1,((_n_j_b14 * 3) + 1)))) + ((_S.index_value(_n_R_b1,((_n_i_b13 * 3) + 2)) * _S.index_value(_n_D_b11,2)) * _S.index_value(_n_R_b1,((_n_j_b14 * 3) + 2)))),"=")
					_n_j_b14 += 1.0
			_n_i_b13 += 1.0
	_n_Rt_b10
	if true:
		var _n_wy_b15 = _n_y0_b8
		while _S.truth((_n_wy_b15 <= _n_y1_b9)):
			if true:
				var _n_wx_b16 = _n_x0_b6
				while _S.truth((_n_wx_b16 <= _n_x1_b7)):
					if _S.truth(((_n_wy_b15 < 1.5) if _S.truth(_n_clipBody) else _n_clipBody)):
						_n_wx_b16 += 1.0
						continue
					var _n_dx_b17 = (_n_wx_b16 - _S.index_value(_n_c_b0,0))
					var _n_dy_b18 = (_n_wy_b15 - _S.index_value(_n_c_b0,1))
					var _n_qa_b19 = _S.index_value(_n_A_b12,8)
					var _n_qb_b20 = (2 * ((_S.index_value(_n_A_b12,2) * _n_dx_b17) + (_S.index_value(_n_A_b12,5) * _n_dy_b18)))
					var _n_qc_b21 = (((((_S.index_value(_n_A_b12,0) * _n_dx_b17) * _n_dx_b17) + (((2 * _S.index_value(_n_A_b12,1)) * _n_dx_b17) * _n_dy_b18)) + ((_S.index_value(_n_A_b12,4) * _n_dy_b18) * _n_dy_b18)) - 1)
					var _n_disc_b22 = ((_n_qb_b20 * _n_qb_b20) - ((4 * _n_qa_b19) * _n_qc_b21))
					if _S.truth((_n_disc_b22 < 0)):
						_n_wx_b16 += 1.0
						continue
					var _n_dz_b23 = (float(((-_n_qb_b20) + sqrt(_n_disc_b22)))/(2 * _n_qa_b19))
					var _n_n_b24 = _S.call_value(_n_unit,[[(((_S.index_value(_n_A_b12,0) * _n_dx_b17) + (_S.index_value(_n_A_b12,1) * _n_dy_b18)) + (_S.index_value(_n_A_b12,2) * _n_dz_b23)), (((_S.index_value(_n_A_b12,3) * _n_dx_b17) + (_S.index_value(_n_A_b12,4) * _n_dy_b18)) + (_S.index_value(_n_A_b12,5) * _n_dz_b23)), (((_S.index_value(_n_A_b12,6) * _n_dx_b17) + (_S.index_value(_n_A_b12,7) * _n_dy_b18)) + (_S.index_value(_n_A_b12,8) * _n_dz_b23))]])
					_S.call_value(_n_plot,[(((_n_OY - _n_wy_b15) * _n_BW) + (_n_OX + _n_wx_b16)), (_S.index_value(_n_c_b0,2) + _n_dz_b23), _S.call_value(_n_dot,[_n_n_b24, _n_LIGHT]), _n_part_b3, _n_mat_b4, _n_wx_b16, _n_wy_b15, 0])
					_n_wx_b16 += 1.0
			_n_wy_b15 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_useFrame = _S.read(_parent,"useFrame")
	var _n_ellipsoid = _S.read(_parent,"ellipsoid")
	var _n_add = _S.read(_parent,"add")
	var _n_mv = _S.read(_parent,"mv")
	var _n_PART = _S.read(_parent,"PART")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_S_b0 = _S.arg(_args,0)
	var _object_0 = _n_S_b0
	var _n_B_b1 = _S.named_value(_object_0,"B")
	var _n_armN_b2 = _S.named_value(_object_0,"armN")
	var _n_armF_b3 = _S.named_value(_object_0,"armF")
	var _n_legN_b4 = _S.named_value(_object_0,"legN")
	var _n_legF_b5 = _S.named_value(_object_0,"legF")
	var _n_sN_b6 = _S.named_value(_object_0,"sN")
	var _n_sF_b7 = _S.named_value(_object_0,"sF")
	var _n_hipN_b8 = _S.named_value(_object_0,"hipN")
	var _n_hipF_b9 = _S.named_value(_object_0,"hipF")
	var _n_turn_b10 = _S.named_value(_object_0,"turn")
	var _n_F__b11 = _S.function_value(_S.capture(_parent,{"B":_n_B_b1,"this":_this}),"_f14")
	_S.call_value(_n_useFrame,["pelvis"])
	_S.call_value(_n_ellipsoid,[_S.call_value(_n_add,[_S.named_value(_S.call_value(_n_F__b11,["pelvis"]),"t"), _S.call_value(_n_mv,[_S.named_value(_S.call_value(_n_F__b11,["pelvis"]),"R"), [0, (-0.2), 0]])]), _S.named_value(_S.call_value(_n_F__b11,["pelvis"]),"R"), [2.9, 2.6, 4.2], _S.named_value(_n_PART,"pelvis"), 0])
	_S.call_value(_n_useFrame,["waist"])
	_S.call_value(_n_sweep,[_S.named_value(_S.call_value(_n_F__b11,["pelvis"]),"t"), _S.named_value(_S.call_value(_n_F__b11,["chest"]),"t"), 3, 3.3, _S.named_value(_n_PART,"waist"), 1])
	_S.call_value(_n_useFrame,["chest"])
	_S.call_value(_n_ellipsoid,[_S.call_value(_n_add,[_S.named_value(_S.call_value(_n_F__b11,["chest"]),"t"), _S.call_value(_n_mv,[_S.named_value(_S.call_value(_n_F__b11,["chest"]),"R"), [0.2, 0.9, 0]])]), _S.named_value(_S.call_value(_n_F__b11,["chest"]),"R"), [3.4, 4.2, 5.5], _S.named_value(_n_PART,"chest"), 0])
	_S.call_value(_n_useFrame,["neck"])
	_S.call_value(_n_sweep,[_S.named_value(_S.call_value(_n_F__b11,["neck"]),"t"), _S.call_value(_n_add,[_S.named_value(_S.call_value(_n_F__b11,["neck"]),"t"), _S.call_value(_n_mv,[_S.named_value(_S.call_value(_n_F__b11,["head"]),"R"), [0, 1.6, 0]])]), 1.25, 1.15, _S.named_value(_n_PART,"neck"), 1])
	_S.call_value(_n_useFrame,["head"])
	_S.call_value(_n_ellipsoid,[_S.named_value(_S.call_value(_n_F__b11,["head"]),"t"), _S.named_value(_S.call_value(_n_F__b11,["head"]),"R"), [3, 3.3, 2.8], _S.named_value(_n_PART,"head"), 0])
	_S.call_value(_n_ellipsoid,[_S.call_value(_n_add,[_S.named_value(_S.call_value(_n_F__b11,["head"]),"t"), _S.call_value(_n_mv,[_S.named_value(_S.call_value(_n_F__b11,["head"]),"R"), [0.85, (-0.45), 0]])]), _S.named_value(_S.call_value(_n_F__b11,["head"]),"R"), [2.4, 2.7, 2.35], _S.named_value(_n_PART,"face"), 0])
	var _n_arm_b12 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f15")
	_S.call_value(_n_arm_b12,[false, _n_armN_b2, _n_sN_b6, _S.named_value(_n_PART,"upperN"), _S.named_value(_n_PART,"elbowN"), _S.named_value(_n_PART,"foreN"), _S.named_value(_n_PART,"handN"), "upperN", "foreN"])
	_S.call_value(_n_arm_b12,[true, _n_armF_b3, _n_sF_b7, _S.named_value(_n_PART,"upperF"), _S.named_value(_n_PART,"elbowF"), _S.named_value(_n_PART,"foreF"), _S.named_value(_n_PART,"handF"), "upperF", "foreF"])
	var _n_leg_b13 = _S.function_value(_S.capture(_parent,{"F_":_n_F__b11,"this":_this}),"_f16")
	_S.call_value(_n_leg_b13,[false, _n_legN_b4, _n_hipN_b8, _S.named_value(_n_PART,"thighN"), _S.named_value(_n_PART,"kneeN"), _S.named_value(_n_PART,"shinN"), _S.named_value(_n_PART,"footN"), "thighN", "shinN", "footN"])
	_S.call_value(_n_leg_b13,[true, _n_legF_b5, _n_hipF_b9, _S.named_value(_n_PART,"thighF"), _S.named_value(_n_PART,"kneeF"), _S.named_value(_n_PART,"shinF"), _S.named_value(_n_PART,"footF"), "thighF", "shinF", "footF"])
	_n_turn_b10
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_name_b0 = _S.arg(_args,0)
	return _S.index_value(_n_B,_n_name_b0)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "far", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "sh", _S.arg(_args, 2))
	_S.define(_e, "up", _S.arg(_args, 3))
	_S.define(_e, "el", _S.arg(_args, 4))
	_S.define(_e, "fo", _S.arg(_args, 5))
	_S.define(_e, "ha", _S.arg(_args, 6))
	_S.define(_e, "nameU", _S.arg(_args, 7))
	_S.define(_e, "nameF", _S.arg(_args, 8))
	_S.write(_e, "curDim", (1 if _S.truth(_S.read(_e, "far")) else 0), "=", false)
	_S.call_value(_S.read(_e, "useFrame"), [_S.read(_e, "nameU")])
	_S.call_value(_S.read(_e, "sphere"), [_S.read(_e, "sh"), 2.5, _S.read(_e, "up"), 0])
	_S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "sh"), _S.prop(_S.read(_e, "A"), "joint"), 2.1, 1.6, _S.read(_e, "up"), 0])
	_S.call_value(_S.read(_e, "sphere"), [_S.prop(_S.read(_e, "A"), "joint"), 1.45, _S.read(_e, "el"), 1])
	_S.call_value(_S.read(_e, "useFrame"), [_S.read(_e, "nameF")])
	_S.call_value(_S.read(_e, "sweep"), [_S.prop(_S.read(_e, "A"), "joint"), _S.prop(_S.read(_e, "A"), "end"), 1.6, 1.2, _S.read(_e, "fo"), 0, 0.15])
	_S.call_value(_S.read(_e, "sphere"), [_S.prop(_S.read(_e, "A"), "end"), 1.9, _S.read(_e, "ha"), 0])
	_S.write(_e, "curDim", 0, "=", false)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_useFrame = _S.read(_parent,"useFrame")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_sphere = _S.read(_parent,"sphere")
	var _n_F_ = _S.read(_parent,"F_")
	var _n_add = _S.read(_parent,"add")
	var _n_mv = _S.read(_parent,"mv")
	var _n_far_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_hip_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.arg(_args,3)
	var _n_kn_b4 = _S.arg(_args,4)
	var _n_sh_b5 = _S.arg(_args,5)
	var _n_fo_b6 = _S.arg(_args,6)
	var _n_nameT_b7 = _S.arg(_args,7)
	var _n_nameS_b8 = _S.arg(_args,8)
	var _n_nameFt_b9 = _S.arg(_args,9)
	_S.call_value(_n_useFrame,[_n_nameT_b7])
	_S.call_value(_n_sweep,[_n_hip_b2, _S.named_value(_n_L_b1,"joint"), 3.2, 2.2, _n_th_b3, 0])
	_S.call_value(_n_sphere,[_S.named_value(_n_L_b1,"joint"), 1.9, _n_kn_b4, 1])
	_S.call_value(_n_useFrame,[_n_nameS_b8])
	_S.call_value(_n_sweep,[_S.named_value(_n_L_b1,"joint"), _S.named_value(_n_L_b1,"end"), 2.15, 1.4, _n_sh_b5, 0, 0.4])
	_S.call_value(_n_useFrame,[_n_nameFt_b9])
	var _n_R_b10 = _S.named_value(_S.call_value(_n_F_,[_n_nameFt_b9]),"R")
	var _n_a_b11 = _S.named_value(_S.call_value(_n_F_,[_n_nameFt_b9]),"t")
	_S.call_value(_n_sweep,[_S.call_value(_n_add,[_n_a_b11, _S.call_value(_n_mv,[_n_R_b10, [(-1.5), (-0.6), 0]])]), _S.call_value(_n_add,[_n_a_b11, _S.call_value(_n_mv,[_n_R_b10, [4.6, (-1.1), 0]])]), 1.7, 1.25, _n_fo_b6, 0])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_cross = _S.read(_parent,"cross")
	var _n_H_b0 = _S.arg(_args,0)
	var _n_axis_b1 = _S.arg(_args,1)
	var _n_side_b2 = _S.arg(_args,2)
	var _n_part_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.call_value(_n_cross,[_n_axis_b1, _n_side_b2])
	var _n_T_b5 = _S.function_value(_S.capture(_parent,{"H":_n_H_b0,"axis":_n_axis_b1,"side":_n_side_b2,"n":_n_n_b4,"part":_n_part_b3,"this":_this}),"_f18")
	_S.set_prop(_n_T_b5,"at",_S.function_value(_S.capture(_parent,{"H":_n_H_b0,"axis":_n_axis_b1,"side":_n_side_b2,"this":_this}),"_f19"),"=")
	return _n_T_b5
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "lift", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 0), _S.binary("*", _S.prop(_S.read(_e, "axis"), 0), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 0), _S.read(_e, "k"))), _S.binary("*", _S.prop(_S.read(_e, "n"), 0), _S.read(_e, "lift"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 1), _S.binary("*", _S.prop(_S.read(_e, "axis"), 1), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 1), _S.read(_e, "k"))), _S.binary("*", _S.prop(_S.read(_e, "n"), 1), _S.read(_e, "lift"))))
	_S.define(_e, "z", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 2), _S.binary("*", _S.prop(_S.read(_e, "axis"), 2), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 2), _S.read(_e, "k"))), _S.binary("*", _S.prop(_S.read(_e, "n"), 2), _S.read(_e, "lift"))))
	_S.define(_e, "wx", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "wy", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	if _S.truth(_S.logical("&&", _S.read(_e, "clipWeapon"), func(): return _S.binary("<", _S.read(_e, "wy"), 0))):
		return null
	_S.define(_e, "idx", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "OY"), _S.read(_e, "wy")), _S.read(_e, "BW")), _S.binary("+", _S.read(_e, "OX"), _S.read(_e, "wx"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "idx"), 0), func(): return _S.binary(">=", _S.read(_e, "idx"), _S.binary("*", _S.read(_e, "BW"), _S.read(_e, "BH"))))):
		return null
	_S.write(_e, "curFrameIndex", _S.unary("-", 1), "=", false)
	_S.call_value(_S.read(_e, "plot"), [_S.read(_e, "idx"), _S.binary("+", _S.read(_e, "z"), 0.05), 2, _S.read(_e, "part"), 2, _S.read(_e, "wx"), _S.read(_e, "wy"), _S.read(_e, "c")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_axis = _S.read(_parent,"axis")
	var _n_side = _S.read(_parent,"side")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return [((_S.index_value(_n_H,0) + (_S.index_value(_n_axis,0) * _n_i_b0)) + (_S.index_value(_n_side,0) * _n_k_b1)), ((_S.index_value(_n_H,1) + (_S.index_value(_n_axis,1) * _n_i_b0)) + (_S.index_value(_n_side,1) * _n_k_b1)), ((_S.index_value(_n_H,2) + (_S.index_value(_n_axis,2) * _n_i_b0)) + (_S.index_value(_n_side,2) * _n_k_b1))]
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	var _n_from_b1 = _S.arg(_args,1)
	var _n_length_b2 = _S.arg(_args,2)
	var _n_w_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = _n_from_b1
		while _S.truth((_n_i_b4 <= ((_n_from_b1 + _n_length_b2) + 0.01))):
			var _n_r_b5 = (_n_i_b4 - _n_from_b1)
			var _n_wd_b6 = (maxf(0,((float((_n_length_b2 - _n_r_b5))/5) * _n_w_b3)) if _S.truth((_n_r_b5 > (_n_length_b2 - 5))) else _n_w_b3)
			if true:
				var _n_k_b7 = (-_n_wd_b6)
				while _S.truth((_n_k_b7 <= (_n_wd_b6 + 0.01))):
					_S.call_value(_n_T_b0,[_n_i_b4, _n_k_b7, (_S.named_value(_n_STEEL,"hi") if _S.truth((_n_k_b7 < ((-_n_w_b3) * 0.4))) else (_S.named_value(_n_STEEL,"d") if _S.truth((_n_k_b7 > (_n_w_b3 * 0.4))) else _S.named_value(_n_STEEL,"a")))])
					_n_k_b7 += 0.4
			_n_i_b4 += 0.4
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "restFrames", _S.arg(_args, 1))
	_S.define(_e, "dim", _S.function_value(_e, "_f22"))
	_S.define(_e, "toneOf", _S.function_value(_e, "_f23"))
	_S.define(_e, "tones", _S.construct(_S.read(_e, "Map"), []))
	for _v23 in _S.array(_S.read(_e, "touched")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "i", _v23)
		_S.invoke(_S.read(_v24, "tones"), "set", [_S.read(_v24, "i"), _S.call_value(_S.read(_v24, "toneOf"), [_S.prop(_S.read(_v24, "Tone"), _S.read(_v24, "i")), _S.prop(_S.read(_v24, "Part"), _S.read(_v24, "i"))])])
	for _v25 in _S.array(_S.read(_e, "touched")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "i", _v25)
		var _v27 = _S.scope(_v26)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v27, "Mat"), _S.read(_v27, "i")), 2)):
			continue
		_S.define(_v27, "t", _S.invoke(_S.read(_v27, "tones"), "get", [_S.read(_v27, "i")]))
		_S.define(_v27, "votes", [0, 0, 0, 0])
		_S.define(_v27, "same", false)
		for _v28 in _S.array([_S.unary("-", 1), 1, _S.unary("-", _S.read(_v27, "BW")), _S.read(_v27, "BW")]):
			var _v29 = _S.scope(_v27)
			_S.define(_v29, "d", _v28)
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "j", _S.binary("+", _S.read(_v30, "i"), _S.read(_v30, "d")))
			if _S.truth(_S.logical("||", _S.binary("!==", _S.prop(_S.read(_v30, "Part"), _S.read(_v30, "j")), _S.prop(_S.read(_v30, "Part"), _S.read(_v30, "i"))), func(): return _S.unary("!", _S.invoke(_S.read(_v30, "tones"), "has", [_S.read(_v30, "j")])))):
				continue
			_S.define(_v30, "u", _S.invoke(_S.read(_v30, "tones"), "get", [_S.read(_v30, "j")]))
			_S.set_prop(_S.read(_v30, "votes"), _S.read(_v30, "u"), 1, "+=", true)
			if _S.truth(_S.binary("===", _S.read(_v30, "u"), _S.read(_v30, "t"))):
				_S.write(_v30, "same", true, "=", false)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v27, "same")), func(): return _S.invoke(_S.read(_v27, "votes"), "some", [_S.function_value(_v27, "_f24")]))):
			_S.invoke(_S.read(_v27, "tones"), "set", [_S.read(_v27, "i"), _S.invoke(_S.read(_v27, "votes"), "indexOf", [_S.invoke(_S.read(_v27, "Math"), "max", _S.concat([_S.array(_S.read(_v27, "votes"))]))])])
	for _v31 in _S.array(_S.read(_e, "touched")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "i", _v31)
		var _v33 = _S.scope(_v32)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v33, "Mat"), _S.read(_v33, "i")), 2)):
			continue
		_S.set_prop(_S.read(_v33, "Col"), _S.read(_v33, "i"), _S.prop((_S.read(_v33, "CORE") if _S.truth(_S.binary("===", _S.prop(_S.read(_v33, "Mat"), _S.read(_v33, "i")), 1)) else _S.read(_v33, "SHELL")), _S.invoke(_S.read(_v33, "tones"), "get", [_S.read(_v33, "i")])), "=", false)
	_S.define(_e, "marks", _S.construct(_S.read(_e, "Map"), []))
	for _v34 in _S.array(_S.read(_e, "touched")):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "i", _v34)
		var _v36 = _S.scope(_v35)
		for _v37 in _S.array([1, _S.read(_v36, "BW")]):
			var _v38 = _S.scope(_v36)
			_S.define(_v38, "d", _v37)
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "j", _S.binary("+", _S.read(_v39, "i"), _S.read(_v39, "d")))
			if _S.truth(_S.logical("||", _S.binary("===", _S.prop(_S.read(_v39, "Part"), _S.read(_v39, "j")), 0), func(): return _S.binary("===", _S.prop(_S.read(_v39, "Part"), _S.read(_v39, "j")), _S.prop(_S.read(_v39, "Part"), _S.read(_v39, "i"))))):
				continue
			_S.define(_v39, "far", (_S.read(_v39, "i") if _S.truth(_S.binary("<", _S.prop(_S.read(_v39, "Zb"), _S.read(_v39, "i")), _S.prop(_S.read(_v39, "Zb"), _S.read(_v39, "j")))) else _S.read(_v39, "j")))
			_S.define(_v39, "dz", _S.invoke(_S.read(_v39, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v39, "Zb"), _S.read(_v39, "i")), _S.prop(_S.read(_v39, "Zb"), _S.read(_v39, "j")))]))
			_S.define(_v39, "steel", _S.logical("||", _S.binary("===", _S.prop(_S.read(_v39, "Mat"), _S.read(_v39, "i")), 2), func(): return _S.binary("===", _S.prop(_S.read(_v39, "Mat"), _S.read(_v39, "j")), 2)))
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v39, "Mat"), _S.read(_v39, "far")), 2), func(): return _S.binary("<", _S.read(_v39, "dz"), 1))):
				continue
			_S.define(_v39, "ink", _S.logical("||", _S.read(_v39, "steel"), func(): return _S.binary(">", _S.read(_v39, "dz"), 2.2)))
			if _S.truth(_S.read(_v39, "ink")):
				_S.invoke(_S.read(_v39, "marks"), "set", [_S.read(_v39, "far"), _S.read(_v39, "INK")])
			else:
				if _S.truth(_S.unary("!", _S.invoke(_S.read(_v39, "marks"), "has", [_S.read(_v39, "far")]))):
					_S.invoke(_S.read(_v39, "marks"), "set", [_S.read(_v39, "far"), _S.read(_v39, "SEAM")])
	for _v40 in _S.array(_S.read(_e, "marks")):
		var _v41 = _S.scope(_e)
		var _v42 = _v40
		_S.define(_v41, "i", _S.prop(_v42, 0))
		_S.define(_v41, "c", _S.prop(_v42, 1))
		_S.set_prop(_S.read(_v41, "Col"), _S.read(_v41, "i"), _S.read(_v41, "c"), "=", false)
	var _v43 = _S.read(_e, "S")
	_S.define(_e, "B", _S.prop(_v43, "B"))
	_S.define(_e, "chestAt", _S.call_value(_S.read(_e, "add"), [_S.prop(_S.prop(_S.read(_e, "B"), "chest"), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.prop(_S.read(_e, "B"), "chest"), "R"), [3, 1.6, _S.unary("-", 1.8)]])]))
	if _S.truth(_S.binary(">", _S.prop(_S.call_value(_S.read(_e, "mv"), [_S.prop(_S.prop(_S.read(_e, "B"), "chest"), "R"), [1, 0, 0]]), 2), 0.15)):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v44, "OY"), _S.invoke(_S.read(_v44, "Math"), "round", [_S.prop(_S.read(_v44, "chestAt"), 1)])), _S.read(_v44, "BW")), _S.binary("+", _S.read(_v44, "OX"), _S.invoke(_S.read(_v44, "Math"), "round", [_S.prop(_S.read(_v44, "chestAt"), 0)]))))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v44, "Part"), _S.read(_v44, "i")), _S.prop(_S.read(_v44, "PART"), "chest"))):
			_S.set_prop(_S.read(_v44, "Col"), _S.read(_v44, "i"), _S.read(_v44, "MARK"), "=", false)
	_S.define(_e, "list", _S.invoke(_S.read(_e, "touched"), "slice", []))
	_S.define(_e, "ring", _S.construct(_S.read(_e, "Map"), []))
	for _v45 in _S.array(_S.read(_e, "list")):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "i", _v45)
		for _v47 in _S.array([_S.unary("-", 1), 1, _S.unary("-", _S.read(_v46, "BW")), _S.read(_v46, "BW")]):
			var _v48 = _S.scope(_v46)
			_S.define(_v48, "d", _v47)
			var _v49 = _S.scope(_v48)
			_S.define(_v49, "j", _S.binary("+", _S.read(_v49, "i"), _S.read(_v49, "d")))
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v49, "Part"), _S.read(_v49, "j")), 0), func(): return _S.unary("!", _S.invoke(_S.read(_v49, "ring"), "has", [_S.read(_v49, "j")])))):
				_S.invoke(_S.read(_v49, "ring"), "set", [_S.read(_v49, "j"), _S.read(_v49, "i")])
	_S.define(_e, "n", _S.binary("+", _S.prop(_S.read(_e, "list"), "length"), _S.prop(_S.read(_e, "ring"), "size")))
	_S.define(_e, "out", _S.merge([{"n": _S.read(_e, "n")}, {"xs": _S.construct(_S.read(_e, "Int16Array"), [_S.read(_e, "n")])}, {"ys": _S.construct(_S.read(_e, "Int16Array"), [_S.read(_e, "n")])}, {"color": _S.construct(_S.read(_e, "Uint32Array"), [_S.read(_e, "n")])}, {"src": _S.construct(_S.read(_e, "Int16Array"), [_S.read(_e, "n")])}, {"ink": _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "n")])}, {"x0": 0}, {"y0": 0}, {"x1": 0}, {"y1": 0}]))
	_S.define(_e, "srcFor", _S.function_value(_e, "_f25"))
	_S.define(_e, "k", 0)
	_S.define(_e, "x0", 1000000000)
	_S.define(_e, "y0", 1000000000)
	_S.define(_e, "x1", _S.unary("-", 1000000000))
	_S.define(_e, "y1", _S.unary("-", 1000000000))
	_S.define(_e, "push", _S.function_value(_e, "_f26"))
	for _v50 in _S.array(_S.read(_e, "list")):
		var _v51 = _S.scope(_e)
		_S.define(_v51, "i", _v50)
		_S.call_value(_S.read(_v51, "push"), [_S.read(_v51, "i"), _S.prop(_S.read(_v51, "Col"), _S.read(_v51, "i")), _S.call_value(_S.read(_v51, "srcFor"), [_S.read(_v51, "i")]), _S.binary("===", _S.prop(_S.read(_v51, "Col"), _S.read(_v51, "i")), _S.read(_v51, "INK"))])
	for _v52 in _S.array(_S.read(_e, "ring")):
		var _v53 = _S.scope(_e)
		var _v54 = _v52
		_S.define(_v53, "j", _S.prop(_v54, 0))
		_S.define(_v53, "i", _S.prop(_v54, 1))
		_S.call_value(_S.read(_v53, "push"), [_S.read(_v53, "j"), _S.read(_v53, "INK"), _S.call_value(_S.read(_v53, "srcFor"), [_S.read(_v53, "i")]), true])
	_S.define(_e, "zs", 0)
	for _v55 in _S.array(_S.read(_e, "list")):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "i", _v55)
		_S.write(_v56, "zs", _S.prop(_S.read(_v56, "Zb"), _S.read(_v56, "i")), "+=", false)
	_S.invoke(_S.read(_e, "Object"), "assign", [_S.read(_e, "out"), _S.merge([{"x0": _S.read(_e, "x0")}, {"y0": _S.read(_e, "y0")}, {"x1": _S.read(_e, "x1")}, {"y1": _S.read(_e, "y1")}, {"z": (_S.binary("/", _S.read(_e, "zs"), _S.prop(_S.read(_e, "list"), "length")) if _S.truth(_S.prop(_S.read(_e, "list"), "length")) else 0)}])])
	for _v57 in _S.array(_S.read(_e, "list")):
		var _v58 = _S.scope(_e)
		_S.define(_v58, "i", _v57)
		_S.set_prop(_S.read(_v58, "Part"), _S.read(_v58, "i"), 0, "=", false)
	_S.set_prop(_S.read(_e, "touched"), "length", 0, "=", false)
	return _S.read(_e, "out")

static func _f22(_parent,_args:Array,_this=null):
	var _n_PART = _S.read(_parent,"PART")
	var _n_part_b0 = _S.arg(_args,0)
	return (1 if _S.truth(((_n_part_b0 <= _S.named_value(_n_PART,"handF")) if _S.truth((_n_part_b0 >= _S.named_value(_n_PART,"upperF"))) else (_n_part_b0 >= _S.named_value(_n_PART,"upperF")))) else (1 if _S.truth(((_n_part_b0 <= _S.named_value(_n_PART,"footF")) if _S.truth((_n_part_b0 >= _S.named_value(_n_PART,"thighF"))) else (_n_part_b0 >= _S.named_value(_n_PART,"thighF")))) else 0))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_dim = _S.read(_parent,"dim")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_part_b1 = _S.arg(_args,1)
	var _n_t_b2 = (0 if _S.truth((_n_v_b0 > 0.8)) else (1 if _S.truth((_n_v_b0 > 0.42)) else (2 if _S.truth((_n_v_b0 > 0.08)) else 3)))
	_n_t_b2 = minf(3,(_n_t_b2 + _S.call_value(_n_dim,[_n_part_b1])))
	return _n_t_b2
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_v_b0 > 0)
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_Fr = _S.read(_parent,"Fr")
	var _n_restFrames = _S.read(_parent,"restFrames")
	var _n_FRAME_IDS = _S.read(_parent,"FRAME_IDS")
	var _n_B = _S.read(_parent,"B")
	var _n_BW = _S.read(_parent,"BW")
	var _n_OX = _S.read(_parent,"OX")
	var _n_OY = _S.read(_parent,"OY")
	var _n_Zb = _S.read(_parent,"Zb")
	var _n_tv = _S.read(_parent,"tv")
	var _n_sub = _S.read(_parent,"sub")
	var _n_add = _S.read(_parent,"add")
	var _n_mv = _S.read(_parent,"mv")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_H0 = _S.read(_parent,"H0")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.index_value(_n_Fr,_n_i_b0)
	if _S.truth(((_n_f_b1 < 0) if _S.truth((_n_f_b1 < 0)) else not _S.truth(_n_restFrames))):
		return (-1)
	var _n_name_b2 = _S.index_value(_n_FRAME_IDS,_n_f_b1)
	var _n_A_b3 = _S.index_value(_n_B,_n_name_b2)
	var _n_R0_b4 = _S.index_value(_n_restFrames,_n_name_b2)
	var _n_wx_b5 = (fmod(_n_i_b0,_n_BW) - _n_OX)
	var _n_wy_b6 = (_n_OY - _S.binary("|",(float(_n_i_b0)/_n_BW),0))
	var _n_P_b7 = [_n_wx_b5, _n_wy_b6, _S.index_value(_n_Zb,_n_i_b0)]
	var _n_lp_b8 = _S.call_value(_n_tv,[_S.named_value(_n_A_b3,"R"), _S.call_value(_n_sub,[_n_P_b7, _S.named_value(_n_A_b3,"t")])])
	var _n_rp_b9 = _S.call_value(_n_add,[_S.named_value(_n_R0_b4,"t"), _S.call_value(_n_mv,[_S.named_value(_n_R0_b4,"R"), _n_lp_b8])])
	var _n_c_b10 = (floori(_S.index_value(_n_rp_b9,0)+0.5) + 12)
	var _n_r_b11 = (38 - floori(_S.index_value(_n_rp_b9,1)+0.5))
	return ((-1) if _S.truth(((((_n_c_b10 < 0) if _S.truth((_n_c_b10 < 0)) else (_n_r_b11 < 0)) if _S.truth(((_n_c_b10 < 0) if _S.truth((_n_c_b10 < 0)) else (_n_r_b11 < 0))) else (_n_c_b10 >= _n_W0)) if _S.truth((((_n_c_b10 < 0) if _S.truth((_n_c_b10 < 0)) else (_n_r_b11 < 0)) if _S.truth(((_n_c_b10 < 0) if _S.truth((_n_c_b10 < 0)) else (_n_r_b11 < 0))) else (_n_c_b10 >= _n_W0))) else (_n_r_b11 >= _n_H0))) else ((_n_r_b11 * _n_W0) + _n_c_b10))
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "isInk", _S.arg(_args, 3))
	_S.define(_e, "x", _S.binary("-", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "BW")), _S.read(_e, "OX")))
	_S.define(_e, "y", _S.binary("-", _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "BW")), 0), _S.read(_e, "OY")))
	_S.set_prop(_S.prop(_S.read(_e, "out"), "xs"), _S.read(_e, "k"), _S.read(_e, "x"), "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "out"), "ys"), _S.read(_e, "k"), _S.read(_e, "y"), "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "out"), "color"), _S.read(_e, "k"), _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "out"), "src"), _S.read(_e, "k"), _S.read(_e, "s"), "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "out"), "ink"), _S.read(_e, "k"), (1 if _S.truth(_S.read(_e, "isInk")) else 0), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.read(_e, "x0"))):
		_S.write(_e, "x0", _S.read(_e, "x"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.read(_e, "x1"))):
		_S.write(_e, "x1", _S.read(_e, "x"), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.read(_e, "y0"))):
		_S.write(_e, "y0", _S.read(_e, "y"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.read(_e, "y1"))):
		_S.write(_e, "y1", _S.read(_e, "y"), "=", false)
	_S.write(_e, "k", 1, "+=", true)
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "solve"), [_S.read(_e, "pose")]))
	_S.define(_e, "q", _S.prop(_S.read(_e, "S"), "q"))
	_S.define(_e, "whole", _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "q"), "yaw"), func(): return 0), (_S.prop(_S.read(_e, "Math"), "PI") if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "q"), "face"), _S.unary("-", 1))) else 0)))
	if _S.truth(_S.read(_e, "whole")):
		_S.call_value(_S.read(_e, "turnAll"), [_S.read(_e, "S"), _S.read(_e, "whole")])
	_S.define(_e, "air", _S.binary("<", _S.logical("??", _S.prop(_S.read(_e, "q"), "y"), func(): return 0), _S.unary("-", 0.5)))
	_S.write(_e, "clipBody", _S.unary("!", _S.read(_e, "air")), "=", false)
	_S.write(_e, "clipWeapon", _S.unary("!", _S.read(_e, "air")), "=", false)
	_S.call_value(_S.read(_e, "drawBody"), [_S.read(_e, "S")])
	_S.write(_e, "clipBody", false, "=", false)
	if _S.truth(_S.prop(_S.read(_e, "S"), "W")):
		_S.invoke(_S.prop(_S.read(_e, "S"), "W"), "draw", [_S.call_value(_S.read(_e, "along"), [_S.prop(_S.prop(_S.read(_e, "S"), "armN"), "end"), _S.prop(_S.read(_e, "S"), "axis"), _S.prop(_S.read(_e, "S"), "side"), _S.prop(_S.read(_e, "PART"), "weapon")]), _S.read(_e, "q"), _S.prop(_S.prop(_S.read(_e, "S"), "armF"), "end")])
	if _S.truth(_S.prop(_S.read(_e, "S"), "OW")):
		var _v59 = _S.scope(_e)
		_S.define(_v59, "sb", _S.logical("??", _S.prop(_S.read(_v59, "q"), "sb"), func(): return _S.prop(_S.read(_v59, "Math"), "PI")))
		_S.define(_v59, "ax", [_S.invoke(_S.read(_v59, "Math"), "cos", [_S.read(_v59, "sb")]), _S.unary("-", _S.invoke(_S.read(_v59, "Math"), "sin", [_S.read(_v59, "sb")])), 0])
		_S.define(_v59, "sd", [_S.unary("-", _S.invoke(_S.read(_v59, "Math"), "sin", [_S.read(_v59, "sb")])), _S.unary("-", _S.invoke(_S.read(_v59, "Math"), "cos", [_S.read(_v59, "sb")])), 0])
		if _S.truth(_S.read(_v59, "whole")):
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "R", _S.call_value(_S.read(_v60, "rotY"), [_S.unary("-", _S.read(_v60, "whole"))]))
			_S.write(_v60, "ax", _S.call_value(_S.read(_v60, "mv"), [_S.read(_v60, "R"), _S.read(_v60, "ax")]), "=", false)
			_S.write(_v60, "sd", _S.call_value(_S.read(_v60, "mv"), [_S.read(_v60, "R"), _S.read(_v60, "sd")]), "=", false)
		_S.invoke(_S.prop(_S.read(_v59, "S"), "OW"), "draw", [_S.call_value(_S.read(_v59, "along"), [_S.prop(_S.prop(_S.read(_v59, "S"), "armF"), "end"), _S.read(_v59, "ax"), _S.read(_v59, "sd"), _S.prop(_S.read(_v59, "PART"), "offWeapon")]), _S.read(_v59, "q"), _S.prop(_S.prop(_S.read(_v59, "S"), "armF"), "end")])
	_S.write(_e, "clipWeapon", false, "=", false)
	return _S.call_value(_S.read(_e, "finish"), [_S.read(_e, "S"), _S.read(_e, "REST_FRAMES")])

static func _f28(_parent,_args:Array,_this=null):
	var _n_solve = _S.read(_parent,"solve")
	var _n_len = _S.read(_parent,"len")
	var _n_sub = _S.read(_parent,"sub")
	var _n_pose_b0 = _S.arg(_args,0)
	var _n_S_b1 = _S.call_value(_n_solve,[_n_pose_b0])
	var _n_q_b2 = _S.named_value(_n_S_b1,"q")
	var _n_near_b3 = _S.call_value(_n_len,[_S.call_value(_n_sub,[_S.named_value(_S.named_value(_n_S_b1,"armN"),"end"), [_S.named_value(_n_q_b2,"fx"), (-_S.named_value(_n_q_b2,"fy")), _S.index_value(_S.named_value(_S.named_value(_n_S_b1,"armN"),"end"),2)]])])
	var _n_far_b4 = (0 if _S.truth(_S.named_value(_n_q_b2,"two")) else _S.call_value(_n_len,[_S.call_value(_n_sub,[_S.named_value(_S.named_value(_n_S_b1,"armF"),"end"), [_S.named_value(_n_q_b2,"bx"), (-_S.named_value(_n_q_b2,"by")), _S.index_value(_S.named_value(_S.named_value(_n_S_b1,"armF"),"end"),2)]])]))
	return maxf(_n_near_b3,_n_far_b4)
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "key", _S.call_value(_S.read(_e, "keyOf"), [_S.read(_e, "pose")]))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "CACHE"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "r"))):
		var _v61 = _S.scope(_e)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v61, "CACHE"), "size"), 6000)):
			_S.invoke(_S.read(_v61, "CACHE"), "clear", [])
		_S.invoke(_S.read(_v61, "CACHE"), "set", [_S.read(_v61, "key"), _S.write(_v61, "r", _S.call_value(_S.read(_v61, "render"), [_S.read(_v61, "pose")]), "=", false)])
	return _S.read(_e, "r")

static func _f30(_parent,_args:Array,_this=null):
	var _n_solve = _S.read(_parent,"solve")
	var _n_turnAll = _S.read(_parent,"turnAll")
	var _n_Object = _S.read(_parent,"Object")
	var _n_pose_b0 = _S.arg(_args,0)
	var _n_S_b1 = _S.call_value(_n_solve,[_n_pose_b0])
	var _n_q_b2 = _S.named_value(_n_S_b1,"q")
	var _n_whole_b3 = ((_S.named_value(_n_q_b2,"yaw") if _S.named_value(_n_q_b2,"yaw")!=null else 0) + (PI if _S.truth(_S.binary("===",_S.named_value(_n_q_b2,"face"),(-1))) else 0))
	if _S.truth(_n_whole_b3):
		_S.call_value(_n_turnAll,[_n_S_b1, _n_whole_b3])
	var _object_0 = _n_S_b1
	var _n_B_b4 = _S.named_value(_object_0,"B")
	var _n_armN_b5 = _S.named_value(_object_0,"armN")
	var _n_armF_b6 = _S.named_value(_object_0,"armF")
	var _n_legN_b7 = _S.named_value(_object_0,"legN")
	var _n_legF_b8 = _S.named_value(_object_0,"legF")
	var _n_sN_b9 = _S.named_value(_object_0,"sN")
	var _n_sF_b10 = _S.named_value(_object_0,"sF")
	var _n_hipN_b11 = _S.named_value(_object_0,"hipN")
	var _n_hipF_b12 = _S.named_value(_object_0,"hipF")
	var _n_at_b13 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f31")
	var _n_J_b14 = {"pelvis":_S.named_value(_S.named_value(_n_B_b4,"pelvis"),"t"),"waist":_S.named_value(_S.named_value(_n_B_b4,"waist"),"t"),"chest":_S.named_value(_S.named_value(_n_B_b4,"chest"),"t"),"neck":_S.named_value(_S.named_value(_n_B_b4,"neck"),"t"),"head":_S.named_value(_S.named_value(_n_B_b4,"head"),"t"),"crown":_S.call_value(_n_at_b13,[_S.named_value(_n_B_b4,"head"), [0, 3.3, 0]]),"shoulderN":_n_sN_b9,"elbowN":_S.named_value(_n_armN_b5,"joint"),"handN":_S.named_value(_n_armN_b5,"end"),"shoulderF":_n_sF_b10,"elbowF":_S.named_value(_n_armF_b6,"joint"),"handF":_S.named_value(_n_armF_b6,"end"),"hipN":_n_hipN_b11,"kneeN":_S.named_value(_n_legN_b7,"joint"),"ankleN":_S.named_value(_n_legN_b7,"end"),"toeN":_S.call_value(_n_at_b13,[_S.named_value(_n_B_b4,"footN"), [4.6, (-1.1), 0]]),"hipF":_n_hipF_b12,"kneeF":_S.named_value(_n_legF_b8,"joint"),"ankleF":_S.named_value(_n_legF_b8,"end"),"toeF":_S.call_value(_n_at_b13,[_S.named_value(_n_B_b4,"footF"), [4.6, (-1.1), 0]])}
	var _n_joints_b15 = _S.invoke(_n_Object,"fromEntries",[_S.invoke(_S.invoke(_n_Object,"entries",[_n_J_b14]),"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f32")])])
	var _n_bones_b16 = [["pelvis", "waist"], ["waist", "chest"], ["chest", "neck"], ["neck", "head"], ["head", "crown"], ["chest", "shoulderN"], ["shoulderN", "elbowN"], ["elbowN", "handN"], ["chest", "shoulderF"], ["shoulderF", "elbowF"], ["elbowF", "handF"], ["pelvis", "hipN"], ["hipN", "kneeN"], ["kneeN", "ankleN"], ["ankleN", "toeN"], ["pelvis", "hipF"], ["hipF", "kneeF"], ["kneeF", "ankleF"], ["ankleF", "toeF"]]
	return {"joints":_n_joints_b15,"bones":_n_bones_b16,"handles":["handN", "handF", "ankleN", "ankleF"]}
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_add = _S.read(_parent,"add")
	var _n_mv = _S.read(_parent,"mv")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return _S.call_value(_n_add,[_S.named_value(_n_f_b0,"t"), _S.call_value(_n_mv,[_S.named_value(_n_f_b0,"R"), _n_v_b1])])
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [_n_k_b0, [_S.index_value(_n_v_b1,0), (-_S.index_value(_n_v_b1,1)), _S.index_value(_n_v_b1,2)]]
	return null

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	for _v64 in _S.array(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "PART")])):
		var _v65 = _S.scope(_e)
		var _v66 = _v64
		_S.define(_v65, "name", _S.prop(_v66, 0))
		_S.define(_v65, "part", _S.prop(_v66, 1))
		var _v67 = _S.scope(_v65)
		_S.write(_v67, "onlyPart", _S.read(_v67, "part"), "=", false)
		_S.define(_v67, "r", _S.call_value(_S.read(_v67, "render"), [_S.read(_v67, "pose")]))
		_S.write(_v67, "onlyPart", 0, "=", false)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v67, "r"), "n"))):
			continue
		_S.define(_v67, "cx", 0)
		_S.define(_v67, "cy", 0)
		var _v68 = _S.scope(_v67)
		_S.define(_v68, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v68, "i"), _S.prop(_S.read(_v68, "r"), "n"))):
			var _v69 = _S.scope(_v68)
			_S.write(_v69, "cx", _S.prop(_S.prop(_S.read(_v69, "r"), "xs"), _S.read(_v69, "i")), "+=", false)
			_S.write(_v69, "cy", _S.prop(_S.prop(_S.read(_v69, "r"), "ys"), _S.read(_v69, "i")), "+=", false)
			_v68 = _S.iteration(_v68)
			_S.write(_v68, "i", 1, "+=", true)
		_S.invoke(_S.read(_v67, "out"), "push", [_S.merge([{"name": _S.read(_v67, "name")}, {"part": _S.read(_v67, "part")}, {"n": _S.prop(_S.read(_v67, "r"), "n")}, {"xs": _S.prop(_S.read(_v67, "r"), "xs")}, {"ys": _S.prop(_S.read(_v67, "r"), "ys")}, {"color": _S.prop(_S.read(_v67, "r"), "color")}, {"cx": _S.binary("/", _S.read(_v67, "cx"), _S.prop(_S.read(_v67, "r"), "n"))}, {"cy": _S.binary("/", _S.read(_v67, "cy"), _S.prop(_S.read(_v67, "r"), "n"))}, {"z": _S.prop(_S.read(_v67, "r"), "z")}])])
	return _S.read(_e, "out")

static func _f34(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [_n_k_b0, _S.binary(">>>",_S.call_value(_n_hex,[_n_v_b1]),0)]
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return [(_S.index_value(_n_a_b0,0) + _S.index_value(_n_b_b1,0)), (_S.index_value(_n_a_b0,1) + _S.index_value(_n_b_b1,1)), (_S.index_value(_n_a_b0,2) + _S.index_value(_n_b_b1,2))]
	return null

static func _f36(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return [(_S.index_value(_n_a_b0,0) - _S.index_value(_n_b_b1,0)), (_S.index_value(_n_a_b0,1) - _S.index_value(_n_b_b1,1)), (_S.index_value(_n_a_b0,2) - _S.index_value(_n_b_b1,2))]
	return null

static func _f37(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	return [(_S.index_value(_n_a_b0,0) * _n_s_b1), (_S.index_value(_n_a_b0,1) * _n_s_b1), (_S.index_value(_n_a_b0,2) * _n_s_b1)]
	return null

static func _f38(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (((_S.index_value(_n_a_b0,0) * _S.index_value(_n_b_b1,0)) + (_S.index_value(_n_a_b0,1) * _S.index_value(_n_b_b1,1))) + (_S.index_value(_n_a_b0,2) * _S.index_value(_n_b_b1,2)))
	return null

static func _f39(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return [((_S.index_value(_n_a_b0,1) * _S.index_value(_n_b_b1,2)) - (_S.index_value(_n_a_b0,2) * _S.index_value(_n_b_b1,1))), ((_S.index_value(_n_a_b0,2) * _S.index_value(_n_b_b1,0)) - (_S.index_value(_n_a_b0,0) * _S.index_value(_n_b_b1,2))), ((_S.index_value(_n_a_b0,0) * _S.index_value(_n_b_b1,1)) - (_S.index_value(_n_a_b0,1) * _S.index_value(_n_b_b1,0)))]
	return null

static func _f40(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return _S.Bridge.hypot([_S.index_value(_n_a_b0,0), _S.index_value(_n_a_b0,1), _S.index_value(_n_a_b0,2)])
	return null

static func _f41(_parent,_args:Array,_this=null):
	var _n_mul = _S.read(_parent,"mul")
	var _n_len = _S.read(_parent,"len")
	var _n_a_b0 = _S.arg(_args,0)
	return _S.call_value(_n_mul,[_n_a_b0, (float(1)/_S.logical("||",_S.call_value(_n_len,[_n_a_b0]),func():return 0.000001))])
	return null

static func _f42(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_c_b1 = cos(_n_t_b0)
	var _n_s_b2 = sin(_n_t_b0)
	return [_n_c_b1, 0, _n_s_b2, 0, 1, 0, (-_n_s_b2), 0, _n_c_b1]
	return null

static func _f43(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_c_b1 = cos(_n_t_b0)
	var _n_s_b2 = sin(_n_t_b0)
	return [_n_c_b1, (-_n_s_b2), 0, _n_s_b2, _n_c_b1, 0, 0, 0, 1]
	return null

static func _f44(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.construct(_n_Array,[9])
	if true:
		var _n_r_b3 = 0
		while _S.truth((_n_r_b3 < 3)):
			if true:
				var _n_c_b4 = 0
				while _S.truth((_n_c_b4 < 3)):
					_S.set_prop(_n_o_b2,((_n_r_b3 * 3) + _n_c_b4),(((_S.index_value(_n_A_b0,(_n_r_b3 * 3)) * _S.index_value(_n_B_b1,_n_c_b4)) + (_S.index_value(_n_A_b0,((_n_r_b3 * 3) + 1)) * _S.index_value(_n_B_b1,(3 + _n_c_b4)))) + (_S.index_value(_n_A_b0,((_n_r_b3 * 3) + 2)) * _S.index_value(_n_B_b1,(6 + _n_c_b4)))),"=")
					_n_c_b4 += 1.0
			_n_r_b3 += 1.0
	return _n_o_b2
	return null

static func _f45(_parent,_args:Array,_this=null):
	var _n_M_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return [(((_S.index_value(_n_M_b0,0) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,1) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,2) * _S.index_value(_n_v_b1,2))), (((_S.index_value(_n_M_b0,3) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,4) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,5) * _S.index_value(_n_v_b1,2))), (((_S.index_value(_n_M_b0,6) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,7) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,8) * _S.index_value(_n_v_b1,2)))]
	return null

static func _f46(_parent,_args:Array,_this=null):
	var _n_M_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return [(((_S.index_value(_n_M_b0,0) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,3) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,6) * _S.index_value(_n_v_b1,2))), (((_S.index_value(_n_M_b0,1) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,4) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,7) * _S.index_value(_n_v_b1,2))), (((_S.index_value(_n_M_b0,2) * _S.index_value(_n_v_b1,0)) + (_S.index_value(_n_M_b0,5) * _S.index_value(_n_v_b1,1))) + (_S.index_value(_n_M_b0,8) * _S.index_value(_n_v_b1,2)))]
	return null

static func _f47(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return maxf(0,minf(1,_n_v_b0))
	return null

static func _f48(_parent,_args:Array,_this=null):
	var _n_WEAPONS = _S.read(_parent,"WEAPONS")
	var _n_name_b0 = _S.arg(_args,0)
	return _S.index_value(_n_WEAPONS,_n_name_b0)
	return null

static func _f49(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "name", _S.arg(_args, 0))
	_S.write(_e, "curFrameIndex", _S.invoke(_S.read(_e, "FRAME_IDS"), "indexOf", [_S.read(_e, "name")]), "=", false)
	return null

static func _f50(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [_n_k_b0, _S.binary(">>>",_S.call_value(_n_hex,[_n_v_b1]),0)]
	return null

static func _f51(_parent,_args:Array,_this=null):
	var _n_T_b0 = _S.arg(_args,0)
	var _n_from_b1 = _S.arg(_args,1)
	var _n_to_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_d_b4 = _S.arg(_args,4)
	var _n_r_b5 = _S.coalesce(_S.arg(_args,5),func():return 0.8)
	if true:
		var _n_i_b6 = _n_from_b1
		while _S.truth((_n_i_b6 <= _n_to_b2)):
			if true:
				var _n_k_b7 = (-_n_r_b5)
				while _S.truth((_n_k_b7 <= (_n_r_b5 + 0.01))):
					_S.call_value(_n_T_b0,[_n_i_b6, _n_k_b7, (_n_d_b4 if _S.truth((_n_k_b7 > 0.1)) else _n_a_b3)])
					_n_k_b7 += 0.4
			_n_i_b6 += 0.4
	return null

static func _f52(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_blade = _S.read(_parent,"blade")
	var _n_T_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_end_b2 = ((-6.5) if _S.truth(_S.named_value(_n_q_b1,"two")) else (-2.6))
	_S.call_value(_n_haft,[_n_T_b0, _n_end_b2, 2.2, _S.named_value(_n_STEEL,"grip"), _S.named_value(_n_STEEL,"gripD")])
	if true:
		var _n_k_b3 = (-1.4)
		while _S.truth((_n_k_b3 <= 1.4)):
			_S.call_value(_n_T_b0,[(_n_end_b2 - 0.4), _n_k_b3, _S.named_value(_n_STEEL,"gold")])
			_n_k_b3 += 0.4
	if true:
		var _n_k_b4 = (-4.6)
		while _S.truth((_n_k_b4 <= 4.6)):
			_S.call_value(_n_T_b0,[2.6, _n_k_b4, (_S.named_value(_n_STEEL,"goldD") if _S.truth((absf(_n_k_b4) > 3.8)) else _S.named_value(_n_STEEL,"gold"))])
			_S.call_value(_n_T_b0,[3, _n_k_b4, _S.named_value(_n_STEEL,"goldD")])
			_n_k_b4 += 0.4
	_S.call_value(_n_blade,[_n_T_b0, 3.2, 25, 2.2])
	return null

static func _f53(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_blade = _S.read(_parent,"blade")
	var _n_T_b0 = _S.arg(_args,0)
	_S.call_value(_n_haft,[_n_T_b0, (-7.2), 2.2, _S.named_value(_n_STEEL,"grip"), _S.named_value(_n_STEEL,"gripD")])
	if true:
		var _n_k_b1 = (-1.8)
		while _S.truth((_n_k_b1 <= 1.8)):
			_S.call_value(_n_T_b0,[(-7.6), _n_k_b1, _S.named_value(_n_STEEL,"gold")])
			_n_k_b1 += 0.4
	if true:
		var _n_k_b2 = (-6.6)
		while _S.truth((_n_k_b2 <= 6.6)):
			_S.call_value(_n_T_b0,[2.6, _n_k_b2, (_S.named_value(_n_STEEL,"goldD") if _S.truth((absf(_n_k_b2) > 5.6)) else _S.named_value(_n_STEEL,"gold"))])
			_S.call_value(_n_T_b0,[3, _n_k_b2, _S.named_value(_n_STEEL,"goldD")])
			_n_k_b2 += 0.4
	_S.call_value(_n_blade,[_n_T_b0, 3.2, 31, 3])
	if true:
		var _n_i_b3 = 4
		while _S.truth((_n_i_b3 <= 28)):
			_S.call_value(_n_T_b0,[_n_i_b3, 0, _S.named_value(_n_STEEL,"b")])
			_n_i_b3 += 0.4
	return null

static func _f54(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_blade = _S.read(_parent,"blade")
	var _n_T_b0 = _S.arg(_args,0)
	_S.call_value(_n_haft,[_n_T_b0, (-2.4), 1.8, _S.named_value(_n_STEEL,"grip"), _S.named_value(_n_STEEL,"gripD")])
	if true:
		var _n_k_b1 = (-2.6)
		while _S.truth((_n_k_b1 <= 2.6)):
			_S.call_value(_n_T_b0,[2.2, _n_k_b1, _S.named_value(_n_STEEL,"goldD")])
			_n_k_b1 += 0.4
	_S.call_value(_n_blade,[_n_T_b0, 2.6, 10, 1.3])
	return null

static func _f55(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_blade = _S.read(_parent,"blade")
	var _n_T_b0 = _S.arg(_args,0)
	_S.call_value(_n_haft,[_n_T_b0, (-18), 36, _S.named_value(_n_STEEL,"wood"), _S.named_value(_n_STEEL,"woodD"), 0.5])
	_S.call_value(_n_blade,[_n_T_b0, 36, 11, 2])
	if true:
		var _n_k_b1 = (-2.4)
		while _S.truth((_n_k_b1 <= 2.4)):
			_S.call_value(_n_T_b0,[36, _n_k_b1, _S.named_value(_n_STEEL,"goldD")])
			_n_k_b1 += 0.4
	return null

static func _f56(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array([(-0.8), 0, 0.8]):
		var _n_lift_b1 = _iter_0
		if true:
			var _n_i_b2 = (-10)
			while _S.truth((_n_i_b2 <= 18)):
				if true:
					var _n_k_b3 = (-0.8)
					while _S.truth((_n_k_b3 <= 0.81)):
						_S.call_value(_n_T_b0,[_n_i_b2, _n_k_b3, (_S.named_value(_n_STEEL,"woodD") if _S.truth((_n_k_b3 > 0.1)) else _S.named_value(_n_STEEL,"wood")), _n_lift_b1])
						_n_k_b3 += 0.4
				_n_i_b2 += 0.4
	if true:
		var _n_i_b4 = 18
		while _S.truth((_n_i_b4 <= 28)):
			if true:
				var _n_k_b5 = (-9)
				while _S.truth((_n_k_b5 <= 9)):
					var _n_face_b6 = ((_S.named_value(_n_STEEL,"a") if _S.truth((_n_k_b5 < 0)) else _S.named_value(_n_STEEL,"d")) if _S.truth((absf(_n_k_b5) > 7.4)) else (_S.named_value(_n_STEEL,"hi") if _S.truth((_n_i_b4 < 20)) else (_S.named_value(_n_STEEL,"d") if _S.truth((_n_i_b4 > 26.4)) else (_S.named_value(_n_STEEL,"gold") if _S.truth((absf(_n_k_b5) < 2)) else _S.named_value(_n_STEEL,"b")))))
					_S.call_value(_n_T_b0,[_n_i_b4, _n_k_b5, _n_face_b6, 4.5])
					_S.call_value(_n_T_b0,[_n_i_b4, _n_k_b5, _n_face_b6, (-4.5)])
					if _S.truth((((_n_i_b4 < 18.4) if _S.truth((_n_i_b4 < 18.4)) else (_n_i_b4 > 27.6)) if _S.truth(((_n_i_b4 < 18.4) if _S.truth((_n_i_b4 < 18.4)) else (_n_i_b4 > 27.6))) else (absf(_n_k_b5) > 8.6))):
						if true:
							var _n_l_b7 = (-4)
							while _S.truth((_n_l_b7 <= 4)):
								_S.call_value(_n_T_b0,[_n_i_b4, _n_k_b5, (_S.named_value(_n_STEEL,"a") if _S.truth((_n_k_b5 < 0)) else (_S.named_value(_n_STEEL,"d") if _S.truth((_n_i_b4 > 27.6)) else _S.named_value(_n_STEEL,"b"))), _n_l_b7])
								_n_l_b7 += 0.4
					_n_k_b5 += 0.4
			_n_i_b4 += 0.4
	return null

static func _f57(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	_S.call_value(_n_haft,[_n_T_b0, (-16), 31, _S.named_value(_n_STEEL,"dark"), _S.named_value(_n_STEEL,"darkD"), 0.5])
	if true:
		var _n_j_b1 = 0
		while _S.truth((_n_j_b1 <= 28)):
			var _n_u_b2 = (float(_n_j_b1)/28)
			var _n_w_b3 = ((3.2 * (1 - _n_u_b2)) + 0.3)
			var _n_b_b4 = (31.5 - ((_n_u_b2 * _n_u_b2) * 12))
			if true:
				var _n_k_b5 = (-_n_w_b3)
				while _S.truth((_n_k_b5 <= _n_w_b3)):
					_S.call_value(_n_T_b0,[(_n_b_b4 + _n_k_b5), (_n_j_b1 + 0.8), (_S.named_value(_n_STEEL,"hi") if _S.truth((_n_k_b5 > (_n_w_b3 * 0.3))) else (_S.named_value(_n_STEEL,"d") if _S.truth((_n_k_b5 < ((-_n_w_b3) * 0.4))) else _S.named_value(_n_STEEL,"b")))])
					_n_k_b5 += 0.4
			_n_j_b1 += 0.4
	return null

static func _f58(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array([(-2.4), 0, 2.4]):
		var _n_q0_b1 = _iter_0
		if true:
			var _n_i_b2 = 2
			while _S.truth((_n_i_b2 <= 9.5)):
				var _n_u_b3 = (float((_n_i_b2 - 2))/7.5)
				var _n_k_b4 = (_n_q0_b1 + ((_n_u_b3 * _n_u_b3) * 1.8))
				_S.call_value(_n_T_b0,[_n_i_b2, _n_k_b4, (_S.named_value(_n_STEEL,"hi") if _S.truth((_n_u_b3 > 0.55)) else _S.named_value(_n_STEEL,"a"))])
				if _S.truth((_n_u_b3 < 0.6)):
					_S.call_value(_n_T_b0,[_n_i_b2, (_n_k_b4 + 0.8), _S.named_value(_n_STEEL,"d")])
				_n_i_b2 += 0.4
	return null

static func _f59(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_off_b2 = _S.arg(_args,2)
	if true:
		var _n_u_b7 = (-1)
		while _S.truth((_n_u_b7 <= 1.001)):
			var _n_k_b8 = (_n_u_b7 * 17)
			var _n_i_b9 = ((6 * (1 - (_n_u_b7 * _n_u_b7))) - 1)
			_S.call_value(_n_T_b0,[_n_i_b9, _n_k_b8, (_S.named_value(_n_STEEL,"goldD") if _S.truth((absf(_n_u_b7) > 0.85)) else _S.named_value(_n_STEEL,"wood"))])
			_S.call_value(_n_T_b0,[(_n_i_b9 + 0.8), _n_k_b8, _S.named_value(_n_STEEL,"woodD")])
			_n_u_b7 += 0.025
	var _n_tipA_b3 = _S.invoke(_n_T_b0,"at",[(-1), (-17)])
	var _n_tipB_b4 = _S.invoke(_n_T_b0,"at",[(-1), 17])
	var _n_mid_b5 = (_n_off_b2 if _S.truth(_S.named_value(_n_q_b1,"pull")) else _S.invoke(_n_T_b0,"at",[(-1), 0]))
	var _n_line_b6 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f60")
	_S.call_value(_n_line_b6,[_n_tipA_b3, _n_mid_b5])
	_S.call_value(_n_line_b6,[_n_tipB_b4, _n_mid_b5])
	if _S.truth(_S.named_value(_n_q_b1,"nocked")):
		var _n_nock_b10 = _n_mid_b5
		var _n_tip_b11 = _S.invoke(_n_T_b0,"at",[13, 0])
		_S.call_value(_n_line_b6,[_n_nock_b10, _n_tip_b11, _S.named_value(_n_STEEL,"wood")])
		if true:
			var _n_i_b12 = 9
			while _S.truth((_n_i_b12 <= 13)):
				if true:
					var _n_k_b13 = ((-(13 - _n_i_b12)) * 0.45)
					while _S.truth((_n_k_b13 <= ((13 - _n_i_b12) * 0.45))):
						_S.call_value(_n_T_b0,[_n_i_b12, _n_k_b13, _S.named_value(_n_STEEL,"hi")])
						_n_k_b13 += 0.4
				_n_i_b12 += 0.4
	return null

static func _f60(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("/", _S.call_value(_S.read(_e, "len"), [_S.call_value(_S.read(_e, "sub"), [_S.read(_e, "B"), _S.read(_e, "A")])]), 0.4)])]))
	_S.define(_e, "Z", _S.prop(_S.read(_e, "STEEL"), "a"))
	var _v100 = _S.scope(_e)
	_S.define(_v100, "k", 0)
	while _S.truth(_S.binary("<=", _S.read(_v100, "k"), _S.read(_v100, "n"))):
		var _v101 = _S.scope(_v100)
		_S.define(_v101, "P", _S.call_value(_S.read(_v101, "add"), [_S.read(_v101, "A"), _S.call_value(_S.read(_v101, "mul"), [_S.call_value(_S.read(_v101, "sub"), [_S.read(_v101, "B"), _S.read(_v101, "A")]), _S.binary("/", _S.read(_v101, "k"), _S.read(_v101, "n"))])]))
		_S.define(_v101, "wx", _S.invoke(_S.read(_v101, "Math"), "round", [_S.prop(_S.read(_v101, "P"), 0)]))
		_S.define(_v101, "wy", _S.invoke(_S.read(_v101, "Math"), "round", [_S.prop(_S.read(_v101, "P"), 1)]))
		_S.define(_v101, "idx", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v101, "OY"), _S.read(_v101, "wy")), _S.read(_v101, "BW")), _S.binary("+", _S.read(_v101, "OX"), _S.read(_v101, "wx"))))
		_S.write(_v101, "curFrameIndex", _S.unary("-", 1), "=", false)
		_S.call_value(_S.read(_v101, "plot"), [_S.read(_v101, "idx"), _S.binary("+", _S.prop(_S.read(_v101, "P"), 2), 0.05), 2, _S.prop(_S.read(_v101, "PART"), "weapon"), 2, _S.read(_v101, "wx"), _S.read(_v101, "wy"), _S.logical("??", _S.read(_v101, "c"), func(): return _S.read(_v101, "Z"))])
		_v100 = _S.iteration(_v100)
		_S.write(_v100, "k", 1, "+=", true)
	return null

static func _f61(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (-1)
		while _S.truth((_n_i_b1 <= 9.5)):
			if true:
				var _n_k_b2 = (-4.2)
				while _S.truth((_n_k_b2 <= (-2.4))):
					_S.call_value(_n_T_b0,[_n_i_b1, _n_k_b2, (_S.named_value(_n_STEEL,"a") if _S.truth((_n_k_b2 < (-3.6))) else (_S.named_value(_n_STEEL,"d") if _S.truth((_n_k_b2 > (-2.9))) else _S.named_value(_n_STEEL,"b")))])
					_n_k_b2 += 0.4
			_n_i_b1 += 0.4
	if true:
		var _n_i_b3 = (-1.2)
		while _S.truth((_n_i_b3 <= 1.2)):
			if true:
				var _n_k_b4 = (-2.4)
				while _S.truth((_n_k_b4 <= 2.4)):
					_S.call_value(_n_T_b0,[_n_i_b3, _n_k_b4, _S.named_value(_n_STEEL,"gripD")])
					_n_k_b4 += 0.4
			_n_i_b3 += 0.4
	_S.call_value(_n_T_b0,[9, (-4.6), _S.named_value(_n_STEEL,"hi")])
	return null

static func _f62(_parent,_args:Array,_this=null):
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (-14)
		while _S.truth((_n_i_b1 <= 22)):
			if true:
				var _n_k_b2 = (-6)
				while _S.truth((_n_k_b2 <= (-1))):
					_S.call_value(_n_T_b0,[_n_i_b1, _n_k_b2, (_S.named_value(_n_STEEL,"oliveA") if _S.truth((_n_k_b2 < (-4.8))) else (_S.named_value(_n_STEEL,"oliveD") if _S.truth((_n_k_b2 > (-2.2))) else (_S.named_value(_n_STEEL,"gold") if _S.truth((absf((_n_i_b1 - 3)) < 1.4)) else _S.named_value(_n_STEEL,"olive"))))])
					_n_k_b2 += 0.4
			_n_i_b1 += 0.4
	if true:
		var _n_k_b3 = (-6.8)
		while _S.truth((_n_k_b3 <= (-0.2))):
			_S.call_value(_n_T_b0,[22.4, _n_k_b3, _S.named_value(_n_STEEL,"b")])
			_S.call_value(_n_T_b0,[(-14.4), _n_k_b3, _S.named_value(_n_STEEL,"d")])
			_n_k_b3 += 0.4
	return null

static func _f63(_parent,_args:Array,_this=null):
	var _n_haft = _S.read(_parent,"haft")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_T_b0 = _S.arg(_args,0)
	_S.call_value(_n_haft,[_n_T_b0, (-2.6), 6, _S.named_value(_n_STEEL,"grip"), _S.named_value(_n_STEEL,"gripD")])
	if true:
		var _n_k_b1 = (-1.6)
		while _S.truth((_n_k_b1 <= 1.6)):
			_S.call_value(_n_T_b0,[(-3), _n_k_b1, _S.named_value(_n_STEEL,"gold")])
			_S.call_value(_n_T_b0,[6.4, _n_k_b1, _S.named_value(_n_STEEL,"gold")])
			_n_k_b1 += 0.4
	return null

static func _f64(_parent,_args:Array,_this=null):
	var _n_rotY = _S.read(_parent,"rotY")
	var _n_this = _S.read(_parent,"this")
	var _n_mm = _S.read(_parent,"mm")
	var _n_Object = _S.read(_parent,"Object")
	var _n_S_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.call_value(_n_rotY,[(-_n_a_b1)])
	var _n_P_b3 = _S.function_value(_S.capture(_parent,{"R":_n_R_b2,"this":_n_this}),"_f65")
	for _iter_0 in _S.array(_S.invoke(_n_Object,"values",[_S.named_value(_n_S_b0,"B")])):
		var _n_f_b4 = _iter_0
		_S.set_prop(_n_f_b4,"t",_S.call_value(_n_P_b3,[_S.named_value(_n_f_b4,"t")]),"=")
		_S.set_prop(_n_f_b4,"R",_S.call_value(_n_mm,[_n_R_b2, _S.named_value(_n_f_b4,"R")]),"=")
	for _iter_1 in _S.array([_S.named_value(_n_S_b0,"armN"), _S.named_value(_n_S_b0,"armF"), _S.named_value(_n_S_b0,"legN"), _S.named_value(_n_S_b0,"legF")]):
		var _n_A_b5 = _iter_1
		_S.set_prop(_n_A_b5,"joint",_S.call_value(_n_P_b3,[_S.named_value(_n_A_b5,"joint")]),"=")
		_S.set_prop(_n_A_b5,"end",_S.call_value(_n_P_b3,[_S.named_value(_n_A_b5,"end")]),"=")
	_S.set_prop(_n_S_b0,"sN",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"sN")]),"=")
	_S.set_prop(_n_S_b0,"sF",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"sF")]),"=")
	_S.set_prop(_n_S_b0,"hipN",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"hipN")]),"=")
	_S.set_prop(_n_S_b0,"hipF",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"hipF")]),"=")
	_S.set_prop(_n_S_b0,"axis",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"axis")]),"=")
	_S.set_prop(_n_S_b0,"side",_S.call_value(_n_P_b3,[_S.named_value(_n_S_b0,"side")]),"=")
	return null

static func _f65(_parent,_args:Array,_this=null):
	var _n_mv = _S.read(_parent,"mv")
	var _n_R = _S.read(_parent,"R")
	var _n_v_b0 = _S.arg(_args,0)
	return _S.call_value(_n_mv,[_n_R, _n_v_b0])
	return null

static func _f66(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", ("air," if _S.truth(_S.binary("<", _S.logical("??", _S.prop(_S.read(_e, "p"), "y"), func(): return 0), _S.unary("-", 0.5))) else ""))
	for _v119 in _S.array(_S.invoke(_S.invoke(_S.read(_e, "Object"), "keys", [_S.read(_e, "p")]), "sort", [])):
		var _v120 = _S.scope(_e)
		_S.define(_v120, "k", _v119)
		var _v121 = _S.scope(_v120)
		_S.define(_v121, "v", _S.prop(_S.read(_v121, "p"), _S.read(_v121, "k")))
		if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v121, "v"), null), func(): return _S.binary("===", _S.read(_v121, "k"), "x")), func(): return _S.binary("===", _S.read(_v121, "k"), "y")), func(): return _S.binary("===", _S.read(_v121, "k"), "ghost"))):
			continue
		_S.write(_v121, "s", _S.binary("+", _S.binary("+", _S.read(_v121, "k"), ((_S.invoke(_S.read(_v121, "Math"), "round", [_S.binary("*", _S.read(_v121, "v"), 20)]) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v121, "k"), "sa"), func(): return _S.binary("===", _S.read(_v121, "k"), "sb")), func(): return _S.binary("===", _S.read(_v121, "k"), "wl")), func(): return _S.binary("===", _S.read(_v121, "k"), "yaw")), func(): return _S.binary("===", _S.read(_v121, "k"), "turn"))) else _S.invoke(_S.read(_v121, "Math"), "round", [_S.read(_v121, "v")])) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v121, "v")), "number")) else _S.read(_v121, "v"))), ","), "+=", false)
	return _S.read(_e, "s")
