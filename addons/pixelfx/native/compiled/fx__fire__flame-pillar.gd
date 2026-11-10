@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/flame-pillar.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "simDraw", _S.import_value("fx/fire/_lib.js", "simDraw"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "rock", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Flame pillar"}, {"desc": "The floor cracks and glows, a column of fire erupts white-hot and roars, spewing embers and shedding flame, then collapses into rolling smoke."}, {"tags": ["fire", "pillar", "eruption", "spell", "ground", "one-shot"]}, {"size": [184, 256]}, {"origin": [92, 232]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"height": 140}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "ERUPT", 0.55)
	_S.define(_e, "RISE", 0.12)
	_S.define(_e, "FALL", 1.95)
	_S.define(_e, "GONE", 2.45)
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "rgb"), [255, 176, 96]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_c_b0 = _S.arg(_args,0)
	_n_c_b0 = _S.call_value(_n_hex,[_n_c_b0])
	return {"light":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.35),_n_WHITE,0.08),"body":_n_c_b0,"shade":_S.ColorFX.scale_color(_n_c_b0,0.64),"dust":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.2),_S.ColorFX.rgb(150,140,150),0.3)}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_r_b3 = (0.6 + (_S.named_value(_n_b_b1,"s") * 0.75))
	var _n_fade_b4 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_lx_b5 = ((cos(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	var _n_ly_b6 = ((sin(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"y") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"x") + _n_r_b3) + 1), ((_S.named_value(_n_b_b1,"y") + _n_r_b3) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"r":_n_r_b3,"lx":_n_lx_b5,"ly":_n_ly_b6,"st":_n_st_b2,"fade":_n_fade_b4,"this":_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_st = _S.read(_parent,"st")
	var _n_fade = _S.read(_parent,"fade")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.15), _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_r + 0.9))):
		return null
	var _n_lit_b6 = ((_n_dx_b3 * _n_lx) + (_n_dy_b4 * _n_ly))
	_S.set_prop(_n_out_b2,"c",(_n_OUTLINE if _S.truth((_n_d_b5 > _n_r)) else (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b6 < (-0.4))) else (_S.named_value(_n_st,"shade") if _S.truth((_n_lit_b6 > 0.6)) else _S.named_value(_n_st,"body")))),"=")
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "column", _S.function_value(_e, "_f4"))
	_S.define(_e, "cracksDraw", _S.function_value(_e, "_f6"))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "HMAX", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "S", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13))
	_S.define(_e, "cracks", [])
	_S.define(_e, "crack", _S.function_value(_e, "_f8"))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 9)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v19, "i"), 9), _S.read(_v19, "TAU")), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v19, "pts", _S.call_value(_S.read(_v19, "crack"), [_S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1]), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v19, "a"), _S.invoke(_S.read(_v19, "R"), "range", [20, 40]), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.16]), 1]))
		_S.define(_v19, "j", _S.binary("+", 3, _S.invoke(_S.read(_v19, "R"), "int", [0, _S.binary("-", _S.prop(_S.read(_v19, "pts"), "length"), 6)])))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v19, "pts"), "length"), 8)):
			_S.call_value(_S.read(_v19, "crack"), [_S.prop(_S.prop(_S.read(_v19, "pts"), _S.read(_v19, "j")), 0), _S.prop(_S.prop(_S.read(_v19, "pts"), _S.read(_v19, "j")), 1), _S.binary("+", _S.read(_v19, "a"), _S.binary("*", _S.invoke(_S.read(_v19, "R"), "sign", []), _S.invoke(_S.read(_v19, "R"), "range", [0.5, 1]))), _S.invoke(_S.read(_v19, "R"), "range", [6, 14]), _S.binary("+", 0.18, _S.invoke(_S.read(_v19, "R"), "range", [0, 0.15])), 0])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f9")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "erupted", false)
	_S.define(_e, "fell", false)
	_S.define(_e, "height", _S.function_value(_e, "_f10"))
	_S.define(_e, "width", _S.function_value(_e, "_f11"))
	_S.define(_e, "heat", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f4(_parent,_args:Array,_this=null):
	var _n_height = _S.read(_parent,"height")
	var _n_t = _S.read(_parent,"t")
	var _n_width = _S.read(_parent,"width")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_S = _S.read(_parent,"S")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_strands = _S.read(_parent,"strands")
	var _n_GLOW = _S.read(_parent,"GLOW")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_h_b1 = _S.call_value(_n_height,[_n_t])
	var _n_w0_b2 = _S.call_value(_n_width,[_n_t])
	if _S.truth(((_n_h_b1 < 1) if _S.truth((_n_h_b1 < 1)) else (_n_w0_b2 < 0.3))):
		return null
	if _S.truth((_n_t < (_n_FALL + 0.25))):
		var _n_k_b4 = clampf((float(_n_w0_b2)/12),0.0,1.0)
		var _n_NZ_b5 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < 5)):
				var _n_n_b7 = ((_n_S + _n_i_b6) * 17)
				var _n_dx_b8 = (((_n_i_b6 - 2) * _n_w0_b2) * 0.4)
				var _n_th_b9 = (((12 + (12 * (0.5 + (0.5 * _S.MathFX.noise(((_n_t * 3.3) + _n_i_b6),_n_n_b7))))) * _n_k_b4) * (1.2 if _S.truth(_S.binary("===",_n_i_b6,2)) else (0.6 if _S.truth(_S.binary("===",fmod(_n_i_b6,4),0)) else 0.9)))
				_S.call_value(_n_flameTongue,[_n_p_b0, (_n_dx_b8 + (_S.MathFX.noise((_n_t * 2),(_n_n_b7 + 2)) * 1.5)), ((-_n_h_b1) + 12), _n_th_b9, ((3.4 * _n_k_b4) * (0.7 if _S.truth(_S.binary("===",fmod(_n_i_b6,4),0)) else 1)), (((-_n_dx_b8) * 0.3) + (_S.MathFX.noise((_n_t * 2.2),(_n_n_b7 + 1)) * 3)), _n_NZ_b5, _n_n_b7, _n_H, _n_LAYERS])
				_n_i_b6 += 1.0
	var _n_lvlC_b3 = [_S.index_value(_n_H,0), _S.index_value(_n_H,1), _S.index_value(_n_H,2), _S.index_value(_n_H,3), _S.index_value(_n_H,4), _S.index_value(_n_H,5), _S.index_value(_n_H,6), _S.index_value(_n_H,7)]
	if true:
		var _n_y_b10 = 0
		while _S.truth((_n_y_b10 >= (-_n_h_b1))):
			var _n_v_b11 = (float((-_n_y_b10))/_n_h_b1)
			var _n_cx_b12 = ((_S.MathFX.noise((((-_n_y_b10) * 0.04) + (_n_t * 1.6)),(_n_S + 2)) * 1.6) * _n_v_b11)
			var _n_foot_b13 = (1 + (0.7 * pow(maxf(0,(1 - (float((-_n_y_b10))/12))),2)))
			var _n_top_b14 = (1 - (_S.MathFX.smooth(0.82,1,_n_v_b11) * 0.7))
			var _n_wl_b15 = (((_n_w0_b2 * _n_foot_b13) * _n_top_b14) * (1 + (0.65 * pow(maxf(0,_S.MathFX.noise(((_n_y_b10 * 0.2) + (_n_t * 8)),(_n_S + 3))),1.5))))
			var _n_wr_b16 = (((_n_w0_b2 * _n_foot_b13) * _n_top_b14) * (1 + (0.65 * pow(maxf(0,_S.MathFX.noise(((_n_y_b10 * 0.2) + (_n_t * 8)),(_n_S + 4))),1.5))))
			var _n_pulse_b17 = (1 if _S.truth((fmod((((-_n_y_b10) * 0.032) + (_n_t * 3.6)),1) < 0.09)) else 0)
			if true:
				var _n_x_b18 = floori((_n_cx_b12 - (_n_wl_b15 * 1.15)))
				while _S.truth((_n_x_b18 <= ceili((_n_cx_b12 + (_n_wr_b16 * 1.15))))):
					var _n_dx_b19 = ((_n_x_b18 + 0.5) - _n_cx_b12)
					var _n_q_b20 = (float(absf(_n_dx_b19))/(_n_wl_b15 if _S.truth((_n_dx_b19 < 0)) else _n_wr_b16))
					if _S.truth((_n_q_b20 > 1.15)):
						_n_x_b18 += 1.0
						continue
					var _n_lvl_b21 = (0 if _S.truth((_n_q_b20 < 0.12)) else (1 if _S.truth((_n_q_b20 < 0.26)) else (2 if _S.truth((_n_q_b20 < 0.42)) else (3 if _S.truth((_n_q_b20 < 0.56)) else (4 if _S.truth((_n_q_b20 < 0.7)) else (5 if _S.truth((_n_q_b20 < 0.84)) else (6 if _S.truth((_n_q_b20 < 0.96)) else 7)))))))
					for _iter_0 in _S.array(_n_strands):
						var _n_s_b22 = _iter_0
						if _S.truth((absf((((float(_n_dx_b19)/_n_w0_b2) - _S.named_value(_n_s_b22,"o")) - (0.06 * sin((((_n_t * _S.named_value(_n_s_b22,"f")) * 3) + (_S.named_value(_n_s_b22,"o") * 9)))))) < _S.named_value(_n_s_b22,"w"))):
							_n_lvl_b21 = maxf(0,(_n_lvl_b21 - 1))
					_n_lvl_b21 = maxf(0,(_n_lvl_b21 - _n_pulse_b17))
					if _S.truth(((_S.MathFX.rand([_n_x_b18,_n_y_b10,floori((_n_t * 20))]) < 0.5) if _S.truth(_S.binary("===",_n_lvl_b21,7)) else _S.binary("===",_n_lvl_b21,7))):
						_n_x_b18 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[_n_x_b18, _n_y_b10, _S.index_value(_n_lvlC_b3,_n_lvl_b21)])
					_n_x_b18 += 1.0
			if _S.truth(_S.binary("===",fmod(_n_y_b10,12),0)):
				_S.invoke(_n_p_b0,"glow",[_n_cx_b12, _n_y_b10, ((_n_w0_b2 * 2.4) + 8), _n_GLOW, (0.28 * clampf((float(_n_w0_b2)/12),0.0,1.0))])
			_n_y_b10 -= 1.0
	_S.invoke(_n_p_b0,"glow",[0, ((-_n_h_b1) * 0.45), 92, _n_GLOW, (0.3 * clampf((float(_n_w0_b2)/12),0.0,1.0))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.arg(_args,1)
	var _n_off_b2 = _S.arg(_args,2)
	return _S.MathFX.noise(((_n_t * _n_rate_b0) + _n_off_b2),_n_seed_b1)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_heat = _S.read(_parent,"heat")
	var _n_t = _S.read(_parent,"t")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_H = _S.read(_parent,"H")
	var _n_GLOW = _S.read(_parent,"GLOW")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_heat,[_n_t])
	if _S.truth((_n_k_b1 <= (-0.05))):
		return null
	for _iter_0 in _S.array(_n_cracks):
		var _n_c_b2 = _iter_0
		var _n_n_b3 = floori((_S.prop(_S.named_value(_n_c_b2,"pts"),"length") * clampf((float((_n_t - _S.named_value(_n_c_b2,"t0")))/_S.named_value(_n_c_b2,"grow")),0.0,1.0)))
		if true:
			var _n_i_b4 = 1
			while _S.truth((_n_i_b4 < _n_n_b3)):
				var _n_u_b5 = (float(_n_i_b4)/_S.prop(_S.named_value(_n_c_b2,"pts"),"length"))
				var _n_hot_b6 = (_n_k_b1 * (1 - (0.45 * _n_u_b5)))
				var _tuple_1 = _S.index_value(_S.named_value(_n_c_b2,"pts"),(_n_i_b4 - 1))
				var _n_x0_b7 = _S.prop(_tuple_1,0)
				var _n_y0_b8 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_S.named_value(_n_c_b2,"pts"),_n_i_b4)
				var _n_x1_b9 = _S.prop(_tuple_2,0)
				var _n_y1_b10 = _S.prop(_tuple_2,1)
				if _S.truth((_n_hot_b6 < 0)):
					var _n_a_b12 = (1 + (_n_hot_b6 * 3))
					if _S.truth((_n_a_b12 > 0)):
						_S.invoke(_n_p_b0,"line",[_n_x0_b7, _n_y0_b8, _n_x1_b9, _n_y1_b10, _n_SOOT, _n_a_b12])
					_n_i_b4 += 1.0
					continue
				var _n_col_b11 = (_S.index_value(_n_H,1) if _S.truth((_n_hot_b6 > 0.85)) else (_S.index_value(_n_H,2) if _S.truth((_n_hot_b6 > 0.65)) else (_S.index_value(_n_H,4) if _S.truth((_n_hot_b6 > 0.45)) else (_S.index_value(_n_H,5) if _S.truth((_n_hot_b6 > 0.25)) else (_S.index_value(_n_H,6) if _S.truth((_n_hot_b6 > 0.1)) else _S.index_value(_n_H,7))))))
				if _S.truth(((_n_hot_b6 > 0.2) if _S.truth(((_n_i_b4 < (_S.prop(_S.named_value(_n_c_b2,"pts"),"length") * 0.5)) if _S.truth(_S.named_value(_n_c_b2,"w")) else _S.named_value(_n_c_b2,"w"))) else ((_n_i_b4 < (_S.prop(_S.named_value(_n_c_b2,"pts"),"length") * 0.5)) if _S.truth(_S.named_value(_n_c_b2,"w")) else _S.named_value(_n_c_b2,"w")))):
					_S.invoke(_n_p_b0,"line",[_n_x0_b7, (_n_y0_b8 + 1), _n_x1_b9, (_n_y1_b10 + 1), (_S.index_value(_n_H,5) if _S.truth((_n_hot_b6 > 0.6)) else _S.index_value(_n_H,6))])
					_S.invoke(_n_p_b0,"line",[_n_x0_b7, (_n_y0_b8 - 1), _n_x1_b9, (_n_y1_b10 - 1), _S.index_value(_n_H,7)])
				_S.invoke(_n_p_b0,"line",[_n_x0_b7, _n_y0_b8, _n_x1_b9, _n_y1_b10, _n_col_b11])
				if _S.truth(_S.binary("===",fmod(_n_i_b4,2),0)):
					_S.invoke(_n_p_b0,"glow",[_n_x1_b9, _n_y1_b10, (5 + (7 * _n_hot_b6)), _n_GLOW, (0.3 * _n_hot_b6)])
				_n_i_b4 += 1.0
	if _S.truth((_n_k_b1 > 0)):
		_S.call_value(_n_floorLight,[_n_p_b0, 0, 0.5, 44, 8, _n_GLOW, (0.35 * _n_k_b1)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_t0_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_pts_b6 = [[_n_x_b0, _n_y_b1]]
	if true:
		var _n_d_b7 = 0
		while _S.truth((_n_d_b7 < _n_len_b3)):
			_n_a_b2 += _S.invoke(_n_R,"range",[(-0.55), 0.55])
			_n_x_b0 += (cos(_n_a_b2) * 2)
			_n_y_b1 += (sin(_n_a_b2) * 0.76)
			_S.invoke(_n_pts_b6,"push",[[_n_x_b0, _n_y_b1]])
			_n_d_b7 += 2
	_S.invoke(_n_cracks,"push",[{"pts":_n_pts_b6,"t0":_n_t0_b4,"grow":_S.invoke(_n_R,"range",[0.22, 0.36]),"w":_n_w_b5}])
	return _n_pts_b6
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"o":((_S.MathFX.rand([_n_i_b1,_n_S,1]) - 0.5) * 1.4),"w":(0.05 + (_S.MathFX.rand([_n_i_b1,_n_S,2]) * 0.06)),"f":(1 + (_S.MathFX.rand([_n_i_b1,_n_S,3]) * 2))}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_HMAX = _S.read(_parent,"HMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_RISE = _S.read(_parent,"RISE")
	var _n_S = _S.read(_parent,"S")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_tt_b0 < _n_ERUPT)) else ((_n_HMAX * _S.invoke(_n_ease,"outCubic",[(float((_n_tt_b0 - _n_ERUPT))/_n_RISE)])) if _S.truth((_n_tt_b0 < (_n_ERUPT + _n_RISE))) else ((_n_HMAX * (1 + (0.05 * _S.MathFX.noise((_n_tt_b0 * 3),_n_S)))) if _S.truth((_n_tt_b0 < _n_FALL)) else (_n_HMAX * (1 - _S.invoke(_n_ease,"inQuad",[clampf((float((_n_tt_b0 - _n_FALL))/(_n_GONE - _n_FALL)),0.0,1.0)]))))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_S = _S.read(_parent,"S")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_tt_b0 < _n_ERUPT)) else (((12 * (1 + (0.45 * exp(((-(_n_tt_b0 - _n_ERUPT)) * 7))))) * (0.94 + (0.06 * _S.MathFX.noise((_n_tt_b0 * 9),(_n_S + 1))))) if _S.truth((_n_tt_b0 < _n_FALL)) else ((12 * (1 - _S.MathFX.smooth(_n_FALL,_n_GONE,_n_tt_b0))) + (1.5 * (1 - _S.MathFX.smooth((_n_GONE - 0.1),_n_GONE,_n_tt_b0))))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_meta = _S.read(_parent,"meta")
	var _n_tt_b0 = _S.arg(_args,0)
	return (((_S.MathFX.smooth(0,_n_ERUPT,_n_tt_b0) * 0.75) + (0.25 * _S.MathFX.smooth((_n_ERUPT - 0.05),(_n_ERUPT + 0.1),_n_tt_b0))) - (_S.MathFX.smooth((_n_GONE - 0.3),(_S.named_value(_n_meta,"duration") - 0.6),_n_tt_b0) * 1.05))
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", _S.binary("*", 0.6, _S.read(_e, "dt")), 60), _S.call_value(_S.read(_e, "smooth"), [0.15, _S.read(_e, "ERUPT"), _S.read(_e, "t")]))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FIRE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [20, 45])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3]), 0, _S.invoke(_S.read(_e, "R"), "range", [1, 2.2])])
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "dt")), 60), _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "ERUPT"), _S.read(_e, "t")]))]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "c", _S.invoke(_S.read(_v20, "R"), "pick", [_S.read(_v20, "cracks")]))
		_S.define(_v20, "i", _S.invoke(_S.read(_v20, "R"), "int", [0, _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("*", _S.prop(_S.prop(_S.read(_v20, "c"), "pts"), "length"), _S.call_value(_S.read(_v20, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.prop(_S.read(_v20, "c"), "t0")), _S.prop(_S.read(_v20, "c"), "grow"))]))]), 1)]))
		if _S.truth(_S.binary(">=", _S.read(_v20, "i"), 0)):
			var _v21 = _S.scope(_v20)
			var _v22 = _S.prop(_S.prop(_S.read(_v21, "c"), "pts"), _S.read(_v21, "i"))
			_S.define(_v21, "x", _S.prop(_v22, 0))
			_S.define(_v21, "y", _S.prop(_v22, 1))
			if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])):
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "FIRE"), _S.read(_v21, "x"), _S.binary("-", _S.read(_v21, "y"), 1), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [15, 35])), _S.invoke(_S.read(_v21, "R"), "range", [0.15, 0.3]), 0, _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.6])])
			else:
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "EMBER"), _S.read(_v21, "x"), _S.binary("-", _S.read(_v21, "y"), 1), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 70])), _S.invoke(_S.read(_v21, "R"), "range", [0.5, 1]), _S.prop(_S.read(_v21, "H"), 3), 1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "erupted")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ERUPT")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "erupted", true, "=", false)
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 40), 90, _S.read(_v23, "WARM"), 0.7, 0.6])
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 8), 44, _S.read(_v23, "WHITE"), 0.7, 0.1])
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 70)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v25, "Math"), "PI")), 2), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [100, 260]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SPARK"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.invoke(_S.read(_v25, "R"), "range", [0.25, 0.7])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v23)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 18)):
			_S.invoke(_S.read(_v26, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v26, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 110), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [150, 330]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [1.6, 2.4])}, {"a": _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")])}, {"va": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v26, "R"), "int", [1, 3])}])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v27 = _S.scope(_v23)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 60)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v28, "Math"), "PI")), 2), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v28, "sp", _S.invoke(_S.read(_v28, "R"), "range", [80, 260]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "GRIT"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.invoke(_S.read(_v28, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v28, "R"), "pick", [[_S.prop(_S.read(_v28, "st"), "light"), _S.prop(_S.read(_v28, "st"), "body"), _S.prop(_S.read(_v28, "st"), "body"), _S.prop(_S.read(_v28, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v28, "R"), "chance", [0.4])) else 1)])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 14)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "s", _S.invoke(_S.read(_v30, "R"), "sign", []))
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SMOKE"), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [2, 10])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [40, 110])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 10])), _S.invoke(_S.read(_v30, "R"), "range", [1, 1.8]), _S.prop(_S.read(_v30, "st"), "dust"), _S.invoke(_S.read(_v30, "R"), "range", [4, 7]), _S.invoke(_S.read(_v30, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v30, "PF"), "BIG")])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "t")]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))), func(): return _S.binary(">", _S.read(_e, "h"), 4))):
		var _v31 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.9, _S.read(_v31, "dt")), 60)])):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "s", _S.invoke(_S.read(_v32, "R"), "sign", []))
			_S.define(_v32, "y", _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [4, _S.binary("*", _S.read(_v32, "h"), 0.9)])))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "FIRE"), _S.binary("*", _S.binary("*", _S.read(_v32, "s"), _S.read(_v32, "w")), _S.invoke(_S.read(_v32, "R"), "range", [0.7, 1.1])), _S.read(_v32, "y"), _S.binary("*", _S.read(_v32, "s"), _S.invoke(_S.read(_v32, "R"), "range", [15, 40])), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [30, 70])), _S.invoke(_S.read(_v32, "R"), "range", [0.25, 0.5]), 0, _S.invoke(_S.read(_v32, "R"), "range", [1.6, 3.2]), 0, (_S.prop(_S.read(_v32, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.35])) else 0)])
		if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.7, _S.read(_v31, "dt")), 60)])):
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "FIRE"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", _S.read(_v31, "w")), _S.read(_v31, "w")]), _S.binary("+", _S.unary("-", _S.read(_v31, "h")), _S.invoke(_S.read(_v31, "R"), "range", [0, 6])), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [30, 80])), _S.invoke(_S.read(_v31, "R"), "range", [0.35, 0.7]), 0, _S.invoke(_S.read(_v31, "R"), "range", [3, 5.5]), 0, (_S.binary("|", _S.prop(_S.read(_v31, "PF"), "SMOKES"), (_S.prop(_S.read(_v31, "PF"), "BIG") if _S.truth(_S.binary("<", _S.read(_v31, "t"), _S.binary("-", _S.read(_v31, "FALL"), 0.3))) else 0)) if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.6])) else 0)])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v31, "t"), _S.read(_v31, "FALL")), func(): return _S.invoke(_S.read(_v31, "R"), "chance", [_S.binary("*", _S.binary("*", 0.5, _S.read(_v31, "dt")), 60)]))):
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", _S.read(_v31, "w")), _S.read(_v31, "w")]), 0.6), _S.binary("+", _S.unary("-", _S.read(_v31, "h")), 4), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [50, 110])), _S.invoke(_S.read(_v31, "R"), "range", [0.7, 1.3]), _S.prop(_S.read(_v31, "H"), 3), (2 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.2])) else 1)])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FALL")), func(): return _S.unary("!", _S.read(_e, "fell")))):
		_S.write(_e, "fell", true, "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "fell"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "GONE"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 1.6, _S.read(_e, "dt")), 60)]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FIRE"), _S.invoke(_S.read(_e, "R"), "range", [_S.binary("-", _S.unary("-", _S.read(_e, "w")), 2), _S.binary("+", _S.read(_e, "w"), 2)]), _S.binary("-", _S.unary("-", _S.read(_e, "h")), _S.invoke(_S.read(_e, "R"), "range", [0, 8])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [10, 50])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.75]), 0, _S.invoke(_S.read(_e, "R"), "range", [3.5, 6.5]), 0, _S.prop(_S.read(_e, "PF"), "SMOKES")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v33 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "b", _v33)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v34, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v34, "b"), "dusted")))):
			var _v35 = _S.scope(_v34)
			_S.set_prop(_S.read(_v35, "b"), "dusted", true, "=", false)
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v36, "i"), 3)):
				_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v36, "b"), "x"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v36, "R"), "sign", []), _S.invoke(_S.read(_v36, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [2, 18])), _S.invoke(_S.read(_v36, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v36, "st"), "dust"), _S.invoke(_S.read(_v36, "R"), "range", [1.3, 2.6])])
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_cracksDraw = _S.read(_parent,"cracksDraw")
	var _n_ps = _S.read(_parent,"ps")
	var _n_H = _S.read(_parent,"H")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_t = _S.read(_parent,"t")
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_cracksDraw,[_n_p_b0])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "back"])
	var _n_k_b1 = (float((_n_t - _n_ERUPT))/0.45)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (84 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.18, maxf(1,(4 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_H,4), _S.index_value(_n_H,1)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f15")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_column = _S.read(_parent,"column")
	var _n_rock = _S.read(_parent,"rock")
	var _n_st = _S.read(_parent,"st")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_H = _S.read(_parent,"H")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_t = _S.read(_parent,"t")
	var _n_ERUPT = _S.read(_parent,"ERUPT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_column,[_n_p_b0])
	for _iter_0 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b3 = _iter_0
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b3, _n_st])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "front"])
	var _n_k_b1 = (float((_n_t - _n_ERUPT))/0.45)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (84 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.18, maxf(1,(4 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_H,4), _S.index_value(_n_H,1)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f17"), (_n_k_b1 < 0.15)])
	var _n_f_b2 = (float((_n_t - _n_ERUPT))/0.08)
	if _S.truth(((_n_f_b2 < 1) if _S.truth((_n_f_b2 > 0)) else (_n_f_b2 > 0))):
		_S.invoke(_n_p_b0,"ellipse",[0, (-2), (16 * (1 - (_n_f_b2 * 0.3))), 6, _S.index_value(_n_H,2)])
		_S.invoke(_n_p_b0,"ellipse",[0, (-3), (11 * (1 - (_n_f_b2 * 0.3))), 4, (_n_WHITE if _S.truth((_n_f_b2 < 0.5)) else _S.index_value(_n_H,1))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null
