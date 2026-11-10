@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/small-explosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Blazes", _S.import_value("core/index.js", "Blazes"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f1"))
	_S.define(_e, "rock", _S.function_value(_e, "_f2"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Explosion"}, {"desc": "A ground blast: a white flash and shock rings, fire that cools into a rolling smoke column, sparks, burning brands that land and keep burning, tumbling rocks and a glowing scorch."}, {"tags": ["explosion", "fire", "smoke", "debris", "impact", "one-shot"]}, {"size": [300, 240]}, {"origin": [150, 196]}, {"duration": 5.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"size": 1}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#17121d"]))
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
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_rx0_b3 = _S.arg(_args,3)
	var _n_cool_b4 = _S.arg(_args,4)
	var _n_fade_b5 = _S.arg(_args,5)
	if _S.truth((_n_fade_b5 <= 0)):
		return null
	var _n_rx_b6 = (_n_rx0_b3 * minf(1,(float(_n_t_b2)/0.08)))
	var _n_ry_b7 = 4
	var _n_heat_b8 = _S.invoke(_S.concat([_S.array(_n_F_b1)]),"reverse",[])
	if true:
		var _n_y_b9 = 0
		while _S.truth((_n_y_b9 <= 2)):
			if true:
				var _n_x_b10 = floori((-_n_rx_b6))
				while _S.truth((_n_x_b10 <= ceili(_n_rx_b6))):
					var _n_dx_b11 = (float((_n_x_b10 + 0.5))/_n_rx_b6)
					var _n_dy_b12 = (float((_n_y_b9 + 0.5))/_n_ry_b7)
					var _n_d_b13 = sqrt(((_n_dx_b11 * _n_dx_b11) + (_n_dy_b12 * _n_dy_b12)))
					if _S.truth((_n_d_b13 > 1)):
						_n_x_b10 += 1.0
						continue
					var _n_k_b14 = _S.MathFX.rand([((_n_x_b10 * 31) + _n_y_b9),3])
					var _n_T_b15 = ((pow(clampf((1 - (float(_n_t_b2)/_n_cool_b4)),0.0,1.0),1.4) * (1.25 - _n_d_b13)) - (_n_k_b14 * 0.35))
					if _S.truth((_n_T_b15 > 0.06)):
						var _n_c_b16 = _S.index_value(_n_heat_b8,minf((_S.prop(_n_heat_b8,"length") - 1),floori(((1 - minf(1,_n_T_b15)) * (_S.prop(_n_heat_b8,"length") - 1)))))
						_S.invoke(_n_p_b0,"dot",[_n_x_b10, _n_y_b9, _n_c_b16, _n_fade_b5])
						if _S.truth(_S.binary("===",_S.binary("&",_n_x_b10,3),0)):
							_S.invoke(_n_p_b0,"glow",[(_n_x_b10 + 0.5), _n_y_b9, 6, _n_c_b16, ((0.18 * _n_T_b15) * _n_fade_b5)])
					else:
						_S.invoke(_n_p_b0,"dot",[_n_x_b10, _n_y_b9, (_n_SOOT if _S.truth((_n_d_b13 < 0.5)) else _n_SOOT2), ((1 if _S.truth((_n_d_b13 < (0.95 - (_n_k_b14 * 0.3)))) else (1 - _n_d_b13)) * _n_fade_b5)])
					_n_x_b10 += 1.0
			_n_y_b9 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_r_b3 = (0.6 + (_S.named_value(_n_b_b1,"s") * 0.75))
	var _n_fade_b4 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_lx_b5 = ((cos(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	var _n_ly_b6 = ((sin(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"y") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"x") + _n_r_b3) + 1), ((_S.named_value(_n_b_b1,"y") + _n_r_b3) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"r":_n_r_b3,"lx":_n_lx_b5,"ly":_n_ly_b6,"st":_n_st_b2,"fade":_n_fade_b4,"this":_this}),"_f3")])
	return null

static func _f3(_parent,_args:Array,_this=null):
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

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "size"))
	_S.define(_e, "RAD", _S.binary("*", 18, _S.read(_e, "S")))
	_S.define(_e, "POWER", _S.binary("*", 0.9, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "S"), 0.8])))
	_S.define(_e, "EARTH", 1.6)
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}, {"onLand": _S.function_value(_e, "_f6")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flashes", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "Y", _S.binary("*", _S.unary("-", _S.read(_e, "RAD")), 0.3))
	_S.define(_e, "t", 0)
	_S.invoke(_S.read(_e, "flashes"), "push", [_S.merge([{"r": _S.binary("*", _S.read(_e, "RAD"), 1.05)}, {"life": 0.06}, {"max": 0.06}])])
	_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"r0": _S.binary("*", _S.read(_e, "RAD"), 0.45)}, {"r1": _S.binary("*", _S.read(_e, "RAD"), 2.7)}, {"life": 0.34}, {"max": 0.34}, {"thick": 3}, {"c": _S.prop(_S.read(_e, "F"), 5)}]), _S.merge([{"r0": _S.binary("*", _S.read(_e, "RAD"), 0.3)}, {"r1": _S.binary("*", _S.read(_e, "RAD"), 1.6)}, {"life": 0.22}, {"max": 0.22}, {"thick": 1.8}, {"c": _S.prop(_S.read(_e, "F"), 3)}])])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "RAD"), 3.4), _S.read(_e, "WARM"), _S.binary("*", 0.6, _S.read(_e, "POWER")), 0.7])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "RAD"), 1.6), _S.read(_e, "WHITE"), 0.6, 0.08])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 5)):
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "FIRE"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 2.5), 2.5]), _S.binary("+", _S.read(_v4, "Y"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 2.5), 2.5])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v4, "R"), "range", [0.18, 0.3]), 0, _S.invoke(_S.read(_v4, "R"), "range", [_S.binary("*", _S.read(_v4, "RAD"), 0.4), _S.binary("*", _S.read(_v4, "RAD"), 0.55)])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("*", 28, _S.read(_v5, "POWER"))]))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
		_S.define(_v6, "d", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.binary("*", _S.read(_v6, "RAD"), 0.55)]))
		_S.define(_v6, "sp", _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [40, 210]), _S.read(_v6, "POWER")))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "d")), _S.binary("+", _S.read(_v6, "Y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 0.8), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.55, 1.15]), 0, _S.invoke(_S.read(_v6, "R"), "range", [_S.binary("*", _S.read(_v6, "RAD"), 0.22), _S.binary("*", _S.read(_v6, "RAD"), 0.46)]), 0, (_S.binary("|", _S.prop(_S.read(_v6, "PF"), "SMOKES"), _S.prop(_S.read(_v6, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.45])) else 0)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 5)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "R"), "range", [_S.binary("*", _S.read(_v8, "RAD"), 0.1), _S.binary("*", _S.read(_v8, "RAD"), 0.5)]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d")), _S.binary("+", _S.read(_v8, "Y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d"))), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), 30), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 20), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.9, 1.5]), _S.call_value(_S.read(_v8, "rgb"), [34, 29, 38]), _S.invoke(_S.read(_v8, "R"), "range", [_S.binary("*", _S.read(_v8, "RAD"), 0.15), _S.binary("*", _S.read(_v8, "RAD"), 0.26)]), _S.invoke(_S.read(_v8, "R"), "range", [0.06, 0.2]), _S.prop(_S.read(_v8, "PF"), "BIG")])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 5)):
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "FIRE"), _S.invoke(_S.read(_v9, "R"), "range", [_S.binary("*", _S.unary("-", _S.read(_v9, "RAD")), 0.25), _S.binary("*", _S.read(_v9, "RAD"), 0.25)]), _S.read(_v9, "Y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 180), _S.unary("-", 100)]), _S.invoke(_S.read(_v9, "R"), "range", [0.8, 1.3]), 0, _S.invoke(_S.read(_v9, "R"), "range", [_S.binary("*", _S.read(_v9, "RAD"), 0.24), _S.binary("*", _S.read(_v9, "RAD"), 0.36)]), _S.invoke(_S.read(_v9, "R"), "range", [0, 0.1]), (_S.binary("|", _S.prop(_S.read(_v9, "PF"), "SMOKES"), _S.prop(_S.read(_v9, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.6])) else 0)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("*", 10, _S.read(_v10, "POWER"))]))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
		_S.define(_v11, "d", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.binary("*", _S.read(_v11, "RAD"), 0.7)]))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [15, 100]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "d")), _S.binary("+", _S.read(_v11, "Y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "d"))), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 0.6), 35), _S.invoke(_S.read(_v11, "R"), "range", [1.8, 2.8]), 0, _S.invoke(_S.read(_v11, "R"), "range", [_S.binary("*", _S.read(_v11, "RAD"), 0.26), _S.binary("*", _S.read(_v11, "RAD"), 0.44)]), _S.invoke(_S.read(_v11, "R"), "range", [0.12, 0.45]), _S.prop(_S.read(_v11, "PF"), "BIG")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", 80, _S.read(_v12, "POWER"))]))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "sp", _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [140, 380]), _S.read(_v13, "POWER")))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), 0, _S.read(_v13, "Y"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 70), _S.invoke(_S.read(_v13, "R"), "range", [0.18, 0.6])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.invoke(_S.read(_v14, "Math"), "round", [_S.binary("*", 40, _S.read(_v14, "POWER"))]))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.invoke(_S.read(_v15, "R"), "range", [0, _S.read(_v15, "TAU")]))
		_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [30, 150]))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "EMBER"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "RAD")), 0.4), _S.binary("+", _S.read(_v15, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "RAD")), 0.4)), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), 75), _S.invoke(_S.read(_v15, "R"), "range", [1.2, 2.6]), _S.prop(_S.read(_v15, "F"), 3)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.invoke(_S.read(_v16, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v16, "R"), "range", [9, 14]), _S.invoke(_S.read(_v16, "Math"), "max", [0, _S.binary("-", _S.read(_v16, "POWER"), 0.55)]))]))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.35), 1.35])))
		_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [170, 330]))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "BRAND"), 0, _S.read(_v17, "Y"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.3])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("*", _S.read(_v18, "RAD"), 0.5)]))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "s", _S.invoke(_S.read(_v19, "R"), "sign", []))
		_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SMOKE"), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [0, _S.binary("*", _S.read(_v19, "RAD"), 0.6)])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [1, _S.binary("+", 5, _S.binary("*", _S.read(_v19, "RAD"), 0.04))])), _S.binary("*", _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [3, 9.5])), _S.read(_v19, "RAD")), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 15])), _S.invoke(_S.read(_v19, "R"), "range", [1.1, 2]), _S.prop(_S.read(_v19, "st"), "dust"), _S.binary("+", _S.invoke(_S.read(_v19, "R"), "range", [4, 7]), _S.binary("/", _S.read(_v19, "RAD"), 6)), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v19, "PF"), "BIG")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.binary("*", 26, _S.invoke(_S.read(_v20, "Math"), "min", [1.5, _S.read(_v20, "S")])))):
		_S.invoke(_S.read(_v20, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v20, "B"), "CHUNK")}, {"x": _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.read(_v20, "RAD"))}, {"y": _S.unary("-", 3)}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v20, "RAD")), 0.25)}, {"vy": _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [7, 16])), _S.read(_v20, "RAD")), 0.9)}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [1.8, 2.6])}, {"a": _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")])}, {"va": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v20, "R"), "int", [1, 3])}])])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), _S.invoke(_S.read(_v21, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_v21, "EARTH"), _S.read(_v21, "RAD")), 4)]))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "u", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v22, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v22, "Math"), "PI")), 2), _S.binary("*", _S.read(_v22, "u"), 0.5)))
		_S.define(_v22, "sp", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [5, 15]), _S.read(_v22, "RAD")), _S.binary("-", 1, _S.binary("*", 0.45, _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "u")])))))
		_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "GRIT"), _S.binary("*", _S.binary("*", _S.read(_v22, "u"), 0.25), _S.read(_v22, "RAD")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.invoke(_S.read(_v22, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.prop(_S.read(_v22, "st"), "light"), _S.prop(_S.read(_v22, "st"), "body"), _S.prop(_S.read(_v22, "st"), "body"), _S.prop(_S.read(_v22, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.45])) else 1)])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "i"), _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("*", _S.read(_v23, "EARTH"), 12)]))):
		_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v23, "RAD")), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, _S.binary("*", _S.read(_v23, "RAD"), 0.6)])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 15), 15]), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [60, 190])), _S.read(_v23, "EARTH")), 0.6), _S.invoke(_S.read(_v23, "R"), "range", [1.6, 2.6]), _S.prop(_S.read(_v23, "st"), "dust"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [5, 9]), _S.invoke(_S.read(_v23, "Math"), "sqrt", [_S.read(_v23, "S")])), _S.binary("/", _S.read(_v23, "RAD"), 7)), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.15]), _S.prop(_S.read(_v23, "PF"), "BIG")])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "+=", true)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_n_blazes,"add",[_n_x_b0, (_n_y_b1 - 0.25), _S.invoke(_n_R,"range",[0.9, 1.5]), _S.invoke(_n_R,"range",[0.55, 0.85])])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v24 in _S.array([_S.read(_e, "flashes"), _S.read(_e, "rings")]):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
			if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "life", _S.read(_v26, "dt"), "-=", false), 0)):
				_S.invoke(_S.read(_v26, "a"), "splice", [_S.read(_v26, "i"), 1])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v27 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "b", _v27)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v28, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v28, "b"), "dusted")))):
			var _v29 = _S.scope(_v28)
			_S.set_prop(_S.read(_v29, "b"), "dusted", true, "=", false)
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v30, "i"), 3)):
				_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v30, "b"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "R"), "sign", []), _S.invoke(_S.read(_v30, "R"), "range", [10, 55])), 0.6), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 22])), _S.invoke(_S.read(_v30, "R"), "range", [0.3, 0.65]), _S.prop(_S.read(_v30, "st"), "dust"), _S.invoke(_S.read(_v30, "R"), "range", [1.3, 2.8])])
				_v30 = _S.iteration(_v30)
				_S.write(_v30, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_F = _S.read(_parent,"F")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_meta = _S.read(_parent,"meta")
	var _n_ps = _S.read(_parent,"ps")
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_scorch,[_n_p_b0, _n_F, _n_t, (22 * _n_S), (1.2 + (float(_n_RAD)/14)), (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1.2),(_S.named_value(_n_meta,"duration") - 0.2),_n_t))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.invoke(_n_blazes,"drawBack",[_n_p_b0])
	var _n_k_b1 = (float(_n_t)/0.5)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, ((80 * _n_S) * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,((2 + (float(_n_RAD)/9)) * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_F,3), _S.index_value(_n_F,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_ease = _S.read(_parent,"ease")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_st = _S.read(_parent,"st")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_rock = _S.read(_parent,"rock")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_ps = _S.read(_parent,"ps")
	var _n_Y = _S.read(_parent,"Y")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flashes = _S.read(_parent,"flashes")
	var _n_rings = _S.read(_parent,"rings")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float(_n_t)/0.5)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, ((80 * _n_S) * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,((2 + (float(_n_RAD)/9)) * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_F,3), _S.index_value(_n_F,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f11")])
	for _iter_0 in _S.array(_S.named_value(_n_rocks,"list")):
		var _n_b_b2 = _iter_0
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b2, _n_st])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	for _iter_1 in _S.array(_n_flashes):
		var _n_f_b3 = _iter_1
		var _n_k2_b4 = (float(_S.named_value(_n_f_b3,"life"))/_S.named_value(_n_f_b3,"max"))
		var _n_r_b5 = (_S.named_value(_n_f_b3,"r") * (0.8 + (0.2 * _n_k2_b4)))
		_S.invoke(_n_p_b0,"circle",[0, _n_Y, (_n_r_b5 + 1.2), _S.index_value(_n_F,2)])
		_S.invoke(_n_p_b0,"circle",[0, _n_Y, _n_r_b5, (_S.index_value(_n_F,6) if _S.truth((_n_k2_b4 > 0.45)) else _S.index_value(_n_F,5))])
		_S.invoke(_n_p_b0,"circle",[0, _n_Y, (_n_r_b5 * 0.6), (_n_WHITE if _S.truth((_n_k2_b4 > 0.45)) else _S.index_value(_n_F,6))])
	for _iter_2 in _S.array(_n_rings):
		var _n_r_b6 = _iter_2
		var _n_k2_b7 = (float(_S.named_value(_n_r_b6,"life"))/_S.named_value(_n_r_b6,"max"))
		var _n_e_b8 = (1 - pow(_n_k2_b7,3))
		_S.invoke(_n_p_b0,"ring",[0, _n_Y, (_S.named_value(_n_r_b6,"r0") + ((_S.named_value(_n_r_b6,"r1") - _S.named_value(_n_r_b6,"r0")) * _n_e_b8)), maxf(1,((_S.named_value(_n_r_b6,"thick") * _n_k2_b7) + 0.4)), _S.named_value(_n_r_b6,"c"), minf(1,(_n_k2_b7 * 1.6))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null
