@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/thorns.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"nature_thorn"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "thorn", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Thorns"}, {"desc": "A seam races along the floor and hooked thorns punch up out of it one after another, each bigger than the last, in bursts of dirt and green light; they hold, then sink."}, {"tags": ["nature", "thorns", "plant", "spikes", "ground", "attack", "one-shot"]}, {"size": [232, 92]}, {"origin": [48, 78]}, {"duration": 2.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#160c0e", "#2e1418", "#4e2224", "#743a30", "#9a5a3e", "#c08458", "#e2b484", "#fbe8c8"]}, {"glow": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"soil": ["#120c0c", "#251917", "#3b2a24", "#553d31", "#715440", "#8f6e52", "#b8966e", "#e6d0a8"]}, {"count": 6}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RISE", 0.11)
	_S.define(_e, "SINK", 0.36)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_opts_b4 = _S.arg(_args,4)
	if _S.truth((_n_h_b2 < 1.5)):
		return null
	var _object_0 = _n_s_b1
	var _n_x_b5 = _S.named_value(_object_0,"x")
	var _n_w_b6 = _S.named_value(_object_0,"w")
	var _n_hook_b7 = _S.named_value(_object_0,"hook")
	var _n_lean_b8 = _S.named_value(_object_0,"lean")
	var _n_base_b9 = (_S.named_value(_n_opts_b4,"base") if _S.named_value(_n_opts_b4,"base")!=null else 0)
	var _n_white_b10 = _S.named_value(_n_opts_b4,"white")
	var _n_cx_b11 = _S.function_value(_S.capture(_parent,{"x":_n_x_b5,"lean":_n_lean_b8,"hook":_n_hook_b7,"this":_this}),"_f1")
	var _n_hw_b12 = _S.function_value(_S.capture(_parent,{"w":_n_w_b6,"this":_this}),"_f2")
	var _n_inside_b13 = _S.function_value(_S.capture(_parent,{"base":_n_base_b9,"h":_n_h_b2,"cx":_n_cx_b11,"hw":_n_hw_b12,"this":_this}),"_f3")
	var _n_X0_b14 = floori(((_n_x_b5 - _n_w_b6) - 6))
	var _n_X1_b15 = ceili(((((_n_x_b5 + (float(_n_w_b6)/2)) + absf(_n_lean_b8)) + absf(_n_hook_b7)) + 2))
	if true:
		var _n_py_b16 = (floori((_n_base_b9 - _n_h_b2)) - 1)
		while _S.truth((_n_py_b16 <= minf(0,ceili(_n_base_b9)))):
			if true:
				var _n_px_b17 = _n_X0_b14
				while _S.truth((_n_px_b17 <= _n_X1_b15)):
					if _S.truth(not _S.truth(_S.call_value(_n_inside_b13,[_n_px_b17, _n_py_b16]))):
						if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside_b13,[(_n_px_b17 - 1), _n_py_b16]),func():return _S.call_value(_n_inside_b13,[(_n_px_b17 + 1), _n_py_b16])),func():return _S.call_value(_n_inside_b13,[_n_px_b17, (_n_py_b16 + 1)])),func():return _S.call_value(_n_inside_b13,[_n_px_b17, (_n_py_b16 - 1)])) if _S.truth((_n_py_b16 <= 0)) else (_n_py_b16 <= 0))):
							_S.invoke(_n_p_b0,"dot",[_n_px_b17, _n_py_b16, _S.index_value(_n_C_b3,0), (_S.named_value(_n_opts_b4,"a") if _S.named_value(_n_opts_b4,"a")!=null else 1)])
						_n_px_b17 += 1.0
						continue
					if _S.truth(_n_white_b10):
						_S.invoke(_n_p_b0,"px",[_n_px_b17, _n_py_b16, _n_WHITE])
						_n_px_b17 += 1.0
						continue
					var _n_u_b18 = (float((_n_base_b9 - (_n_py_b16 + 0.5)))/_n_h_b2)
					var _n_c_b19 = _S.call_value(_n_cx_b11,[_n_u_b18])
					var _n_r_b20 = _S.call_value(_n_hw_b12,[_n_u_b18])
					var _n_q_b21 = (float(((_n_px_b17 + 0.5) - (_n_c_b19 - _n_r_b20)))/(2 * _n_r_b20))
					var _n_i_b22 = (4 if _S.truth((_n_q_b21 < 0)) else (6 if _S.truth((_n_q_b21 < 0.16)) else (5 if _S.truth((_n_q_b21 < 0.36)) else (7 if _S.truth((_n_q_b21 < 0.46)) else (4 if _S.truth((_n_q_b21 < 0.7)) else (3 if _S.truth((_n_q_b21 < 0.86)) else 2))))))
					if _S.truth((_n_u_b18 > 0.86)):
						_n_i_b22 = (7 if _S.truth((_n_q_b21 < 0.6)) else 5)
					if _S.truth(((_S.MathFX.rand([_n_px_b17,floori((float(((_n_py_b16 + 0.5) - _n_base_b9))/3)),_S.named_value(_n_s_b1,"seed")]) < 0.12) if _S.truth(((_n_i_b22 > 2) if _S.truth((_n_i_b22 < 7)) else (_n_i_b22 < 7))) else ((_n_i_b22 > 2) if _S.truth((_n_i_b22 < 7)) else (_n_i_b22 < 7)))):
						_n_i_b22 -= 1
					_S.invoke(_n_p_b0,"px",[_n_px_b17, _n_py_b16, _S.index_value(_n_C_b3,_n_i_b22)])
					_n_px_b17 += 1.0
			_n_py_b16 += 1.0
	if _S.truth(((_n_h_b2 > 14) if _S.truth(not _S.truth(_n_white_b10)) else not _S.truth(_n_white_b10))):
		var _n_u0_b23 = 0.34
		var _n_u1_b24 = 0.46
		var _n_y0_b25 = (_n_base_b9 - (_n_u0_b23 * _n_h_b2))
		var _n_y1_b26 = (_n_base_b9 - (_n_u1_b24 * _n_h_b2))
		var _n_e0_b27 = (_S.call_value(_n_cx_b11,[_n_u0_b23]) - _S.call_value(_n_hw_b12,[_n_u0_b23]))
		var _n_e1_b28 = (_S.call_value(_n_cx_b11,[_n_u1_b24]) - _S.call_value(_n_hw_b12,[_n_u1_b24]))
		var _n_L_b29 = (_n_w_b6 * 0.45)
		if _S.truth((_n_y0_b25 <= 0)):
			_S.invoke(_n_p_b0,"tri",[(_n_e0_b27 + 0.5), _n_y0_b25, (_n_e1_b28 + 0.5), _n_y1_b26, (_n_e1_b28 - _n_L_b29), (_n_y1_b26 - (_n_L_b29 * 0.7)), _S.index_value(_n_C_b3,3)])
			_S.invoke(_n_p_b0,"line",[_n_e1_b28, _n_y1_b26, (_n_e1_b28 - _n_L_b29), (_n_y1_b26 - (_n_L_b29 * 0.7)), _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"px",[(_n_e1_b28 - _n_L_b29), (_n_y1_b26 - (_n_L_b29 * 0.7)), _S.index_value(_n_C_b3,7)])
			_S.invoke(_n_p_b0,"line",[_n_e0_b27, (_n_y0_b25 + 1), ((_n_e1_b28 - _n_L_b29) + 1), ((_n_y1_b26 - (_n_L_b29 * 0.7)) + 1), _S.index_value(_n_C_b3,0)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_lean = _S.read(_parent,"lean")
	var _n_hook = _S.read(_parent,"hook")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_x + (_n_lean * _n_u_b0)) + (_n_hook * pow(_n_u_b0,2.4)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_u_b0 = _S.arg(_args,0)
	return (((float(_n_w)/2) * pow((1 - _n_u_b0),0.9)) + 0.25)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_base = _S.read(_parent,"base")
	var _n_h = _S.read(_parent,"h")
	var _n_cx = _S.read(_parent,"cx")
	var _n_hw = _S.read(_parent,"hw")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_u_b2 = (float((_n_base - (_n_py_b1 + 0.5)))/_n_h)
	if _S.truth((((_n_u_b2 < 0) if _S.truth((_n_u_b2 < 0)) else (_n_u_b2 > 1)) if _S.truth(((_n_u_b2 < 0) if _S.truth((_n_u_b2 < 0)) else (_n_u_b2 > 1))) else ((_n_py_b1 + 0.5) > 0))):
		return false
	var _n_c_b3 = _S.call_value(_n_cx,[_n_u_b2])
	var _n_fx_b4 = (_n_px_b0 + 0.5)
	return (absf((_n_fx_b4 - _n_c_b3)) <= _S.call_value(_n_hw,[_n_u_b2]))
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 4]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "soil"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.prop(_S.read(_e, "o"), "count")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.prop(_S.read(_e, "G"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "chips", [])
	_S.define(_e, "list", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f6")]))
	_S.define(_e, "reach", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "list"), _S.binary("-", _S.read(_e, "n"), 1)), "x"), 8))
	_S.define(_e, "t", 0)
	_S.define(_e, "chip", _S.function_value(_e, "_f7"))
	_S.define(_e, "grown", _S.function_value(_e, "_f8"))
	_S.define(_e, "sunk", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_n = _S.read(_parent,"n")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float(_n_i_b1)/(_n_n - 1))
	var _n_h_b3 = ((12 + (36 * _n_k_b2)) + _S.invoke(_n_R,"range",[(-1.5), 1.5]))
	return {"x":((10 + (_n_i_b1 * (float(104)/(_n_n - 1)))) + _S.invoke(_n_R,"range",[(-3), 3])),"h":_n_h_b3,"w":(6 + (9 * _n_k_b2)),"lean":(_S.invoke(_n_R,"range",[(-1), 1.5]) + (_n_k_b2 * 2)),"hook":(_n_h_b3 * _S.invoke(_n_R,"range",[0.14, 0.22])),"at":(0.12 + (_n_i_b1 * 0.075)),"sink":(1.45 + (_n_i_b1 * 0.06)),"seed":_S.invoke(_n_R,"int",[1, 999]),"up":false,"down":false}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_chips = _S.read(_parent,"chips")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_stoneShape = _S.read(_parent,"stoneShape")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_sp_b1 = _S.arg(_args,1)
	var _n_nn_b2 = _S.arg(_args,2)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_nn_b2)):
			var _n_a_b4 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.1), 1.1]))
			var _n_v_b5 = (_S.invoke(_n_R,"range",[60, 210]) * _n_sp_b1)
			_S.invoke(_n_chips,"push",[{"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-3), 3])),"y":(-1),"vx":(cos(_n_a_b4) * _n_v_b5),"vy":(sin(_n_a_b4) * _n_v_b5),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-15), 15]),"s":(_S.invoke(_n_R,"range",[1.3, 2.6]) * sqrt(_n_sp_b1)),"pts":_S.call_value(_n_stoneShape,[_n_R]),"life":minf(_S.invoke(_n_R,"range",[0.7, 1.1]),((_S.named_value(_n_meta,"duration") - 0.05) - _n_t))}])
			_n_i_b3 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_RISE = _S.read(_parent,"RISE")
	var _n_s_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t < _S.named_value(_n_s_b0,"at"))) else _S.invoke(_n_ease,"outBack",[clampf((float((_n_t - _S.named_value(_n_s_b0,"at")))/_n_RISE),0.0,1.0), 2.4]))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_t = _S.read(_parent,"t")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.MathFX.smooth(_S.named_value(_n_s_b0,"sink"),(_S.named_value(_n_s_b0,"sink") + _n_SINK),_n_t)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	for _v10 in _S.array(_S.read(_e, "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "s", _v10)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "k", _S.binary("/", _S.prop(_S.read(_v12, "s"), "h"), 48))
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "s"), "up")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "s"), "at")))):
			var _v13 = _S.scope(_v12)
			_S.set_prop(_S.read(_v13, "s"), "up", true, "=", false)
			_S.invoke(_S.read(_v13, "lights"), "add", [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "s"), "h")), 0.5), _S.binary("+", 18, _S.binary("*", 18, _S.read(_v13, "k"))), _S.read(_v13, "WHITE"), 0.45, 0.08])
			_S.invoke(_S.read(_v13, "lights"), "add", [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "s"), "h")), 0.4), _S.binary("+", 26, _S.binary("*", 26, _S.read(_v13, "k"))), _S.prop(_S.read(_v13, "G"), 2), 0.45, 0.4])
			_S.call_value(_S.read(_v13, "chip"), [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v13, "k"))), _S.binary("+", 3, _S.invoke(_S.read(_v13, "Math"), "round", [_S.binary("*", 5, _S.read(_v13, "k"))]))])
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.binary("+", 10, _S.binary("*", 18, _S.read(_v14, "k"))))):
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 1), 1])))
				_S.define(_v15, "v", _S.binary("*", _S.invoke(_S.read(_v15, "R"), "range", [60, 230]), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v15, "k")))))
				_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v15, "s"), "x"), _S.invoke(_S.read(_v15, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "s"), "w")), 3), _S.binary("/", _S.prop(_S.read(_v15, "s"), "w"), 3)])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "v")), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "v")), _S.invoke(_S.read(_v15, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "S"), 5), _S.prop(_S.read(_v15, "S"), 4), _S.prop(_S.read(_v15, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.3])) else 1)])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
			var _v16 = _S.scope(_v13)
			_S.define(_v16, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.binary("+", 3, _S.binary("*", 5, _S.read(_v16, "k"))))):
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v16, "s"), "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [1, 4])), _S.binary("*", _S.invoke(_S.read(_v16, "R"), "sign", []), _S.invoke(_S.read(_v16, "R"), "range", [20, 80])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [5, 25])), _S.invoke(_S.read(_v16, "R"), "range", [0.7, 1.2]), _S.prop(_S.read(_v16, "S"), 5), _S.binary("*", _S.invoke(_S.read(_v16, "R"), "range", [3, 5.5]), _S.binary("+", 0.6, _S.binary("*", 0.5, _S.read(_v16, "k")))), 0, 0])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "i", 1, "+=", true)
			var _v17 = _S.scope(_v13)
			_S.define(_v17, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v17, "i"), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v17, "k"))))):
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "STAR"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v17, "s"), "hook"), 0.8)), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v17, "s"), "h")), _S.invoke(_S.read(_v17, "R"), "range", [0.5, 1])), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [5, 20])), _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v17, "G"), 3), _S.invoke(_S.read(_v17, "R"), "range", [0.8, 2]), _S.invoke(_S.read(_v17, "R"), "range", [0, 0.12])])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "i", 1, "+=", true)
			var _v18 = _S.scope(_v13)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), 4)):
				_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "MOTE"), _S.binary("+", _S.prop(_S.read(_v18, "s"), "x"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, _S.binary("*", _S.prop(_S.read(_v18, "s"), "h"), 0.6)])), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [30, 70])), _S.invoke(_S.read(_v18, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v18, "G"), 3), 0.7])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "s"), "down")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "s"), "sink")))):
			var _v19 = _S.scope(_v12)
			_S.set_prop(_S.read(_v19, "s"), "down", true, "=", false)
			_S.call_value(_S.read(_v19, "chip"), [_S.prop(_S.read(_v19, "s"), "x"), 0.35, _S.binary("+", 2, _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", 2, _S.read(_v19, "k"))]))])
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.binary("+", 3, _S.binary("*", 3, _S.read(_v20, "k"))))):
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v20, "s"), "x"), _S.invoke(_S.read(_v20, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "s"), "w")), 2), _S.binary("/", _S.prop(_S.read(_v20, "s"), "w"), 2)])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [0, 3])), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "sign", []), _S.invoke(_S.read(_v20, "R"), "range", [15, 50])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 10])), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.4, 0.7]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v20, "meta"), "duration"), 0.05), _S.read(_v20, "t"))]), _S.prop(_S.read(_v20, "S"), 5), _S.invoke(_S.read(_v20, "R"), "range", [2, 4])])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v12, "s"), "up"), func(): return _S.unary("!", _S.prop(_S.read(_v12, "s"), "down"))), func(): return _S.binary(">", _S.read(_v12, "t"), _S.binary("+", _S.prop(_S.read(_v12, "s"), "at"), 0.2))), func(): return _S.invoke(_S.read(_v12, "R"), "chance", [_S.binary("*", 0.05, _S.read(_v12, "f"))]))):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v12, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v12, "s"), "lean"), 0.5)), _S.binary("*", _S.prop(_S.read(_v12, "s"), "w"), 0.15)), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v12, "s"), "h")), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.8])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v12, "R"), "range", [0.25, 0.45]), _S.prop(_S.read(_v12, "C"), 7), _S.invoke(_S.read(_v12, "R"), "range", [0.8, 1.8])])
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", _S.binary("-", _S.prop(_S.read(_v21, "chips"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v21, "i"), 0)):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "c", _S.prop(_S.read(_v22, "chips"), _S.read(_v22, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v22, "c"), "life", _S.read(_v22, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v22, "chips"), "splice", [_S.read(_v22, "i"), 1])
		_S.set_prop(_S.read(_v22, "c"), "vy", _S.binary("*", 950, _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "x", _S.binary("*", _S.prop(_S.read(_v22, "c"), "vx"), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "y", _S.binary("*", _S.prop(_S.read(_v22, "c"), "vy"), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "a", _S.binary("*", _S.prop(_S.read(_v22, "c"), "va"), _S.read(_v22, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v22, "c"), "y"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v22, "c"), "vy"), 0))):
			(_S.last([_S.set_prop(_S.read(_v22, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v22, "c"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v22, "c"), "vx", 0.6, "*=", false), _S.set_prop(_S.read(_v22, "c"), "va", 0.5, "*=", false)]) if _S.truth(_S.binary(">", _S.prop(_S.read(_v22, "c"), "vy"), 120)) else _S.last([_S.set_prop(_S.read(_v22, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v22, "c"), "vy", _S.set_prop(_S.read(_v22, "c"), "vx", _S.set_prop(_S.read(_v22, "c"), "va", 0, "=", false), "=", false), "=", false)]))
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_reach = _S.read(_parent,"reach")
	var _n_G = _S.read(_parent,"G")
	var _n_S = _S.read(_parent,"S")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_run_b1 = (_S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - 0.04))/0.5),0.0,1.0)]) * _n_reach)
	var _n_fade_b2 = (1 - _S.MathFX.smooth(1.9,2.3,_n_t))
	if true:
		var _n_x_b3 = (-2)
		while _S.truth((_n_x_b3 <= _n_run_b1)):
			var _n_hot_b4 = (clampf((1 - (float((_n_run_b1 - _n_x_b3))/18)),0.0,1.0) * (1 - _S.MathFX.smooth(0.6,1.2,_n_t)))
			var _n_h_b5 = _S.MathFX.rand([_n_x_b3,31])
			_S.invoke(_n_p_b0,"dot",[_n_x_b3, 0, (_S.index_value(_n_G,3) if _S.truth((_n_hot_b4 > 0.4)) else (_S.index_value(_n_G,2) if _S.truth((_n_hot_b4 > 0.1)) else _S.index_value(_n_S,0))), _n_fade_b2])
			if _S.truth((_n_h_b5 < 0.5)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b3, 1, _S.index_value(_n_S,1), (_n_fade_b2 * 0.8)])
			if _S.truth((_n_h_b5 < 0.15)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b3, (-1), _S.index_value(_n_S,4), _n_fade_b2])
			if _S.truth((_S.binary("===",_S.binary("&",_n_x_b3,3),0) if _S.truth((_n_hot_b4 > 0.3)) else (_n_hot_b4 > 0.3))):
				_S.invoke(_n_p_b0,"glow",[_n_x_b3, 0, 6, _S.index_value(_n_G,2), (0.3 * _n_hot_b4)])
			_n_x_b3 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_grown = _S.read(_parent,"grown")
	var _n_sunk = _S.read(_parent,"sunk")
	var _n_thorn = _S.read(_parent,"thorn")
	var _n_C = _S.read(_parent,"C")
	var _n_t = _S.read(_parent,"t")
	var _n_G = _S.read(_parent,"G")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_list = _S.read(_parent,"list")
	var _n_S = _S.read(_parent,"S")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_chips = _S.read(_parent,"chips")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_list):
		var _n_s_b1 = _iter_0
		var _n_g_b2 = _S.call_value(_n_grown,[_n_s_b1])
		var _n_k_b3 = _S.call_value(_n_sunk,[_n_s_b1])
		if _S.truth(((_n_g_b2 <= 0) if _S.truth((_n_g_b2 <= 0)) else (_n_k_b3 >= 1))):
			continue
		_S.call_value(_n_thorn,[_n_p_b0, _n_s_b1, (_S.named_value(_n_s_b1,"h") * _n_g_b2), _n_C, {"white":((_n_t - _S.named_value(_n_s_b1,"at")) < 0.035),"base":((_n_k_b3 * _S.named_value(_n_s_b1,"h")) * 1.05)}])
		if _S.truth(((_n_t - _S.named_value(_n_s_b1,"at")) < 0.3)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b1,"x"), (((-_S.named_value(_n_s_b1,"h")) * 0.5) * _n_g_b2), ((_S.named_value(_n_s_b1,"h") * 0.6) + 6), _S.index_value(_n_G,2), (0.35 * (1 - (float((_n_t - _S.named_value(_n_s_b1,"at")))/0.3)))])
		var _n_lk_b4 = (clampf((float(((_n_t - _S.named_value(_n_s_b1,"at")) - 0.04))/0.18),0.0,1.0) * (1 - _n_k_b3))
		var _n_lw_b5 = (_S.named_value(_n_s_b1,"w") * 0.5)
		if _S.truth((_n_lk_b4 > 0.05)):
			for _iter_1 in _S.array([[(-1), (-2.5), 1], [1, (-0.55), 0.9], [(-1), (-1.9), 0.7]]):
				var _tuple_2 = _iter_1
				var _n_sd_b6 = _S.prop(_tuple_2,0)
				var _n_a0_b7 = _S.prop(_tuple_2,1)
				var _n_sz_b8 = _S.prop(_tuple_2,2)
				var _n_la_b9 = ((_n_a0_b7 + ((_n_sd_b6 * 0.25) * (1 - _n_lk_b4))) + (sin(((_n_t * 4) + _S.named_value(_n_s_b1,"x"))) * 0.06))
				var _n_L_b10 = (((5 + (_S.named_value(_n_s_b1,"w") * 0.45)) * _n_sz_b8) * _n_lk_b4)
				_S.call_value(_n_drawLeaf,[_n_p_b0, ((_S.named_value(_n_s_b1,"x") + (_n_sd_b6 * _n_lw_b5)) + ((cos(_n_la_b9) * _n_L_b10) * 0.5)), ((-1) + ((sin(_n_la_b9) * _n_L_b10) * 0.5)), _n_L_b10, (1.4 + ((_S.named_value(_n_s_b1,"w") * 0.1) * _n_sz_b8)), _n_la_b9, 0.35, [_S.index_value(_n_G,0), _S.index_value(_n_G,1), _S.index_value(_n_G,2), _S.index_value(_n_G,3)]])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b1,"x"), (-2), (_S.named_value(_n_s_b1,"w") + 6), _S.index_value(_n_G,2), (0.18 * _n_lk_b4)])
	for _iter_3 in _S.array(_n_chips):
		var _n_c_b11 = _iter_3
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_c_b11,"x"), _S.named_value(_n_c_b11,"y"), _S.named_value(_n_c_b11,"s"), _S.named_value(_n_c_b11,"a"), _S.named_value(_n_c_b11,"pts"), _n_S, minf(1,(float(_S.named_value(_n_c_b11,"life"))/0.25))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
