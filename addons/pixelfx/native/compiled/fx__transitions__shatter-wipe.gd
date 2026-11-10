@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/shatter-wipe.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "fillConvex", _S.import_value("fx/transitions/_lib.js", "fillConvex"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "paneY", _S.function_value(_e, "_f0"))
	_S.define(_e, "pattern", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f21"))
	_S.define(_e, "drawShard", _S.function_value(_e, "_f28"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Shatter wipe"}, {"desc": "A dark glass pane drops over the screen and bounces; cracks race out from an impact with a flash, then it bursts into tumbling glass shards with lit edges that fall away."}, {"tags": ["shatter", "glass", "break", "shards", "wipe"]}, {"duration": 2.8}, {"options": _S.merge([{"palette": ["#0c1430", "#162c5c", "#1f4f94", "#2f7fcc", "#58b4ec", "#9bdcff", "#d8f4ff", "#ffffff"]}, {"seed": 2}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LAND", 0.55)
	_S.define(_e, "GP", _S.binary("/", _S.binary("*", 2, _S.read(_e, "H")), _S.binary("*", _S.read(_e, "LAND"), _S.read(_e, "LAND"))))
	_S.define(_e, "REST", 0.3)
	_S.define(_e, "CRACK", 1.32)
	_S.define(_e, "BREAK", 1.62)
	_S.define(_e, "WAVE", 520)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_S.define(_e, "L3", [_S.unary("-", 0.42), _S.unary("-", 0.56), 0.71])
	_S.define(_e, "BOUNCES", _S.call_value(_S.function_value(_e, "_f30"), []))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_LAND = _S.read(_parent,"LAND")
	var _n_H = _S.read(_parent,"H")
	var _n_GP = _S.read(_parent,"GP")
	var _n_BOUNCES = _S.read(_parent,"BOUNCES")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _n_LAND)):
		return ((-_n_H) + (((0.5 * _n_GP) * _n_t_b0) * _n_t_b0))
	for _iter_0 in _S.array(_n_BOUNCES):
		var _n_b_b1 = _iter_0
		if _S.truth((_n_t_b0 < (_S.named_value(_n_b_b1,"t0") + _S.named_value(_n_b_b1,"T")))):
			return (-((_S.named_value(_n_b_b1,"v") * (_n_t_b0 - _S.named_value(_n_b_b1,"t0"))) - ((0.5 * _n_GP) * pow((_n_t_b0 - _S.named_value(_n_b_b1,"t0")),2))))
	return 0
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "Ix", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.6])))
	_S.define(_e, "Iy", _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "R"), "range", [0.36, 0.54])))
	_S.define(_e, "NR", 13)
	_S.define(_e, "RING", [0, 9, 21, 37, 58, 86, 122, 168, 232])
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NR")}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "speed", _S.invoke(_S.read(_e, "ang"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "V", _S.invoke(_S.read(_e, "ang"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "jag", _S.function_value(_e, "_f6"))
	_S.define(_e, "rad", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "ring", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "keep", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "reach", _S.function_value(_e, "_f13"))
	_S.define(_e, "trace", _S.function_value(_e, "_f14"))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "NR"))):
		for _v11 in _S.array(_S.prop(_S.read(_v10, "rad"), _S.read(_v10, "i"))):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "e", _v11)
			_S.call_value(_S.read(_v12, "trace"), [_S.read(_v12, "e"), _S.function_value(_v12, "_f15")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.read(_v13, "NR"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v14, "j"), _S.binary("-", _S.prop(_S.read(_v14, "RING"), "length"), 1))):
			var _v15 = _S.scope(_v14)
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v15, "keep"), _S.read(_v15, "i")), _S.read(_v15, "j")))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
				continue
			_S.define(_v15, "i2", _S.binary("%", _S.binary("+", _S.read(_v15, "i"), 1), _S.read(_v15, "NR")))
			_S.define(_v15, "e", _S.prop(_S.prop(_S.read(_v15, "ring"), _S.read(_v15, "i")), _S.read(_v15, "j")))
			_S.define(_v15, "start", _S.binary("+", _S.invoke(_S.read(_v15, "Math"), "max", [_S.call_value(_S.read(_v15, "reach"), _S.concat([[_S.read(_v15, "i")], _S.array(_S.prop(_S.prop(_S.read(_v15, "V"), _S.read(_v15, "i")), _S.read(_v15, "j")))])), _S.call_value(_S.read(_v15, "reach"), _S.concat([[_S.read(_v15, "i2")], _S.array(_S.prop(_S.prop(_S.read(_v15, "V"), _S.read(_v15, "i2")), _S.read(_v15, "j")))]))]), _S.invoke(_S.read(_v15, "R"), "range", [0.02, 0.07])))
			var _v16 = _S.prop(_S.read(_v15, "e"), 0)
			_S.define(_v15, "ax", _S.prop(_v16, 0))
			_S.define(_v15, "ay", _S.prop(_v16, 1))
			_S.call_value(_S.read(_v15, "trace"), [_S.read(_v15, "e"), _S.function_value(_v15, "_f16")])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "j", 1, "+=", true)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cracks"), "sort", [_S.function_value(_e, "_f17")])
	_S.define(_e, "cells", [])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), _S.read(_v17, "NR"))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "j", 0)
		_S.define(_v18, "jb", null)
		while _S.truth(_S.binary("<", _S.read(_v18, "j"), _S.binary("-", _S.prop(_S.read(_v18, "RING"), "length"), 1))):
			var _v19 = _S.scope(_v18)
			var _v20 = _S.scope(_v19)
			_S.write(_v20, "jb", _S.read(_v20, "j"), "=", false)
			while _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v20, "keep"), _S.read(_v20, "i")), _S.binary("+", _S.read(_v20, "jb"), 1)))):
				pass
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "jb", 1, "+=", true)
			_S.define(_v19, "i2", _S.binary("%", _S.binary("+", _S.read(_v19, "i"), 1), _S.read(_v19, "NR")))
			_S.define(_v19, "side", _S.function_value(_v19, "_f18"))
			_S.define(_v19, "pts", _S.concat([_S.array(_S.call_value(_S.read(_v19, "side"), [_S.read(_v19, "i")])), _S.array(_S.invoke(_S.prop(_S.prop(_S.read(_v19, "ring"), _S.read(_v19, "i")), _S.binary("+", _S.read(_v19, "jb"), 1)), "slice", [1])), _S.array(_S.invoke(_S.invoke(_S.call_value(_S.read(_v19, "side"), [_S.read(_v19, "i2")]), "reverse", []), "slice", [1]))]))
			if _S.truth(_S.read(_v19, "j")):
				_S.invoke(_S.read(_v19, "pts"), "push", _S.concat([_S.array(_S.invoke(_S.invoke(_S.invoke(_S.prop(_S.prop(_S.read(_v19, "ring"), _S.read(_v19, "i")), _S.read(_v19, "j")), "slice", []), "reverse", []), "slice", [1, _S.unary("-", 1)]))]))
			else:
				_S.invoke(_S.read(_v19, "pts"), "pop", [])
			_S.define(_v19, "x0", INF)
			_S.define(_v19, "y0", INF)
			_S.define(_v19, "x1", _S.unary("-", INF))
			_S.define(_v19, "y1", _S.unary("-", INF))
			_S.define(_v19, "cx", 0)
			_S.define(_v19, "cy", 0)
			for _v21 in _S.array(_S.read(_v19, "pts")):
				var _v22 = _S.scope(_v19)
				var _v23 = _v21
				_S.define(_v22, "x", _S.prop(_v23, 0))
				_S.define(_v22, "y", _S.prop(_v23, 1))
				_S.last([_S.write(_v22, "x0", _S.invoke(_S.read(_v22, "Math"), "min", [_S.read(_v22, "x0"), _S.read(_v22, "x")]), "=", false), _S.write(_v22, "x1", _S.invoke(_S.read(_v22, "Math"), "max", [_S.read(_v22, "x1"), _S.read(_v22, "x")]), "=", false), _S.write(_v22, "y0", _S.invoke(_S.read(_v22, "Math"), "min", [_S.read(_v22, "y0"), _S.read(_v22, "y")]), "=", false), _S.write(_v22, "y1", _S.invoke(_S.read(_v22, "Math"), "max", [_S.read(_v22, "y1"), _S.read(_v22, "y")]), "=", false), _S.write(_v22, "cx", _S.read(_v22, "x"), "+=", false), _S.write(_v22, "cy", _S.read(_v22, "y"), "+=", false)])
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v19, "x1"), 0), func(): return _S.binary("<", _S.read(_v19, "y1"), 0)), func(): return _S.binary(">=", _S.read(_v19, "x0"), _S.read(_v19, "W"))), func(): return _S.binary(">=", _S.read(_v19, "y0"), _S.read(_v19, "H")))):
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "j", _S.binary("+", _S.read(_v18, "jb"), 1), "=", false)
				continue
			_S.write(_v19, "cx", _S.binary("/", _S.binary("+", _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "x0"), 0, _S.read(_v19, "W")]), _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "x1"), 0, _S.read(_v19, "W")])), 2), "=", false)
			_S.write(_v19, "cy", _S.binary("/", _S.binary("+", _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "y0"), 0, _S.read(_v19, "H")]), _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "y1"), 0, _S.read(_v19, "H")])), 2), "=", false)
			_S.define(_v19, "d", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "cx"), _S.read(_v19, "Ix")), _S.binary("-", _S.read(_v19, "cy"), _S.read(_v19, "Iy"))]))
			_S.invoke(_S.read(_v19, "cells"), "push", [_S.merge([{"pts": _S.read(_v19, "pts")}, {"lp": _S.invoke(_S.read(_v19, "pts"), "map", [_S.function_value(_v19, "_f20")])}, {"cx": _S.read(_v19, "cx")}, {"cy": _S.read(_v19, "cy")}, {"d": _S.read(_v19, "d")}, {"r": _S.binary("/", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x1"), _S.read(_v19, "x0")), _S.binary("-", _S.read(_v19, "y1"), _S.read(_v19, "y0"))]), 2)}, {"tb": _S.binary("+", _S.binary("+", _S.read(_v19, "BREAK"), _S.binary("/", _S.read(_v19, "d"), _S.read(_v19, "WAVE"))), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.04]))}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "j", _S.binary("+", _S.read(_v18, "jb"), 1), "=", false)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	return _S.merge([{"Ix": _S.read(_e, "Ix")}, {"Iy": _S.read(_e, "Iy")}, {"cracks": _S.read(_e, "cracks")}, {"cells": _S.read(_e, "cells")}])

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_NR = _S.read(_parent,"NR")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return ((float((_n_i_b1 + _S.invoke(_n_R,"range",[(-0.3), 0.3])))/_n_NR) * _n_TAU)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return _S.invoke(_n_R,"range",[800, 1300])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_RING = _S.read(_parent,"RING")
	var _n_this = _S.read(_parent,"this")
	var _n_a_b0 = _S.arg(_args,0)
	return _S.invoke(_n_RING,"map",[_S.function_value(_S.capture(_parent,{"a":_n_a_b0,"this":_n_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Ix = _S.read(_parent,"Ix")
	var _n_Iy = _S.read(_parent,"Iy")
	var _n_R = _S.read(_parent,"R")
	var _n_a = _S.read(_parent,"a")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	if _S.truth(not _S.truth(_n_j_b1)):
		return [_n_Ix, _n_Iy]
	var _n_rr_b2 = (_n_r_b0 * _S.invoke(_n_R,"range",[0.84, 1.16]))
	var _n_aa_b3 = (_n_a + _S.invoke(_n_R,"range",[(-0.07), 0.07]))
	return [(_n_Ix + (cos(_n_aa_b3) * _n_rr_b2)), (_n_Iy + (sin(_n_aa_b3) * _n_rr_b2))]
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_Bp_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_S.index_value(_n_Bp_b1,0) - _S.index_value(_n_A_b0,0))
	var _n_dy_b3 = (_S.index_value(_n_Bp_b1,1) - _S.index_value(_n_A_b0,1))
	var _n_L_b4 = _S.logical("||",_S.Bridge.hypot([_n_dx_b2, _n_dy_b3]),func():return 1)
	var _n_n_b5 = (2 if _S.truth((_n_L_b4 > 18)) else 1)
	var _n_out_b6 = [_n_A_b0]
	if true:
		var _n_k_b7 = 1
		while _S.truth((_n_k_b7 <= _n_n_b5)):
			var _n_f_b8 = ((float(_n_k_b7)/(_n_n_b5 + 1)) + _S.invoke(_n_R,"range",[(-0.08), 0.08]))
			var _n_off_b9 = (_S.invoke(_n_R,"range",[(-1), 1]) * minf(3,(_n_L_b4 * 0.07)))
			_S.invoke(_n_out_b6,"push",[[((_S.index_value(_n_A_b0,0) + (_n_dx_b2 * _n_f_b8)) - ((float(_n_dy_b3)/_n_L_b4) * _n_off_b9)), ((_S.index_value(_n_A_b0,1) + (_n_dy_b3 * _n_f_b8)) + ((float(_n_dx_b2)/_n_L_b4) * _n_off_b9))]])
			_n_k_b7 += 1.0
	_S.invoke(_n_out_b6,"push",[_n_Bp_b1])
	return _n_out_b6
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_v_b0 = _S.arg(_args,0)
	return _S.invoke(_S.invoke(_n_v_b0,"slice",[0, (-1)]),"map",[_S.function_value(_S.capture(_parent,{"v":_n_v_b0,"this":_n_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_jag = _S.read(_parent,"jag")
	var _n_v = _S.read(_parent,"v")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return _S.call_value(_n_jag,[_n_A_b0, _S.index_value(_n_v,(_n_j_b1 + 1))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.invoke(_n_v_b0,"map",[_S.function_value(_S.capture(_parent,{"i":_n_i_b1,"this":_n_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_jag = _S.read(_parent,"jag")
	var _n_V = _S.read(_parent,"V")
	var _n_i = _S.read(_parent,"i")
	var _n_NR = _S.read(_parent,"NR")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_jag,[_n_A_b0, _S.index_value(_S.index_value(_n_V,fmod((_n_i + 1),_n_NR)),_n_j_b1)]) if _S.truth(_n_j_b1) else null)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_RING = _S.read(_parent,"RING")
	var _n_this = _S.read(_parent,"this")
	return _S.invoke(_n_RING,"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_RING = _S.read(_parent,"RING")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (((_n_j_b1 <= 2) if _S.truth((_n_j_b1 <= 2)) else _S.binary("===",_n_j_b1,(_S.prop(_n_RING,"length") - 1))) if _S.truth(((_n_j_b1 <= 2) if _S.truth((_n_j_b1 <= 2)) else _S.binary("===",_n_j_b1,(_S.prop(_n_RING,"length") - 1)))) else _S.invoke(_n_R,"chance",[(0.78 - (0.07 * _n_j_b1))]))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_Ix = _S.read(_parent,"Ix")
	var _n_Iy = _S.read(_parent,"Iy")
	var _n_speed = _S.read(_parent,"speed")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	return (_n_CRACK + (float(_S.Bridge.hypot([(_n_x_b1 - _n_Ix), (_n_y_b2 - _n_Iy)]))/_S.index_value(_n_speed,_n_i_b0)))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_when_b1 = _S.arg(_args,1)
	if true:
		var _n_k_b2 = 1
		while _S.truth((_n_k_b2 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,(_n_k_b2 - 1))
			var _n_ax_b3 = _S.prop(_tuple_0,0)
			var _n_ay_b4 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_k_b2)
			var _n_bx_b5 = _S.prop(_tuple_1,0)
			var _n_by_b6 = _S.prop(_tuple_1,1)
			var _n_n_b7 = ceili((_S.Bridge.hypot([(_n_bx_b5 - _n_ax_b3), (_n_by_b6 - _n_ay_b4)]) * 2))
			if true:
				var _n_s_b8 = 0
				while _S.truth((_n_s_b8 < _n_n_b7)):
					var _n_x_b9 = (_n_ax_b3 + (float(((_n_bx_b5 - _n_ax_b3) * _n_s_b8))/_n_n_b7))
					var _n_y_b10 = (_n_ay_b4 + (float(((_n_by_b6 - _n_ay_b4) * _n_s_b8))/_n_n_b7))
					if _S.truth(((_n_y_b10 < _n_H) if _S.truth(((_n_x_b9 < _n_W) if _S.truth(((_n_y_b10 >= 0) if _S.truth((_n_x_b9 >= 0)) else (_n_x_b9 >= 0))) else ((_n_y_b10 >= 0) if _S.truth((_n_x_b9 >= 0)) else (_n_x_b9 >= 0)))) else ((_n_x_b9 < _n_W) if _S.truth(((_n_y_b10 >= 0) if _S.truth((_n_x_b9 >= 0)) else (_n_x_b9 >= 0))) else ((_n_y_b10 >= 0) if _S.truth((_n_x_b9 >= 0)) else (_n_x_b9 >= 0))))):
						_S.invoke(_n_cracks,"push",[{"x":floori(_n_x_b9),"y":floori(_n_y_b10),"t0":_S.call_value(_n_when_b1,[_n_x_b9, _n_y_b10])}])
					_n_s_b8 += 1.0
			_n_k_b2 += 1.0
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_reach = _S.read(_parent,"reach")
	var _n_i = _S.read(_parent,"i")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_reach,[_n_i, _n_x_b0, _n_y_b1])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_start = _S.read(_parent,"start")
	var _n_ax = _S.read(_parent,"ax")
	var _n_ay = _S.read(_parent,"ay")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_start + (float(_S.Bridge.hypot([(_n_x_b0 - _n_ax), (_n_y_b1 - _n_ay)]))/420))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"t0") - _S.named_value(_n_b_b1,"t0"))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_rad = _S.read(_parent,"rad")
	var _n_j = _S.read(_parent,"j")
	var _n_jb = _S.read(_parent,"jb")
	var _n_this = _S.read(_parent,"this")
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_S.invoke(_S.index_value(_n_rad,_n_r_b0),"slice",[_n_j, (_n_jb + 1)]),"flatMap",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f19")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_e_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return (_S.invoke(_n_e_b0,"slice",[1]) if _S.truth(_n_k_b1) else _n_e_b0)
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 - _n_cx), (_n_y_b1 - _n_cy)]
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "pat", _S.call_value(_S.read(_e, "pattern"), [_S.read(_e, "R")]))
	var _v25 = _S.read(_e, "pat")
	_S.define(_e, "Ix", _S.prop(_v25, "Ix"))
	_S.define(_e, "Iy", _S.prop(_v25, "Iy"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "bounce", _S.unary("-", 1))
	_S.define(_e, "struck", false)
	_S.define(_e, "burst", false)
	_S.define(_e, "end", _S.binary("-", _S.read(_e, "D"), 0.05))
	_S.define(_e, "splinters", _S.function_value(_e, "_f22"))
	_S.define(_e, "glint", _S.function_value(_e, "_f23"))
	return _S.merge([{"update": _S.function_value(_e, "_f24")}, {"draw": _S.function_value(_e, "_f25")}])

static func _f22(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_end = _S.read(_parent,"end")
	var _n_t = _S.read(_parent,"t")
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_spread_b5 = _S.arg(_args,5)
	var _n_sp0_b6 = _S.arg(_args,6)
	var _n_sp1_b7 = _S.arg(_args,7)
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_n_b2)):
			var _n_a_b9 = (atan2(_n_vy_b4,_n_vx_b3) + _S.invoke(_n_R,"range",[(-_n_spread_b5), _n_spread_b5]))
			var _n_sp_b10 = _S.invoke(_n_R,"range",[_n_sp0_b6, _n_sp1_b7])
			var _n_life_b11 = minf(_S.invoke(_n_R,"range",[0.6, 1.2]),(_n_end - _n_t))
			if _S.truth((_n_life_b11 > 0.2)):
				_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":_n_x_b0,"y":_n_y_b1,"vx":(cos(_n_a_b9) * _n_sp_b10),"vy":(sin(_n_a_b9) * _n_sp_b10),"g":0.8,"drag":0.6,"life":_n_life_b11,"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-20), 20]),"s":_S.invoke(_n_R,"range",[1.5, 3.5]),"c":_S.invoke(_n_R,"pick",[[_S.index_value(_n_C,7), _S.index_value(_n_C,6), _S.index_value(_n_C,5)]])}])
			_n_i_b8 += 1.0
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_end = _S.read(_parent,"end")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.coalesce(_S.arg(_args,2),func():return _S.invoke(_n_R,"range",[1, 2.4]))
	return _S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _n_x_b0, _n_y_b1, _S.invoke(_n_R,"range",[(-8), 8]), _S.invoke(_n_R,"range",[(-10), 4]), minf(_S.invoke(_n_R,"range",[0.3, 0.6]),(_n_end - _n_t)), (_n_WHITE if _S.truth(_S.invoke(_n_R,"chance",[0.5])) else _S.index_value(_n_C,6)), _n_s_b2])
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.read(_e, "bounce"), 1), _S.prop(_S.read(_e, "BOUNCES"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "BOUNCES"), _S.binary("+", _S.read(_e, "bounce"), 1)), "t0")))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "k", _S.binary("/", _S.prop(_S.prop(_S.read(_v28, "BOUNCES"), _S.write(_v28, "bounce", 1, "+=", false)), "v"), _S.prop(_S.prop(_S.read(_v28, "BOUNCES"), 0), "v")))
		if _S.truth(_S.binary("<", _S.read(_v28, "k"), 0.05)):
			continue
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 5)):
			_S.invoke(_S.read(_v29, "lights"), "add", [_S.binary("/", _S.binary("*", _S.read(_v29, "W"), _S.binary("+", _S.read(_v29, "i"), 0.5)), 5), _S.binary("-", _S.read(_v29, "H"), 2), 70, _S.prop(_S.read(_v29, "C"), 5), _S.binary("*", 0.5, _S.read(_v29, "k")), 0.35])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v30 = _S.scope(_v28)
		_S.define(_v30, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "i"), _S.invoke(_S.read(_v30, "Math"), "round", [_S.binary("*", 26, _S.read(_v30, "k"))]))):
			_S.call_value(_S.read(_v30, "splinters"), [_S.invoke(_S.read(_v30, "R"), "range", [4, _S.binary("-", _S.read(_v30, "W"), 4)]), _S.binary("-", _S.read(_v30, "H"), 1), 1, _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.unary("-", 1), 0.5, _S.binary("*", 120, _S.read(_v30, "k")), _S.binary("*", 330, _S.read(_v30, "k"))])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "i", 1, "+=", true)
		var _v31 = _S.scope(_v28)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), _S.invoke(_S.read(_v31, "Math"), "round", [_S.binary("*", 9, _S.read(_v31, "k"))]))):
			_S.call_value(_S.read(_v31, "glint"), [_S.invoke(_S.read(_v31, "R"), "range", [8, _S.binary("-", _S.read(_v31, "W"), 8)]), _S.binary("-", _S.read(_v31, "H"), _S.invoke(_S.read(_v31, "R"), "range", [2, 10]))])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v32 = _S.scope(_e)
		_S.write(_v32, "struck", true, "=", false)
		_S.invoke(_S.read(_v32, "lights"), "add", [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 90, _S.prop(_S.read(_v32, "C"), 5), 0.8, 0.35])
		_S.invoke(_S.read(_v32, "lights"), "add", [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 34, _S.read(_v32, "WHITE"), 0.9, 0.1])
		_S.call_value(_S.read(_v32, "splinters"), [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 16, 0, _S.unary("-", 1), _S.prop(_S.read(_v32, "Math"), "PI"), 60, 240])
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "i"), 5)):
			_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "VAPOUR"), _S.read(_v33, "Ix"), _S.read(_v33, "Iy"), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 40), 40]), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 40), 30]), _S.invoke(_S.read(_v33, "R"), "range", [0.35, 0.6]), _S.prop(_S.read(_v33, "C"), 6), _S.invoke(_S.read(_v33, "R"), "range", [2, 3.5])])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CRACK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "c", _S.prop(_S.prop(_S.read(_v34, "pat"), "cracks"), _S.invoke(_S.read(_v34, "R"), "int", [0, _S.binary("-", _S.prop(_S.prop(_S.read(_v34, "pat"), "cracks"), "length"), 1)])))
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v34, "c"), "t0"), _S.read(_v34, "t"))):
			_S.call_value(_S.read(_v34, "glint"), [_S.prop(_S.read(_v34, "c"), "x"), _S.prop(_S.read(_v34, "c"), "y"), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.6])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v35 = _S.scope(_e)
		_S.write(_v35, "burst", true, "=", false)
		_S.invoke(_S.read(_v35, "lights"), "add", [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 170, _S.prop(_S.read(_v35, "C"), 4), 0.55, 0.5])
		_S.invoke(_S.read(_v35, "lights"), "add", [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 60, _S.read(_v35, "WHITE"), 0.8, 0.14])
		_S.call_value(_S.read(_v35, "splinters"), [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 46, 0, _S.unary("-", 1), _S.prop(_S.read(_v35, "Math"), "PI"), 90, 340])
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "i"), 14)):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "a", _S.invoke(_S.read(_v37, "R"), "range", [0, _S.read(_v37, "TAU")]))
			_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "VAPOUR"), _S.binary("+", _S.read(_v37, "Ix"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), 4)), _S.binary("+", _S.read(_v37, "Iy"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.invoke(_S.read(_v37, "R"), "range", [0.45, 0.8]), (_S.prop(_S.read(_v37, "C"), 6) if _S.truth(_S.invoke(_S.read(_v37, "R"), "chance", [0.6])) else _S.prop(_S.read(_v37, "C"), 5)), _S.invoke(_S.read(_v37, "R"), "range", [3, 6])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "i", 1, "+=", true)
	for _v38 in _S.array(_S.prop(_S.read(_e, "pat"), "cells")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "s", _v38)
		var _v40 = _S.scope(_v39)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v40, "s"), "broke")), func(): return _S.binary(">=", _S.read(_v40, "t"), _S.prop(_S.read(_v40, "s"), "tb")))):
			var _v41 = _S.scope(_v40)
			_S.set_prop(_S.read(_v41, "s"), "broke", true, "=", false)
			_S.define(_v41, "dx", _S.binary("-", _S.prop(_S.read(_v41, "s"), "cx"), _S.read(_v41, "Ix")))
			_S.define(_v41, "dy", _S.binary("-", _S.prop(_S.read(_v41, "s"), "cy"), _S.read(_v41, "Iy")))
			_S.define(_v41, "d", _S.logical("||", _S.invoke(_S.read(_v41, "Math"), "hypot", [_S.read(_v41, "dx"), _S.read(_v41, "dy")]), func(): return 1))
			_S.define(_v41, "sp", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [40, 130]), _S.binary("-", 1.15, _S.invoke(_S.read(_v41, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v41, "s"), "d"), 260)]))))
			_S.set_prop(_S.read(_v41, "s"), "vx", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v41, "dx"), _S.read(_v41, "d")), _S.read(_v41, "sp")), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 15), 15])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v41, "dy"), _S.read(_v41, "d")), _S.read(_v41, "sp")), 0.6), _S.invoke(_S.read(_v41, "R"), "range", [20, 90])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "a", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "va", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 2.5), 2.5]), _S.binary("+", 1, _S.binary("/", 20, _S.binary("+", _S.prop(_S.read(_v41, "s"), "r"), 10)))), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "phi", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vphi", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "sign", []), _S.invoke(_S.read(_v41, "R"), "range", [3, 9])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "psi", _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "z", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vz", _S.invoke(_S.read(_v41, "R"), "range", [0.25, 0.7]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "g", _S.invoke(_S.read(_v41, "R"), "range", [0.85, 1.1]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "edgeOn", false, "=", false)
			_S.call_value(_S.read(_v41, "splinters"), [_S.prop(_S.read(_v41, "s"), "cx"), _S.prop(_S.read(_v41, "s"), "cy"), (4 if _S.truth(_S.binary(">", _S.prop(_S.read(_v41, "s"), "r"), 24)) else 2), _S.prop(_S.read(_v41, "s"), "vx"), _S.prop(_S.read(_v41, "s"), "vy"), 1.2, 60, 220])
			if _S.truth(_S.invoke(_S.read(_v41, "R"), "chance", [0.15])):
				_S.call_value(_S.read(_v41, "glint"), [_S.binary("+", _S.prop(_S.read(_v41, "s"), "cx"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.prop(_S.read(_v41, "s"), "cy"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 4), 4]))])
		if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_v40, "s"), "broke")), func(): return _S.prop(_S.read(_v40, "s"), "gone"))):
			continue
		_S.set_prop(_S.read(_v40, "s"), "vy", _S.binary("*", _S.binary("*", 950, _S.prop(_S.read(_v40, "s"), "g")), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vx"), 0.3), _S.read(_v40, "dt")), "-=", false)
		_S.set_prop(_S.read(_v40, "s"), "cx", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vx"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "cy", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vy"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "a", _S.binary("*", _S.prop(_S.read(_v40, "s"), "va"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "phi", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vphi"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "z", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vz"), _S.read(_v40, "dt")), "+=", false)
		_S.define(_v40, "on", _S.binary("<", _S.invoke(_S.read(_v40, "Math"), "abs", [_S.invoke(_S.read(_v40, "Math"), "cos", [_S.prop(_S.read(_v40, "s"), "phi")])]), 0.2))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v40, "on"), func(): return _S.unary("!", _S.prop(_S.read(_v40, "s"), "edgeOn"))), func(): return _S.binary("<", _S.read(_v40, "t"), _S.binary("-", _S.read(_v40, "end"), 0.3)))):
			_S.call_value(_S.read(_v40, "glint"), [_S.prop(_S.read(_v40, "s"), "cx"), _S.prop(_S.read(_v40, "s"), "cy"), _S.invoke(_S.read(_v40, "R"), "range", [1.4, 2.6])])
		_S.set_prop(_S.read(_v40, "s"), "edgeOn", _S.read(_v40, "on"), "=", false)
		if _S.truth(_S.binary(">", _S.binary("-", _S.prop(_S.read(_v40, "s"), "cy"), _S.binary("/", _S.prop(_S.read(_v40, "s"), "r"), _S.binary("+", 1, _S.prop(_S.read(_v40, "s"), "z")))), _S.binary("+", _S.read(_v40, "H"), 2))):
			_S.set_prop(_S.read(_v40, "s"), "gone", true, "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_t = _S.read(_parent,"t")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_paneY = _S.read(_parent,"paneY")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_ink = _S.read(_parent,"ink")
	var _n_rect = _S.read(_parent,"rect")
	var _n_C = _S.read(_parent,"C")
	var _n_LAND = _S.read(_parent,"LAND")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_pat = _S.read(_parent,"pat")
	var _n_Ix = _S.read(_parent,"Ix")
	var _n_Iy = _S.read(_parent,"Iy")
	var _n_flare = _S.read(_parent,"flare")
	var _n_drawShard = _S.read(_parent,"drawShard")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.call_value(_n_clipTo,[_n_p0_b0])
	if _S.truth((_n_t < _n_BREAK)):
		var _n_yb_b2 = (_S.call_value(_n_paneY,[_n_t]) + _n_H)
		var _n_r1_b3 = minf(_n_H,floori(_n_yb_b2))
		if _S.truth((_n_r1_b3 > 0)):
			_S.call_value(_n_rect,[_n_p0_b0, 0, 0, _n_W, _n_r1_b3, _n_ink])
			var _n_shine_b4 = (1 - _S.MathFX.smooth(0.98,1.22,_n_t))
			var _n_y0_b5 = (_n_yb_b2 - _n_H)
			if _S.truth((_n_shine_b4 > 0)):
				for _iter_0 in _S.array([[0, 16, 0.05], [22, 3, 0.1], [30, 1, 0.12]]):
					var _tuple_1 = _iter_0
					var _n_off_b8 = _S.prop(_tuple_1,0)
					var _n_w_b9 = _S.prop(_tuple_1,1)
					var _n_a_b10 = _S.prop(_tuple_1,2)
					if true:
						var _n_y_b11 = 0
						while _S.truth((_n_y_b11 < _n_r1_b3)):
							var _n_xc_b12 = (((_n_W * 0.18) + _n_off_b8) + ((_n_H - (_n_y_b11 - _n_y0_b5)) * 0.7))
							if true:
								var _n_x_b13 = maxf(0,floori((_n_xc_b12 - (float(_n_w_b9)/2))))
								while _S.truth((_n_x_b13 < minf(_n_W,ceili((_n_xc_b12 + (float(_n_w_b9)/2)))))):
									_S.invoke(_n_p0_b0,"blend",[(_n_x_b13 + 0.5), (_n_y_b11 + 0.5), _S.index_value(_n_C,6), (_n_a_b10 * _n_shine_b4)])
									_n_x_b13 += 1.0
							_n_y_b11 += 1.0
				var _n_st_b6 = (0 if _S.truth((_n_shine_b4 > 0.66)) else (1 if _S.truth((_n_shine_b4 > 0.33)) else 2))
				for _iter_2 in _S.array([[1, _S.index_value(_n_C,(6 - (_n_st_b6 * 2)))], [2, _S.index_value(_n_C,(4 - _n_st_b6))], [3, _S.index_value(_n_C,maxf(1,(2 - _n_st_b6)))]]):
					var _tuple_3 = _iter_2
					var _n_dy_b14 = _S.prop(_tuple_3,0)
					var _n_c_b15 = _S.prop(_tuple_3,1)
					if _S.truth((((_n_r1_b3 - _n_dy_b14) < _n_H) if _S.truth(((_n_r1_b3 - _n_dy_b14) >= 0)) else ((_n_r1_b3 - _n_dy_b14) >= 0))):
						_S.call_value(_n_rect,[_n_p0_b0, 0, (_n_r1_b3 - _n_dy_b14), _n_W, 1, _n_c_b15])
				var _n_gx_b7 = (((_n_W * clampf((float(_n_t)/(_n_LAND + 0.25)),0.0,1.0)) * 1.2) - 20)
				if true:
					var _n_x_b16 = 0
					while _S.truth((_n_x_b16 < _n_W)):
						var _n_k_b17 = maxf(0,(1 - (float(absf((_n_x_b16 - _n_gx_b7)))/28)))
						if _S.truth((((_n_r1_b3 - 1) < _n_H) if _S.truth((_n_k_b17 > 0)) else (_n_k_b17 > 0))):
							_S.invoke(_n_p0_b0,"px",[_n_x_b16, (_n_r1_b3 - 1), (_n_WHITE if _S.truth((_n_k_b17 > 0.5)) else _S.index_value(_n_C,6))])
							_S.invoke(_n_p0_b0,"light",[_n_x_b16, (_n_r1_b3 - 1), _S.index_value(_n_C,6), (0.5 * _n_k_b17)])
						if true:
							var _n_d_b18 = 0
							while _S.truth((((_n_r1_b3 + _n_d_b18) < _n_H) if _S.truth((_n_d_b18 < 14)) else (_n_d_b18 < 14))):
								_S.invoke(_n_p0_b0,"light",[_n_x_b16, (_n_r1_b3 + _n_d_b18), _S.index_value(_n_C,5), (((0.3 * _n_shine_b4) * pow((1 - (float(_n_d_b18)/14)),2)) * (0.6 + (0.8 * _n_k_b17)))])
								_n_d_b18 += 1.0
						_n_x_b16 += 1.0
				if _S.truth((((_n_r1_b3 - 1) < _n_H) if _S.truth(((_n_gx_b7 < _n_W) if _S.truth(((_n_gx_b7 > 0) if _S.truth((_n_t < (_n_LAND + 0.25))) else (_n_t < (_n_LAND + 0.25)))) else ((_n_gx_b7 > 0) if _S.truth((_n_t < (_n_LAND + 0.25))) else (_n_t < (_n_LAND + 0.25))))) else ((_n_gx_b7 < _n_W) if _S.truth(((_n_gx_b7 > 0) if _S.truth((_n_t < (_n_LAND + 0.25))) else (_n_t < (_n_LAND + 0.25)))) else ((_n_gx_b7 > 0) if _S.truth((_n_t < (_n_LAND + 0.25))) else (_n_t < (_n_LAND + 0.25)))))):
					_S.call_value(_n_sparkle,[_n_p_b1, _n_gx_b7, (_n_r1_b3 - 1), 6, _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.5])
		if _S.truth((_n_t >= _n_CRACK)):
			for _iter_4 in _S.array(_S.named_value(_n_pat,"cracks")):
				var _n_c_b21 = _iter_4
				if _S.truth((_S.named_value(_n_c_b21,"t0") > _n_t)):
					break
				var _n_age_b22 = (_n_t - _S.named_value(_n_c_b21,"t0"))
				if _S.truth((((_S.named_value(_n_c_b21,"y") + 1) < _n_H) if _S.truth(((_S.named_value(_n_c_b21,"x") + 1) < _n_W)) else ((_S.named_value(_n_c_b21,"x") + 1) < _n_W))):
					_S.invoke(_n_p0_b0,"px",[(_S.named_value(_n_c_b21,"x") + 1), (_S.named_value(_n_c_b21,"y") + 1), _S.index_value(_n_C,1)])
				_S.invoke(_n_p0_b0,"px",[_S.named_value(_n_c_b21,"x"), _S.named_value(_n_c_b21,"y"), (_n_WHITE if _S.truth((_n_age_b22 < 0.04)) else (_S.index_value(_n_C,6) if _S.truth((_n_age_b22 < 0.18)) else _S.index_value(_n_C,5)))])
				if _S.truth((_n_age_b22 < 0.3)):
					_S.invoke(_n_p0_b0,"light",[_S.named_value(_n_c_b21,"x"), _S.named_value(_n_c_b21,"y"), _S.index_value(_n_C,5), (0.55 * (1 - (float(_n_age_b22)/0.3)))])
			var _n_u_b19 = (float((_n_t - _n_CRACK))/0.22)
			if _S.truth((_n_u_b19 < 1)):
				_S.call_value(_n_flare,[_n_p_b1, _n_Ix, _n_Iy, (30 * pow((1 - _n_u_b19),1.5)), (1 - _n_u_b19), _n_C])
				_S.invoke(_n_p_b1,"glow",[_n_Ix, _n_Iy, 50, _n_WHITE, (0.7 * (1 - _n_u_b19))])
			var _n_w_b20 = (float((_n_t - (_n_BREAK - 0.07)))/0.07)
			if _S.truth((_n_w_b20 > 0)):
				for _iter_5 in _S.array(_S.named_value(_n_pat,"cracks")):
					var _n_c_b23 = _iter_5
					_S.invoke(_n_p0_b0,"px",[_S.named_value(_n_c_b23,"x"), _S.named_value(_n_c_b23,"y"), _n_WHITE])
					_S.invoke(_n_p0_b0,"light",[_S.named_value(_n_c_b23,"x"), _S.named_value(_n_c_b23,"y"), _S.index_value(_n_C,6), (0.4 * _n_w_b20)])
	else:
		var _n_fall_b24 = _S.invoke(_S.invoke(_S.named_value(_n_pat,"cells"),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f26")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f27")])
		for _iter_6 in _S.array(_S.named_value(_n_pat,"cells")):
			var _n_s_b25 = _iter_6
			if _S.truth(not _S.truth(_S.named_value(_n_s_b25,"broke"))):
				_S.call_value(_n_drawShard,[_n_p_b1, _n_p0_b0, _n_s_b25, _n_C, _n_ink, true])
		for _iter_7 in _S.array(_n_fall_b24):
			var _n_s_b26 = _iter_7
			_S.call_value(_n_drawShard,[_n_p_b1, _n_p0_b0, _n_s_b26, _n_C, _n_ink, false])
	_S.invoke(_n_bits,"draw",[_n_p_b1])
	_S.invoke(_n_ps,"draw",[_n_p_b1])
	_S.invoke(_n_lights,"draw",[_n_p_b1])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	return (not _S.truth(_S.named_value(_n_s_b0,"gone")) if _S.truth(_S.named_value(_n_s_b0,"broke")) else _S.named_value(_n_s_b0,"broke"))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_b_b1,"z") - _S.named_value(_n_a_b0,"z"))
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_L3 = _S.read(_parent,"L3")
	var _n_fillConvex = _S.read(_parent,"fillConvex")
	var _n_LX = _S.read(_parent,"LX")
	var _n_LY = _S.read(_parent,"LY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_p0_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_ink_b4 = _S.arg(_args,4)
	var _n_still_b5 = _S.arg(_args,5)
	var _n_pts_b6 = null
	var _n_face_b7 = _n_ink_b4
	var _n_sliver_b8 = false
	var _n_gl_b9 = 0
	if _S.truth(_n_still_b5):
		_n_pts_b6 = _S.named_value(_n_s_b2,"pts")
	else:
		var _n_cp_b12 = cos(_S.named_value(_n_s_b2,"phi"))
		var _n_sp_b13 = sin(_S.named_value(_n_s_b2,"phi"))
		var _n_ci_b14 = cos(_S.named_value(_n_s_b2,"psi"))
		var _n_si_b15 = sin(_S.named_value(_n_s_b2,"psi"))
		var _n_ca_b16 = cos(_S.named_value(_n_s_b2,"a"))
		var _n_sa_b17 = sin(_S.named_value(_n_s_b2,"a"))
		var _n_k_b18 = (float(1)/(1 + _S.named_value(_n_s_b2,"z")))
		_n_pts_b6 = _S.invoke(_S.named_value(_n_s_b2,"lp"),"map",[_S.function_value(_S.capture(_parent,{"ci":_n_ci_b14,"si":_n_si_b15,"cp":_n_cp_b12,"s":_n_s_b2,"ca":_n_ca_b16,"sa":_n_sa_b17,"k":_n_k_b18,"this":_this}),"_f29")])
		var _n_nx0_b19 = (_n_si_b15 * _n_sp_b13)
		var _n_ny0_b20 = ((-_n_ci_b14) * _n_sp_b13)
		var _n_nz_b21 = _n_cp_b12
		var _n_nx_b22 = ((_n_nx0_b19 * _n_ca_b16) - (_n_ny0_b20 * _n_sa_b17))
		var _n_ny_b23 = ((_n_nx0_b19 * _n_sa_b17) + (_n_ny0_b20 * _n_ca_b16))
		var _n_d_b24 = absf((((_n_nx_b22 * _S.index_value(_n_L3,0)) + (_n_ny_b23 * _S.index_value(_n_L3,1))) + (_n_nz_b21 * _S.index_value(_n_L3,2))))
		_n_gl_b9 = pow(_n_d_b24,6)
		var _n_graze_b25 = pow(clampf((1 - (float(absf(_n_cp_b12))/0.3)),0.0,1.0),2)
		_n_face_b7 = _S.ColorFX.mix(_S.ColorFX.mix(_n_ink_b4,_S.index_value(_n_C_b3,2),(0.12 + (0.4 * _n_gl_b9))),_S.index_value(_n_C_b3,3),(0.55 * _n_graze_b25))
		_n_sliver_b8 = (absf(_n_cp_b12) < 0.2)
		if _S.truth(((absf(_n_cp_b12) * _S.named_value(_n_s_b2,"r")) < 1.5)):
			_n_face_b7 = _S.index_value(_n_C_b3,5)
	_S.call_value(_n_fillConvex,[_n_p0_b1, _n_pts_b6, _n_face_b7])
	var _n_a2_b10 = 0
	if true:
		var _n_i_b26 = 0
		var _n_j_b27 = (_S.prop(_n_pts_b6,"length") - 1)
		while _S.truth((_n_i_b26 < _S.prop(_n_pts_b6,"length"))):
			_n_a2_b10 += ((_S.index_value(_S.index_value(_n_pts_b6,_n_j_b27),0) * _S.index_value(_S.index_value(_n_pts_b6,_n_i_b26),1)) - (_S.index_value(_S.index_value(_n_pts_b6,_n_i_b26),0) * _S.index_value(_S.index_value(_n_pts_b6,_n_j_b27),1)))
			_n_j_b27 = _n_i_b26
			_n_i_b26 += 1.0
	var _n_sg_b11 = (1 if _S.truth((_n_a2_b10 > 0)) else (-1))
	if true:
		var _n_i_b28 = 0
		var _n_j_b29 = (_S.prop(_n_pts_b6,"length") - 1)
		while _S.truth((_n_i_b28 < _S.prop(_n_pts_b6,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b6,_n_j_b29)
			var _n_ax_b30 = _S.prop(_tuple_0,0)
			var _n_ay_b31 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b6,_n_i_b28)
			var _n_bx_b32 = _S.prop(_tuple_1,0)
			var _n_by_b33 = _S.prop(_tuple_1,1)
			var _n_dx_b34 = (_n_bx_b32 - _n_ax_b30)
			var _n_dy_b35 = (_n_by_b33 - _n_ay_b31)
			var _n_L_b36 = _S.Bridge.hypot([_n_dx_b34, _n_dy_b35])
			if _S.truth((_n_L_b36 < 0.5)):
				_n_j_b29 = _n_i_b28
				_n_i_b28 += 1.0
				continue
			var _n_mx_b37 = ((float(_n_dy_b35)/_n_L_b36) * _n_sg_b11)
			var _n_my_b38 = ((float((-_n_dx_b34))/_n_L_b36) * _n_sg_b11)
			var _n_el_b39 = ((_n_mx_b37 * _n_LX) + (_n_my_b38 * _n_LY))
			if _S.truth(_n_still_b5):
				_S.invoke(_n_p_b0,"line",[_n_ax_b30, _n_ay_b31, _n_bx_b32, _n_by_b33, (_S.index_value(_n_C_b3,5) if _S.truth((_n_el_b39 > 0)) else _S.index_value(_n_C_b3,4))])
				_n_j_b29 = _n_i_b28
				_n_i_b28 += 1.0
				continue
			if _S.truth(((_n_el_b39 > 0.2) if _S.truth((_n_el_b39 > 0.2)) else _n_sliver_b8)):
				_S.invoke(_n_p_b0,"line",[(_n_ax_b30 - _n_mx_b37), (_n_ay_b31 - _n_my_b38), (_n_bx_b32 - _n_mx_b37), (_n_by_b33 - _n_my_b38), _S.index_value(_n_C_b3,4)])
				_S.invoke(_n_p_b0,"line",[_n_ax_b30, _n_ay_b31, _n_bx_b32, _n_by_b33, (_n_WHITE if _S.truth(((_n_gl_b9 > 0.5) if _S.truth((_n_gl_b9 > 0.5)) else _n_sliver_b8)) else _S.index_value(_n_C_b3,6))])
				_S.invoke(_n_p_b0,"glow",[(float((_n_ax_b30 + _n_bx_b32))/2), (float((_n_ay_b31 + _n_by_b33))/2), minf(12,(4 + (_n_L_b36 * 0.3))), _S.index_value(_n_C_b3,5), (0.12 + (0.3 * _n_gl_b9))])
			else:
				_S.invoke(_n_p_b0,"line",[_n_ax_b30, _n_ay_b31, _n_bx_b32, _n_by_b33, (_S.index_value(_n_C_b3,4) if _S.truth((_n_el_b39 > (-0.3))) else _S.index_value(_n_C_b3,2))])
			_n_j_b29 = _n_i_b28
			_n_i_b28 += 1.0
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_ci = _S.read(_parent,"ci")
	var _n_si = _S.read(_parent,"si")
	var _n_cp = _S.read(_parent,"cp")
	var _n_s = _S.read(_parent,"s")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_k = _S.read(_parent,"k")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_u_b2 = ((_n_x_b0 * _n_ci) + (_n_y_b1 * _n_si))
	var _n_v_b3 = ((((-_n_x_b0) * _n_si) + (_n_y_b1 * _n_ci)) * _n_cp)
	var _n_qx_b4 = ((_n_u_b2 * _n_ci) - (_n_v_b3 * _n_si))
	var _n_qy_b5 = ((_n_u_b2 * _n_si) + (_n_v_b3 * _n_ci))
	return [(_S.named_value(_n_s,"cx") + (((_n_qx_b4 * _n_ca) - (_n_qy_b5 * _n_sa)) * _n_k)), (_S.named_value(_n_s,"cy") + (((_n_qx_b4 * _n_sa) + (_n_qy_b5 * _n_ca)) * _n_k))]
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_LAND = _S.read(_parent,"LAND")
	var _n_GP = _S.read(_parent,"GP")
	var _n_REST = _S.read(_parent,"REST")
	var _n_out_b0 = []
	var _n_t0_b1 = _n_LAND
	var _n_v_b2 = ((_n_GP * _n_LAND) * _n_REST)
	if true:
		var _n_k_b3 = 0
		while _S.truth((_n_k_b3 < 3)):
			_S.invoke(_n_out_b0,"push",[{"t0":_n_t0_b1,"v":_n_v_b2,"T":(float((2 * _n_v_b2))/_n_GP)}])
			_n_t0_b1 += (float((2 * _n_v_b2))/_n_GP)
			_n_v_b2 *= _n_REST
			_n_k_b3 += 1.0
	return _n_out_b0
	return null
