@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/heal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f4":"heal_petal"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "recolor", _S.import_value("fx/holy/_lib.js", "recolor"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "heart", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Heal"}, {"desc": "Petals of light bloom under the feet, a hoop of light rises up the body restoring its colour and leaving sparkles, and motes spiral up and pop into tiny hearts."}, {"tags": ["holy", "heal", "restore", "buff", "petals", "hearts", "character", "one-shot"]}, {"size": [80, 104]}, {"origin": [40, 92]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3d2027", "#7d3f35", "#c97a4a", "#f2b46a", "#ffd994", "#fff0cf", "#fffaf2", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HURT", _S.merge([{"turn": 0.8}, {"crouch": 5}, {"lean": 3}, {"hy": 1}, {"fx": 1}, {"fy": _S.unary("-", 21)}, {"bx": 7}, {"by": _S.unary("-", 15)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "UP", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.3), _S.read(_e, "HURT")], [0.16, _S.merge([_S.read(_e, "HURT"), {"crouch": 6}])], [0.5, _S.merge([_S.read(_e, "HURT"), {"crouch": 3}, {"lean": 1}, {"hy": 0}])], [0.78, _S.read(_e, "UP")], [1.2, _S.merge([_S.read(_e, "UP"), {"crouch": 0}, {"fy": _S.unary("-", 30)}, {"by": _S.unary("-", 30)}, {"hy": 0}])], [1.9, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "NP", 8)
	_S.define(_e, "PR", 16)
	_S.define(_e, "LIFT0", 0.16)
	_S.define(_e, "LIFT1", 0.74)
	_S.define(_e, "TOPY", _S.unary("-", 43))
	_S.define(_e, "HEART", [".#.#.", "#####", ".###.", "..#.."])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_X_b5 = (floori(_n_x_b1+0.5) - 2)
	var _n_Y_b6 = (floori(_n_y_b2+0.5) - 2)
	var _n_at_b7 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f1")
	if true:
		var _n_j_b8 = (-1)
		while _S.truth((_n_j_b8 <= 4)):
			if true:
				var _n_i_b9 = (-1)
				while _S.truth((_n_i_b9 <= 5)):
					if _S.truth(_S.call_value(_n_at_b7,[_n_i_b9, _n_j_b8])):
						_S.invoke(_n_p_b0,"dot",[(_n_X_b5 + _n_i_b9), (_n_Y_b6 + _n_j_b8), (_n_WHITE if _S.truth((_S.binary("===",_n_j_b8,1) if _S.truth(_S.binary("===",_n_i_b9,1)) else _S.binary("===",_n_i_b9,1))) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_j_b8 >= 2)) else _S.index_value(_n_C_b3,6))), _n_a_b4])
					else:
						if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_at_b7,[(_n_i_b9 - 1), _n_j_b8]),func():return _S.call_value(_n_at_b7,[(_n_i_b9 + 1), _n_j_b8])),func():return _S.call_value(_n_at_b7,[_n_i_b9, (_n_j_b8 - 1)])),func():return _S.call_value(_n_at_b7,[_n_i_b9, (_n_j_b8 + 1)]))):
							_S.invoke(_n_p_b0,"dot",[(_n_X_b5 + _n_i_b9), (_n_Y_b6 + _n_j_b8), _S.index_value(_n_C_b3,3), (_n_a_b4 * 0.9)])
					_n_i_b9 += 1.0
			_n_j_b8 += 1.0
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 6, _S.index_value(_n_C_b3,5), (0.4 * _n_a_b4)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_HEART = _S.read(_parent,"HEART")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.binary("===",_S.index_value(_S.index_value(_n_HEART,_n_j_b1),_n_i_b0),"#") if _S.truth(((_n_i_b0 < 5) if _S.truth(((_n_i_b0 >= 0) if _S.truth(((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0))) else ((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0)))) else ((_n_i_b0 >= 0) if _S.truth(((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0))) else ((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0))))) else ((_n_i_b0 < 5) if _S.truth(((_n_i_b0 >= 0) if _S.truth(((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0))) else ((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0)))) else ((_n_i_b0 >= 0) if _S.truth(((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0))) else ((_n_j_b1 < 4) if _S.truth((_n_j_b1 >= 0)) else (_n_j_b1 >= 0)))))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "bloom", _S.function_value(_e, "_f3"))
	_S.define(_e, "petal", _S.function_value(_e, "_f4"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f6"))
	_S.define(_e, "riders", _S.function_value(_e, "_f10"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f12")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	for _v14 in _S.array(_S.prop(_S.read(_e, "S"), "edge")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.invoke(_S.logical("??", _S.invoke(_S.read(_v15, "rows"), "get", [_S.read(_v15, "y")]), func(): return _S.invoke(_S.invoke(_S.read(_v15, "rows"), "set", [_S.read(_v15, "y"), []]), "get", [_S.read(_v15, "y")])), "push", [_S.read(_v15, "x")])
	_S.define(_e, "petals", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NP")}]), _S.function_value(_e, "_f13")]))
	_S.define(_e, "motes", [])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "k"), _S.read(_v17, "NP"))):
		_S.invoke(_S.read(_v17, "motes"), "push", [_S.merge([{"t0": _S.binary("+", 0.2, _S.binary("*", _S.read(_v17, "k"), 0.05))}, {"th0": _S.prop(_S.prop(_S.read(_v17, "petals"), _S.read(_v17, "k")), "a")}, {"r0": _S.binary("*", _S.read(_v17, "PR"), 0.9)}, {"y0": _S.unary("-", 1)}, {"w": _S.binary("*", 4.2, (1 if _S.truth(_S.binary("%", _S.read(_v17, "k"), 2)) else _S.unary("-", 1)))}, {"v": _S.invoke(_S.read(_v17, "R"), "range", [46, 58])}, {"life": _S.invoke(_S.read(_v17, "R"), "range", [0.75, 0.95])}, {"kind": _S.binary("%", _S.read(_v17, "k"), 2)}])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "k", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "k"), 8)):
		_S.invoke(_S.read(_v18, "motes"), "push", [_S.merge([{"t0": _S.binary("+", _S.read(_v18, "LIFT1"), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.06]))}, {"th0": _S.binary("*", _S.binary("/", _S.read(_v18, "k"), 8), _S.read(_v18, "TAU"))}, {"r0": _S.invoke(_S.read(_v18, "R"), "range", [12, 18])}, {"y0": _S.binary("+", _S.read(_v18, "TOPY"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 2), 4]))}, {"w": _S.binary("*", 3.6, (1 if _S.truth(_S.binary("%", _S.read(_v18, "k"), 2)) else _S.unary("-", 1)))}, {"v": _S.invoke(_S.read(_v18, "R"), "range", [14, 34])}, {"life": _S.invoke(_S.read(_v18, "R"), "range", [0.35, 0.6])}, {"kind": _S.binary("%", _S.binary("+", _S.read(_v18, "k"), 1), 2)}])])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "k", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "lastRow", 1)
	_S.define(_e, "hoopY", _S.function_value(_e, "_f14"))
	_S.define(_e, "hoopR", _S.function_value(_e, "_f15"))
	return _S.merge([{"update": _S.function_value(_e, "_f16")}, {"drawBack": _S.function_value(_e, "_f17")}, {"draw": _S.function_value(_e, "_f18")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_petals = _S.read(_parent,"petals")
	var _n_ease = _S.read(_parent,"ease")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_pe_b2 = _S.index_value(_n_petals,_n_k_b0)
	return (_S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_tt_b1,_S.named_value(_n_pe_b2,"t0"),(_S.named_value(_n_pe_b2,"t0") + 0.3)), 1.8]) * (1 - _S.invoke(_n_ease,"inBack",[_S.MathFX.seg(_n_tt_b1,(1.25 + (_n_k_b0 * 0.02)),(1.6 + (_n_k_b0 * 0.02))), 1.4])))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_petals = _S.read(_parent,"petals")
	var _n_t = _S.read(_parent,"t")
	var _n_bloom = _S.read(_parent,"bloom")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_back_b2 = _S.arg(_args,2)
	var _n_pe_b3 = _S.index_value(_n_petals,_n_k_b1)
	var _n_g_b4 = (_S.named_value(_n_pe_b3,"a") + (_n_t * 0.4))
	var _n_near_b5 = (sin(_n_g_b4) >= 0)
	var _n_b_b6 = _S.call_value(_n_bloom,[_n_k_b1, _n_t])
	if _S.truth((_S.binary("===",_n_near_b5,_n_back_b2) if _S.truth(_S.binary("===",_n_near_b5,_n_back_b2)) else (_n_b_b6 <= 0.02))):
		return null
	var _n_ca_b7 = cos(_n_g_b4)
	var _n_sa_b8 = sin(_n_g_b4)
	var _n_rb_b9 = 6
	var _n_rt_b10 = (_n_rb_b9 + (9 * minf(1.2,_n_b_b6)))
	var _n_h_b11 = ((7 if _S.truth(fmod(_n_k_b1,2)) else 9) * _n_b_b6)
	var _n_bx_b12 = (_n_ca_b7 * _n_rb_b9)
	var _n_by_b13 = ((_n_sa_b8 * _n_rb_b9) * _n_SY)
	var _n_tx_b14 = (_n_ca_b7 * _n_rt_b10)
	var _n_ty_b15 = (((_n_sa_b8 * _n_rt_b10) * _n_SY) - _n_h_b11)
	var _n_L_b16 = _S.Bridge.hypot([(_n_tx_b14 - _n_bx_b12), (_n_ty_b15 - _n_by_b13)])
	if _S.truth((_n_L_b16 < 1.5)):
		return null
	var _n_ux_b17 = (float((_n_tx_b14 - _n_bx_b12))/_n_L_b16)
	var _n_uy_b18 = (float((_n_ty_b15 - _n_by_b13))/_n_L_b16)
	var _n_W_b19 = ((_S.named_value(_n_pe_b3,"w") * minf(1,_n_b_b6)) * (0.35 + (0.65 * absf(_n_sa_b8))))
	var _n_pad_b20 = (_n_W_b19 + 1)
	_S.invoke(_n_p_b0,"each",[(minf(_n_bx_b12,_n_tx_b14) - _n_pad_b20), (minf(_n_by_b13,_n_ty_b15) - _n_pad_b20), (maxf(_n_bx_b12,_n_tx_b14) + _n_pad_b20), (maxf(_n_by_b13,_n_ty_b15) + _n_pad_b20), _S.function_value(_S.capture(_parent,{"bx":_n_bx_b12,"by":_n_by_b13,"ux":_n_ux_b17,"uy":_n_uy_b18,"L":_n_L_b16,"W":_n_W_b19,"p":_n_p_b0,"back":_n_back_b2,"this":_this}),"_f5")])
	_S.invoke(_n_p_b0,"glow",[_n_tx_b14, _n_ty_b15, 5, _S.index_value(_n_C,5), (0.35 * minf(1,_n_b_b6))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_ux = _S.read(_parent,"ux")
	var _n_uy = _S.read(_parent,"uy")
	var _n_L = _S.read(_parent,"L")
	var _n_W = _S.read(_parent,"W")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_back = _S.read(_parent,"back")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_dx_b4 = (_n_x_b0 - _n_bx)
	var _n_dy_b5 = (_n_y_b1 - _n_by)
	var _n_u_b6 = (float(((_n_dx_b4 * _n_ux) + (_n_dy_b5 * _n_uy)))/_n_L)
	if _S.truth(((_n_u_b6 < 0) if _S.truth((_n_u_b6 < 0)) else (_n_u_b6 > 1))):
		return null
	var _n_hw_b7 = ((_n_W * pow(sin((PI * pow(_n_u_b6,0.6))),0.7)) + 0.2)
	var _n_v_b8 = (float(absf((((-_n_dx_b4) * _n_uy) + (_n_dy_b5 * _n_ux))))/_n_hw_b7)
	if _S.truth((_n_v_b8 > 1)):
		return null
	if _S.truth((_n_u_b6 > 0.9)):
		return _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, _n_WHITE, 1])
	if _S.truth((_n_v_b8 > 0.7)):
		return _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,3) if _S.truth((_n_u_b6 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b6 < 0.7)) else _S.index_value(_n_C,6))), 1])
	if _S.truth(((_n_u_b6 < 0.85) if _S.truth(((_n_u_b6 > 0.15) if _S.truth((_n_v_b8 < 0.2)) else (_n_v_b8 < 0.2))) else ((_n_u_b6 > 0.15) if _S.truth((_n_v_b8 < 0.2)) else (_n_v_b8 < 0.2)))):
		return _S.invoke(_n_p,"put",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,5) if _S.truth((_n_u_b6 < 0.55)) else _S.index_value(_n_C,6)), (0.75 if _S.truth(_n_back) else 0.85)])
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,3) if _S.truth((_n_u_b6 < 0.45)) else _S.index_value(_n_C,4)), (0.6 if _S.truth(_n_back) else 0.45)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LIFT0 = _S.read(_parent,"LIFT0")
	var _n_LIFT1 = _S.read(_parent,"LIFT1")
	var _n_hoopY = _S.read(_parent,"hoopY")
	var _n_hoopR = _S.read(_parent,"hoopR")
	var _n_SY = _S.read(_parent,"SY")
	var _n_oval = _S.read(_parent,"oval")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	if _S.truth(((_n_t < _n_LIFT0) if _S.truth((_n_t < _n_LIFT0)) else (_n_t > (_n_LIFT1 + 0.12)))):
		return null
	var _n_y_b2 = _S.call_value(_n_hoopY,[_n_t])
	var _n_r_b3 = (_S.call_value(_n_hoopR,[_n_t]) * ((1 - (float((_n_t - _n_LIFT1))/0.12)) if _S.truth((_n_t > _n_LIFT1)) else 1))
	var _n_keep_b4 = (_S.function_value(_S.capture(_parent,{"this":_this}),"_f7") if _S.truth(_n_back_b1) else _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"))
	_S.call_value(_n_oval,[_n_p_b0, 0, _n_y_b2, _n_r_b3, (_n_r_b3 * _n_SY), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), (0.8 if _S.truth(_n_back_b1) else 1), _n_keep_b4])
	if _S.truth(not _S.truth(_n_back_b1)):
		_S.call_value(_n_oval,[_n_p_b0, 0, (_n_y_b2 + 1), (_n_r_b3 - 0.5), (_n_r_b3 * _n_SY), _S.index_value(_n_C,4), 1, _n_keep_b4])
		if true:
			var _n_i_b5 = (-2)
			while _S.truth((_n_i_b5 <= 2)):
				_S.invoke(_n_p_b0,"glow",[((_n_i_b5 * _n_r_b3) * 0.45), _n_y_b2, 8, _S.index_value(_n_C,5), 0.32])
				_n_i_b5 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((sin(_n_g_b0) > 0.5)) else _S.index_value(_n_C,6))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_heart = _S.read(_parent,"heart")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array(_n_motes):
		var _n_m_b2 = _iter_0
		var _n_a_b3 = (_n_t - _S.named_value(_n_m_b2,"t0"))
		if _S.truth((_n_a_b3 < 0)):
			continue
		var _n_at_b4 = _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"this":_this}),"_f11")
		if _S.truth((_n_a_b3 < _S.named_value(_n_m_b2,"life"))):
			var _tuple_1 = _S.call_value(_n_at_b4,[_n_a_b3])
			var _n_x_b9 = _S.prop(_tuple_1,0)
			var _n_y_b10 = _S.prop(_tuple_1,1)
			var _n_z_b11 = _S.prop(_tuple_1,2)
			if _S.truth(_S.binary("!==",(_n_z_b11 < 0),_n_back_b1)):
				continue
			if true:
				var _n_j_b12 = 0
				while _S.truth((_n_j_b12 < 7)):
					var _n_aj_b13 = (_n_a_b3 - (_n_j_b12 * 0.03))
					if _S.truth((_n_aj_b13 < 0)):
						break
					var _tuple_2 = _S.call_value(_n_at_b4,[_n_aj_b13])
					var _n_tx_b14 = _S.prop(_tuple_2,0)
					var _n_ty_b15 = _S.prop(_tuple_2,1)
					var _n_tz_b16 = _S.prop(_tuple_2,2)
					if _S.truth(_S.binary("!==",(_n_tz_b16 < 0),_n_back_b1)):
						_n_j_b12 += 1.0
						continue
					_S.invoke(_n_p_b0,"dot",[_n_tx_b14, _n_ty_b15, (_n_WHITE if _S.truth(_S.binary("===",_n_j_b12,0)) else (_S.index_value(_n_C,6) if _S.truth((_n_j_b12 < 3)) else _S.index_value(_n_C,5))), ((1 - (float(_n_j_b12)/7)) * (0.6 if _S.truth(_n_back_b1) else 1))])
					_n_j_b12 += 1.0
			_S.invoke(_n_p_b0,"glow",[_n_x_b9, _n_y_b10, 4, _S.index_value(_n_C,5), (0.2 if _S.truth(_n_back_b1) else 0.4)])
			continue
		var _n_u_b5 = (float((_n_a_b3 - _S.named_value(_n_m_b2,"life")))/0.36)
		if _S.truth(((_n_u_b5 >= 1) if _S.truth((_n_u_b5 >= 1)) else _n_back_b1)):
			continue
		var _tuple_3 = _S.call_value(_n_at_b4,[_S.named_value(_n_m_b2,"life")])
		var _n_x_b6 = _S.prop(_tuple_3,0)
		var _n_y_b7 = _S.prop(_tuple_3,1)
		var _n_k_b8 = (1 - _S.MathFX.smooth(0.5,1,_n_u_b5))
		if _S.truth((_n_u_b5 < 0.12)):
			_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b6, _n_y_b7, 3, _n_WHITE, _S.index_value(_n_C,6), 0.5])
		else:
			if _S.truth(_S.named_value(_n_m_b2,"kind")):
				_S.call_value(_n_heart,[_n_p_b0, _n_x_b6, (_n_y_b7 - (_n_u_b5 * 6)), _n_C, _n_k_b8])
			else:
				_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b6, (_n_y_b7 - (_n_u_b5 * 5)), (1 + ((2 * _n_k_b8) * (0.7 + (0.3 * sin((_n_a_b3 * 30)))))), _n_WHITE, _S.index_value(_n_C,5), (0.45 * _n_k_b8)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_aa_b0 = _S.arg(_args,0)
	var _n_th_b1 = (_S.named_value(_n_m,"th0") + (_S.named_value(_n_m,"w") * _n_aa_b0))
	var _n_r_b2 = (_S.named_value(_n_m,"r0") * (1 - (0.45 * (float(_n_aa_b0)/_S.named_value(_n_m,"life")))))
	return [(cos(_n_th_b1) * _n_r_b2), (_S.named_value(_n_m,"y0") - (_S.named_value(_n_m,"v") * _n_aa_b0)), sin(_n_th_b1)]
	return null

static func _f12(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_NP = _S.read(_parent,"NP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_k_b1)/_n_NP) * _n_TAU) + 0.2),"t0":(0.02 + (fmod((_n_k_b1 * 3),_n_NP) * 0.035)),"w":_S.invoke(_n_R,"range",[4.2, 5.2])}
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LIFT0 = _S.read(_parent,"LIFT0")
	var _n_LIFT1 = _S.read(_parent,"LIFT1")
	var _n_tt_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(0,_n_TOPY,_S.invoke(_n_ease,"inOutSine",[_S.MathFX.seg(_n_tt_b0,_n_LIFT0,_n_LIFT1)]))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_PR = _S.read(_parent,"PR")
	var _n_LIFT0 = _S.read(_parent,"LIFT0")
	var _n_LIFT1 = _S.read(_parent,"LIFT1")
	var _n_tt_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(_n_PR,12,_S.MathFX.seg(_n_tt_b0,_n_LIFT0,_n_LIFT1))
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LIFT0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT1")))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "Y", _S.invoke(_S.read(_v19, "Math"), "round", [_S.call_value(_S.read(_v19, "hoopY"), [_S.read(_v19, "t")])]))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "y", _S.read(_v20, "lastRow"))
		while _S.truth(_S.binary(">", _S.read(_v20, "y"), _S.read(_v20, "Y"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "xs", _S.invoke(_S.read(_v21, "rows"), "get", [_S.read(_v21, "y")]))
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v21, "xs")), func(): return _S.unary("!", _S.invoke(_S.read(_v21, "R"), "chance", [0.45])))):
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "y", 1, "-=", true)
				continue
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "STAR"), _S.binary("+", _S.invoke(_S.read(_v21, "R"), "pick", [_S.read(_v21, "xs")]), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1), 1]), 2)), _S.read(_v21, "y"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [4, 12])), _S.invoke(_S.read(_v21, "R"), "range", [0.3, 0.55]), (_S.read(_v21, "WHITE") if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 6)), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "y", 1, "-=", true)
		_S.write(_v19, "lastRow", _S.invoke(_S.read(_v19, "Math"), "min", [_S.read(_v19, "lastRow"), _S.read(_v19, "Y")]), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT1")))):
		var _v22 = _S.scope(_e)
		_S.write(_v22, "burst", true, "=", false)
		_S.invoke(_S.read(_v22, "lights"), "add", [0, _S.read(_v22, "TOPY"), 26, _S.prop(_S.read(_v22, "C"), 5), 0.55, 0.3])
		_S.invoke(_S.read(_v22, "lights"), "add", [0, _S.read(_v22, "TOPY"), 10, _S.read(_v22, "WHITE"), 0.45, 0.08])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_petal = _S.read(_parent,"petal")
	var _n_NP = _S.read(_parent,"NP")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_ps = _S.read(_parent,"ps")
	var _n_riders = _S.read(_parent,"riders")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pool_b1 = (_S.MathFX.smooth(0,0.2,_n_t) * (1 - _S.MathFX.smooth(1.3,1.75,_n_t)))
	if _S.truth((_n_pool_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-2), 30, _S.index_value(_n_C,4), (0.3 * _n_pool_b1)])
	if true:
		var _n_k_b2 = 0
		while _S.truth((_n_k_b2 < _n_NP)):
			_S.call_value(_n_petal,[_n_p_b0, _n_k_b2, true])
			_n_k_b2 += 1.0
	_S.call_value(_n_hoop,[_n_p_b0, true])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.call_value(_n_riders,[_n_p_b0, true])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LIFT1 = _S.read(_parent,"LIFT1")
	var _n_LIFT0 = _S.read(_parent,"LIFT0")
	var _n_hoopY = _S.read(_parent,"hoopY")
	var _n_A = _S.read(_parent,"A")
	var _n_recolor = _S.read(_parent,"recolor")
	var _n_C = _S.read(_parent,"C")
	var _n_petal = _S.read(_parent,"petal")
	var _n_NP = _S.read(_parent,"NP")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_riders = _S.read(_parent,"riders")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_drain_b1 = _S.MathFX.smooth(0,0.08,_n_t)
	if _S.truth((_n_t < (_n_LIFT1 + 0.35))):
		var _n_Y_b2 = (1 if _S.truth((_n_t < _n_LIFT0)) else _S.call_value(_n_hoopY,[_n_t]))
		var _n_done_b3 = (_n_t >= _n_LIFT1)
		_S.call_value(_n_recolor,[_n_p_b0, _n_A, _S.function_value(_S.capture(_parent,{"Y":_n_Y_b2,"done":_n_done_b3,"drain":_n_drain_b1,"this":_this}),"_f19")])
		if _S.truth((not _S.truth(_n_done_b3) if _S.truth((_n_t > _n_LIFT0)) else (_n_t > _n_LIFT0))):
			_S.invoke(_n_p_b0,"glow",[0, _n_Y_b2, 18, _S.index_value(_n_C,5), 0.35])
	if true:
		var _n_k_b4 = 0
		while _S.truth((_n_k_b4 < _n_NP)):
			_S.call_value(_n_petal,[_n_p_b0, _n_k_b4, false])
			_n_k_b4 += 1.0
	_S.call_value(_n_hoop,[_n_p_b0, false])
	if _S.truth(((_n_t < (_n_LIFT1 + 0.25)) if _S.truth((_n_t >= _n_LIFT1)) else (_n_t >= _n_LIFT1))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, _n_TOPY, (8 * (1 - (float((_n_t - _n_LIFT1))/0.25))), _n_WHITE, _S.index_value(_n_C,5), 0.6])
	_S.call_value(_n_riders,[_n_p_b0, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_done = _S.read(_parent,"done")
	var _n_drain = _S.read(_parent,"drain")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_t = _S.read(_parent,"t")
	var _n_LIFT1 = _S.read(_parent,"LIFT1")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_d_b3 = (_n_y_b2 - _n_Y)
	if _S.truth(((_n_d_b3 < (-0.5)) if _S.truth(not _S.truth(_n_done)) else not _S.truth(_n_done))):
		var _n_l_b5 = (_S.ColorFX.luma(_n_c_b0) * 0.88)
		return _S.ColorFX.mix(_n_c_b0,_S.ColorFX.rgb((_n_l_b5 * 236),(_n_l_b5 * 226),(_n_l_b5 * 222)),(0.68 * _n_drain))
	if _S.truth(((_n_d_b3 < 1) if _S.truth(not _S.truth(_n_done)) else not _S.truth(_n_done))):
		return _n_WHITE
	if _S.truth(((_n_d_b3 < 2.5) if _S.truth(not _S.truth(_n_done)) else not _S.truth(_n_done))):
		return _S.index_value(_n_C,6)
	var _n_k_b4 = ((0.45 * (1 - _S.MathFX.seg(_n_t,_n_LIFT1,(_n_LIFT1 + 0.35)))) if _S.truth(_n_done) else (0.5 * exp((float((-(_n_d_b3 - 2.5)))/5))))
	return (_S.ColorFX.mix(_n_c_b0,_S.index_value(_n_C,5),_n_k_b4) if _S.truth((_n_k_b4 > 0.05)) else 0)
	return null
