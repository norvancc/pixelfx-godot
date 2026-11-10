@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/impact-frame.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f4":"impact_frame_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "burst", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Impact frame"}, {"desc": "An anime impact: two frames of white with black burst lines rushing at the hit, two frames inverted, then the lines pull out past the edges and vanish."}, {"tags": ["impact", "hit", "anime", "manga", "flash", "speed-lines", "screen", "one-shot"]}, {"size": [320, 180]}, {"origin": [160, 90]}, {"duration": 0.3}, {"loop": false}, {"fps": 30}, {"bg": "black"}, {"options": _S.merge([{"palette": ["#000000", "#ffffff"]}, {"lines": 64}, {"seed": 19}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FRAME", _S.binary("/", 1, 30))
	_S.define(_e, "spikes", _S.function_value(_e, "_f6"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	return _S.invoke(_n_Array,"from",[{"length":_n_n_b1}, _S.function_value(_S.capture(_parent,{"R":_n_R_b0,"n":_n_n_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_n = _S.read(_parent,"n")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_thick_b2 = _S.invoke(_n_R,"chance",[0.18])
	return {"a":((float((_n_i_b1 + _S.invoke(_n_R,"range",[0.1, 0.9])))/_n_n) * _n_TAU),"inner":(_S.invoke(_n_R,"range",[30, 48]) if _S.truth(_n_thick_b2) else _S.invoke(_n_R,"range",[18, 70])),"w":(_S.invoke(_n_R,"range",[5, 8]) if _S.truth(_n_thick_b2) else _S.invoke(_n_R,"range",[1.2, 3.6]))}
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "INK", _S.prop(_S.read(_e, "C"), 0))
	_S.define(_e, "PAPER", _S.prop(_S.read(_e, "C"), 2))
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	_S.define(_e, "x0", _S.unary("-", _S.read(_e, "OX")))
	_S.define(_e, "y0", _S.unary("-", _S.read(_e, "OY")))
	_S.define(_e, "sets", [_S.call_value(_S.read(_e, "burst"), [_S.read(_e, "R"), _S.prop(_S.read(_e, "o"), "lines")]), _S.call_value(_S.read(_e, "burst"), [_S.read(_e, "R"), _S.prop(_S.read(_e, "o"), "lines")])])
	_S.define(_e, "jit", [[_S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])]), _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])])], [_S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])]), _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])])]])
	_S.define(_e, "ph", [_S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])])
	_S.define(_e, "masks", [])
	_S.Accelerators.GeometryKernels.impact_frame_masks(_e)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FRAME = _S.read(_parent,"FRAME")
	var _n_masks = _S.read(_parent,"masks")
	var _n_PAPER = _S.read(_parent,"PAPER")
	var _n_INK = _S.read(_parent,"INK")
	var _n_x0 = _S.read(_parent,"x0")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = floori(((float(_n_t)/_n_FRAME) + 0.000001))
	if _S.truth((_n_f_b1 >= 8)):
		return null
	var _n_m_b2 = _S.index_value(_n_masks,_n_f_b1)
	var _n_inv_b3 = (_S.binary("===",_n_f_b1,2) if _S.truth(_S.binary("===",_n_f_b1,2)) else _S.binary("===",_n_f_b1,3))
	var _n_ink_b4 = (_n_PAPER if _S.truth(_n_inv_b3) else _n_INK)
	var _n_paper_b5 = (_n_INK if _S.truth(_n_inv_b3) else _n_PAPER)
	_S.invoke(_n_p_b0,"shade",[_n_x0, _n_y0, (_n_x0 + _n_W), (_n_y0 + _n_H), _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"ink":_n_ink_b4,"f":_n_f_b1,"paper":_n_paper_b5,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_m = _S.read(_parent,"m")
	var _n_ink = _S.read(_parent,"ink")
	var _n_paper = _S.read(_parent,"paper")
	var _n_f = _S.read(_parent,"f")
	var _n_PAPER = _S.read(_parent,"PAPER")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = floori((_n_x_b0 - _n_x0))
	var _n_j_b3 = floori((_n_y_b1 - _n_y0))
	if _S.truth(((((_n_i_b2 < 0) if _S.truth((_n_i_b2 < 0)) else (_n_j_b3 < 0)) if _S.truth(((_n_i_b2 < 0) if _S.truth((_n_i_b2 < 0)) else (_n_j_b3 < 0))) else (_n_i_b2 >= _n_W)) if _S.truth((((_n_i_b2 < 0) if _S.truth((_n_i_b2 < 0)) else (_n_j_b3 < 0)) if _S.truth(((_n_i_b2 < 0) if _S.truth((_n_i_b2 < 0)) else (_n_j_b3 < 0))) else (_n_i_b2 >= _n_W))) else (_n_j_b3 >= _n_H))):
		return null
	var _n_v_b4 = _S.index_value(_n_m,((_n_j_b3 * _n_W) + _n_i_b2))
	return (_n_ink if _S.truth(_S.binary("===",_n_v_b4,1)) else ((_n_paper if _S.truth((_n_f < 4)) else _n_PAPER) if _S.truth(_S.binary("===",_n_v_b4,2)) else 0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_ph_b1 = _S.arg(_args,1)
	return (((10 + (6 * absf(sin(((_n_a_b0 * 5) + _n_ph_b1))))) + (4 * absf(sin(((_n_a_b0 * 11) + (_n_ph_b1 * 2.7)))))) + (2 * sin(((_n_a_b0 * 23) + _n_ph_b1))))
	return null
