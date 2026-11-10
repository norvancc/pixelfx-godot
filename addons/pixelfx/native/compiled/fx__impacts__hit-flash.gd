@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/hit-flash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "red", _S.import_value("core/index.js", "red"))
	_S.define(_e, "green", _S.import_value("core/index.js", "green"))
	_S.define(_e, "blue", _S.import_value("core/index.js", "blue"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hit flash"}, {"desc": "The character takes damage: a white frame, then their own colors flushed red and blinking white, cooling off, while comic hit lines jab in at them."}, {"tags": ["impact", "hit", "damage", "hurt", "flash", "blink", "actor", "comic", "one-shot"]}, {"size": [80, 64]}, {"origin": [40, 54]}, {"duration": 0.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#14040a", "#3a0a14", "#6a101c", "#a01824", "#d42a30", "#ff5a50", "#ff9a8a"]}, {"lines": 7}, {"side": 1}, {"seed": 17}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BLOWN", _S.merge([{"x": _S.unary("-", 5)}, {"crouch": 4}, {"lean": _S.unary("-", 5)}, {"hx": _S.unary("-", 1)}, {"fx": 8}, {"fy": _S.unary("-", 33)}, {"bx": _S.unary("-", 11)}, {"by": _S.unary("-", 27)}, {"ffx": 9}, {"ffy": _S.unary("-", 7)}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.26), _S.merge([_S.read(_e, "READY"), {"x": 0}])], [0, _S.read(_e, "BLOWN"), "snap"], [0.16, _S.merge([_S.read(_e, "BLOWN"), {"x": _S.unary("-", 8)}, {"crouch": 5}])], [0.42, _S.merge([_S.read(_e, "BLOWN"), {"x": _S.unary("-", 8)}, {"crouch": 5}, {"lean": _S.unary("-", 2)}, {"fx": 9}, {"fy": _S.unary("-", 22)}, {"bx": 6}, {"by": _S.unary("-", 20)}, {"ffy": _S.unary("-", 4)}])], [0.86, _S.merge([_S.read(_e, "READY"), {"x": 0}])]]}, {"hits": [_S.merge([{"t": 0}, {"stop": 0.07}, {"shake": 0.14}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "BEATS", [[0.025, "white"], [0.058, "white2"], [0.125, "red"], [0.158, "rim"], [0.36, "cool"]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "M", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "PX", _S.prop(_S.read(_e, "A"), "pixels"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "side"))
	var _v0 = _S.prop(_S.read(_e, "A"), "chest")
	_S.define(_e, "cx", _S.prop(_v0, 0))
	_S.define(_e, "cy", _S.prop(_v0, 1))
	_S.define(_e, "hx", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "S"), 12)))
	_S.define(_e, "hy", _S.binary("-", _S.read(_e, "cy"), 5))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 34, _S.read(_e, "WHITE"), 0.6, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "cx"), _S.read(_e, "cy"), 30, _S.prop(_S.read(_e, "C"), 4), 0.5, 0.35])
	_S.define(_e, "reds", _S.construct(_S.read(_e, "Uint32Array"), [_S.prop(_S.read(_e, "PX"), "length")]))
	_S.define(_e, "tints", _S.construct(_S.read(_e, "Uint32Array"), [_S.prop(_S.read(_e, "PX"), "length")]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "PX"), "length"))):
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")))):
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
			continue
		_S.define(_v2, "l", _S.call_value(_S.read(_v2, "luma"), [_S.binary("|", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")), 4278190080)]))
		_S.set_prop(_S.read(_v2, "reds"), _S.read(_v2, "i"), _S.prop(_S.read(_v2, "C"), _S.call_value(_S.read(_v2, "clamp"), [_S.invoke(_S.read(_v2, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.read(_v2, "l"), 5))]), 2, 6])), "=", false)
		_S.set_prop(_S.read(_v2, "tints"), _S.read(_v2, "i"), _S.call_value(_S.read(_v2, "mix"), [_S.binary("|", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")), 4278190080), _S.prop(_S.read(_v2, "C"), 4), 0.55]), "=", false)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "lines", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "o"), "lines")}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "beat", _S.function_value(_e, "_f2"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_o = _S.read(_parent,"o")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((-PI) - 0.3) + ((float((_n_i_b1 + _S.invoke(_n_R,"range",[0.25, 0.75])))/_S.named_value(_n_o,"lines")) * (PI + 0.6)))
	return {"a":_n_a_b2,"d":_S.invoke(_n_R,"range",[15, 19]),"len":_S.invoke(_n_R,"range",[6, 9]),"t0":_S.invoke(_n_R,"range",[0, 0.04])}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BEATS = _S.read(_parent,"BEATS")
	for _iter_0 in _S.array(_n_BEATS):
		var _tuple_1 = _iter_0
		var _n_end_b0 = _S.prop(_tuple_1,0)
		var _n_b_b1 = _S.prop(_tuple_1,1)
		if _S.truth((_n_t < _n_end_b0)):
			return _n_b_b1
	return null
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_M = _S.read(_parent,"M")
	var _n_A = _S.read(_parent,"A")
	var _n_this = _S.read(_parent,"this")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_color_b1 = _S.arg(_args,1)
	return _S.invoke(_n_p_b0,"mask",[_n_M, _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), _S.function_value(_S.capture(_parent,{"color":_n_color_b1,"this":_n_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_color = _S.read(_parent,"color")
	var _n_M = _S.read(_parent,"M")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	return _S.call_value(_n_color,[((_n_my_b1 * _S.named_value(_n_M,"w")) + _n_mx_b0)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_beat = _S.read(_parent,"beat")
	var _n_body = _S.read(_parent,"body")
	var _n_M = _S.read(_parent,"M")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_t = _S.read(_parent,"t")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_ease = _S.read(_parent,"ease")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_lines = _S.read(_parent,"lines")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.call_value(_n_beat,[])
	if _S.truth((_S.binary("===",_n_b_b1,"white") if _S.truth(_S.binary("===",_n_b_b1,"white")) else _S.binary("===",_n_b_b1,"white2"))):
		_S.call_value(_n_body,[_n_p_b0, _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
		_S.invoke(_n_p_b0,"outline",[_n_M, _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), (_S.index_value(_n_C,6) if _S.truth(_S.binary("===",_n_b_b1,"white")) else _S.index_value(_n_C,5))])
	else:
		if _S.truth(_S.binary("===",_n_b_b1,"red")):
			_S.call_value(_n_body,[_n_p_b0, _S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
			_S.invoke(_n_p_b0,"outline",[_n_M, _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), _S.index_value(_n_C,5)])
		else:
			if _S.truth(_S.binary("===",_n_b_b1,"rim")):
				_S.invoke(_n_p_b0,"outline",[_n_M, _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), _n_WHITE])
			else:
				if _S.truth(_S.binary("===",_n_b_b1,"cool")):
					var _n_k_b3 = (1 - (float((_n_t - 0.158))/(0.36 - 0.158)))
					_S.call_value(_n_body,[_n_p_b0, _S.function_value(_S.capture(_parent,{"k":_n_k_b3,"this":_this}),"_f9")])
					if _S.truth((_n_k_b3 > 0.5)):
						_S.invoke(_n_p_b0,"outline",[_n_M, _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), _S.index_value(_n_C,4), ((_n_k_b3 - 0.5) * 2)])
	if _S.truth((_n_t < 0.07)):
		var _n_big_b4 = (1 if _S.truth((_n_t < 0.035)) else 1.3)
		var _n_k_b5 = (0 if _S.truth((_n_t < 0.035)) else 1)
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < 8)):
				var _n_a_b7 = (((float(_n_i_b6)/8) * _n_TAU) + 0.2)
				var _n_L_b8 = ((4 if _S.truth(fmod(_n_i_b6,2)) else 9) * _n_big_b4)
				_S.invoke(_n_p_b0,"line",[(_n_hx + (((cos(_n_a_b7) * _n_L_b8) * 0.45) * _n_k_b5)), (_n_hy + (((sin(_n_a_b7) * _n_L_b8) * 0.45) * _n_k_b5)), (_n_hx + (cos(_n_a_b7) * _n_L_b8)), (_n_hy + (sin(_n_a_b7) * _n_L_b8)), _S.function_value(_S.capture(_parent,{"k":_n_k_b5,"this":_this}),"_f10")])
				_n_i_b6 += 1.0
		if _S.truth(not _S.truth(_n_k_b5)):
			for _iter_0 in _S.array([[0, 0], [1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
				var _tuple_1 = _iter_0
				var _n_dx_b9 = _S.prop(_tuple_1,0)
				var _n_dy_b10 = _S.prop(_tuple_1,1)
				_S.invoke(_n_p_b0,"px",[(_n_hx + _n_dx_b9), (_n_hy + _n_dy_b10), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_hx, _n_hy, 14, _S.index_value(_n_C,6), (0.5 * (1 - (float(_n_t)/0.07)))])
	for _iter_2 in _S.array(_n_lines):
		var _n_l_b11 = _iter_2
		var _n_u_b12 = (float((_n_t - _S.named_value(_n_l_b11,"t0")))/0.16)
		if _S.truth(((_n_u_b12 < 0) if _S.truth((_n_u_b12 < 0)) else (_n_u_b12 >= 1))):
			continue
		var _n_d0_b13 = (_S.named_value(_n_l_b11,"d") - (6 * _S.invoke(_n_ease,"outCubic",[_n_u_b12])))
		var _n_L_b14 = (_S.named_value(_n_l_b11,"len") * (1 - _n_u_b12))
		var _n_ca_b15 = cos(_S.named_value(_n_l_b11,"a"))
		var _n_sa_b16 = (sin(_S.named_value(_n_l_b11,"a")) * 1.15)
		if _S.truth((_n_L_b14 < 1)):
			continue
		var _n_w_b17 = (float((2.8 - (1.6 * _n_u_b12)))/2)
		var _n_nx_b18 = ((-_n_sa_b16) * _n_w_b17)
		var _n_ny_b19 = (_n_ca_b15 * _n_w_b17)
		var _n_ex_b20 = (_n_cx + (_n_ca_b15 * (_n_d0_b13 + _n_L_b14)))
		var _n_ey_b21 = (_n_cy + (_n_sa_b16 * (_n_d0_b13 + _n_L_b14)))
		var _n_px0_b22 = (_n_cx + (_n_ca_b15 * _n_d0_b13))
		var _n_py0_b23 = (_n_cy + (_n_sa_b16 * _n_d0_b13))
		_S.invoke(_n_p_b0,"poly",[[[(_n_px0_b22 - _n_ca_b15), (_n_py0_b23 - _n_sa_b16)], [((_n_ex_b20 + (_n_nx_b18 * 1.5)) + _n_ca_b15), ((_n_ey_b21 + (_n_ny_b19 * 1.5)) + _n_sa_b16)], [((_n_ex_b20 - (_n_nx_b18 * 1.5)) + _n_ca_b15), ((_n_ey_b21 - (_n_ny_b19 * 1.5)) + _n_sa_b16)]], _S.index_value(_n_C,3)])
		_S.invoke(_n_p_b0,"poly",[[[_n_px0_b22, _n_py0_b23], [(_n_ex_b20 + _n_nx_b18), (_n_ey_b21 + _n_ny_b19)], [(_n_ex_b20 - _n_nx_b18), (_n_ey_b21 - _n_ny_b19)]], (_n_WHITE if _S.truth((_n_u_b12 < 0.5)) else _S.index_value(_n_C,6))])
	var _n_k_b2 = exp((float((-_n_t))/0.08))
	if _S.truth((_n_k_b2 > 0.02)):
		_S.invoke(_n_p_b0,"glow",[_n_cx, _n_cy, 26, (_n_WHITE if _S.truth((_S.binary("===",_n_b_b1,"white") if _S.truth(_S.binary("===",_n_b_b1,"white")) else _S.binary("===",_n_b_b1,"white2"))) else _S.index_value(_n_C,5)), (0.35 * _n_k_b2)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	return _n_WHITE
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_reds = _S.read(_parent,"reds")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_reds,_n_i_b0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_PX = _S.read(_parent,"PX")
	var _n_tints = _S.read(_parent,"tints")
	var _n_k = _S.read(_parent,"k")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.ColorFX.mix(_S.binary("|",_S.index_value(_n_PX,_n_i_b0),4278190080),_S.index_value(_n_tints,_n_i_b0),_n_k)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_k = _S.read(_parent,"k")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((not _S.truth(_n_k) if _S.truth((_n_u_b0 < 0.45)) else (_n_u_b0 < 0.45))) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.75)) else _S.index_value(_n_C,4)))
	return null
