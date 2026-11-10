@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/holy-pillar.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "Feathers", _S.import_value("fx/holy/_lib.js", "Feathers"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Holy pillar"}, {"desc": "Light breaks through from above: a sun opens at the top and a fan of shafts converges on the mark, pulsing, while a sigil burns on the floor; then the fan folds shut."}, {"tags": ["holy", "pillar", "light", "rays", "aoe", "sigil", "ground", "one-shot"]}, {"size": [192, 232]}, {"origin": [96, 204]}, {"duration": 3.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"shafts": 7}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TOP", _S.unary("-", 204))
	_S.define(_e, "PY", _S.unary("-", 1))
	_S.define(_e, "SUN", _S.binary("+", _S.read(_e, "TOP"), 38))
	_S.define(_e, "SY", 0.24)
	_S.define(_e, "RX", 26)
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "HIT", 0.66)
	_S.define(_e, "FOLD", 2.05)
	_S.define(_e, "SHUT", 2.45)
	_S.define(_e, "LIFT", 2.75)
	_S.define(_e, "frac", _S.function_value(_e, "_f28"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "fan", _S.function_value(_e, "_f1"))
	_S.define(_e, "sun", _S.function_value(_e, "_f2"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f6"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "N", _S.invoke(_S.read(_e, "Math"), "max", [3, _S.binary("|", _S.prop(_S.read(_e, "o"), "shafts"), 0)]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "mid", _S.binary("/", _S.binary("-", _S.read(_e, "N"), 1), 2))
	_S.define(_e, "WING", [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f15")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "feathers", _S.construct(_S.read(_e, "Feathers"), [_S.read(_e, "R"), 0]))
	_S.define(_e, "shafts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f16")]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 72}]), _S.function_value(_e, "_f17")]))
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 6)):
		_S.invoke(_S.read(_v16, "feathers"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 46), 46])}, {"y": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 150), _S.unary("-", 100)])}, {"vx": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.invoke(_S.read(_v16, "R"), "range", [0, 8])}, {"a": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.4), 0.4])}, {"len": _S.invoke(_S.read(_v16, "R"), "range", [7, 9])}, {"wid": _S.invoke(_S.read(_v16, "R"), "range", [1.9, 2.3])}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1.4, 1.7])}, {"sink": _S.invoke(_S.read(_v16, "R"), "range", [26, 36])}, {"back": _S.binary("===", _S.binary("%", _S.read(_v16, "i"), 3), 0)}, {"delay": _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v16, "HIT"), 0.1), _S.binary("*", _S.read(_v16, "i"), 0.16)), _S.invoke(_S.read(_v16, "R"), "range", [0, 0.08]))}])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.define(_e, "DMAX", _S.binary("-", _S.read(_e, "PY"), _S.read(_e, "TOP")))
	_S.define(_e, "row", _S.construct(_S.read(_e, "Float32Array"), [192]))
	_S.define(_e, "core", _S.construct(_S.read(_e, "Uint8Array"), [192]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "shut", false)
	_S.define(_e, "glinted", false)
	_S.define(_e, "angle", _S.function_value(_e, "_f18"))
	_S.define(_e, "frontD", _S.function_value(_e, "_f19"))
	_S.define(_e, "liftD", _S.function_value(_e, "_f20"))
	_S.define(_e, "fade", _S.function_value(_e, "_f21"))
	_S.define(_e, "width", _S.function_value(_e, "_f22"))
	_S.define(_e, "pulse", _S.function_value(_e, "_f23"))
	_S.define(_e, "lightAt", _S.function_value(_e, "_f24"))
	return _S.merge([{"update": _S.function_value(_e, "_f25")}, {"drawBack": _S.function_value(_e, "_f26")}, {"draw": _S.function_value(_e, "_f27")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_fade = _S.read(_parent,"fade")
	var _n_t = _S.read(_parent,"t")
	var _n_liftD = _S.read(_parent,"liftD")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_PY = _S.read(_parent,"PY")
	var _n_row = _S.read(_parent,"row")
	var _n_core = _S.read(_parent,"core")
	var _n_angle = _S.read(_parent,"angle")
	var _n_frontD = _S.read(_parent,"frontD")
	var _n_width = _S.read(_parent,"width")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_shafts = _S.read(_parent,"shafts")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_fade,[_n_t])
	if _S.truth((_n_k_b1 <= 0)):
		return null
	var _n_lift_b2 = _S.call_value(_n_liftD,[_n_t])
	if true:
		var _n_y_b3 = ceili(_n_TOP)
		while _S.truth((_n_y_b3 < _n_PY)):
			var _n_dy_b4 = (_n_PY - (_n_y_b3 + 0.5))
			_S.invoke(_n_row,"fill",[0])
			_S.invoke(_n_core,"fill",[0])
			var _n_any_b5 = false
			for _iter_0 in _S.array(_n_shafts):
				var _n_s_b6 = _iter_0
				var _n_a_b7 = _S.call_value(_n_angle,[_n_s_b6, _n_t])
				var _n_ca_b8 = cos(_n_a_b7)
				var _n_d_b9 = (float(_n_dy_b4)/_n_ca_b8)
				if _S.truth(((_n_d_b9 < _n_lift_b2) if _S.truth((_n_d_b9 < _n_lift_b2)) else (_n_d_b9 < (_S.call_value(_n_frontD,[_n_s_b6, _n_t]) - 6)))):
					continue
				var _n_xc_b10 = (tan(_n_a_b7) * _n_dy_b4)
				var _n_hw_b11 = (float((float(_S.call_value(_n_width,[_n_s_b6, _n_d_b9, _n_t]))/2))/_n_ca_b8)
				var _n_soft_b12 = (_S.MathFX.smooth((_S.call_value(_n_frontD,[_n_s_b6, _n_t]) - 6),(_S.call_value(_n_frontD,[_n_s_b6, _n_t]) + 4),_n_d_b9) * _S.MathFX.smooth(_n_lift_b2,(_n_lift_b2 + 6),_n_d_b9))
				var _n_I0_b13 = (((_S.named_value(_n_s_b6,"b") * _S.call_value(_n_pulse,[_n_s_b6, _n_d_b9, _n_t])) * _n_soft_b12) * _n_k_b1)
				if true:
					var _n_x_b15 = floori((_n_xc_b10 - _n_hw_b11))
					while _S.truth((_n_x_b15 <= ceili((_n_xc_b10 + _n_hw_b11)))):
						var _n_v_b16 = (float(((_n_x_b15 + 0.5) - _n_xc_b10))/_n_hw_b11)
						var _n_i_b17 = (_n_x_b15 + 96)
						if _S.truth((((_n_i_b17 < 0) if _S.truth((_n_i_b17 < 0)) else (_n_i_b17 >= 192)) if _S.truth(((_n_i_b17 < 0) if _S.truth((_n_i_b17 < 0)) else (_n_i_b17 >= 192))) else (absf(_n_v_b16) >= 1))):
							_n_x_b15 += 1.0
							continue
						_S.set_prop(_n_row,_n_i_b17,(_n_I0_b13 * pow((1 - (_n_v_b16 * _n_v_b16)),1.3)),"+=")
						_n_any_b5 = true
						_n_x_b15 += 1.0
				var _n_ci_b14 = (floori((_n_xc_b10 - 0.5)+0.5) + 96)
				if _S.truth(((_n_ci_b14 < 192) if _S.truth((_n_ci_b14 >= 0)) else (_n_ci_b14 >= 0))):
					_S.set_prop(_n_core,_n_ci_b14,maxf(_S.index_value(_n_core,_n_ci_b14),minf(255,(_n_I0_b13 * 200))),"=")
			if _S.truth(not _S.truth(_n_any_b5)):
				_n_y_b3 += 1.0
				continue
			if true:
				var _n_i_b18 = 0
				while _S.truth((_n_i_b18 < 192)):
					var _n_I_b19 = _S.index_value(_n_row,_n_i_b18)
					if _S.truth((_n_I_b19 < 0.02)):
						_n_i_b18 += 1.0
						continue
					var _n_x_b20 = (_n_i_b18 - 96)
					_S.invoke(_n_p_b0,"blend",[_n_x_b20, _n_y_b3, _S.index_value(_n_C,6), minf(0.6,(_n_I_b19 * 0.38))])
					_S.invoke(_n_p_b0,"light",[_n_x_b20, _n_y_b3, _S.index_value(_n_C,4), minf(0.9,(_n_I_b19 * 0.32))])
					if _S.truth(_S.index_value(_n_core,_n_i_b18)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b20, _n_y_b3, (_n_WHITE if _S.truth((_S.index_value(_n_core,_n_i_b18) > 150)) else _S.index_value(_n_C,6)), minf(1,(float(_S.index_value(_n_core,_n_i_b18))/180))])
					_n_i_b18 += 1.0
			_n_y_b3 += 1.0
	if _S.truth((_n_t > (_n_HIT - 0.05))):
		_S.invoke(_n_p_b0,"glow",[0, (_n_PY - 3), 20, _S.index_value(_n_C,5), (0.5 * _n_k_b1)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_SUN = _S.read(_parent,"SUN")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_oval = _S.read(_parent,"oval")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_r_b1 = ((15 * _S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_t,0.02,0.45), 1.8])) * (1 - _S.invoke(_n_ease,"inBack",[_S.MathFX.seg(_n_t,_n_SHUT,(_n_LIFT + 0.1)), 1.5])))
	if _S.truth((_n_r_b1 > 0.5)):
		var _n_spin_b2 = (_n_t * 0.6)
		_S.invoke(_n_p_b0,"glow",[0, _n_SUN, minf(32,(_n_r_b1 * 3)), _S.index_value(_n_C,4), 0.5])
		_S.invoke(_n_p_b0,"glow",[0, _n_SUN, (_n_r_b1 * 1.4), _n_WHITE, 0.35])
		_S.invoke(_n_p_b0,"circle",[0, _n_SUN, (_n_r_b1 * 0.45), _n_WHITE])
		_S.call_value(_n_oval,[_n_p_b0, 0, _n_SUN, (_n_r_b1 * 0.62), (_n_r_b1 * 0.62), _S.index_value(_n_C,6), 1])
		_S.call_value(_n_oval,[_n_p_b0, 0, _n_SUN, _n_r_b1, _n_r_b1, _S.function_value(_S.capture(_parent,{"spin":_n_spin_b2,"this":_this}),"_f3"), 1])
		if true:
			var _n_j_b3 = 0
			while _S.truth((_n_j_b3 < 16)):
				var _n_g_b4 = (_n_spin_b2 + (float((_n_j_b3 * _n_TAU))/16))
				var _n_l_b5 = (3 if _S.truth(fmod(_n_j_b3,2)) else 6)
				_S.invoke(_n_p_b0,"line",[(cos(_n_g_b4) * (_n_r_b1 + 2)), (_n_SUN + (sin(_n_g_b4) * (_n_r_b1 + 2))), (cos(_n_g_b4) * ((_n_r_b1 + 2) + _n_l_b5)), (_n_SUN + (sin(_n_g_b4) * ((_n_r_b1 + 2) + _n_l_b5))), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
				_n_j_b3 += 1.0
	if _S.truth(((_n_t < (_n_LIFT + 0.3)) if _S.truth((_n_t > _n_LIFT)) else (_n_t > _n_LIFT))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, _n_SUN, (10 * (1 - (float((_n_t - _n_LIFT))/0.3))), _n_WHITE, _S.index_value(_n_C,5), 0.6])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_spin = _S.read(_parent,"spin")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((sin(((_n_g_b0 * 6) + (_n_spin * 4))) > 0.5)) else _S.index_value(_n_C,5))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.4)) else _S.index_value(_n_C,4))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1.1 - _n_u_b0)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_oval = _S.read(_parent,"oval")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	if _S.truth((_n_t < _n_HIT)):
		return null
	var _n_u_b2 = _S.MathFX.seg(_n_t,_n_HIT,(_n_HIT + 0.2))
	var _n_heat_b3 = (1 - _S.MathFX.smooth(_n_SHUT,(_n_SHUT + 0.8),_n_t))
	var _n_out_b4 = (1 - _S.MathFX.smooth((_n_SHUT + 0.4),(_n_SHUT + 1),_n_t))
	if _S.truth((_n_out_b4 <= 0)):
		return null
	var _n_keep_b5 = (_S.function_value(_S.capture(_parent,{"this":_this}),"_f7") if _S.truth(_n_back_b1) else _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"))
	var _n_burnt_b6 = _S.function_value(_S.capture(_parent,{"u":_n_u_b2,"this":_this}),"_f9")
	var _n_col_b7 = _S.function_value(_S.capture(_parent,{"burnt":_n_burnt_b6,"heat":_n_heat_b3,"this":_this}),"_f10")
	_S.call_value(_n_oval,[_n_p_b0, 0, 0, _n_RX, (_n_RX * _n_SY), _S.function_value(_S.capture(_parent,{"col":_n_col_b7,"this":_this}),"_f11"), _n_out_b4, _S.function_value(_S.capture(_parent,{"keep":_n_keep_b5,"burnt":_n_burnt_b6,"this":_this}),"_f12")])
	_S.call_value(_n_oval,[_n_p_b0, 0, 0, (_n_RX * 0.72), ((_n_RX * 0.72) * _n_SY), _S.function_value(_S.capture(_parent,{"col":_n_col_b7,"this":_this}),"_f13"), _n_out_b4, _S.function_value(_S.capture(_parent,{"keep":_n_keep_b5,"burnt":_n_burnt_b6,"this":_this}),"_f14")])
	if true:
		var _n_j_b8 = 0
		while _S.truth((_n_j_b8 < 12)):
			var _n_g_b9 = ((_n_t * 0.35) + (float((_n_j_b8 * _n_TAU))/12))
			if _S.truth(_S.logical("||",not _S.truth(_S.call_value(_n_keep_b5,[_n_g_b9])),func():return not _S.truth(_S.call_value(_n_burnt_b6,[_n_g_b9])))):
				_n_j_b8 += 1.0
				continue
			var _n_c_b10 = _S.call_value(_n_col_b7,[_n_g_b9, _S.binary("===",fmod(_n_j_b8,2),0)])
			var _n_r0_b11 = (_n_RX * 0.78)
			var _n_r1_b12 = (_n_RX * (0.95 if _S.truth(_S.binary("===",fmod(_n_j_b8,3),0)) else 0.88))
			if _S.truth(_n_c_b10):
				_S.invoke(_n_p_b0,"line",[(cos(_n_g_b9) * _n_r0_b11), ((sin(_n_g_b9) * _n_r0_b11) * _n_SY), (cos(_n_g_b9) * _n_r1_b12), ((sin(_n_g_b9) * _n_r1_b12) * _n_SY), _n_c_b10, _n_out_b4])
			_n_j_b8 += 1.0
	if _S.truth(not _S.truth(_n_back_b1)):
		if true:
			var _n_i_b13 = (-2)
			while _S.truth((_n_i_b13 <= 2)):
				_S.invoke(_n_p_b0,"glow",[((_n_i_b13 * _n_RX) * 0.45), (-2), 16, _S.index_value(_n_C,4), (((0.34 - (absf(_n_i_b13) * 0.05)) * _n_out_b4) * (0.5 + (0.5 * _n_heat_b3)))])
				_n_i_b13 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, (-1), 10, _n_WHITE, ((0.3 * _n_heat_b3) * _n_out_b4)])
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
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_u = _S.read(_parent,"u")
	var _n_g_b0 = _S.arg(_args,0)
	return (absf((fmod((fmod(((_n_g_b0 - (float(PI)/2)) + PI),_n_TAU) + _n_TAU),_n_TAU) - PI)) <= ((_n_u * PI) + 0.01))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_burnt = _S.read(_parent,"burnt")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_heat = _S.read(_parent,"heat")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_hot_b1 = _S.arg(_args,1)
	if _S.truth(not _S.truth(_S.call_value(_n_burnt,[_n_g_b0]))):
		return 0
	var _n_flick_b2 = (_S.MathFX.rand([floori((_n_g_b0 * 40)+0.5),floori((_n_t * 20))]) < 0.18)
	return (_n_WHITE if _S.truth(((_n_t < (_n_HIT + 0.08)) if _S.truth((_n_t < (_n_HIT + 0.08))) else ((_n_heat > 0.4) if _S.truth(_n_flick_b2) else _n_flick_b2))) else ((_S.index_value(_n_C,6) if _S.truth(_n_hot_b1) else _S.index_value(_n_C,5)) if _S.truth((_n_heat > 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_heat > 0.3)) else (_S.index_value(_n_C,3) if _S.truth((_n_heat > 0.1)) else _S.index_value(_n_C,2)))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_col = _S.read(_parent,"col")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_col,[_n_g_b0, true])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_keep = _S.read(_parent,"keep")
	var _n_burnt = _S.read(_parent,"burnt")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.logical("&&",_S.call_value(_n_keep,[_n_g_b0]),func():return _S.call_value(_n_burnt,[_n_g_b0]))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_col = _S.read(_parent,"col")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_col,[_n_g_b0, false])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_keep = _S.read(_parent,"keep")
	var _n_burnt = _S.read(_parent,"burnt")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.logical("&&",_S.call_value(_n_keep,[_n_g_b0]),func():return _S.call_value(_n_burnt,[_n_g_b0]))
	return null

static func _f15(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_mid = _S.read(_parent,"mid")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_off_b2 = (_n_i_b1 - _n_mid)
	var _n_far_b3 = (float(absf(_n_off_b2))/_n_mid)
	return {"th":((_n_off_b2 * (float(0.4)/_n_mid)) + _S.invoke(_n_R,"range",[(-0.02), 0.02])),"spread":(_S.invoke(_n_R,"range",[0.05, 0.085]) * (1 - (_n_far_b3 * 0.25))),"b":((1 - (_n_far_b3 * 0.35)) * _S.invoke(_n_R,"range",[0.8, 1])),"ph":_S.invoke(_n_R,"range",[0, 1]),"far":_n_far_b3}
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	return {"x":_S.invoke(_n_R,"range",[(-80), 80]),"y":_S.invoke(_n_R,"range",[0, 1]),"v":_S.invoke(_n_R,"range",[7, 18]),"amp":_S.invoke(_n_R,"range",[0.5, 2.5]),"f":_S.invoke(_n_R,"range",[0.6, 1.5]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_FOLD = _S.read(_parent,"FOLD")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_st_b2 = (_S.named_value(_n_s_b0,"far") * 0.1)
	var _n_open_b3 = _S.invoke(_n_ease,"outBack",[_S.MathFX.seg(_n_tt_b1,(_n_OPEN + _n_st_b2),((_n_OPEN + _n_st_b2) + 0.42)), 1.5])
	var _n_fold_b4 = _S.invoke(_n_ease,"inOutCubic",[_S.MathFX.seg(_n_tt_b1,(_n_FOLD - (_S.named_value(_n_s_b0,"far") * 0.1)),_n_SHUT)])
	return ((_S.named_value(_n_s_b0,"th") * _n_open_b3) * (1 - _n_fold_b4))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_DMAX = _S.read(_parent,"DMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	return (_n_DMAX * (1 - _S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_tt_b1,(_n_OPEN + (_S.named_value(_n_s_b0,"far") * 0.06)),(_n_HIT + (_S.named_value(_n_s_b0,"far") * 0.06)))])))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_DMAX = _S.read(_parent,"DMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_n_DMAX * _S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_tt_b0,(_n_SHUT + 0.05),_n_LIFT)]))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.MathFX.smooth(_n_OPEN,(_n_OPEN + 0.1),_n_tt_b0) * (1 - _S.MathFX.smooth((_n_LIFT - 0.05),(_n_LIFT + 0.05),_n_tt_b0)))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_d_b1 = _S.arg(_args,1)
	var _n_tt_b2 = _S.arg(_args,2)
	return ((1.4 + (_n_d_b1 * _S.named_value(_n_s_b0,"spread"))) * _S.numeric_lerp(1,0.25,_S.MathFX.smooth(_n_SHUT,_n_LIFT,_n_tt_b2)))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_DMAX = _S.read(_parent,"DMAX")
	var _n_frac = _S.read(_parent,"frac")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_d_b1 = _S.arg(_args,1)
	var _n_tt_b2 = _S.arg(_args,2)
	if _S.truth(((_n_tt_b2 < _n_HIT) if _S.truth((_n_tt_b2 < _n_HIT)) else (_n_tt_b2 > _n_SHUT))):
		return 1
	var _n_D_b3 = (_n_DMAX * (1 - _S.call_value(_n_frac,[((float((_n_tt_b2 - _n_HIT))/0.6) + _S.named_value(_n_s_b0,"ph"))])))
	return (1 + (0.9 * exp((-pow((float((_n_d_b1 - _n_D_b3))/12),2)))))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_PY = _S.read(_parent,"PY")
	var _n_angle = _S.read(_parent,"angle")
	var _n_t = _S.read(_parent,"t")
	var _n_width = _S.read(_parent,"width")
	var _n_liftD = _S.read(_parent,"liftD")
	var _n_frontD = _S.read(_parent,"frontD")
	var _n_shafts = _S.read(_parent,"shafts")
	var _n_fade = _S.read(_parent,"fade")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dy_b2 = (_n_PY - _n_y_b1)
	if _S.truth((_n_dy_b2 <= 0)):
		return 0
	var _n_I_b3 = 0
	for _iter_0 in _S.array(_n_shafts):
		var _n_s_b4 = _iter_0
		var _n_a_b5 = _S.call_value(_n_angle,[_n_s_b4, _n_t])
		var _n_d_b6 = (float(_n_dy_b2)/cos(_n_a_b5))
		var _n_xc_b7 = (tan(_n_a_b5) * _n_dy_b2)
		var _n_hw_b8 = (float((float(_S.call_value(_n_width,[_n_s_b4, _n_d_b6, _n_t]))/2))/cos(_n_a_b5))
		if _S.truth(_S.logical("||",(_n_d_b6 < _S.call_value(_n_liftD,[_n_t])),func():return (_n_d_b6 < _S.call_value(_n_frontD,[_n_s_b4, _n_t])))):
			continue
		var _n_v_b9 = (float((_n_x_b0 - _n_xc_b7))/_n_hw_b8)
		if _S.truth((absf(_n_v_b9) < 1)):
			_n_I_b3 += ((1 - (_n_v_b9 * _n_v_b9)) * _S.named_value(_n_s_b4,"b"))
	return (_n_I_b3 * _S.call_value(_n_fade,[_n_t]))
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.1)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
		_S.define(_v20, "D", _S.invoke(_S.read(_v20, "R"), "range", [22, 34]))
		_S.define(_v20, "x", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "D")))
		_S.define(_v20, "y", _S.binary("+", _S.read(_v20, "SUN"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "D"))))
		_S.define(_v20, "T", _S.invoke(_S.read(_v20, "R"), "range", [0.18, 0.28]))
		_S.define(_v20, "v", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v20, "D"), 10), 3), _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "exp", [_S.binary("*", 3, _S.read(_v20, "T"))]), 1)))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STREAK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v20, "x")), _S.read(_v20, "D")), _S.read(_v20, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v20, "SUN"), _S.read(_v20, "y")), _S.read(_v20, "D")), _S.read(_v20, "v")), _S.read(_v20, "T"), (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v21 = _S.scope(_e)
		_S.write(_v21, "hit", true, "=", false)
		_S.invoke(_S.read(_v21, "lights"), "add", [0, _S.unary("-", 30), 64, _S.prop(_S.read(_v21, "C"), 5), 0.85, 0.5])
		_S.invoke(_S.read(_v21, "lights"), "add", [0, _S.unary("-", 6), 30, _S.read(_v21, "WHITE"), 0.8, 0.12])
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 26)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v23, "Math"), "PI")), 2), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [70, 190]))
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SPARK"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.6])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHUT"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "g", _S.invoke(_S.read(_v24, "R"), "range", [0, _S.read(_v24, "TAU")]))
		_S.define(_v24, "r", _S.binary("*", _S.read(_v24, "RX"), (1 if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else 0.72)))
		_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "g")]), _S.read(_v24, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "g")]), _S.read(_v24, "r")), _S.read(_v24, "SY")), 1), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [12, 30])), _S.invoke(_S.read(_v24, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v24, "C"), 5), 1, 0, (4 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "g")]), 0)) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FOLD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), 40), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [20, 160])), 0, _S.invoke(_S.read(_e, "R"), "range", [2, 8]), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.6]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shut")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHUT")))):
		var _v25 = _S.scope(_e)
		_S.write(_v25, "shut", true, "=", false)
		_S.invoke(_S.read(_v25, "lights"), "add", [0, _S.unary("-", 60), 70, _S.prop(_S.read(_v25, "C"), 5), 0.7, 0.35])
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 12)):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STAR"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [10, 170])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v26, "R"), "range", [0.4, 0.8]), (_S.read(_v26, "WHITE") if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.5])) else _S.prop(_S.read(_v26, "C"), 6)), _S.invoke(_S.read(_v26, "R"), "range", [0.8, 2])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "glinted")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT")))):
		var _v27 = _S.scope(_e)
		_S.write(_v27, "glinted", true, "=", false)
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.read(_v27, "SUN"), 40, _S.read(_v27, "WHITE"), 0.6, 0.2])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "feathers"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_fan = _S.read(_parent,"fan")
	var _n_sigil = _S.read(_parent,"sigil")
	var _n_feathers = _S.read(_parent,"feathers")
	var _n_WING = _S.read(_parent,"WING")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_fan,[_n_p_b0])
	_S.call_value(_n_sigil,[_n_p_b0, true])
	_S.invoke(_n_feathers,"draw",[_n_p_b0, _n_WING, "back"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_sigil = _S.read(_parent,"sigil")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_DMAX = _S.read(_parent,"DMAX")
	var _n_t = _S.read(_parent,"t")
	var _n_lightAt = _S.read(_parent,"lightAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_motes = _S.read(_parent,"motes")
	var _n_sun = _S.read(_parent,"sun")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_PY = _S.read(_parent,"PY")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_feathers = _S.read(_parent,"feathers")
	var _n_WING = _S.read(_parent,"WING")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_sigil,[_n_p_b0, false])
	for _iter_0 in _S.array(_n_motes):
		var _n_m_b1 = _iter_0
		var _n_y_b2 = (_n_TOP + fmod((fmod(((_S.named_value(_n_m_b1,"y") * _n_DMAX) + (_n_t * _S.named_value(_n_m_b1,"v"))),_n_DMAX) + _n_DMAX),_n_DMAX))
		var _n_x_b3 = (_S.named_value(_n_m_b1,"x") + (sin(((_n_t * _S.named_value(_n_m_b1,"f")) + _S.named_value(_n_m_b1,"ph"))) * _S.named_value(_n_m_b1,"amp")))
		var _n_I_b4 = _S.call_value(_n_lightAt,[_n_x_b3, _n_y_b2])
		if _S.truth((_n_I_b4 < 0.2)):
			continue
		_S.invoke(_n_p_b0,"dot",[_n_x_b3, _n_y_b2, (_n_WHITE if _S.truth((_n_I_b4 > 0.7)) else _S.index_value(_n_C,6)), minf(1,(_n_I_b4 * 1.3))])
		_S.invoke(_n_p_b0,"light",[_n_x_b3, _n_y_b2, _S.index_value(_n_C,5), (0.4 * minf(1,_n_I_b4))])
	_S.call_value(_n_sun,[_n_p_b0])
	if _S.truth(((_n_t < (_n_HIT + 0.25)) if _S.truth((_n_t > (_n_HIT - 0.02))) else (_n_t > (_n_HIT - 0.02)))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (_n_PY - 2), (12 * (1 - (float((_n_t - _n_HIT))/0.25))), _n_WHITE, _S.index_value(_n_C,5), 0.7])
	if _S.truth(((_n_t < (_n_SHUT + 0.2)) if _S.truth((_n_t > _n_SHUT)) else (_n_t > _n_SHUT))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (_n_PY - 2), (8 * (1 - (float((_n_t - _n_SHUT))/0.2))), _n_WHITE, _S.index_value(_n_C,5), 0.5])
	_S.invoke(_n_feathers,"draw",[_n_p_b0, _n_WING, "front"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_x_b0 - floori(_n_x_b0))
	return null
