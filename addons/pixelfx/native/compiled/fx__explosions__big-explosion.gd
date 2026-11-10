@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/big-explosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/explosions/_lib.js", "stone"))
	_S.define(_e, "fireRamp", _S.import_value("fx/explosions/_lib.js", "fireRamp"))
	_S.define(_e, "heatRamp", _S.import_value("fx/explosions/_lib.js", "heatRamp"))
	_S.define(_e, "drawPs", _S.import_value("fx/explosions/_lib.js", "drawPs"))
	_S.define(_e, "draft", _S.import_value("fx/explosions/_lib.js", "draft"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "scorch", _S.import_value("fx/explosions/_lib.js", "scorch"))
	_S.define(_e, "rock", _S.import_value("fx/explosions/_lib.js", "rock"))
	_S.define(_e, "dome", _S.import_value("fx/explosions/_lib.js", "dome"))
	_S.define(_e, "glowDome", _S.import_value("fx/explosions/_lib.js", "glowDome"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "trail", _S.import_value("fx/explosions/_lib.js", "trail"))
	_S.define(_e, "Plume", _S.import_value("fx/explosions/_lib.js", "Plume"))
	_S.define(_e, "Column", _S.import_value("fx/explosions/_lib.js", "Column"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Big explosion"}, {"desc": "A huge ground blast in three beats: a white dome, a rolling fireball that climbs into a mushrooming smoke column, heavy rocks, and fires left burning."}, {"tags": ["explosion", "fire", "smoke", "debris", "mushroom", "big", "ground", "one-shot"]}, {"size": [360, 300]}, {"origin": [180, 262]}, {"duration": 7.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RAD", 30)
	_S.define(_e, "POWER", 1.45)
	_S.define(_e, "EARTH", 1.6)
	_S.define(_e, "SM", _S.invoke(["#83777f", "#6e6470", "#575060", "#3f3947", "#29242f"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "BLASTS", [_S.merge([{"t": 0}, {"x": 0}, {"y": _S.unary("-", 9)}, {"rad": _S.read(_e, "RAD")}, {"power": _S.read(_e, "POWER")}, {"main": true}]), _S.merge([{"t": 0.13}, {"x": _S.unary("-", 17)}, {"y": _S.unary("-", 30)}, {"rad": 17}, {"power": 0.9}]), _S.merge([{"t": 0.25}, {"x": 15}, {"y": _S.unary("-", 46)}, {"rad": 15}, {"power": 0.8}])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "FR", _S.call_value(_S.read(_e, "fireRamp"), [_S.read(_e, "F")]))
	_S.define(_e, "HR", _S.call_value(_S.read(_e, "heatRamp"), [_S.read(_e, "FR")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6), 0.45]))
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	_S.define(_e, "X0", _S.binary("+", _S.unary("-", _S.read(_e, "OX")), 3))
	_S.define(_e, "X1", _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 3))
	_S.define(_e, "Y0", _S.binary("+", _S.unary("-", _S.read(_e, "OY")), 3))
	_S.define(_e, "Y1", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 3))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}, {"onLand": _S.function_value(_e, "_f2")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flashes", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "plume", _S.construct(_S.read(_e, "Plume"), [_S.read(_e, "R"), _S.merge([{"x": 0}, {"y": _S.unary("-", 34)}, {"rise": 118}, {"tau": 1.25}, {"drift": 4}, {"tube": [9, 21]}, {"ring": [2, 19]}, {"grow": 1}, {"n": 42}, {"size": [6, 11]}, {"swell": 0.9}, {"spin": 2.6}, {"spinTau": 1.7}, {"heat": 1.2}, {"cool": 0.42}, {"under": 0.5}, {"tilt": 0.22}, {"squash": 0.72}, {"fade": [4.4, 6.4]}, {"spread": 22}])]))
	_S.define(_e, "column", _S.construct(_S.read(_e, "Column"), [_S.read(_e, "R"), _S.merge([{"w": 5}, {"foot": 18}, {"speed": 85}, {"size": [7, 11]}, {"n": 28}, {"sway": 2.5}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "next", 0)
	_S.define(_e, "blast", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_n_blazes,"add",[_n_x_b0, (_n_y_b1 - 0.25), _S.invoke(_n_R,"range",[3, 4.4]), _S.invoke(_n_R,"range",[0.7, 1.25])])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_plume = _S.read(_parent,"plume")
	var _n_S_b0 = _S.invoke(_n_plume,"shape",[])
	return (_S.named_value(_n_S_b0,"y") + (_S.named_value(_n_S_b0,"tube") * 0.45))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_flashes = _S.read(_parent,"flashes")
	var _n_rings = _S.read(_parent,"rings")
	var _n_F = _S.read(_parent,"F")
	var _n_lights = _S.read(_parent,"lights")
	var _n_WARM = _S.read(_parent,"WARM")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_PF = _S.read(_parent,"PF")
	var _n_hex = _S.read(_parent,"hex")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_st = _S.read(_parent,"st")
	var _n_EARTH = _S.read(_parent,"EARTH")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_B = _S.read(_parent,"B")
	var _object_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.named_value(_object_0,"x")
	var _n_y_b1 = _S.named_value(_object_0,"y")
	var _n_rad_b2 = _S.named_value(_object_0,"rad")
	var _n_power_b3 = _S.named_value(_object_0,"power")
	var _n_main_b4 = _S.named_value(_object_0,"main")
	if _S.truth(not _S.truth(_n_main_b4)):
		_S.invoke(_n_flashes,"push",[{"x":_n_x_b0,"y":_n_y_b1,"r":(_n_rad_b2 * 1.05),"life":0.06,"max":0.06}])
	if _S.truth(not _S.truth(_n_main_b4)):
		_S.invoke(_n_rings,"push",[{"x":_n_x_b0,"y":_n_y_b1,"r0":(_n_rad_b2 * 0.45),"r1":(_n_rad_b2 * 2.7),"life":0.36,"max":0.36,"thick":3,"c":_S.index_value(_n_F,5)}, {"x":_n_x_b0,"y":_n_y_b1,"r0":(_n_rad_b2 * 0.3),"r1":(_n_rad_b2 * 1.6),"life":0.24,"max":0.24,"thick":1.8,"c":_S.index_value(_n_F,3)}])
	_S.invoke(_n_lights,"add",[_n_x_b0, ((_n_y_b1 - 24) if _S.truth(_n_main_b4) else _n_y_b1), (72 if _S.truth(_n_main_b4) else (_n_rad_b2 * 3.4)), _n_WARM, (0.6 * _n_power_b3), 0.8])
	_S.invoke(_n_lights,"add",[_n_x_b0, ((_n_y_b1 - 12) if _S.truth(_n_main_b4) else _n_y_b1), (44 if _S.truth(_n_main_b4) else (_n_rad_b2 * 1.6)), _n_WHITE, 0.6, 0.1])
	var _n_down_b5 = (0.25 if _S.truth(_n_main_b4) else PI)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 5)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"FIRE"), (_n_x_b0 + _S.invoke(_n_R,"range",[(-2.5), 2.5])), (_n_y_b1 + _S.invoke(_n_R,"range",[(-2.5), 2.5])), _S.invoke(_n_R,"range",[(-20), 20]), _S.invoke(_n_R,"range",[(-40), (-10)]), _S.invoke(_n_R,"range",[0.18, 0.3]), 0, _S.invoke(_n_R,"range",[(_n_rad_b2 * 0.4), (_n_rad_b2 * 0.55)])])
			_n_i_b6 += 1.0
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < floori((26 * _n_power_b3)+0.5))):
			var _n_a_b8 = (_S.invoke(_n_R,"range",[((-PI) - _n_down_b5), _n_down_b5]) if _S.truth(_n_main_b4) else _S.invoke(_n_R,"range",[0, _n_TAU]))
			var _n_d_b9 = _S.invoke(_n_R,"range",[0, (_n_rad_b2 * 0.55)])
			var _n_sp_b10 = (_S.invoke(_n_R,"range",[40, 200]) * _n_power_b3)
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"FIRE"), (_n_x_b0 + (cos(_n_a_b8) * _n_d_b9)), (_n_y_b1 + (sin(_n_a_b8) * _n_d_b9)), (cos(_n_a_b8) * _n_sp_b10), (((sin(_n_a_b8) * _n_sp_b10) * 0.8) - 40), _S.invoke(_n_R,"range",[0.55, 1.15]), 0, _S.invoke(_n_R,"range",[(_n_rad_b2 * 0.22), (_n_rad_b2 * 0.46)]), 0, (_S.binary("|",_S.named_value(_n_PF,"SMOKES"),_S.named_value(_n_PF,"BIG")) if _S.truth(_S.invoke(_n_R,"chance",[0.45])) else 0)])
			_n_i_b7 += 1.0
	if true:
		var _n_i_b11 = 0
		while _S.truth((_n_i_b11 < 5)):
			var _n_a_b12 = _S.invoke(_n_R,"range",[(-PI), 0])
			var _n_d_b13 = _S.invoke(_n_R,"range",[(_n_rad_b2 * 0.1), (_n_rad_b2 * 0.5)])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_n_x_b0 + (cos(_n_a_b12) * _n_d_b13)), (_n_y_b1 + (sin(_n_a_b12) * _n_d_b13)), (cos(_n_a_b12) * 30), ((sin(_n_a_b12) * 20) - 30), _S.invoke(_n_R,"range",[0.9, 1.5]), _S.call_value(_n_hex,["#221d26"]), _S.invoke(_n_R,"range",[(_n_rad_b2 * 0.15), (_n_rad_b2 * 0.26)]), _S.invoke(_n_R,"range",[0.06, 0.2]), _S.named_value(_n_PF,"BIG")])
			_n_i_b11 += 1.0
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < floori((8 * _n_power_b3)+0.5))):
			var _n_a_b15 = _S.invoke(_n_R,"range",[(-PI), 0])
			var _n_d_b16 = _S.invoke(_n_R,"range",[0, (_n_rad_b2 * 0.7)])
			var _n_sp_b17 = _S.invoke(_n_R,"range",[15, 90])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_n_x_b0 + (cos(_n_a_b15) * _n_d_b16)), (_n_y_b1 + (sin(_n_a_b15) * _n_d_b16)), (cos(_n_a_b15) * _n_sp_b17), (((sin(_n_a_b15) * _n_sp_b17) * 0.6) - 35), _S.invoke(_n_R,"range",[1.8, 2.8]), 0, _S.invoke(_n_R,"range",[(_n_rad_b2 * 0.26), (_n_rad_b2 * 0.4)]), _S.invoke(_n_R,"range",[0.12, 0.45]), _S.named_value(_n_PF,"BIG")])
			_n_i_b14 += 1.0
	if true:
		var _n_i_b18 = 0
		while _S.truth((_n_i_b18 < floori((80 * _n_power_b3)+0.5))):
			var _n_a_b19 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_sp_b20 = _S.invoke(_n_R,"range",[170, (470 if _S.truth(_n_main_b4) else 380)])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _n_x_b0, _n_y_b1, (cos(_n_a_b19) * _n_sp_b20), ((sin(_n_a_b19) * _n_sp_b20) - 70), _S.invoke(_n_R,"range",[0.2, 0.65])])
			_n_i_b18 += 1.0
	if true:
		var _n_i_b21 = 0
		while _S.truth((_n_i_b21 < floori((30 * _n_power_b3)+0.5))):
			var _n_a_b22 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_sp_b23 = _S.invoke(_n_R,"range",[30, 150])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"EMBER"), (_n_x_b0 + ((cos(_n_a_b22) * _n_rad_b2) * 0.4)), (_n_y_b1 + ((sin(_n_a_b22) * _n_rad_b2) * 0.4)), (cos(_n_a_b22) * _n_sp_b23), ((sin(_n_a_b22) * _n_sp_b23) - 75), _S.invoke(_n_R,"range",[1.4, 3]), _S.index_value(_n_F,3)])
			_n_i_b21 += 1.0
	if _S.truth(not _S.truth(_n_main_b4)):
		return null
	if true:
		var _n_i_b24 = 0
		while _S.truth((_n_i_b24 < 14)):
			var _n_a_b25 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.3), 1.3]))
			var _n_sp_b26 = _S.invoke(_n_R,"range",[160, 340])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"BRAND"), _n_x_b0, _n_y_b1, (cos(_n_a_b25) * _n_sp_b26), (sin(_n_a_b25) * _n_sp_b26), _S.invoke(_n_R,"range",[0.8, 1.5])])
			_n_i_b24 += 1.0
	if true:
		var _n_i_b27 = 0
		while _S.truth((_n_i_b27 < 18)):
			var _n_s_b28 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_n_s_b28 * _S.invoke(_n_R,"range",[0, (_n_RAD * 0.6)])), (-_S.invoke(_n_R,"range",[1, 6])), ((_n_s_b28 * _S.invoke(_n_R,"range",[3, 9])) * _n_RAD), (-_S.invoke(_n_R,"range",[2, 15])), _S.invoke(_n_R,"range",[1.3, 2.2]), _S.named_value(_n_st,"dust"), _S.invoke(_n_R,"range",[8, 12]), _S.invoke(_n_R,"range",[0, 0.06]), _S.named_value(_n_PF,"BIG")])
			_n_i_b27 += 1.0
	if true:
		var _n_i_b29 = 0
		while _S.truth((_n_i_b29 < floori((_n_EARTH * 12)+0.5))):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_S.invoke(_n_R,"range",[(-0.3), 0.3]) * _n_RAD), (-_S.invoke(_n_R,"range",[2, (_n_RAD * 0.6)])), _S.invoke(_n_R,"range",[(-15), 15]), (((-_S.invoke(_n_R,"range",[60, 190])) * _n_EARTH) * 0.6), _S.invoke(_n_R,"range",[1.6, 2.6]), _S.named_value(_n_st,"dust"), _S.invoke(_n_R,"range",[8, 12]), _S.invoke(_n_R,"range",[0, 0.15]), _S.named_value(_n_PF,"BIG")])
			_n_i_b29 += 1.0
	if true:
		var _n_i_b30 = 0
		while _S.truth((_n_i_b30 < floori(((_n_EARTH * _n_RAD) * 4)+0.5))):
			var _n_u_b31 = _S.invoke(_n_R,"range",[(-1), 1])
			var _n_a_b32 = ((float((-PI))/2) + (_n_u_b31 * 0.55))
			var _n_sp_b33 = ((_S.invoke(_n_R,"range",[5, 15]) * _n_RAD) * (1 - (0.45 * absf(_n_u_b31))))
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), ((_n_u_b31 * 0.25) * _n_RAD), (-1), (cos(_n_a_b32) * _n_sp_b33), (sin(_n_a_b32) * _n_sp_b33), _S.invoke(_n_R,"range",[1.4, 2.4]), _S.invoke(_n_R,"pick",[[_S.named_value(_n_st,"light"), _S.named_value(_n_st,"body"), _S.named_value(_n_st,"body"), _S.named_value(_n_st,"shade")]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.45])) else 1)])
			_n_i_b30 += 1.0
	if true:
		var _n_i_b34 = 0
		while _S.truth((_n_i_b34 < 26)):
			var _n_big_b35 = (_n_i_b34 < 10)
			var _n_hot_b36 = _S.invoke(_n_R,"chance",[0.45])
			var _n_sx_b37 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_rocks,"add",[{"kind":_S.named_value(_n_B,"CHUNK"),"x":(_S.invoke(_n_R,"range",[(-0.4), 0.4]) * _n_RAD),"y":(-4),"vx":(_n_sx_b37 * _S.invoke(_n_R,"range",[30, (120 if _S.truth(_n_big_b35) else 150)])),"vy":(-_S.invoke(_n_R,"range",[(280 if _S.truth(_n_big_b35) else 320), (480 if _S.truth(_n_big_b35) else 560)])),"g":1,"drag":0.3,"bounce":0.3,"life":_S.invoke(_n_R,"range",[3.6, 5]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-14), 14]),"s":(_S.invoke(_n_R,"range",[2.6, 3.8]) if _S.truth(_n_big_b35) else _S.invoke(_n_R,"range",[1.2, 2.4])),"heat":(_S.invoke(_n_R,"range",[0.6, 1]) if _S.truth(_n_hot_b36) else 0)}])
			_n_i_b34 += 1.0
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "next"), _S.prop(_S.read(_e, "BLASTS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "BLASTS"), _S.read(_e, "next")), "t")))):
		_S.call_value(_S.read(_e, "blast"), [_S.prop(_S.read(_e, "BLASTS"), _S.write(_e, "next", 1, "+=", true))])
	if _S.truth(_S.binary(">", _S.read(_e, "t"), 0.08)):
		_S.invoke(_S.read(_e, "plume"), "update", [_S.read(_e, "dt")])
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [2.2, 3.1, _S.read(_e, "t")])))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), 3.1))):
		var _v23 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", _S.binary("*", 8, _S.read(_v23, "k")), _S.read(_v23, "dt"))])):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [1, 6])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [40, 80])), _S.invoke(_S.read(_v23, "R"), "range", [1.5, 2.3]), _S.prop(_S.read(_v23, "st"), "dust"), _S.invoke(_S.read(_v23, "R"), "range", [5, 8]), 0, _S.prop(_S.read(_v23, "PF"), "BIG")])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v23, "t"), 1.5), func(): return _S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", 16, _S.read(_v23, "dt"))]))):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "FIRE"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 14])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [90, 150])), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.8]), 0, _S.invoke(_S.read(_v23, "R"), "range", [4, 7.5]), 0, (_S.binary("|", _S.prop(_S.read(_v23, "PF"), "SMOKES"), _S.prop(_S.read(_v23, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else 0)])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v23, "t"), 0.45), func(): return _S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", _S.binary("*", 12, _S.read(_v23, "k")), _S.read(_v23, "dt"))]))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "s", _S.invoke(_S.read(_v24, "R"), "sign", []))
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "SMOKE"), _S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [40, 120])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 4])), _S.binary("*", _S.unary("-", _S.read(_v24, "s")), _S.invoke(_S.read(_v24, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [0, 5])), _S.invoke(_S.read(_v24, "R"), "range", [1.3, 1.9]), _S.prop(_S.read(_v24, "st"), "dust"), _S.invoke(_S.read(_v24, "R"), "range", [3.5, 5.5]), 0, _S.prop(_S.read(_v24, "PF"), "BIG")])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 3)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 10, _S.invoke(_S.read(_e, "plume"), "hot", [])), _S.read(_e, "dt"))]))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
		_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v25, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.binary("+", _S.prop(_S.read(_v25, "S"), "ring"), _S.prop(_S.read(_v25, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_v25, "S"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.prop(_S.read(_v25, "S"), "tube")), 0.5)), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.invoke(_S.read(_v25, "R"), "range", [40, 90])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [10, 60])), _S.invoke(_S.read(_v25, "R"), "range", [1.2, 2.4]), _S.prop(_S.read(_v25, "F"), 3)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 1.4), func(): return _S.binary("<", _S.read(_e, "t"), 4.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 7, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), _S.binary("+", _S.prop(_S.read(_e, "S"), "ring"), _S.prop(_S.read(_e, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.6)), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_e, "R"), "range", [0, 10]), _S.invoke(_S.read(_e, "R"), "range", [2, 3]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "SM"), 1), _S.prop(_S.read(_e, "SM"), 2), _S.prop(_S.read(_e, "F"), 2)]]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.2])])
	_S.invoke(_S.read(_e, "column"), "update", [_S.read(_e, "dt"), _S.call_value(_S.read(_e, "top"), []), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.22), func(): return _S.binary("<", _S.read(_e, "t"), 2.5))) else 0)])
	_S.call_value(_S.read(_e, "draft"), [_S.read(_e, "ps"), _S.read(_e, "dt"), _S.merge([{"x": 0}, {"top": _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.4))}, {"w": _S.binary("+", 9, _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "t")])))}, {"up": 170}, {"pull": 130}, {"low": 12}, {"reach": 130}, {"k": _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [2.5, 3.8, _S.read(_e, "t")]))}])])
	for _v26 in _S.array([_S.read(_e, "flashes"), _S.read(_e, "rings")]):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "a", _v26)
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "i", _S.binary("-", _S.prop(_S.read(_v28, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v28, "i"), 0)):
			if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v28, "a"), _S.read(_v28, "i")), "life", _S.read(_v28, "dt"), "-=", false), 0)):
				_S.invoke(_S.read(_v28, "a"), "splice", [_S.read(_v28, "i"), 1])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "-=", true)
	for _v29 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "b", _v29)
		_S.set_prop(_S.read(_v30, "b"), "pvy", _S.prop(_S.read(_v30, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v31, "rocks"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v31, "i"), 0)):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "b", _S.prop(_S.prop(_S.read(_v32, "rocks"), "list"), _S.read(_v32, "i")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v32, "b"), "x"), _S.binary("+", _S.read(_v32, "X0"), 4)), func(): return _S.binary(">", _S.prop(_S.read(_v32, "b"), "x"), _S.binary("-", _S.read(_v32, "X1"), 4)))):
			var _v33 = _S.scope(_v32)
			_S.invoke(_S.prop(_S.read(_v33, "rocks"), "list"), "splice", [_S.read(_v33, "i"), 1])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v32, "b"), "heat"), 0)):
			var _v34 = _S.scope(_v32)
			_S.set_prop(_S.read(_v34, "b"), "heat", _S.invoke(_S.read(_v34, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v34, "b"), "heat"), _S.binary("*", _S.read(_v34, "dt"), 0.3))]), "=", false)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v34, "b"), "rest")), func(): return _S.binary(">", _S.prop(_S.read(_v34, "b"), "heat"), 0.25))):
				var _v35 = _S.scope(_v34)
				_S.invoke(_S.set_prop(_S.read(_v35, "b"), "pts", [], "??=", false), "push", [_S.merge([{"x": _S.prop(_S.read(_v35, "b"), "x")}, {"y": _S.prop(_S.read(_v35, "b"), "y")}, {"t": _S.read(_v35, "t")}])])
				if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", 14, _S.read(_v35, "dt"))])):
					_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "FIRE"), _S.prop(_S.read(_v35, "b"), "x"), _S.prop(_S.read(_v35, "b"), "y"), _S.binary("*", _S.prop(_S.read(_v35, "b"), "vx"), 0.1), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v35, "b"), "vy"), 0.1), 8), _S.invoke(_S.read(_v35, "R"), "range", [0.16, 0.3]), 0, _S.invoke(_S.read(_v35, "R"), "range", [1.2, 2.2])])
			else:
				if _S.truth(_S.logical("&&", _S.prop(_S.read(_v34, "b"), "rest"), func(): return _S.invoke(_S.read(_v34, "R"), "chance", [_S.binary("*", _S.binary("*", 3, _S.prop(_S.read(_v34, "b"), "heat")), _S.read(_v34, "dt"))]))):
					_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "SMOKE"), _S.prop(_S.read(_v34, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v34, "b"), "y"), 1), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [5, 12])), _S.invoke(_S.read(_v34, "R"), "range", [0.8, 1.4]), 0, _S.invoke(_S.read(_v34, "R"), "range", [1.6, 2.6])])
		_S.define(_v32, "landed", _S.logical("||", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v32, "b"), "pvy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v32, "b"), "vy"), 0)), func(): return _S.logical("&&", _S.prop(_S.read(_v32, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v32, "b"), "dusted")))))
		if _S.truth(_S.logical("&&", _S.read(_v32, "landed"), func(): return _S.binary(">", _S.prop(_S.read(_v32, "b"), "pvy"), 60))):
			var _v36 = _S.scope(_v32)
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v37, "j"), _S.binary("+", 2, _S.invoke(_S.read(_v37, "Math"), "round", [_S.prop(_S.read(_v37, "b"), "s")])))):
				_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v37, "b"), "x"), _S.invoke(_S.read(_v37, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v37, "R"), "sign", []), _S.invoke(_S.read(_v37, "R"), "range", [10, 50])), _S.unary("-", _S.invoke(_S.read(_v37, "R"), "range", [2, 20])), _S.invoke(_S.read(_v37, "R"), "range", [0.3, 0.7]), _S.prop(_S.read(_v37, "st"), "dust"), _S.invoke(_S.read(_v37, "R"), "range", [1.3, _S.binary("+", 1, _S.prop(_S.read(_v37, "b"), "s"))])])
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "j", 1, "+=", true)
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v36, "b"), "heat"), 0.5), func(): return _S.unary("!", _S.prop(_S.read(_v36, "b"), "dusted")))):
				_S.invoke(_S.read(_v36, "blazes"), "add", [_S.prop(_S.read(_v36, "b"), "x"), _S.unary("-", 0.25), _S.invoke(_S.read(_v36, "R"), "range", [1.2, 2.2]), 0.45])
		if _S.truth(_S.prop(_S.read(_v32, "b"), "rest")):
			_S.set_prop(_S.read(_v32, "b"), "dusted", true, "=", false)
		if _S.truth(_S.prop(_S.read(_v32, "b"), "pts")):
			while _S.truth(_S.logical("&&", _S.prop(_S.prop(_S.read(_v32, "b"), "pts"), "length"), func(): return _S.binary(">", _S.binary("-", _S.read(_v32, "t"), _S.prop(_S.prop(_S.prop(_S.read(_v32, "b"), "pts"), 0), "t")), 0.45))):
				_S.invoke(_S.prop(_S.read(_v32, "b"), "pts"), "shift", [])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_HR = _S.read(_parent,"HR")
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_FR = _S.read(_parent,"FR")
	var _n_drawPs = _S.read(_parent,"drawPs")
	var _n_column = _S.read(_parent,"column")
	var _n_top = _S.read(_parent,"top")
	var _n_SM = _S.read(_parent,"SM")
	var _n_plume = _S.read(_parent,"plume")
	var _n_blazes = _S.read(_parent,"blazes")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_scorch,[_n_p_b0, _n_HR, _n_t, 52, 3.4, (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1.6),(_S.named_value(_n_meta,"duration") - 0.3),_n_t)), 3])
	var _n_k_b1 = (float(_n_t)/0.6)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (132 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(6 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_F,3), _S.index_value(_n_F,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	_S.call_value(_n_drawPs,[_n_p_b0, _n_ps, "back", _n_FR])
	_S.invoke(_n_column,"draw",[_n_p_b0, _S.call_value(_n_top,[]), _n_FR, _n_SM, (1 - (float(_n_t)/1.4)), _S.invoke(_n_plume,"hot",[])])
	_S.invoke(_n_plume,"draw",[_n_p_b0, _n_FR, _n_SM])
	_S.invoke(_n_blazes,"drawBack",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_st = _S.read(_parent,"st")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_dome = _S.read(_parent,"dome")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_FR = _S.read(_parent,"FR")
	var _n_SM = _S.read(_parent,"SM")
	var _n_trail = _S.read(_parent,"trail")
	var _n_rock = _S.read(_parent,"rock")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_ps = _S.read(_parent,"ps")
	var _n_drawPs = _S.read(_parent,"drawPs")
	var _n_flare = _S.read(_parent,"flare")
	var _n_glowDome = _S.read(_parent,"glowDome")
	var _n_flashes = _S.read(_parent,"flashes")
	var _n_rings = _S.read(_parent,"rings")
	var _n_plume = _S.read(_parent,"plume")
	var _n_pool = _S.read(_parent,"pool")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float(_n_t)/0.6)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (132 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(6 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.named_value(_n_st,"body"), _S.named_value(_n_st,"light"), _S.index_value(_n_F,3), _S.index_value(_n_F,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	if _S.truth((_n_t < 0.04)):
		_S.call_value(_n_dome,[_n_p_b0, _n_F, 0, 44, 1])
		_S.invoke(_n_p_b0,"glow",[0, (-30), 68, _n_WHITE, 0.6])
	else:
		if _S.truth((_n_t < 0.11)):
			_S.call_value(_n_dome,[_n_p_b0, _n_F, 0, (38 - ((_n_t - 0.04) * 120)), (1 - (float((_n_t - 0.04))/0.07))])
	for _iter_0 in _S.array(_S.named_value(_n_rocks,"list")):
		var _n_b_b4 = _iter_0
		if _S.truth(_S.named_value(_n_b_b4,"pts")):
			_S.call_value(_n_trail,[_n_p_b0, _S.named_value(_n_b_b4,"pts"), _n_t, _n_FR, _n_SM, 0.45, (0.6 + (_S.named_value(_n_b_b4,"s") * 0.3)), _S.named_value(_n_b_b4,"heat")])
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b4, _n_st, _n_FR])
	_S.call_value(_n_drawPs,[_n_p_b0, _n_ps, "front", _n_FR])
	if _S.truth((_n_t < 0.24)):
		_S.call_value(_n_flare,[_n_p_b0, 0, (-14), (70 * pow((1 - (float(_n_t)/0.24)),1.4)), (1 - (float(_n_t)/0.24)), _n_F])
	if _S.truth((_n_t < 0.5)):
		var _n_u_b5 = (float(_n_t)/0.5)
		var _n_r_b6 = (34 + (80 * _S.invoke(_n_ease,"outCubic",[_n_u_b5])))
		_S.invoke(_n_p_b0,"ring",[0, 0, _n_r_b6, maxf(1,((3 * (1 - _n_u_b5)) + 0.5)), (_S.index_value(_n_F,6) if _S.truth((_n_u_b5 < 0.3)) else (_S.index_value(_n_F,5) if _S.truth((_n_u_b5 < 0.6)) else _S.index_value(_n_F,3))), _S.function_value(_S.capture(_parent,{"u":_n_u_b5,"this":_this}),"_f10")])
		_S.call_value(_n_glowDome,[_n_p_b0, 0, 0, _n_r_b6, 6, _S.index_value(_n_F,4), (0.35 * (1 - _n_u_b5))])
	for _iter_1 in _S.array(_n_flashes):
		var _n_f_b7 = _iter_1
		var _n_k2_b8 = (float(_S.named_value(_n_f_b7,"life"))/_S.named_value(_n_f_b7,"max"))
		var _n_r_b9 = (_S.named_value(_n_f_b7,"r") * (0.8 + (0.2 * _n_k2_b8)))
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_f_b7,"x"), _S.named_value(_n_f_b7,"y"), (_n_r_b9 + 1.2), _S.index_value(_n_F,2)])
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_f_b7,"x"), _S.named_value(_n_f_b7,"y"), _n_r_b9, (_S.index_value(_n_F,6) if _S.truth((_n_k2_b8 > 0.45)) else _S.index_value(_n_F,5))])
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_f_b7,"x"), _S.named_value(_n_f_b7,"y"), (_n_r_b9 * 0.6), (_n_WHITE if _S.truth((_n_k2_b8 > 0.45)) else _S.index_value(_n_F,6))])
	for _iter_2 in _S.array(_n_rings):
		var _n_r_b10 = _iter_2
		var _n_k2_b11 = (float(_S.named_value(_n_r_b10,"life"))/_S.named_value(_n_r_b10,"max"))
		var _n_e_b12 = (1 - pow(_n_k2_b11,3))
		_S.invoke(_n_p_b0,"ring",[_S.named_value(_n_r_b10,"x"), _S.named_value(_n_r_b10,"y"), (_S.named_value(_n_r_b10,"r0") + ((_S.named_value(_n_r_b10,"r1") - _S.named_value(_n_r_b10,"r0")) * _n_e_b12)), maxf(1,((_S.named_value(_n_r_b10,"thick") * _n_k2_b11) + 0.4)), _S.named_value(_n_r_b10,"c"), minf(1,(_n_k2_b11 * 1.6))])
	var _n_hot_b2 = _S.invoke(_n_plume,"hot",[])
	var _n_flash_b3 = maxf(0,(1 - (float(_n_t)/0.9)))
	_S.call_value(_n_pool,[_n_p_b0, 0, 1, 150, 22, _S.index_value(_n_F,3), ((0.24 * _n_hot_b2) + ((0.5 * _n_flash_b3) * _n_flash_b3))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_u = _S.read(_parent,"u")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (0 if _S.truth((sin(_n_a_b1) > 0)) else minf(1,((1 - _n_u) * 1.6)))
	return null
