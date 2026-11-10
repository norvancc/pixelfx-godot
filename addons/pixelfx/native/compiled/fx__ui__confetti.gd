@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/confetti.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "popper", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Confetti"}, {"desc": "Two party poppers bang one after the other: paper bits and curly streamers burst out, stall, then tumble and flutter down, flipping, and settle on the floor."}, {"tags": ["ui", "celebration", "confetti", "party", "reward", "one-shot"]}, {"size": [200, 140]}, {"origin": [100, 126]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#ff4a5a", "#ff9a2a", "#ffe03c", "#5ad84a", "#3cc8ff", "#7a6cff", "#f53cd1"]}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POPPERS", [_S.merge([{"x": _S.unary("-", 74)}, {"y": _S.unary("-", 1)}, {"a": _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 0.62)}, {"t": 0.1}]), _S.merge([{"x": 74}, {"y": _S.unary("-", 1)}, {"a": _S.binary("-", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 0.62)}, {"t": 0.26}])])
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#141019"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	var _n_alpha_b6 = _S.arg(_args,6)
	var _n_ca_b7 = cos(_n_a_b3)
	var _n_sa_b8 = sin(_n_a_b3)
	var _n_bx_b9 = (_n_x_b1 - (_n_ca_b7 * _n_k_b4))
	var _n_by_b10 = (_n_y_b2 - (_n_sa_b8 * _n_k_b4))
	_S.invoke(_n_p_b0,"shade",[(_n_bx_b9 - 12), (_n_by_b10 - 12), (_n_bx_b9 + 12), (_n_by_b10 + 12), _S.function_value(_S.capture(_parent,{"bx":_n_bx_b9,"by":_n_by_b10,"ca":_n_ca_b7,"sa":_n_sa_b8,"alpha":_n_alpha_b6,"C":_n_C_b5,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_alpha = _S.read(_parent,"alpha")
	var _n_INK = _S.read(_parent,"INK")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_hex = _S.read(_parent,"hex")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _n_bx)
	var _n_dy_b4 = (_n_py_b1 - _n_by)
	var _n_u_b5 = ((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa))
	var _n_v_b6 = (((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca))
	if _S.truth(((_n_u_b5 < 0) if _S.truth((_n_u_b5 < 0)) else (_n_u_b5 > 11))):
		return null
	var _n_hw_b7 = (0.8 + (_n_u_b5 * 0.32))
	if _S.truth((absf(_n_v_b6) > (_n_hw_b7 + 0.6))):
		return null
	_S.set_prop(_n_o_b2,"a",_n_alpha,"=")
	if _S.truth(_S.logical("||",_S.logical("||",(absf(_n_v_b6) > (_n_hw_b7 - 0.4)),func():return (_n_u_b5 > 10.2)),func():return (_n_u_b5 < 0.8))):
		return _n_INK
	var _n_stripe_b8 = _S.binary("===",fmod(floori((float((_n_u_b5 + (_n_v_b6 * 0.6)))/2.2)),2),0)
	return ((_S.index_value(_n_C,2) if _S.truth((_n_v_b6 < 0)) else _S.ColorFX.scale_color(_S.index_value(_n_C,2),0.75)) if _S.truth(_n_stripe_b8) else (_n_WHITE if _S.truth((_n_v_b6 < 0)) else _S.call_value(_n_hex,["#c8c0d8"])))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "fire", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f5")}, {"sparks": ["#ffffff", "#fff3a6", "#ffc23d", "#ff8a2a"]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", [])
	_S.define(_e, "ribbons", [])
	_S.define(_e, "fired", [false, false])
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "kick", _S.function_value(_e, "_f6"))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_lights = _S.read(_parent,"lights")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_hex = _S.read(_parent,"hex")
	var _n_bits = _S.read(_parent,"bits")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ribbons = _S.read(_parent,"ribbons")
	var _n_Array = _S.read(_parent,"Array")
	var _n_pp_b0 = _S.arg(_args,0)
	var _n_mx_b1 = (_S.named_value(_n_pp_b0,"x") + (cos(_S.named_value(_n_pp_b0,"a")) * 11))
	var _n_my_b2 = (_S.named_value(_n_pp_b0,"y") + (sin(_S.named_value(_n_pp_b0,"a")) * 11))
	_S.invoke(_n_lights,"add",[_n_mx_b1, _n_my_b2, 34, _n_WHITE, 0.6, 0.12])
	_S.invoke(_n_lights,"add",[_n_mx_b1, _n_my_b2, 50, _S.index_value(_n_C,2), 0.4, 0.4])
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 6)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), _n_mx_b1, _n_my_b2, ((cos(_S.named_value(_n_pp_b0,"a")) * _S.invoke(_n_R,"range",[20, 60])) + _S.invoke(_n_R,"range",[(-10), 10])), (sin(_S.named_value(_n_pp_b0,"a")) * _S.invoke(_n_R,"range",[20, 60])), _S.invoke(_n_R,"range",[0.6, 1]), _S.call_value(_n_hex,["#5d5660"]), _S.invoke(_n_R,"range",[2.5, 4])])
			_n_i_b3 += 1.0
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 12)):
			var _n_an_b5 = (_S.named_value(_n_pp_b0,"a") + _S.invoke(_n_R,"range",[(-0.5), 0.5]))
			var _n_sp_b6 = _S.invoke(_n_R,"range",[120, 260])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _n_mx_b1, _n_my_b2, (cos(_n_an_b5) * _n_sp_b6), (sin(_n_an_b5) * _n_sp_b6), _S.invoke(_n_R,"range",[0.1, 0.25])])
			_n_i_b4 += 1.0
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 46)):
			var _n_an_b8 = (_S.named_value(_n_pp_b0,"a") + _S.invoke(_n_R,"range",[(-0.38), 0.38]))
			var _n_sp_b9 = _S.invoke(_n_R,"range",[200, 380])
			_S.invoke(_n_bits,"push",[{"x":_n_mx_b1,"y":_n_my_b2,"vx":(cos(_n_an_b8) * _n_sp_b9),"vy":(sin(_n_an_b8) * _n_sp_b9),"c":_S.invoke(_n_R,"pick",[_n_C]),"w":_S.invoke(_n_R,"range",[2, 3]),"h":_S.invoke(_n_R,"range",[3, 4.6]),"ang":_S.invoke(_n_R,"range",[0, _n_TAU]),"spin":_S.invoke(_n_R,"range",[(-14), 14]),"flip":_S.invoke(_n_R,"range",[0, _n_TAU]),"fs":_S.invoke(_n_R,"range",[5, 13]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"amp":_S.invoke(_n_R,"range",[5, 12]),"fw":_S.invoke(_n_R,"range",[2, 3.4]),"x0":0,"mode":0,"rest":0,"fall":_S.invoke(_n_R,"range",[26, 40])}])
			_n_i_b7 += 1.0
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < 4)):
			var _n_an_b11 = (_S.named_value(_n_pp_b0,"a") + _S.invoke(_n_R,"range",[(-0.25), 0.25]))
			var _n_sp_b12 = _S.invoke(_n_R,"range",[220, 330])
			var _n_n_b13 = 11
			_S.invoke(_n_ribbons,"push",[{"pts":_S.invoke(_n_Array,"from",[{"length":_n_n_b13}, _S.function_value(_S.capture(_parent,{"mx":_n_mx_b1,"my":_n_my_b2,"this":_this}),"_f4")]),"vx":(cos(_n_an_b11) * _n_sp_b12),"vy":(sin(_n_an_b11) * _n_sp_b12),"c":_S.invoke(_n_R,"pick",[_n_C]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"amp":_S.invoke(_n_R,"range",[6, 12]),"fw":_S.invoke(_n_R,"range",[1.5, 2.4]),"mode":0,"x0":0,"curl":_S.invoke(_n_R,"range",[0.7, 1.1]),"fall":_S.invoke(_n_R,"range",[22, 32])}])
			_n_i_b10 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	return [_n_mx, _n_my]
	return null

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_pp_b1 = _S.arg(_args,1)
	return (0 if _S.truth((_n_t_b0 < _S.named_value(_n_pp_b1,"t"))) else (3 * exp(((-(_n_t_b0 - _S.named_value(_n_pp_b1,"t"))) * 14))))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "POPPERS"), "forEach", [_S.function_value(_e, "_f8")])
	for _v7 in _S.array(_S.read(_e, "bits")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "b", _v7)
		var _v9 = _S.scope(_v8)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v9, "b"), "mode"), 2)):
			var _v10 = _S.scope(_v9)
			_S.set_prop(_S.read(_v10, "b"), "rest", _S.read(_v10, "dt"), "+=", false)
			continue
		_S.set_prop(_S.read(_v9, "b"), "flip", _S.binary("*", _S.prop(_S.read(_v9, "b"), "fs"), _S.read(_v9, "dt")), "+=", false)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v9, "b"), "mode"), 0)):
			var _v11 = _S.scope(_v9)
			_S.set_prop(_S.read(_v11, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vx"), 3.4), _S.read(_v11, "dt")), "-=", false)
			_S.set_prop(_S.read(_v11, "b"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vy"), 3.4), _S.read(_v11, "dt")), _S.binary("*", 140, _S.read(_v11, "dt"))), "-=", false)
			_S.set_prop(_S.read(_v11, "b"), "x", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vx"), _S.read(_v11, "dt")), "+=", false)
			_S.set_prop(_S.read(_v11, "b"), "y", _S.binary("*", _S.prop(_S.read(_v11, "b"), "vy"), _S.read(_v11, "dt")), "+=", false)
			_S.set_prop(_S.read(_v11, "b"), "ang", _S.binary("*", _S.prop(_S.read(_v11, "b"), "spin"), _S.read(_v11, "dt")), "+=", false)
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.prop(_S.read(_v11, "b"), "vx"), _S.prop(_S.read(_v11, "b"), "vy")]), 40)):
				_S.last([_S.set_prop(_S.read(_v11, "b"), "mode", 1, "=", false), _S.set_prop(_S.read(_v11, "b"), "x0", _S.binary("-", _S.prop(_S.read(_v11, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.prop(_S.read(_v11, "b"), "ph")]), _S.prop(_S.read(_v11, "b"), "amp"))), "=", false)])
		else:
			var _v12 = _S.scope(_v9)
			_S.set_prop(_S.read(_v12, "b"), "ph", _S.binary("*", _S.prop(_S.read(_v12, "b"), "fw"), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "x0", _S.binary("*", _S.prop(_S.read(_v12, "b"), "vx"), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v12, "b"), "vx"), 2), _S.read(_v12, "dt")), "-=", false)
			_S.set_prop(_S.read(_v12, "b"), "x", _S.binary("+", _S.prop(_S.read(_v12, "b"), "x0"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.prop(_S.read(_v12, "b"), "ph")]), _S.prop(_S.read(_v12, "b"), "amp"))), "=", false)
			_S.set_prop(_S.read(_v12, "b"), "y", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v12, "b"), "fall"), _S.binary("+", 0.4, _S.binary("*", 0.9, _S.invoke(_S.read(_v12, "Math"), "abs", [_S.invoke(_S.read(_v12, "Math"), "cos", [_S.prop(_S.read(_v12, "b"), "ph")])])))), _S.read(_v12, "dt")), "+=", false)
			_S.set_prop(_S.read(_v12, "b"), "ang", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.prop(_S.read(_v12, "b"), "ph")]), 0.9), "=", false)
			if _S.truth(_S.binary(">=", _S.prop(_S.read(_v12, "b"), "y"), _S.unary("-", 1))):
				_S.last([_S.set_prop(_S.read(_v12, "b"), "y", _S.unary("-", 0.5), "=", false), _S.set_prop(_S.read(_v12, "b"), "mode", 2, "=", false), _S.set_prop(_S.read(_v12, "b"), "ang", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 0.3), 0.3]), "=", false), _S.set_prop(_S.read(_v12, "b"), "flip", 0, "=", false)])
	for _v13 in _S.array(_S.read(_e, "ribbons")):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "r", _v13)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "h", _S.prop(_S.prop(_S.read(_v15, "r"), "pts"), 0))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v15, "r"), "mode"), 0)):
			var _v16 = _S.scope(_v15)
			_S.set_prop(_S.read(_v16, "r"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "r"), "vx"), 3), _S.read(_v16, "dt")), "-=", false)
			_S.set_prop(_S.read(_v16, "r"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "r"), "vy"), 3), _S.read(_v16, "dt")), _S.binary("*", 120, _S.read(_v16, "dt"))), "-=", false)
			_S.set_prop(_S.read(_v16, "h"), 0, _S.binary("*", _S.prop(_S.read(_v16, "r"), "vx"), _S.read(_v16, "dt")), "+=", false)
			_S.set_prop(_S.read(_v16, "h"), 1, _S.binary("*", _S.prop(_S.read(_v16, "r"), "vy"), _S.read(_v16, "dt")), "+=", false)
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.prop(_S.read(_v16, "r"), "vx"), _S.prop(_S.read(_v16, "r"), "vy")]), 35)):
				_S.last([_S.set_prop(_S.read(_v16, "r"), "mode", 1, "=", false), _S.set_prop(_S.read(_v16, "r"), "x0", _S.binary("-", _S.prop(_S.read(_v16, "h"), 0), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.prop(_S.read(_v16, "r"), "ph")]), _S.prop(_S.read(_v16, "r"), "amp"))), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v15, "h"), 1), _S.unary("-", 1))):
				var _v17 = _S.scope(_v15)
				_S.set_prop(_S.read(_v17, "r"), "ph", _S.binary("*", _S.prop(_S.read(_v17, "r"), "fw"), _S.read(_v17, "dt")), "+=", false)
				_S.set_prop(_S.read(_v17, "r"), "x0", _S.binary("*", _S.prop(_S.read(_v17, "r"), "vx"), _S.read(_v17, "dt")), "+=", false)
				_S.set_prop(_S.read(_v17, "r"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "r"), "vx"), 2), _S.read(_v17, "dt")), "-=", false)
				_S.set_prop(_S.read(_v17, "h"), 0, _S.binary("+", _S.prop(_S.read(_v17, "r"), "x0"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.prop(_S.read(_v17, "r"), "ph")]), _S.prop(_S.read(_v17, "r"), "amp"))), "=", false)
				_S.set_prop(_S.read(_v17, "h"), 1, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "r"), "fall"), _S.binary("+", 0.5, _S.binary("*", 0.7, _S.invoke(_S.read(_v17, "Math"), "abs", [_S.invoke(_S.read(_v17, "Math"), "cos", [_S.prop(_S.read(_v17, "r"), "ph")])])))), _S.read(_v17, "dt")), "+=", false)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.prop(_S.prop(_S.read(_v18, "r"), "pts"), "length"))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.prop(_S.prop(_S.read(_v19, "r"), "pts"), _S.binary("-", _S.read(_v19, "i"), 1)))
			_S.define(_v19, "b", _S.prop(_S.prop(_S.read(_v19, "r"), "pts"), _S.read(_v19, "i")))
			_S.set_prop(_S.read(_v19, "b"), 1, _S.invoke(_S.read(_v19, "Math"), "min", [_S.unary("-", 0.5), _S.binary("+", _S.prop(_S.read(_v19, "b"), 1), _S.binary("*", 20, _S.read(_v19, "dt")))]), "=", false)
			_S.define(_v19, "dx", _S.binary("-", _S.prop(_S.read(_v19, "b"), 0), _S.prop(_S.read(_v19, "a"), 0)))
			_S.define(_v19, "dy", _S.binary("-", _S.prop(_S.read(_v19, "b"), 1), _S.prop(_S.read(_v19, "a"), 1)))
			_S.define(_v19, "d", _S.logical("||", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.read(_v19, "dx"), _S.read(_v19, "dy")]), func(): return 1))
			if _S.truth(_S.binary(">", _S.read(_v19, "d"), 2.6)):
				_S.last([_S.set_prop(_S.read(_v19, "b"), 0, _S.binary("+", _S.prop(_S.read(_v19, "a"), 0), _S.binary("*", _S.binary("/", _S.read(_v19, "dx"), _S.read(_v19, "d")), 2.6)), "=", false), _S.set_prop(_S.read(_v19, "b"), 1, _S.binary("+", _S.prop(_S.read(_v19, "a"), 1), _S.binary("*", _S.binary("/", _S.read(_v19, "dy"), _S.read(_v19, "d")), 2.6)), "=", false)])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pp", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "fired"), _S.read(_e, "i"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "pp"), "t"))), func(): return _S.last([_S.set_prop(_S.read(_e, "fired"), _S.read(_e, "i"), true, "=", false), _S.call_value(_S.read(_e, "fire"), [_S.read(_e, "pp")])]))

static func _f9(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_end = _S.read(_parent,"end")
	var _n_kick = _S.read(_parent,"kick")
	var _n_popper = _S.read(_parent,"popper")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_POPPERS = _S.read(_parent,"POPPERS")
	var _n_ribbons = _S.read(_parent,"ribbons")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = (1 - _S.MathFX.seg(_n_t,(_n_end - 0.45),(_n_end - 0.05)))
	for _iter_0 in _S.array(_n_POPPERS):
		var _n_pp_b2 = _iter_0
		var _n_k_b3 = _S.call_value(_n_kick,[_n_t, _n_pp_b2])
		_S.call_value(_n_popper,[_n_p_b0, _S.named_value(_n_pp_b2,"x"), _S.named_value(_n_pp_b2,"y"), _S.named_value(_n_pp_b2,"a"), _n_k_b3, _n_C, (1 - _S.MathFX.seg(_n_t,2.5,2.9))])
		var _n_ft_b4 = (_n_t - _S.named_value(_n_pp_b2,"t"))
		if _S.truth(((_n_ft_b4 < 0.12) if _S.truth((_n_ft_b4 > 0)) else (_n_ft_b4 > 0))):
			_S.call_value(_n_sparkle,[_n_p_b0, (_S.named_value(_n_pp_b2,"x") + (cos(_S.named_value(_n_pp_b2,"a")) * 13)), (_S.named_value(_n_pp_b2,"y") + (sin(_S.named_value(_n_pp_b2,"a")) * 13)), (7 * (1 - (float(_n_ft_b4)/0.12))), _n_WHITE, _S.index_value(_n_C,2), 0.7])
	for _iter_1 in _S.array(_n_ribbons):
		var _n_r_b5 = _iter_1
		var _n_pts_b6 = _S.invoke(_S.named_value(_n_r_b5,"pts"),"map",[_S.function_value(_S.capture(_parent,{"r":_n_r_b5,"this":_this}),"_f11")])
		if true:
			var _n_i_b7 = 1
			while _S.truth((_n_i_b7 < _S.prop(_n_pts_b6,"length"))):
				var _tuple_2 = _S.index_value(_n_pts_b6,(_n_i_b7 - 1))
				var _n_x0_b8 = _S.prop(_tuple_2,0)
				var _n_y0_b9 = _S.prop(_tuple_2,1)
				var _tuple_3 = _S.index_value(_n_pts_b6,_n_i_b7)
				var _n_x1_b10 = _S.prop(_tuple_3,0)
				var _n_y1_b11 = _S.prop(_tuple_3,1)
				var _n_front_b12 = (sin((((_n_i_b7 * _S.named_value(_n_r_b5,"curl")) + (_n_t * 9)) + _S.named_value(_n_r_b5,"ph"))) > 0)
				_S.invoke(_n_p_b0,"line",[_n_x0_b8, _n_y0_b9, _n_x1_b10, _n_y1_b11, (_S.named_value(_n_r_b5,"c") if _S.truth(_n_front_b12) else _S.ColorFX.scale_color(_S.named_value(_n_r_b5,"c"),0.6)), _n_fade_b1])
				_S.invoke(_n_p_b0,"line",[(_n_x0_b8 + 1), _n_y0_b9, (_n_x1_b10 + 1), _n_y1_b11, (_S.ColorFX.mix(_S.named_value(_n_r_b5,"c"),_n_WHITE,0.35) if _S.truth(_n_front_b12) else _S.ColorFX.scale_color(_S.named_value(_n_r_b5,"c"),0.45)), _n_fade_b1])
				_n_i_b7 += 1.0
	for _iter_4 in _S.array(_n_bits):
		var _n_b_b13 = _iter_4
		if _S.truth((_S.named_value(_n_b_b13,"y") > 1)):
			continue
		var _n_fw_b14 = (1 if _S.truth(_S.binary("===",_S.named_value(_n_b_b13,"mode"),2)) else cos(_S.named_value(_n_b_b13,"flip")))
		var _n_w_b15 = maxf(0.5,(absf(_n_fw_b14) * _S.named_value(_n_b_b13,"w")))
		var _n_ca_b16 = cos(_S.named_value(_n_b_b13,"ang"))
		var _n_sa_b17 = sin(_S.named_value(_n_b_b13,"ang"))
		var _n_c_b18 = (_S.named_value(_n_b_b13,"c") if _S.truth((_n_fw_b14 >= 0)) else _S.ColorFX.scale_color(_S.named_value(_n_b_b13,"c"),0.62))
		var _n_a_b19 = _n_fade_b1
		if _S.truth(_S.binary("===",_S.named_value(_n_b_b13,"mode"),2)):
			_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b13,"x"), _S.named_value(_n_b_b13,"y"), _S.ColorFX.scale_color(_S.named_value(_n_b_b13,"c"),0.8), _n_a_b19])
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_b_b13,"x") + 1), _S.named_value(_n_b_b13,"y"), _S.ColorFX.scale_color(_S.named_value(_n_b_b13,"c"),0.6), _n_a_b19])
			continue
		_S.invoke(_n_p_b0,"shade",[(_S.named_value(_n_b_b13,"x") - 4), (_S.named_value(_n_b_b13,"y") - 4), (_S.named_value(_n_b_b13,"x") + 4), (_S.named_value(_n_b_b13,"y") + 4), _S.function_value(_S.capture(_parent,{"b":_n_b_b13,"ca":_n_ca_b16,"sa":_n_sa_b17,"w":_n_w_b15,"a":_n_a_b19,"fw":_n_fw_b14,"c":_n_c_b18,"this":_this}),"_f12")])
		if _S.truth((absf(_n_fw_b14) > 0.97)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b13,"x"), _S.named_value(_n_b_b13,"y"), 5, _S.ColorFX.mix(_S.named_value(_n_b_b13,"c"),_n_WHITE,0.5), (0.35 * _n_fade_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_t = _S.read(_parent,"t")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	return [(_n_x_b0 + (sin((((_n_i_b2 * _S.named_value(_n_r,"curl")) + (_n_t * 9)) + _S.named_value(_n_r,"ph"))) * (1.6 if _S.truth(_n_i_b2) else 0))), _n_y_b1]
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_w = _S.read(_parent,"w")
	var _n_a = _S.read(_parent,"a")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_fw = _S.read(_parent,"fw")
	var _n_c = _S.read(_parent,"c")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_u_b5 = ((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa))
	var _n_v_b6 = (((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca))
	if _S.truth(_S.logical("||",(absf(_n_u_b5) > ((float(_n_w)/2) + 0.2)),func():return (absf(_n_v_b6) > (float(_S.named_value(_n_b,"h"))/2)))):
		return null
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	return (_n_WHITE if _S.truth(_S.logical("&&",(absf(_n_fw) > 0.92),func():return (_n_v_b6 < ((float((-_S.named_value(_n_b,"h")))/2) + 1)))) else _n_c)
	return null
