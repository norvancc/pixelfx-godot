@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/nuke.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "fireRamp", _S.import_value("fx/explosions/_lib.js", "fireRamp"))
	_S.define(_e, "drawPs", _S.import_value("fx/explosions/_lib.js", "drawPs"))
	_S.define(_e, "draft", _S.import_value("fx/explosions/_lib.js", "draft"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "haze", _S.import_value("fx/explosions/_lib.js", "haze"))
	_S.define(_e, "glowDome", _S.import_value("fx/explosions/_lib.js", "glowDome"))
	_S.define(_e, "Plume", _S.import_value("fx/explosions/_lib.js", "Plume"))
	_S.define(_e, "Column", _S.import_value("fx/explosions/_lib.js", "Column"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "wash", _S.function_value(_e, "_f16"))
	_S.define(_e, "skirtDraw", _S.function_value(_e, "_f18"))
	_S.define(_e, "meta", _S.merge([{"name": "Nuke"}, {"desc": "A blinding white frame, then a fireball lifts on a thin stem into a wide rolling cap that glows from inside; a white skirt flashes and a dust surge sweeps the floor."}, {"tags": ["explosion", "nuke", "mushroom", "cloud", "big", "ground", "one-shot"]}, {"size": [400, 320]}, {"origin": [200, 284]}, {"duration": 9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"dust": "#8a7466"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FLASH", 0.05)
	_S.define(_e, "LIFT", 0.07)
	_S.define(_e, "SKIRT", [0.55, 1.75])
	_S.define(_e, "CAP", _S.invoke(["#a0918c", "#7c6f6e", "#5f5458", "#40373f", "#271f27"], "map", [_S.read(_e, "hex")]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "FR", _S.call_value(_S.read(_e, "fireRamp"), [_S.read(_e, "F")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "dust", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "dust")]))
	_S.define(_e, "DUST", [_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.read(_e, "WHITE"), 0.22]), _S.read(_e, "dust"), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#3a3040"]), 0.35]), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#2a2330"]), 0.6]), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "dust"), _S.call_value(_S.read(_e, "hex"), ["#1c1720"]), 0.8])])
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
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "plume", _S.construct(_S.read(_e, "Plume"), [_S.read(_e, "R"), _S.merge([{"x": 0}, {"y": _S.unary("-", 26)}, {"rise": 152}, {"tau": 1.7}, {"drift": 3}, {"tube": [14, 26]}, {"ring": [4, 46]}, {"grow": 1.6}, {"n": 50}, {"size": [9.5, 14.5]}, {"swell": 0.45}, {"spin": 2.4}, {"spinTau": 2.4}, {"heat": 1.25}, {"cool": 0.42}, {"under": 0.6}, {"tilt": 0.16}, {"squash": 0.48}, {"fade": [6, 8.3]}, {"spread": 26}, {"style": 1}, {"inner": true}, {"hollow": true}, {"fray": [4, 1.6, 6.4]}])]))
	_S.set_prop(_S.read(_e, "plume"), "onFray", _S.function_value(_e, "_f2"), "=", false)
	_S.define(_e, "column", _S.construct(_S.read(_e, "Column"), [_S.read(_e, "R"), _S.merge([{"w": 3.5}, {"foot": 22}, {"speed": 125}, {"size": [5.5, 7]}, {"n": 84}, {"sway": 1.4}, {"style": 1}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f3"))
	_S.define(_e, "veil", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 72}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "skirt", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 110}]), _S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "boomed", false)
	_S.define(_e, "boom", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_CAP = _S.read(_parent,"CAP")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_ux_b3 = _S.arg(_args,3)
	var _n_uy_b4 = _S.arg(_args,4)
	return _S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), _n_x_b0, _n_y_b1, (_n_ux_b3 * _S.invoke(_n_R,"range",[10, 26])), ((_n_uy_b4 * _S.invoke(_n_R,"range",[4, 12])) - _S.invoke(_n_R,"range",[2, 8])), _S.invoke(_n_R,"range",[1, 1.7]), _S.index_value(_n_CAP,_S.invoke(_n_R,"int",[0, 1])), (_n_r_b2 * _S.invoke(_n_R,"range",[0.3, 0.45]))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_plume = _S.read(_parent,"plume")
	var _n_S_b0 = _S.invoke(_n_plume,"shape",[])
	return (_S.named_value(_n_S_b0,"y") + (_S.named_value(_n_S_b0,"tube") * 0.3))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":((-PI) * (float((_n_i_b1 + _S.invoke(_n_R,"range",[0.2, 0.8])))/72)),"s":_S.invoke(_n_R,"range",[6, 10]),"w":_S.invoke(_n_R,"range",[0.97, 1.06]),"e":_S.invoke(_n_R,"range",[0.6, 1.3]),"dx":_S.invoke(_n_R,"range",[(-1), 1]),"dy":_S.invoke(_n_R,"range",[(-1), 0.2])}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	return {"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"v":_S.invoke(_n_R,"range",[0, 1]),"s":_S.invoke(_n_R,"range",[5, 9]),"w":_S.invoke(_n_R,"range",[0.9, 1.06]),"e":_S.invoke(_n_R,"range",[0.6, 1.3]),"dx":_S.invoke(_n_R,"range",[(-1), 1]),"dy":_S.invoke(_n_R,"range",[(-1), 0.4])}
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_lights = _S.read(_parent,"lights")
	var _n_F = _S.read(_parent,"F")
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_PF = _S.read(_parent,"PF")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_dust = _S.read(_parent,"dust")
	var _n_DUST = _S.read(_parent,"DUST")
	_S.invoke(_n_lights,"add",[0, (-60), 150, _S.index_value(_n_F,4), 0.7, 1.6])
	if true:
		var _n_i_b0 = 0
		while _S.truth((_n_i_b0 < 26)):
			var _n_a_b1 = _S.invoke(_n_R,"range",[(-PI), 0])
			var _n_d_b2 = _S.invoke(_n_R,"range",[4, 22])
			var _n_sp_b3 = _S.invoke(_n_R,"range",[40, 160])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"FIRE"), (cos(_n_a_b1) * _n_d_b2), ((-26) + (sin(_n_a_b1) * _n_d_b2)), (cos(_n_a_b1) * _n_sp_b3), (((sin(_n_a_b1) * _n_sp_b3) * 0.7) - 30), _S.invoke(_n_R,"range",[0.6, 1.1]), 0, _S.invoke(_n_R,"range",[7, 12]), 0, (_S.binary("|",_S.named_value(_n_PF,"SMOKES"),_S.named_value(_n_PF,"BIG")) if _S.truth(_S.invoke(_n_R,"chance",[0.5])) else 0)])
			_n_i_b0 += 1.0
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 90)):
			var _n_a_b5 = _S.invoke(_n_R,"range",[((-PI) - 0.3), 0.3])
			var _n_sp_b6 = _S.invoke(_n_R,"range",[200, 420])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), (cos(_n_a_b5) * 18), ((-26) + (sin(_n_a_b5) * 18)), (cos(_n_a_b5) * _n_sp_b6), ((sin(_n_a_b5) * _n_sp_b6) - 60), _S.invoke(_n_R,"range",[0.3, 0.8])])
			_n_i_b4 += 1.0
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 50)):
			var _n_a_b8 = _S.invoke(_n_R,"range",[(-PI), 0])
			var _n_sp_b9 = _S.invoke(_n_R,"range",[30, 140])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"EMBER"), (cos(_n_a_b8) * 20), ((-26) + (sin(_n_a_b8) * 20)), (cos(_n_a_b8) * _n_sp_b9), ((sin(_n_a_b8) * _n_sp_b9) - 60), _S.invoke(_n_R,"range",[1.6, 3.4]), _S.index_value(_n_F,3)])
			_n_i_b7 += 1.0
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < 120)):
			var _n_slow_b11 = (_n_i_b10 >= 92)
			var _n_a_b12 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_c_b13 = cos(_n_a_b12)
			var _n_s_b14 = sin(_n_a_b12)
			var _n_sp_b15 = (_S.invoke(_n_R,"range",[110, 200]) if _S.truth(_n_slow_b11) else _S.invoke(_n_R,"range",[240, 440]))
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_n_c_b13 * 14), (((_n_s_b14 * 14) * 0.16) - _S.invoke(_n_R,"range",[1, 3])), (_n_c_b13 * _n_sp_b15), (((_n_s_b14 * _n_sp_b15) * (0.06 if _S.truth((_n_s_b14 > 0)) else 0.14)) - _S.invoke(_n_R,"range",[0, (6 if _S.truth(_n_slow_b11) else 3)])), _S.invoke(_n_R,"range",[1.8, 3]), _n_dust, (_S.invoke(_n_R,"range",[8, 11]) if _S.truth(_n_slow_b11) else _S.invoke(_n_R,"range",[5, 9])), _S.invoke(_n_R,"range",[0.05, 0.2])])
			_n_i_b10 += 1.0
	if true:
		var _n_i_b16 = 0
		while _S.truth((_n_i_b16 < 40)):
			var _n_u_b17 = _S.invoke(_n_R,"range",[(-1), 1])
			var _n_a_b18 = ((float((-PI))/2) + (_n_u_b17 * 0.7))
			var _n_sp_b19 = (_S.invoke(_n_R,"range",[150, 380]) * (1 - (0.4 * absf(_n_u_b17))))
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), (_n_u_b17 * 12), (-1), (cos(_n_a_b18) * _n_sp_b19), (sin(_n_a_b18) * _n_sp_b19), _S.invoke(_n_R,"range",[1.2, 2]), _S.invoke(_n_R,"pick",[_S.invoke(_n_DUST,"slice",[0, 3])]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.4])) else 1)])
			_n_i_b16 += 1.0
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "boomed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT")))):
		_S.last([_S.write(_e, "boomed", true, "=", false), _S.call_value(_S.read(_e, "boom"), [])])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT"))):
		_S.invoke(_S.read(_e, "plume"), "update", [_S.read(_e, "dt")])
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "plume"), "hot", []))
	_S.invoke(_S.read(_e, "column"), "update", [_S.read(_e, "dt"), _S.call_value(_S.read(_e, "top"), []), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.35), func(): return _S.binary("<", _S.read(_e, "t"), 4.9))) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.9), func(): return _S.binary("<", _S.read(_e, "t"), 4.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 9, _S.read(_e, "dt"))]))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "s", _S.invoke(_S.read(_v12, "R"), "sign", []))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "VAPOUR"), _S.binary("*", _S.read(_v12, "s"), _S.invoke(_S.read(_v12, "R"), "range", [50, 160])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [2, 6])), _S.binary("*", _S.unary("-", _S.read(_v12, "s")), _S.invoke(_S.read(_v12, "R"), "range", [20, 45])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [0, 6])), _S.invoke(_S.read(_v12, "R"), "range", [1.2, 1.8]), _S.prop(_S.read(_v12, "DUST"), 1), _S.invoke(_S.read(_v12, "R"), "range", [5, 8])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 3.4)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 14, _S.read(_e, "hot")), _S.read(_e, "dt"))]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v13, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.binary("+", _S.prop(_S.read(_v13, "S"), "ring"), _S.prop(_S.read(_v13, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_v13, "S"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.prop(_S.read(_v13, "S"), "tube")), 0.5)), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.invoke(_S.read(_v13, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [10, 50])), _S.invoke(_S.read(_v13, "R"), "range", [1.4, 2.6]), _S.prop(_S.read(_v13, "F"), 3)])
	_S.call_value(_S.read(_e, "draft"), [_S.read(_e, "ps"), _S.read(_e, "dt"), _S.merge([{"x": 0}, {"top": _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.3))}, {"w": 9}, {"up": 160}, {"pull": 120}, {"low": 14}, {"reach": 170}, {"k": _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [4.4, 5.4, _S.read(_e, "t")]))}])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 34, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_plume = _S.read(_parent,"plume")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_FR = _S.read(_parent,"FR")
	var _n_drawPs = _S.read(_parent,"drawPs")
	var _n_skirtDraw = _S.read(_parent,"skirtDraw")
	var _n_veil = _S.read(_parent,"veil")
	var _n_skirt = _S.read(_parent,"skirt")
	var _n_CAP = _S.read(_parent,"CAP")
	var _n_haze = _S.read(_parent,"haze")
	var _n_column = _S.read(_parent,"column")
	var _n_top = _S.read(_parent,"top")
	var _n_pool = _S.read(_parent,"pool")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_FLASH)):
		return null
	var _n_S_b1 = _S.invoke(_n_plume,"shape",[])
	var _n_k_b2 = (float((_n_t - _n_LIFT))/0.8)
	if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_k_b2 > 0)) else (_n_k_b2 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (196 * _S.invoke(_n_ease,"outCubic",[_n_k_b2])), 0.16, maxf(1,(5 * (1 - _n_k_b2))), (1.15 - _n_k_b2), [_S.index_value(_n_DUST,2), _S.index_value(_n_DUST,0), _S.index_value(_n_F,5), _S.index_value(_n_F,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	_S.call_value(_n_drawPs,[_n_p_b0, _n_ps, "back", _n_FR])
	_S.call_value(_n_skirtDraw,[_n_p_b0, _n_t, _n_S_b1, _n_veil, _n_skirt, true])
	_S.invoke(_n_plume,"draw",[_n_p_b0, _n_FR, _n_CAP])
	var _n_E_b3 = _S.invoke(_n_plume,"ember",[])
	var _n_gone_b4 = _S.MathFX.smooth(_S.index_value(_S.named_value(_S.named_value(_n_plume,"o"),"fade"),0),(_S.index_value(_S.named_value(_S.named_value(_n_plume,"o"),"fade"),1) - 0.6),(_n_t - _n_LIFT))
	if _S.truth((_n_gone_b4 < 1)):
		var _n_hy_b5 = (_S.named_value(_n_S_b1,"y") + (_S.named_value(_n_S_b1,"tube") * 0.42))
		var _n_rx_b6 = ((_S.named_value(_n_S_b1,"ring") * 0.7) + 5)
		var _n_ry_b7 = ((_S.named_value(_n_S_b1,"tube") * 0.28) + 2)
		_S.call_value(_n_haze,[_n_p_b0, 0, _n_hy_b5, _n_rx_b6, _n_ry_b7, _S.function_value(_S.capture(_parent,{"E":_n_E_b3,"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"gone":_n_gone_b4,"this":_this}),"_f11")])
	_S.invoke(_n_column,"draw",[_n_p_b0, _S.call_value(_n_top,[]), _n_FR, _n_DUST, clampf((1 - (float(_n_t)/1.8)),0.0,1.0), (_n_E_b3 * 0.8)])
	_S.call_value(_n_skirtDraw,[_n_p_b0, _n_t, _n_S_b1, _n_veil, _n_skirt, false])
	_S.call_value(_n_pool,[_n_p_b0, 0, 1, 140, 16, _S.index_value(_n_F,3), (0.3 * _S.invoke(_n_plume,"hot",[]))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_CAP = _S.read(_parent,"CAP")
	var _n_FR = _S.read(_parent,"FR")
	var _n_E = _S.read(_parent,"E")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.ColorFX.mix(_S.index_value(_n_CAP,4),_S.index_value(_n_FR,(5 if _S.truth((_n_d_b0 < (0.3 * _n_E))) else 6)),(0.75 * _n_E)) if _S.truth((_n_d_b0 < (0.55 * _n_E))) else _S.index_value(_n_CAP,4))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_gone = _S.read(_parent,"gone")
	var _n_d_b0 = _S.arg(_args,0)
	return ((0.8 if _S.truth((_n_d_b0 < 0.6)) else (0.5 if _S.truth((_n_d_b0 < 0.85)) else 0.22)) * (1 - _n_gone))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_wash = _S.read(_parent,"wash")
	var _n_OX = _S.read(_parent,"OX")
	var _n_OY = _S.read(_parent,"OY")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_FR = _S.read(_parent,"FR")
	var _n_drawPs = _S.read(_parent,"drawPs")
	var _n_glowDome = _S.read(_parent,"glowDome")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_FLASH)):
		_S.call_value(_n_wash,[_n_p_b0, _n_OX, _n_OY, _n_W, _n_H, 0, (-40), _n_WHITE, 1.6])
		return _S.invoke(_n_p_b0,"circle",[0, (-40), 64, _n_WHITE])
	var _n_k_b1 = (float((_n_t - _n_LIFT))/0.8)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (196 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(5 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.index_value(_n_DUST,2), _S.index_value(_n_DUST,0), _S.index_value(_n_F,5), _S.index_value(_n_F,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f13")])
	var _n_f_b2 = (float((_n_t - _n_FLASH))/0.13)
	if _S.truth((_n_f_b2 < 1)):
		var _n_r_b5 = (22 + (8 * _n_f_b2))
		_S.invoke(_n_p_b0,"circle",[0, (-26), (_n_r_b5 + 1.5), _S.index_value(_n_F,2)])
		_S.invoke(_n_p_b0,"circle",[0, (-26), _n_r_b5, (_S.index_value(_n_F,6) if _S.truth((_n_f_b2 < 0.5)) else _S.index_value(_n_F,5))])
		_S.invoke(_n_p_b0,"circle",[0, (-26), (_n_r_b5 * 0.62), (_n_WHITE if _S.truth((_n_f_b2 < 0.5)) else _S.index_value(_n_F,6))])
	_S.call_value(_n_drawPs,[_n_p_b0, _n_ps, "front", _n_FR])
	var _n_u_b3 = (float((_n_t - _n_FLASH))/0.7)
	if _S.truth((_n_u_b3 < 1)):
		var _n_r_b6 = (30 + (250 * _S.invoke(_n_ease,"outCubic",[_n_u_b3])))
		var _n_cy_b7 = (-26)
		var _n_out_b8 = _S.function_value(_S.capture(_parent,{"cy":_n_cy_b7,"r":_n_r_b6,"this":_this}),"_f14")
		_S.invoke(_n_p_b0,"ring",[0, _n_cy_b7, _n_r_b6, maxf(1,(2.5 * (1 - _n_u_b3))), (_n_WHITE if _S.truth((_n_u_b3 < 0.3)) else _S.index_value(_n_F,6)), _S.function_value(_S.capture(_parent,{"out":_n_out_b8,"u":_n_u_b3,"this":_this}),"_f15")])
		_S.call_value(_n_glowDome,[_n_p_b0, 0, _n_cy_b7, _n_r_b6, 7, _S.index_value(_n_F,5), (0.3 * (1 - _n_u_b3)), [(3 - _n_OX), (3 - _n_OY), ((_n_W - _n_OX) - 4), 0]])
	var _n_w_b4 = exp((float((-(_n_t - _n_FLASH)))/0.13))
	if _S.truth((_n_w_b4 > 0.02)):
		_S.call_value(_n_wash,[_n_p_b0, _n_OX, _n_OY, _n_W, _n_H, 0, (-40), _n_WHITE, (0.9 * _n_w_b4)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_cy = _S.read(_parent,"cy")
	var _n_r = _S.read(_parent,"r")
	var _n_OX = _S.read(_parent,"OX")
	var _n_OY = _S.read(_parent,"OY")
	var _n_a_b0 = _S.arg(_args,0)
	return _S.logical("||",_S.logical("||",((_n_cy + (sin(_n_a_b0) * _n_r)) > 0),func():return (absf((cos(_n_a_b0) * _n_r)) > (_n_OX - 3))),func():return ((_n_cy + (sin(_n_a_b0) * _n_r)) < (3 - _n_OY)))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_out = _S.read(_parent,"out")
	var _n_u = _S.read(_parent,"u")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (0 if _S.truth(_S.call_value(_n_out,[_n_a_b1])) else (1.1 - _n_u))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_OX_b1 = _S.arg(_args,1)
	var _n_OY_b2 = _S.arg(_args,2)
	var _n_W_b3 = _S.arg(_args,3)
	var _n_H_b4 = _S.arg(_args,4)
	var _n_cx_b5 = _S.arg(_args,5)
	var _n_cy_b6 = _S.arg(_args,6)
	var _n_c_b7 = _S.arg(_args,7)
	var _n_k_b8 = _S.arg(_args,8)
	var _n_rx_b9 = (minf((_n_OX_b1 + _n_cx_b5),((_n_W_b3 - _n_OX_b1) - _n_cx_b5)) - 4)
	var _n_up_b10 = ((_n_OY_b2 + _n_cy_b6) - 4)
	var _n_down_b11 = (((_n_H_b4 - _n_OY_b2) - _n_cy_b6) - 4)
	_S.invoke(_n_p_b0,"shade",[(-_n_OX_b1), (-_n_OY_b2), ((_n_W_b3 - _n_OX_b1) - 1), ((_n_H_b4 - _n_OY_b2) - 1), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b5,"rx":_n_rx_b9,"cy":_n_cy_b6,"up":_n_up_b10,"down":_n_down_b11,"c":_n_c_b7,"k":_n_k_b8,"this":_this}),"_f17")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_rx = _S.read(_parent,"rx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_up = _S.read(_parent,"up")
	var _n_down = _S.read(_parent,"down")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float((_n_x_b0 - _n_cx))/_n_rx), (float((_n_y_b1 - _n_cy))/(_n_up if _S.truth((_n_y_b1 < _n_cy)) else _n_down))])
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",(_n_k * (1 - _S.MathFX.smooth(0,1,_n_d_b3))),"=")
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_SKIRT = _S.read(_parent,"SKIRT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_veil_b3 = _S.arg(_args,3)
	var _n_skirt_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_u_b6 = (float((_n_t_b1 - _S.index_value(_n_SKIRT,0)))/(_S.index_value(_n_SKIRT,1) - _S.index_value(_n_SKIRT,0)))
	if _S.truth(((_n_u_b6 <= 0) if _S.truth((_n_u_b6 <= 0)) else (_n_u_b6 >= 1))):
		return null
	var _n_a_b7 = ((minf(1,(float(_n_u_b6)/0.06)) * pow((1 - _n_u_b6),1.5)) * 0.6)
	var _n_capR_b8 = ((_S.named_value(_n_S_b2,"ring") + _S.named_value(_n_S_b2,"tube")) * 1.1)
	var _n_y0_b9 = (_S.named_value(_n_S_b2,"y") + (_S.named_value(_n_S_b2,"tube") * 0.3))
	var _n_y1_b10 = (_S.named_value(_n_S_b2,"y") * 0.55)
	if _S.truth(not _S.truth(_n_back_b5)):
		for _iter_0 in _S.array(_n_veil_b3):
			var _n_q_b11 = _iter_0
			var _n_ev_b12 = ((_n_u_b6 * _n_u_b6) * _S.named_value(_n_q_b11,"e"))
			var _n_R_b13 = ((_n_capR_b8 * _S.named_value(_n_q_b11,"w")) * (1 + (_n_ev_b12 * 0.2)))
			_S.invoke(_n_p_b0,"disc",[((cos(_S.named_value(_n_q_b11,"a")) * _n_R_b13) + ((_S.named_value(_n_q_b11,"dx") * _n_ev_b12) * 10)), ((_S.named_value(_n_S_b2,"y") + ((sin(_S.named_value(_n_q_b11,"a")) * ((_S.named_value(_n_S_b2,"tube") * 1.15) + 6)) * _S.named_value(_n_q_b11,"w"))) + ((_S.named_value(_n_q_b11,"dy") * _n_ev_b12) * 8)), (_S.named_value(_n_q_b11,"s") * (1 - (0.5 * _n_u_b6))), _n_WHITE, (_n_a_b7 * 0.38)])
	for _iter_1 in _S.array(_n_skirt_b4):
		var _n_q_b14 = _iter_1
		var _n_z_b15 = sin(_S.named_value(_n_q_b14,"ph"))
		if _S.truth(_S.binary("!==",(_n_z_b15 < 0),_n_back_b5)):
			continue
		var _n_R_b16 = (_S.numeric_lerp((_n_capR_b8 * 0.82),13,pow(_S.named_value(_n_q_b14,"v"),0.6)) * _S.named_value(_n_q_b14,"w"))
		var _n_ev_b17 = ((_n_u_b6 * _n_u_b6) * _S.named_value(_n_q_b14,"e"))
		var _n_x_b18 = (((cos(_S.named_value(_n_q_b14,"ph")) * _n_R_b16) * (1 + (_n_ev_b17 * 0.25))) + ((_S.named_value(_n_q_b14,"dx") * _n_ev_b17) * 10))
		var _n_y_b19 = ((_S.numeric_lerp(_n_y0_b9,_n_y1_b10,_S.named_value(_n_q_b14,"v")) + ((_n_z_b15 * _n_R_b16) * 0.18)) + ((_S.named_value(_n_q_b14,"dy") * _n_ev_b17) * 8))
		_S.invoke(_n_p_b0,"disc",[_n_x_b18, _n_y_b19, (_S.named_value(_n_q_b14,"s") * (1 - (0.55 * _n_u_b6))), _n_WHITE, ((_n_a_b7 * (0.3 if _S.truth(_n_back_b5) else 0.55)) * (1 - (_S.named_value(_n_q_b14,"v") * 0.3)))])
	if _S.truth((_n_u_b6 < 0.7)):
		var _n_R_b20 = (13 * 1.25)
		var _n_k_b21 = (1 - (float(_n_u_b6)/0.7))
		if true:
			var _n_i_b22 = 0
			while _S.truth((_n_i_b22 < 64)):
				var _n_g_b23 = ((float(_n_i_b22)/64) * _n_TAU)
				var _n_z_b24 = sin(_n_g_b23)
				if _S.truth(_S.binary("!==",(_n_z_b24 < 0),_n_back_b5)):
					_n_i_b22 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[((cos(_n_g_b23) * _n_R_b20) * (1 + (_n_u_b6 * 0.6))), ((_n_y1_b10 + 2) + ((_n_z_b24 * _n_R_b20) * 0.22)), _n_WHITE, (_n_k_b21 * (0.6 if _S.truth(_n_back_b5) else 1))])
				_n_i_b22 += 1.0
	return null
