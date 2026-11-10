@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/smoke-bomb.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "lobe", _S.import_value("fx/explosions/_lib.js", "lobe"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "OUTLINE", _S.import_value("fx/explosions/_lib.js", "OUTLINE"))
	_S.define(_e, "step", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawCanister", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Smoke bomb"}, {"desc": "A round canister clinks down, fuse sparking, and pops: thick grey-violet smoke gushes out, rolls along the floor, billows into a cloud that hides all, then thins to wisps."}, {"tags": ["smoke", "smoke-bomb", "ninja", "vanish", "escape", "ground", "one-shot"]}, {"size": [260, 176]}, {"origin": [130, 156]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e0b14", "#1e1828", "#30283e", "#463c58", "#62567a", "#867a9e", "#aea4c4"]}, {"canister": ["#16121e", "#2a2434", "#443c52", "#686078", "#9c94ac"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.95)
	_S.define(_e, "R0", 4)
	_S.define(_e, "BAND", [_S.call_value(_S.read(_e, "hex"), ["#3a1418"]), _S.call_value(_S.read(_e, "hex"), ["#7a2a24"]), _S.call_value(_S.read(_e, "hex"), ["#b84a34"])])
	_S.define(_e, "GRIT", [_S.call_value(_S.read(_e, "hex"), ["#5a4f6b"]), _S.call_value(_S.read(_e, "hex"), ["#3e3650"]), _S.call_value(_S.read(_e, "hex"), ["#776c88"])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	_S.define(_e, "hit", _S.arg(_args, 2))
	if _S.truth(_S.prop(_S.read(_e, "c"), "rest")):
		return null
	_S.set_prop(_S.read(_e, "c"), "vy", _S.binary("*", 900, _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "c"), "x", _S.binary("*", _S.prop(_S.read(_e, "c"), "vx"), _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "c"), "y", _S.binary("*", _S.prop(_S.read(_e, "c"), "vy"), _S.read(_e, "dt")), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_e, "c"), "y"), _S.unary("-", _S.read(_e, "R0"))), func(): return _S.binary(">", _S.prop(_S.read(_e, "c"), "vy"), 0))):
		var _v0 = _S.scope(_e)
		_S.set_prop(_S.read(_v0, "c"), "y", _S.unary("-", _S.read(_v0, "R0")), "=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v0, "c"), "vy"), 80)):
			var _v1 = _S.scope(_v0)
			_S.optional_call(_S.read(_v1, "hit"), [_S.prop(_S.read(_v1, "c"), "x"), _S.prop(_S.read(_v1, "c"), "vy")])
			_S.set_prop(_S.read(_v1, "c"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v1, "c"), "vy")), 0.38), "=", false)
			_S.set_prop(_S.read(_v1, "c"), "vx", 0.78, "*=", false)
		else:
			_S.set_prop(_S.read(_v0, "c"), "vy", 0, "=", false)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "c"), "vy"), 0), func(): return _S.binary(">=", _S.prop(_S.read(_e, "c"), "y"), _S.binary("-", _S.unary("-", _S.read(_e, "R0")), 0.01)))):
		var _v2 = _S.scope(_e)
		_S.set_prop(_S.read(_v2, "c"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "c"), "vx"), 3), _S.read(_v2, "dt")), "-=", false)
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.prop(_S.read(_v2, "c"), "vx")]), 2)):
			_S.last([_S.set_prop(_S.read(_v2, "c"), "vx", 0, "=", false), _S.set_prop(_S.read(_v2, "c"), "rest", true, "=", false)])
	_S.set_prop(_S.read(_e, "c"), "a", _S.binary("*", (_S.binary("/", _S.prop(_S.read(_e, "c"), "vx"), _S.read(_e, "R0")) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "c"), "vy"), 0)) else _S.prop(_S.read(_e, "c"), "va")), _S.read(_e, "dt")), "+=", false)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "clouds", _S.function_value(_e, "_f2"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "canister"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "SM", [_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1)])
	var _v8 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v8, 0))
	_S.define(_e, "H", _S.prop(_v8, 1))
	var _v9 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v9, 0))
	_S.define(_e, "OY", _S.prop(_v9, 1))
	_S.define(_e, "X0", _S.binary("+", _S.unary("-", _S.read(_e, "OX")), 3))
	_S.define(_e, "X1", _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 3))
	_S.define(_e, "Y0", _S.binary("+", _S.unary("-", _S.read(_e, "OY")), 3))
	_S.define(_e, "Y1", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 3))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "start", _S.merge([{"x": _S.unary("-", 70)}, {"y": _S.unary("-", 60)}, {"vx": 125}, {"vy": _S.unary("-", 80)}, {"va": 7}, {"a": 0}, {"rest": false}]))
	_S.define(_e, "sim", _S.merge([_S.read(_e, "start")]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v10, "i"), 2400), func(): return _S.unary("!", _S.prop(_S.read(_v10, "sim"), "rest")))):
		_S.call_value(_S.read(_v10, "step"), [_S.read(_v10, "sim"), _S.binary("/", 1, 240)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "can", _S.merge([_S.read(_e, "start"), {"x": _S.binary("-", _S.prop(_S.read(_e, "start"), "x"), _S.prop(_S.read(_e, "sim"), "x"))}]))
	_S.define(_e, "N", 52)
	_S.define(_e, "lobes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f7")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "fuseTip", _S.function_value(_e, "_f8"))
	_S.define(_e, "radius", _S.function_value(_e, "_f9"))
	_S.define(_e, "thin", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f14")}])

static func _f2(_parent,_args:Array,_this=null):
	var _n_lobes = _S.read(_parent,"lobes")
	var _n_radius = _S.read(_parent,"radius")
	var _n_thin = _S.read(_parent,"thin")
	var _n_OY = _S.read(_parent,"OY")
	var _n_SM = _S.read(_parent,"SM")
	var _n_lobe = _S.read(_parent,"lobe")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_on_b2 = _S.invoke(_n_lobes,"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f3")])
	if _S.truth(not _S.truth(_S.prop(_n_on_b2,"length"))):
		return null
	var _n_top_b3 = 0
	for _iter_0 in _S.array(_n_on_b2):
		var _n_b_b4 = _iter_0
		_n_top_b3 = minf(_n_top_b3,(-(_S.named_value(_n_b_b4,"h") + (_S.call_value(_n_radius,[_n_b_b4]) * 1.92))))
	for _iter_1 in _S.array(_S.invoke(_S.invoke(_n_on_b2,"filter",[_S.function_value(_S.capture(_parent,{"back":_n_back_b1,"this":_this}),"_f4")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])):
		var _n_b_b5 = _iter_1
		var _n_r_b6 = _S.call_value(_n_radius,[_n_b_b5])
		var _n_y_b7 = ((-(_S.named_value(_n_b_b5,"h") + (_n_r_b6 * 0.92))) + (_S.named_value(_n_b_b5,"d") * 2.5))
		var _n_k_b8 = _S.call_value(_n_thin,[_n_b_b5])
		var _n_a_b9 = (((minf(1,(float(_S.named_value(_n_b_b5,"age"))/0.05)) * pow((1 - _n_k_b8),1.4)) * 0.97) * (1 - _S.MathFX.smooth(((-_n_OY) + 34),((-_n_OY) + 6),(_n_y_b7 - _n_r_b6))))
		if _S.truth((_n_a_b9 <= 0.01)):
			continue
		var _n_shade_b10 = (1 if _S.truth(((float((_n_y_b7 - _n_top_b3))/maxf(20,(-_n_top_b3))) > 0.55)) else 0)
		_S.call_value(_n_lobe,[_n_p_b0, _S.named_value(_n_b_b5,"x"), _n_y_b7, _n_r_b6, _n_SM, _n_SM, 0, 0, _n_a_b9, _S.named_value(_n_b_b5,"d"), minf(2,(_n_shade_b10 + (1 if _S.truth((_n_k_b8 > 0.6)) else 0))), 1])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	return _S.named_value(_n_b_b0,"on")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_b_b0 = _S.arg(_args,0)
	return _S.binary("===",(_S.named_value(_n_b_b0,"d") < (-0.35)),_n_back)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"d") - _S.named_value(_n_b_b1,"d"))
	return null

static func _f6(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_POP = _S.read(_parent,"POP")
	var _n_N = _S.read(_parent,"N")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_kind_b2 = _S.index_value([0, 0, 1, 1, 2, 3],fmod(_n_i_b1,6))
	var _n_side_b3 = _S.invoke(_n_R,"sign",[])
	var _n_ang_b4 = (((-_S.invoke(_n_R,"range",[0, 0.25])) if _S.truth((_n_side_b3 > 0)) else (PI + _S.invoke(_n_R,"range",[0, 0.25]))) if _S.truth((_S.binary("===",_n_kind_b2,0) if _S.truth(_S.binary("===",_n_kind_b2,0)) else _S.binary("===",_n_kind_b2,3))) else ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-0.6), 0.6])))
	var _n_sp_b5 = _S.index_value([_S.invoke(_n_R,"range",[70, 170]), _S.invoke(_n_R,"range",[0, 25]), _S.invoke(_n_R,"range",[45, 95]), _S.invoke(_n_R,"range",[20, 60])],_n_kind_b2)
	var _n_r1_b6 = _S.index_value([_S.invoke(_n_R,"range",[12, 17]), _S.invoke(_n_R,"range",[16, 22]), _S.invoke(_n_R,"range",[13, 18]), _S.invoke(_n_R,"range",[14, 19])],_n_kind_b2)
	var _n_t0_b7 = ((_n_POP + _S.invoke(_n_R,"range",[0.45, 1.5])) if _S.truth(_S.binary("===",_n_kind_b2,3)) else ((_n_POP + (0.6 * pow((float(_n_i_b1)/(_n_N - 1)),1.6))) + _S.invoke(_n_R,"range",[0, 0.03])))
	return {"kind":_n_kind_b2,"t0":_n_t0_b7,"vx":(cos(_n_ang_b4) * _n_sp_b5),"vh":((-sin(_n_ang_b4)) * _n_sp_b5),"d":_S.invoke(_n_R,"range",[(-1), 1]),"r0":_S.invoke(_n_R,"range",[5, 8]),"r1":_n_r1_b6,"f":_S.invoke(_n_R,"range",[(-0.45), 0.4]),"wob":_S.invoke(_n_R,"range",[0, _n_TAU]),"on":false,"x":0,"h":0,"age":0}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_can = _S.read(_parent,"can")
	var _n_R0 = _S.read(_parent,"R0")
	return [(_S.named_value(_n_can,"x") + (sin(_S.named_value(_n_can,"a")) * (_n_R0 + 2.5))), (_S.named_value(_n_can,"y") - (cos(_S.named_value(_n_can,"a")) * (_n_R0 + 2.5)))]
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_thin = _S.read(_parent,"thin")
	var _n_b_b0 = _S.arg(_args,0)
	return (((_S.named_value(_n_b_b0,"r0") + ((_S.named_value(_n_b_b0,"r1") - _S.named_value(_n_b_b0,"r0")) * (1 - exp((float((-_S.named_value(_n_b_b0,"age")))/0.28))))) * (1 + (0.05 * sin(((_n_t * 3) + _S.named_value(_n_b_b0,"wob")))))) * (1 + (0.35 * _S.call_value(_n_thin,[_n_b_b0]))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_b_b0 = _S.arg(_args,0)
	return _S.MathFX.smooth((2.5 + _S.named_value(_n_b_b0,"f")),(3.9 + (_S.named_value(_n_b_b0,"f") * 0.6)),_n_t)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.call_value(_S.read(_e, "step"), [_S.read(_e, "can"), _S.read(_e, "dt"), _S.function_value(_e, "_f12")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v13 = _S.scope(_e)
		var _v14 = _S.call_value(_S.read(_v13, "fuseTip"), [])
		_S.define(_v13, "fx", _S.prop(_v14, 0))
		_S.define(_v13, "fy", _S.prop(_v14, 1))
		_S.define(_v13, "hurry", _S.call_value(_S.read(_v13, "smooth"), [_S.binary("-", _S.read(_v13, "POP"), 0.4), _S.read(_v13, "POP"), _S.read(_v13, "t")]))
		if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [_S.binary("*", _S.binary("+", 26, _S.binary("*", 50, _S.read(_v13, "hurry"))), _S.read(_v13, "dt"))])):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.read(_v13, "fx"), _S.read(_v13, "fy"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [30, 100])), _S.invoke(_S.read(_v13, "R"), "range", [0.08, 0.18])])
		if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [_S.binary("*", 8, _S.read(_v13, "dt"))])):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "VAPOUR"), _S.read(_v13, "fx"), _S.binary("-", _S.read(_v13, "fy"), 1), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [10, 18])), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v13, "C"), 5), _S.invoke(_S.read(_v13, "R"), "range", [1, 1.8])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "popped"))):
			var _v15 = _S.scope(_e)
			_S.write(_v15, "popped", true, "=", false)
			_S.invoke(_S.read(_v15, "lights"), "add", [_S.prop(_S.read(_v15, "can"), "x"), _S.unary("-", 9), 64, _S.prop(_S.read(_v15, "C"), 6), 0.75, 0.22])
			_S.invoke(_S.read(_v15, "lights"), "add", [_S.prop(_S.read(_v15, "can"), "x"), _S.unary("-", 5), 22, _S.read(_v15, "WHITE"), 0.7, 0.06])
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v16, "i"), 30)):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "a", _S.invoke(_S.read(_v17, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 0.35), 0.35]))
				_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [120, 300]))
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.prop(_S.read(_v17, "can"), "x"), _S.unary("-", 5), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 40), _S.invoke(_S.read(_v17, "R"), "range", [0.15, 0.4])])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "i", 1, "+=", true)
			var _v18 = _S.scope(_v15)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), 26)):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "u", _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1]))
				_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.binary("*", _S.read(_v19, "u"), 0.9)))
				_S.define(_v19, "sp", _S.binary("*", _S.invoke(_S.read(_v19, "R"), "range", [80, 220]), _S.binary("-", 1, _S.binary("*", 0.35, _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "u")])))))
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v19, "can"), "x"), _S.binary("*", _S.read(_v19, "u"), 4)), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.9, 1.6]), _S.invoke(_S.read(_v19, "R"), "pick", [_S.read(_v19, "GRIT")]), (2 if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.35])) else 1)])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
			_S.invoke(_S.read(_v15, "Object"), "assign", [_S.read(_v15, "can"), _S.merge([{"vy": _S.unary("-", 95)}, {"vx": _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 25), 25])}, {"va": _S.binary("*", _S.invoke(_S.read(_v15, "R"), "sign", []), 9)}, {"rest": false}])])
	_S.define(_e, "wind", _S.binary("*", 6, _S.call_value(_S.read(_e, "smooth"), [1.8, 3.2, _S.read(_e, "t")])))
	for _v20 in _S.array(_S.read(_e, "lobes")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "b", _v20)
		var _v22 = _S.scope(_v21)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v22, "b"), "on"))):
			var _v23 = _S.scope(_v22)
			if _S.truth(_S.binary("<", _S.read(_v23, "t"), _S.prop(_S.read(_v23, "b"), "t0"))):
				continue
			_S.last([_S.set_prop(_S.read(_v23, "b"), "on", true, "=", false), _S.set_prop(_S.read(_v23, "b"), "x", _S.binary("+", _S.prop(_S.read(_v23, "can"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 2), 2])), "=", false), _S.set_prop(_S.read(_v23, "b"), "h", 1, "=", false)])
		_S.set_prop(_S.read(_v22, "b"), "age", _S.read(_v22, "dt"), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "b"), "vx"), 2.4), _S.read(_v22, "dt")), "-=", false)
		_S.set_prop(_S.read(_v22, "b"), "vh", _S.binary("*", _S.prop([_S.binary("*", 14, _S.call_value(_S.read(_v22, "smooth"), [0.7, 1.6, _S.prop(_S.read(_v22, "b"), "age")])), _S.binary("+", 3, _S.binary("*", 9, _S.call_value(_S.read(_v22, "smooth"), [0.8, 1.8, _S.prop(_S.read(_v22, "b"), "age")]))), _S.binary("+", 6, _S.binary("*", 12, _S.call_value(_S.read(_v22, "smooth"), [0.3, 1.4, _S.prop(_S.read(_v22, "b"), "age")]))), _S.binary("*", 10, _S.call_value(_S.read(_v22, "smooth"), [0.8, 1.6, _S.prop(_S.read(_v22, "b"), "age")]))], _S.prop(_S.read(_v22, "b"), "kind")), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "vh", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "b"), "vh"), 1.6), _S.read(_v22, "dt")), "-=", false)
		_S.set_prop(_S.read(_v22, "b"), "x", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v22, "b"), "vx"), _S.read(_v22, "wind")), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "h", _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("+", _S.prop(_S.read(_v22, "b"), "h"), _S.binary("*", _S.prop(_S.read(_v22, "b"), "vh"), _S.read(_v22, "dt")))]), "=", false)
		_S.define(_v22, "k", _S.call_value(_S.read(_v22, "thin"), [_S.read(_v22, "b")]))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v22, "k"), 0.12), func(): return _S.binary("<", _S.read(_v22, "k"), 0.85)), func(): return _S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", 1.8, _S.read(_v22, "dt"))]))):
			var _v24 = _S.scope(_v22)
			_S.define(_v24, "r", _S.call_value(_S.read(_v24, "radius"), [_S.read(_v24, "b")]))
			_S.define(_v24, "life", _S.invoke(_S.read(_v24, "Math"), "min", [_S.invoke(_S.read(_v24, "R"), "range", [1, 1.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v24, "meta"), "duration"), 0.15), _S.read(_v24, "t"))]))
			if _S.truth(_S.binary(">", _S.read(_v24, "life"), 0.3)):
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "VAPOUR"), _S.binary("+", _S.prop(_S.read(_v24, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", _S.read(_v24, "r")), _S.read(_v24, "r")]), 0.5)), _S.unary("-", _S.binary("+", _S.prop(_S.read(_v24, "b"), "h"), _S.binary("*", _S.read(_v24, "r"), 1.4))), _S.binary("+", _S.read(_v24, "wind"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 6), 10])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [8, 20])), _S.read(_v24, "life"), _S.prop(_S.read(_v24, "C"), 4), _S.binary("*", _S.read(_v24, "r"), _S.invoke(_S.read(_v24, "R"), "range", [0.3, 0.45]))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.5)), func(): return _S.binary("<", _S.read(_e, "t"), 4.1)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 4, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "can"), "x"), _S.binary("-", _S.prop(_S.read(_e, "can"), "y"), 3), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [8, 16])), _S.invoke(_S.read(_e, "R"), "range", [0.6, 0.9]), _S.prop(_S.read(_e, "C"), 4), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 20, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_GRIT = _S.read(_parent,"GRIT")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_sp_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < 3)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _n_x_b0, (-1), _S.invoke(_n_R,"range",[(-70), 70]), (-_S.invoke(_n_R,"range",[40, 110])), _S.invoke(_n_R,"range",[0.06, 0.14])])
			_n_i_b2 += 1.0
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 3)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"DUST"), (_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])), (-0.5), (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[10, 40])), (-_S.invoke(_n_R,"range",[4, 14])), _S.invoke(_n_R,"range",[0.3, 0.55]), _S.index_value(_n_GRIT,2), _S.invoke(_n_R,"range",[1.4, 2.4])])
			_n_i_b3 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_clouds = _S.read(_parent,"clouds")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.call_value(_n_clouds,[_n_p_b0, true])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_drawCanister = _S.read(_parent,"drawCanister")
	var _n_K = _S.read(_parent,"K")
	var _n_can = _S.read(_parent,"can")
	var _n_POP = _S.read(_parent,"POP")
	var _n_fuseTip = _S.read(_parent,"fuseTip")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_o = _S.read(_parent,"o")
	var _n_hex = _S.read(_parent,"hex")
	var _n_clouds = _S.read(_parent,"clouds")
	var _n_ps = _S.read(_parent,"ps")
	var _n_C = _S.read(_parent,"C")
	var _n_flare = _S.read(_parent,"flare")
	var _n_pool = _S.read(_parent,"pool")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = (1 - _S.MathFX.smooth(4.3,4.8,_n_t))
	if _S.truth((_n_fade_b1 > 0)):
		_S.call_value(_n_drawCanister,[_n_p_b0, _n_K, _n_can, (_n_t < _n_POP), _n_fade_b1])
	if _S.truth((_n_t < _n_POP)):
		var _tuple_0 = _S.call_value(_n_fuseTip,[])
		var _n_fx_b3 = _S.prop(_tuple_0,0)
		var _n_fy_b4 = _S.prop(_tuple_0,1)
		_S.invoke(_n_p_b0,"px",[_n_fx_b3, _n_fy_b4, (_n_WHITE if _S.truth((sin((_n_t * 50)) > 0)) else _S.call_value(_n_hex,[_S.index_value(_S.named_value(_n_o,"sparks"),1)]))])
		_S.invoke(_n_p_b0,"glow",[_n_fx_b3, _n_fy_b4, 6, _S.call_value(_n_hex,[_S.index_value(_S.named_value(_n_o,"sparks"),2)]), (0.45 + (0.2 * sin((_n_t * 37))))])
	_S.call_value(_n_clouds,[_n_p_b0, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	var _n_u_b2 = (_n_t - _n_POP)
	if _S.truth(((_n_u_b2 < 0.067) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0))):
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_can,"x"), (-5), 6.5, _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_can,"x"), (-5), 4.5, _n_WHITE])
	if _S.truth(((_n_u_b2 < 0.16) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0))):
		_S.call_value(_n_flare,[_n_p_b0, _S.named_value(_n_can,"x"), (-5), (22 * (1 - (float(_n_u_b2)/0.16))), (1 - (float(_n_u_b2)/0.16)), [_S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)]])
	if _S.truth(((_n_u_b2 < 0.35) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0))):
		_S.call_value(_n_pool,[_n_p_b0, _S.named_value(_n_can,"x"), 1, 50, 8, _S.index_value(_n_C,6), (0.5 * (1 - (float(_n_u_b2)/0.35)))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_hex = _S.read(_parent,"hex")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_K_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_live_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_ca_b5 = cos(_S.named_value(_n_c_b2,"a"))
	var _n_sa_b6 = sin(_S.named_value(_n_c_b2,"a"))
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_c_b2,"x") - _n_R0) - 2), ((_S.named_value(_n_c_b2,"y") - _n_R0) - 2), ((_S.named_value(_n_c_b2,"x") + _n_R0) + 2), ((_S.named_value(_n_c_b2,"y") + _n_R0) + 2), _S.function_value(_S.capture(_parent,{"c":_n_c_b2,"a":_n_a_b4,"sa":_n_sa_b6,"ca":_n_ca_b5,"K":_n_K_b1,"this":_this}),"_f16")])
	var _n_cx_b7 = (_S.named_value(_n_c_b2,"x") + (_n_sa_b6 * _n_R0))
	var _n_cy_b8 = (_S.named_value(_n_c_b2,"y") - (_n_ca_b5 * _n_R0))
	if _S.truth(_n_live_b3):
		_S.invoke(_n_p_b0,"line",[_n_cx_b7, _n_cy_b8, (_n_cx_b7 + (_n_sa_b6 * 2.5)), (_n_cy_b8 - (_n_ca_b5 * 2.5)), _S.call_value(_n_hex,["#8a6a48"]), _n_a_b4])
	else:
		_S.invoke(_n_p_b0,"dot",[_n_cx_b7, _n_cy_b8, _S.index_value(_n_K_b1,0), _n_a_b4])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_c = _S.read(_parent,"c")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_a = _S.read(_parent,"a")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_sa = _S.read(_parent,"sa")
	var _n_ca = _S.read(_parent,"ca")
	var _n_BAND = _S.read(_parent,"BAND")
	var _n_K = _S.read(_parent,"K")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _S.named_value(_n_c,"x"))
	var _n_dy_b4 = (_n_py_b1 - _S.named_value(_n_c,"y"))
	var _n_d_b5 = _S.Bridge.hypot([_n_dx_b3, _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_R0 + 1))):
		return null
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	if _S.truth((_n_d_b5 > _n_R0)):
		return _n_OUTLINE
	var _n_v_b6 = (((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca))
	var _n_lit_b7 = (float((-((_n_dx_b3 * 0.6) + (_n_dy_b4 * 0.8))))/_n_R0)
	if _S.truth((absf(_n_v_b6) < 0.9)):
		return _S.index_value(_n_BAND,(2 if _S.truth((_n_lit_b7 > 0.3)) else (1 if _S.truth((_n_lit_b7 > (-0.4))) else 0)))
	if _S.truth(((_n_lit_b7 > 0.45) if _S.truth((_n_d_b5 < (_n_R0 * 0.5))) else (_n_d_b5 < (_n_R0 * 0.5)))):
		return _S.index_value(_n_K,4)
	return _S.index_value(_n_K,(3 if _S.truth((_n_lit_b7 > 0.5)) else (2 if _S.truth((_n_lit_b7 > 0)) else (1 if _S.truth((_n_lit_b7 > (-0.5))) else 0))))
	return null
