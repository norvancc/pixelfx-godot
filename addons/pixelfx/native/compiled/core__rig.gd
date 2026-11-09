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

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "target", _S.arg(_args, 1))
	_S.define(_e, "L1", _S.arg(_args, 2))
	_S.define(_e, "L2", _S.arg(_args, 3))
	_S.define(_e, "pole", _S.arg(_args, 4))
	_S.define(_e, "to", _S.call_value(_S.read(_e, "sub"), [_S.read(_e, "target"), _S.read(_e, "a")]))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "len"), [_S.read(_e, "to")]))
	_S.define(_e, "reach", _S.binary("-", _S.binary("+", _S.read(_e, "L1"), _S.read(_e, "L2")), 0.02))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "reach"))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "to", _S.call_value(_S.read(_v0, "mul"), [_S.read(_v0, "to"), _S.binary("/", _S.read(_v0, "reach"), _S.read(_v0, "d"))]), "=", false)
		_S.write(_v0, "d", _S.read(_v0, "reach"), "=", false)
	_S.define(_e, "u", _S.call_value(_S.read(_e, "unit"), [_S.read(_e, "to")]))
	_S.define(_e, "along", _S.binary("/", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "L1"), _S.read(_e, "L1")), _S.binary("*", _S.read(_e, "L2"), _S.read(_e, "L2"))), _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))), _S.binary("*", 2, _S.read(_e, "d"))))
	_S.define(_e, "h", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.binary("*", _S.read(_e, "L1"), _S.read(_e, "L1")), _S.binary("*", _S.read(_e, "along"), _S.read(_e, "along")))])]))
	_S.define(_e, "v", _S.call_value(_S.read(_e, "sub"), [_S.read(_e, "pole"), _S.call_value(_S.read(_e, "mul"), [_S.read(_e, "u"), _S.call_value(_S.read(_e, "dot"), [_S.read(_e, "pole"), _S.read(_e, "u")])])]))
	_S.write(_e, "v", (_S.call_value(_S.read(_e, "unit"), [_S.call_value(_S.read(_e, "cross"), [_S.read(_e, "u"), [0, 0, 1]])]) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "len"), [_S.read(_e, "v")]), 0.0001)) else _S.call_value(_S.read(_e, "unit"), [_S.read(_e, "v")])), "=", false)
	return _S.merge([{"joint": _S.call_value(_S.read(_e, "add"), [_S.read(_e, "a"), _S.call_value(_S.read(_e, "add"), [_S.call_value(_S.read(_e, "mul"), [_S.read(_e, "u"), _S.read(_e, "along")]), _S.call_value(_S.read(_e, "mul"), [_S.read(_e, "v"), _S.read(_e, "h")])])])}, {"end": _S.call_value(_S.read(_e, "add"), [_S.read(_e, "a"), _S.read(_e, "to")])}, {"u": _S.read(_e, "u")}, {"v": _S.read(_e, "v")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	return _S.merge([{"t": _S.read(_e, "t")}, {"R": _S.read(_e, "R")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "pole", _S.arg(_args, 2))
	_S.define(_e, "x", _S.call_value(_S.read(_e, "unit"), [_S.call_value(_S.read(_e, "sub"), [_S.read(_e, "b"), _S.read(_e, "a")])]))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "sub"), [_S.read(_e, "pole"), _S.call_value(_S.read(_e, "mul"), [_S.read(_e, "x"), _S.call_value(_S.read(_e, "dot"), [_S.read(_e, "pole"), _S.read(_e, "x")])])]))
	_S.write(_e, "y", (_S.call_value(_S.read(_e, "unit"), [_S.call_value(_S.read(_e, "cross"), [_S.read(_e, "x"), [0, 0, 1]])]) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "len"), [_S.read(_e, "y")]), 0.0001)) else _S.call_value(_S.read(_e, "unit"), [_S.read(_e, "y")])), "=", false)
	_S.define(_e, "z", _S.call_value(_S.read(_e, "cross"), [_S.read(_e, "x"), _S.read(_e, "y")]))
	return _S.call_value(_S.read(_e, "frame"), [_S.read(_e, "a"), [_S.prop(_S.read(_e, "x"), 0), _S.prop(_S.read(_e, "y"), 0), _S.prop(_S.read(_e, "z"), 0), _S.prop(_S.read(_e, "x"), 1), _S.prop(_S.read(_e, "y"), 1), _S.prop(_S.read(_e, "z"), 1), _S.prop(_S.read(_e, "x"), 2), _S.prop(_S.read(_e, "y"), 2), _S.prop(_S.read(_e, "z"), 2)]])

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

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "add"), [_S.read(_e, "pelvis"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "Rp"), [0, _S.unary("-", _S.prop(_S.read(_e, "M"), "hipDown")), _S.binary("*", _S.read(_e, "s"), _S.prop(_S.read(_e, "M"), "hipOut"))]])])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "target", _S.arg(_args, 1))
	_S.define(_e, "base", _S.call_value(_S.read(_e, "add"), [_S.read(_e, "chest"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "Rc"), [0, _S.prop(_S.read(_e, "M"), "shoulderUp"), _S.binary("*", _S.read(_e, "s"), _S.prop(_S.read(_e, "M"), "shoulderOut"))]])]))
	_S.define(_e, "to", _S.call_value(_S.read(_e, "sub"), [_S.read(_e, "target"), _S.read(_e, "base")]))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "len"), [_S.read(_e, "to")]))
	return _S.call_value(_S.read(_e, "add"), [_S.read(_e, "base"), _S.call_value(_S.read(_e, "mul"), [_S.call_value(_S.read(_e, "unit"), [_S.read(_e, "to")]), _S.invoke(_S.read(_e, "Math"), "min", [1.8, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "d"), 11)]), 0.35)])])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "T", _S.arg(_args, 1))
	_S.define(_e, "shoulder", _S.arg(_args, 2))
	_S.define(_e, "hold", _S.arg(_args, 3))
	_S.define(_e, "up", _S.call_value(_S.read(_e, "clamp01"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "T"), 1), _S.prop(_S.read(_e, "shoulder"), 1)), 2), 10)]))
	_S.define(_e, "base", [_S.binary("+", _S.unary("-", 0.55), _S.binary("*", _S.read(_e, "up"), 1.1)), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.read(_e, "up"), 0.9)), _S.binary("*", _S.read(_e, "s"), _S.binary("+", 0.45, _S.binary("*", _S.read(_e, "up"), 0.5)))])
	if _S.truth(_S.unary("!", _S.read(_e, "hold"))):
		return _S.read(_e, "base")
	_S.define(_e, "u", _S.call_value(_S.read(_e, "unit"), [_S.call_value(_S.read(_e, "sub"), [_S.read(_e, "T"), _S.read(_e, "shoulder")])]))
	_S.define(_e, "best", _S.read(_e, "base"))
	_S.define(_e, "score", INF)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 16)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v7, "i"), 16), _S.prop(_S.read(_v7, "Math"), "PI")), 2))
		_S.define(_v7, "x", _S.call_value(_S.read(_v7, "unit"), [_S.call_value(_S.read(_v7, "cross"), [_S.read(_v7, "u"), [0.3, 1, 0.2]])]))
		_S.define(_v7, "y", _S.call_value(_S.read(_v7, "cross"), [_S.read(_v7, "u"), _S.read(_v7, "x")]))
		_S.define(_v7, "v", _S.call_value(_S.read(_v7, "add"), [_S.call_value(_S.read(_v7, "mul"), [_S.read(_v7, "x"), _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")])]), _S.call_value(_S.read(_v7, "mul"), [_S.read(_v7, "y"), _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")])])]))
		_S.define(_v7, "A", _S.call_value(_S.read(_v7, "ik"), [_S.read(_v7, "shoulder"), _S.read(_v7, "T"), _S.prop(_S.read(_v7, "M"), "upper"), _S.prop(_S.read(_v7, "M"), "fore"), _S.read(_v7, "v")]))
		_S.define(_v7, "f", _S.call_value(_S.read(_v7, "unit"), [_S.call_value(_S.read(_v7, "sub"), [_S.prop(_S.read(_v7, "A"), "end"), _S.prop(_S.read(_v7, "A"), "joint")])]))
		_S.define(_v7, "cost", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "abs", [_S.call_value(_S.read(_v7, "dot"), [_S.read(_v7, "f"), _S.read(_v7, "hold")])]), 0.7), _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v7, "dot"), [_S.call_value(_S.read(_v7, "unit"), [_S.read(_v7, "base")]), _S.read(_v7, "v")])), 0.55)))
		if _S.truth(_S.binary("<", _S.read(_v7, "cost"), _S.read(_v7, "score"))):
			var _v8 = _S.scope(_v7)
			_S.write(_v8, "score", _S.read(_v8, "cost"), "=", false)
			_S.write(_v8, "best", _S.read(_v8, "v"), "=", false)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	return _S.read(_e, "best")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "Rp"), [1, 0, _S.binary("*", _S.read(_e, "s"), 0.35)]])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "t", _S.binary("+", _S.binary("*", _S.read(_e, "hipTurn"), 0.6), _S.binary("*", _S.binary("*", _S.read(_e, "s"), 8), _S.read(_e, "DEG"))))
	return [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "t")]), 0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "t")])]

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "z", _S.arg(_args, 1))
	_S.define(_e, "tone", _S.arg(_args, 2))
	_S.define(_e, "part", _S.arg(_args, 3))
	_S.define(_e, "mat", _S.arg(_args, 4))
	_S.define(_e, "wx", _S.arg(_args, 5))
	_S.define(_e, "wy", _S.arg(_args, 6))
	_S.define(_e, "color", _S.arg(_args, 7))
	if _S.truth(_S.logical("&&", _S.read(_e, "onlyPart"), func(): return _S.binary("!==", _S.read(_e, "part"), _S.read(_e, "onlyPart")))):
		return null
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "Part"), _S.read(_e, "i")), 0)):
		_S.invoke(_S.read(_e, "touched"), "push", [_S.read(_e, "i")])
	else:
		if _S.truth(_S.binary("<=", _S.read(_e, "z"), _S.prop(_S.read(_e, "Zb"), _S.read(_e, "i")))):
			return null
	_S.set_prop(_S.read(_e, "Zb"), _S.read(_e, "i"), _S.read(_e, "z"), "=", false)
	_S.set_prop(_S.read(_e, "Tone"), _S.read(_e, "i"), _S.read(_e, "tone"), "=", false)
	_S.set_prop(_S.read(_e, "Part"), _S.read(_e, "i"), _S.read(_e, "part"), "=", false)
	_S.set_prop(_S.read(_e, "Mat"), _S.read(_e, "i"), _S.read(_e, "mat"), "=", false)
	_S.set_prop(_S.read(_e, "Fr"), _S.read(_e, "i"), _S.read(_e, "curFrameIndex"), "=", false)
	_S.set_prop(_S.read(_e, "LX"), _S.read(_e, "i"), _S.read(_e, "wx"), "=", false)
	_S.set_prop(_S.read(_e, "LY"), _S.read(_e, "i"), _S.read(_e, "wy"), "=", false)
	_S.set_prop(_S.read(_e, "Col"), _S.read(_e, "i"), _S.read(_e, "color"), "=", false)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "part", _S.arg(_args, 2))
	_S.define(_e, "mat", _S.arg(_args, 3))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_e, "c"), 0), _S.read(_e, "r"))]))
	_S.define(_e, "x1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "c"), 0), _S.read(_e, "r"))]))
	_S.define(_e, "y0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_e, "c"), 1), _S.read(_e, "r"))]))
	_S.define(_e, "y1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "c"), 1), _S.read(_e, "r"))]))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "wy", _S.read(_v9, "y0"))
	while _S.truth(_S.binary("<=", _S.read(_v9, "wy"), _S.read(_v9, "y1"))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "wx", _S.read(_v10, "x0"))
		while _S.truth(_S.binary("<=", _S.read(_v10, "wx"), _S.read(_v10, "x1"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "dx", _S.binary("-", _S.read(_v11, "wx"), _S.prop(_S.read(_v11, "c"), 0)))
			_S.define(_v11, "dy", _S.binary("-", _S.read(_v11, "wy"), _S.prop(_S.read(_v11, "c"), 1)))
			_S.define(_v11, "d2", _S.binary("+", _S.binary("*", _S.read(_v11, "dx"), _S.read(_v11, "dx")), _S.binary("*", _S.read(_v11, "dy"), _S.read(_v11, "dy"))))
			if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v11, "d2"), _S.binary("*", _S.read(_v11, "r"), _S.read(_v11, "r"))), func(): return _S.logical("&&", _S.read(_v11, "clipBody"), func(): return _S.binary("<", _S.read(_v11, "wy"), 1.5)))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "wx", 1, "+=", true)
				continue
			_S.define(_v11, "dz", _S.invoke(_S.read(_v11, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v11, "r"), _S.read(_v11, "r")), _S.read(_v11, "d2"))]))
			_S.define(_v11, "n", [_S.binary("/", _S.read(_v11, "dx"), _S.read(_v11, "r")), _S.binary("/", _S.read(_v11, "dy"), _S.read(_v11, "r")), _S.binary("/", _S.read(_v11, "dz"), _S.read(_v11, "r"))])
			_S.define(_v11, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v11, "OY"), _S.read(_v11, "wy")), _S.read(_v11, "BW")), _S.binary("+", _S.read(_v11, "OX"), _S.read(_v11, "wx"))))
			_S.call_value(_S.read(_v11, "plot"), [_S.read(_v11, "i"), _S.binary("+", _S.prop(_S.read(_v11, "c"), 2), _S.read(_v11, "dz")), _S.call_value(_S.read(_v11, "dot"), [_S.read(_v11, "n"), _S.read(_v11, "LIGHT")]), _S.read(_v11, "part"), _S.read(_v11, "mat"), _S.read(_v11, "wx"), _S.read(_v11, "wy"), 0])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "wx", 1, "+=", true)
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "wy", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "ra", _S.arg(_args, 2))
	_S.define(_e, "rb", _S.arg(_args, 3))
	_S.define(_e, "part", _S.arg(_args, 4))
	_S.define(_e, "mat", _S.arg(_args, 5))
	_S.define(_e, "bulge", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("/", _S.call_value(_S.read(_e, "len"), [_S.call_value(_S.read(_e, "sub"), [_S.read(_e, "b"), _S.read(_e, "a")])]), 0.4)])]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "k", 0)
	while _S.truth(_S.binary("<=", _S.read(_v12, "k"), _S.read(_v12, "n"))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "u", _S.binary("/", _S.read(_v13, "k"), _S.read(_v13, "n")))
		_S.call_value(_S.read(_v13, "sphere"), [_S.call_value(_S.read(_v13, "add"), [_S.read(_v13, "a"), _S.call_value(_S.read(_v13, "mul"), [_S.call_value(_S.read(_v13, "sub"), [_S.read(_v13, "b"), _S.read(_v13, "a")]), _S.read(_v13, "u")])]), _S.binary("+", _S.binary("+", _S.read(_v13, "ra"), _S.binary("*", _S.binary("-", _S.read(_v13, "rb"), _S.read(_v13, "ra")), _S.read(_v13, "u"))), _S.binary("*", _S.read(_v13, "bulge"), _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("*", _S.read(_v13, "u"), _S.prop(_S.read(_v13, "Math"), "PI"))]))), _S.read(_v13, "part"), _S.read(_v13, "mat")])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "k", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "part", _S.arg(_args, 3))
	_S.define(_e, "mat", _S.arg(_args, 4))
	_S.define(_e, "big", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "r"), 0), _S.prop(_S.read(_e, "r"), 1), _S.prop(_S.read(_e, "r"), 2)]))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_e, "c"), 0), _S.read(_e, "big"))]))
	_S.define(_e, "x1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "c"), 0), _S.read(_e, "big"))]))
	_S.define(_e, "y0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_e, "c"), 1), _S.read(_e, "big"))]))
	_S.define(_e, "y1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "c"), 1), _S.read(_e, "big"))]))
	_S.define(_e, "Rt", [_S.prop(_S.read(_e, "R"), 0), _S.prop(_S.read(_e, "R"), 3), _S.prop(_S.read(_e, "R"), 6), _S.prop(_S.read(_e, "R"), 1), _S.prop(_S.read(_e, "R"), 4), _S.prop(_S.read(_e, "R"), 7), _S.prop(_S.read(_e, "R"), 2), _S.prop(_S.read(_e, "R"), 5), _S.prop(_S.read(_e, "R"), 8)])
	_S.define(_e, "D", [_S.binary("/", 1, _S.binary("*", _S.prop(_S.read(_e, "r"), 0), _S.prop(_S.read(_e, "r"), 0))), _S.binary("/", 1, _S.binary("*", _S.prop(_S.read(_e, "r"), 1), _S.prop(_S.read(_e, "r"), 1))), _S.binary("/", 1, _S.binary("*", _S.prop(_S.read(_e, "r"), 2), _S.prop(_S.read(_e, "r"), 2)))])
	_S.define(_e, "A", _S.construct(_S.read(_e, "Array"), [9]))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 3)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "j"), 3)):
			_S.set_prop(_S.read(_v15, "A"), _S.binary("+", _S.binary("*", _S.read(_v15, "i"), 3), _S.read(_v15, "j")), _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "R"), _S.binary("*", _S.read(_v15, "i"), 3)), _S.prop(_S.read(_v15, "D"), 0)), _S.prop(_S.read(_v15, "R"), _S.binary("*", _S.read(_v15, "j"), 3))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "R"), _S.binary("+", _S.binary("*", _S.read(_v15, "i"), 3), 1)), _S.prop(_S.read(_v15, "D"), 1)), _S.prop(_S.read(_v15, "R"), _S.binary("+", _S.binary("*", _S.read(_v15, "j"), 3), 1)))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "R"), _S.binary("+", _S.binary("*", _S.read(_v15, "i"), 3), 2)), _S.prop(_S.read(_v15, "D"), 2)), _S.prop(_S.read(_v15, "R"), _S.binary("+", _S.binary("*", _S.read(_v15, "j"), 3), 2)))), "=", false)
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "j", 1, "+=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	_S.unary("void", _S.read(_e, "Rt"))
	var _v16 = _S.scope(_e)
	_S.define(_v16, "wy", _S.read(_v16, "y0"))
	while _S.truth(_S.binary("<=", _S.read(_v16, "wy"), _S.read(_v16, "y1"))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "wx", _S.read(_v17, "x0"))
		while _S.truth(_S.binary("<=", _S.read(_v17, "wx"), _S.read(_v17, "x1"))):
			var _v18 = _S.scope(_v17)
			if _S.truth(_S.logical("&&", _S.read(_v18, "clipBody"), func(): return _S.binary("<", _S.read(_v18, "wy"), 1.5))):
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "wx", 1, "+=", true)
				continue
			_S.define(_v18, "dx", _S.binary("-", _S.read(_v18, "wx"), _S.prop(_S.read(_v18, "c"), 0)))
			_S.define(_v18, "dy", _S.binary("-", _S.read(_v18, "wy"), _S.prop(_S.read(_v18, "c"), 1)))
			_S.define(_v18, "qa", _S.prop(_S.read(_v18, "A"), 8))
			_S.define(_v18, "qb", _S.binary("*", 2, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "A"), 2), _S.read(_v18, "dx")), _S.binary("*", _S.prop(_S.read(_v18, "A"), 5), _S.read(_v18, "dy")))))
			_S.define(_v18, "qc", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "A"), 0), _S.read(_v18, "dx")), _S.read(_v18, "dx")), _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.prop(_S.read(_v18, "A"), 1)), _S.read(_v18, "dx")), _S.read(_v18, "dy"))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "A"), 4), _S.read(_v18, "dy")), _S.read(_v18, "dy"))), 1))
			_S.define(_v18, "disc", _S.binary("-", _S.binary("*", _S.read(_v18, "qb"), _S.read(_v18, "qb")), _S.binary("*", _S.binary("*", 4, _S.read(_v18, "qa")), _S.read(_v18, "qc"))))
			if _S.truth(_S.binary("<", _S.read(_v18, "disc"), 0)):
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "wx", 1, "+=", true)
				continue
			_S.define(_v18, "dz", _S.binary("/", _S.binary("+", _S.unary("-", _S.read(_v18, "qb")), _S.invoke(_S.read(_v18, "Math"), "sqrt", [_S.read(_v18, "disc")])), _S.binary("*", 2, _S.read(_v18, "qa"))))
			_S.define(_v18, "n", _S.call_value(_S.read(_v18, "unit"), [[_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "A"), 0), _S.read(_v18, "dx")), _S.binary("*", _S.prop(_S.read(_v18, "A"), 1), _S.read(_v18, "dy"))), _S.binary("*", _S.prop(_S.read(_v18, "A"), 2), _S.read(_v18, "dz"))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "A"), 3), _S.read(_v18, "dx")), _S.binary("*", _S.prop(_S.read(_v18, "A"), 4), _S.read(_v18, "dy"))), _S.binary("*", _S.prop(_S.read(_v18, "A"), 5), _S.read(_v18, "dz"))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "A"), 6), _S.read(_v18, "dx")), _S.binary("*", _S.prop(_S.read(_v18, "A"), 7), _S.read(_v18, "dy"))), _S.binary("*", _S.prop(_S.read(_v18, "A"), 8), _S.read(_v18, "dz")))]]))
			_S.call_value(_S.read(_v18, "plot"), [_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v18, "OY"), _S.read(_v18, "wy")), _S.read(_v18, "BW")), _S.binary("+", _S.read(_v18, "OX"), _S.read(_v18, "wx"))), _S.binary("+", _S.prop(_S.read(_v18, "c"), 2), _S.read(_v18, "dz")), _S.call_value(_S.read(_v18, "dot"), [_S.read(_v18, "n"), _S.read(_v18, "LIGHT")]), _S.read(_v18, "part"), _S.read(_v18, "mat"), _S.read(_v18, "wx"), _S.read(_v18, "wy"), 0])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "wx", 1, "+=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "wy", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	var _v19 = _S.read(_e, "S")
	_S.define(_e, "B", _S.prop(_v19, "B"))
	_S.define(_e, "armN", _S.prop(_v19, "armN"))
	_S.define(_e, "armF", _S.prop(_v19, "armF"))
	_S.define(_e, "legN", _S.prop(_v19, "legN"))
	_S.define(_e, "legF", _S.prop(_v19, "legF"))
	_S.define(_e, "sN", _S.prop(_v19, "sN"))
	_S.define(_e, "sF", _S.prop(_v19, "sF"))
	_S.define(_e, "hipN", _S.prop(_v19, "hipN"))
	_S.define(_e, "hipF", _S.prop(_v19, "hipF"))
	_S.define(_e, "turn", _S.prop(_v19, "turn"))
	_S.define(_e, "F_", _S.function_value(_e, "_f14"))
	_S.call_value(_S.read(_e, "useFrame"), ["pelvis"])
	_S.call_value(_S.read(_e, "ellipsoid"), [_S.call_value(_S.read(_e, "add"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["pelvis"]), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["pelvis"]), "R"), [0, _S.unary("-", 0.2), 0]])]), _S.prop(_S.call_value(_S.read(_e, "F_"), ["pelvis"]), "R"), [2.9, 2.6, 4.2], _S.prop(_S.read(_e, "PART"), "pelvis"), 0])
	_S.call_value(_S.read(_e, "useFrame"), ["waist"])
	_S.call_value(_S.read(_e, "sweep"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["pelvis"]), "t"), _S.prop(_S.call_value(_S.read(_e, "F_"), ["chest"]), "t"), 3, 3.3, _S.prop(_S.read(_e, "PART"), "waist"), 1])
	_S.call_value(_S.read(_e, "useFrame"), ["chest"])
	_S.call_value(_S.read(_e, "ellipsoid"), [_S.call_value(_S.read(_e, "add"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["chest"]), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["chest"]), "R"), [0.2, 0.9, 0]])]), _S.prop(_S.call_value(_S.read(_e, "F_"), ["chest"]), "R"), [3.4, 4.2, 5.5], _S.prop(_S.read(_e, "PART"), "chest"), 0])
	_S.call_value(_S.read(_e, "useFrame"), ["neck"])
	_S.call_value(_S.read(_e, "sweep"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["neck"]), "t"), _S.call_value(_S.read(_e, "add"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["neck"]), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "R"), [0, 1.6, 0]])]), 1.25, 1.15, _S.prop(_S.read(_e, "PART"), "neck"), 1])
	_S.call_value(_S.read(_e, "useFrame"), ["head"])
	_S.call_value(_S.read(_e, "ellipsoid"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "t"), _S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "R"), [3, 3.3, 2.8], _S.prop(_S.read(_e, "PART"), "head"), 0])
	_S.call_value(_S.read(_e, "ellipsoid"), [_S.call_value(_S.read(_e, "add"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "R"), [0.85, _S.unary("-", 0.45), 0]])]), _S.prop(_S.call_value(_S.read(_e, "F_"), ["head"]), "R"), [2.4, 2.7, 2.35], _S.prop(_S.read(_e, "PART"), "face"), 0])
	_S.define(_e, "arm", _S.function_value(_e, "_f15"))
	_S.call_value(_S.read(_e, "arm"), [false, _S.read(_e, "armN"), _S.read(_e, "sN"), _S.prop(_S.read(_e, "PART"), "upperN"), _S.prop(_S.read(_e, "PART"), "elbowN"), _S.prop(_S.read(_e, "PART"), "foreN"), _S.prop(_S.read(_e, "PART"), "handN"), "upperN", "foreN"])
	_S.call_value(_S.read(_e, "arm"), [true, _S.read(_e, "armF"), _S.read(_e, "sF"), _S.prop(_S.read(_e, "PART"), "upperF"), _S.prop(_S.read(_e, "PART"), "elbowF"), _S.prop(_S.read(_e, "PART"), "foreF"), _S.prop(_S.read(_e, "PART"), "handF"), "upperF", "foreF"])
	_S.define(_e, "leg", _S.function_value(_e, "_f16"))
	_S.call_value(_S.read(_e, "leg"), [false, _S.read(_e, "legN"), _S.read(_e, "hipN"), _S.prop(_S.read(_e, "PART"), "thighN"), _S.prop(_S.read(_e, "PART"), "kneeN"), _S.prop(_S.read(_e, "PART"), "shinN"), _S.prop(_S.read(_e, "PART"), "footN"), "thighN", "shinN", "footN"])
	_S.call_value(_S.read(_e, "leg"), [true, _S.read(_e, "legF"), _S.read(_e, "hipF"), _S.prop(_S.read(_e, "PART"), "thighF"), _S.prop(_S.read(_e, "PART"), "kneeF"), _S.prop(_S.read(_e, "PART"), "shinF"), _S.prop(_S.read(_e, "PART"), "footF"), "thighF", "shinF", "footF"])
	_S.unary("void", _S.read(_e, "turn"))
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "name", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "B"), _S.read(_e, "name"))

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

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "far", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "hip", _S.arg(_args, 2))
	_S.define(_e, "th", _S.arg(_args, 3))
	_S.define(_e, "kn", _S.arg(_args, 4))
	_S.define(_e, "sh", _S.arg(_args, 5))
	_S.define(_e, "fo", _S.arg(_args, 6))
	_S.define(_e, "nameT", _S.arg(_args, 7))
	_S.define(_e, "nameS", _S.arg(_args, 8))
	_S.define(_e, "nameFt", _S.arg(_args, 9))
	_S.call_value(_S.read(_e, "useFrame"), [_S.read(_e, "nameT")])
	_S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "hip"), _S.prop(_S.read(_e, "L"), "joint"), 3.2, 2.2, _S.read(_e, "th"), 0])
	_S.call_value(_S.read(_e, "sphere"), [_S.prop(_S.read(_e, "L"), "joint"), 1.9, _S.read(_e, "kn"), 1])
	_S.call_value(_S.read(_e, "useFrame"), [_S.read(_e, "nameS")])
	_S.call_value(_S.read(_e, "sweep"), [_S.prop(_S.read(_e, "L"), "joint"), _S.prop(_S.read(_e, "L"), "end"), 2.15, 1.4, _S.read(_e, "sh"), 0, 0.4])
	_S.call_value(_S.read(_e, "useFrame"), [_S.read(_e, "nameFt")])
	_S.define(_e, "R", _S.prop(_S.call_value(_S.read(_e, "F_"), [_S.read(_e, "nameFt")]), "R"))
	_S.define(_e, "a", _S.prop(_S.call_value(_S.read(_e, "F_"), [_S.read(_e, "nameFt")]), "t"))
	_S.call_value(_S.read(_e, "sweep"), [_S.call_value(_S.read(_e, "add"), [_S.read(_e, "a"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "R"), [_S.unary("-", 1.5), _S.unary("-", 0.6), 0]])]), _S.call_value(_S.read(_e, "add"), [_S.read(_e, "a"), _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "R"), [4.6, _S.unary("-", 1.1), 0]])]), 1.7, 1.25, _S.read(_e, "fo"), 0])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "H", _S.arg(_args, 0))
	_S.define(_e, "axis", _S.arg(_args, 1))
	_S.define(_e, "side", _S.arg(_args, 2))
	_S.define(_e, "part", _S.arg(_args, 3))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "cross"), [_S.read(_e, "axis"), _S.read(_e, "side")]))
	_S.define(_e, "T", _S.function_value(_e, "_f18"))
	_S.set_prop(_S.read(_e, "T"), "at", _S.function_value(_e, "_f19"), "=", false)
	return _S.read(_e, "T")

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

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 0), _S.binary("*", _S.prop(_S.read(_e, "axis"), 0), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 0), _S.read(_e, "k"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 1), _S.binary("*", _S.prop(_S.read(_e, "axis"), 1), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 1), _S.read(_e, "k"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "H"), 2), _S.binary("*", _S.prop(_S.read(_e, "axis"), 2), _S.read(_e, "i"))), _S.binary("*", _S.prop(_S.read(_e, "side"), 2), _S.read(_e, "k")))]

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.define(_e, "from", _S.arg(_args, 1))
	_S.define(_e, "length", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", _S.read(_v20, "from"))
	while _S.truth(_S.binary("<=", _S.read(_v20, "i"), _S.binary("+", _S.binary("+", _S.read(_v20, "from"), _S.read(_v20, "length")), 0.01))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "r", _S.binary("-", _S.read(_v21, "i"), _S.read(_v21, "from")))
		_S.define(_v21, "wd", (_S.invoke(_S.read(_v21, "Math"), "max", [0, _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v21, "length"), _S.read(_v21, "r")), 5), _S.read(_v21, "w"))]) if _S.truth(_S.binary(">", _S.read(_v21, "r"), _S.binary("-", _S.read(_v21, "length"), 5))) else _S.read(_v21, "w")))
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "k", _S.unary("-", _S.read(_v22, "wd")))
		while _S.truth(_S.binary("<=", _S.read(_v22, "k"), _S.binary("+", _S.read(_v22, "wd"), 0.01))):
			_S.call_value(_S.read(_v22, "T"), [_S.read(_v22, "i"), _S.read(_v22, "k"), (_S.prop(_S.read(_v22, "STEEL"), "hi") if _S.truth(_S.binary("<", _S.read(_v22, "k"), _S.binary("*", _S.unary("-", _S.read(_v22, "w")), 0.4))) else (_S.prop(_S.read(_v22, "STEEL"), "d") if _S.truth(_S.binary(">", _S.read(_v22, "k"), _S.binary("*", _S.read(_v22, "w"), 0.4))) else _S.prop(_S.read(_v22, "STEEL"), "a")))])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "k", 0.4, "+=", false)
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 0.4, "+=", false)
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

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "part", _S.arg(_args, 0))
	return (1 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "part"), _S.prop(_S.read(_e, "PART"), "upperF")), func(): return _S.binary("<=", _S.read(_e, "part"), _S.prop(_S.read(_e, "PART"), "handF")))) else (1 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "part"), _S.prop(_S.read(_e, "PART"), "thighF")), func(): return _S.binary("<=", _S.read(_e, "part"), _S.prop(_S.read(_e, "PART"), "footF")))) else 0))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "part", _S.arg(_args, 1))
	_S.define(_e, "t", (0 if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.8)) else (1 if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.42)) else (2 if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.08)) else 3))))
	_S.write(_e, "t", _S.invoke(_S.read(_e, "Math"), "min", [3, _S.binary("+", _S.read(_e, "t"), _S.call_value(_S.read(_e, "dim"), [_S.read(_e, "part")]))]), "=", false)
	return _S.read(_e, "t")

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary(">", _S.read(_e, "v"), 0)

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "f", _S.prop(_S.read(_e, "Fr"), _S.read(_e, "i")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "f"), 0), func(): return _S.unary("!", _S.read(_e, "restFrames")))):
		return _S.unary("-", 1)
	_S.define(_e, "name", _S.prop(_S.read(_e, "FRAME_IDS"), _S.read(_e, "f")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "B"), _S.read(_e, "name")))
	_S.define(_e, "R0", _S.prop(_S.read(_e, "restFrames"), _S.read(_e, "name")))
	_S.define(_e, "wx", _S.binary("-", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "BW")), _S.read(_e, "OX")))
	_S.define(_e, "wy", _S.binary("-", _S.read(_e, "OY"), _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "BW")), 0)))
	_S.define(_e, "P", [_S.read(_e, "wx"), _S.read(_e, "wy"), _S.prop(_S.read(_e, "Zb"), _S.read(_e, "i"))])
	_S.define(_e, "lp", _S.call_value(_S.read(_e, "tv"), [_S.prop(_S.read(_e, "A"), "R"), _S.call_value(_S.read(_e, "sub"), [_S.read(_e, "P"), _S.prop(_S.read(_e, "A"), "t")])]))
	_S.define(_e, "rp", _S.call_value(_S.read(_e, "add"), [_S.prop(_S.read(_e, "R0"), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.read(_e, "R0"), "R"), _S.read(_e, "lp")])]))
	_S.define(_e, "c", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "rp"), 0)]), 12))
	_S.define(_e, "r", _S.binary("-", 38, _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "rp"), 1)])))
	return (_S.unary("-", 1) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "c"), 0), func(): return _S.binary("<", _S.read(_e, "r"), 0)), func(): return _S.binary(">=", _S.read(_e, "c"), _S.read(_e, "W0"))), func(): return _S.binary(">=", _S.read(_e, "r"), _S.read(_e, "H0")))) else _S.binary("+", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "W0")), _S.read(_e, "c")))

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

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "solve"), [_S.read(_e, "pose")]))
	_S.define(_e, "q", _S.prop(_S.read(_e, "S"), "q"))
	_S.define(_e, "near", _S.call_value(_S.read(_e, "len"), [_S.call_value(_S.read(_e, "sub"), [_S.prop(_S.prop(_S.read(_e, "S"), "armN"), "end"), [_S.prop(_S.read(_e, "q"), "fx"), _S.unary("-", _S.prop(_S.read(_e, "q"), "fy")), _S.prop(_S.prop(_S.prop(_S.read(_e, "S"), "armN"), "end"), 2)]])]))
	_S.define(_e, "far", (0 if _S.truth(_S.prop(_S.read(_e, "q"), "two")) else _S.call_value(_S.read(_e, "len"), [_S.call_value(_S.read(_e, "sub"), [_S.prop(_S.prop(_S.read(_e, "S"), "armF"), "end"), [_S.prop(_S.read(_e, "q"), "bx"), _S.unary("-", _S.prop(_S.read(_e, "q"), "by")), _S.prop(_S.prop(_S.prop(_S.read(_e, "S"), "armF"), "end"), 2)]])])))
	return _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "near"), _S.read(_e, "far")])

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

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pose", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "solve"), [_S.read(_e, "pose")]))
	_S.define(_e, "q", _S.prop(_S.read(_e, "S"), "q"))
	_S.define(_e, "whole", _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "q"), "yaw"), func(): return 0), (_S.prop(_S.read(_e, "Math"), "PI") if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "q"), "face"), _S.unary("-", 1))) else 0)))
	if _S.truth(_S.read(_e, "whole")):
		_S.call_value(_S.read(_e, "turnAll"), [_S.read(_e, "S"), _S.read(_e, "whole")])
	var _v62 = _S.read(_e, "S")
	_S.define(_e, "B", _S.prop(_v62, "B"))
	_S.define(_e, "armN", _S.prop(_v62, "armN"))
	_S.define(_e, "armF", _S.prop(_v62, "armF"))
	_S.define(_e, "legN", _S.prop(_v62, "legN"))
	_S.define(_e, "legF", _S.prop(_v62, "legF"))
	_S.define(_e, "sN", _S.prop(_v62, "sN"))
	_S.define(_e, "sF", _S.prop(_v62, "sF"))
	_S.define(_e, "hipN", _S.prop(_v62, "hipN"))
	_S.define(_e, "hipF", _S.prop(_v62, "hipF"))
	_S.define(_e, "at", _S.function_value(_e, "_f31"))
	_S.define(_e, "J", _S.merge([{"pelvis": _S.prop(_S.prop(_S.read(_e, "B"), "pelvis"), "t")}, {"waist": _S.prop(_S.prop(_S.read(_e, "B"), "waist"), "t")}, {"chest": _S.prop(_S.prop(_S.read(_e, "B"), "chest"), "t")}, {"neck": _S.prop(_S.prop(_S.read(_e, "B"), "neck"), "t")}, {"head": _S.prop(_S.prop(_S.read(_e, "B"), "head"), "t")}, {"crown": _S.call_value(_S.read(_e, "at"), [_S.prop(_S.read(_e, "B"), "head"), [0, 3.3, 0]])}, {"shoulderN": _S.read(_e, "sN")}, {"elbowN": _S.prop(_S.read(_e, "armN"), "joint")}, {"handN": _S.prop(_S.read(_e, "armN"), "end")}, {"shoulderF": _S.read(_e, "sF")}, {"elbowF": _S.prop(_S.read(_e, "armF"), "joint")}, {"handF": _S.prop(_S.read(_e, "armF"), "end")}, {"hipN": _S.read(_e, "hipN")}, {"kneeN": _S.prop(_S.read(_e, "legN"), "joint")}, {"ankleN": _S.prop(_S.read(_e, "legN"), "end")}, {"toeN": _S.call_value(_S.read(_e, "at"), [_S.prop(_S.read(_e, "B"), "footN"), [4.6, _S.unary("-", 1.1), 0]])}, {"hipF": _S.read(_e, "hipF")}, {"kneeF": _S.prop(_S.read(_e, "legF"), "joint")}, {"ankleF": _S.prop(_S.read(_e, "legF"), "end")}, {"toeF": _S.call_value(_S.read(_e, "at"), [_S.prop(_S.read(_e, "B"), "footF"), [4.6, _S.unary("-", 1.1), 0]])}]))
	_S.define(_e, "joints", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "J")]), "map", [_S.function_value(_e, "_f32")])]))
	_S.define(_e, "bones", [["pelvis", "waist"], ["waist", "chest"], ["chest", "neck"], ["neck", "head"], ["head", "crown"], ["chest", "shoulderN"], ["shoulderN", "elbowN"], ["elbowN", "handN"], ["chest", "shoulderF"], ["shoulderF", "elbowF"], ["elbowF", "handF"], ["pelvis", "hipN"], ["hipN", "kneeN"], ["kneeN", "ankleN"], ["ankleN", "toeN"], ["pelvis", "hipF"], ["hipF", "kneeF"], ["kneeF", "ankleF"], ["ankleF", "toeF"]])
	return _S.merge([{"joints": _S.read(_e, "joints")}, {"bones": _S.read(_e, "bones")}, {"handles": ["handN", "handF", "ankleN", "ankleF"]}])

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "add"), [_S.prop(_S.read(_e, "f"), "t"), _S.call_value(_S.read(_e, "mv"), [_S.prop(_S.read(_e, "f"), "R"), _S.read(_e, "v")])])

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v63 = _S.arg(_args, 0)
	_S.define(_e, "k", _S.prop(_v63, 0))
	_S.define(_e, "v", _S.prop(_v63, 1))
	return [_S.read(_e, "k"), [_S.prop(_S.read(_e, "v"), 0), _S.unary("-", _S.prop(_S.read(_e, "v"), 1)), _S.prop(_S.read(_e, "v"), 2)]]

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

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v70 = _S.arg(_args, 0)
	_S.define(_e, "k", _S.prop(_v70, 0))
	_S.define(_e, "v", _S.prop(_v70, 1))
	return [_S.read(_e, "k"), _S.binary(">>>", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "v")]), 0)]

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return [_S.binary("+", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 0)), _S.binary("+", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 1)), _S.binary("+", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 2))]

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return [_S.binary("-", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 0)), _S.binary("-", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 1)), _S.binary("-", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 2))]

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	return [_S.binary("*", _S.prop(_S.read(_e, "a"), 0), _S.read(_e, "s")), _S.binary("*", _S.prop(_S.read(_e, "a"), 1), _S.read(_e, "s")), _S.binary("*", _S.prop(_S.read(_e, "a"), 2), _S.read(_e, "s"))]

static func _f38(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 0)), _S.binary("*", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 1))), _S.binary("*", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 2)))

static func _f39(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return [_S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 2)), _S.binary("*", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 1))), _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 0)), _S.binary("*", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 2))), _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 1)), _S.binary("*", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 0)))]

static func _f40(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "a"), 2)])

static func _f41(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mul"), [_S.read(_e, "a"), _S.binary("/", 1, _S.logical("||", _S.call_value(_S.read(_e, "len"), [_S.read(_e, "a")]), func(): return 0.000001))])

static func _f42(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "t")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "t")]))
	return [_S.read(_e, "c"), 0, _S.read(_e, "s"), 0, 1, 0, _S.unary("-", _S.read(_e, "s")), 0, _S.read(_e, "c")]

static func _f43(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "t")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "t")]))
	return [_S.read(_e, "c"), _S.unary("-", _S.read(_e, "s")), 0, _S.read(_e, "s"), _S.read(_e, "c"), 0, 0, 0, 1]

static func _f44(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "o", _S.construct(_S.read(_e, "Array"), [9]))
	var _v71 = _S.scope(_e)
	_S.define(_v71, "r", 0)
	while _S.truth(_S.binary("<", _S.read(_v71, "r"), 3)):
		var _v72 = _S.scope(_v71)
		_S.define(_v72, "c", 0)
		while _S.truth(_S.binary("<", _S.read(_v72, "c"), 3)):
			_S.set_prop(_S.read(_v72, "o"), _S.binary("+", _S.binary("*", _S.read(_v72, "r"), 3), _S.read(_v72, "c")), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v72, "A"), _S.binary("*", _S.read(_v72, "r"), 3)), _S.prop(_S.read(_v72, "B"), _S.read(_v72, "c"))), _S.binary("*", _S.prop(_S.read(_v72, "A"), _S.binary("+", _S.binary("*", _S.read(_v72, "r"), 3), 1)), _S.prop(_S.read(_v72, "B"), _S.binary("+", 3, _S.read(_v72, "c"))))), _S.binary("*", _S.prop(_S.read(_v72, "A"), _S.binary("+", _S.binary("*", _S.read(_v72, "r"), 3), 2)), _S.prop(_S.read(_v72, "B"), _S.binary("+", 6, _S.read(_v72, "c"))))), "=", false)
			_v72 = _S.iteration(_v72)
			_S.write(_v72, "c", 1, "+=", true)
		_v71 = _S.iteration(_v71)
		_S.write(_v71, "r", 1, "+=", true)
	return _S.read(_e, "o")

static func _f45(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "M", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return [_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 0), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 1), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 2), _S.prop(_S.read(_e, "v"), 2))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 3), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 4), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 5), _S.prop(_S.read(_e, "v"), 2))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 6), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 7), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 8), _S.prop(_S.read(_e, "v"), 2)))]

static func _f46(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "M", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return [_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 0), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 3), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 6), _S.prop(_S.read(_e, "v"), 2))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 1), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 4), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 7), _S.prop(_S.read(_e, "v"), 2))), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "M"), 2), _S.prop(_S.read(_e, "v"), 0)), _S.binary("*", _S.prop(_S.read(_e, "M"), 5), _S.prop(_S.read(_e, "v"), 1))), _S.binary("*", _S.prop(_S.read(_e, "M"), 8), _S.prop(_S.read(_e, "v"), 2)))]

static func _f47(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "v")])])

static func _f48(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "name", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "WEAPONS"), _S.read(_e, "name"))

static func _f49(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "name", _S.arg(_args, 0))
	_S.write(_e, "curFrameIndex", _S.invoke(_S.read(_e, "FRAME_IDS"), "indexOf", [_S.read(_e, "name")]), "=", false)
	return null

static func _f50(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v73 = _S.arg(_args, 0)
	_S.define(_e, "k", _S.prop(_v73, 0))
	_S.define(_e, "v", _S.prop(_v73, 1))
	return [_S.read(_e, "k"), _S.binary(">>>", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "v")]), 0)]

static func _f51(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.define(_e, "from", _S.arg(_args, 1))
	_S.define(_e, "to", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "d", _S.arg(_args, 4))
	_S.define(_e, "r", _S.coalesce(_S.arg(_args, 5), func(): return 0.8))
	var _v74 = _S.scope(_e)
	_S.define(_v74, "i", _S.read(_v74, "from"))
	while _S.truth(_S.binary("<=", _S.read(_v74, "i"), _S.read(_v74, "to"))):
		var _v75 = _S.scope(_v74)
		_S.define(_v75, "k", _S.unary("-", _S.read(_v75, "r")))
		while _S.truth(_S.binary("<=", _S.read(_v75, "k"), _S.binary("+", _S.read(_v75, "r"), 0.01))):
			_S.call_value(_S.read(_v75, "T"), [_S.read(_v75, "i"), _S.read(_v75, "k"), (_S.read(_v75, "d") if _S.truth(_S.binary(">", _S.read(_v75, "k"), 0.1)) else _S.read(_v75, "a"))])
			_v75 = _S.iteration(_v75)
			_S.write(_v75, "k", 0.4, "+=", false)
		_v74 = _S.iteration(_v74)
		_S.write(_v74, "i", 0.4, "+=", false)
	return null

static func _f52(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "end", (_S.unary("-", 6.5) if _S.truth(_S.prop(_S.read(_e, "q"), "two")) else _S.unary("-", 2.6)))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.read(_e, "end"), 2.2, _S.prop(_S.read(_e, "STEEL"), "grip"), _S.prop(_S.read(_e, "STEEL"), "gripD")])
	var _v76 = _S.scope(_e)
	_S.define(_v76, "k", _S.unary("-", 1.4))
	while _S.truth(_S.binary("<=", _S.read(_v76, "k"), 1.4)):
		_S.call_value(_S.read(_v76, "T"), [_S.binary("-", _S.read(_v76, "end"), 0.4), _S.read(_v76, "k"), _S.prop(_S.read(_v76, "STEEL"), "gold")])
		_v76 = _S.iteration(_v76)
		_S.write(_v76, "k", 0.4, "+=", false)
	var _v77 = _S.scope(_e)
	_S.define(_v77, "k", _S.unary("-", 4.6))
	while _S.truth(_S.binary("<=", _S.read(_v77, "k"), 4.6)):
		_S.last([_S.call_value(_S.read(_v77, "T"), [2.6, _S.read(_v77, "k"), (_S.prop(_S.read(_v77, "STEEL"), "goldD") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v77, "Math"), "abs", [_S.read(_v77, "k")]), 3.8)) else _S.prop(_S.read(_v77, "STEEL"), "gold"))]), _S.call_value(_S.read(_v77, "T"), [3, _S.read(_v77, "k"), _S.prop(_S.read(_v77, "STEEL"), "goldD")])])
		_v77 = _S.iteration(_v77)
		_S.write(_v77, "k", 0.4, "+=", false)
	_S.call_value(_S.read(_e, "blade"), [_S.read(_e, "T"), 3.2, 25, 2.2])
	return null

static func _f53(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.unary("-", 7.2), 2.2, _S.prop(_S.read(_e, "STEEL"), "grip"), _S.prop(_S.read(_e, "STEEL"), "gripD")])
	var _v78 = _S.scope(_e)
	_S.define(_v78, "k", _S.unary("-", 1.8))
	while _S.truth(_S.binary("<=", _S.read(_v78, "k"), 1.8)):
		_S.call_value(_S.read(_v78, "T"), [_S.unary("-", 7.6), _S.read(_v78, "k"), _S.prop(_S.read(_v78, "STEEL"), "gold")])
		_v78 = _S.iteration(_v78)
		_S.write(_v78, "k", 0.4, "+=", false)
	var _v79 = _S.scope(_e)
	_S.define(_v79, "k", _S.unary("-", 6.6))
	while _S.truth(_S.binary("<=", _S.read(_v79, "k"), 6.6)):
		_S.last([_S.call_value(_S.read(_v79, "T"), [2.6, _S.read(_v79, "k"), (_S.prop(_S.read(_v79, "STEEL"), "goldD") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v79, "Math"), "abs", [_S.read(_v79, "k")]), 5.6)) else _S.prop(_S.read(_v79, "STEEL"), "gold"))]), _S.call_value(_S.read(_v79, "T"), [3, _S.read(_v79, "k"), _S.prop(_S.read(_v79, "STEEL"), "goldD")])])
		_v79 = _S.iteration(_v79)
		_S.write(_v79, "k", 0.4, "+=", false)
	_S.call_value(_S.read(_e, "blade"), [_S.read(_e, "T"), 3.2, 31, 3])
	var _v80 = _S.scope(_e)
	_S.define(_v80, "i", 4)
	while _S.truth(_S.binary("<=", _S.read(_v80, "i"), 28)):
		_S.call_value(_S.read(_v80, "T"), [_S.read(_v80, "i"), 0, _S.prop(_S.read(_v80, "STEEL"), "b")])
		_v80 = _S.iteration(_v80)
		_S.write(_v80, "i", 0.4, "+=", false)
	return null

static func _f54(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.unary("-", 2.4), 1.8, _S.prop(_S.read(_e, "STEEL"), "grip"), _S.prop(_S.read(_e, "STEEL"), "gripD")])
	var _v81 = _S.scope(_e)
	_S.define(_v81, "k", _S.unary("-", 2.6))
	while _S.truth(_S.binary("<=", _S.read(_v81, "k"), 2.6)):
		_S.call_value(_S.read(_v81, "T"), [2.2, _S.read(_v81, "k"), _S.prop(_S.read(_v81, "STEEL"), "goldD")])
		_v81 = _S.iteration(_v81)
		_S.write(_v81, "k", 0.4, "+=", false)
	_S.call_value(_S.read(_e, "blade"), [_S.read(_e, "T"), 2.6, 10, 1.3])
	return null

static func _f55(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.unary("-", 18), 36, _S.prop(_S.read(_e, "STEEL"), "wood"), _S.prop(_S.read(_e, "STEEL"), "woodD"), 0.5])
	_S.call_value(_S.read(_e, "blade"), [_S.read(_e, "T"), 36, 11, 2])
	var _v82 = _S.scope(_e)
	_S.define(_v82, "k", _S.unary("-", 2.4))
	while _S.truth(_S.binary("<=", _S.read(_v82, "k"), 2.4)):
		_S.call_value(_S.read(_v82, "T"), [36, _S.read(_v82, "k"), _S.prop(_S.read(_v82, "STEEL"), "goldD")])
		_v82 = _S.iteration(_v82)
		_S.write(_v82, "k", 0.4, "+=", false)
	return null

static func _f56(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	for _v83 in _S.array([_S.unary("-", 0.8), 0, 0.8]):
		var _v84 = _S.scope(_e)
		_S.define(_v84, "lift", _v83)
		var _v85 = _S.scope(_v84)
		_S.define(_v85, "i", _S.unary("-", 10))
		while _S.truth(_S.binary("<=", _S.read(_v85, "i"), 18)):
			var _v86 = _S.scope(_v85)
			_S.define(_v86, "k", _S.unary("-", 0.8))
			while _S.truth(_S.binary("<=", _S.read(_v86, "k"), 0.81)):
				_S.call_value(_S.read(_v86, "T"), [_S.read(_v86, "i"), _S.read(_v86, "k"), (_S.prop(_S.read(_v86, "STEEL"), "woodD") if _S.truth(_S.binary(">", _S.read(_v86, "k"), 0.1)) else _S.prop(_S.read(_v86, "STEEL"), "wood")), _S.read(_v86, "lift")])
				_v86 = _S.iteration(_v86)
				_S.write(_v86, "k", 0.4, "+=", false)
			_v85 = _S.iteration(_v85)
			_S.write(_v85, "i", 0.4, "+=", false)
	var _v87 = _S.scope(_e)
	_S.define(_v87, "i", 18)
	while _S.truth(_S.binary("<=", _S.read(_v87, "i"), 28)):
		var _v88 = _S.scope(_v87)
		_S.define(_v88, "k", _S.unary("-", 9))
		while _S.truth(_S.binary("<=", _S.read(_v88, "k"), 9)):
			var _v89 = _S.scope(_v88)
			_S.define(_v89, "face", ((_S.prop(_S.read(_v89, "STEEL"), "a") if _S.truth(_S.binary("<", _S.read(_v89, "k"), 0)) else _S.prop(_S.read(_v89, "STEEL"), "d")) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v89, "Math"), "abs", [_S.read(_v89, "k")]), 7.4)) else (_S.prop(_S.read(_v89, "STEEL"), "hi") if _S.truth(_S.binary("<", _S.read(_v89, "i"), 20)) else (_S.prop(_S.read(_v89, "STEEL"), "d") if _S.truth(_S.binary(">", _S.read(_v89, "i"), 26.4)) else (_S.prop(_S.read(_v89, "STEEL"), "gold") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v89, "Math"), "abs", [_S.read(_v89, "k")]), 2)) else _S.prop(_S.read(_v89, "STEEL"), "b"))))))
			_S.call_value(_S.read(_v89, "T"), [_S.read(_v89, "i"), _S.read(_v89, "k"), _S.read(_v89, "face"), 4.5])
			_S.call_value(_S.read(_v89, "T"), [_S.read(_v89, "i"), _S.read(_v89, "k"), _S.read(_v89, "face"), _S.unary("-", 4.5)])
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v89, "i"), 18.4), func(): return _S.binary(">", _S.read(_v89, "i"), 27.6)), func(): return _S.binary(">", _S.invoke(_S.read(_v89, "Math"), "abs", [_S.read(_v89, "k")]), 8.6))):
				var _v90 = _S.scope(_v89)
				_S.define(_v90, "l", _S.unary("-", 4))
				while _S.truth(_S.binary("<=", _S.read(_v90, "l"), 4)):
					_S.call_value(_S.read(_v90, "T"), [_S.read(_v90, "i"), _S.read(_v90, "k"), (_S.prop(_S.read(_v90, "STEEL"), "a") if _S.truth(_S.binary("<", _S.read(_v90, "k"), 0)) else (_S.prop(_S.read(_v90, "STEEL"), "d") if _S.truth(_S.binary(">", _S.read(_v90, "i"), 27.6)) else _S.prop(_S.read(_v90, "STEEL"), "b"))), _S.read(_v90, "l")])
					_v90 = _S.iteration(_v90)
					_S.write(_v90, "l", 0.4, "+=", false)
			_v88 = _S.iteration(_v88)
			_S.write(_v88, "k", 0.4, "+=", false)
		_v87 = _S.iteration(_v87)
		_S.write(_v87, "i", 0.4, "+=", false)
	return null

static func _f57(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.unary("-", 16), 31, _S.prop(_S.read(_e, "STEEL"), "dark"), _S.prop(_S.read(_e, "STEEL"), "darkD"), 0.5])
	var _v91 = _S.scope(_e)
	_S.define(_v91, "j", 0)
	while _S.truth(_S.binary("<=", _S.read(_v91, "j"), 28)):
		var _v92 = _S.scope(_v91)
		_S.define(_v92, "u", _S.binary("/", _S.read(_v92, "j"), 28))
		_S.define(_v92, "w", _S.binary("+", _S.binary("*", 3.2, _S.binary("-", 1, _S.read(_v92, "u"))), 0.3))
		_S.define(_v92, "b", _S.binary("-", 31.5, _S.binary("*", _S.binary("*", _S.read(_v92, "u"), _S.read(_v92, "u")), 12)))
		var _v93 = _S.scope(_v92)
		_S.define(_v93, "k", _S.unary("-", _S.read(_v93, "w")))
		while _S.truth(_S.binary("<=", _S.read(_v93, "k"), _S.read(_v93, "w"))):
			_S.call_value(_S.read(_v93, "T"), [_S.binary("+", _S.read(_v93, "b"), _S.read(_v93, "k")), _S.binary("+", _S.read(_v93, "j"), 0.8), (_S.prop(_S.read(_v93, "STEEL"), "hi") if _S.truth(_S.binary(">", _S.read(_v93, "k"), _S.binary("*", _S.read(_v93, "w"), 0.3))) else (_S.prop(_S.read(_v93, "STEEL"), "d") if _S.truth(_S.binary("<", _S.read(_v93, "k"), _S.binary("*", _S.unary("-", _S.read(_v93, "w")), 0.4))) else _S.prop(_S.read(_v93, "STEEL"), "b")))])
			_v93 = _S.iteration(_v93)
			_S.write(_v93, "k", 0.4, "+=", false)
		_v91 = _S.iteration(_v91)
		_S.write(_v91, "j", 0.4, "+=", false)
	return null

static func _f58(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	for _v94 in _S.array([_S.unary("-", 2.4), 0, 2.4]):
		var _v95 = _S.scope(_e)
		_S.define(_v95, "q0", _v94)
		var _v96 = _S.scope(_v95)
		_S.define(_v96, "i", 2)
		while _S.truth(_S.binary("<=", _S.read(_v96, "i"), 9.5)):
			var _v97 = _S.scope(_v96)
			_S.define(_v97, "u", _S.binary("/", _S.binary("-", _S.read(_v97, "i"), 2), 7.5))
			_S.define(_v97, "k", _S.binary("+", _S.read(_v97, "q0"), _S.binary("*", _S.binary("*", _S.read(_v97, "u"), _S.read(_v97, "u")), 1.8)))
			_S.call_value(_S.read(_v97, "T"), [_S.read(_v97, "i"), _S.read(_v97, "k"), (_S.prop(_S.read(_v97, "STEEL"), "hi") if _S.truth(_S.binary(">", _S.read(_v97, "u"), 0.55)) else _S.prop(_S.read(_v97, "STEEL"), "a"))])
			if _S.truth(_S.binary("<", _S.read(_v97, "u"), 0.6)):
				_S.call_value(_S.read(_v97, "T"), [_S.read(_v97, "i"), _S.binary("+", _S.read(_v97, "k"), 0.8), _S.prop(_S.read(_v97, "STEEL"), "d")])
			_v96 = _S.iteration(_v96)
			_S.write(_v96, "i", 0.4, "+=", false)
	return null

static func _f59(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "off", _S.arg(_args, 2))
	var _v98 = _S.scope(_e)
	_S.define(_v98, "u", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v98, "u"), 1.001)):
		var _v99 = _S.scope(_v98)
		_S.define(_v99, "k", _S.binary("*", _S.read(_v99, "u"), 17))
		_S.define(_v99, "i", _S.binary("-", _S.binary("*", 6, _S.binary("-", 1, _S.binary("*", _S.read(_v99, "u"), _S.read(_v99, "u")))), 1))
		_S.call_value(_S.read(_v99, "T"), [_S.read(_v99, "i"), _S.read(_v99, "k"), (_S.prop(_S.read(_v99, "STEEL"), "goldD") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v99, "Math"), "abs", [_S.read(_v99, "u")]), 0.85)) else _S.prop(_S.read(_v99, "STEEL"), "wood"))])
		_S.call_value(_S.read(_v99, "T"), [_S.binary("+", _S.read(_v99, "i"), 0.8), _S.read(_v99, "k"), _S.prop(_S.read(_v99, "STEEL"), "woodD")])
		_v98 = _S.iteration(_v98)
		_S.write(_v98, "u", 0.025, "+=", false)
	_S.define(_e, "tipA", _S.invoke(_S.read(_e, "T"), "at", [_S.unary("-", 1), _S.unary("-", 17)]))
	_S.define(_e, "tipB", _S.invoke(_S.read(_e, "T"), "at", [_S.unary("-", 1), 17]))
	_S.define(_e, "mid", (_S.read(_e, "off") if _S.truth(_S.prop(_S.read(_e, "q"), "pull")) else _S.invoke(_S.read(_e, "T"), "at", [_S.unary("-", 1), 0])))
	_S.define(_e, "line", _S.function_value(_e, "_f60"))
	_S.call_value(_S.read(_e, "line"), [_S.read(_e, "tipA"), _S.read(_e, "mid")])
	_S.call_value(_S.read(_e, "line"), [_S.read(_e, "tipB"), _S.read(_e, "mid")])
	if _S.truth(_S.prop(_S.read(_e, "q"), "nocked")):
		var _v102 = _S.scope(_e)
		_S.define(_v102, "nock", _S.read(_v102, "mid"))
		_S.define(_v102, "tip", _S.invoke(_S.read(_v102, "T"), "at", [13, 0]))
		_S.call_value(_S.read(_v102, "line"), [_S.read(_v102, "nock"), _S.read(_v102, "tip"), _S.prop(_S.read(_v102, "STEEL"), "wood")])
		var _v103 = _S.scope(_v102)
		_S.define(_v103, "i", 9)
		while _S.truth(_S.binary("<=", _S.read(_v103, "i"), 13)):
			var _v104 = _S.scope(_v103)
			_S.define(_v104, "k", _S.binary("*", _S.unary("-", _S.binary("-", 13, _S.read(_v104, "i"))), 0.45))
			while _S.truth(_S.binary("<=", _S.read(_v104, "k"), _S.binary("*", _S.binary("-", 13, _S.read(_v104, "i")), 0.45))):
				_S.call_value(_S.read(_v104, "T"), [_S.read(_v104, "i"), _S.read(_v104, "k"), _S.prop(_S.read(_v104, "STEEL"), "hi")])
				_v104 = _S.iteration(_v104)
				_S.write(_v104, "k", 0.4, "+=", false)
			_v103 = _S.iteration(_v103)
			_S.write(_v103, "i", 0.4, "+=", false)
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

static func _f61(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	var _v105 = _S.scope(_e)
	_S.define(_v105, "i", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v105, "i"), 9.5)):
		var _v106 = _S.scope(_v105)
		_S.define(_v106, "k", _S.unary("-", 4.2))
		while _S.truth(_S.binary("<=", _S.read(_v106, "k"), _S.unary("-", 2.4))):
			_S.call_value(_S.read(_v106, "T"), [_S.read(_v106, "i"), _S.read(_v106, "k"), (_S.prop(_S.read(_v106, "STEEL"), "a") if _S.truth(_S.binary("<", _S.read(_v106, "k"), _S.unary("-", 3.6))) else (_S.prop(_S.read(_v106, "STEEL"), "d") if _S.truth(_S.binary(">", _S.read(_v106, "k"), _S.unary("-", 2.9))) else _S.prop(_S.read(_v106, "STEEL"), "b")))])
			_v106 = _S.iteration(_v106)
			_S.write(_v106, "k", 0.4, "+=", false)
		_v105 = _S.iteration(_v105)
		_S.write(_v105, "i", 0.4, "+=", false)
	var _v107 = _S.scope(_e)
	_S.define(_v107, "i", _S.unary("-", 1.2))
	while _S.truth(_S.binary("<=", _S.read(_v107, "i"), 1.2)):
		var _v108 = _S.scope(_v107)
		_S.define(_v108, "k", _S.unary("-", 2.4))
		while _S.truth(_S.binary("<=", _S.read(_v108, "k"), 2.4)):
			_S.call_value(_S.read(_v108, "T"), [_S.read(_v108, "i"), _S.read(_v108, "k"), _S.prop(_S.read(_v108, "STEEL"), "gripD")])
			_v108 = _S.iteration(_v108)
			_S.write(_v108, "k", 0.4, "+=", false)
		_v107 = _S.iteration(_v107)
		_S.write(_v107, "i", 0.4, "+=", false)
	_S.call_value(_S.read(_e, "T"), [9, _S.unary("-", 4.6), _S.prop(_S.read(_e, "STEEL"), "hi")])
	return null

static func _f62(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	var _v109 = _S.scope(_e)
	_S.define(_v109, "i", _S.unary("-", 14))
	while _S.truth(_S.binary("<=", _S.read(_v109, "i"), 22)):
		var _v110 = _S.scope(_v109)
		_S.define(_v110, "k", _S.unary("-", 6))
		while _S.truth(_S.binary("<=", _S.read(_v110, "k"), _S.unary("-", 1))):
			_S.call_value(_S.read(_v110, "T"), [_S.read(_v110, "i"), _S.read(_v110, "k"), (_S.prop(_S.read(_v110, "STEEL"), "oliveA") if _S.truth(_S.binary("<", _S.read(_v110, "k"), _S.unary("-", 4.8))) else (_S.prop(_S.read(_v110, "STEEL"), "oliveD") if _S.truth(_S.binary(">", _S.read(_v110, "k"), _S.unary("-", 2.2))) else (_S.prop(_S.read(_v110, "STEEL"), "gold") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v110, "Math"), "abs", [_S.binary("-", _S.read(_v110, "i"), 3)]), 1.4)) else _S.prop(_S.read(_v110, "STEEL"), "olive"))))])
			_v110 = _S.iteration(_v110)
			_S.write(_v110, "k", 0.4, "+=", false)
		_v109 = _S.iteration(_v109)
		_S.write(_v109, "i", 0.4, "+=", false)
	var _v111 = _S.scope(_e)
	_S.define(_v111, "k", _S.unary("-", 6.8))
	while _S.truth(_S.binary("<=", _S.read(_v111, "k"), _S.unary("-", 0.2))):
		_S.last([_S.call_value(_S.read(_v111, "T"), [22.4, _S.read(_v111, "k"), _S.prop(_S.read(_v111, "STEEL"), "b")]), _S.call_value(_S.read(_v111, "T"), [_S.unary("-", 14.4), _S.read(_v111, "k"), _S.prop(_S.read(_v111, "STEEL"), "d")])])
		_v111 = _S.iteration(_v111)
		_S.write(_v111, "k", 0.4, "+=", false)
	return null

static func _f63(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "haft"), [_S.read(_e, "T"), _S.unary("-", 2.6), 6, _S.prop(_S.read(_e, "STEEL"), "grip"), _S.prop(_S.read(_e, "STEEL"), "gripD")])
	var _v112 = _S.scope(_e)
	_S.define(_v112, "k", _S.unary("-", 1.6))
	while _S.truth(_S.binary("<=", _S.read(_v112, "k"), 1.6)):
		_S.last([_S.call_value(_S.read(_v112, "T"), [_S.unary("-", 3), _S.read(_v112, "k"), _S.prop(_S.read(_v112, "STEEL"), "gold")]), _S.call_value(_S.read(_v112, "T"), [6.4, _S.read(_v112, "k"), _S.prop(_S.read(_v112, "STEEL"), "gold")])])
		_v112 = _S.iteration(_v112)
		_S.write(_v112, "k", 0.4, "+=", false)
	return null

static func _f64(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rotY"), [_S.unary("-", _S.read(_e, "a"))]))
	_S.define(_e, "P", _S.function_value(_e, "_f65"))
	for _v113 in _S.array(_S.invoke(_S.read(_e, "Object"), "values", [_S.prop(_S.read(_e, "S"), "B")])):
		var _v114 = _S.scope(_e)
		_S.define(_v114, "f", _v113)
		var _v115 = _S.scope(_v114)
		_S.set_prop(_S.read(_v115, "f"), "t", _S.call_value(_S.read(_v115, "P"), [_S.prop(_S.read(_v115, "f"), "t")]), "=", false)
		_S.set_prop(_S.read(_v115, "f"), "R", _S.call_value(_S.read(_v115, "mm"), [_S.read(_v115, "R"), _S.prop(_S.read(_v115, "f"), "R")]), "=", false)
	for _v116 in _S.array([_S.prop(_S.read(_e, "S"), "armN"), _S.prop(_S.read(_e, "S"), "armF"), _S.prop(_S.read(_e, "S"), "legN"), _S.prop(_S.read(_e, "S"), "legF")]):
		var _v117 = _S.scope(_e)
		_S.define(_v117, "A", _v116)
		var _v118 = _S.scope(_v117)
		_S.set_prop(_S.read(_v118, "A"), "joint", _S.call_value(_S.read(_v118, "P"), [_S.prop(_S.read(_v118, "A"), "joint")]), "=", false)
		_S.set_prop(_S.read(_v118, "A"), "end", _S.call_value(_S.read(_v118, "P"), [_S.prop(_S.read(_v118, "A"), "end")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "sN", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "sN")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "sF", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "sF")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "hipN", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "hipN")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "hipF", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "hipF")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "axis", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "axis")]), "=", false)
	_S.set_prop(_S.read(_e, "S"), "side", _S.call_value(_S.read(_e, "P"), [_S.prop(_S.read(_e, "S"), "side")]), "=", false)
	return null

static func _f65(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mv"), [_S.read(_e, "R"), _S.read(_e, "v")])

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
