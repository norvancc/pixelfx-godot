@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/burn-away.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "field", _S.import_value("fx/transitions/_lib.js", "field"))
	_S.define(_e, "pixels", _S.import_value("fx/transitions/_lib.js", "pixels"))
	_S.define(_e, "lifeLeft", _S.import_value("fx/transitions/_lib.js", "lifeLeft"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "inField", _S.function_value(_e, "_f0"))
	_S.define(_e, "outField", _S.function_value(_e, "_f2"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Burn away"}, {"desc": "The screen burns in from its edges behind a ragged ember line of licking flames, embers and smoke; then the black smoulders and burns open from the middle."}, {"tags": ["burn", "fire", "embers", "smoke", "wipe"]}, {"duration": 3}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"seed": 3}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "CLOSE", 1.18)
	_S.define(_e, "COVER", 1.35)
	_S.define(_e, "SMOULDER", 1.5)
	_S.define(_e, "POP", 1.8)
	_S.define(_e, "OPEN", 2.62)
	_S.define(_e, "SC", 90)
	_S.define(_e, "HALO", 24)
	_S.define(_e, "POOL", 48)
	_S.define(_e, "ASH", ["#a39cab", "#7b7484", "#5c5664", "#433e4b"])
	_S.define(_e, "LAYERS", [[1, 1, 2], [0.76, 0.86, 4], [0.54, 0.68, 6], [0.3, 0.42, 8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_seed_b0 = _S.arg(_args,0)
	return _S.call_value(_n_field,[_S.function_value(_S.capture(_parent,{"seed":_n_seed_b0,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_SC = _S.read(_parent,"SC")
	var _n_seed = _S.read(_parent,"seed")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_ux_b2 = (float((_n_x_b0 - (float(_n_W)/2)))/(float(_n_W)/2))
	var _n_uy_b3 = (float((_n_y_b1 - (float(_n_H)/2)))/(float(_n_H)/2))
	var _n_m_b4 = pow((pow(_n_ux_b2,4) + pow(_n_uy_b3,4)),0.25)
	return (((((1 - _n_m_b4) * _n_SC) + (14 * _S.NoiseKernels.fbm((float(_n_x_b0)/44),(float(_n_y_b1)/44),_n_seed,3))) + (2.4 * _S.NoiseKernels.fbm((float(_n_x_b0)/7),(float(_n_y_b1)/7),(_n_seed + 9),2))) + (7 * (0.5 - (float(_n_y_b1)/_n_H))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_field = _S.read(_parent,"field")
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.construct(_n_Rng,[((_n_seed_b0 * 31) + 5)])
	var _n_ox_b2 = ((float(_n_W)/2) + _S.invoke(_n_R_b1,"range",[(-26), 26]))
	var _n_oy_b3 = ((float(_n_H)/2) + _S.invoke(_n_R_b1,"range",[(-14), 6]))
	var _n_sats_b4 = _S.invoke([(-1), 1],"map",[_S.function_value(_S.capture(_parent,{"ox":_n_ox_b2,"R":_n_R_b1,"oy":_n_oy_b3,"this":_this}),"_f3")])
	var _n_f_b5 = _S.call_value(_n_field,[_S.function_value(_S.capture(_parent,{"ox":_n_ox_b2,"oy":_n_oy_b3,"sats":_n_sats_b4,"seed":_n_seed_b0,"this":_this}),"_f4")])
	_S.set_prop(_n_f_b5,"ox",_n_ox_b2,"=")
	_S.set_prop(_n_f_b5,"oy",_n_oy_b3,"=")
	return _n_f_b5
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ox = _S.read(_parent,"ox")
	var _n_R = _S.read(_parent,"R")
	var _n_oy = _S.read(_parent,"oy")
	var _n_s_b0 = _S.arg(_args,0)
	return {"x":(_n_ox + (_n_s_b0 * _S.invoke(_n_R,"range",[70, 110]))),"y":(_n_oy + _S.invoke(_n_R,"range",[(-40), 40])),"d":_S.invoke(_n_R,"range",[30, 44])}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ox = _S.read(_parent,"ox")
	var _n_W = _S.read(_parent,"W")
	var _n_oy = _S.read(_parent,"oy")
	var _n_H = _S.read(_parent,"H")
	var _n_SC = _S.read(_parent,"SC")
	var _n_sats = _S.read(_parent,"sats")
	var _n_seed = _S.read(_parent,"seed")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = (_S.Bridge.hypot([(float((_n_x_b0 - _n_ox))/(float(_n_W)/2)), (float((_n_y_b1 - _n_oy))/(float(_n_H)/2))]) * _n_SC)
	for _iter_0 in _S.array(_n_sats):
		var _n_s_b3 = _iter_0
		_n_v_b2 = minf(_n_v_b2,(_S.named_value(_n_s_b3,"d") + ((_S.Bridge.hypot([(float((_n_x_b0 - _S.named_value(_n_s_b3,"x")))/(float(_n_W)/2)), (float((_n_y_b1 - _S.named_value(_n_s_b3,"y")))/(float(_n_H)/2))]) * _n_SC) * 1.15)))
	return ((_n_v_b2 + (13 * _S.NoiseKernels.fbm((float(_n_x_b0)/40),(float(_n_y_b1)/40),(_n_seed + 21),3))) + (2.4 * _S.NoiseKernels.fbm((float(_n_x_b0)/7),(float(_n_y_b1)/7),(_n_seed + 33),2)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_h_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_sway_b6 = _S.arg(_args,6)
	var _n_t_b7 = _S.arg(_args,7)
	var _n_n_b8 = _S.arg(_args,8)
	for _iter_0 in _S.array(_n_LAYERS):
		var _tuple_1 = _iter_0
		var _n_lw_b9 = _S.prop(_tuple_1,0)
		var _n_lh_b10 = _S.prop(_tuple_1,1)
		var _n_ri_b11 = _S.prop(_tuple_1,2)
		var _n_Ht_b12 = (_n_h_b4 * _n_lh_b10)
		var _n_col_b13 = _S.index_value(_n_F_b1,_n_ri_b11)
		if true:
			var _n_r_b14 = 0
			while _S.truth((_n_r_b14 <= _n_Ht_b12)):
				var _n_u_b15 = (float(_n_r_b14)/maxf(1,_n_Ht_b12))
				var _n_half_b16 = ((((_n_w_b5 * _n_lw_b9) * pow((1 - _n_u_b15),0.85)) * minf(1,(float((_n_r_b14 + 1.5))/3.5))) + (_S.MathFX.noise(((_n_t_b7 * 9) + (_n_r_b14 * 0.45)),_n_n_b8) * 0.5))
				if _S.truth((_n_half_b16 < 0.3)):
					_n_r_b14 += 1.0
					continue
				var _n_cx_b17 = ((_n_x_b2 + (((_n_sway_b6 * _n_u_b15) * _n_u_b15) * _n_lh_b10)) + ((_S.MathFX.noise(((_n_t_b7 * 4) + (_n_r_b14 * 0.2)),(_n_n_b8 + 7)) * _n_u_b15) * 1.1))
				if true:
					var _n_px_b18 = floori((_n_cx_b17 - _n_half_b16)+0.5)
					while _S.truth((_n_px_b18 <= floori((_n_cx_b17 + _n_half_b16)+0.5))):
						_S.invoke(_n_p_b0,"px",[_n_px_b18, floori((_n_y_b3 - _n_r_b14)+0.5), _n_col_b13])
						_n_px_b18 += 1.0
				_n_r_b14 += 1.0
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "seed", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13))
	_S.define(_e, "CHAR", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "ink"), _S.prop(_S.read(_e, "F"), 0), 0.45]))
	_S.define(_e, "SCORCH", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "ink"), _S.call_value(_S.read(_e, "hex"), ["#3a2216"]), 0.6]))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), 0.4]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#8a7276"]), _S.prop(_S.read(_e, "F"), 2), 0.2]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "inField"), [_S.read(_e, "seed")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "outField"), [_S.binary("+", _S.read(_e, "seed"), 1)]))
	_S.define(_e, "heat", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "ph", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "fleck", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "jit", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "vein", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.Accelerators.TransitionKernels.burn_initialize(_e)
	_S.define(_e, "FL", _S.construct(_S.read(_e, "Float32Array"), [64]))
	_S.define(_e, "HV", _S.construct(_S.read(_e, "Float32Array"), [64]))
	_S.define(_e, "TW", _S.construct(_S.read(_e, "Uint8Array"), [64]))
	_S.define(_e, "kIn", _S.function_value(_e, "_f7"))
	_S.define(_e, "kOut", _S.function_value(_e, "_f8"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "ash", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": _S.read(_e, "ASH")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "line", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "pin", 0)
	_S.define(_e, "pout", 0)
	_S.define(_e, "closed", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "RATE", _S.merge([{"in": [0.006, 0.0014, 0.0006, 0.0024, 0.0012, 0.0004]}, {"out": [0.006, 0.0005, 0.0004, 0.0012, 0.0004, 0.0004]}]))
	_S.define(_e, "shed", _S.function_value(_e, "_f9"))
	_S.define(_e, "LIT", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#8a7276"]), _S.prop(_S.read(_e, "F"), 3), 0.25]))
	_S.define(_e, "DIM", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "SMOKE_RAMP"), 3)]))
	_S.define(_e, "drawSmoke", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f7(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_t_b0 = _S.arg(_args,0)
	return ((_S.named_value(_n_A,"lo") - 8) + (((_S.named_value(_n_A,"hi") - _S.named_value(_n_A,"lo")) + 8) * pow((float(maxf(0,_n_t_b0))/_n_CLOSE),1.25)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SMOULDER = _S.read(_parent,"SMOULDER")
	var _n_POP = _S.read(_parent,"POP")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_t_b0 = _S.arg(_args,0)
	return (((_S.named_value(_n_B,"lo") - 24) + (24 * _S.invoke(_n_ease,"inQuad",[clampf((float((_n_t_b0 - _n_SMOULDER))/(_n_POP - _n_SMOULDER)),0.0,1.0)]))) if _S.truth((_n_t_b0 < _n_POP)) else (_S.named_value(_n_B,"lo") + (((_S.named_value(_n_B,"hi") - _S.named_value(_n_B,"lo")) + 16) * _S.invoke(_n_ease,"outQuad",[clampf((float((_n_t_b0 - _n_POP))/(_n_OPEN - _n_POP)),0.0,1.0)]))))
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "inA", _S.arg(_args, 1))
	var _v9 = (_S.prop(_S.read(_e, "RATE"), "in") if _S.truth(_S.read(_e, "inA")) else _S.prop(_S.read(_e, "RATE"), "out"))
	_S.define(_e, "fl", _S.prop(_v9, 0))
	_S.define(_e, "em", _S.prop(_v9, 1))
	_S.define(_e, "sm", _S.prop(_v9, 2))
	_S.define(_e, "sh", _S.prop(_v9, 3))
	_S.define(_e, "as", _S.prop(_v9, 4))
	_S.define(_e, "li", _S.prop(_v9, 5))
	_S.define(_e, "x", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "W")), 0.5))
	_S.define(_e, "y", _S.binary("+", _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "W")), 0), 0.5))
	_S.define(_e, "end", (_S.binary("+", _S.read(_e, "POP"), 0.1) if _S.truth(_S.read(_e, "inA")) else _S.binary("-", _S.read(_e, "D"), 0.05)))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "R"), "next", []))
	if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "fl"), "-=", false), 0)):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "life", _S.call_value(_S.read(_v10, "lifeLeft"), [_S.invoke(_S.read(_v10, "R"), "range", [0.18, 0.4]), _S.read(_v10, "t"), _S.read(_v10, "end")]))
		if _S.truth(_S.binary(">", _S.read(_v10, "life"), 0.08)):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "FIRE"), _S.read(_v10, "x"), _S.binary("-", _S.read(_v10, "y"), 3), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [25, 50])), _S.read(_v10, "life"), 0, _S.invoke(_S.read(_v10, "R"), "range", [0.8, 1.7])])
	else:
		if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "em"), "-=", false), 0)):
			var _v11 = _S.scope(_e)
			_S.define(_v11, "life", _S.call_value(_S.read(_v11, "lifeLeft"), [(_S.invoke(_S.read(_v11, "R"), "range", [0.6, 1.3]) if _S.truth(_S.read(_v11, "inA")) else _S.invoke(_S.read(_v11, "R"), "range", [0.5, 1])), _S.read(_v11, "t"), _S.read(_v11, "end")]))
			if _S.truth(_S.binary(">", _S.read(_v11, "life"), 0.2)):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "EMBER"), _S.read(_v11, "x"), _S.binary("-", _S.read(_v11, "y"), 2), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [40, 100])), _S.read(_v11, "life"), 0, (2 if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.25])) else 1)])
		else:
			if _S.truth(_S.binary("<", _S.write(_e, "r", _S.binary("+", _S.read(_e, "sm"), _S.binary("*", _S.read(_e, "sh"), _S.binary("**", _S.prop(_S.read(_e, "heat"), _S.read(_e, "i")), 2))), "-=", false), 0)):
				var _v12 = _S.scope(_e)
				_S.define(_v12, "n", _S.invoke(_S.read(_v12, "R"), "int", [4, 6]))
				_S.define(_v12, "vx", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 6), 6]))
				_S.define(_v12, "up", _S.binary("<", _S.prop(_S.prop((_S.read(_v12, "A") if _S.truth(_S.read(_v12, "inA")) else _S.read(_v12, "B")), "ny"), _S.read(_v12, "i")), _S.unary("-", 0.25)))
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "j", 0)
				while _S.truth(_S.binary("<", _S.read(_v13, "j"), _S.read(_v13, "n"))):
					var _v14 = _S.scope(_v13)
					_S.define(_v14, "life", _S.call_value(_S.read(_v14, "lifeLeft"), [(_S.invoke(_S.read(_v14, "R"), "range", [0.8, 1.3]) if _S.truth(_S.read(_v14, "up")) else _S.invoke(_S.read(_v14, "R"), "range", [0.35, 0.65])), _S.binary("+", _S.read(_v14, "t"), _S.binary("*", _S.read(_v14, "j"), 0.05)), _S.read(_v14, "end")]))
					if _S.truth(_S.binary(">", _S.read(_v14, "life"), 0.4)):
						_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SMOKE"), _S.binary("+", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3.5), 3.5])), _S.binary("-", _S.binary("-", _S.read(_v14, "y"), 4), _S.binary("*", _S.read(_v14, "j"), 1.2)), _S.binary("+", _S.read(_v14, "vx"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [18, 34])), _S.read(_v14, "life"), _S.read(_v14, "SMOKE"), _S.invoke(_S.read(_v14, "R"), "range", [2.8, 4.8]), _S.binary("*", _S.read(_v14, "j"), 0.05)])
					_v13 = _S.iteration(_v13)
					_S.write(_v13, "j", 1, "+=", true)
			else:
				if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "as"), "-=", false), 0)):
					var _v15 = _S.scope(_e)
					_S.define(_v15, "life", _S.call_value(_S.read(_v15, "lifeLeft"), [_S.invoke(_S.read(_v15, "R"), "range", [0.9, 1.6]), _S.read(_v15, "t"), _S.read(_v15, "end")]))
					if _S.truth(_S.binary(">", _S.read(_v15, "life"), 0.3)):
						_S.invoke(_S.read(_v15, "ash"), "spawn", [_S.prop(_S.read(_v15, "P"), "EMBER"), _S.read(_v15, "x"), _S.binary("-", _S.read(_v15, "y"), 2), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 18), 18]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [25, 60])), _S.read(_v15, "life")])
				else:
					if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "li"), "-=", false), 0)):
						_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 4), _S.invoke(_S.read(_e, "R"), "range", [20, 32]), _S.read(_e, "WARM"), _S.invoke(_S.read(_e, "R"), "range", [0.14, 0.26]), _S.invoke(_S.read(_e, "R"), "range", [0.18, 0.4])])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_COVER = _S.read(_parent,"COVER")
	var _n_SMOULDER = _S.read(_parent,"SMOULDER")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_kIn = _S.read(_parent,"kIn")
	var _n_kOut = _S.read(_parent,"kOut")
	var _n_A = _S.read(_parent,"A")
	var _n_B = _S.read(_parent,"B")
	var _n_P = _S.read(_parent,"P")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_DIM = _S.read(_parent,"DIM")
	var _n_LIT = _S.read(_parent,"LIT")
	var _n_SMOKE_RAMP = _S.read(_parent,"SMOKE_RAMP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_p0_b1 = _S.arg(_args,1)
	var _n_inPhase_b2 = (_n_t < _n_COVER)
	var _n_open_b3 = ((_n_t < (_n_OPEN + 0.25)) if _S.truth((_n_t >= _n_SMOULDER)) else (_n_t >= _n_SMOULDER))
	var _n_k_b4 = (_S.call_value(_n_kIn,[_n_t]) if _S.truth(_n_inPhase_b2) else _S.call_value(_n_kOut,[_n_t]))
	var _n_f_b5 = (_S.named_value(_n_A,"f") if _S.truth(_n_inPhase_b2) else _S.named_value(_n_B,"f"))
	for _iter_0 in _S.array(_S.named_value(_n_ps,"list")):
		var _n_q_b6 = _iter_0
		if _S.truth((_S.binary("!==",_S.named_value(_n_q_b6,"k"),_S.named_value(_n_P,"SMOKE")) if _S.truth(_S.binary("!==",_S.named_value(_n_q_b6,"k"),_S.named_value(_n_P,"SMOKE"))) else (_S.named_value(_n_q_b6,"delay") > 0))):
			continue
		var _n_kk_b7 = (float(_S.named_value(_n_q_b6,"life"))/_S.named_value(_n_q_b6,"max"))
		var _n_age_b8 = (1 - _n_kk_b7)
		var _n_r_b9 = (_S.named_value(_n_q_b6,"size") * ((0.65 + (minf(1,(_n_age_b8 * 2.5)) * 0.45)) + (_n_age_b8 * 0.4)))
		var _n_i_b10 = ((clampf(floori(_S.named_value(_n_q_b6,"y")),0,(_n_H - 1)) * _n_W) + clampf(floori(_S.named_value(_n_q_b6,"x")),0,(_n_W - 1)))
		var _n_e_b11 = (((_n_k_b4 - _S.index_value(_n_f_b5,_n_i_b10)) if _S.truth(_n_inPhase_b2) else (_S.index_value(_n_f_b5,_n_i_b10) - _n_k_b4)) if _S.truth((_n_inPhase_b2 if _S.truth(_n_inPhase_b2) else _n_open_b3)) else 99)
		var _n_lit_b12 = clampf((1 - (float(absf(_n_e_b11))/30)),0.0,1.0)
		var _n_a_b13 = (((minf(1,(_n_age_b8 * 12)) * minf(1,(_n_kk_b7 * 2.4))) * 0.58) * ((0.05 + (0.95 * _n_lit_b12)) if _S.truth((_n_e_b11 > 0)) else (1 if _S.truth(_n_inPhase_b2) else (0.2 + (0.8 * _n_lit_b12)))))
		if _S.truth((_n_a_b13 < 0.04)):
			continue
		var _n_c_b14 = _S.ColorFX.mix(_S.ColorFX.mix(_n_DIM,_n_LIT,_n_lit_b12),_S.index_value(_n_SMOKE_RAMP,2),(_n_age_b8 * 0.5))
		var _n_d_b15 = (_n_p0_b1 if _S.truth((((_S.named_value(_n_q_b6,"y") + _n_r_b9) < (_n_H - 1)) if _S.truth((((_S.named_value(_n_q_b6,"x") + _n_r_b9) < (_n_W - 1)) if _S.truth((((_S.named_value(_n_q_b6,"y") - _n_r_b9) > 0) if _S.truth(((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0)) else ((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0))) else (((_S.named_value(_n_q_b6,"y") - _n_r_b9) > 0) if _S.truth(((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0)) else ((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0)))) else (((_S.named_value(_n_q_b6,"x") + _n_r_b9) < (_n_W - 1)) if _S.truth((((_S.named_value(_n_q_b6,"y") - _n_r_b9) > 0) if _S.truth(((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0)) else ((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0))) else (((_S.named_value(_n_q_b6,"y") - _n_r_b9) > 0) if _S.truth(((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0)) else ((_S.named_value(_n_q_b6,"x") - _n_r_b9) > 0))))) else _n_p_b0)
		_S.invoke(_n_d_b15,"disc",[_S.named_value(_n_q_b6,"x"), _S.named_value(_n_q_b6,"y"), _n_r_b9, _n_c_b14, (_n_a_b13 * 0.45)])
		_S.invoke(_n_d_b15,"disc",[(_S.named_value(_n_q_b6,"x") + (_n_r_b9 * 0.05)), (_S.named_value(_n_q_b6,"y") + (_n_r_b9 * 0.06)), (_n_r_b9 * 0.74), _n_c_b14, (_n_a_b13 * 0.62)])
		if _S.truth((_n_age_b8 < 0.5)):
			_S.invoke(_n_d_b15,"disc",[(_S.named_value(_n_q_b6,"x") - (_n_r_b9 * 0.22)), (_S.named_value(_n_q_b6,"y") - (_n_r_b9 * 0.3)), (_n_r_b9 * 0.5), _S.ColorFX.mix(_n_c_b14,_n_WHITE,0.15), ((_n_a_b13 * 0.4) * (1 - (_n_age_b8 * 2)))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "COVER"))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "k", _S.call_value(_S.read(_v19, "kIn"), [_S.read(_v19, "t")]))
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v19, "pin"), _S.prop(_S.prop(_S.read(_v19, "A"), "order"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v19, "A"), "f"), _S.prop(_S.prop(_S.read(_v19, "A"), "order"), _S.read(_v19, "pin"))), _S.read(_v19, "k")))):
			_S.call_value(_S.read(_v19, "shed"), [_S.prop(_S.prop(_S.read(_v19, "A"), "order"), _S.write(_v19, "pin", 1, "+=", true)), true])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v19, "closed")), func(): return _S.binary(">=", _S.read(_v19, "t"), _S.read(_v19, "CLOSE")))):
			var _v20 = _S.scope(_v19)
			_S.write(_v20, "closed", true, "=", false)
			_S.define(_v20, "i", _S.prop(_S.prop(_S.read(_v20, "A"), "order"), _S.binary("-", _S.prop(_S.prop(_S.read(_v20, "A"), "order"), "length"), 1)))
			_S.define(_v20, "x", _S.binary("%", _S.read(_v20, "i"), _S.read(_v20, "W")))
			_S.define(_v20, "y", _S.binary("|", _S.binary("/", _S.read(_v20, "i"), _S.read(_v20, "W")), 0))
			_S.invoke(_S.read(_v20, "lights"), "add", [_S.read(_v20, "x"), _S.read(_v20, "y"), 64, _S.read(_v20, "WARM"), 0.5, 0.4])
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v21, "j"), 12)):
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "EMBER"), _S.binary("+", _S.read(_v21, "x"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 6), 6])), _S.binary("+", _S.read(_v21, "y"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [40, 120])), _S.invoke(_S.read(_v21, "R"), "range", [0.5, 0.75]), 0, (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.3])) else 1)])
				_v21 = _S.iteration(_v21)
				_S.write(_v21, "j", 1, "+=", true)
			var _v22 = _S.scope(_v20)
			_S.define(_v22, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "j"), 5)):
				_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.binary("+", _S.read(_v22, "x"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8])), _S.binary("+", _S.read(_v22, "y"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 4), 2])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [12, 28])), _S.invoke(_S.read(_v22, "R"), "range", [1.1, 1.6]), _S.read(_v22, "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [3.5, 5.5]), _S.invoke(_S.read(_v22, "R"), "range", [0, 0.15])])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SMOULDER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "i", _S.prop(_S.prop(_S.read(_v23, "B"), "order"), _S.invoke(_S.read(_v23, "R"), "int", [0, 400])))
		_S.define(_v23, "x", _S.binary("+", _S.binary("%", _S.read(_v23, "i"), _S.read(_v23, "W")), 0.5))
		_S.define(_v23, "y", _S.binary("+", _S.binary("|", _S.binary("/", _S.read(_v23, "i"), _S.read(_v23, "W")), 0), 0.5))
		if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.6])):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.read(_v23, "x"), _S.read(_v23, "y"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [8, 16])), _S.call_value(_S.read(_v23, "lifeLeft"), [_S.invoke(_S.read(_v23, "R"), "range", [0.9, 1.4]), _S.read(_v23, "t"), _S.binary("-", _S.read(_v23, "D"), 0.05)]), _S.read(_v23, "SMOKE"), _S.invoke(_S.read(_v23, "R"), "range", [2, 3.5])])
		else:
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "EMBER"), _S.read(_v23, "x"), _S.read(_v23, "y"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [15, 40])), _S.invoke(_S.read(_v23, "R"), "range", [0.4, 0.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v24 = _S.scope(_e)
		_S.write(_v24, "popped", true, "=", false)
		_S.invoke(_S.read(_v24, "lights"), "add", [_S.prop(_S.read(_v24, "B"), "ox"), _S.prop(_S.read(_v24, "B"), "oy"), 90, _S.read(_v24, "WARM"), 0.6, 0.45])
		_S.invoke(_S.read(_v24, "lights"), "add", [_S.prop(_S.read(_v24, "B"), "ox"), _S.prop(_S.read(_v24, "B"), "oy"), 34, _S.prop(_S.read(_v24, "F"), 7), 0.7, 0.12])
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "j"), 12)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")]))
			_S.define(_v26, "sp", _S.invoke(_S.read(_v26, "R"), "range", [50, 150]))
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v26, "B"), "ox"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), 3)), _S.binary("+", _S.prop(_S.read(_v26, "B"), "oy"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), 2)), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "sp")), 0.7), 40), _S.invoke(_S.read(_v26, "R"), "range", [0.4, 0.9]), 0, (2 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.3])) else 1)])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "j", 1, "+=", true)
		var _v27 = _S.scope(_v24)
		_S.define(_v27, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "j"), 10)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a", _S.invoke(_S.read(_v28, "R"), "range", [0, _S.read(_v28, "TAU")]))
			_S.define(_v28, "sp", _S.invoke(_S.read(_v28, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "SPARK"), _S.prop(_S.read(_v28, "B"), "ox"), _S.prop(_S.read(_v28, "B"), "oy"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), 50), _S.invoke(_S.read(_v28, "R"), "range", [0.15, 0.35])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.2)))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "k", _S.call_value(_S.read(_v29, "kOut"), [_S.read(_v29, "t")]))
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v29, "pout"), _S.prop(_S.prop(_S.read(_v29, "B"), "order"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v29, "B"), "f"), _S.prop(_S.prop(_S.read(_v29, "B"), "order"), _S.read(_v29, "pout"))), _S.read(_v29, "k")))):
			_S.call_value(_S.read(_v29, "shed"), [_S.prop(_S.prop(_S.read(_v29, "B"), "order"), _S.write(_v29, "pout", 1, "+=", true)), false])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ash"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.set_prop(_S.read(_e, "line"), "length", 0, "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "COVER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SMOULDER")))):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, 0, _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "ink")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.25))):
			var _v30 = _S.scope(_e)
			_S.define(_v30, "inPhase", _S.binary("<", _S.read(_v30, "t"), _S.read(_v30, "COVER")))
			_S.define(_v30, "k", (_S.call_value(_S.read(_v30, "kIn"), [_S.read(_v30, "t")]) if _S.truth(_S.read(_v30, "inPhase")) else _S.call_value(_S.read(_v30, "kOut"), [_S.read(_v30, "t")])))
			_S.define(_v30, "Fd", (_S.read(_v30, "A") if _S.truth(_S.read(_v30, "inPhase")) else _S.read(_v30, "B")))
			_S.define(_v30, "f", _S.prop(_S.read(_v30, "Fd"), "f"))
			_S.define(_v30, "g", _S.prop(_S.read(_v30, "Fd"), "g"))
			_S.define(_v30, "fade", (_S.binary("-", 1, _S.call_value(_S.read(_v30, "smooth"), [_S.binary("-", _S.read(_v30, "COVER"), 0.15), _S.read(_v30, "COVER"), _S.read(_v30, "t")])) if _S.truth(_S.read(_v30, "inPhase")) else 1))
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "j"), 64)):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "q", _S.binary("/", _S.read(_v32, "j"), 63))
				_S.set_prop(_S.read(_v32, "FL"), _S.read(_v32, "j"), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_v32, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v32, "t"), 7), _S.binary("*", _S.read(_v32, "q"), 9))]))), "=", false)
				_S.set_prop(_S.read(_v32, "HV"), _S.read(_v32, "j"), _S.binary("*", 0.3, _S.invoke(_S.read(_v32, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v32, "t"), 5.5), _S.binary("*", _S.read(_v32, "q"), 11))])), "=", false)
				_S.set_prop(_S.read(_v32, "TW"), _S.read(_v32, "j"), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v32, "t"), 13), _S.binary("*", _S.read(_v32, "q"), 40))]), _S.unary("-", 0.5))) else 0), "=", false)
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "j", 1, "+=", true)
			_S.define(_v30, "px", _S.call_value(_S.read(_v30, "pixels"), [_S.read(_v30, "p0")]))
			_S.define(_v30, "ord", _S.prop(_S.read(_v30, "Fd"), "order"))
			_S.define(_v30, "N", _S.prop(_S.read(_v30, "ord"), "length"))
			_S.define(_v30, "su", _S.call_value(_S.read(_v30, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v30, "t"), _S.read(_v30, "SMOULDER")), _S.binary("-", _S.read(_v30, "POP"), _S.read(_v30, "SMOULDER")))]))
			_S.define(_v30, "SR", _S.binary("+", 5, _S.binary("*", 17, _S.read(_v30, "su"))))
			_S.define(_v30, "sk", (0 if _S.truth(_S.logical("||", _S.read(_v30, "inPhase"), func(): return _S.binary("<", _S.read(_v30, "t"), _S.read(_v30, "SMOULDER")))) else (_S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_v30, "su"))) if _S.truth(_S.binary("<", _S.read(_v30, "t"), _S.read(_v30, "POP"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v30, "t"), _S.read(_v30, "POP")), 0.3)))))
			_S.define(_v30, "shadeAt", _S.function_value(_v30, "_f13"))
			_S.define(_v30, "lo", _S.invoke(_S.read(_v30, "Fd"), "below", [_S.binary("-", _S.read(_v30, "k"), (33 if _S.truth(_S.read(_v30, "inPhase")) else _S.read(_v30, "POOL")))]))
			_S.define(_v30, "hi", _S.invoke(_S.read(_v30, "Fd"), "below", [_S.invoke(_S.read(_v30, "Math"), "max", [_S.binary("+", _S.read(_v30, "k"), (_S.read(_v30, "POOL") if _S.truth(_S.read(_v30, "inPhase")) else 33)), (_S.binary("+", _S.prop(_S.read(_v30, "B"), "lo"), _S.read(_v30, "SR")) if _S.truth(_S.binary(">", _S.read(_v30, "sk"), 0)) else _S.unary("-", 1000000000))])]))
			var _v39 = ([0, _S.read(_v30, "lo"), _S.read(_v30, "lo"), _S.read(_v30, "hi")] if _S.truth(_S.read(_v30, "inPhase")) else [_S.read(_v30, "hi"), _S.read(_v30, "N"), _S.read(_v30, "lo"), _S.read(_v30, "hi")])
			_S.define(_v30, "c0", _S.prop(_v39, 0))
			_S.define(_v30, "c1", _S.prop(_v39, 1))
			_S.define(_v30, "a0", _S.prop(_v39, 2))
			_S.define(_v30, "a1", _S.prop(_v39, 3))
			_S.Accelerators.TransitionKernels.burn_slice(_v30,true)
			_S.Accelerators.TransitionKernels.burn_slice(_v30,false)
			for _v40 in _S.array(_S.read(_v30, "line")):
				var _v41 = _S.scope(_v30)
				_S.define(_v41, "i", _v40)
				var _v42 = _S.scope(_v41)
				_S.define(_v42, "x", _S.binary("%", _S.read(_v42, "i"), _S.read(_v42, "W")))
				_S.define(_v42, "y", _S.binary("|", _S.binary("/", _S.read(_v42, "i"), _S.read(_v42, "W")), 0))
				_S.define(_v42, "dn", (_S.unary("-", _S.prop(_S.prop(_S.read(_v42, "Fd"), "ny"), _S.read(_v42, "i"))) if _S.truth(_S.read(_v42, "inPhase")) else _S.prop(_S.prop(_S.read(_v42, "Fd"), "ny"), _S.read(_v42, "i"))))
				_S.define(_v42, "h0", _S.call_value(_S.read(_v42, "rand"), [_S.read(_v42, "x"), _S.binary(">>", _S.read(_v42, "y"), 3), _S.binary("+", _S.read(_v42, "seed"), 51)]))
				if _S.truth(_S.binary(">", _S.read(_v42, "h0"), _S.binary("+", 0.12, _S.binary("*", 0.6, _S.invoke(_S.read(_v42, "Math"), "max", [0, _S.read(_v42, "dn")]))))):
					continue
				_S.define(_v42, "n", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v42, "x"), 7), _S.binary("*", _S.binary(">>", _S.read(_v42, "y"), 4), 131)), 977))
				_S.define(_v42, "hv", _S.prop(_S.read(_v42, "heat"), _S.read(_v42, "i")))
				_S.define(_v42, "leap", _S.binary("+", 1, _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_v42, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v42, "t"), 2.6), _S.binary("*", _S.read(_v42, "n"), 3.1)), _S.binary("+", _S.read(_v42, "n"), 70)]), 0.5)]), 1.8)))
				_S.define(_v42, "h", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", 5, _S.binary("*", 7, _S.call_value(_S.read(_v42, "rand"), [_S.read(_v42, "x"), 1, _S.binary("+", _S.read(_v42, "seed"), 53)]))), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v42, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v42, "t"), 3.3), _S.binary("*", _S.read(_v42, "n"), 1.7)), _S.read(_v42, "n")])))), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v42, "hv")))), _S.read(_v42, "leap")), _S.read(_v42, "fade")), (_S.binary("+", 0.65, _S.binary("*", 0.5, _S.read(_v42, "dn"))) if _S.truth(_S.binary(">", _S.read(_v42, "dn"), 0)) else 0.5)))
				if _S.truth(_S.binary(">=", _S.read(_v42, "h"), 1.5)):
					_S.call_value(_S.read(_v42, "tongue"), [_S.read(_v42, "p"), _S.read(_v42, "F"), _S.binary("+", _S.read(_v42, "x"), 0.5), _S.binary("+", _S.read(_v42, "y"), 1), _S.read(_v42, "h"), _S.binary("*", _S.binary("+", 1.1, _S.binary("*", 0.7, _S.read(_v42, "hv"))), _S.binary("+", 0.8, _S.binary("/", _S.read(_v42, "h"), 16))), _S.binary("*", _S.call_value(_S.read(_v42, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v42, "t"), 2.2), _S.read(_v42, "n")), _S.binary("+", _S.read(_v42, "n"), 40)]), 1.5), _S.read(_v42, "t"), _S.read(_v42, "n")])
	_S.call_value(_S.read(_e, "drawSmoke"), [_S.read(_e, "p"), _S.read(_e, "p0")])
	_S.invoke(_S.read(_e, "ash"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_f = _S.read(_parent,"f")
	var _n_inPhase = _S.read(_parent,"inPhase")
	var _n_g = _S.read(_parent,"g")
	var _n_px = _S.read(_parent,"px")
	var _n_SCORCH = _S.read(_parent,"SCORCH")
	var _n_HALO = _S.read(_parent,"HALO")
	var _n_POOL = _S.read(_parent,"POOL")
	var _n_WARM = _S.read(_parent,"WARM")
	var _n_FL = _S.read(_parent,"FL")
	var _n_ph = _S.read(_parent,"ph")
	var _n_heat = _S.read(_parent,"heat")
	var _n_HV = _S.read(_parent,"HV")
	var _n_line = _S.read(_parent,"line")
	var _n_F = _S.read(_parent,"F")
	var _n_sk = _S.read(_parent,"sk")
	var _n_B = _S.read(_parent,"B")
	var _n_SR = _S.read(_parent,"SR")
	var _n_vein = _S.read(_parent,"vein")
	var _n_fleck = _S.read(_parent,"fleck")
	var _n_TW = _S.read(_parent,"TW")
	var _n_fade = _S.read(_parent,"fade")
	var _n_jit = _S.read(_parent,"jit")
	var _n_CHAR = _S.read(_parent,"CHAR")
	var _n_ink = _S.read(_parent,"ink")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_e_b1 = ((_n_k - _S.index_value(_n_f,_n_i_b0)) if _S.truth(_n_inPhase) else (_S.index_value(_n_f,_n_i_b0) - _n_k))
	var _n_s_b2 = (_n_e_b1 * _S.index_value(_n_g,_n_i_b0))
	_S.invoke(_n_px,"at",[_n_i_b0])
	if _S.truth((_n_e_b1 < 0)):
		if _S.truth(((_n_s_b2 > (-2.5)) if _S.truth(_n_inPhase) else _n_inPhase)):
			_S.invoke(_n_px,"blend",[_n_SCORCH, (0.5 * (1 + (float(_n_s_b2)/2.5)))])
		var _n_u_b7 = maxf(0,(1 + (float(_n_e_b1)/_n_HALO)))
		var _n_v_b8 = (1 + (float(_n_e_b1)/_n_POOL))
		_S.invoke(_n_px,"add",[_n_WARM, ((((0.3 * _n_u_b7) * _n_u_b7) + ((0.12 * _n_v_b8) * _n_v_b8)) * _S.index_value(_n_FL,_S.index_value(_n_ph,_n_i_b0)))])
		return null
	var _n_hv_b3 = clampf((_S.index_value(_n_heat,_n_i_b0) + _S.index_value(_n_HV,_S.index_value(_n_ph,_n_i_b0))),0.0,1.0)
	var _n_th_b4 = (0.6 + (0.6 * _n_hv_b3))
	var _n_u_b5 = (float(_n_s_b2)/_n_th_b4)
	if _S.truth((_n_u_b5 < 6.4)):
		if _S.truth((_n_u_b5 < 0.9)):
			_S.invoke(_n_line,"push",[_n_i_b0])
		_S.invoke(_n_px,"put",[((_S.index_value(_n_F,8) if _S.truth((_n_hv_b3 > 0.6)) else _S.index_value(_n_F,7)) if _S.truth((_n_u_b5 < 0.9)) else (_S.index_value(_n_F,6) if _S.truth((_n_u_b5 < 1.7)) else (_S.index_value(_n_F,5) if _S.truth((_n_u_b5 < 2.4)) else (_S.index_value(_n_F,4) if _S.truth((_n_u_b5 < 3.1)) else (_S.index_value(_n_F,3) if _S.truth((_n_u_b5 < 3.8)) else (_S.index_value(_n_F,2) if _S.truth((_n_u_b5 < 4.6)) else (_S.index_value(_n_F,1) if _S.truth((_n_u_b5 < 5.5)) else _S.index_value(_n_F,0))))))))])
		if _S.truth((_n_u_b5 < 4.6)):
			_S.invoke(_n_px,"add",[_n_WARM, ((0.45 * (1 - (float(_n_u_b5)/4.6))) * (0.7 + (0.3 * _n_hv_b3)))])
		return null
	if _S.truth(((_S.index_value(_n_f,_n_i_b0) < (_S.named_value(_n_B,"lo") + _n_SR)) if _S.truth((_n_sk > 0)) else (_n_sk > 0))):
		var _n_hm_b9 = (((1 - (float((_S.index_value(_n_f,_n_i_b0) - _S.named_value(_n_B,"lo")))/_n_SR)) * _n_sk) * (0.7 + (0.6 * _n_hv_b3)))
		if _S.truth((_S.index_value(_n_vein,_n_i_b0) < (0.04 + (0.08 * _n_hm_b9)))):
			_S.invoke(_n_px,"put",[(_S.index_value(_n_F,6) if _S.truth((_n_hm_b9 > 0.95)) else (_S.index_value(_n_F,5) if _S.truth((_n_hm_b9 > 0.75)) else (_S.index_value(_n_F,4) if _S.truth((_n_hm_b9 > 0.55)) else (_S.index_value(_n_F,3) if _S.truth((_n_hm_b9 > 0.38)) else (_S.index_value(_n_F,2) if _S.truth((_n_hm_b9 > 0.22)) else _S.index_value(_n_F,1))))))])
			_S.invoke(_n_px,"add",[_n_WARM, (0.4 * _n_hm_b9)])
			return null
		_S.invoke(_n_px,"add",[_n_WARM, ((0.2 * _n_hm_b9) * _n_hm_b9)])
	var _n_L_b6 = (_S.index_value(_n_fleck,_n_i_b0) * (0.8 + (0.4 * _n_hv_b3)))
	if _S.truth(((_n_s_b2 < _n_L_b6) if _S.truth((_n_L_b6 > 0)) else (_n_L_b6 > 0))):
		var _n_v_b10 = (float((_n_s_b2 - (6.4 * _n_th_b4)))/maxf(1,(_n_L_b6 - (6.4 * _n_th_b4))))
		if _S.truth((not _S.truth(((_n_fade <= ((float(_S.index_value(_n_jit,_n_i_b0))/1.5) + 0.5)) if _S.truth((_n_fade < 1)) else (_n_fade < 1))) if _S.truth((_S.index_value(_n_TW,_S.binary("&",(_S.index_value(_n_ph,_n_i_b0) * 5),63)) if _S.truth((_n_v_b10 < 1)) else (_n_v_b10 < 1))) else (_S.index_value(_n_TW,_S.binary("&",(_S.index_value(_n_ph,_n_i_b0) * 5),63)) if _S.truth((_n_v_b10 < 1)) else (_n_v_b10 < 1)))):
			_S.invoke(_n_px,"put",[(_S.index_value(_n_F,4) if _S.truth((_n_v_b10 < 0.3)) else (_S.index_value(_n_F,3) if _S.truth((_n_v_b10 < 0.55)) else (_S.index_value(_n_F,2) if _S.truth((_n_v_b10 < 0.8)) else _S.index_value(_n_F,1))))])
			_S.invoke(_n_px,"add",[_n_WARM, (0.3 * (1 - _n_v_b10))])
			return null
	if _S.truth((_n_e_b1 < 22)):
		_S.invoke(_n_px,"add",[_n_WARM, (0.2 * pow((1 - (float(_n_e_b1)/22)),2))])
	_S.invoke(_n_px,"put",[(_n_CHAR if _S.truth(((_n_u_b5 - 6.4) < ((1.6 * _n_th_b4) + _S.index_value(_n_jit,_n_i_b0)))) else _n_ink)])
	return null
