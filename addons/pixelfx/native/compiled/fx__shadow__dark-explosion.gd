@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/dark-explosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "ringLight", _S.import_value("fx/shadow/_lib.js", "ringLight"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "blackStar", _S.import_value("fx/shadow/_lib.js", "blackStar"))
	_S.define(_e, "attract", _S.import_value("fx/shadow/_lib.js", "attract"))
	_S.define(_e, "shard", _S.import_value("fx/shadow/_lib.js", "shard"))
	_S.define(_e, "sphere", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "floorRing", _S.function_value(_e, "_f25"))
	_S.define(_e, "meta", _S.merge([{"name": "Dark explosion"}, {"desc": "Motes swirl into a pulsing core, a black star cuts across a violet-white flash, and a black sphere burns at the rim, throws lit shards and smoke, then collapses."}, {"tags": ["shadow", "explosion", "void", "dark", "magic", "impact", "one-shot"]}, {"size": [280, 248]}, {"origin": [140, 206]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 54))
	_S.define(_e, "RS", 16)
	_S.define(_e, "REL", 0.52)
	_S.define(_e, "BURN", 1.62)
	_S.define(_e, "POP", 1.84)
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "hex"), ["#5d5468"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_heat_b4 = _S.arg(_args,4)
	if _S.truth((_n_r_b2 < 0.6)):
		return null
	var _n_E_b5 = ((_n_r_b2 + (12 * _n_heat_b4)) + 2)
	_S.invoke(_n_p_b0,"shade",[(-_n_E_b5), (_n_Y - _n_E_b5), _n_E_b5, (_n_Y + _n_E_b5), _S.function_value(_S.capture(_parent,{"E":_n_E_b5,"r":_n_r_b2,"C":_n_C_b1,"t":_n_t_b3,"heat":_n_heat_b4,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_E = _S.read(_parent,"E")
	var _n_r = _S.read(_parent,"r")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_t = _S.read(_parent,"t")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_heat = _S.read(_parent,"heat")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = _n_x_b0
	var _n_dy_b4 = (_n_y_b1 - _n_Y)
	var _n_d_b5 = sqrt(((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4)))
	if _S.truth((_n_d_b5 > _n_E)):
		return null
	if _S.truth((_n_d_b5 < (_n_r - 0.5))):
		var _n_e_b17 = (_n_r - _n_d_b5)
		var _n_ang_b18 = atan2(_n_dy_b4,_n_dx_b3)
		if _S.truth(((cos((_n_ang_b18 - 0.8)) > 0.55) if _S.truth((_n_e_b17 < 1.4)) else (_n_e_b17 < 1.4))):
			return _S.index_value(_n_C,2)
		if _S.truth((((pow((_n_dx_b3 + (_n_r * 0.45)),2) + pow((_n_dy_b4 + (_n_r * 0.45)),2)) < 1.6) if _S.truth((_n_r > 8)) else (_n_r > 8))):
			return _S.index_value(_n_C,3)
		return _S.index_value(_n_C,0)
	var _n_e_b6 = (_n_d_b5 - (_n_r - 0.5))
	if _S.truth((_n_e_b6 < 1)):
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((sin(((atan2(_n_dy_b4,_n_dx_b3) * 7) + (_n_t * 9))) > (-0.6))) else _S.index_value(_n_C,7)),"=")
		_S.set_prop(_n_out_b2,"k",0.4,"=")
		return null
	var _n_ang_b7 = atan2((_n_dy_b4 + (_n_e_b6 * 0.6)),_n_dx_b3)
	var _n_top_b8 = maxf(0,(-sin(_n_ang_b7)))
	var _n_a1_b9 = (_n_ang_b7 - (_n_t * 0.9))
	var _n_a2_b10 = (_n_ang_b7 + (_n_t * 1.7))
	var _n_i1_b11 = floori((float((_n_a1_b9 * 9))/_n_TAU)+0.5)
	var _n_i2_b12 = floori((float((_n_a2_b10 * 15))/_n_TAU)+0.5)
	var _n_T1_b13 = (pow((0.5 + (0.5 * cos((_n_a1_b9 * 9)))),3) * (0.55 + (0.45 * _S.MathFX.noise(((_n_t * 7) + (_n_i1_b11 * 3.7)),1))))
	var _n_T2_b14 = (pow((0.5 + (0.5 * cos((_n_a2_b10 * 15)))),4) * (0.5 + (0.5 * _S.MathFX.noise(((_n_t * 11) + (_n_i2_b12 * 5.1)),2))))
	var _n_h_b15 = ((_n_heat * (0.3 + (0.95 * _n_top_b8))) * ((1.5 + (12 * maxf(0,_n_T1_b13))) + (6 * maxf(0,_n_T2_b14))))
	if _S.truth((_n_e_b6 > (_n_h_b15 + 1))):
		return null
	var _n_u_b16 = (float((_n_e_b6 - 1))/_n_h_b15)
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_u_b16 < 0.18)) else (_S.index_value(_n_C,7) if _S.truth((_n_u_b16 < 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b16 < 0.62)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b16 < 0.84)) else _S.index_value(_n_C,4))))),"=")
	_S.set_prop(_n_out_b2,"a",(1 if _S.truth((_n_u_b16 < 0.8)) else ((1 - _n_u_b16) * 5)),"=")
	if _S.truth((_S.binary("===",_S.binary("&",(floori(_n_x_b0) + floori(_n_y_b1)),1),0) if _S.truth((_n_u_b16 < 0.6)) else (_n_u_b16 < 0.6))):
		_S.set_prop(_n_out_b2,"k",(0.25 * (1 - _n_u_b16)),"=")
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "release", _S.function_value(_e, "_f3"))
	_S.define(_e, "pop", _S.function_value(_e, "_f5"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}])]))
	_S.define(_e, "embers", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 1), 0.3]), _S.read(_e, "SMOKE"), 0.45]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.read(_e, "SMOKE"), 0.3])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.read(_e, "SMOKE"), 0.4])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "collapsing", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "acc", 0)
	_S.define(_e, "dustAcc", 0)
	_S.define(_e, "flick", 1)
	_S.define(_e, "coreR", _S.function_value(_e, "_f7"))
	_S.define(_e, "sphereR", _S.function_value(_e, "_f8"))
	_S.define(_e, "starL", _S.function_value(_e, "_f9"))
	_S.define(_e, "starRot", _S.function_value(_e, "_f10"))
	_S.define(_e, "burning", _S.function_value(_e, "_f11"))
	_S.define(_e, "light", _S.function_value(_e, "_f12"))
	_S.define(_e, "rim", _S.function_value(_e, "_f13"))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f18")}, {"draw": _S.function_value(_e, "_f19")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_light = _S.read(_parent,"light")
	var _n_Y = _S.read(_parent,"Y")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_rings = _S.read(_parent,"rings")
	var _n_RS = _S.read(_parent,"RS")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_rim = _S.read(_parent,"rim")
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_embers = _S.read(_parent,"embers")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	_S.call_value(_n_light,[0, _n_Y, 100, _S.index_value(_n_C,4), 1.25, 0.85])
	_S.call_value(_n_light,[0, _n_Y, 86, _S.ColorFX.mix(_S.index_value(_n_C,6),_n_WHITE,0.5), 1.3, 0.22])
	_S.invoke(_n_rings,"push",[{"r0":_n_RS,"r1":104,"life":0.46,"max":0.46,"th":3.6,"hot":true,"delay":0}])
	_S.invoke(_n_rings,"push",[{"r0":(_n_RS * 0.8),"r1":62,"life":0.3,"max":0.3,"th":1.6,"hot":true,"delay":0.02}])
	_S.invoke(_n_rings,"push",[{"r0":_n_RS,"r1":124,"life":0.62,"max":0.62,"th":1.2,"hot":false,"delay":0.07}])
	if true:
		var _n_i_b0 = 0
		while _S.truth((_n_i_b0 < 34)):
			var _n_big_b1 = (_n_i_b0 < 20)
			var _n_a_b2 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _tuple_0 = _S.call_value(_n_rim,[_n_a_b2, (_n_RS * 0.7)])
			var _n_x_b3 = _S.prop(_tuple_0,0)
			var _n_y_b4 = _S.prop(_tuple_0,1)
			var _n_sp_b5 = (_S.invoke(_n_R,"range",[80, 170]) if _S.truth(_n_big_b1) else _S.invoke(_n_R,"range",[130, 220]))
			_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":_n_x_b3,"y":_n_y_b4,"vx":(cos(_n_a_b2) * _n_sp_b5),"vy":((sin(_n_a_b2) * _n_sp_b5) - _S.invoke(_n_R,"range",[40, 110])),"g":0.75,"drag":(1.3 if _S.truth(_n_big_b1) else 1.7),"bounce":0.35,"life":_S.invoke(_n_R,"range",[1.6, 2.6]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-16), 16]),"s":(_S.invoke(_n_R,"range",[6, 11]) if _S.truth(_n_big_b1) else _S.invoke(_n_R,"range",[3, 4.5]))}])
			_n_i_b0 += 1.0
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 84)):
			var _n_a_b7 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _tuple_1 = _S.call_value(_n_rim,[_n_a_b7, (_n_RS * 0.8)])
			var _n_x_b8 = _S.prop(_tuple_1,0)
			var _n_y_b9 = _S.prop(_tuple_1,1)
			var _n_sp_b10 = _S.invoke(_n_R,"range",[120, 235])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _n_x_b8, _n_y_b9, (cos(_n_a_b7) * _n_sp_b10), ((sin(_n_a_b7) * _n_sp_b10) - 50), _S.invoke(_n_R,"range",[0.2, 0.7])])
			_n_i_b6 += 1.0
	if true:
		var _n_i_b11 = 0
		while _S.truth((_n_i_b11 < 28)):
			var _n_a_b12 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _tuple_2 = _S.call_value(_n_rim,[_n_a_b12, (_n_RS * 0.9)])
			var _n_x_b13 = _S.prop(_tuple_2,0)
			var _n_y_b14 = _S.prop(_tuple_2,1)
			var _n_sp_b15 = _S.invoke(_n_R,"range",[30, 130])
			_S.invoke(_n_embers,"spawn",[_S.named_value(_n_P,"EMBER"), _n_x_b13, _n_y_b14, (cos(_n_a_b12) * _n_sp_b15), ((sin(_n_a_b12) * _n_sp_b15) - 40), _S.invoke(_n_R,"range",[1.3, 2.5])])
			_n_i_b11 += 1.0
	if true:
		var _n_i_b16 = 0
		while _S.truth((_n_i_b16 < 24)):
			var _n_a_b17 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _tuple_3 = _S.call_value(_n_rim,[_n_a_b17, (_n_RS * 0.9)])
			var _n_x_b18 = _S.prop(_tuple_3,0)
			var _n_y_b19 = _S.prop(_tuple_3,1)
			var _n_sp_b20 = _S.invoke(_n_R,"range",[15, 70])
			_S.invoke(_n_puffs,"spawn",[_S.named_value(_n_PK,"SOOT"), _n_x_b18, _n_y_b19, (cos(_n_a_b17) * _n_sp_b20), (((sin(_n_a_b17) * _n_sp_b20) * 0.8) - 14), _S.invoke(_n_R,"range",[2, 2.8]), _S.invoke(_n_R,"range",[7, 12]), _S.invoke(_n_R,"range",[0.02, 0.3])])
			_n_i_b16 += 1.0
	if true:
		var _n_i_b21 = 0
		while _S.truth((_n_i_b21 < 12)):
			var _n_s_b22 = (1 if _S.truth(fmod(_n_i_b21,2)) else (-1))
			_S.invoke(_n_puffs,"spawn",[_S.named_value(_n_PK,"SOOT"), (_n_s_b22 * _S.invoke(_n_R,"range",[10, 40])), (-_S.invoke(_n_R,"range",[2, 5])), (_n_s_b22 * _S.invoke(_n_R,"range",[50, 120])), (-_S.invoke(_n_R,"range",[0, 10])), _S.invoke(_n_R,"range",[1.6, 2.4]), _S.invoke(_n_R,"range",[5, 9]), _S.invoke(_n_R,"range",[0.08, 0.2])])
			_n_i_b21 += 1.0
	if true:
		var _n_i_b23 = 0
		while _S.truth((_n_i_b23 < 10)):
			var _n_a_b24 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.6), 1.6]))
			var _tuple_4 = _S.call_value(_n_rim,[_n_a_b24, _n_RS])
			var _n_x_b25 = _S.prop(_tuple_4,0)
			var _n_y_b26 = _S.prop(_tuple_4,1)
			var _n_sp_b27 = _S.invoke(_n_R,"range",[30, 80])
			_S.invoke(_n_puffs,"spawn",[_S.named_value(_n_PK,"FLAME"), _n_x_b25, _n_y_b26, (cos(_n_a_b24) * _n_sp_b27), ((sin(_n_a_b24) * _n_sp_b27) - 30), _S.invoke(_n_R,"range",[0.3, 0.6]), _S.invoke(_n_R,"range",[2, 3.6]), 0, _S.invoke(_n_R,"chance",[0.5])])
			_n_i_b23 += 1.0
	_S.set_prop(_S.named_value(_n_ps,"list"),"length",0,"=")
	_S.set_prop(_n_puffs,"list",_S.invoke(_S.named_value(_n_puffs,"list"),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f4")]),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_q_b0,"delay") > 0)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_light = _S.read(_parent,"light")
	var _n_Y = _S.read(_parent,"Y")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_rings = _S.read(_parent,"rings")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_embers = _S.read(_parent,"embers")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	_S.call_value(_n_light,[0, _n_Y, 56, _n_WHITE, 0.9, 0.18])
	_S.call_value(_n_light,[0, _n_Y, 120, _S.index_value(_n_C,5), 0.8, 0.5])
	_S.invoke(_n_rings,"push",[{"r0":2,"r1":40,"life":0.28,"max":0.28,"th":2,"hot":true,"delay":0}])
	if true:
		var _n_i_b0 = 0
		while _S.truth((_n_i_b0 < 26)):
			var _n_a_b1 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_sp_b2 = _S.invoke(_n_R,"range",[120, 250])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), 0, _n_Y, (cos(_n_a_b1) * _n_sp_b2), ((sin(_n_a_b1) * _n_sp_b2) - 40), _S.invoke(_n_R,"range",[0.2, 0.6])])
			_n_i_b0 += 1.0
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 14)):
			var _n_a_b4 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_sp_b5 = _S.invoke(_n_R,"range",[20, 90])
			_S.invoke(_n_embers,"spawn",[_S.named_value(_n_P,"EMBER"), 0, _n_Y, (cos(_n_a_b4) * _n_sp_b5), ((sin(_n_a_b4) * _n_sp_b5) - 30), _S.invoke(_n_R,"range",[0.9, 1.6])])
			_n_i_b3 += 1.0
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 10)):
			var _n_a_b7 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_sp_b8 = _S.invoke(_n_R,"range",[20, 70])
			_S.invoke(_n_puffs,"spawn",[_S.named_value(_n_PK,"SOOT"), (cos(_n_a_b7) * 3), (_n_Y + (sin(_n_a_b7) * 3)), (cos(_n_a_b7) * _n_sp_b8), ((sin(_n_a_b7) * _n_sp_b8) - 15), _S.invoke(_n_R,"range",[1.1, 1.7]), _S.invoke(_n_R,"range",[3, 6]), _S.invoke(_n_R,"range",[0, 0.08])])
			_n_i_b6 += 1.0
	for _iter_0 in _S.array(_S.concat([_S.array(_S.named_value(_n_embers,"list")),_S.array(_S.named_value(_n_puffs,"list"))])):
		var _n_q_b9 = _iter_0
		var _n_dx_b10 = _S.named_value(_n_q_b9,"x")
		var _n_dy_b11 = (_S.named_value(_n_q_b9,"y") - _n_Y)
		var _n_d_b12 = _S.logical("||",_S.Bridge.hypot([_n_dx_b10, _n_dy_b11]),func():return 1)
		var _n_f_b13 = (90 * maxf(0,(1 - (float(_n_d_b12)/70))))
		_S.set_prop(_n_q_b9,"vx",((float(_n_dx_b10)/_n_d_b12) * _n_f_b13),"+=")
		_S.set_prop(_n_q_b9,"vy",(((float(_n_dy_b11)/_n_d_b12) * _n_f_b13) - (_n_f_b13 * 0.3)),"+=")
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < 12)):
			_S.invoke(_n_puffs,"spawn",[_S.named_value(_n_PK,"SOOT"), _S.invoke(_n_R,"range",[(-6), 6]), (_n_Y + _S.invoke(_n_R,"range",[(-4), 6])), _S.invoke(_n_R,"range",[(-10), 10]), (-_S.invoke(_n_R,"range",[20, 55])), _S.invoke(_n_R,"range",[1.3, 1.8]), _S.invoke(_n_R,"range",[7, 12]), _S.invoke(_n_R,"range",[0.02, 0.2])])
			_n_i_b14 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_REL = _S.read(_parent,"REL")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((1.5 + (5 * _S.invoke(_n_ease,"inQuad",[(float(_n_tt_b0)/_n_REL)]))) if _S.truth((_n_tt_b0 < (_n_REL - 0.07))) else 1)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_REL = _S.read(_parent,"REL")
	var _n_BURN = _S.read(_parent,"BURN")
	var _n_RS = _S.read(_parent,"RS")
	var _n_ease = _S.read(_parent,"ease")
	var _n_POP = _S.read(_parent,"POP")
	var _n_tt_b0 = _S.arg(_args,0)
	if _S.truth((_n_tt_b0 < _n_REL)):
		return 0
	if _S.truth((_n_tt_b0 < _n_BURN)):
		return ((_n_RS * _S.invoke(_n_ease,"outBack",[clampf((float((_n_tt_b0 - _n_REL))/0.14),0.0,1.0), 2.4])) * ((1 + (0.06 * _S.MathFX.smooth((_n_REL + 0.3),_n_BURN,_n_tt_b0))) + (0.02 * sin((_n_tt_b0 * 11)))))
	if _S.truth((_n_tt_b0 < _n_POP)):
		return ((_n_RS * 1.08) * (1 - _S.invoke(_n_ease,"inQuad",[(float((_n_tt_b0 - _n_BURN))/(_n_POP - _n_BURN))])))
	return 0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_REL = _S.read(_parent,"REL")
	var _n_ease = _S.read(_parent,"ease")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0 if _S.truth(((_n_tt_b0 < _n_REL) if _S.truth((_n_tt_b0 < _n_REL)) else (_n_tt_b0 > (_n_REL + 0.26)))) else (60 * (1 - _S.invoke(_n_ease,"inQuad",[clampf((float(((_n_tt_b0 - _n_REL) - 0.05))/0.21),0.0,1.0)]))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_REL = _S.read(_parent,"REL")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0.32 + ((_n_tt_b0 - _n_REL) * 2.2))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_REL = _S.read(_parent,"REL")
	var _n_BURN = _S.read(_parent,"BURN")
	var _n_POP = _S.read(_parent,"POP")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((clampf((float(_n_tt_b0)/_n_REL),0.0,1.0) * 0.7) if _S.truth((_n_tt_b0 < _n_REL)) else (1 if _S.truth((_n_tt_b0 < _n_BURN)) else (1.2 if _S.truth((_n_tt_b0 < _n_POP)) else maxf(0,(1 - (float((_n_tt_b0 - _n_POP))/0.35))))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_lights = _S.read(_parent,"lights")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	return _S.invoke(_n_lights,"push",[{"x":_n_x_b0,"y":_n_y_b1,"r":_n_r_b2,"c":_n_c_b3,"k":_n_k_b4,"life":_n_life_b5,"max":_n_life_b5}])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return [(cos(_n_a_b0) * _n_r_b1), (_n_Y + (sin(_n_a_b0) * _n_r_b1))]
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.write(_e, "flick", _S.binary("+", 0.88, _S.binary("*", _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 37)])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 23)]))), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "REL"), 0.06))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "k", _S.binary("/", _S.read(_v29, "t"), _S.read(_v29, "REL")))
		var _v30 = _S.scope(_v29)
		_S.write(_v30, "acc", _S.binary("*", _S.read(_v30, "dt"), _S.binary("+", 90, _S.binary("*", 150, _S.read(_v30, "k")))), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v30, "acc"), 1)):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.invoke(_S.read(_v31, "R"), "range", [0, _S.read(_v31, "TAU")]))
			_S.define(_v31, "D", _S.invoke(_S.read(_v31, "R"), "range", [36, 84]))
			_S.define(_v31, "x", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "D")))
			_S.define(_v31, "y", _S.invoke(_S.read(_v31, "Math"), "min", [_S.unary("-", 3), _S.binary("+", _S.read(_v31, "Y"), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "D")))]))
			_S.define(_v31, "vt", _S.invoke(_S.read(_v31, "R"), "range", [50, 110]))
			_S.define(_v31, "vi", _S.invoke(_S.read(_v31, "R"), "range", [10, 40]))
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "MOTE"), _S.read(_v31, "x"), _S.read(_v31, "y"), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")])), _S.read(_v31, "vt")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "vi"))), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "vt")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "vi"))), 0.9, _S.invoke(_S.read(_v31, "R"), "pick", [[_S.read(_v31, "WHITE"), _S.prop(_S.read(_v31, "C"), 6), _S.prop(_S.read(_v31, "C"), 6), _S.prop(_S.read(_v31, "C"), 5)]]), _S.invoke(_S.read(_v31, "R"), "range", [0.7, 1.2])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.75])):
			var _v32 = _S.scope(_v29)
			_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [0, _S.read(_v32, "TAU")]))
			_S.define(_v32, "D", _S.invoke(_S.read(_v32, "R"), "range", [28, 70]))
			_S.define(_v32, "T", _S.invoke(_S.read(_v32, "R"), "range", [0.18, 0.28]))
			_S.define(_v32, "v", _S.binary("/", _S.binary("*", _S.read(_v32, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v32, "Math"), "exp", [_S.binary("*", 3, _S.read(_v32, "T"))]), 1)))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "D")), _S.binary("+", _S.read(_v32, "Y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")])), _S.read(_v32, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")])), _S.read(_v32, "v")), _S.read(_v32, "T"), (_S.prop(_S.read(_v32, "C"), 7) if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.5])) else _S.prop(_S.read(_v32, "C"), 6))])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v29, "t"), _S.binary("-", _S.read(_v29, "REL"), 0.2)), func(): return _S.invoke(_S.read(_v29, "R"), "chance", [0.16]))):
			var _v33 = _S.scope(_v29)
			_S.define(_v33, "a", _S.invoke(_S.read(_v33, "R"), "range", [0, _S.read(_v33, "TAU")]))
			_S.define(_v33, "D", _S.invoke(_S.read(_v33, "R"), "range", [34, 60]))
			_S.invoke(_S.read(_v33, "puffs"), "spawn", [_S.prop(_S.read(_v33, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")]), _S.read(_v33, "D")), _S.binary("+", _S.read(_v33, "Y"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")]), _S.read(_v33, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")])), 40), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")]), 40), _S.invoke(_S.read(_v33, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v33, "R"), "range", [3, 6])])
		_S.call_value(_S.read(_v29, "attract"), [_S.prop(_S.read(_v29, "ps"), "list"), 0, _S.read(_v29, "Y"), _S.binary("*", 2200000, _S.binary("+", 0.3, _S.read(_v29, "k"))), 110, 0.55, 2.5, _S.read(_v29, "dt"), _S.function_value(_v29, "_f15"), 420])
		_S.call_value(_S.read(_v29, "attract"), [_S.prop(_S.read(_v29, "puffs"), "list"), 0, _S.read(_v29, "Y"), _S.binary("*", 1200000, _S.binary("+", 0.3, _S.read(_v29, "k"))), 90, 0.7, 4, _S.read(_v29, "dt"), _S.function_value(_v29, "_f16"), 160])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "REL")), func(): return _S.unary("!", _S.read(_e, "released")))):
		var _v34 = _S.scope(_e)
		_S.write(_v34, "released", true, "=", false)
		_S.call_value(_S.read(_v34, "release"), [])
	if _S.truth(_S.logical("&&", _S.read(_e, "released"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURN")))):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "sr", _S.call_value(_S.read(_v35, "sphereR"), [_S.read(_v35, "t")]))
		var _v36 = _S.scope(_v35)
		_S.write(_v36, "acc", _S.binary("*", _S.read(_v36, "dt"), 34), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v36, "acc"), 1)):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v37, "Math"), "PI")), 2), _S.binary("*", _S.invoke(_S.read(_v37, "R"), "gauss", []), 1.1)))
			var _v38 = _S.call_value(_S.read(_v37, "rim"), [_S.read(_v37, "a"), _S.binary("+", _S.read(_v37, "sr"), 1)])
			_S.define(_v37, "x", _S.prop(_v38, 0))
			_S.define(_v37, "y", _S.prop(_v38, 1))
			_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "R"), "range", [10, 35]))
			_S.invoke(_S.read(_v37, "puffs"), "spawn", [_S.prop(_S.read(_v37, "PK"), "FLAME"), _S.read(_v37, "x"), _S.read(_v37, "y"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.invoke(_S.read(_v37, "R"), "range", [10, 30])), _S.invoke(_S.read(_v37, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v37, "R"), "range", [1.2, 2.2]), 0, _S.invoke(_S.read(_v37, "R"), "chance", [0.2])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 10)])):
			var _v39 = _S.scope(_v35)
			_S.define(_v39, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 2), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			var _v40 = _S.call_value(_S.read(_v39, "rim"), [_S.read(_v39, "a"), _S.binary("*", _S.read(_v39, "sr"), 0.9)])
			_S.define(_v39, "x", _S.prop(_v40, 0))
			_S.define(_v39, "y", _S.prop(_v40, 1))
			_S.invoke(_S.read(_v39, "puffs"), "spawn", [_S.prop(_S.read(_v39, "PK"), "SOOT"), _S.read(_v39, "x"), _S.read(_v39, "y"), _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "cos", [_S.read(_v39, "a")]), 20), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [15, 35])), _S.invoke(_S.read(_v39, "R"), "range", [1.2, 1.7]), _S.invoke(_S.read(_v39, "R"), "range", [5, 9])])
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 8)])):
			var _v41 = _S.scope(_v35)
			_S.define(_v41, "a", _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")]))
			var _v42 = _S.call_value(_S.read(_v41, "rim"), [_S.read(_v41, "a"), _S.read(_v41, "sr")])
			_S.define(_v41, "x", _S.prop(_v42, 0))
			_S.define(_v41, "y", _S.prop(_v42, 1))
			_S.define(_v41, "sp", _S.invoke(_S.read(_v41, "R"), "range", [110, 200]))
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "SPARK"), _S.read(_v41, "x"), _S.read(_v41, "y"), _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "a")]), _S.read(_v41, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "a")]), _S.read(_v41, "sp")), 40), _S.invoke(_S.read(_v41, "R"), "range", [0.2, 0.5])])
		if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", _S.read(_v35, "dt"), 7)])):
			var _v43 = _S.scope(_v35)
			_S.define(_v43, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v43, "Math"), "PI")), 2), _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			var _v44 = _S.call_value(_S.read(_v43, "rim"), [_S.read(_v43, "a"), _S.read(_v43, "sr")])
			_S.define(_v43, "x", _S.prop(_v44, 0))
			_S.define(_v43, "y", _S.prop(_v44, 1))
			_S.invoke(_S.read(_v43, "embers"), "spawn", [_S.prop(_S.read(_v43, "P"), "EMBER"), _S.read(_v43, "x"), _S.read(_v43, "y"), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "cos", [_S.read(_v43, "a")]), 30), _S.unary("-", _S.invoke(_S.read(_v43, "R"), "range", [20, 50])), _S.invoke(_S.read(_v43, "R"), "range", [0.9, 1.6])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURN")), func(): return _S.unary("!", _S.read(_e, "collapsing")))):
		var _v45 = _S.scope(_e)
		_S.write(_v45, "collapsing", true, "=", false)
		var _v46 = _S.scope(_v45)
		_S.define(_v46, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), 14)):
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "a", _S.invoke(_S.read(_v47, "R"), "range", [0, _S.read(_v47, "TAU")]))
			_S.define(_v47, "D", _S.invoke(_S.read(_v47, "R"), "range", [26, 48]))
			_S.define(_v47, "T", _S.invoke(_S.read(_v47, "R"), "range", [0.14, 0.2]))
			_S.define(_v47, "v", _S.binary("/", _S.binary("*", _S.read(_v47, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v47, "Math"), "exp", [_S.binary("*", 3, _S.read(_v47, "T"))]), 1)))
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")]), _S.read(_v47, "D")), _S.binary("+", _S.read(_v47, "Y"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")]), _S.read(_v47, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")])), _S.read(_v47, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")])), _S.read(_v47, "v")), _S.read(_v47, "T"), (_S.read(_v47, "WHITE") if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 6))])
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "collapsing"), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v48 = _S.scope(_e)
		_S.call_value(_S.read(_v48, "attract"), [_S.prop(_S.read(_v48, "puffs"), "list"), 0, _S.read(_v48, "Y"), 1400000, 64, 0.6, 3, _S.read(_v48, "dt"), _S.function_value(_v48, "_f17"), 200])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v49 = _S.scope(_e)
		_S.write(_v49, "popped", true, "=", false)
		_S.call_value(_S.read(_v49, "pop"), [])
	for _v50 in _S.array(_S.read(_e, "rings")):
		var _v51 = _S.scope(_e)
		_S.define(_v51, "r", _v50)
		var _v52 = _S.scope(_v51)
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_v52, "r"), "delay"), 0), func(): return _S.unary("!", _S.prop(_S.read(_v52, "r"), "hot"))), func(): return _S.binary("<", _S.prop(_S.read(_v52, "r"), "th"), 3))):
			continue
		_S.define(_v52, "rr", _S.binary("+", _S.prop(_S.read(_v52, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v52, "r"), "r1"), _S.prop(_S.read(_v52, "r"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_v52, "Math"), "pow", [_S.binary("/", _S.prop(_S.read(_v52, "r"), "life"), _S.prop(_S.read(_v52, "r"), "max")), 3])))))
		_S.define(_v52, "rf", (_S.invoke(_S.read(_v52, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v52, "rr"), _S.read(_v52, "rr")), _S.binary("*", _S.read(_v52, "Y"), _S.read(_v52, "Y")))]) if _S.truth(_S.binary(">", _S.read(_v52, "rr"), _S.unary("-", _S.read(_v52, "Y")))) else 0))
		if _S.truth(_S.binary(">", _S.read(_v52, "rf"), 0)):
			var _v53 = _S.scope(_v52)
			_S.write(_v53, "dustAcc", _S.binary("*", _S.read(_v53, "dt"), 60), "+=", false)
			while _S.truth(_S.binary(">", _S.read(_v53, "dustAcc"), 1)):
				var _v54 = _S.scope(_v53)
				_S.define(_v54, "s", _S.invoke(_S.read(_v54, "R"), "sign", []))
				_S.invoke(_S.read(_v54, "ps"), "spawn", [_S.prop(_S.read(_v54, "P"), "DUST"), _S.binary("+", _S.binary("*", _S.read(_v54, "s"), _S.read(_v54, "rf")), _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [1, 3])), _S.binary("*", _S.read(_v54, "s"), _S.invoke(_S.read(_v54, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [4, 14])), _S.invoke(_S.read(_v54, "R"), "range", [0.4, 0.8]), _S.call_value(_S.read(_v54, "mix"), [_S.prop(_S.read(_v54, "C"), 2), _S.prop(_S.read(_v54, "C"), 3), _S.invoke(_S.read(_v54, "R"), "next", [])]), _S.invoke(_S.read(_v54, "R"), "range", [1.5, 3])])
				_v53 = _S.iteration(_v53)
				_S.write(_v53, "dustAcc", 1, "-=", true)
	for _v55 in _S.array([_S.read(_e, "lights"), _S.read(_e, "rings")]):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "a", _v55)
		var _v57 = _S.scope(_v56)
		_S.define(_v57, "i", _S.binary("-", _S.prop(_S.read(_v57, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v57, "i"), 0)):
			var _v58 = _S.scope(_v57)
			_S.define(_v58, "q", _S.prop(_S.read(_v58, "a"), _S.read(_v58, "i")))
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v58, "q"), "delay"), 0)):
				_S.set_prop(_S.read(_v58, "q"), "delay", _S.read(_v58, "dt"), "-=", false)
			else:
				if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v58, "q"), "life", _S.read(_v58, "dt"), "-=", false), 0)):
					_S.invoke(_S.read(_v58, "a"), "splice", [_S.read(_v58, "i"), 1])
			_v57 = _S.iteration(_v57)
			_S.write(_v57, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v59 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v60 = _S.scope(_e)
		_S.define(_v60, "b", _v59)
		var _v61 = _S.scope(_v60)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v61, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v61, "b"), "flat")))):
			var _v62 = _S.scope(_v61)
			_S.set_prop(_S.read(_v62, "b"), "flat", true, "=", false)
			_S.set_prop(_S.read(_v62, "b"), "a", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v62, "b"), "a"), _S.prop(_S.read(_v62, "Math"), "PI"))]), _S.prop(_S.read(_v62, "Math"), "PI")), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 0.2), 0.2])), "=", false)
			_S.set_prop(_S.read(_v62, "b"), "y", _S.unary("-", 1), "=", false)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v61, "b"), "life"), 0.45), func(): return _S.unary("!", _S.prop(_S.read(_v61, "b"), "wisp")))):
			var _v63 = _S.scope(_v61)
			_S.set_prop(_S.read(_v63, "b"), "wisp", true, "=", false)
			_S.invoke(_S.read(_v63, "puffs"), "spawn", [_S.prop(_S.read(_v63, "PK"), "SOOT"), _S.prop(_S.read(_v63, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v63, "b"), "y"), 1), _S.invoke(_S.read(_v63, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v63, "R"), "range", [8, 16])), _S.invoke(_S.read(_v63, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v63, "R"), "range", [1.4, 2.4])])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "embers"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_q_b0 = _S.arg(_args,0)
	return (1 if _S.truth(_S.binary("===",_S.named_value(_n_q_b0,"k"),_S.named_value(_n_P,"MOTE"))) else 0)
	return null

static func _f16(_parent,_args:Array,_this=null):
	return 1
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_PK = _S.read(_parent,"PK")
	var _n_q_b0 = _S.arg(_args,0)
	return (1 if _S.truth(_S.binary("===",_S.named_value(_n_q_b0,"k"),_S.named_value(_n_PK,"FLAME"))) else 0.35)
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_burning = _S.read(_parent,"burning")
	var _n_t = _S.read(_parent,"t")
	var _n_floorRing = _S.read(_parent,"floorRing")
	var _n_C = _S.read(_parent,"C")
	var _n_rings = _S.read(_parent,"rings")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	var _n_Y = _S.read(_parent,"Y")
	var _n_flick = _S.read(_parent,"flick")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_burning,[_n_t])
	for _iter_0 in _S.array(_n_rings):
		var _n_r_b2 = _iter_0
		_S.call_value(_n_floorRing,[_n_p_b0, _n_C, _n_r_b2, true])
	_S.invoke(_n_puffs,"draw",[_n_p_b0, _S.named_value(_n_PK,"SOOT"), {"x":0,"y":_n_Y,"k":(_n_k_b1 * _n_flick),"reach":84}])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-3), 74, _S.index_value(_n_C,4), ((0.24 * minf(1,_n_k_b1)) * _n_flick)])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "sr", _S.call_value(_S.read(_e, "sphereR"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "burning"), [_S.read(_e, "t")]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "starL"), [_S.read(_e, "t")]))
	for _v66 in _S.array(_S.read(_e, "rings")):
		var _v67 = _S.scope(_e)
		_S.define(_v67, "r", _v66)
		_S.call_value(_S.read(_v67, "floorRing"), [_S.read(_v67, "p"), _S.read(_v67, "C"), _S.read(_v67, "r"), false])
	_S.define(_e, "cr", 0)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v68 = _S.scope(_e)
		_S.define(_v68, "q", _S.binary("/", _S.read(_v68, "t"), _S.read(_v68, "REL")))
		_S.define(_v68, "ring", _S.binary("+", 3, _S.binary("*", 74, _S.binary("-", 1, _S.invoke(_S.read(_v68, "ease"), "inQuad", [_S.read(_v68, "q")])))))
		_S.define(_v68, "beat", _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_v68, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v68, "t"), _S.binary("*", _S.read(_v68, "REL"), 0.5)), 2)), 0.0015)]))), _S.binary("*", 0.4, _S.invoke(_S.read(_v68, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v68, "t"), _S.binary("*", _S.read(_v68, "REL"), 0.8)), 2)), 0.0015)]))))
		_S.write(_v68, "cr", _S.binary("*", _S.call_value(_S.read(_v68, "coreR"), [_S.read(_v68, "t")]), _S.read(_v68, "beat")), "=", false)
		_S.call_value(_S.read(_v68, "ringFast"), [_S.read(_v68, "p"), 0, _S.read(_v68, "Y"), _S.read(_v68, "ring"), 1, (_S.prop(_S.read(_v68, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v68, "q"), 0.7)) else _S.prop(_S.read(_v68, "C"), 5)), _S.binary("+", 0.2, _S.binary("*", 0.7, _S.read(_v68, "q")))])
		if _S.truth(_S.binary(">", _S.read(_v68, "t"), _S.binary("-", _S.read(_v68, "REL"), 0.07))):
			_S.invoke(_S.read(_v68, "p"), "circle", [0, _S.read(_v68, "Y"), 1.6, _S.read(_v68, "WHITE")])
		else:
			_S.call_value(_S.read(_v68, "sphere"), [_S.read(_v68, "p"), _S.read(_v68, "C"), _S.read(_v68, "cr"), _S.read(_v68, "t"), _S.binary("+", 0.3, _S.binary("*", 0.3, _S.read(_v68, "q")))])
		_S.call_value(_S.read(_v68, "halo"), [_S.read(_v68, "p"), 0, _S.read(_v68, "Y"), _S.read(_v68, "cr"), _S.binary("+", _S.binary("+", _S.read(_v68, "cr"), 14), _S.binary("*", 30, _S.read(_v68, "q"))), _S.prop(_S.read(_v68, "C"), 5), _S.binary("*", _S.binary("+", 0.45, _S.binary("*", 0.7, _S.read(_v68, "q"))), _S.read(_v68, "beat"))])
		_S.invoke(_S.read(_v68, "p"), "glow", [0, _S.read(_v68, "Y"), _S.binary("+", 60, _S.binary("*", 30, _S.read(_v68, "q"))), _S.prop(_S.read(_v68, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.3, _S.read(_v68, "q")))])
	_S.define(_e, "fu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "REL")), 0.12))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "fu"), 0), func(): return _S.binary("<", _S.read(_e, "fu"), 1))):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "r", _S.binary("*", 36, _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v69, "fu")))))
		_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.binary("+", _S.read(_v69, "r"), 1.5), _S.prop(_S.read(_v69, "C"), 5), _S.binary("-", 1.2, _S.read(_v69, "fu"))])
		_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.read(_v69, "r"), (_S.read(_v69, "WHITE") if _S.truth(_S.binary("<", _S.read(_v69, "fu"), 0.35)) else _S.prop(_S.read(_v69, "C"), 6)), _S.binary("-", 1.1, _S.read(_v69, "fu"))])
		if _S.truth(_S.binary("<", _S.read(_v69, "fu"), 0.6)):
			_S.invoke(_S.read(_v69, "p"), "circle", [0, _S.read(_v69, "Y"), _S.binary("*", _S.read(_v69, "r"), 0.62), _S.read(_v69, "WHITE")])
	for _v70 in _S.array(_S.read(_e, "rings")):
		var _v71 = _S.scope(_e)
		_S.define(_v71, "r", _v70)
		var _v72 = _S.scope(_v71)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v72, "r"), "delay"), 0)):
			continue
		_S.define(_v72, "q", _S.binary("/", _S.prop(_S.read(_v72, "r"), "life"), _S.prop(_S.read(_v72, "r"), "max")))
		_S.define(_v72, "rr", _S.binary("+", _S.prop(_S.read(_v72, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v72, "r"), "r1"), _S.prop(_S.read(_v72, "r"), "r0")), _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_v72, "q"), _S.read(_v72, "q")), _S.read(_v72, "q"))))))
		_S.define(_v72, "th", _S.invoke(_S.read(_v72, "Math"), "max", [1, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v72, "r"), "th"), _S.read(_v72, "q")), 0.4)]))
		_S.call_value(_S.read(_v72, "ringFast"), [_S.read(_v72, "p"), 0, _S.read(_v72, "Y"), _S.read(_v72, "rr"), _S.read(_v72, "th"), _S.function_value(_v72, "_f20"), _S.function_value(_v72, "_f21")])
		if _S.truth(_S.prop(_S.read(_v72, "r"), "hot")):
			_S.call_value(_S.read(_v72, "ringLight"), [_S.read(_v72, "p"), 0, _S.read(_v72, "Y"), _S.read(_v72, "rr"), 4, _S.prop(_S.read(_v72, "C"), 5), _S.binary("*", 0.4, _S.read(_v72, "q")), _S.function_value(_v72, "_f22")])
	_S.call_value(_S.read(_e, "sphere"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sr"), _S.read(_e, "t"), (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURN"))) else _S.binary("+", 1, _S.binary("*", 0.5, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURN")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "BURN")))]))))])
	_S.define(_e, "star", (_S.call_value(_S.read(_e, "blackStar"), [_S.read(_e, "Y"), _S.read(_e, "L"), _S.call_value(_S.read(_e, "starRot"), [_S.read(_e, "t")]), 0.5, 0.4]) if _S.truth(_S.binary(">", _S.read(_e, "L"), 0)) else null))
	if _S.truth(_S.read(_e, "star")):
		var _v73 = _S.scope(_e)
		_S.define(_v73, "age", _S.binary("-", _S.read(_v73, "t"), _S.read(_v73, "REL")))
		_S.define(_v73, "fr", (_S.binary("+", _S.binary("*", 36, _S.binary("-", 1, _S.binary("*", 0.3, _S.binary("/", _S.read(_v73, "age"), 0.12)))), 1.5) if _S.truth(_S.binary("<", _S.read(_v73, "age"), 0.12)) else 0))
		_S.define(_v73, "cut", _S.invoke(_S.read(_v73, "Math"), "max", [_S.read(_v73, "fr"), _S.read(_v73, "sr")]))
		_S.invoke(_S.read(_v73, "star"), "draw", [_S.read(_v73, "p"), _S.prop(_S.read(_v73, "C"), 0), (_S.prop(_S.read(_v73, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v73, "age"), 0.1)) else _S.prop(_S.read(_v73, "C"), 4)), _S.function_value(_v73, "_f23")])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "FLAME")])
	for _v74 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v75 = _S.scope(_e)
		_S.define(_v75, "b", _v74)
		_S.call_value(_S.read(_v75, "shard"), [_S.read(_v75, "p"), _S.read(_v75, "b"), _S.read(_v75, "C"), 0, _S.read(_v75, "Y"), _S.binary("*", _S.invoke(_S.read(_v75, "Math"), "min", [1, _S.read(_v75, "k")]), 0.9)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "embers"), "draw", [_S.read(_e, "p"), "front"])
	_S.define(_e, "pu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.2))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "pu"), 0), func(): return _S.binary("<", _S.read(_e, "pu"), 1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.read(_e, "Y"), _S.binary("*", 12, _S.binary("-", 1, _S.read(_e, "pu"))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.binary("-", 1, _S.read(_e, "pu")))])
	for _v76 in _S.array(_S.read(_e, "lights")):
		var _v77 = _S.scope(_e)
		_S.define(_v77, "l", _v76)
		var _v78 = _S.scope(_v77)
		_S.define(_v78, "q", _S.binary("/", _S.prop(_S.read(_v78, "l"), "life"), _S.prop(_S.read(_v78, "l"), "max")))
		_S.invoke(_S.read(_v78, "p"), "glow", [_S.prop(_S.read(_v78, "l"), "x"), _S.prop(_S.read(_v78, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v78, "l"), "r"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_v78, "q")))), _S.prop(_S.read(_v78, "l"), "c"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v78, "l"), "k"), _S.read(_v78, "q")), _S.read(_v78, "q"))])
	if _S.truth(_S.binary(">", _S.read(_e, "sr"), 1)):
		var _v79 = _S.scope(_e)
		_S.call_value(_S.read(_v79, "halo"), [_S.read(_v79, "p"), 0, _S.read(_v79, "Y"), _S.binary("-", _S.read(_v79, "sr"), 0.5), _S.binary("+", _S.read(_v79, "sr"), 16), _S.prop(_S.read(_v79, "C"), 6), _S.binary("*", _S.binary("*", 0.5, _S.read(_v79, "flick")), _S.invoke(_S.read(_v79, "Math"), "min", [1, _S.read(_v79, "k")]))])
		_S.invoke(_S.read(_v79, "p"), "glow", [0, _S.read(_v79, "Y"), _S.binary("+", _S.read(_v79, "sr"), 54), _S.prop(_S.read(_v79, "C"), 4), _S.binary("*", _S.binary("*", 0.5, _S.read(_v79, "flick")), _S.invoke(_S.read(_v79, "Math"), "min", [1, _S.read(_v79, "k")]))])
	_S.define(_e, "B0", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "sr"), _S.read(_e, "cr")]), 1))
	if _S.truth(_S.binary(">", _S.read(_e, "B0"), 2)):
		_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", _S.read(_e, "B0")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B0")), _S.read(_e, "B0"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "B0")), _S.function_value(_e, "_f24")])
	if _S.truth(_S.read(_e, "star")):
		_S.invoke(_S.read(_e, "star"), "unlight", [_S.read(_e, "p")])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_r = _S.read(_parent,"r")
	var _n_v_b0 = _S.arg(_args,0)
	return ((_n_WHITE if _S.truth((_n_v_b0 > 0.6)) else (_S.index_value(_n_C,6) if _S.truth((_n_v_b0 > 0.3)) else _S.index_value(_n_C,5))) if _S.truth(_S.named_value(_n_r,"hot")) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b0 > 0.5)) else _S.index_value(_n_C,4)))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_rr = _S.read(_parent,"rr")
	var _n_q = _S.read(_parent,"q")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_Y + (sin(_n_g_b1) * _n_rr)) > 0.5)) else minf(1,(_n_q * 1.6)))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_y_b1 < 0.5)
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_cut = _S.read(_parent,"cut")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((_n_x_b0 * _n_x_b0) + pow((_n_y_b1 - _n_Y),2)) < (_n_cut * _n_cut))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_sr = _S.read(_parent,"sr")
	var _n_cr = _S.read(_parent,"cr")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((_n_x_b0 * _n_x_b0) + pow((_n_y_b1 - _n_Y),2)) < pow((maxf(_n_sr,_n_cr) - 0.5),2))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_back_b3 = _S.arg(_args,3)
	if _S.truth((((_S.named_value(_n_r_b2,"delay") > 0) if _S.truth((_S.named_value(_n_r_b2,"delay") > 0)) else not _S.truth(_S.named_value(_n_r_b2,"hot"))) if _S.truth(((_S.named_value(_n_r_b2,"delay") > 0) if _S.truth((_S.named_value(_n_r_b2,"delay") > 0)) else not _S.truth(_S.named_value(_n_r_b2,"hot")))) else (_S.named_value(_n_r_b2,"th") < 3))):
		return null
	var _n_q_b4 = (float(_S.named_value(_n_r_b2,"life"))/_S.named_value(_n_r_b2,"max"))
	var _n_rr_b5 = (_S.named_value(_n_r_b2,"r0") + ((_S.named_value(_n_r_b2,"r1") - _S.named_value(_n_r_b2,"r0")) * (1 - ((_n_q_b4 * _n_q_b4) * _n_q_b4))))
	if _S.truth((_n_rr_b5 <= (-_n_Y))):
		return null
	var _n_rf_b6 = sqrt(((_n_rr_b5 * _n_rr_b5) - (_n_Y * _n_Y)))
	_S.call_value(_n_band,[_n_p_b0, 0, 0.5, _n_rf_b6, 0.16, maxf(1,(3 * _n_q_b4)), minf(1,(_n_q_b4 * 1.5)), [_S.index_value(_n_C_b1,3), _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,5), _S.index_value(_n_C_b1,6)], _S.function_value(_S.capture(_parent,{"back":_n_back_b3,"this":_this}),"_f26")])
	if _S.truth(not _S.truth(_n_back_b3)):
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b7 = _iter_0
			_S.invoke(_n_p_b0,"glow",[(_n_s_b7 * _n_rf_b6), (-2), 16, _S.index_value(_n_C_b1,5), (0.4 * _n_q_b4)])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_back)
	return null
