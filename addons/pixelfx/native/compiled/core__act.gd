@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/act.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f20":"act_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/math.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "createFrame", _S.import_value("core/fx.js", "createFrame"))
	_S.define(_e, "clearFrame", _S.import_value("core/fx.js", "clearFrame"))
	_S.define(_e, "createFx", _S.import_value("core/fx.js", "createFx"))
	_S.define(_e, "painterFor", _S.import_value("core/fx.js", "painterFor"))
	_S.define(_e, "stockActor", _S.import_value("core/actor.js", "stockActor"))
	_S.define(_e, "drawActor", _S.import_value("core/actor.js", "drawActor"))
	_S.define(_e, "actorAlphaOf", _S.import_value("core/actor.js", "actorAlphaOf"))
	_S.define(_e, "HERO2", _S.import_value("core/actor.js", "HERO2"))
	_S.define(_e, "DUMMY_PAL", _S.import_value("core/actor.js", "DUMMY_PAL"))
	_S.define(_e, "posed", _S.import_value("core/rig.js", "posed"))
	_S.define(_e, "STAND", _S.import_value("core/rig.js", "STAND"))
	_S.define(_e, "lerpPose", _S.function_value(_e, "_f0"))
	_S.define(_e, "poseAt", _S.function_value(_e, "_f1"))
	_S.define(_e, "isHeld", _S.function_value(_e, "_f3"))
	_S.define(_e, "carry", _S.function_value(_e, "_f5"))
	_S.define(_e, "actSpan", _S.function_value(_e, "_f7"))
	_S.define(_e, "createAct", _S.function_value(_e, "_f8"))
	_S.define(_e, "actTiming", _S.function_value(_e, "_f36"))
	_S.define(_e, "actBounds", _S.function_value(_e, "_f40"))
	_exports["STAND"] = _S.read(_e, "STAND")
	_exports["posed"] = _S.read(_e, "posed")
	_S.define(_e, "lerp", _S.function_value(_e, "_f42"))
	_exports["lerpPose"] = _S.read(_e, "lerpPose")
	_S.define(_e, "eases", _S.merge([{"out": _S.function_value(_e, "_f43")}, {"in": _S.function_value(_e, "_f44")}, {"line": _S.function_value(_e, "_f45")}]))
	_exports["poseAt"] = _S.read(_e, "poseAt")
	_S.define(_e, "TW", 38)
	_S.define(_e, "TH", 52)
	_S.define(_e, "TP", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.merge([{"ink": "#0b0a1a"}, {"wood": "#724c2e"}, {"woodL": "#a0703a"}, {"woodD": "#4e331f"}, {"straw": "#d2aa55"}, {"strawL": "#f0d98a"}, {"burlapD": "#86643a"}, {"burlap": "#b38b57"}, {"burlapL": "#c9a26c"}, {"red": "#9a2f3c"}, {"redL": "#c4434f"}, {"white": "#ffffff"}])]), "map", [_S.function_value(_e, "_f46")])]))
	_S.define(_e, "DUST", _S.invoke(["#efe7dc", "#c9bfb8", "#8f8693", "#5a5468"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DUMMY", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "TW"), _S.read(_e, "TH"))]))
	_S.call_value(_S.function_value(_e, "_f47"), [])
	_S.define(_e, "SKINS", _S.merge([{"flash": [_S.prop(_S.read(_e, "TP"), "white"), 1]}, {"char": [_S.call_value(_S.read(_e, "hex"), ["#1a0c0e"]), 0.72]}, {"ice": [_S.call_value(_S.read(_e, "hex"), ["#a8e8ff"]), 0.72]}, {"shadow": [_S.call_value(_S.read(_e, "hex"), ["#3a1a70"]), 0.5]}, {"holy": [_S.call_value(_S.read(_e, "hex"), ["#fff4c0"]), 0.5]}, {"red": [_S.call_value(_S.read(_e, "hex"), ["#ff2040"]), 0.45]}, {"shock": [_S.call_value(_S.read(_e, "hex"), ["#8fd6ff"]), 0.6]}, {"poison": [_S.call_value(_S.read(_e, "hex"), ["#58c43a"]), 0.5]}]))
	_exports["SKINS"] = _S.read(_e, "SKINS")
	_S.define(_e, "STRAW", [_S.prop(_S.read(_e, "TP"), "strawL"), _S.prop(_S.read(_e, "TP"), "straw"), _S.prop(_S.read(_e, "TP"), "straw"), _S.prop(_S.read(_e, "TP"), "burlapD"), _S.prop(_S.read(_e, "TP"), "burlapD")])
	_S.define(_e, "Target", _S.class_value("Target", _S.function_value(_e, "_f51"), {"hit": _S.function_value(_e, "_f52"), "step": _S.function_value(_e, "_f53"), "draw": _S.function_value(_e, "_f55"), "drawStraw": _S.function_value(_e, "_f56")}, {}, {}, null))
	_exports["Target"] = _S.read(_e, "Target")
	_S.define(_e, "GHOST_LIFE", 0.16)
	_S.define(_e, "REST_MASK", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", 24, 38)]))
	_S.define(_e, "REST_PX", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", 24, 38)]))
	_S.invoke(_S.read(_e, "HERO2"), "forEach", [_S.function_value(_e, "_f57")])
	_S.define(_e, "NEAREST", _S.invoke(_S.construct(_S.read(_e, "Int16Array"), [_S.binary("*", 24, 38)]), "fill", [_S.unary("-", 1)]))
	_S.initialize_actor_lookup(_e)
	_S.define(_e, "lum", _S.function_value(_e, "_f59"))
	_exports["actSpan"] = _S.read(_e, "actSpan")
	_exports["createAct"] = _S.read(_e, "createAct")
	_exports["actTiming"] = _S.read(_e, "actTiming")
	_exports["actBounds"] = _S.read(_e, "actBounds")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	_S.define(_e, "out", _S.merge([_S.read(_e, "STAND"), _S.read(_e, "a")]))
	_S.define(_e, "B", _S.merge([_S.read(_e, "STAND"), _S.read(_e, "b")]))
	for _v0 in _S.array(_S.invoke(_S.read(_e, "Object"), "keys", [_S.read(_e, "B")])):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "k", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "v", _S.prop(_S.read(_v2, "B"), _S.read(_v2, "k")))
		if _S.truth(_S.logical("&&", _S.binary("===", _S.unary("typeof", _S.read(_v2, "v")), "number"), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_v2, "out"), _S.read(_v2, "k"))), "number"))):
			_S.set_prop(_S.read(_v2, "out"), _S.read(_v2, "k"), _S.call_value(_S.read(_v2, "lerp"), [_S.prop(_S.read(_v2, "out"), _S.read(_v2, "k")), _S.read(_v2, "v"), _S.read(_v2, "u")]), "=", false)
		else:
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v2, "out"), _S.read(_v2, "k")), null), func(): return _S.binary("===", _S.unary("typeof", _S.read(_v2, "v")), "number"))):
				_S.set_prop(_S.read(_v2, "out"), _S.read(_v2, "k"), _S.read(_v2, "v"), "=", false)
	for _v3 in _S.array(["hx", "hy", "lean", "crouch"]):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "k", _v3)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v4, "B"), _S.read(_v4, "k")), null), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_v4, "out"), _S.read(_v4, "k"))), "number"))):
			_S.set_prop(_S.read(_v4, "out"), _S.read(_v4, "k"), _S.call_value(_S.read(_v4, "lerp"), [_S.prop(_S.read(_v4, "out"), _S.read(_v4, "k")), 0, _S.read(_v4, "u")]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "B"), "wl"), null), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_e, "out"), "wl")), "number"))):
		_S.set_prop(_S.read(_e, "out"), "wl", _S.call_value(_S.read(_e, "lerp"), [_S.prop(_S.read(_e, "out"), "wl"), 1, _S.read(_e, "u")]), "=", false)
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_eases = _S.read(_parent,"eases")
	var _n_lerpPose = _S.read(_parent,"lerpPose")
	var _n_lerp = _S.read(_parent,"lerp")
	var _n_track_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	if _S.truth((_n_t_b1 <= _S.index_value(_S.index_value(_n_track_b0,0),0))):
		return _S.index_value(_S.index_value(_n_track_b0,0),1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < (_S.prop(_n_track_b0,"length") - 1))):
			var _tuple_0 = _S.index_value(_n_track_b0,_n_i_b2)
			var _n_t0_b3 = _S.prop(_tuple_0,0)
			var _n_a_b4 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_track_b0,(_n_i_b2 + 1))
			var _n_t1_b5 = _S.prop(_tuple_1,0)
			var _n_b_b6 = _S.prop(_tuple_1,1)
			var _n_how_b7 = _S.prop(_tuple_1,2)
			if _S.truth((_n_t_b1 >= _n_t1_b5)):
				_n_i_b2 += 1.0
				continue
			if _S.truth(_S.binary("===",_n_how_b7,"snap")):
				return _n_a_b4
			var _n_e_b8 = (_S.index_value(_n_eases,_n_how_b7) if _S.index_value(_n_eases,_n_how_b7)!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"))
			var _n_stepped_b9 = (_n_t0_b3 + (float(floori((((_n_t_b1 - _n_t0_b3) * 12) + 0.000001)))/12))
			var _n_out_b10 = _S.call_value(_n_lerpPose,[_n_a_b4, _n_b_b6, _S.call_value(_n_e_b8,[(float((_n_stepped_b9 - _n_t0_b3))/(_n_t1_b5 - _n_t0_b3))])])
			var _n_u_b11 = _S.call_value(_n_e_b8,[(float((_n_t_b1 - _n_t0_b3))/(_n_t1_b5 - _n_t0_b3))])
			_S.set_prop(_n_out_b10,"x",_S.call_value(_n_lerp,[(_S.named_value(_n_a_b4,"x") if _S.named_value(_n_a_b4,"x")!=null else 0), (_S.named_value(_n_b_b6,"x") if _S.named_value(_n_b_b6,"x")!=null else 0), _n_u_b11]),"=")
			_S.set_prop(_n_out_b10,"y",_S.call_value(_n_lerp,[(_S.named_value(_n_a_b4,"y") if _S.named_value(_n_a_b4,"y")!=null else 0), (_S.named_value(_n_b_b6,"y") if _S.named_value(_n_b_b6,"y")!=null else 0), _n_u_b11]),"=")
			return _n_out_b10
			_n_i_b2 += 1.0
	return _S.index_value(_S.index_value(_n_track_b0,(_S.prop(_n_track_b0,"length") - 1)),1)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_u_b0 * _n_u_b0) * (3 - (2 * _n_u_b0)))
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "track", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "track"), _S.binary("-", _S.prop(_S.read(_e, "track"), "length"), 1)), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "track"), 0), 0)))):
		return true
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.binary("-", _S.prop(_S.read(_v9, "track"), "length"), 1))):
		var _v10 = _S.scope(_v9)
		if _S.truth(_S.binary(">=", _S.read(_v10, "t"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 0))):
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
			continue
		_S.define(_v10, "a", _S.merge([_S.read(_v10, "STAND"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.read(_v10, "i")), 1)]))
		_S.define(_v10, "b", _S.merge([_S.read(_v10, "STAND"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 1)]))
		return _S.logical("&&", _S.binary(">", _S.binary("-", _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v10, "track"), _S.read(_v10, "i")), 0)), 0.4), func(): return _S.invoke(["fx", "fy", "bx", "by", "crouch", "lean", "x", "y"], "every", [_S.function_value(_v10, "_f4")]))
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return true

static func _f4(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_b = _S.read(_parent,"b")
	var _n_k_b0 = _S.arg(_args,0)
	return (absf(((_S.index_value(_n_a,_n_k_b0) if _S.index_value(_n_a,_n_k_b0)!=null else 0) - (_S.index_value(_n_b,_n_k_b0) if _S.index_value(_n_b,_n_k_b0)!=null else 0))) < 1.5)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_lum = _S.read(_parent,"lum")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_rest_b1 = _S.arg(_args,1)
	var _n_own_b2 = _S.arg(_args,2)
	var _n_lv_b3 = _S.call_value(_n_lum,[_n_v_b0])
	if _S.truth(((_n_lv_b3 > 0.9) if _S.truth((_n_lv_b3 > 0.9)) else (_S.binary(">>>",_n_v_b0,24) < 255))):
		return _n_v_b0
	var _n_k_b4 = maxf(0.45,minf(1.5,(float(_S.call_value(_n_lum,[_n_own_b2]))/maxf(0.08,_S.call_value(_n_lum,[_n_rest_b1])))))
	var _n_ch_b5 = _S.function_value(_S.capture(_parent,{"v":_n_v_b0,"k":_n_k_b4,"this":_this}),"_f6")
	return _S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",_S.call_value(_n_ch_b5,[16]),16)),_S.binary("<<",_S.call_value(_n_ch_b5,[8]),8)),_S.call_value(_n_ch_b5,[0]))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_v = _S.read(_parent,"v")
	var _n_k = _S.read(_parent,"k")
	var _n_n_b0 = _S.arg(_args,0)
	return minf(255,floori((_S.binary("&",_S.binary(">>>",_n_v,_n_n_b0),255) * _n_k)+0.5))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "duration"), func(): return 1))
	_S.define(_e, "k", _S.prop(_S.read(_e, "a"), "poses"))
	return _S.merge([{"from": _S.invoke(_S.read(_e, "Math"), "min", [0, _S.logical("??", _S.prop(_S.prop(_S.read(_e, "k"), 0), 0), func(): return 0)])}, {"to": (INF if _S.truth(_S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "loop")) else _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "D"), _S.logical("??", _S.prop(_S.prop(_S.read(_e, "k"), _S.binary("-", _S.prop(_S.read(_e, "k"), "length"), 1)), 0), func(): return 0)]))}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "mod"), "act"), func(): return _S.merge([])))
	_S.define(_e, "meta", _S.logical("??", _S.prop(_S.read(_e, "mod"), "meta"), func(): return _S.merge([])))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.read(_e, "meta"), "duration"), func(): return 1))
	_S.define(_e, "flip", _S.unary("!", _S.unary("!", _S.prop(_S.read(_e, "o"), "flip"))))
	_S.define(_e, "seed", _S.logical("??", _S.logical("??", _S.prop(_S.read(_e, "o"), "seed"), func(): return _S.prop(_S.prop(_S.read(_e, "meta"), "options"), "seed")), func(): return 1))
	_S.define(_e, "fx", _S.call_value(_S.read(_e, "createFx"), [_S.read(_e, "mod"), _S.read(_e, "o")]))
	_S.define(_e, "track", _S.logical("??", _S.prop(_S.read(_e, "a"), "poses"), func(): return [[0, _S.merge([_S.read(_e, "STAND")])]]))
	_S.define(_e, "span", _S.call_value(_S.read(_e, "actSpan"), [_S.read(_e, "mod")]))
	_S.define(_e, "X", _S.logical("??", _S.prop(_S.read(_e, "o"), "x"), func(): return 0))
	_S.define(_e, "Y", _S.logical("??", _S.prop(_S.read(_e, "o"), "y"), func(): return 0))
	_S.define(_e, "targets", _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else [])), "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "hits", _S.invoke(_S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "hits"), func(): return []), "map", [_S.function_value(_e, "_f10")]), "sort", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "dust", _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "dust"), func(): return []), "slice", []))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.read(_e, "seed"), 9)]))
	_S.define(_e, "specks", [])
	_S.define(_e, "ramp", _S.logical("??", _S.prop(_S.read(_e, "o"), "palette"), func(): return _S.prop(_S.prop(_S.read(_e, "meta"), "options"), "palette")))
	_S.define(_e, "ghosts", [])
	_S.define(_e, "gc", _S.call_value(_S.read(_e, "hex"), [_S.logical("??", _S.logical("??", _S.prop(_S.read(_e, "a"), "ghost"), func(): return _S.prop(_S.read(_e, "ramp"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "ramp"), "length"), 0.7)]))), func(): return "#8fb4ff")]))
	_S.define(_e, "t", _S.prop(_S.read(_e, "span"), "from"))
	_S.define(_e, "stop", 0)
	_S.define(_e, "stopped", false)
	_S.define(_e, "shakeT", 0)
	_S.define(_e, "shake0", 0)
	_S.define(_e, "amp", 0)
	_S.define(_e, "nh", 0)
	_S.define(_e, "nd", 0)
	_S.define(_e, "loopN", 0)
	_S.define(_e, "gAcc", 0)
	_S.define(_e, "last", null)
	_S.define(_e, "poseNow", _S.function_value(_e, "_f12"))
	_S.define(_e, "scratch", null)
	_S.define(_e, "scratchFor", _S.function_value(_e, "_f13"))
	_S.define(_e, "out", _S.merge([{"fx": _S.read(_e, "fx")}, {"meta": _S.read(_e, "meta")}, {"act": _S.read(_e, "a")}, {"targets": _S.read(_e, "targets")}, {"__getters": {"t": _S.function_value(_e, "_f14")}}, {"__getters": {"shake": _S.function_value(_e, "_f15")}}, {"__getters": {"frozen": _S.function_value(_e, "_f16")}}, {"__getters": {"pose": _S.function_value(_e, "_f17")}}, {"update": _S.function_value(_e, "_f18")}, {"draw": _S.function_value(_e, "_f20")}, {"stop": _S.function_value(_e, "_f34")}, {"done": _S.function_value(_e, "_f35")}]))
	_S.call_value(_S.read(_e, "poseNow"), [])
	return _S.read(_e, "out")

static func _f9(_parent,_args:Array,_this=null):
	var _n_Target = _S.read(_parent,"Target")
	var _n_seed = _S.read(_parent,"seed")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.construct(_n_Target,[(_S.named_value(_n_g_b0,"x") if _S.named_value(_n_g_b0,"x")!=null else 66), ((_n_seed + 4) + _n_i_b1)])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "h")])

static func _f11(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_p_b0,"t") - _S.named_value(_n_q_b1,"t"))
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.read(_e, "t"))
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))):
		_S.write(_e, "tt", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "poseAt"), [_S.read(_e, "track"), _S.read(_e, "tt")]))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "meta"), "loop")), func(): return _S.call_value(_S.read(_e, "isHeld"), [_S.read(_e, "track"), _S.read(_e, "tt")]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "up", _S.binary("&", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.read(_v11, "tt"), 3)]), 1))
		_S.write(_v11, "q", _S.merge([_S.read(_v11, "STAND"), _S.read(_v11, "q"), {"crouch": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "crouch"), func(): return 0), _S.read(_v11, "up"))}, {"fy": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "fy"), func(): return _S.prop(_S.read(_v11, "STAND"), "fy")), _S.read(_v11, "up"))}, {"by": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "by"), func(): return _S.prop(_S.read(_v11, "STAND"), "by")), _S.read(_v11, "up"))}]), "=", false)
	_S.write(_e, "last", _S.read(_e, "q"), "=", false)
	return _S.read(_e, "q")

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.logical("||", _S.unary("!", _S.read(_e, "scratch")), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "scratch"), "a"), "w"), _S.prop(_S.read(_e, "f"), "w"))), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "scratch"), "a"), "h"), _S.prop(_S.read(_e, "f"), "h")))):
		_S.write(_e, "scratch", _S.merge([{"a": _S.call_value(_S.read(_e, "createFrame"), [_S.prop(_S.read(_e, "f"), "w"), _S.prop(_S.read(_e, "f"), "h"), _S.prop(_S.read(_e, "f"), "ox"), _S.prop(_S.read(_e, "f"), "oy")])}, {"b": _S.call_value(_S.read(_e, "createFrame"), [_S.prop(_S.read(_e, "f"), "w"), _S.prop(_S.read(_e, "f"), "h"), _S.prop(_S.read(_e, "f"), "ox"), _S.prop(_S.read(_e, "f"), "oy")])}]), "=", false)
	return _S.read(_e, "scratch")

static func _f14(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	return _n_t
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_shakeT = _S.read(_parent,"shakeT")
	var _n_amp = _S.read(_parent,"amp")
	var _n_shake0 = _S.read(_parent,"shake0")
	if _S.truth((_n_shakeT <= 0)):
		return [0, 0]
	var _n_k_b0 = (_n_amp * (float(_n_shakeT)/_n_shake0))
	var _n_f_b1 = floori((_n_shakeT * 60))
	return [floori((sin((_n_f_b1 * 2.4)) * _n_k_b0)+0.5), floori(((cos((_n_f_b1 * 3.7)) * _n_k_b0) * 0.7)+0.5)]
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_stop = _S.read(_parent,"stop")
	return (_n_stop > 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_last = _S.read(_parent,"last")
	return _n_last
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	if _S.truth(_S.binary(">", _S.read(_e, "shakeT"), 0)):
		_S.write(_e, "shakeT", _S.read(_e, "dt"), "-=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "stop"), 0)):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "stop", _S.read(_v12, "dt"), "-=", false)
		return null
	_S.define(_e, "t0", _S.read(_e, "t"))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), 0)):
		_S.invoke(_S.read(_e, "fx"), "update", [(_S.read(_e, "t") if _S.truth(_S.binary("<", _S.read(_e, "t0"), 0)) else _S.read(_e, "dt"))])
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "n", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("/", _S.read(_v13, "t"), _S.read(_v13, "D"))]))
		if _S.truth(_S.binary("!==", _S.read(_v13, "n"), _S.read(_v13, "loopN"))):
			var _v14 = _S.scope(_v13)
			_S.write(_v14, "loopN", _S.read(_v14, "n"), "=", false)
			_S.write(_v14, "nh", 0, "=", false)
			_S.write(_v14, "nd", 0, "=", false)
	_S.define(_e, "tt", (_S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")) if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))) else _S.read(_e, "t")))
	var _v15 = _S.scope(_e)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v15, "nh"), _S.prop(_S.read(_v15, "hits"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v15, "hits"), _S.read(_v15, "nh")), "t"), _S.read(_v15, "tt")))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "h", _S.prop(_S.read(_v16, "hits"), _S.read(_v16, "nh")))
		if _S.truth(_S.prop(_S.read(_v16, "h"), "stop")):
			_S.write(_v16, "stop", _S.invoke(_S.read(_v16, "Math"), "max", [_S.read(_v16, "stop"), _S.prop(_S.read(_v16, "h"), "stop")]), "=", false)
		if _S.truth(_S.prop(_S.read(_v16, "h"), "shake")):
			var _v17 = _S.scope(_v16)
			_S.write(_v17, "shakeT", _S.write(_v17, "shake0", _S.prop(_S.read(_v17, "h"), "shake"), "=", false), "=", false)
			_S.write(_v17, "amp", _S.logical("??", _S.prop(_S.read(_v17, "h"), "amp"), func(): return 2), "=", false)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v16, "h"), "target"), false)):
			_S.invoke(_S.read(_v16, "targets"), "forEach", [_S.function_value(_v16, "_f19")])
		_S.optional_call(_S.prop(_S.read(_v16, "out"), "onHit"), [_S.read(_v16, "h")])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "nh", 1, "+=", true)
	var _v18 = _S.scope(_e)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v18, "nd"), _S.prop(_S.read(_v18, "dust"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v18, "dust"), _S.read(_v18, "nd")), "t"), _S.read(_v18, "tt")))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "d", _S.prop(_S.read(_v19, "dust"), _S.read(_v19, "nd")))
		_S.define(_v19, "n", _S.logical("??", _S.prop(_S.read(_v19, "d"), "n"), func(): return 6))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "n"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "dir", _S.logical("??", _S.prop(_S.read(_v21, "d"), "dir"), func(): return (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "R"), "next", []), 0.5)) else 1)))
			_S.invoke(_S.read(_v21, "specks"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v21, "d"), "x"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.binary("-", _S.unary("-", 1), _S.invoke(_S.read(_v21, "R"), "range", [0, 2]))}, {"vx": _S.binary("*", _S.read(_v21, "dir"), _S.invoke(_S.read(_v21, "R"), "range", [22, 90]))}, {"vy": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 34), _S.unary("-", 6)])}, {"age": 0}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.16, 0.4])}, {"big": _S.binary("<", _S.invoke(_S.read(_v21, "R"), "next", []), 0.45)}, {"c": (_S.call_value(_S.read(_v21, "hex"), [_S.prop(_S.read(_v21, "d"), "c")]) if _S.truth(_S.prop(_S.read(_v21, "d"), "c")) else 0)}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "nd", 1, "+=", true)
	for _v22 in _S.array(_S.read(_e, "specks")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "k", _v22)
		var _v24 = _S.scope(_v23)
		_S.set_prop(_S.read(_v24, "k"), "age", _S.read(_v24, "dt"), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "vx", _S.binary("-", 1, _S.binary("*", 5, _S.read(_v24, "dt"))), "*=", false)
		_S.set_prop(_S.read(_v24, "k"), "vy", _S.binary("*", 110, _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "x", _S.binary("*", _S.prop(_S.read(_v24, "k"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "y", _S.invoke(_S.read(_v24, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_v24, "k"), "y"), _S.binary("*", _S.prop(_S.read(_v24, "k"), "vy"), _S.read(_v24, "dt")))]), "=", false)
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", _S.binary("-", _S.prop(_S.read(_v25, "specks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
		if _S.truth(_S.binary(">=", _S.prop(_S.prop(_S.read(_v25, "specks"), _S.read(_v25, "i")), "age"), _S.prop(_S.prop(_S.read(_v25, "specks"), _S.read(_v25, "i")), "life"))):
			_S.invoke(_S.read(_v25, "specks"), "splice", [_S.read(_v25, "i"), 1])
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "-=", true)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "poseNow"), []))
	for _v26 in _S.array(_S.read(_e, "targets")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "g", _v26)
		_S.invoke(_S.read(_v27, "g"), "step", [_S.read(_v27, "dt")])
	_S.write(_e, "gAcc", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "q"), "ghost"), func(): return _S.binary(">=", _S.read(_e, "gAcc"), _S.binary("/", 1, 30)))):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "gAcc", 0, "=", false)
		_S.invoke(_S.read(_v28, "ghosts"), "push", [_S.merge([{"q": _S.read(_v28, "q")}, {"age": 0}])])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v28, "ghosts"), "length"), 7)):
			_S.invoke(_S.read(_v28, "ghosts"), "shift", [])
	for _v29 in _S.array(_S.read(_e, "ghosts")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "g", _v29)
		_S.set_prop(_S.read(_v30, "g"), "age", _S.read(_v30, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "ghosts"), "length"), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_e, "ghosts"), 0), "age"), _S.read(_e, "GHOST_LIFE")))):
		_S.invoke(_S.read(_e, "ghosts"), "shift", [])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_h = _S.read(_parent,"h")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.invoke(_n_g_b0,"hit",[_n_h]) if _S.truth((_S.binary("===",_S.named_value(_n_h,"at"),null) if _S.truth(_S.binary("===",_S.named_value(_n_h,"at"),null)) else _S.binary("===",_S.named_value(_n_h,"at"),_n_i_b1))) else (_S.binary("===",_S.named_value(_n_h,"at"),null) if _S.truth(_S.binary("===",_S.named_value(_n_h,"at"),null)) else _S.binary("===",_S.named_value(_n_h,"at"),_n_i_b1)))
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "frame", _S.arg(_args, 0))
	var _v31 = _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([]))
	_S.define(_e, "body", _S.coalesce(_S.prop(_v31, "body"), func(): return true))
	_S.define(_e, "showTarget", _S.coalesce(_S.prop(_v31, "target"), func(): return true))
	_S.define(_e, "W", _S.prop(_S.read(_e, "frame"), "w"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "frame"), "h"))
	_S.define(_e, "q", _S.logical("??", _S.read(_e, "last"), func(): return _S.call_value(_S.read(_e, "poseNow"), [])))
	_S.define(_e, "active", _S.binary(">=", _S.read(_e, "t"), 0))
	_S.define(_e, "tgt", (_S.read(_e, "targets") if _S.truth(_S.read(_e, "showTarget")) else []))
	_S.define(_e, "drawTargets", _S.function_value(_e, "_f21"))
	_S.define(_e, "drawStraw", _S.function_value(_e, "_f23"))
	_S.define(_e, "drawDust", _S.function_value(_e, "_f25"))
	_S.define(_e, "FX", _S.binary("-", _S.read(_e, "X"), _S.binary("|", _S.prop(_S.read(_e, "frame"), "ox"), 0)))
	_S.define(_e, "FY", _S.binary("-", _S.read(_e, "Y"), _S.binary("|", _S.prop(_S.read(_e, "frame"), "oy"), 0)))
	if _S.truth(_S.unary("!", _S.read(_e, "body"))):
		var _v37 = _S.scope(_e)
		if _S.truth(_S.read(_v37, "active")):
			_S.invoke(_S.read(_v37, "fx"), "draw", [_S.read(_v37, "frame"), "back"])
		_S.call_value(_S.read(_v37, "drawTargets"), [])
		if _S.truth(_S.read(_v37, "active")):
			_S.invoke(_S.read(_v37, "fx"), "draw", [_S.read(_v37, "frame"), "front"])
		_S.call_value(_S.read(_v37, "drawStraw"), [])
		return null
	_S.define(_e, "rx", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "q"), "x"), func(): return 0)]))
	_S.define(_e, "ry", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "q"), "y"), func(): return 0)]))
	_S.define(_e, "BX", _S.binary("+", _S.read(_e, "FX"), (_S.unary("-", _S.read(_e, "rx")) if _S.truth(_S.read(_e, "flip")) else _S.read(_e, "rx"))))
	_S.define(_e, "BY", _S.binary("+", _S.read(_e, "FY"), _S.read(_e, "ry")))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "posed"), [_S.read(_e, "q")]))
	_S.define(_e, "mirror", _S.read(_e, "flip"))
	_S.define(_e, "paint", _S.function_value(_e, "_f26"))
	_S.define(_e, "drawGhosts", _S.function_value(_e, "_f27"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f28"))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "a"), "onBody"))):
		var _v46 = _S.scope(_e)
		if _S.truth(_S.read(_v46, "active")):
			_S.invoke(_S.read(_v46, "fx"), "draw", [_S.read(_v46, "frame"), "back"])
		_S.call_value(_S.read(_v46, "drawTargets"), [])
		_S.call_value(_S.read(_v46, "shadow"), [])
		_S.call_value(_S.read(_v46, "drawGhosts"), [])
		var _v47 = _S.scope(_v46)
		_S.define(_v47, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v47, "i"), _S.prop(_S.read(_v47, "r"), "n"))):
			_S.call_value(_S.read(_v47, "paint"), [_S.read(_v47, "i"), _S.prop(_S.prop(_S.read(_v47, "r"), "color"), _S.read(_v47, "i"))])
			_v47 = _S.iteration(_v47)
			_S.write(_v47, "i", 1, "+=", true)
		if _S.truth(_S.read(_v46, "active")):
			_S.invoke(_S.read(_v46, "fx"), "draw", [_S.read(_v46, "frame"), "front"])
		_S.call_value(_S.read(_v46, "drawStraw"), [])
		_S.call_value(_S.read(_v46, "drawDust"), [])
		return null
	var _v48 = _S.call_value(_S.read(_e, "scratchFor"), [_S.read(_e, "frame")])
	_S.define(_e, "A", _S.prop(_v48, "a"))
	_S.define(_e, "B", _S.prop(_v48, "b"))
	_S.call_value(_S.read(_e, "clearFrame"), [_S.read(_e, "A")])
	_S.call_value(_S.read(_e, "clearFrame"), [_S.read(_e, "B")])
	if _S.truth(_S.read(_e, "active")):
		_S.invoke(_S.read(_e, "fx"), "draw", [_S.read(_e, "A"), "back"])
	_S.invoke(_S.prop(_S.read(_e, "B"), "color"), "set", [_S.prop(_S.read(_e, "A"), "color")])
	_S.invoke(_S.prop(_S.read(_e, "B"), "light"), "set", [_S.prop(_S.read(_e, "A"), "light")])
	_S.define(_e, "tt", ((0 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0)) else _S.binary("%", _S.read(_e, "t"), _S.read(_e, "D"))) if _S.truth(_S.prop(_S.read(_e, "meta"), "loop")) else _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "t"), 0, _S.read(_e, "D")])))
	_S.define(_e, "alpha", (_S.call_value(_S.read(_e, "actorAlphaOf"), [_S.read(_e, "mod"), _S.read(_e, "tt"), _S.prop(_S.read(_e, "fx"), "options")]) if _S.truth(_S.read(_e, "active")) else 1))
	_S.call_value(_S.read(_e, "drawActor"), [_S.invoke(_S.call_value(_S.read(_e, "painterFor"), [_S.read(_e, "B")]), "place", [_S.read(_e, "FX"), _S.read(_e, "FY"), _S.read(_e, "flip")]), _S.logical("??", _S.prop(_S.prop(_S.read(_e, "fx"), "options"), "actor"), func(): return _S.call_value(_S.read(_e, "stockActor"), [2])), _S.read(_e, "alpha")])
	if _S.truth(_S.read(_e, "active")):
		_S.invoke(_S.read(_e, "fx"), "draw", [_S.read(_e, "B"), "front"])
	_S.define(_e, "follow", _S.logical("??", _S.prop(_S.read(_e, "a"), "follow"), func(): return 1))
	_S.define(_e, "lean", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "lean"), func(): return 0), _S.read(_e, "follow")))
	_S.define(_e, "cr", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "crouch"), func(): return 0), _S.read(_e, "follow")))
	_S.define(_e, "shiftOf", _S.function_value(_e, "_f29"))
	_S.define(_e, "rest", _S.function_value(_e, "_f30"))
	_S.define(_e, "C", _S.prop(_S.read(_e, "frame"), "color"))
	_S.define(_e, "Ls", _S.prop(_S.read(_e, "frame"), "light"))
	_S.define(_e, "copy", _S.function_value(_e, "_f31"))
	_S.call_value(_S.read(_e, "drawTargets"), [])
	_S.call_value(_S.read(_e, "shadow"), [])
	var _v52 = _S.scope(_e)
	_S.define(_v52, "sy", 0)
	while _S.truth(_S.binary("<", _S.read(_v52, "sy"), _S.read(_v52, "H"))):
		var _v53 = _S.scope(_v52)
		_S.define(_v53, "sx", 0)
		while _S.truth(_S.binary("<", _S.read(_v53, "sx"), _S.read(_v53, "W"))):
			var _v54 = _S.scope(_v53)
			_S.define(_v54, "c", _S.prop(_S.prop(_S.read(_v54, "A"), "color"), _S.binary("+", _S.binary("*", _S.read(_v54, "sy"), _S.read(_v54, "W")), _S.read(_v54, "sx"))))
			if _S.truth(_S.read(_v54, "c")):
				_S.call_value(_S.read(_v54, "copy"), [_S.read(_v54, "C"), _S.read(_v54, "sx"), _S.read(_v54, "sy"), _S.read(_v54, "c")])
			_v53 = _S.iteration(_v53)
			_S.write(_v53, "sx", 1, "+=", true)
		_v52 = _S.iteration(_v52)
		_S.write(_v52, "sy", 1, "+=", true)
	_S.call_value(_S.read(_e, "drawGhosts"), [])
	_S.define(_e, "restIndex", _S.function_value(_e, "_f33"))
	var _v55 = _S.scope(_e)
	_S.define(_v55, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v55, "i"), _S.prop(_S.read(_v55, "r"), "n"))):
		var _v56 = _S.scope(_v55)
		_S.define(_v56, "s", (_S.prop(_S.read(_v56, "NEAREST"), _S.prop(_S.prop(_S.read(_v56, "r"), "src"), _S.read(_v56, "i"))) if _S.truth(_S.binary(">=", _S.prop(_S.prop(_S.read(_v56, "r"), "src"), _S.read(_v56, "i")), 0)) else _S.unary("-", 1)))
		if _S.truth(_S.binary("<", _S.read(_v56, "s"), 0)):
			var _v57 = _S.scope(_v56)
			if _S.truth(_S.binary(">", _S.read(_v57, "alpha"), 0.5)):
				_S.call_value(_S.read(_v57, "paint"), [_S.read(_v57, "i"), _S.prop(_S.prop(_S.read(_v57, "r"), "color"), _S.read(_v57, "i"))])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
			continue
		_S.define(_v56, "j", _S.call_value(_S.read(_v56, "restIndex"), [_S.read(_v56, "s")]))
		_S.define(_v56, "v", (_S.prop(_S.prop(_S.read(_v56, "B"), "color"), _S.read(_v56, "j")) if _S.truth(_S.binary(">=", _S.read(_v56, "j"), 0)) else _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s"))))
		if _S.truth(_S.unary("!", _S.read(_v56, "v"))):
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
			continue
		_S.call_value(_S.read(_v56, "paint"), [_S.read(_v56, "i"), (_S.prop(_S.prop(_S.read(_v56, "r"), "color"), _S.read(_v56, "i")) if _S.truth(_S.binary("===", _S.read(_v56, "v"), _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s")))) else _S.call_value(_S.read(_v56, "carry"), [_S.read(_v56, "v"), _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s")), _S.prop(_S.prop(_S.read(_v56, "r"), "color"), _S.read(_v56, "i"))]))])
		_v55 = _S.iteration(_v55)
		_S.write(_v55, "i", 1, "+=", true)
	var _v58 = _S.scope(_e)
	_S.define(_v58, "sy", 0)
	while _S.truth(_S.binary("<", _S.read(_v58, "sy"), _S.read(_v58, "H"))):
		var _v59 = _S.scope(_v58)
		_S.define(_v59, "sx", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "sx"), _S.read(_v59, "W"))):
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "j", _S.binary("+", _S.binary("*", _S.read(_v60, "sy"), _S.read(_v60, "W")), _S.read(_v60, "sx")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j")), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j")), _S.prop(_S.prop(_S.read(_v60, "A"), "color"), _S.read(_v60, "j")))), func(): return _S.unary("!", _S.call_value(_S.read(_v60, "rest"), [_S.read(_v60, "sx"), _S.read(_v60, "sy")])))):
				_S.call_value(_S.read(_v60, "copy"), [_S.read(_v60, "C"), _S.read(_v60, "sx"), _S.read(_v60, "sy"), _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j"))])
			if _S.truth(_S.binary("&", _S.prop(_S.prop(_S.read(_v60, "B"), "light"), _S.read(_v60, "j")), 16777215)):
				_S.call_value(_S.read(_v60, "copy"), [_S.read(_v60, "Ls"), _S.read(_v60, "sx"), _S.read(_v60, "sy"), _S.prop(_S.prop(_S.read(_v60, "B"), "light"), _S.read(_v60, "j"))])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "sx", 1, "+=", true)
		_v58 = _S.iteration(_v58)
		_S.write(_v58, "sy", 1, "+=", true)
	_S.call_value(_S.read(_e, "drawStraw"), [])
	_S.call_value(_S.read(_e, "drawDust"), [])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_tgt = _S.read(_parent,"tgt")
	var _n_this = _S.read(_parent,"this")
	return _S.invoke(_n_tgt,"forEach",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f22")])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_frame = _S.read(_parent,"frame")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_FX = _S.read(_parent,"FX")
	var _n_FY = _S.read(_parent,"FY")
	var _n_flip = _S.read(_parent,"flip")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"draw",[_S.named_value(_n_frame,"color"), _n_W, _n_H, _n_FX, _n_FY, _n_flip])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_tgt = _S.read(_parent,"tgt")
	var _n_this = _S.read(_parent,"this")
	return _S.invoke(_n_tgt,"forEach",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f24")])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_frame = _S.read(_parent,"frame")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_FX = _S.read(_parent,"FX")
	var _n_FY = _S.read(_parent,"FY")
	var _n_flip = _S.read(_parent,"flip")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"drawStraw",[_S.named_value(_n_frame,"color"), _n_W, _n_H, _n_FX, _n_FY, _n_flip])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_FY = _S.read(_parent,"FY")
	var _n_FX = _S.read(_parent,"FX")
	var _n_flip = _S.read(_parent,"flip")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_frame = _S.read(_parent,"frame")
	var _n_specks = _S.read(_parent,"specks")
	for _iter_0 in _S.array(_n_specks):
		var _n_k_b0 = _iter_0
		var _n_c_b1 = (_S.named_value(_n_k_b0,"c") if _S.truth(_S.named_value(_n_k_b0,"c")) else _S.index_value(_n_DUST,minf(3,floori(((float(_S.named_value(_n_k_b0,"age"))/_S.named_value(_n_k_b0,"life")) * 4)))))
		var _n_lx_b2 = floori(_S.named_value(_n_k_b0,"x")+0.5)
		var _n_py_b3 = (_n_FY + floori(_S.named_value(_n_k_b0,"y")+0.5))
		if true:
			var _n_i_b4 = 0
			while _S.truth((_n_i_b4 < (2 if _S.truth(_S.named_value(_n_k_b0,"big")) else 1))):
				var _n_px_b5 = ((((_n_FX - _n_lx_b2) - _n_i_b4) - 1) if _S.truth(_n_flip) else ((_n_FX + _n_lx_b2) + _n_i_b4))
				if _S.truth(((_n_py_b3 < _n_H) if _S.truth(((_n_px_b5 < _n_W) if _S.truth(((_n_py_b3 >= 0) if _S.truth((_n_px_b5 >= 0)) else (_n_px_b5 >= 0))) else ((_n_py_b3 >= 0) if _S.truth((_n_px_b5 >= 0)) else (_n_px_b5 >= 0)))) else ((_n_px_b5 < _n_W) if _S.truth(((_n_py_b3 >= 0) if _S.truth((_n_px_b5 >= 0)) else (_n_px_b5 >= 0))) else ((_n_py_b3 >= 0) if _S.truth((_n_px_b5 >= 0)) else (_n_px_b5 >= 0))))):
					_S.set_prop(_S.named_value(_n_frame,"color"),((_n_py_b3 * _n_W) + _n_px_b5),_n_c_b1,"=")
				_n_i_b4 += 1.0
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_BX = _S.read(_parent,"BX")
	var _n_r = _S.read(_parent,"r")
	var _n_mirror = _S.read(_parent,"mirror")
	var _n_BY = _S.read(_parent,"BY")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_frame = _S.read(_parent,"frame")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_color_b1 = _S.arg(_args,1)
	var _n_px_b2 = (((_n_BX - _S.index_value(_S.named_value(_n_r,"xs"),_n_i_b0)) - 1) if _S.truth(_n_mirror) else (_n_BX + _S.index_value(_S.named_value(_n_r,"xs"),_n_i_b0)))
	var _n_py_b3 = (_n_BY + _S.index_value(_S.named_value(_n_r,"ys"),_n_i_b0))
	if _S.truth(((((_n_px_b2 < 0) if _S.truth((_n_px_b2 < 0)) else (_n_py_b3 < 0)) if _S.truth(((_n_px_b2 < 0) if _S.truth((_n_px_b2 < 0)) else (_n_py_b3 < 0))) else (_n_px_b2 >= _n_W)) if _S.truth((((_n_px_b2 < 0) if _S.truth((_n_px_b2 < 0)) else (_n_py_b3 < 0)) if _S.truth(((_n_px_b2 < 0) if _S.truth((_n_px_b2 < 0)) else (_n_py_b3 < 0))) else (_n_px_b2 >= _n_W))) else (_n_py_b3 >= _n_H))):
		return null
	_S.set_prop(_S.named_value(_n_frame,"color"),((_n_py_b3 * _n_W) + _n_px_b2),_n_color_b1,"=")
	if _S.truth(_S.prop(_n_ghosts,"length")):
		_S.set_prop(_S.named_value(_n_frame,"light"),((_n_py_b3 * _n_W) + _n_px_b2),0,"=")
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_posed = _S.read(_parent,"posed")
	var _n_FX = _S.read(_parent,"FX")
	var _n_flip = _S.read(_parent,"flip")
	var _n_FY = _S.read(_parent,"FY")
	var _n_GHOST_LIFE = _S.read(_parent,"GHOST_LIFE")
	var _n_gc = _S.read(_parent,"gc")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_frame = _S.read(_parent,"frame")
	var _n_ghosts = _S.read(_parent,"ghosts")
	for _iter_0 in _S.array(_n_ghosts):
		var _n_g_b0 = _iter_0
		var _n_gr_b1 = _S.call_value(_n_posed,[_S.named_value(_n_g_b0,"q")])
		var _n_gx_b2 = (_n_FX + ((-floori((_S.named_value(_S.named_value(_n_g_b0,"q"),"x") if _S.named_value(_S.named_value(_n_g_b0,"q"),"x")!=null else 0)+0.5)) if _S.truth(_n_flip) else floori((_S.named_value(_S.named_value(_n_g_b0,"q"),"x") if _S.named_value(_S.named_value(_n_g_b0,"q"),"x")!=null else 0)+0.5)))
		var _n_gy_b3 = (_n_FY + floori((_S.named_value(_S.named_value(_n_g_b0,"q"),"y") if _S.named_value(_S.named_value(_n_g_b0,"q"),"y")!=null else 0)+0.5))
		var _n_k_b4 = (0.5 * (1 - (float(_S.named_value(_n_g_b0,"age"))/_n_GHOST_LIFE)))
		var _n_gm_b5 = _n_flip
		var _n_r0_b6 = (_S.binary("&",_n_gc,255) * _n_k_b4)
		var _n_g0_b7 = (_S.binary("&",_S.binary(">>>",_n_gc,8),255) * _n_k_b4)
		var _n_b0_b8 = (_S.binary("&",_S.binary(">>>",_n_gc,16),255) * _n_k_b4)
		if true:
			var _n_i_b9 = 0
			while _S.truth((_n_i_b9 < _S.named_value(_n_gr_b1,"n"))):
				var _n_px_b10 = (((_n_gx_b2 - _S.index_value(_S.named_value(_n_gr_b1,"xs"),_n_i_b9)) - 1) if _S.truth(_n_gm_b5) else (_n_gx_b2 + _S.index_value(_S.named_value(_n_gr_b1,"xs"),_n_i_b9)))
				var _n_py_b11 = (_n_gy_b3 + _S.index_value(_S.named_value(_n_gr_b1,"ys"),_n_i_b9))
				if _S.truth(((((_n_px_b10 < 0) if _S.truth((_n_px_b10 < 0)) else (_n_py_b11 < 0)) if _S.truth(((_n_px_b10 < 0) if _S.truth((_n_px_b10 < 0)) else (_n_py_b11 < 0))) else (_n_px_b10 >= _n_W)) if _S.truth((((_n_px_b10 < 0) if _S.truth((_n_px_b10 < 0)) else (_n_py_b11 < 0)) if _S.truth(((_n_px_b10 < 0) if _S.truth((_n_px_b10 < 0)) else (_n_py_b11 < 0))) else (_n_px_b10 >= _n_W))) else (_n_py_b11 >= _n_H))):
					_n_i_b9 += 1.0
					continue
				var _n_j_b12 = ((_n_py_b11 * _n_W) + _n_px_b10)
				var _n_d_b13 = _S.index_value(_S.named_value(_n_frame,"light"),_n_j_b12)
				_S.set_prop(_S.named_value(_n_frame,"light"),_n_j_b12,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b13,16),255) + _n_b0_b8)),16)),_S.binary("<<",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b13,8),255) + _n_g0_b7)),8)),minf(255,(_S.binary("&",_n_d_b13,255) + _n_r0_b6))),"=")
				_n_i_b9 += 1.0
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_FY = _S.read(_parent,"FY")
	var _n_FX = _S.read(_parent,"FX")
	var _n_rx = _S.read(_parent,"rx")
	var _n_flip = _S.read(_parent,"flip")
	var _n_q = _S.read(_parent,"q")
	var _n_ry = _S.read(_parent,"ry")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_frame = _S.read(_parent,"frame")
	var _n_sy_b0 = _n_FY
	var _n_cx_b1 = (_n_FX + ((-_n_rx) if _S.truth(_n_flip) else _n_rx))
	var _n_hw_b2 = ((10 + _S.binary(">>",absf((_S.named_value(_n_q,"ffx") - _S.named_value(_n_q,"fbx"))),1)) - minf(8,_S.binary(">>",absf(_n_ry),1)))
	if _S.truth(((_n_sy_b0 < 0) if _S.truth((_n_sy_b0 < 0)) else (_n_sy_b0 >= _n_H))):
		return null
	if true:
		var _n_dy_b3 = 0
		while _S.truth((_n_dy_b3 < 2)):
			if true:
				var _n_x_b4 = ((-_n_hw_b2) + (_n_dy_b3 * 2))
				while _S.truth((_n_x_b4 <= (_n_hw_b2 - (_n_dy_b3 * 2)))):
					var _n_px_b5 = (_n_cx_b1 + _n_x_b4)
					var _n_i_b6 = (((_n_sy_b0 + _n_dy_b3) * _n_W) + _n_px_b5)
					if _S.truth((((_n_px_b5 < 0) if _S.truth((_n_px_b5 < 0)) else (_n_px_b5 >= _n_W)) if _S.truth(((_n_px_b5 < 0) if _S.truth((_n_px_b5 < 0)) else (_n_px_b5 >= _n_W))) else ((_n_sy_b0 + _n_dy_b3) >= _n_H))):
						_n_x_b4 += 1.0
						continue
					_S.set_prop(_S.named_value(_n_frame,"color"),_n_i_b6,_S.binary("|",_S.binary("&",_S.index_value(_S.named_value(_n_frame,"color"),_n_i_b6),16777215),_S.binary("<<",maxf(_S.binary(">>>",_S.index_value(_S.named_value(_n_frame,"color"),_n_i_b6),24),110),24)),"=")
					_n_x_b4 += 1.0
			_n_dy_b3 += 1.0
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_lean = _S.read(_parent,"lean")
	var _n_rx = _S.read(_parent,"rx")
	var _n_cr = _S.read(_parent,"cr")
	var _n_ry = _S.read(_parent,"ry")
	var _n_ly_b0 = _S.arg(_args,0)
	var _n_k_b1 = clampf((float(((-11) - _n_ly_b0))/7),0,1)
	var _n_f_b2 = clampf((float(((-1) - _n_ly_b0))/6),0,1)
	return [floori(((_n_lean * _n_k_b1) + (_n_rx * _n_f_b2))+0.5), floori(((_n_cr * _n_k_b1) + (_n_ry * _n_f_b2))+0.5)]
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_FX = _S.read(_parent,"FX")
	var _n_flip = _S.read(_parent,"flip")
	var _n_FY = _S.read(_parent,"FY")
	var _n_REST_MASK = _S.read(_parent,"REST_MASK")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_c_b2 = ((((_n_FX - _n_sx_b0) - 1) if _S.truth(_n_flip) else (_n_sx_b0 - _n_FX)) + 12)
	var _n_r0_b3 = ((_n_sy_b1 - _n_FY) + 38)
	return (_S.binary("===",_S.index_value(_n_REST_MASK,((_n_r0_b3 * 24) + _n_c_b2)),1) if _S.truth(((_n_r0_b3 < 38) if _S.truth(((_n_c_b2 < 24) if _S.truth(((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0))) else ((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0)))) else ((_n_c_b2 < 24) if _S.truth(((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0))) else ((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0))))) else ((_n_r0_b3 < 38) if _S.truth(((_n_c_b2 < 24) if _S.truth(((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0))) else ((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0)))) else ((_n_c_b2 < 24) if _S.truth(((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0))) else ((_n_r0_b3 >= 0) if _S.truth((_n_c_b2 >= 0)) else (_n_c_b2 >= 0)))))
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_shiftOf = _S.read(_parent,"shiftOf")
	var _n_FY = _S.read(_parent,"FY")
	var _n_flip = _S.read(_parent,"flip")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_Ls = _S.read(_parent,"Ls")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_buf_b0 = _S.arg(_args,0)
	var _n_sx_b1 = _S.arg(_args,1)
	var _n_sy_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _tuple_0 = _S.call_value(_n_shiftOf,[(_n_sy_b2 - _n_FY)])
	var _n_dx_b4 = _S.prop(_tuple_0,0)
	var _n_dy_b5 = _S.prop(_tuple_0,1)
	var _n_px_b6 = (_n_sx_b1 + ((-_n_dx_b4) if _S.truth(_n_flip) else _n_dx_b4))
	var _n_py_b7 = (_n_sy_b2 + _n_dy_b5)
	if _S.truth(((((_n_px_b6 < 0) if _S.truth((_n_px_b6 < 0)) else (_n_py_b7 < 0)) if _S.truth(((_n_px_b6 < 0) if _S.truth((_n_px_b6 < 0)) else (_n_py_b7 < 0))) else (_n_px_b6 >= _n_W)) if _S.truth((((_n_px_b6 < 0) if _S.truth((_n_px_b6 < 0)) else (_n_py_b7 < 0)) if _S.truth(((_n_px_b6 < 0) if _S.truth((_n_px_b6 < 0)) else (_n_py_b7 < 0))) else (_n_px_b6 >= _n_W))) else (_n_py_b7 >= _n_H))):
		return null
	var _n_i_b8 = ((_n_py_b7 * _n_W) + _n_px_b6)
	if _S.truth(_S.binary("===",_n_buf_b0,_n_Ls)):
		var _n_d_b9 = _S.index_value(_n_Ls,_n_i_b8)
		_S.set_prop(_n_Ls,_n_i_b8,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b9,16),255) + _S.binary("&",_S.binary(">>>",_n_s_b3,16),255))),16)),_S.binary("<<",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b9,8),255) + _S.binary("&",_S.binary(">>>",_n_s_b3,8),255))),8)),minf(255,(_S.binary("&",_n_d_b9,255) + _S.binary("&",_n_s_b3,255)))),"=")
	else:
		if _S.truth((_S.binary("===",_S.binary(">>>",_n_s_b3,24),255) if _S.truth(_S.binary("===",_S.binary(">>>",_n_s_b3,24),255)) else not _S.truth(_S.index_value(_n_C,_n_i_b8)))):
			_S.set_prop(_n_C,_n_i_b8,_n_s_b3,"=")
		else:
			var _n_k_b10 = (float(_S.binary(">>>",_n_s_b3,24))/255)
			var _n_d_b11 = _S.index_value(_n_C,_n_i_b8)
			var _n_ch_b12 = _S.function_value(_S.capture(_parent,{"s":_n_s_b3,"k":_n_k_b10,"d":_n_d_b11,"this":_n_this}),"_f32")
			_S.set_prop(_n_C,_n_i_b8,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",maxf(_S.binary(">>>",_n_s_b3,24),_S.binary(">>>",_n_d_b11,24)),24),_S.binary("<<",_S.call_value(_n_ch_b12,[16]),16)),_S.binary("<<",_S.call_value(_n_ch_b12,[8]),8)),_S.call_value(_n_ch_b12,[0])),"=")
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _n_k = _S.read(_parent,"k")
	var _n_d = _S.read(_parent,"d")
	var _n_n_b0 = _S.arg(_args,0)
	return floori(((_S.binary("&",_S.binary(">>>",_n_s,_n_n_b0),255) * _n_k) + (_S.binary("&",_S.binary(">>>",_n_d,_n_n_b0),255) * (1 - _n_k)))+0.5)
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_FX = _S.read(_parent,"FX")
	var _n_flip = _S.read(_parent,"flip")
	var _n_FY = _S.read(_parent,"FY")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_c_b1 = fmod(_n_s_b0,24)
	var _n_r0_b2 = _S.binary("|",(float(_n_s_b0)/24),0)
	var _n_sx_b3 = (((_n_FX - (_n_c_b1 - 12)) - 1) if _S.truth(_n_flip) else ((_n_FX + _n_c_b1) - 12))
	var _n_sy_b4 = ((_n_FY + _n_r0_b2) - 38)
	return (((_n_sy_b4 * _n_W) + _n_sx_b3) if _S.truth(((_n_sy_b4 < _n_H) if _S.truth(((_n_sx_b3 < _n_W) if _S.truth(((_n_sy_b4 >= 0) if _S.truth((_n_sx_b3 >= 0)) else (_n_sx_b3 >= 0))) else ((_n_sy_b4 >= 0) if _S.truth((_n_sx_b3 >= 0)) else (_n_sx_b3 >= 0)))) else ((_n_sx_b3 < _n_W) if _S.truth(((_n_sy_b4 >= 0) if _S.truth((_n_sx_b3 >= 0)) else (_n_sx_b3 >= 0))) else ((_n_sy_b4 >= 0) if _S.truth((_n_sx_b3 >= 0)) else (_n_sx_b3 >= 0))))) else (-1))
	return null

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.invoke(_S.read(_e, "fx"), "stop", [])
	_S.write(_e, "stopped", true, "=", false)
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_fx = _S.read(_parent,"fx")
	var _n_stopped = _S.read(_parent,"stopped")
	var _n_t = _S.read(_parent,"t")
	var _n_span = _S.read(_parent,"span")
	var _n_stop = _S.read(_parent,"stop")
	return (_S.invoke(_n_fx,"done",[]) if _S.truth(_n_stopped) else ((_n_stop <= 0) if _S.truth((_n_t >= _S.named_value(_n_span,"to"))) else (_n_t >= _S.named_value(_n_span,"to"))))
	return null

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	if _S.truth(_S.unary("!", _S.read(_e, "a"))):
		return null
	var _v61 = _S.call_value(_S.read(_e, "actSpan"), [_S.read(_e, "mod")])
	_S.define(_e, "from", _S.prop(_v61, "from"))
	_S.define(_e, "to", _S.prop(_v61, "to"))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "duration"), func(): return 1))
	return _S.merge([{"windup": _S.unary("-", _S.read(_e, "from"))}, {"recovery": (0 if _S.truth(_S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "loop")) else _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "to"), _S.read(_e, "D"))]))}, {"onBody": _S.unary("!", _S.unary("!", _S.prop(_S.read(_e, "a"), "onBody")))}, {"targets": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else [])), "map", [_S.function_value(_e, "_f37")])}, {"hits": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "hits"), func(): return []), "map", [_S.function_value(_e, "_f38")])}, {"poses": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "poses"), func(): return []), "map", [_S.function_value(_e, "_f39")])}])

static func _f37(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_g_b0,"x") if _S.named_value(_n_g_b0,"x")!=null else 66)
	return null

static func _f38(_parent,_args:Array,_this=null):
	var _n_h_b0 = _S.arg(_args,0)
	return {"t":_S.named_value(_n_h_b0,"t"),"freeze":(_S.named_value(_n_h_b0,"stop") if _S.named_value(_n_h_b0,"stop")!=null else 0),"shake":(_S.named_value(_n_h_b0,"shake") if _S.named_value(_n_h_b0,"shake")!=null else 0),"amp":(_S.named_value(_n_h_b0,"amp") if _S.named_value(_n_h_b0,"amp")!=null else 0),"push":(0 if _S.truth(_S.binary("===",_S.named_value(_n_h_b0,"target"),false)) else (_S.named_value(_n_h_b0,"push") if _S.named_value(_n_h_b0,"push")!=null else 1.2)),"skin":_S.named_value(_n_h_b0,"skin"),"at":_S.named_value(_n_h_b0,"at")}
	return null

static func _f39(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_t_b0 = _S.prop(_tuple_0,0)
	var _n_pose_b1 = _S.prop(_tuple_0,1)
	var _n_how_b2 = _S.prop(_tuple_0,2)
	return {"t":_n_t_b0,"how":(_n_how_b2 if _n_how_b2!=null else "smooth"),"pose":_n_pose_b1}
	return null

static func _f40(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	var _v63 = _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "size")
	_S.define(_e, "w", _S.prop(_v63, 0))
	_S.define(_e, "h", _S.prop(_v63, 1))
	var _v64 = _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "origin")
	_S.define(_e, "ox", _S.prop(_v64, 0))
	_S.define(_e, "oy", _S.prop(_v64, 1))
	_S.define(_e, "x0", _S.unary("-", _S.read(_e, "ox")))
	_S.define(_e, "y0", _S.unary("-", _S.read(_e, "oy")))
	_S.define(_e, "x1", _S.binary("-", _S.read(_e, "w"), _S.read(_e, "ox")))
	_S.define(_e, "y1", _S.binary("-", _S.read(_e, "h"), _S.read(_e, "oy")))
	_S.define(_e, "see", _S.function_value(_e, "_f41"))
	_S.define(_e, "k", _S.prop(_S.read(_e, "a"), "poses"))
	if _S.truth(_S.read(_e, "k")):
		var _v65 = _S.scope(_e)
		var _v66 = _S.scope(_v65)
		_S.define(_v66, "t", _S.prop(_S.prop(_S.read(_v66, "k"), 0), 0))
		while _S.truth(_S.binary("<=", _S.read(_v66, "t"), _S.prop(_S.prop(_S.read(_v66, "k"), _S.binary("-", _S.prop(_S.read(_v66, "k"), "length"), 1)), 0))):
			_S.call_value(_S.read(_v66, "see"), [_S.call_value(_S.read(_v66, "poseAt"), [_S.read(_v66, "k"), _S.read(_v66, "t")])])
			_v66 = _S.iteration(_v66)
			_S.write(_v66, "t", _S.binary("/", 1, 12), "+=", false)
		for _v67 in _S.array(_S.read(_v65, "k")):
			var _v68 = _S.scope(_v65)
			_S.define(_v68, "key", _v67)
			_S.call_value(_S.read(_v68, "see"), [_S.prop(_S.read(_v68, "key"), 1)])
	else:
		_S.call_value(_S.read(_e, "see"), [_S.read(_e, "STAND")])
	for _v69 in _S.array(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else []))):
		var _v70 = _S.scope(_e)
		_S.define(_v70, "g", _v69)
		var _v71 = _S.scope(_v70)
		_S.define(_v71, "tx", _S.logical("??", _S.prop(_S.read(_v71, "g"), "x"), func(): return 66))
		_S.write(_v71, "x0", _S.invoke(_S.read(_v71, "Math"), "min", [_S.read(_v71, "x0"), _S.binary("-", _S.read(_v71, "tx"), 30)]), "=", false)
		_S.write(_v71, "x1", _S.invoke(_S.read(_v71, "Math"), "max", [_S.read(_v71, "x1"), _S.binary("+", _S.read(_v71, "tx"), 36)]), "=", false)
		_S.write(_v71, "y0", _S.invoke(_S.read(_v71, "Math"), "min", [_S.read(_v71, "y0"), _S.unary("-", 56)]), "=", false)
	return _S.merge([{"x0": _S.read(_e, "x0")}, {"y0": _S.read(_e, "y0")}, {"x1": _S.read(_e, "x1")}, {"y1": _S.read(_e, "y1")}])

static func _f41(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "posed"), [_S.read(_e, "p")]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "p"), "x"), func(): return 0)]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "p"), "y"), func(): return 0)]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "r"), "x0"))
	_S.define(_e, "b", _S.prop(_S.read(_e, "r"), "x1"))
	_S.write(_e, "x0", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x0"), _S.binary("-", _S.binary("+", _S.read(_e, "a"), _S.read(_e, "X")), 1)]), "=", false)
	_S.write(_e, "x1", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "x1"), _S.binary("+", _S.binary("+", _S.read(_e, "b"), _S.read(_e, "X")), 1)]), "=", false)
	_S.write(_e, "y0", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y0"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "r"), "y0"), _S.read(_e, "Y")), 1)]), "=", false)
	_S.write(_e, "y1", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "y1"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "r"), "y1"), _S.read(_e, "Y")), 1)]), "=", false)
	return null

static func _f42(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_u_b2 = _S.arg(_args,2)
	return (_n_a_b0 + ((_n_b_b1 - _n_a_b0) * _n_u_b2))
	return null

static func _f43(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 - ((1 - _n_u_b0) * (1 - _n_u_b0)))
	return null

static func _f44(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_u_b0 * _n_u_b0)
	return null

static func _f45(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return _n_u_b0
	return null

static func _f46(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [_n_k_b0, _S.call_value(_n_hex,[_n_v_b1])]
	return null

static func _f47(_parent,_args:Array,_this=null):
	var _n_TP = _S.read(_parent,"TP")
	var _n_px_b0 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f48")
	var _n_R_b1 = _S.function_value(_S.capture(_parent,{"px":_n_px_b0,"this":_this}),"_f49")
	_S.call_value(_n_R_b1,[15, 38, 8, 14, _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R_b1,[16, 34, 6, 18, _S.named_value(_n_TP,"wood")])
	_S.call_value(_n_R_b1,[16, 34, 2, 18, _S.named_value(_n_TP,"woodL")])
	_S.call_value(_n_R_b1,[20, 34, 2, 18, _S.named_value(_n_TP,"woodD")])
	_S.call_value(_n_R_b1,[1, 18, 36, 1, _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R_b1,[1, 23, 36, 1, _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R_b1,[1, 19, 36, 4, _S.named_value(_n_TP,"wood")])
	_S.call_value(_n_R_b1,[1, 19, 36, 1, _S.named_value(_n_TP,"woodL")])
	_S.call_value(_n_R_b1,[1, 22, 36, 1, _S.named_value(_n_TP,"woodD")])
	for _iter_0 in _S.array([[0, (-1)], [33, 1]]):
		var _tuple_1 = _iter_0
		var _n_bx_b3 = _S.prop(_tuple_1,0)
		var _n_s_b4 = _S.prop(_tuple_1,1)
		_S.call_value(_n_R_b1,[_n_bx_b3, 17, 5, 8, _S.named_value(_n_TP,"straw")])
		for _iter_2 in _S.array([[2, 16, _S.named_value(_n_TP,"straw")], [3, 15, _S.named_value(_n_TP,"strawL")], [1, 17, _S.named_value(_n_TP,"strawL")], [2, 25, _S.named_value(_n_TP,"straw")], [1, 26, _S.named_value(_n_TP,"strawL")], [3, 25, _S.named_value(_n_TP,"burlapD")], [2, 19, _S.named_value(_n_TP,"strawL")], [3, 21, _S.named_value(_n_TP,"strawL")], [1, 22, _S.named_value(_n_TP,"burlapD")], [2, 23, _S.named_value(_n_TP,"strawL")]]):
			var _tuple_3 = _iter_2
			var _n_dx_b5 = _S.prop(_tuple_3,0)
			var _n_dy_b6 = _S.prop(_tuple_3,1)
			var _n_c_b7 = _S.prop(_tuple_3,2)
			_S.call_value(_n_px_b0,[(_n_bx_b3 + _n_dx_b5), _n_dy_b6, _n_c_b7])
		_S.call_value(_n_px_b0,[((_n_bx_b3 - 1) if _S.truth((_n_s_b4 < 0)) else (_n_bx_b3 + 5)), 19, _S.named_value(_n_TP,"straw")])
		_S.call_value(_n_px_b0,[((_n_bx_b3 - 1) if _S.truth((_n_s_b4 < 0)) else (_n_bx_b3 + 5)), 22, _S.named_value(_n_TP,"strawL")])
	var _n_sack_b2 = _S.function_value(_S.capture(_parent,{"R":_n_R_b1,"px":_n_px_b0,"this":_this}),"_f50")
	_S.call_value(_n_sack_b2,[9, 17, 20, 24])
	if true:
		var _n_y_b8 = 19
		while _S.truth((_n_y_b8 < 36)):
			if true:
				var _n_x_b9 = 11
				while _S.truth((_n_x_b9 < 27)):
					var _n_d_b10 = _S.Bridge.hypot([(_n_x_b9 - 18.5), (_n_y_b8 - 27)])
					if _S.truth((((_n_d_b10 < 5.4) if _S.truth((_n_d_b10 > 4)) else (_n_d_b10 > 4)) if _S.truth(((_n_d_b10 < 5.4) if _S.truth((_n_d_b10 > 4)) else (_n_d_b10 > 4))) else (_n_d_b10 < 1.9))):
						_S.call_value(_n_px_b0,[_n_x_b9, _n_y_b8, (_S.named_value(_n_TP,"redL") if _S.truth(((_n_x_b9 + _n_y_b8) < 45)) else _S.named_value(_n_TP,"red"))])
					_n_x_b9 += 1.0
			_n_y_b8 += 1.0
	if true:
		var _n_x_b11 = 10
		while _S.truth((_n_x_b11 < 28)):
			_S.call_value(_n_px_b0,[_n_x_b11, 36, (_S.named_value(_n_TP,"woodL") if _S.truth(_S.binary("&",_n_x_b11,1)) else _S.named_value(_n_TP,"straw"))])
			_S.call_value(_n_px_b0,[_n_x_b11, 37, (_S.named_value(_n_TP,"woodD") if _S.truth(_S.binary("&",_n_x_b11,1)) else _S.named_value(_n_TP,"wood"))])
			_n_x_b11 += 1.0
	for _iter_4 in _S.array([[11, 41, _S.named_value(_n_TP,"straw")], [12, 42, _S.named_value(_n_TP,"strawL")], [14, 41, _S.named_value(_n_TP,"strawL")], [15, 42, _S.named_value(_n_TP,"straw")], [23, 41, _S.named_value(_n_TP,"straw")], [24, 42, _S.named_value(_n_TP,"strawL")], [26, 41, _S.named_value(_n_TP,"straw")], [13, 43, _S.named_value(_n_TP,"straw")], [25, 43, _S.named_value(_n_TP,"straw")]]):
		var _tuple_5 = _iter_4
		var _n_x_b12 = _S.prop(_tuple_5,0)
		var _n_y_b13 = _S.prop(_tuple_5,1)
		var _n_c_b14 = _S.prop(_tuple_5,2)
		_S.call_value(_n_px_b0,[_n_x_b12, _n_y_b13, _n_c_b14])
	_S.call_value(_n_sack_b2,[10, 1, 18, 16])
	for _iter_6 in _S.array([14, 23]):
		var _n_ex_b15 = _iter_6
		if true:
			var _n_d_b16 = (-2)
			while _S.truth((_n_d_b16 <= 2)):
				_S.call_value(_n_px_b0,[(_n_ex_b15 + _n_d_b16), (7 + _n_d_b16), _S.named_value(_n_TP,"ink")])
				_S.call_value(_n_px_b0,[(_n_ex_b15 - _n_d_b16), (7 + _n_d_b16), _S.named_value(_n_TP,"ink")])
				_n_d_b16 += 1.0
	if true:
		var _n_x_b17 = 14
		while _S.truth((_n_x_b17 < 24)):
			_S.call_value(_n_px_b0,[_n_x_b17, 12, (_S.named_value(_n_TP,"ink") if _S.truth(_S.binary("&",_n_x_b17,1)) else _S.named_value(_n_TP,"burlapD"))])
			_n_x_b17 += 1.0
	for _iter_7 in _S.array([15, 18, 21]):
		var _n_x_b18 = _iter_7
		_S.call_value(_n_px_b0,[_n_x_b18, 11, _S.named_value(_n_TP,"ink")])
		_S.call_value(_n_px_b0,[_n_x_b18, 13, _S.named_value(_n_TP,"ink")])
	if true:
		var _n_x_b19 = 12
		while _S.truth((_n_x_b19 < 26)):
			_S.call_value(_n_px_b0,[_n_x_b19, 16, (_S.named_value(_n_TP,"woodL") if _S.truth(_S.binary("&",_n_x_b19,1)) else _S.named_value(_n_TP,"straw"))])
			_S.call_value(_n_px_b0,[_n_x_b19, 17, (_S.named_value(_n_TP,"wood") if _S.truth(_S.binary("&",_n_x_b19,1)) else _S.named_value(_n_TP,"woodD"))])
			_n_x_b19 += 1.0
	for _iter_8 in _S.array([[13, 0, _S.named_value(_n_TP,"straw")], [15, 0, _S.named_value(_n_TP,"strawL")], [18, 0, _S.named_value(_n_TP,"straw")], [21, 0, _S.named_value(_n_TP,"strawL")], [24, 0, _S.named_value(_n_TP,"straw")], [9, 4, _S.named_value(_n_TP,"straw")], [28, 6, _S.named_value(_n_TP,"straw")], [8, 7, _S.named_value(_n_TP,"strawL")], [29, 3, _S.named_value(_n_TP,"strawL")]]):
		var _tuple_9 = _iter_8
		var _n_x_b20 = _S.prop(_tuple_9,0)
		var _n_y_b21 = _S.prop(_tuple_9,1)
		var _n_c_b22 = _S.prop(_tuple_9,2)
		_S.call_value(_n_px_b0,[_n_x_b20, _n_y_b21, _n_c_b22])
	return null

static func _f48(_parent,_args:Array,_this=null):
	var _n_TW = _S.read(_parent,"TW")
	var _n_TH = _S.read(_parent,"TH")
	var _n_DUMMY = _S.read(_parent,"DUMMY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	if _S.truth(((_n_y_b1 < _n_TH) if _S.truth(((_n_x_b0 < _n_TW) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_TW) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))):
		_S.set_prop(_n_DUMMY,((_n_y_b1 * _n_TW) + _n_x_b0),_n_c_b2,"=")
	return null

static func _f49(_parent,_args:Array,_this=null):
	var _n_px = _S.read(_parent,"px")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	if true:
		var _n_j_b5 = 0
		while _S.truth((_n_j_b5 < _n_h_b3)):
			if true:
				var _n_i_b6 = 0
				while _S.truth((_n_i_b6 < _n_w_b2)):
					_S.call_value(_n_px,[(_n_x_b0 + _n_i_b6), (_n_y_b1 + _n_j_b5), _n_c_b4])
					_n_i_b6 += 1.0
			_n_j_b5 += 1.0
	return null

static func _f50(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TP = _S.read(_parent,"TP")
	var _n_px = _S.read(_parent,"px")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	_S.call_value(_n_R,[(_n_x_b0 + 1), _n_y_b1, (_n_w_b2 - 2), 1, _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R,[(_n_x_b0 + 1), ((_n_y_b1 + _n_h_b3) - 1), (_n_w_b2 - 2), 1, _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R,[_n_x_b0, (_n_y_b1 + 1), 1, (_n_h_b3 - 2), _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R,[((_n_x_b0 + _n_w_b2) - 1), (_n_y_b1 + 1), 1, (_n_h_b3 - 2), _S.named_value(_n_TP,"ink")])
	_S.call_value(_n_R,[(_n_x_b0 + 1), (_n_y_b1 + 1), (_n_w_b2 - 2), (_n_h_b3 - 2), _S.named_value(_n_TP,"burlap")])
	_S.call_value(_n_R,[((_n_x_b0 + _n_w_b2) - 4), (_n_y_b1 + 1), 3, (_n_h_b3 - 2), _S.named_value(_n_TP,"burlapD")])
	_S.call_value(_n_R,[(_n_x_b0 + 1), ((_n_y_b1 + _n_h_b3) - 3), (_n_w_b2 - 2), 2, _S.named_value(_n_TP,"burlapD")])
	_S.call_value(_n_R,[(_n_x_b0 + 1), (_n_y_b1 + 1), 1, (_n_h_b3 - 4), _S.named_value(_n_TP,"burlapL")])
	_S.call_value(_n_R,[(_n_x_b0 + 1), (_n_y_b1 + 1), (_n_w_b2 - 6), 1, _S.named_value(_n_TP,"burlapL")])
	if true:
		var _n_j_b4 = (_n_y_b1 + 2)
		while _S.truth((_n_j_b4 < ((_n_y_b1 + _n_h_b3) - 2))):
			if true:
				var _n_i_b5 = ((_n_x_b0 + 3) + fmod(_n_j_b4,2))
				while _S.truth((_n_i_b5 < ((_n_x_b0 + _n_w_b2) - 4))):
					_S.call_value(_n_px,[_n_i_b5, _n_j_b4, _S.named_value(_n_TP,"burlapD")])
					_n_i_b5 += 4
			_n_j_b4 += 3
	return null

static func _f51(_parent,_args:Array,_this=null):
	var _n_Object = _S.read(_parent,"Object")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 5)
	_S.invoke(_n_Object,"assign",[_this, {"x":_n_x_b0,"theta":0,"omega":0,"flashT":0,"skin":null,"skinFade":0,"shiver":0,"clock":0,"R":_S.construct(_n_Rng,[_n_seed_b1]),"straw":[]}])
	return null

static func _f52(_parent,_args:Array,_this=null):
	var _object_0 = _S.coalesce(_S.arg(_args,0),func():return {})
	var _n_push_b0 = _S.coalesce(_S.named_value(_object_0,"push"),func():return 1.2)
	var _n_straw_b1 = _S.coalesce(_S.named_value(_object_0,"straw"),func():return 8)
	var _n_flash_b2 = _S.coalesce(_S.named_value(_object_0,"flash"),func():return 0.05)
	var _n_skin_b3 = _S.named_value(_object_0,"skin")
	var _n_shiver_b4 = _S.coalesce(_S.named_value(_object_0,"shiver"),func():return 0)
	var _n_y_b5 = _S.coalesce(_S.named_value(_object_0,"y"),func():return (-26))
	_S.set_prop(_this,"omega",_n_push_b0,"+=")
	_S.set_prop(_this,"flashT",maxf(_S.named_value(_this,"flashT"),_n_flash_b2),"=")
	if _S.truth(_S.binary("!==",_n_skin_b3,null)):
		_S.set_prop(_this,"skin",_n_skin_b3,"=")
	if _S.truth(_n_shiver_b4):
		_S.set_prop(_this,"shiver",_n_shiver_b4,"=")
	var _n_R_b6 = _S.named_value(_this,"R")
	if true:
		var _n_k_b7 = 0
		while _S.truth((_n_k_b7 < _n_straw_b1)):
			var _n_back_b8 = (_S.invoke(_n_R_b6,"next",[]) < 0.3)
			_S.invoke(_S.named_value(_this,"straw"),"push",[{"x":(_S.named_value(_this,"x") + _S.invoke(_n_R_b6,"range",[(-3), 3])),"y":(_n_y_b5 + _S.invoke(_n_R_b6,"range",[(-3), 3])),"vx":(_S.invoke(_n_R_b6,"range",[(-60), (-5)]) if _S.truth(_n_back_b8) else _S.invoke(_n_R_b6,"range",[10, 130])),"vy":_S.invoke(_n_R_b6,"range",[(-120), (-5)]),"age":0,"life":_S.invoke(_n_R_b6,"range",[1.2, 2.2]),"big":(_S.invoke(_n_R_b6,"next",[]) < 0.5)}])
			_n_k_b7 += 1.0
	return null

static func _f53(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"clock",_n_dt_b0,"+=")
	_S.set_prop(_this,"omega",((((-60) * _S.named_value(_this,"theta")) - (3.4 * _S.named_value(_this,"omega"))) * _n_dt_b0),"+=")
	_S.set_prop(_this,"theta",clampf((_S.named_value(_this,"theta") + (_S.named_value(_this,"omega") * _n_dt_b0)),(-0.4),0.42),"=")
	if _S.truth((_S.named_value(_this,"flashT") > 0)):
		_S.set_prop(_this,"flashT",_n_dt_b0,"-=")
	if _S.truth((_S.named_value(_this,"shiver") > 0)):
		_S.set_prop(_this,"shiver",_n_dt_b0,"-=")
	for _iter_0 in _S.array(_S.named_value(_this,"straw")):
		var _n_s_b1 = _iter_0
		_S.set_prop(_n_s_b1,"age",_n_dt_b0,"+=")
		_S.set_prop(_n_s_b1,"vy",(210 * _n_dt_b0),"+=")
		_S.set_prop(_n_s_b1,"x",(_S.named_value(_n_s_b1,"vx") * _n_dt_b0),"+=")
		_S.set_prop(_n_s_b1,"y",(_S.named_value(_n_s_b1,"vy") * _n_dt_b0),"+=")
		if _S.truth((_S.named_value(_n_s_b1,"y") >= 0)):
			_S.set_prop(_n_s_b1,"y",0,"=")
			_S.set_prop(_n_s_b1,"vx",0.2,"*=")
			_S.set_prop(_n_s_b1,"vy",0,"=")
	_S.set_prop(_this,"straw",_S.invoke(_S.named_value(_this,"straw"),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f54")]),"=")
	return null

static func _f54(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_s_b0,"age") < _S.named_value(_n_s_b0,"life"))
	return null

static func _f55(_parent,_args:Array,_this=null):
	var _n_SKINS = _S.read(_parent,"SKINS")
	var _n_TH = _S.read(_parent,"TH")
	var _n_DUMMY = _S.read(_parent,"DUMMY")
	var _n_TW = _S.read(_parent,"TW")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_X_b3 = _S.arg(_args,3)
	var _n_Y_b4 = _S.arg(_args,4)
	var _n_flip_b5 = _S.arg(_args,5)
	var _n_tan_b6 = tan(_S.named_value(_this,"theta"))
	var _n_sv_b7 = ((1 if _S.truth(_S.binary("&",floori((_S.named_value(_this,"clock") * 30)),1)) else (-1)) if _S.truth((_S.named_value(_this,"shiver") > 0)) else 0)
	var _n_name_b8 = ("flash" if _S.truth((_S.named_value(_this,"flashT") > 0)) else _S.named_value(_this,"skin"))
	var _n_sk_b9 = (_S.index_value(_n_SKINS,_n_name_b8) if _S.truth(_n_name_b8) else null)
	var _n_base_b10 = (_n_X_b3 + (((-_S.named_value(_this,"x")) - 1) if _S.truth(_n_flip_b5) else _S.named_value(_this,"x")))
	if true:
		var _n_r_b11 = 0
		while _S.truth((_n_r_b11 < _n_TH)):
			var _n_o_b12 = (floori(((((_n_TH - 1) - _n_r_b11) * _n_tan_b6) * 0.8)+0.5) + _n_sv_b7)
			if true:
				var _n_x_b13 = 0
				while _S.truth((_n_x_b13 < _n_TW)):
					var _n_c_b14 = _S.index_value(_n_DUMMY,((_n_r_b11 * _n_TW) + _n_x_b13))
					if _S.truth(not _S.truth(_n_c_b14)):
						_n_x_b13 += 1.0
						continue
					var _n_px_b15 = (_n_base_b10 + (((-((_n_x_b13 - 19) + _n_o_b12)) - 1) if _S.truth(_n_flip_b5) else ((_n_x_b13 - 19) + _n_o_b12)))
					var _n_py_b16 = ((_n_Y_b4 - _n_TH) + _n_r_b11)
					if _S.truth(((_n_py_b16 < _n_H_b2) if _S.truth(((_n_px_b15 < _n_W_b1) if _S.truth(((_n_py_b16 >= 0) if _S.truth((_n_px_b15 >= 0)) else (_n_px_b15 >= 0))) else ((_n_py_b16 >= 0) if _S.truth((_n_px_b15 >= 0)) else (_n_px_b15 >= 0)))) else ((_n_px_b15 < _n_W_b1) if _S.truth(((_n_py_b16 >= 0) if _S.truth((_n_px_b15 >= 0)) else (_n_px_b15 >= 0))) else ((_n_py_b16 >= 0) if _S.truth((_n_px_b15 >= 0)) else (_n_px_b15 >= 0))))):
						_S.set_prop(_n_C_b0,((_n_py_b16 * _n_W_b1) + _n_px_b15),(_S.ColorFX.mix(_n_c_b14,_S.index_value(_n_sk_b9,0),_S.index_value(_n_sk_b9,1)) if _S.truth(_n_sk_b9) else _n_c_b14),"=")
					_n_x_b13 += 1.0
			_n_r_b11 += 1.0
	return null

static func _f56(_parent,_args:Array,_this=null):
	var _n_STRAW = _S.read(_parent,"STRAW")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_X_b3 = _S.arg(_args,3)
	var _n_Y_b4 = _S.arg(_args,4)
	var _n_flip_b5 = _S.arg(_args,5)
	for _iter_0 in _S.array(_S.named_value(_this,"straw")):
		var _n_s_b6 = _iter_0
		var _n_c_b7 = _S.index_value(_n_STRAW,minf(4,floori(((float(_S.named_value(_n_s_b6,"age"))/_S.named_value(_n_s_b6,"life")) * 5))))
		var _n_lx_b8 = floori(_S.named_value(_n_s_b6,"x")+0.5)
		var _n_ly_b9 = (floori(_S.named_value(_n_s_b6,"y")+0.5) - 1)
		if true:
			var _n_i_b10 = 0
			while _S.truth((_n_i_b10 < (2 if _S.truth(_S.named_value(_n_s_b6,"big")) else 1))):
				var _n_px_b11 = (_n_X_b3 + (((-(_n_lx_b8 + _n_i_b10)) - 1) if _S.truth(_n_flip_b5) else (_n_lx_b8 + _n_i_b10)))
				var _n_py_b12 = (_n_Y_b4 + _n_ly_b9)
				if _S.truth(((_n_py_b12 < _n_H_b2) if _S.truth(((_n_px_b11 < _n_W_b1) if _S.truth(((_n_py_b12 >= 0) if _S.truth((_n_px_b11 >= 0)) else (_n_px_b11 >= 0))) else ((_n_py_b12 >= 0) if _S.truth((_n_px_b11 >= 0)) else (_n_px_b11 >= 0)))) else ((_n_px_b11 < _n_W_b1) if _S.truth(((_n_py_b12 >= 0) if _S.truth((_n_px_b11 >= 0)) else (_n_px_b11 >= 0))) else ((_n_py_b12 >= 0) if _S.truth((_n_px_b11 >= 0)) else (_n_px_b11 >= 0))))):
					_S.set_prop(_n_C_b0,((_n_py_b12 * _n_W_b1) + _n_px_b11),_n_c_b7,"=")
				_n_i_b10 += 1.0
	return null

static func _f57(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_row_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return _S.invoke(_S.concat([_S.array(_n_row_b0)]),"forEach",[_S.function_value(_S.capture(_parent,{"r":_n_r_b1,"this":_n_this}),"_f58")])
	return null

static func _f58(_parent,_args:Array,_this=null):
	var _n_REST_MASK = _S.read(_parent,"REST_MASK")
	var _n_r = _S.read(_parent,"r")
	var _n_REST_PX = _S.read(_parent,"REST_PX")
	var _n_DUMMY_PAL = _S.read(_parent,"DUMMY_PAL")
	var _n_hex = _S.read(_parent,"hex")
	var _n_ch_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	if _S.truth(_S.binary("!==",_n_ch_b0,".")):
		_S.set_prop(_n_REST_MASK,((_n_r * 24) + _n_c_b1),1,"=")
		_S.set_prop(_n_REST_PX,((_n_r * 24) + _n_c_b1),_S.call_value(_n_hex,[_S.index_value(_n_DUMMY_PAL,_n_ch_b0)]),"=")
	return null

static func _f59(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	return (float((((0.3 * _S.binary("&",_n_c_b0,255)) + (0.59 * _S.binary("&",_S.binary(">>>",_n_c_b0,8),255))) + (0.11 * _S.binary("&",_S.binary(">>>",_n_c_b0,16),255))))/255)
	return null
