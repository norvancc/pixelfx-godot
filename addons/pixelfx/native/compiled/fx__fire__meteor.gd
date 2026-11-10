@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/meteor.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
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
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "simDraw", _S.import_value("fx/fire/_lib.js", "simDraw"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "rock", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Meteor"}, {"desc": "A burning rock streaks in from the upper left in a comet of fire and smashes into the floor: a white flash, a fireball, rocks and brands thrown, a glowing crater that cools."}, {"tags": ["fire", "meteor", "impact", "explosion", "spell", "debris", "one-shot"]}, {"size": [272, 232]}, {"origin": [150, 208]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"rock": ["#120e16", "#2a2230", "#463a4a", "#6a5a66"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.62)
	_S.define(_e, "FROM", [_S.unary("-", 112), _S.unary("-", 142)])
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
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "RK", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "rock"), 4]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "S", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)]}, {"onLand": _S.function_value(_e, "_f5")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "FROM"), 0), _S.prop(_S.read(_e, "FROM"), 1)]))
	_S.define(_e, "ux", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "FROM"), 0)), _S.read(_e, "len")))
	_S.define(_e, "uy", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "FROM"), 1)), _S.read(_e, "len")))
	_S.define(_e, "pos", _S.function_value(_e, "_f6"))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "last", _S.call_value(_S.read(_e, "pos"), [0]))
	_S.define(_e, "meteor", _S.function_value(_e, "_f7"))
	_S.define(_e, "crater", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f4(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_n_blazes,"add",[_n_x_b0, (_n_y_b1 - 0.25), _S.invoke(_n_R,"range",[0.9, 1.6]), _S.invoke(_n_R,"range",[0.5, 0.85])])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_FROM = _S.read(_parent,"FROM")
	var _n_tt_b0 = _S.arg(_args,0)
	var _n_k_b1 = ((_S.invoke(_n_ease,"inQuad",[clampf((float(_n_tt_b0)/_n_HIT),0.0,1.0)]) * 0.35) + (clampf((float(_n_tt_b0)/_n_HIT),0.0,1.0) * 0.65))
	return [(_S.index_value(_n_FROM,0) * (1 - _n_k_b1)), (_S.index_value(_n_FROM,1) * (1 - _n_k_b1))]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_R0_b3 = _S.arg(_args,3)
	var _n_cool_b4 = _S.arg(_args,4)
	var _n_alpha_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	_S.invoke(_n_p_b0,"shade",[((_n_x_b1 - _n_R0_b3) - 2), ((_n_y_b2 - _n_R0_b3) - 2), ((_n_x_b1 + _n_R0_b3) + 2), ((_n_y_b2 + _n_R0_b3) + 2), _S.function_value(_S.capture(_parent,{"alpha":_n_alpha_b5,"x":_n_x_b1,"y":_n_y_b2,"R0":_n_R0_b3,"cool":_n_cool_b4,"this":_n_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_alpha = _S.read(_parent,"alpha")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_S = _S.read(_parent,"S")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_ux = _S.read(_parent,"ux")
	var _n_uy = _S.read(_parent,"uy")
	var _n_cool = _S.read(_parent,"cool")
	var _n_H = _S.read(_parent,"H")
	var _n_RK = _S.read(_parent,"RK")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	_S.set_prop(_n_out_b2,"a",_n_alpha,"=")
	var _n_dx_b3 = (_n_px_b0 - _n_x)
	var _n_dy_b4 = (_n_py_b1 - _n_y)
	var _n_d_b5 = _S.Bridge.hypot([_n_dx_b3, _n_dy_b4])
	var _n_a_b6 = atan2(_n_dy_b4,_n_dx_b3)
	var _n_rr_b7 = (_n_R0 * ((1 + (0.18 * _S.MathFX.noise(((_n_a_b6 * 2.2) + 3),_n_S))) + (0.1 * _S.MathFX.noise((_n_a_b6 * 5),(_n_S + 1)))))
	if _S.truth((_n_d_b5 > (_n_rr_b7 + 1))):
		return null
	if _S.truth((_n_d_b5 > _n_rr_b7)):
		return _n_OUTLINE
	var _n_face_b8 = (float(((_n_dx_b3 * _n_ux) + (_n_dy_b4 * _n_uy)))/maxf(1,_n_d_b5))
	var _n_heat_b9 = ((1 - _n_cool) * (((_n_face_b8 * 0.6) + 0.5) - ((float(_n_d_b5)/_n_rr_b7) * 0.25)))
	if _S.truth((_n_heat_b9 > 0.62)):
		return (_S.index_value(_n_H,0) if _S.truth((_n_heat_b9 > 0.85)) else (_S.index_value(_n_H,1) if _S.truth((_n_heat_b9 > 0.74)) else _S.index_value(_n_H,2)))
	if _S.truth((_n_heat_b9 > 0.42)):
		return _S.index_value(_n_H,4)
	var _n_h_b10 = _S.MathFX.rand([floori((_n_px_b0 - _n_x)),floori((_n_py_b1 - _n_y)),(_n_S + 3)])
	if _S.truth((_n_h_b10 < (0.22 * (1 - (_n_cool * 0.7))))):
		return (_S.index_value(_n_H,4) if _S.truth(((1 - _n_cool) > 0.5)) else _S.index_value(_n_H,6))
	return (_S.index_value(_n_RK,2) if _S.truth((((_n_dx_b3 * (-0.6)) + (_n_dy_b4 * (-0.8))) > 0)) else (_S.index_value(_n_RK,0) if _S.truth(((float(_n_d_b5)/_n_rr_b7) > 0.6)) else _S.index_value(_n_RK,1)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_meta = _S.read(_parent,"meta")
	var _n_S = _S.read(_parent,"S")
	var _n_H = _S.read(_parent,"H")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_st = _S.read(_parent,"st")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_HIT)):
		return null
	var _n_a_b1 = (_n_t - _n_HIT)
	var _n_end_b2 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1),(_S.named_value(_n_meta,"duration") - 0.15),_n_t))
	var _n_rx_b3 = (36 * minf(1,(float(_n_a_b1)/0.08)))
	var _n_ry_b4 = 6
	if true:
		var _n_y_b5 = (-1)
		while _S.truth((_n_y_b5 <= 3)):
			if true:
				var _n_x_b6 = floori((-_n_rx_b3))
				while _S.truth((_n_x_b6 <= ceili(_n_rx_b3))):
					var _n_dx_b7 = (float((_n_x_b6 + 0.5))/_n_rx_b3)
					var _n_dy_b8 = (float((_n_y_b5 + 0.5))/_n_ry_b4)
					var _n_d_b9 = sqrt(((_n_dx_b7 * _n_dx_b7) + (_n_dy_b8 * _n_dy_b8)))
					if _S.truth((_n_d_b9 > 1)):
						_n_x_b6 += 1.0
						continue
					var _n_k_b10 = _S.MathFX.rand([((_n_x_b6 * 31) + _n_y_b5),(_n_S + 5)])
					var _n_T_b11 = ((pow(clampf((1 - (float(_n_a_b1)/2.6)),0.0,1.0),1.3) * (1.25 - _n_d_b9)) - (_n_k_b10 * 0.35))
					if _S.truth((_n_T_b11 > 0.06)):
						var _n_ramp_b12 = [_S.index_value(_n_H,0), _S.index_value(_n_H,1), _S.index_value(_n_H,2), _S.index_value(_n_H,3), _S.index_value(_n_H,4), _S.index_value(_n_H,5), _S.index_value(_n_H,6), _S.index_value(_n_H,7), _S.index_value(_n_H,8)]
						var _n_c_b13 = _S.index_value(_n_ramp_b12,minf(8,floori(((1 - minf(1,_n_T_b11)) * 8))))
						_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b5, _n_c_b13, _n_end_b2])
						if _S.truth(_S.binary("===",_S.binary("&",_n_x_b6,3),0)):
							_S.invoke(_n_p_b0,"glow",[(_n_x_b6 + 0.5), _n_y_b5, 7, _n_c_b13, ((0.2 * _n_T_b11) * _n_end_b2)])
					else:
						_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b5, (_n_SOOT if _S.truth((_n_d_b9 < 0.55)) else _n_SOOT2), ((1 if _S.truth((_n_d_b9 < (0.95 - (_n_k_b10 * 0.3)))) else (1 - _n_d_b9)) * _n_end_b2)])
					_n_x_b6 += 1.0
			_n_y_b5 += 1.0
	if true:
		var _n_x_b14 = (-40)
		while _S.truth((_n_x_b14 <= 40)):
			var _n_e_b15 = (float(absf(_n_x_b14))/40)
			var _n_hh_b16 = (0 if _S.truth((_n_e_b15 < 0.7)) else floori(((2.4 * sin(((float((_n_e_b15 - 0.7))/0.3) * PI))) * (0.6 + (0.4 * _S.MathFX.rand([_n_x_b14,(_n_S + 7)]))))+0.5))
			if true:
				var _n_j_b17 = 0
				while _S.truth((_n_j_b17 < _n_hh_b16)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b14, ((-1) - _n_j_b17), (_S.ColorFX.mix(_S.named_value(_n_st,"light"),_S.index_value(_n_H,4),(0.5 * clampf((1 - (float(_n_a_b1)/2)),0.0,1.0))) if _S.truth(_S.binary("===",_n_j_b17,(_n_hh_b16 - 1))) else _S.named_value(_n_st,"shade")), _n_end_b2])
					_n_j_b17 += 1.0
			if _S.truth(_n_hh_b16):
				_S.invoke(_n_p_b0,"dot",[_n_x_b14, 0, _n_OUTLINE, _n_end_b2])
			_n_x_b14 += 1.0
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v7 = _S.scope(_e)
		var _v8 = _S.call_value(_S.read(_v7, "pos"), [_S.read(_v7, "t")])
		_S.define(_v7, "x", _S.prop(_v8, 0))
		_S.define(_v7, "y", _S.prop(_v8, 1))
		_S.define(_v7, "vx", _S.binary("/", _S.binary("-", _S.read(_v7, "x"), _S.prop(_S.read(_v7, "last"), 0)), _S.read(_v7, "dt")))
		_S.define(_v7, "vy", _S.binary("/", _S.binary("-", _S.read(_v7, "y"), _S.prop(_S.read(_v7, "last"), 1)), _S.read(_v7, "dt")))
		_S.write(_v7, "last", [_S.read(_v7, "x"), _S.read(_v7, "y")], "=", false)
		var _v9 = _S.scope(_v7)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 3)):
			var _v10 = _S.scope(_v9)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v10, "R"), "chance", [_S.binary("*", _S.binary("*", 0.8, _S.read(_v10, "dt")), 60)]))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "FIRE"), _S.binary("+", _S.binary("-", _S.read(_v10, "x"), _S.binary("*", _S.read(_v10, "ux"), _S.invoke(_S.read(_v10, "R"), "range", [2, 8]))), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.binary("-", _S.read(_v10, "y"), _S.binary("*", _S.read(_v10, "uy"), _S.invoke(_S.read(_v10, "R"), "range", [2, 8]))), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.binary("*", _S.read(_v10, "vx"), 0.15), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 20), 20])), _S.binary("+", _S.binary("*", _S.read(_v10, "vy"), 0.15), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 30), 10])), _S.invoke(_S.read(_v10, "R"), "range", [0.3, 0.6]), 0, _S.invoke(_S.read(_v10, "R"), "range", [3, 6]), 0, (_S.binary("|", _S.prop(_S.read(_v10, "PF"), "SMOKES"), _S.prop(_S.read(_v10, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.65])) else 0)])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [_S.binary("*", _S.binary("*", 0.6, _S.read(_v7, "dt")), 60)])):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", _S.binary("*", _S.read(_v7, "vx"), 0.35), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 80), 80])), _S.binary("+", _S.binary("*", _S.read(_v7, "vy"), 0.35), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 80), 40])), _S.invoke(_S.read(_v7, "R"), "range", [0.2, 0.5])])
		if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [_S.binary("*", _S.binary("*", 0.3, _S.read(_v7, "dt")), 60)])):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", _S.binary("*", _S.read(_v7, "vx"), 0.1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 30), 30])), _S.binary("+", _S.binary("*", _S.read(_v7, "vy"), 0.1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 40), 0])), _S.invoke(_S.read(_v7, "R"), "range", [0.8, 1.6]), _S.prop(_S.read(_v7, "H"), 3), (2 if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.2])) else 1)])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
			var _v11 = _S.scope(_e)
			_S.write(_v11, "hit", true, "=", false)
			_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 40), 100, _S.read(_v11, "WARM"), 0.95, 0.9])
			_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 20), 46, _S.read(_v11, "WHITE"), 0.9, 0.12])
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), 34)):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 1.3), 1.3])), 0.25))
				_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [50, 210]))
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "FIRE"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [2, 10])), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 0.75), 30), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 1.1]), 0, _S.invoke(_S.read(_v13, "R"), "range", [5, 9]), 0, (_S.binary("|", _S.prop(_S.read(_v13, "PF"), "SMOKES"), _S.prop(_S.read(_v13, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.5])) else 0)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
			var _v14 = _S.scope(_v11)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), 9)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "FIRE"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 6), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [130, 220])), _S.invoke(_S.read(_v14, "R"), "range", [0.8, 1.2]), 0, _S.invoke(_S.read(_v14, "R"), "range", [6, 8.5]), _S.invoke(_S.read(_v14, "R"), "range", [0, 0.12]), _S.binary("|", _S.prop(_S.read(_v14, "PF"), "SMOKES"), _S.prop(_S.read(_v14, "PF"), "BIG"))])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
			var _v15 = _S.scope(_v11)
			_S.define(_v15, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v15, "i"), 20)):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), 0]))
				_S.define(_v16, "d", _S.invoke(_S.read(_v16, "R"), "range", [4, 18]))
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "d")), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [6, 24])), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.invoke(_S.read(_v16, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [30, 110])), _S.invoke(_S.read(_v16, "R"), "range", [1.8, 2.8]), 0, _S.invoke(_S.read(_v16, "R"), "range", [8, 12]), _S.invoke(_S.read(_v16, "R"), "range", [0.15, 0.5]), _S.prop(_S.read(_v16, "PF"), "BIG")])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "i", 1, "+=", true)
			var _v17 = _S.scope(_v11)
			_S.define(_v17, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v17, "i"), 16)):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "s", _S.invoke(_S.read(_v18, "R"), "sign", []))
				_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [4, 18])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [1, 5])), _S.binary("+", _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [60, 130])), 10), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, 12])), _S.invoke(_S.read(_v18, "R"), "range", [1.2, 2]), _S.prop(_S.read(_v18, "st"), "dust"), _S.invoke(_S.read(_v18, "R"), "range", [5, 8]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v18, "PF"), "BIG")])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "i", 1, "+=", true)
			var _v19 = _S.scope(_v11)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 90)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 1.3), 1.3])), 0.15))
				_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [100, 300]))
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), 0, _S.unary("-", 4), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.2, 0.7])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
			var _v21 = _S.scope(_v11)
			_S.define(_v21, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v21, "i"), 36)):
				var _v22 = _S.scope(_v21)
				_S.define(_v22, "a", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
				_S.define(_v22, "sp", _S.invoke(_S.read(_v22, "R"), "range", [40, 150]))
				_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), 8), _S.binary("+", _S.unary("-", 8), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), 70), _S.invoke(_S.read(_v22, "R"), "range", [1.2, 2.6]), _S.prop(_S.read(_v22, "H"), 3)])
				_v21 = _S.iteration(_v21)
				_S.write(_v21, "i", 1, "+=", true)
			var _v23 = _S.scope(_v11)
			_S.define(_v23, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v23, "i"), 10)):
				var _v24 = _S.scope(_v23)
				_S.define(_v24, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v24, "Math"), "PI")), 2), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 1), 1.05])))
				_S.define(_v24, "sp", _S.invoke(_S.read(_v24, "R"), "range", [130, 240]))
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "BRAND"), 0, _S.unary("-", 6), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.invoke(_S.read(_v24, "R"), "range", [0.7, 1.3])])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "i", 1, "+=", true)
			var _v25 = _S.scope(_v11)
			_S.define(_v25, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "i"), 28)):
				_S.invoke(_S.read(_v25, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v25, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 8), 8])}, {"y": _S.unary("-", 3)}, {"vx": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 80), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [140, 340]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v25, "R"), "range", [1.8, 2.8])}, {"a": _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")])}, {"va": _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v25, "R"), "int", [1, 3])}, {"ramp": [_S.read(_v25, "OUTLINE"), _S.prop(_S.read(_v25, "st"), "shade"), _S.prop(_S.read(_v25, "st"), "body"), _S.prop(_S.read(_v25, "st"), "light"), _S.call_value(_S.read(_v25, "mix"), [_S.prop(_S.read(_v25, "st"), "light"), _S.read(_v25, "WHITE"), 0.3])]}])])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "+=", true)
			var _v26 = _S.scope(_v11)
			_S.define(_v26, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v26, "i"), 80)):
				var _v27 = _S.scope(_v26)
				_S.define(_v27, "u", _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 1), 1]))
				_S.define(_v27, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v27, "Math"), "PI")), 2), _S.binary("*", _S.read(_v27, "u"), 0.7)), 0.15))
				_S.define(_v27, "sp", _S.binary("*", _S.invoke(_S.read(_v27, "R"), "range", [90, 270]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "u")])))))
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "GRIT"), _S.binary("*", _S.read(_v27, "u"), 6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.invoke(_S.read(_v27, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.prop(_S.read(_v27, "st"), "light"), _S.prop(_S.read(_v27, "st"), "body"), _S.prop(_S.read(_v27, "st"), "body"), _S.prop(_S.read(_v27, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.45])) else 1)])
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v28 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "b", _v28)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v29, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v29, "b"), "dusted")))):
			var _v30 = _S.scope(_v29)
			_S.set_prop(_S.read(_v30, "b"), "dusted", true, "=", false)
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "i"), 3)):
				_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v31, "b"), "x"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v31, "R"), "sign", []), _S.invoke(_S.read(_v31, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [2, 18])), _S.invoke(_S.read(_v31, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v31, "st"), "dust"), _S.invoke(_S.read(_v31, "R"), "range", [1.3, 2.6])])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_crater = _S.read(_parent,"crater")
	var _n_ps = _S.read(_parent,"ps")
	var _n_H = _S.read(_parent,"H")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_crater,[_n_p_b0])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "back"])
	_S.invoke(_n_blazes,"drawBack",[_n_p_b0])
	var _n_k_b1 = (float((_n_t - _n_HIT))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (110 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(5 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_H,4), _S.index_value(_n_H,1)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_H = _S.read(_parent,"H")
	var _n_band = _S.read(_parent,"band")
	var _n_rock = _S.read(_parent,"rock")
	var _n_bits = _S.read(_parent,"bits")
	var _n_pos = _S.read(_parent,"pos")
	var _n_GLOW = _S.read(_parent,"GLOW")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_meteor = _S.read(_parent,"meteor")
	var _n_meta = _S.read(_parent,"meta")
	var _n_ps = _S.read(_parent,"ps")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float((_n_t - _n_HIT))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (110 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(5 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_H,4), _S.index_value(_n_H,1)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f14"), (_n_k_b1 < 0.12)])
	for _iter_0 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b4 = _iter_0
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b4, _n_st])
	if _S.truth((_n_t < _n_HIT)):
		var _tuple_1 = _S.call_value(_n_pos,[_n_t])
		var _n_x_b5 = _S.prop(_tuple_1,0)
		var _n_y_b6 = _S.prop(_tuple_1,1)
		var _n_NZ_b7 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f15")
		_S.call_value(_n_floorLight,[_n_p_b0, 0, 0.5, (30 + (40 * (float(_n_t)/_n_HIT))), 7, _n_GLOW, (0.5 * pow((float(_n_t)/_n_HIT),2))])
		_S.invoke([[36, 7, 0], [26, 7.5, (-2.5)], [26, 7.5, 2.5], [16, 8, 0]],"forEach",[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"x":_n_x_b5,"y":_n_y_b6,"NZ":_n_NZ_b7,"this":_this}),"_f16")])
		_S.call_value(_n_meteor,[_n_p_b0, _n_x_b5, _n_y_b6, 6.5, 0])
		_S.invoke(_n_p_b0,"glow",[_n_x_b5, _n_y_b6, 46, _n_GLOW, 0.55])
		_S.invoke(_n_p_b0,"glow",[_n_x_b5, _n_y_b6, 12, _S.index_value(_n_H,1), 0.4])
	else:
		var _n_a_b8 = (_n_t - _n_HIT)
		var _n_cool_b9 = clampf((float(_n_a_b8)/2.8),0.0,1.0)
		var _n_end_b10 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1.1),(_S.named_value(_n_meta,"duration") - 0.2),_n_t))
		if _S.truth((_n_end_b10 > 0)):
			_S.call_value(_n_meteor,[_n_p_b0, 0, 0, 5.5, _n_cool_b9, _n_end_b10])
			_S.invoke(_n_p_b0,"glow",[0, (-2), 22, _n_GLOW, ((0.4 * (1 - _n_cool_b9)) * _n_end_b10)])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "front"])
	var _n_f_b2 = (float((_n_t - _n_HIT))/0.08)
	if _S.truth(((_n_f_b2 < 1) if _S.truth((_n_f_b2 > 0)) else (_n_f_b2 > 0))):
		_S.invoke(_n_p_b0,"circle",[0, (-6), ((11 * (1 - (_n_f_b2 * 0.3))) + 1.5), _S.index_value(_n_H,3)])
		_S.invoke(_n_p_b0,"circle",[0, (-6), (11 * (1 - (_n_f_b2 * 0.3))), (_S.index_value(_n_H,1) if _S.truth((_n_f_b2 < 0.5)) else _S.index_value(_n_H,2))])
		_S.invoke(_n_p_b0,"circle",[0, (-6), (7 * (1 - (_n_f_b2 * 0.3))), (_n_WHITE if _S.truth((_n_f_b2 < 0.5)) else _S.index_value(_n_H,1))])
	var _n_fr_b3 = (float((_n_t - _n_HIT))/0.24)
	if _S.truth(((_n_fr_b3 < 1) if _S.truth((_n_fr_b3 > 0)) else (_n_fr_b3 > 0))):
		_S.call_value(_n_flare,[_n_p_b0, 0, (-6), (44 * pow((1 - _n_fr_b3),1.4)), (1 - _n_fr_b3), [_S.index_value(_n_H,6), _S.index_value(_n_H,4), _S.index_value(_n_H,2), _S.index_value(_n_H,1)]])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.MathFX.noise(((_n_t * _n_rate_b0) + _n_off_b2),_n_seed_b1)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_p = _S.read(_parent,"p")
	var _n_x = _S.read(_parent,"x")
	var _n_uy = _S.read(_parent,"uy")
	var _n_y = _S.read(_parent,"y")
	var _n_ux = _S.read(_parent,"ux")
	var _n_NZ = _S.read(_parent,"NZ")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameBlade = _S.read(_parent,"flameBlade")
	var _tuple_0 = _S.arg(_args,0)
	var _n_L_b0 = _S.prop(_tuple_0,0)
	var _n_w_b1 = _S.prop(_tuple_0,1)
	var _n_off_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	var _n_n_b4 = ((_n_S + _n_i_b3) * 13)
	_S.call_value(_n_flameBlade,[_n_p, (_n_x - (_n_uy * _n_off_b2)), (_n_y + (_n_ux * _n_off_b2)), (-_n_ux), (-_n_uy), (_n_L_b0 * (0.85 + (0.25 * _S.call_value(_n_NZ,[5, _n_n_b4])))), _n_w_b1, (_S.call_value(_n_NZ,[3, (_n_n_b4 + 3)]) * 3), _n_NZ, _n_n_b4, _n_H, _n_LAYERS, 0.5, 1.6])
	return null
