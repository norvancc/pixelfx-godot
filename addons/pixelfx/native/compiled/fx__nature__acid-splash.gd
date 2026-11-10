@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/acid-splash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Drops", _S.import_value("fx/nature/_lib.js", "Drops"))
	_S.define(_e, "wisp", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Acid splash"}, {"desc": "A gob of acid bursts into a crown and spatters; it eats a glowing, smoking pit into the floor and boils down into it, spitting bright beads, pale steam curling off."}, {"tags": ["nature", "acid", "poison", "splash", "liquid", "ground", "one-shot"]}, {"size": [184, 116]}, {"origin": [92, 100]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e140a", "#1c3010", "#2c5214", "#457e18", "#6aae1c", "#a0dc2a", "#dcff6a", "#f8ffd0"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.3)
	_S.define(_e, "Y0", _S.unary("-", 62))
	_S.define(_e, "V0", 60)
	_S.define(_e, "SPREAD", 0.4)
	_S.define(_e, "DRY", 0.7)
	_S.define(_e, "GONE", 2.2)
	_S.define(_e, "W", 30)
	_S.define(_e, "PIT", 5)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_col_b3 = _S.arg(_args,3)
	var _n_age_b4 = (_n_t_b2 - _S.named_value(_n_q_b1,"t0"))
	var _n_u_b5 = (float(_n_age_b4)/_S.named_value(_n_q_b1,"life"))
	if _S.truth(((_n_u_b5 < 0) if _S.truth((_n_u_b5 < 0)) else (_n_u_b5 >= 1))):
		return null
	var _n_head_b6 = (_S.named_value(_n_q_b1,"rise") * _n_age_b4)
	var _n_tail_b7 = maxf(0,(_n_head_b6 - _S.named_value(_n_q_b1,"len")))
	var _n_fade_b8 = (_S.MathFX.smooth(0,0.15,_n_u_b5) * (1 - _S.MathFX.smooth(0.4,1,_n_u_b5)))
	if true:
		var _n_h_b9 = _n_tail_b7
		while _S.truth((_n_h_b9 <= _n_head_b6)):
			var _n_s_b10 = (float((_n_h_b9 - _n_tail_b7))/maxf(1,(_n_head_b6 - _n_tail_b7)))
			var _n_x_b11 = ((_S.named_value(_n_q_b1,"x") + ((_S.named_value(_n_q_b1,"amp") * sin(((_n_h_b9 * _S.named_value(_n_q_b1,"k")) + _S.named_value(_n_q_b1,"ph")))) * (0.2 + _n_s_b10))) + (_S.named_value(_n_q_b1,"drift") * _n_age_b4))
			_S.invoke(_n_p_b0,"blend",[_n_x_b11, (_S.named_value(_n_q_b1,"y") - _n_h_b9), _n_col_b3, ((_n_fade_b8 * sin((PI * _n_s_b10))) * 0.42)])
			_n_h_b9 += 0.5
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "SCORCH", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 0), _S.call_value(_S.read(_e, "hex"), ["#140f0c"]), 0.6]))
	_S.define(_e, "BURNT", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.call_value(_S.read(_e, "hex"), ["#2a1a10"]), 0.6]))
	_S.define(_e, "STEAM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 7), _S.call_value(_S.read(_e, "hex"), ["#e8ece6"]), 0.75]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.read(_e, "floor")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "stains", [])
	_S.define(_e, "wisps", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 13}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "rag", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 80}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "pw", _S.function_value(_e, "_f5"))
	_S.define(_e, "pitD", _S.function_value(_e, "_f6"))
	_S.define(_e, "depth", _S.function_value(_e, "_f7"))
	_S.define(_e, "level", _S.function_value(_e, "_f8"))
	_S.define(_e, "width", _S.function_value(_e, "_f9"))
	_S.define(_e, "heat", _S.function_value(_e, "_f10"))
	_S.define(_e, "gobY", _S.function_value(_e, "_f11"))
	_S.define(_e, "crownR", _S.function_value(_e, "_f12"))
	_S.define(_e, "crownH", _S.function_value(_e, "_f13"))
	_S.define(_e, "spikeK", _S.function_value(_e, "_f14"))
	_S.define(_e, "tipOf", _S.function_value(_e, "_f15"))
	_S.define(_e, "steam", _S.function_value(_e, "_f16"))
	_S.define(_e, "crown", _S.function_value(_e, "_f17"))
	return _S.merge([{"update": _S.function_value(_e, "_f18")}, {"drawBack": _S.function_value(_e, "_f20")}, {"draw": _S.function_value(_e, "_f21")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_i_b1)/13) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.18), 0.18])),"h":_S.invoke(_n_R,"range",[4, 10]),"r":_S.invoke(_n_R,"range",[0.85, 1.12]),"shed":false}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_o = _S.read(_parent,"o")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.MathFX.rand([_n_i_b1,_S.named_value(_n_o,"seed"),5]) - 0.5)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	return ((_n_W * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_HIT))/_n_SPREAD),0.0,1.0)])) * 1.02)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_PIT = _S.read(_parent,"PIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	return (_n_PIT * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_HIT))/1.1),0.0,1.0)]))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_pw = _S.read(_parent,"pw")
	var _n_pitD = _S.read(_parent,"pitD")
	var _n_rag = _S.read(_parent,"rag")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.call_value(_n_pw,[])
	var _n_d_b2 = (float(absf(_n_x_b0))/maxf(1,_n_w_b1))
	return ((-1) if _S.truth((_n_d_b2 >= 1)) else ((_S.call_value(_n_pitD,[]) * sqrt((1 - (_n_d_b2 * _n_d_b2)))) + (_S.index_value(_n_rag,fmod((floori(_n_x_b0+0.5) + 200),80)) * 0.9)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_PIT = _S.read(_parent,"PIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_DRY = _S.read(_parent,"DRY")
	var _n_GONE = _S.read(_parent,"GONE")
	return (0 if _S.truth((_n_t < _n_HIT)) else ((-1.6) + ((_n_PIT + 1.6) * _S.invoke(_n_ease,"inQuad",[_S.MathFX.smooth(_n_DRY,_n_GONE,_n_t)]))))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_level = _S.read(_parent,"level")
	var _n_pw = _S.read(_parent,"pw")
	var _n_pitD = _S.read(_parent,"pitD")
	var _n_L_b0 = _S.call_value(_n_level,[])
	var _n_w_b1 = _S.call_value(_n_pw,[])
	return (_n_w_b1 if _S.truth((_n_L_b0 <= 0)) else (_n_w_b1 * sqrt(maxf(0,(1 - pow((float(_n_L_b0)/maxf(0.1,_S.call_value(_n_pitD,[]))),2))))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_t = _S.read(_parent,"t")
	var _n_GONE = _S.read(_parent,"GONE")
	return (_S.MathFX.smooth(_n_HIT,(_n_HIT + 0.3),_n_t) * (1 - _S.MathFX.smooth((_n_GONE - 0.3),(_n_GONE + 0.25),_n_t)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_V0 = _S.read(_parent,"V0")
	var _n_t = _S.read(_parent,"t")
	return ((_n_Y0 + (_n_V0 * _n_t)) + (((0.5 * 950) * _n_t) * _n_t))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	return (4 + (11 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_HIT))/0.16),0.0,1.0)])))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	return (5 * sin((PI * clampf((float((_n_t - _n_HIT))/0.26),0.0,1.0))))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_u_b0 = clampf((float(((_n_t - _n_HIT) - 0.015))/0.26),0.0,1.0)
	return sin((PI * pow(_n_u_b0,0.6)))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_crownR = _S.read(_parent,"crownR")
	var _n_crownH = _S.read(_parent,"crownH")
	var _n_spikeK = _S.read(_parent,"spikeK")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_r_b1 = (_S.call_value(_n_crownR,[]) * _S.named_value(_n_s_b0,"r"))
	var _n_h_b2 = _S.call_value(_n_crownH,[])
	var _n_sn_b3 = sin(_S.named_value(_n_s_b0,"a"))
	var _n_sh_b4 = (_S.named_value(_n_s_b0,"h") * _S.call_value(_n_spikeK,[]))
	var _n_bx_b5 = (cos(_S.named_value(_n_s_b0,"a")) * _n_r_b1)
	var _n_by_b6 = (((_n_sn_b3 * _n_r_b1) * 0.3) - (_n_h_b2 * (0.75 + (0.25 * absf(_n_sn_b3)))))
	return [_n_bx_b5, _n_by_b6, (_n_bx_b5 + ((cos(_S.named_value(_n_s_b0,"a")) * _n_sh_b4) * 0.55)), (_n_by_b6 - _n_sh_b4)]
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_wisps = _S.read(_parent,"wisps")
	var _n_t = _S.read(_parent,"t")
	var _n_R = _S.read(_parent,"R")
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_big_b2 = _S.arg(_args,2)
	return _S.invoke(_n_wisps,"push",[{"x":_n_x_b0,"y":_n_y_b1,"t0":_n_t,"life":minf((_S.invoke(_n_R,"range",[0.5, 0.9]) * (1.3 if _S.truth(_n_big_b2) else 1)),((_S.named_value(_n_meta,"duration") - 0.05) - _n_t)),"rise":_S.invoke(_n_R,"range",[22, 32]),"len":(_S.invoke(_n_R,"range",[5, 10]) * (1.4 if _S.truth(_n_big_b2) else 1)),"amp":_S.invoke(_n_R,"range",[1, 2.5]),"k":_S.invoke(_n_R,"range",[0.35, 0.6]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"drift":_S.invoke(_n_R,"range",[(-4), 4])}])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_crownR = _S.read(_parent,"crownR")
	var _n_crownH = _S.read(_parent,"crownH")
	var _n_C = _S.read(_parent,"C")
	var _n_tipOf = _S.read(_parent,"tipOf")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	if _S.truth(((_n_t < _n_HIT) if _S.truth((_n_t < _n_HIT)) else (_n_t > (_n_HIT + 0.27)))):
		return null
	var _n_r_b2 = _S.call_value(_n_crownR,[])
	var _n_h_b3 = _S.call_value(_n_crownH,[])
	var _n_ry_b4 = (_n_r_b2 * 0.3)
	if true:
		var _n_x_b5 = floori((-_n_r_b2))
		while _S.truth((_n_x_b5 <= ceili(_n_r_b2))):
			var _n_c_b6 = (float((_n_x_b5 + 0.5))/_n_r_b2)
			if _S.truth((absf(_n_c_b6) > 1)):
				_n_x_b5 += 1.0
				continue
			var _n_e_b7 = sqrt((1 - (_n_c_b6 * _n_c_b6)))
			var _n_yb_b8 = (((-_n_ry_b4) if _S.truth(_n_back_b1) else _n_ry_b4) * _n_e_b7)
			var _n_hh_b9 = (_n_h_b3 * (0.75 + (0.25 * _n_e_b7)))
			if true:
				var _n_y_b10 = floori((_n_yb_b8 - _n_hh_b9))
				while _S.truth((_n_y_b10 <= floori(_n_yb_b8+0.5))):
					var _n_rim_b11 = _S.binary("===",_n_y_b10,floori((_n_yb_b8 - _n_hh_b9)))
					if _S.truth(_n_rim_b11):
						_S.invoke(_n_p_b0,"px",[_n_x_b5, _n_y_b10, (_S.index_value(_n_C,5) if _S.truth(_n_back_b1) else (_S.index_value(_n_C,7) if _S.truth((_n_c_b6 < 0.1)) else _S.index_value(_n_C,6)))])
					else:
						_S.invoke(_n_p_b0,"blend",[_n_x_b5, _n_y_b10, _S.index_value(_n_C,((5 if _S.truth((_n_c_b6 < (-0.25))) else (3 if _S.truth((_n_c_b6 > 0.45)) else 4)) - (1 if _S.truth(_n_back_b1) else 0))), (0.55 if _S.truth(_n_back_b1) else 0.7)])
					_n_y_b10 += 1.0
			_n_x_b5 += 1.0
	for _iter_0 in _S.array(_n_spikes):
		var _n_s_b12 = _iter_0
		if _S.truth(_S.binary("!==",(sin(_S.named_value(_n_s_b12,"a")) < 0),_n_back_b1)):
			continue
		var _tuple_1 = _S.call_value(_n_tipOf,[_n_s_b12])
		var _n_bx_b13 = _S.prop(_tuple_1,0)
		var _n_by_b14 = _S.prop(_tuple_1,1)
		var _n_tx_b15 = _S.prop(_tuple_1,2)
		var _n_ty_b16 = _S.prop(_tuple_1,3)
		_S.invoke(_n_p_b0,"line",[_n_bx_b13, _n_by_b14, _n_tx_b15, _n_ty_b16, (_S.index_value(_n_C,4) if _S.truth(_n_back_b1) else _S.index_value(_n_C,6))])
		_S.invoke(_n_p_b0,"line",[(_n_bx_b13 + 1), _n_by_b14, ((float((_n_bx_b13 + _n_tx_b15))/2) + 0.5), (float((_n_by_b14 + _n_ty_b16))/2), (_S.index_value(_n_C,3) if _S.truth(_n_back_b1) else _S.index_value(_n_C,5))])
		if _S.truth(not _S.truth(_S.named_value(_n_s_b12,"shed"))):
			_S.invoke(_n_p_b0,"px",[_n_tx_b15, (_n_ty_b16 - 1), (_S.index_value(_n_C,5) if _S.truth(_n_back_b1) else _S.index_value(_n_C,7))])
			_S.invoke(_n_p_b0,"px",[(_n_tx_b15 + 1), (_n_ty_b16 - 1), _S.index_value(_n_C,5)])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), []))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "hit", true, "=", false)
		_S.invoke(_S.read(_v10, "lights"), "add", [0, _S.unary("-", 4), 28, _S.read(_v10, "WHITE"), 0.6, 0.08])
		_S.invoke(_S.read(_v10, "lights"), "add", [0, _S.unary("-", 10), 56, _S.prop(_S.read(_v10, "C"), 5), 0.5, 0.6])
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 26)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.35), 1.35])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [60, 250]))
			_S.invoke(_S.read(_v12, "drops"), "add", [_S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), (2 if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.3])) else 1)])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v10)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 10)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "R"), "range", [0.12, 0.3])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v10)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 5)):
			_S.call_value(_S.read(_v15, "steam"), [_S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [2, 6])), true])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "hit")):
		for _v16 in _S.array(_S.read(_e, "spikes")):
			var _v17 = _S.scope(_e)
			_S.define(_v17, "s", _v16)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "s"), "shed")), func(): return _S.binary(">", _S.read(_v17, "t"), _S.binary("+", _S.read(_v17, "HIT"), 0.09)))):
				var _v18 = _S.scope(_v17)
				_S.set_prop(_S.read(_v18, "s"), "shed", true, "=", false)
				var _v19 = _S.call_value(_S.read(_v18, "tipOf"), [_S.read(_v18, "s")])
				_S.define(_v18, "tx", _S.prop(_v19, 2))
				_S.define(_v18, "ty", _S.prop(_v19, 3))
				_S.invoke(_S.read(_v18, "drops"), "add", [_S.read(_v18, "tx"), _S.binary("-", _S.read(_v18, "ty"), 1), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.prop(_S.read(_v18, "s"), "a")]), _S.invoke(_S.read(_v18, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [50, 130])), (2 if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.4])) else 1)])
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt"), _S.function_value(_e, "_f19")])
	_S.define(_e, "lv", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "w2", _S.call_value(_S.read(_e, "width"), []))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.15)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))), func(): return _S.binary(">", _S.read(_e, "w2"), 2))):
		var _v20 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [_S.binary("*", 0.3, _S.read(_v20, "f"))])):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "x", _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.85), 0.85]), _S.read(_v21, "w2")))
			_S.define(_v21, "y", _S.binary("-", _S.invoke(_S.read(_v21, "Math"), "min", [_S.read(_v21, "lv"), _S.call_value(_S.read(_v21, "depth"), [_S.read(_v21, "x")])]), 1))
			_S.invoke(_S.read(_v21, "pops"), "push", [_S.merge([{"x": _S.read(_v21, "x")}, {"y": _S.read(_v21, "y")}, {"t0": _S.read(_v21, "t")}])])
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "j"), _S.invoke(_S.read(_v22, "R"), "int", [1, 3]))):
				_S.invoke(_S.read(_v22, "drops"), "add", [_S.read(_v22, "x"), _S.invoke(_S.read(_v22, "Math"), "min", [_S.binary("-", _S.read(_v22, "y"), 1), _S.unary("-", 1)]), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [50, 110])), 1])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "j", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [_S.binary("*", 0.14, _S.read(_v20, "f"))])):
			_S.call_value(_S.read(_v20, "steam"), [_S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.9), 0.9]), _S.read(_v20, "w2")), _S.binary("-", _S.invoke(_S.read(_v20, "Math"), "min", [_S.read(_v20, "lv"), 0]), 1), _S.invoke(_S.read(_v20, "R"), "chance", [0.25])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "GONE"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.5))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.08, _S.read(_e, "f"))]))):
		_S.call_value(_S.read(_e, "steam"), [_S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.call_value(_S.read(_e, "pw"), [])), 0, false])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", _S.binary("-", _S.prop(_S.read(_v23, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v23, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v23, "t"), _S.prop(_S.prop(_S.read(_v23, "pops"), _S.read(_v23, "i")), "t0")), 0.1)):
			_S.invoke(_S.read(_v23, "pops"), "splice", [_S.read(_v23, "i"), 1])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "-=", true)
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", _S.binary("-", _S.prop(_S.read(_v24, "wisps"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v24, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v24, "t"), _S.prop(_S.prop(_S.read(_v24, "wisps"), _S.read(_v24, "i")), "t0")), _S.prop(_S.prop(_S.read(_v24, "wisps"), _S.read(_v24, "i")), "life"))):
			_S.invoke(_S.read(_v24, "wisps"), "splice", [_S.read(_v24, "i"), 1])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_pw = _S.read(_parent,"pw")
	var _n_stains = _S.read(_parent,"stains")
	var _n_t = _S.read(_parent,"t")
	var _n_R = _S.read(_parent,"R")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_steam = _S.read(_parent,"steam")
	var _n_d_b0 = _S.arg(_args,0)
	if _S.truth((absf(_S.named_value(_n_d_b0,"x")) > _S.call_value(_n_pw,[]))):
		_S.invoke(_n_stains,"push",[{"x":_S.named_value(_n_d_b0,"x"),"t0":_n_t,"w":((_S.named_value(_n_d_b0,"s") * 0.8) + _S.invoke(_n_R,"range",[0.3, 1.2]))}])
	if _S.truth((_n_t < _n_GONE)):
		_S.call_value(_n_steam,[_S.named_value(_n_d_b0,"x"), (-1), false])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_heat = _S.read(_parent,"heat")
	var _n_pw = _S.read(_parent,"pw")
	var _n_level = _S.read(_parent,"level")
	var _n_C = _S.read(_parent,"C")
	var _n_BURNT = _S.read(_parent,"BURNT")
	var _n_SCORCH = _S.read(_parent,"SCORCH")
	var _n_stains = _S.read(_parent,"stains")
	var _n_crown = _S.read(_parent,"crown")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_depth = _S.read(_parent,"depth")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.6),(_S.named_value(_n_meta,"duration") - 0.08),_n_t))
	var _n_hk_b2 = _S.call_value(_n_heat,[])
	var _n_w_b3 = _S.call_value(_n_pw,[])
	var _n_lv_b4 = _S.call_value(_n_level,[])
	for _iter_0 in _S.array(_n_stains):
		var _n_s_b5 = _iter_0
		var _n_age_b6 = (_n_t - _S.named_value(_n_s_b5,"t0"))
		var _n_k_b7 = (1 - _S.MathFX.smooth(1,1.8,_n_age_b6))
		var _n_c_b8 = (_S.index_value(_n_C,7) if _S.truth((_n_age_b6 < 0.15)) else (_S.index_value(_n_C,6) if _S.truth((_n_age_b6 < 0.5)) else (_S.index_value(_n_C,4) if _S.truth((_n_age_b6 < 0.9)) else _n_BURNT)))
		if true:
			var _n_x_b9 = floori((_S.named_value(_n_s_b5,"x") - _S.named_value(_n_s_b5,"w")))
			while _S.truth((_n_x_b9 <= ceili((_S.named_value(_n_s_b5,"x") + _S.named_value(_n_s_b5,"w"))))):
				_S.invoke(_n_p_b0,"dot",[_n_x_b9, 0, (_n_SCORCH if _S.truth((absf((_n_x_b9 - _S.named_value(_n_s_b5,"x"))) < (_S.named_value(_n_s_b5,"w") * 0.5))) else _n_c_b8), (_n_k_b7 * _n_fade_b1)])
				_n_x_b9 += 1.0
		if _S.truth((_n_age_b6 < 0.5)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b5,"x"), (-1), 5, _S.index_value(_n_C,5), (0.3 * (1 - (float(_n_age_b6)/0.5)))])
	_S.call_value(_n_crown,[_n_p_b0, true])
	if _S.truth(((_n_w_b3 > 1) if _S.truth((_n_t > _n_HIT)) else (_n_t > _n_HIT))):
		if true:
			var _n_x_b10 = (floori((-_n_w_b3)) - 1)
			while _S.truth((_n_x_b10 <= (ceili(_n_w_b3) + 1))):
				var _n_dp_b11 = _S.call_value(_n_depth,[(_n_x_b10 + 0.5)])
				if _S.truth((_n_dp_b11 < 0)):
					_n_x_b10 += 1.0
					continue
				var _n_bottom_b12 = maxf(0,floori(_n_dp_b11+0.5))
				var _n_edge_b13 = ((float(absf((_n_x_b10 + 0.5)))/_n_w_b3) > 0.88)
				if true:
					var _n_y_b14 = 0
					while _S.truth((_n_y_b14 <= _n_bottom_b12)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b10, _n_y_b14, ((_S.index_value(_n_C,6) if _S.truth((_n_hk_b2 > 0.5)) else (_S.index_value(_n_C,4) if _S.truth((_n_hk_b2 > 0.15)) else _n_BURNT)) if _S.truth(_S.binary("===",_n_y_b14,_n_bottom_b12)) else _n_SCORCH), _n_fade_b1])
						_n_y_b14 += 1.0
				_S.invoke(_n_p_b0,"dot",[_n_x_b10, (_n_bottom_b12 + 1), (_S.index_value(_n_C,5) if _S.truth((_n_hk_b2 > 0.5)) else (_S.index_value(_n_C,3) if _S.truth((_n_hk_b2 > 0.15)) else _n_SCORCH)), (_n_fade_b1 * 0.8)])
				if _S.truth(_n_edge_b13):
					_S.invoke(_n_p_b0,"dot",[_n_x_b10, (-1), (_S.index_value(_n_C,7) if _S.truth((_n_hk_b2 > 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_hk_b2 > 0.1)) else _n_BURNT)), _n_fade_b1])
				_n_x_b10 += 1.0
		for _iter_1 in _S.array([(-1), 1]):
			var _n_sd_b15 = _iter_1
			_S.invoke(_n_p_b0,"glow",[(_n_sd_b15 * _n_w_b3), (-1), 8, _S.index_value(_n_C,6), (0.45 * _n_hk_b2)])
		if _S.truth((_n_t < _n_GONE)):
			if true:
				var _n_x_b16 = floori((-_n_w_b3))
				while _S.truth((_n_x_b16 <= ceili(_n_w_b3))):
					var _n_dp_b17 = _S.call_value(_n_depth,[(_n_x_b16 + 0.5)])
					if _S.truth((_n_dp_b17 < 0)):
						_n_x_b16 += 1.0
						continue
					var _n_d_b18 = (float(absf((_n_x_b16 + 0.5)))/_n_w_b3)
					var _n_dome_b19 = (floori((_n_lv_b4 * sqrt(maxf(0,(1 - (_n_d_b18 * _n_d_b18)))))+0.5) if _S.truth((_n_lv_b4 < 0)) else floori(_n_lv_b4+0.5))
					var _n_bottom_b20 = floori(_n_dp_b17+0.5)
					if _S.truth((_n_dome_b19 > _n_bottom_b20)):
						_n_x_b16 += 1.0
						continue
					var _n_n_b21 = (_S.MathFX.noise(((_n_x_b16 * 0.25) - (_n_t * 2.4)),3) + (_S.MathFX.noise(((_n_x_b16 * 0.1) + (_n_t * 1.4)),5) * 0.6))
					if true:
						var _n_y_b22 = _n_dome_b19
						while _S.truth((_n_y_b22 <= _n_bottom_b20)):
							_S.invoke(_n_p_b0,"px",[_n_x_b16, _n_y_b22, ((_S.index_value(_n_C,7) if _S.truth((_n_n_b21 > 0.7)) else _S.index_value(_n_C,6)) if _S.truth(_S.binary("===",_n_y_b22,_n_dome_b19)) else ((_S.index_value(_n_C,5) if _S.truth((_n_n_b21 > 0.2)) else _S.index_value(_n_C,4)) if _S.truth(_S.binary("===",_n_y_b22,(_n_dome_b19 + 1))) else (_S.index_value(_n_C,3) if _S.truth((_n_y_b22 >= _n_bottom_b20)) else _S.index_value(_n_C,4))))])
							_n_y_b22 += 1.0
					_n_x_b16 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, (-6), ((_n_w_b3 * 1.4) + 10), _S.index_value(_n_C,4), ((0.3 * _n_hk_b2) * (0.85 + (0.15 * sin((_n_t * 9)))))])
		_S.invoke(_n_p_b0,"glow",[0, 1, (_n_w_b3 * 0.9), _S.index_value(_n_C,6), (0.2 * _n_hk_b2)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_gobY = _S.read(_parent,"gobY")
	var _n_V0 = _S.read(_parent,"V0")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_crown = _S.read(_parent,"crown")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_pops = _S.read(_parent,"pops")
	var _n_wisp = _S.read(_parent,"wisp")
	var _n_STEAM = _S.read(_parent,"STEAM")
	var _n_wisps = _S.read(_parent,"wisps")
	var _n_drops = _S.read(_parent,"drops")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_HIT)):
		var _n_y_b2 = _S.call_value(_n_gobY,[])
		var _n_v_b3 = (_n_V0 + (950 * _n_t))
		var _n_st_b4 = (1 + (_n_v_b3 * 0.0022))
		var _n_rx_b5 = (float(2.6)/sqrt(_n_st_b4))
		var _n_ry_b6 = (2.8 * _n_st_b4)
		_S.invoke(_n_p_b0,"shade",[((-_n_rx_b5) - 1), ((_n_y_b2 - _n_ry_b6) - 4), (_n_rx_b5 + 1), ((_n_y_b2 + _n_ry_b6) + 1), _S.function_value(_S.capture(_parent,{"rx":_n_rx_b5,"y":_n_y_b2,"ry":_n_ry_b6,"this":_this}),"_f22")])
		_S.invoke(_n_p_b0,"px",[(-1), (_n_y_b2 - (_n_ry_b6 * 0.3)), _n_WHITE])
		if true:
			var _n_i_b7 = 1
			while _S.truth((_n_i_b7 <= 3)):
				_S.invoke(_n_p_b0,"dot",[0, (((_n_y_b2 - _n_ry_b6) - 2) - (_n_i_b7 * 4)), _S.index_value(_n_C,5), (1 - (_n_i_b7 * 0.25))])
				_n_i_b7 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, _n_y_b2, 10, _S.index_value(_n_C,5), 0.45])
	_S.call_value(_n_crown,[_n_p_b0, false])
	var _n_e_b1 = (_n_t - _n_HIT)
	if _S.truth(((_n_e_b1 < 0.07) if _S.truth((_n_e_b1 >= 0)) else (_n_e_b1 >= 0))):
		var _n_k_b8 = (1 - (float(_n_e_b1)/0.07))
		_S.invoke(_n_p_b0,"ellipse",[0, (-2), (6 + (6 * (1 - _n_k_b8))), 2.5, (_n_WHITE if _S.truth((_n_k_b8 > 0.5)) else _S.index_value(_n_C,7))])
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-4), (8 * _n_k_b8), _S.index_value(_n_C,7), _S.index_value(_n_C,6), 0.6])
	for _iter_0 in _S.array(_n_pops):
		var _n_q_b9 = _iter_0
		var _n_k_b10 = (float((_n_t - _S.named_value(_n_q_b9,"t0")))/0.1)
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b9,"x"), _S.named_value(_n_q_b9,"y"), _n_WHITE])
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b11 = _S.prop(_tuple_2,0)
			var _n_dy_b12 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_q_b9,"x") + (_n_dx_b11 * (1 + (_n_k_b10 * 2)))), (_S.named_value(_n_q_b9,"y") + (_n_dy_b12 * (1 + (_n_k_b10 * 2)))), _S.index_value(_n_C,7), (1 - _n_k_b10)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b9,"x"), _S.named_value(_n_q_b9,"y"), 4, _S.index_value(_n_C,6), (0.4 * (1 - _n_k_b10))])
	for _iter_3 in _S.array(_n_wisps):
		var _n_q_b13 = _iter_3
		_S.call_value(_n_wisp,[_n_p_b0, _n_q_b13, _n_t, _n_STEAM])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_yy_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float(_n_x_b0)/_n_rx)
	var _n_dy_b4 = (float((_n_yy_b1 - _n_y))/_n_ry)
	var _n_tail_b5 = _S.logical("&&",((absf(_n_x_b0) < ((_n_rx * (1 + (_n_dy_b4 * 0.9))) + 0.4)) if _S.truth((_n_dy_b4 < 0)) else (_n_dy_b4 < 0)),func():return (_n_dy_b4 > (-1.7)))
	var _n_d_b6 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((not _S.truth(_n_tail_b5) if _S.truth((_n_d_b6 > 1.25)) else (_n_d_b6 > 1.25))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,2) if _S.truth((not _S.truth(_n_tail_b5) if _S.truth((_n_d_b6 > 1)) else (_n_d_b6 > 1))) else (_S.index_value(_n_C,7) if _S.truth(((_n_dy_b4 < (-0.1)) if _S.truth((_n_dx_b3 < (-0.2))) else (_n_dx_b3 < (-0.2)))) else (_S.index_value(_n_C,4) if _S.truth((_n_dy_b4 > 0.45)) else _S.index_value(_n_C,5)))),"=")
	return null
