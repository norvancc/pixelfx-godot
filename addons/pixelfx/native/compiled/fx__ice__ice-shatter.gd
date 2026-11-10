@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-shatter.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "inPoly", _S.import_value("fx/ice/_lib.js", "inPoly"))
	_S.define(_e, "centroid", _S.import_value("fx/ice/_lib.js", "centroid"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "fractures", _S.import_value("fx/ice/_lib.js", "fractures"))
	_S.define(_e, "drawFractures", _S.import_value("fx/ice/_lib.js", "drawFractures"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice shatter"}, {"desc": "A block of ice takes a hit from the left: it jolts, cracks race over its faces, it flashes white and bursts into chunks that tumble, bounce and skid off in a roll of ice dust."}, {"tags": ["ice", "shatter", "break", "destroy", "impact", "directional", "one-shot"]}, {"size": [224, 112]}, {"origin": [68, 90]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.26)
	_S.define(_e, "CRACK2", 0.4)
	_S.define(_e, "SHIVER", 0.54)
	_S.define(_e, "FLASH", 0.62)
	_S.define(_e, "BURST", 0.68)
	_S.define(_e, "FRONT", [[_S.unary("-", 16), 0], [_S.unary("-", 16), _S.unary("-", 28)], [12, _S.unary("-", 28)], [12, 0]])
	_S.define(_e, "TOP", [[_S.unary("-", 16), _S.unary("-", 28)], [_S.unary("-", 8), _S.unary("-", 34)], [20, _S.unary("-", 34)], [12, _S.unary("-", 28)]])
	_S.define(_e, "SIDE", [[12, 0], [12, _S.unary("-", 28)], [20, _S.unary("-", 34)], [20, _S.unary("-", 6)]])
	_S.define(_e, "SIL", [[_S.unary("-", 16), 0], [_S.unary("-", 16), _S.unary("-", 28)], [_S.unary("-", 8), _S.unary("-", 34)], [20, _S.unary("-", 34)], [20, _S.unary("-", 6)], [12, 0]])
	_S.define(_e, "HIT_AT", [_S.unary("-", 16), _S.unary("-", 15)])
	_S.define(_e, "PLANE", [[_S.unary("-", 16), _S.unary("-", 21)], [_S.unary("-", 5), _S.unary("-", 28)], [3, _S.unary("-", 13)], [_S.unary("-", 16), _S.unary("-", 9)]])
	_S.define(_e, "SHADE", [[5, _S.unary("-", 28)], [12, _S.unary("-", 28)], [12, _S.unary("-", 10)]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "scuffs", [])
	_S.define(_e, "splinter", _S.function_value(_e, "_f2"))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onLand": _S.function_value(_e, "_f3")}, {"onSkid": _S.function_value(_e, "_f4")}, {"onCrumble": _S.function_value(_e, "_f5")}])]))
	_S.define(_e, "veins", [])
	_S.define(_e, "bubbles", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), 3)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "x", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 12), 8]))
		_S.define(_v2, "y", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 24), _S.unary("-", 6)]))
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 9)):
			var _v4 = _S.scope(_v3)
			_S.write(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.6), 0.6]), "+=", false)
			_S.write(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), 1.5), "+=", false)
			_S.write(_v4, "y", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), 1.2), "+=", false)
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v4, "x"), _S.unary("-", 14)), func(): return _S.binary(">", _S.read(_v4, "x"), 10)), func(): return _S.binary("<", _S.read(_v4, "y"), _S.unary("-", 26))), func(): return _S.binary(">", _S.read(_v4, "y"), _S.unary("-", 2)))):
				break
			_S.invoke(_S.read(_v4, "veins"), "push", [[_S.invoke(_S.read(_v4, "Math"), "floor", [_S.read(_v4, "x")]), _S.invoke(_S.read(_v4, "Math"), "floor", [_S.read(_v4, "y")])]])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "k"), 5)):
		_S.invoke(_S.read(_v5, "bubbles"), "push", [[_S.invoke(_S.read(_v5, "R"), "int", [_S.unary("-", 12), 8]), _S.invoke(_S.read(_v5, "R"), "int", [_S.unary("-", 23), _S.unary("-", 4)]), (1 if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.4])) else 0)]])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "k", 1, "+=", true)
	_S.define(_e, "inside", _S.function_value(_e, "_f6"))
	_S.define(_e, "cracks", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.read(_e, "inside"), _S.binary("+", _S.prop(_S.read(_e, "HIT_AT"), 0), 1), _S.prop(_S.read(_e, "HIT_AT"), 1), 4, _S.merge([{"len": 8}, {"a0": _S.unary("-", 0.9)}, {"spread": 1.9}])]))
	_S.define(_e, "cracks2", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.read(_e, "inside"), _S.binary("+", _S.prop(_S.read(_e, "HIT_AT"), 0), 1), _S.prop(_S.read(_e, "HIT_AT"), 1), 6, _S.merge([{"len": 18}, {"a0": _S.unary("-", 1.3)}, {"spread": 2.7}, {"fork": 0.16}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", false)
	_S.define(_e, "burst", false)
	_S.define(_e, "wave2", false)
	_S.define(_e, "white", false)
	_S.define(_e, "jolt", _S.function_value(_e, "_f7"))
	_S.define(_e, "drawBlock", _S.function_value(_e, "_f8"))
	_S.define(_e, "drawFloor", _S.function_value(_e, "_f15"))
	_S.define(_e, "explode", _S.function_value(_e, "_f16"))
	return _S.merge([{"update": _S.function_value(_e, "_f20")}, {"drawBack": _S.function_value(_e, "_f21")}, {"draw": _S.function_value(_e, "_f22")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_n_b3)):
			_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])),"y":(_n_y_b1 - 1),"vx":((_n_vx_b2 * 0.6) + _S.invoke(_n_R,"range",[(-35), 45])),"vy":(-_S.invoke(_n_R,"range",[30, 100])),"g":0.8,"drag":0.6,"bounce":0.35,"life":_S.invoke(_n_R,"range",[0.4, 0.8]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-18), 18]),"s":_S.invoke(_n_R,"range",[1.2, 2.4]),"c":_S.index_value(_n_C,_S.invoke(_n_R,"int",[4, 7]))}])
			_n_i_b4 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_v_b3 = _S.arg(_args,3)
	if _S.truth((_n_v_b3 < 100)):
		return null
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _n_x_b1, (_n_y_b2 - 1), ((_S.named_value(_n_q_b0,"vx") * 0.3) + _S.invoke(_n_R,"range",[(-15), 15])), (-_S.invoke(_n_R,"range",[2, 10])), _S.invoke(_n_R,"range",[0.4, 0.7]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.6, 2.8])])
	_S.call_value(_n_splinter,[_n_x_b1, _n_y_b2, _S.named_value(_n_q_b0,"vx"), 2])
	if _S.truth(_S.invoke(_n_R,"chance",[0.3])):
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _n_x_b1, (_n_y_b2 - 3), 0, (-5), _S.invoke(_n_R,"range",[0.2, 0.4]), _n_WHITE, _S.invoke(_n_R,"range",[0.8, 1.6])])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_scuffs = _S.read(_parent,"scuffs")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	if _S.truth(_S.invoke(_n_R,"chance",[0.5])):
		_S.invoke(_n_scuffs,"push",[{"x":floori((_n_x_b1 + _S.invoke(_n_R,"range",[(-1), 1]))+0.5),"t":0}])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_q_b0 = _S.arg(_args,0)
	_S.call_value(_n_splinter,[_S.named_value(_n_q_b0,"x"), 0, _S.named_value(_n_q_b0,"vx"), 3])
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _S.named_value(_n_q_b0,"x"), (-1), _S.invoke(_n_R,"range",[(-10), 14]), (-_S.invoke(_n_R,"range",[2, 6])), _S.invoke(_n_R,"range",[0.4, 0.7]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.2, 2])])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_SIL = _S.read(_parent,"SIL")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_inPoly,[_n_SIL, _n_x_b0, _n_y_b1])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_SHIVER = _S.read(_parent,"SHIVER")
	var _n_FLASH = _S.read(_parent,"FLASH")
	return (2 if _S.truth(((_n_t < (_n_HIT + 0.05)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))) else (1 if _S.truth(((_n_t < (_n_HIT + 0.12)) if _S.truth((_n_t >= (_n_HIT + 0.05))) else (_n_t >= (_n_HIT + 0.05)))) else ((1 if _S.truth(fmod(floori((_n_t * 40)),2)) else 0) if _S.truth(((_n_t < _n_FLASH) if _S.truth((_n_t >= _n_SHIVER)) else (_n_t >= _n_SHIVER))) else 0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_jolt = _S.read(_parent,"jolt")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_this = _S.read(_parent,"this")
	var _n_C = _S.read(_parent,"C")
	var _n_SIL = _S.read(_parent,"SIL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_FRONT = _S.read(_parent,"FRONT")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_SIDE = _S.read(_parent,"SIDE")
	var _n_veins = _S.read(_parent,"veins")
	var _n_bubbles = _S.read(_parent,"bubbles")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_drawFractures = _S.read(_parent,"drawFractures")
	var _n_CRACK2 = _S.read(_parent,"CRACK2")
	var _n_cracks2 = _S.read(_parent,"cracks2")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t >= _n_BURST)):
		return null
	var _n_jx_b1 = _S.call_value(_n_jolt,[])
	var _n_wh_b2 = (_n_t >= _n_FLASH)
	var _n_sweep_b3 = ((-40) + (70 * _S.MathFX.seg(_n_t,0.04,0.3)))
	var _n_sh_b4 = _S.function_value(_S.capture(_parent,{"jx":_n_jx_b1,"this":_n_this}),"_f9")
	_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_sh_b4,[[[(-17), 1], [(-17), (-28.5)], [(-8.3), (-35.2)], [21, (-35.2)], [21, (-5.6)], [12.5, 1]]]), _S.index_value(_n_C,0)])
	if _S.truth(_n_wh_b2):
		_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_sh_b4,[_n_SIL]), _n_WHITE])
		return null
	_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_sh_b4,[_n_FRONT]), _S.function_value(_S.capture(_parent,{"jx":_n_jx_b1,"sweep":_n_sweep_b3,"this":_n_this}),"_f11")])
	_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_sh_b4,[_n_TOP]), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f12")])
	_S.invoke(_n_p_b0,"poly",[_S.call_value(_n_sh_b4,[_n_SIDE]), _S.function_value(_S.capture(_parent,{"jx":_n_jx_b1,"this":_n_this}),"_f13")])
	for _iter_0 in _S.array(_n_veins):
		var _tuple_1 = _iter_0
		var _n_x_b6 = _S.prop(_tuple_1,0)
		var _n_y_b7 = _S.prop(_tuple_1,1)
		_S.invoke(_n_p_b0,"px",[(_n_x_b6 + _n_jx_b1), _n_y_b7, _S.index_value(_n_C,5)])
	for _iter_2 in _S.array(_n_bubbles):
		var _tuple_3 = _iter_2
		var _n_x_b8 = _S.prop(_tuple_3,0)
		var _n_y_b9 = _S.prop(_tuple_3,1)
		var _n_big_b10 = _S.prop(_tuple_3,2)
		_S.invoke(_n_p_b0,"px",[(_n_x_b8 + _n_jx_b1), _n_y_b9, _S.index_value(_n_C,6)])
		if _S.truth(_n_big_b10):
			_S.invoke(_n_p_b0,"px",[((_n_x_b8 + _n_jx_b1) + 1), _n_y_b9, _S.index_value(_n_C,5)])
			_S.invoke(_n_p_b0,"px",[(_n_x_b8 + _n_jx_b1), (_n_y_b9 + 1), _S.index_value(_n_C,5)])
	var _n_E_b5 = _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"jx":_n_jx_b1,"this":_n_this}),"_f14")
	_S.call_value(_n_E_b5,[[(-16), (-28)], [12, (-28)], _n_WHITE])
	_S.call_value(_n_E_b5,[[(-16), (-28)], [(-8), (-34)], _S.index_value(_n_C,6)])
	_S.call_value(_n_E_b5,[[(-8), (-34)], [20, (-34)], _S.index_value(_n_C,5)])
	_S.call_value(_n_E_b5,[[12, (-28)], [20, (-34)], _S.index_value(_n_C,7)])
	_S.call_value(_n_E_b5,[[(-16), (-1)], [(-16), (-28)], _S.index_value(_n_C,5)])
	_S.call_value(_n_E_b5,[[12, (-1)], [12, (-28)], _S.index_value(_n_C,6)])
	_S.call_value(_n_E_b5,[[20, (-6)], [20, (-34)], _S.index_value(_n_C,3)])
	_S.call_value(_n_E_b5,[[13, (-1)], [20, (-6)], _S.index_value(_n_C,1)])
	if _S.truth((_n_t >= _n_HIT)):
		_S.call_value(_n_drawFractures,[_n_p_b0, _n_cracks, ((_n_t - _n_HIT) * 170), _n_C, {"ox":_n_jx_b1}])
	if _S.truth((_n_t >= _n_CRACK2)):
		_S.call_value(_n_drawFractures,[_n_p_b0, _n_cracks2, ((_n_t - _n_CRACK2) * 200), _n_C, {"ox":_n_jx_b1}])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_pts_b0 = _S.arg(_args,0)
	return _S.invoke(_n_pts_b0,"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_jx = _S.read(_parent,"jx")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 + _n_jx), _n_y_b1]
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_jx = _S.read(_parent,"jx")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_PLANE = _S.read(_parent,"PLANE")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_SHADE = _S.read(_parent,"SHADE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_lx_b2 = (_n_x_b0 - _n_jx)
	var _n_d_b3 = (_n_lx_b2 + (_n_y_b1 * 0.8))
	if _S.truth(_S.logical("&&",(absf((_n_d_b3 - _n_sweep)) < 1.3),func():return (_n_y_b1 < (-6)))):
		return _n_WHITE
	if _S.truth((_S.logical("||",(absf((_n_d_b3 + 21)) < 1.1),func():return (absf((_n_d_b3 + 16.5)) < 0.6)) if _S.truth((_n_y_b1 < (-9))) else (_n_y_b1 < (-9)))):
		return _S.index_value(_n_C,6)
	if _S.truth(_S.logical("&&",_S.logical("||",_S.logical("&&",(absf((_n_lx_b2 + 7.5)) < 0.5),func():return (_n_y_b1 < (-6))),func():return _S.logical("&&",(absf((_n_y_b1 + 5.5)) < 0.5),func():return (_n_lx_b2 > (-8)))),func():return _S.binary("===",fmod((floori(_n_lx_b2) + floori(_n_y_b1)),2),0))):
		return _S.index_value(_n_C,5)
	if _S.truth(_S.call_value(_n_inPoly,[_n_PLANE, _n_lx_b2, _n_y_b1])):
		return (_S.index_value(_n_C,6) if _S.truth((_n_y_b1 < (-25.5))) else _S.index_value(_n_C,5))
	if _S.truth(_S.call_value(_n_inPoly,[_n_SHADE, _n_lx_b2, _n_y_b1])):
		return _S.index_value(_n_C,3)
	return (_S.index_value(_n_C,5) if _S.truth((_n_y_b1 < (-25.5))) else (_S.index_value(_n_C,4) if _S.truth((_n_y_b1 < (-8))) else (_S.index_value(_n_C,3) if _S.truth((_n_y_b1 < (-2.5))) else _S.index_value(_n_C,2))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,7) if _S.truth((_n_y_b1 > (-29.5))) else (_S.index_value(_n_C,5) if _S.truth((_n_y_b1 < (-32.5))) else (_S.index_value(_n_C,7) if _S.truth((_S.MathFX.rand([floori(_n_x_b0),floori(_n_y_b1),3]) < 0.08)) else _S.index_value(_n_C,6))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_jx = _S.read(_parent,"jx")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_lx_b2 = (_n_x_b0 - _n_jx)
	return (_S.index_value(_n_C,3) if _S.truth((_n_lx_b2 < 13.5)) else (_S.index_value(_n_C,3) if _S.truth(_S.logical("&&",(absf((_n_lx_b2 - 16.5)) < 0.6),func():return (_n_y_b1 < (-8)))) else (_S.index_value(_n_C,1) if _S.truth((_n_y_b1 > (((_n_lx_b2 - 12) * (-0.75)) - 3))) else _S.index_value(_n_C,2))))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_jx = _S.read(_parent,"jx")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	return _S.invoke(_n_p,"line",[(_S.index_value(_n_a_b0,0) + _n_jx), _S.index_value(_n_a_b0,1), (_S.index_value(_n_b_b1,0) + _n_jx), _S.index_value(_n_b_b1,1), _n_c_b2])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_scuffs = _S.read(_parent,"scuffs")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_out_b1 = (1 - _S.MathFX.smooth((_n_BURST + 0.6),(_n_BURST + 1.5),_n_t))
	if _S.truth((_n_out_b1 > 0)):
		if true:
			var _n_x_b2 = (-22)
			while _S.truth((_n_x_b2 <= 26)):
				var _n_d_b3 = (float(absf((_n_x_b2 - 2)))/24)
				var _n_h_b4 = _S.MathFX.rand([_n_x_b2,41])
				var _n_a_b5 = (_n_out_b1 * clampf((float((1.1 - _n_d_b3))/0.25),0.0,1.0))
				if _S.truth((_n_a_b5 <= 0)):
					_n_x_b2 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[_n_x_b2, 0, (_n_WHITE if _S.truth((_n_h_b4 < 0.35)) else _S.index_value(_n_C,6)), _n_a_b5])
				if _S.truth((((_n_x_b2 < (-16)) if _S.truth((_n_x_b2 < (-16))) else (_n_x_b2 > 20)) if _S.truth((_n_h_b4 < 0.4)) else (_n_h_b4 < 0.4))):
					_S.invoke(_n_p_b0,"dot",[_n_x_b2, (-1), _S.index_value(_n_C,5), _n_a_b5])
				if true:
					var _n_j_b6 = 1
					while _S.truth((_n_j_b6 <= (1 + floori(((_S.MathFX.rand([_n_x_b2,7]) * 3) * (1 - _n_d_b3))+0.5)))):
						_S.invoke(_n_p_b0,"dot",[_n_x_b2, _n_j_b6, (_S.index_value(_n_C,5) if _S.truth((_n_j_b6 < 2)) else _S.index_value(_n_C,4)), (_n_a_b5 * (1 - (float(_n_j_b6)/5)))])
						_n_j_b6 += 1.0
				_n_x_b2 += 1.0
	for _iter_0 in _S.array(_n_scuffs):
		var _n_s_b7 = _iter_0
		var _n_a_b8 = (1 - (float(_S.named_value(_n_s_b7,"t"))/0.9))
		if _S.truth((_n_a_b8 > 0)):
			_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b7,"x"), 0, (_n_WHITE if _S.truth((_S.named_value(_n_s_b7,"t") < 0.15)) else _S.index_value(_n_C,6)), _n_a_b8])
			_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b7,"x"), 1, _S.index_value(_n_C,4), (_n_a_b8 * 0.6)])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "chop", _S.function_value(_e, "_f17"))
	for _v21 in _S.array([[_S.read(_e, "FRONT"), 0.6, 46], [_S.read(_e, "TOP"), 1, 40], [_S.read(_e, "SIDE"), 0.3, 46]]):
		var _v22 = _S.scope(_e)
		var _v23 = _v21
		_S.define(_v22, "face", _S.prop(_v23, 0))
		_S.define(_v22, "tone", _S.prop(_v23, 1))
		_S.define(_v22, "max", _S.prop(_v23, 2))
		for _v24 in _S.array(_S.call_value(_S.read(_v22, "chop"), [_S.read(_v22, "face"), _S.read(_v22, "max"), 0])):
			var _v25 = _S.scope(_v22)
			_S.define(_v25, "part", _v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "m", _S.call_value(_S.read(_v26, "centroid"), [_S.read(_v26, "part")]))
			_S.define(_v26, "dx", _S.binary("-", _S.prop(_S.read(_v26, "m"), "x"), _S.prop(_S.read(_v26, "HIT_AT"), 0)))
			_S.define(_v26, "dy", _S.binary("-", _S.prop(_S.read(_v26, "m"), "y"), _S.prop(_S.read(_v26, "HIT_AT"), 1)))
			_S.define(_v26, "d", _S.logical("||", _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.read(_v26, "dx"), _S.read(_v26, "dy")]), func(): return 1))
			_S.define(_v26, "sp", _S.binary("*", _S.invoke(_S.read(_v26, "R"), "range", [50, 150]), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v26, "d"), 40))))))
			_S.invoke(_S.read(_v26, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v26, "part"), "map", [_S.function_value(_v26, "_f19")])}, {"x": _S.prop(_S.read(_v26, "m"), "x")}, {"y": _S.prop(_S.read(_v26, "m"), "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v26, "dx"), _S.read(_v26, "d")), _S.read(_v26, "sp")), 0.9), _S.invoke(_S.read(_v26, "R"), "range", [40, 110]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v26, "dy"), _S.read(_v26, "d")), _S.read(_v26, "sp")), 0.4), _S.invoke(_S.read(_v26, "R"), "range", [60, 200]))}, {"a": 0}, {"va": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 10), 10])}, {"f": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.9), 0.9])}, {"vf": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 7), 7])}, {"tone": _S.read(_v26, "tone")}, {"lit": _S.read(_v26, "tone")}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.38}, {"solid": true}, {"brittle": 3}, {"crumble": _S.invoke(_S.read(_v26, "R"), "range", [0.25, 0.6])}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [1.5, 1.9])}])])
	var _v28 = _S.scope(_e)
	_S.define(_v28, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v28, "i"), 46)):
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "x", _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 15), 19]))
		_S.define(_v29, "y", _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [1, 33])))
		_S.define(_v29, "dx", _S.binary("-", _S.read(_v29, "x"), _S.prop(_S.read(_v29, "HIT_AT"), 0)))
		_S.define(_v29, "dy", _S.binary("-", _S.read(_v29, "y"), _S.prop(_S.read(_v29, "HIT_AT"), 1)))
		_S.define(_v29, "d", _S.logical("||", _S.invoke(_S.read(_v29, "Math"), "hypot", [_S.read(_v29, "dx"), _S.read(_v29, "dy")]), func(): return 1))
		_S.define(_v29, "sp", _S.invoke(_S.read(_v29, "R"), "range", [60, 200]))
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v29, "inside"), [_S.read(_v29, "x"), _S.read(_v29, "y")]))):
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v29, "bits"), "add", [_S.merge([{"kind": (_S.prop(_S.read(_v29, "B"), "CHUNK") if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.15])) else _S.prop(_S.read(_v29, "B"), "SHARD"))}, {"x": _S.read(_v29, "x")}, {"y": _S.read(_v29, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v29, "dx"), _S.read(_v29, "d")), _S.read(_v29, "sp")), 0.8), _S.invoke(_S.read(_v29, "R"), "range", [20, 90]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v29, "dy"), _S.read(_v29, "d")), _S.read(_v29, "sp")), 0.4), _S.invoke(_S.read(_v29, "R"), "range", [60, 240]))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.4])}, {"a": _S.invoke(_S.read(_v29, "R"), "range", [0, _S.read(_v29, "TAU")])}, {"va": _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v29, "R"), "range", [1.2, 3.4])}, {"c": _S.prop(_S.read(_v29, "C"), _S.invoke(_S.read(_v29, "R"), "int", [4, 7]))}, {"ramp": [_S.prop(_S.read(_v29, "C"), 1), _S.prop(_S.read(_v29, "C"), 3), _S.prop(_S.read(_v29, "C"), 4), _S.prop(_S.read(_v29, "C"), 6), _S.prop(_S.read(_v29, "C"), 7)]}])])
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "i", 1, "+=", true)
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v30, "i"), 9)):
		_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "VAPOUR"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 6), 18]), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [1, 6])), _S.invoke(_S.read(_v30, "R"), "range", [10, 130]), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 12])), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v30, "C"), 6), _S.invoke(_S.read(_v30, "R"), "range", [2.2, 3.8])])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "+=", true)
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v31, "i"), 5)):
		_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "DUST"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 16]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [1, 4])), _S.invoke(_S.read(_v31, "R"), "range", [30, 110]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [2, 8])), _S.invoke(_S.read(_v31, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v31, "C"), 5), _S.invoke(_S.read(_v31, "R"), "range", [1.6, 2.8])])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "+=", true)
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), 4)):
		_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "VAPOUR"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 8), 18]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [8, 28])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 10), 50]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [8, 24])), _S.invoke(_S.read(_v32, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v32, "C"), 6), _S.invoke(_S.read(_v32, "R"), "range", [2.6, 4])])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "i"), 16)):
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "a", _S.invoke(_S.read(_v34, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v34, "Math"), "PI")), 0.9), _S.unary("-", 0.1)]))
		_S.define(_v34, "sp", _S.invoke(_S.read(_v34, "R"), "range", [40, 140]))
		_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "FLAKE"), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 8), 16]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [6, 28])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), 20), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.invoke(_S.read(_v34, "R"), "range", [1, 1.6]), (_S.read(_v34, "WHITE") if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.6])) else _S.prop(_S.read(_v34, "C"), 6)), _S.invoke(_S.read(_v34, "R"), "range", [0.5, 1.6])])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "+=", true)
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v35, "i"), 7)):
		_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "STAR"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 14), 40]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 40])), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 8), 16]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 16])), _S.invoke(_S.read(_v35, "R"), "range", [0.4, 0.8]), (_S.read(_v35, "WHITE") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.5])) else _S.prop(_S.read(_v35, "C"), 6)), _S.invoke(_S.read(_v35, "R"), "range", [1, 2.4])])
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [2, _S.unary("-", 17), 64, _S.read(_e, "WHITE"), 0.85, 0.14])
	_S.invoke(_S.read(_e, "lights"), "add", [16, _S.unary("-", 18), 86, _S.prop(_S.read(_e, "C"), 4), 0.5, 0.55])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_centroid = _S.read(_parent,"centroid")
	var _n_R = _S.read(_parent,"R")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_this = _S.read(_parent,"this")
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_max_b1 = _S.arg(_args,1)
	var _n_depth_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.call_value(_n_centroid,[_n_pts_b0])
	return ([_n_pts_b0] if _S.truth(((_S.named_value(_n_c_b3,"area") < _n_max_b1) if _S.truth((_S.named_value(_n_c_b3,"area") < _n_max_b1)) else (_n_depth_b2 > 4))) else _S.invoke(_S.call_value(_n_splitPoly,[_n_pts_b0, (_S.named_value(_n_c_b3,"x") + _S.invoke(_n_R,"range",[(-1), 1])), (_S.named_value(_n_c_b3,"y") + _S.invoke(_n_R,"range",[(-1), 1])), _S.invoke(_n_R,"range",[0, PI])]),"flatMap",[_S.function_value(_S.capture(_parent,{"max":_n_max_b1,"depth":_n_depth_b2,"this":_n_this}),"_f18")]))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_chop = _S.read(_parent,"chop")
	var _n_max = _S.read(_parent,"max")
	var _n_depth = _S.read(_parent,"depth")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_chop,[_n_q_b0, _n_max, (_n_depth + 1)])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 - _S.named_value(_n_m,"x")), (_n_y_b1 - _S.named_value(_n_m,"y"))]
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v36 = _S.scope(_e)
		_S.write(_v36, "struck", true, "=", false)
		_S.invoke(_S.read(_v36, "lights"), "add", [_S.prop(_S.read(_v36, "HIT_AT"), 0), _S.prop(_S.read(_v36, "HIT_AT"), 1), 24, _S.read(_v36, "WHITE"), 0.6, 0.08])
		_S.invoke(_S.read(_v36, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v36, "HIT_AT"), 0), 6), _S.prop(_S.read(_v36, "HIT_AT"), 1), 40, _S.prop(_S.read(_v36, "C"), 5), 0.4, 0.3])
		var _v37 = _S.scope(_v36)
		_S.define(_v37, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "i"), 12)):
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "a", _S.binary("+", _S.prop(_S.read(_v38, "Math"), "PI"), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v38, "sp", _S.invoke(_S.read(_v38, "R"), "range", [50, 120]))
			_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "SPARK"), _S.binary("-", _S.prop(_S.read(_v38, "HIT_AT"), 0), 1), _S.prop(_S.read(_v38, "HIT_AT"), 1), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "a")]), _S.read(_v38, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "a")]), _S.read(_v38, "sp")), 40), _S.invoke(_S.read(_v38, "R"), "range", [0.15, 0.4])])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "i", 1, "+=", true)
		var _v39 = _S.scope(_v36)
		_S.define(_v39, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v39, "i"), 6)):
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "a", _S.binary("+", _S.prop(_S.read(_v40, "Math"), "PI"), _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 1), 0.8])))
			_S.define(_v40, "sp", _S.invoke(_S.read(_v40, "R"), "range", [40, 100]))
			_S.invoke(_S.read(_v40, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v40, "B"), "SHARD")}, {"x": _S.binary("-", _S.prop(_S.read(_v40, "HIT_AT"), 0), 1)}, {"y": _S.binary("+", _S.prop(_S.read(_v40, "HIT_AT"), 1), _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 2), 2]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a")]), _S.read(_v40, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a")]), _S.read(_v40, "sp")), 60)}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v40, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v40, "R"), "range", [0, _S.read(_v40, "TAU")])}, {"va": _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v40, "R"), "range", [1.2, 2.4])}, {"c": _S.prop(_S.read(_v40, "C"), _S.invoke(_S.read(_v40, "R"), "int", [5, 7]))}])])
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "wave2")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK2")))):
		var _v41 = _S.scope(_e)
		_S.write(_v41, "wave2", true, "=", false)
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 16), 36, _S.prop(_S.read(_v41, "C"), 6), 0.35, 0.15])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), 3)):
			_S.invoke(_S.read(_v42, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v42, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 14), 18])}, {"y": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [4, 30]))}, {"vx": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 30), 30])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [10, 50]))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v42, "R"), "range", [0.4, 0.7])}, {"a": _S.invoke(_S.read(_v42, "R"), "range", [0, _S.read(_v42, "TAU")])}, {"va": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v42, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v42, "C"), _S.invoke(_S.read(_v42, "R"), "int", [5, 7]))}])])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v43 = _S.scope(_e)
		_S.write(_v43, "white", true, "=", false)
		_S.invoke(_S.read(_v43, "lights"), "add", [2, _S.unary("-", 17), 44, _S.read(_v43, "WHITE"), 0.7, 0.08])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURST")))):
		var _v44 = _S.scope(_e)
		_S.write(_v44, "burst", true, "=", false)
		_S.call_value(_S.read(_v44, "explode"), [])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), 1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08])), func(): return _S.prop(_S.prop(_S.read(_e, "bits"), "list"), "length"))):
		var _v45 = _S.scope(_e)
		_S.define(_v45, "b", _S.invoke(_S.read(_v45, "R"), "pick", [_S.prop(_S.read(_v45, "bits"), "list")]))
		_S.invoke(_S.read(_v45, "ps"), "spawn", [_S.prop(_S.read(_v45, "P"), "STAR"), _S.prop(_S.read(_v45, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v45, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v45, "R"), "range", [0.2, 0.4]), (_S.read(_v45, "WHITE") if _S.truth(_S.invoke(_S.read(_v45, "R"), "chance", [0.5])) else _S.prop(_S.read(_v45, "C"), 6)), _S.invoke(_S.read(_v45, "R"), "range", [0.6, 1.5])])
	var _v46 = _S.scope(_e)
	_S.define(_v46, "i", _S.binary("-", _S.prop(_S.read(_v46, "scuffs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v46, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v46, "scuffs"), _S.read(_v46, "i")), "t", _S.read(_v46, "dt"), "+=", false), 0.9)):
			_S.invoke(_S.read(_v46, "scuffs"), "splice", [_S.read(_v46, "i"), 1])
		_v46 = _S.iteration(_v46)
		_S.write(_v46, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_drawFloor = _S.read(_parent,"drawFloor")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawFloor,[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_drawBlock = _S.read(_parent,"drawBlock")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_HIT_AT = _S.read(_parent,"HIT_AT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_flare = _S.read(_parent,"flare")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_panes = _S.read(_parent,"panes")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawBlock,[_n_p_b0])
	var _n_h_b1 = (_n_t - _n_HIT)
	if _S.truth(((_n_h_b1 < 0.2) if _S.truth((_n_h_b1 >= 0)) else (_n_h_b1 >= 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, (_S.index_value(_n_HIT_AT,0) - 1), _S.index_value(_n_HIT_AT,1), ((9 * _S.invoke(_n_ease,"outBack",[minf(1,(float(_n_h_b1)/0.04))])) * (1 - (float(_n_h_b1)/0.2))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.7])
		if _S.truth((_n_h_b1 < 0.08)):
			_S.call_value(_n_flare,[_n_p_b0, (_S.index_value(_n_HIT_AT,0) - 1), _S.index_value(_n_HIT_AT,1), (14 * (1 - (float(_n_h_b1)/0.08))), (1 - (float(_n_h_b1)/0.08)), _n_C])
	var _n_k_b2 = (1 - _S.MathFX.smooth(_n_BURST,(_n_BURST + 0.4),_n_t))
	var _n_crk_b3 = _S.MathFX.smooth(_n_HIT,_n_FLASH,_n_t)
	if _S.truth((_n_k_b2 > 0)):
		_S.invoke(_n_p_b0,"glow",[2, (-17), 34, _S.index_value(_n_C,4), ((0.16 + (0.22 * _n_crk_b3)) * _n_k_b2)])
		_S.invoke(_n_p_b0,"glow",[2, (-2), 30, _S.index_value(_n_C,4), (0.14 * _n_k_b2)])
	if _S.truth(((_n_t < (_n_BURST + 0.12)) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))):
		_S.call_value(_n_flare,[_n_p_b0, 2, (-17), (26 * (1 - clampf((float((_n_t - _n_FLASH))/0.18),0.0,1.0))), (1 - clampf((float((_n_t - _n_FLASH))/0.18),0.0,1.0)), _n_C])
	_S.invoke(_n_panes,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
