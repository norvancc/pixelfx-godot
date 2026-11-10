@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/homing-missile.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "turnSprite", _S.import_value("fx/projectiles/_lib.js", "turnSprite"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Homing missile"}, {"desc": "A missile kicks off, arcs up, rolls over and dives onto its target (the origin), its smoke trail left hanging in the air, and hits in a fiery blast of flame, sparks and rocks."}, {"tags": ["projectile", "missile", "rocket", "homing", "smoke", "explosion", "one-shot"]}, {"size": [248, 140]}, {"origin": [160, 120]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"metal": ["#25243a", "#3e4058", "#61667f", "#8e97b0", "#c4cce0"]}, {"smoke": ["#26222e", "#3b3644", "#544e5e", "#6f6979", "#8c8596", "#aca5b5", "#cbc4d2"]}, {"stone": "#4a3f69"}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FLY", 1.15)
	_S.define(_e, "PATH", [[_S.unary("-", 130), _S.unary("-", 22)], [_S.unary("-", 114), _S.unary("-", 110)], [_S.unary("-", 30), _S.unary("-", 120)], [0, 0]])
	_S.define(_e, "at", _S.function_value(_e, "_f10"))
	_S.define(_e, "heading", _S.function_value(_e, "_f11"))
	_S.define(_e, "progress", _S.function_value(_e, "_f13"))
	_S.define(_e, "MISSILE", ["ff..........", ".fhhhhhhhre.", "nmmmmmmmmrrw", ".fsssssssrd.", "ff.........."])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 5]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "stone", _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "st")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "st"), 1.2]), _S.call_value(_S.read(_e, "hex"), ["#968c96"]), 0.3])}]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pal", _S.merge([{"f": _S.prop(_S.read(_e, "M"), 1)}, {"h": _S.prop(_S.read(_e, "M"), 4)}, {"m": _S.prop(_S.read(_e, "M"), 3)}, {"s": _S.prop(_S.read(_e, "M"), 1)}, {"n": _S.prop(_S.read(_e, "M"), 0)}, {"r": _S.prop(_S.read(_e, "F"), 2)}, {"e": _S.prop(_S.read(_e, "F"), 3)}, {"d": _S.prop(_S.read(_e, "F"), 1)}, {"w": _S.read(_e, "WHITE")}]))
	_S.define(_e, "t", 0)
	_S.define(_e, "emit", 0)
	_S.define(_e, "hit", false)
	_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.prop(_S.read(_e, "PATH"), 0), 0), _S.prop(_S.prop(_S.read(_e, "PATH"), 0), 1), 30, _S.prop(_S.read(_e, "F"), 4), 0.7, 0.25])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 6)):
		_S.invoke(_S.read(_v0, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.prop(_S.prop(_S.read(_v0, "PATH"), 0), 0), 2)}, {"y": _S.binary("+", _S.prop(_S.prop(_S.read(_v0, "PATH"), 0), 1), 2)}, {"vx": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 30), 20])}, {"vy": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 10), 15])}, {"r0": 2}, {"r1": _S.invoke(_S.read(_v0, "R"), "range", [5, 7.5])}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [1.2, 1.8])}, {"a": 0.6}, {"warm": 1}, {"rise": 8}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "blast", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_lights = _S.read(_parent,"lights")
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_F = _S.read(_parent,"F")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_B = _S.read(_parent,"B")
	var _n_stone = _S.read(_parent,"stone")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_Y_b0 = (-6)
	_S.invoke(_n_lights,"add",[0, (_n_Y_b0 - 2), 52, _S.call_value(_n_hex,["#ffb060"]), 0.8, 0.8])
	_S.invoke(_n_lights,"add",[0, (_n_Y_b0 - 2), 30, _n_WHITE, 0.75, 0.1])
	if true:
		var _n_i_b1 = 0
		while _S.truth((_n_i_b1 < 26)):
			var _n_a_b2 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_d_b3 = _S.invoke(_n_R,"range",[0, 6])
			var _n_sp_b4 = _S.invoke(_n_R,"range",[30, 170])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"FIRE"), (cos(_n_a_b2) * _n_d_b3), (_n_Y_b0 + (sin(_n_a_b2) * _n_d_b3)), (cos(_n_a_b2) * _n_sp_b4), (((sin(_n_a_b2) * _n_sp_b4) * 0.75) - 40), _S.invoke(_n_R,"range",[0.45, 0.95]), 0, _S.invoke(_n_R,"range",[3.2, 6.5])])
			_n_i_b1 += 1.0
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 5)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"FIRE"), _S.invoke(_n_R,"range",[(-3), 3]), _n_Y_b0, _S.invoke(_n_R,"range",[(-10), 10]), (-_S.invoke(_n_R,"range",[90, 150])), _S.invoke(_n_R,"range",[0.7, 1.1]), 0, _S.invoke(_n_R,"range",[4, 5.5]), _S.invoke(_n_R,"range",[0, 0.08])])
			_n_i_b5 += 1.0
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 70)):
			var _n_a_b7 = _S.invoke(_n_R,"range",[(PI + 0.12), (_n_TAU - 0.12)])
			var _n_sp_b8 = _S.invoke(_n_R,"range",[110, 280])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), 0, _n_Y_b0, (cos(_n_a_b7) * _n_sp_b8), ((sin(_n_a_b7) * _n_sp_b8) - 40), _S.invoke(_n_R,"range",[0.2, 0.65])])
			_n_i_b6 += 1.0
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 22)):
			var _n_a_b10 = _S.invoke(_n_R,"range",[PI, _n_TAU])
			var _n_sp_b11 = _S.invoke(_n_R,"range",[30, 110])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"EMBER"), (cos(_n_a_b10) * 4), (_n_Y_b0 + (sin(_n_a_b10) * 4)), (cos(_n_a_b10) * _n_sp_b11), ((sin(_n_a_b10) * _n_sp_b11) - 50), _S.invoke(_n_R,"range",[0.9, 1.6]), _S.index_value(_n_F,4)])
			_n_i_b9 += 1.0
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < 16)):
			_S.invoke(_n_rocks,"add",[{"kind":_S.named_value(_n_B,"CHUNK"),"x":_S.invoke(_n_R,"range",[(-5), 5]),"y":(-2),"vx":_S.invoke(_n_R,"range",[(-110), 110]),"vy":(-_S.invoke(_n_R,"range",[140, 290])),"g":1,"drag":0.4,"bounce":0.3,"life":_S.invoke(_n_R,"range",[1.5, 2.2]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-16), 16]),"s":_S.invoke(_n_R,"int",[1, 2])}])
			_n_i_b12 += 1.0
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < 60)):
			var _n_u_b14 = _S.invoke(_n_R,"range",[(-1), 1])
			var _n_a_b15 = ((float((-PI))/2) + (_n_u_b14 * 0.55))
			var _n_sp_b16 = (_S.invoke(_n_R,"range",[80, 220]) * (1 - (0.4 * absf(_n_u_b14))))
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), (_n_u_b14 * 4), (-1), (cos(_n_a_b15) * _n_sp_b16), (sin(_n_a_b15) * _n_sp_b16), _S.invoke(_n_R,"range",[1, 1.8]), _S.invoke(_n_R,"pick",[[_S.named_value(_n_stone,"light"), _S.named_value(_n_stone,"body"), _S.named_value(_n_stone,"body"), _S.named_value(_n_stone,"shade")]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.4])) else 1)])
			_n_i_b13 += 1.0
	if true:
		var _n_i_b17 = 0
		while _S.truth((_n_i_b17 < 18)):
			var _n_a_b18 = _S.invoke(_n_R,"range",[(PI * 1.15), (PI * 1.85)])
			var _n_sp_b19 = _S.invoke(_n_R,"range",[20, 90])
			_S.invoke(_n_smoke,"add",[{"x":(cos(_n_a_b18) * 4),"y":(_n_Y_b0 + (sin(_n_a_b18) * 4)),"vx":((cos(_n_a_b18) * _n_sp_b19) * 0.7),"vy":((sin(_n_a_b18) * _n_sp_b19) - (45 * (float(_n_i_b17)/18))),"r0":3,"r1":_S.invoke(_n_R,"range",[8, 14]),"life":_S.invoke(_n_R,"range",[1.7, 2.2]),"a":0.62,"b":0.88,"warm":1,"rise":(30 + (_n_i_b17 * 2)),"drag":1.8,"delay":_S.invoke(_n_R,"range",[0.05, 0.35])}])
			_n_i_b17 += 1.0
	if true:
		var _n_i_b20 = 0
		while _S.truth((_n_i_b20 < 12)):
			var _n_s_b21 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_smoke,"add",[{"x":(_n_s_b21 * _S.invoke(_n_R,"range",[0, 6])),"y":(-3),"vx":(_n_s_b21 * _S.invoke(_n_R,"range",[60, 150])),"vy":(-_S.invoke(_n_R,"range",[3, 12])),"r0":2.5,"r1":_S.invoke(_n_R,"range",[6, 9]),"life":_S.invoke(_n_R,"range",[1.1, 1.7]),"a":0.5,"b":0.75,"warm":0.3,"rise":6,"drag":3}])
			_n_i_b20 += 1.0
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLY"))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "u", _S.call_value(_S.read(_v15, "progress"), [_S.read(_v15, "t")]))
		var _v16 = _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "u")])
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.define(_v15, "h", _S.call_value(_S.read(_v15, "heading"), [_S.read(_v15, "u")]))
		_S.define(_v15, "cx", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "h")]))
		_S.define(_v15, "cy", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "h")]))
		var _v17 = _S.call_value(_S.read(_v15, "at"), [_S.call_value(_S.read(_v15, "progress"), [_S.invoke(_S.read(_v15, "Math"), "max", [0, _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "dt"))])])])
		_S.define(_v15, "px", _S.prop(_v17, 0))
		_S.define(_v15, "py", _S.prop(_v17, 1))
		var _v18 = _S.scope(_v15)
		_S.write(_v18, "emit", _S.binary("/", _S.invoke(_S.read(_v18, "Math"), "hypot", [_S.binary("-", _S.read(_v18, "x"), _S.read(_v18, "px")), _S.binary("-", _S.read(_v18, "y"), _S.read(_v18, "py"))]), 1.5), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v18, "emit"), 1)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "f", _S.binary("/", _S.binary("-", _S.read(_v19, "emit"), 1), _S.invoke(_S.read(_v19, "Math"), "max", [0.000001, _S.binary("/", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x"), _S.read(_v19, "px")), _S.binary("-", _S.read(_v19, "y"), _S.read(_v19, "py"))]), 1.5)])))
			_S.define(_v19, "ex", _S.binary("+", _S.read(_v19, "x"), _S.binary("*", _S.binary("-", _S.read(_v19, "px"), _S.read(_v19, "x")), _S.read(_v19, "f"))))
			_S.define(_v19, "ey", _S.binary("+", _S.read(_v19, "y"), _S.binary("*", _S.binary("-", _S.read(_v19, "py"), _S.read(_v19, "y")), _S.read(_v19, "f"))))
			_S.invoke(_S.read(_v19, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.binary("-", _S.read(_v19, "ex"), _S.binary("*", _S.read(_v19, "cx"), 7)), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.6), 0.6]))}, {"y": _S.binary("+", _S.binary("-", _S.read(_v19, "ey"), _S.binary("*", _S.read(_v19, "cy"), 7)), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 0.6), 0.6]))}, {"vx": _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v19, "cx")), _S.invoke(_S.read(_v19, "R"), "range", [10, 30])), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 6), 6]))}, {"vy": _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v19, "cy")), _S.invoke(_S.read(_v19, "R"), "range", [10, 30])), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 6), 6]))}, {"r0": 1.4}, {"r1": _S.invoke(_S.read(_v19, "R"), "range", [3.5, 6])}, {"life": _S.invoke(_S.read(_v19, "R"), "range", [1.5, 2.3])}, {"a": 0.5}, {"b": 0.9}, {"warm": 0.8}, {"rise": 4}, {"drag": 3}, {"grow": 1.2}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "emit", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.35])):
			var _v20 = _S.scope(_v15)
			_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.read(_v20, "h"), _S.prop(_S.read(_v20, "Math"), "PI")), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 140]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.binary("-", _S.read(_v20, "x"), _S.binary("*", _S.read(_v20, "cx"), 7)), _S.binary("-", _S.read(_v20, "y"), _S.binary("*", _S.read(_v20, "cy"), 7)), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.15, 0.35])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
			var _v21 = _S.scope(_e)
			_S.write(_v21, "hit", true, "=", false)
			_S.call_value(_S.read(_v21, "blast"), [])
	for _v22 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _v22)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v23, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v23, "b"), "dusted")))):
			var _v24 = _S.scope(_v23)
			_S.set_prop(_S.read(_v24, "b"), "dusted", true, "=", false)
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "i"), 2)):
				_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v25, "b"), "x"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 1), 1])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v25, "R"), "sign", []), _S.invoke(_S.read(_v25, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [2, 14])), _S.invoke(_S.read(_v25, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v25, "stone"), "dust"), _S.invoke(_S.read(_v25, "R"), "range", [1.2, 2.2])])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_hit = _S.read(_parent,"hit")
	var _n_t = _S.read(_parent,"t")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_meta = _S.read(_parent,"meta")
	var _n_F = _S.read(_parent,"F")
	var _n_hex = _S.read(_parent,"hex")
	var _n_stone = _S.read(_parent,"stone")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(_n_hit):
		var _n_k_b1 = (_n_t - _n_FLY)
		var _n_fade_b2 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1),(_S.named_value(_n_meta,"duration") - 0.2),_n_t))
		var _n_rx_b3 = (16 * minf(1,(float(_n_k_b1)/0.06)))
		if true:
			var _n_y_b5 = 0
			while _S.truth((_n_y_b5 <= 2)):
				if true:
					var _n_x_b6 = floori((-_n_rx_b3))
					while _S.truth((_n_x_b6 <= ceili(_n_rx_b3))):
						var _n_d_b7 = _S.Bridge.hypot([(float((_n_x_b6 + 0.5))/_n_rx_b3), (float((_n_y_b5 + 0.5))/4)])
						if _S.truth((_n_d_b7 > 1)):
							_n_x_b6 += 1.0
							continue
						var _n_T_b8 = ((pow(clampf((1 - (float(_n_k_b1)/1.4)),0.0,1.0),1.4) * (1.25 - _n_d_b7)) - (_S.MathFX.rand([((_n_x_b6 * 31) + _n_y_b5),3]) * 0.35))
						_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b5, (_S.index_value(_n_F,maxf(1,minf(8,floori((_n_T_b8 * 8)+0.5)))) if _S.truth((_n_T_b8 > 0.06)) else (_S.call_value(_n_hex,["#0d0a12"]) if _S.truth((_n_d_b7 < 0.5)) else _S.call_value(_n_hex,["#17121d"]))), _n_fade_b2])
						_n_x_b6 += 1.0
				_n_y_b5 += 1.0
		var _n_q_b4 = (float(_n_k_b1)/0.45)
		if _S.truth((_n_q_b4 < 1)):
			_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (60 * (1 - pow((1 - _n_q_b4),3))), 0.16, maxf(1,(4 * (1 - _n_q_b4))), (1.15 - _n_q_b4), [_S.named_value(_n_stone,"body"), _S.named_value(_n_stone,"light"), _S.index_value(_n_F,4), _S.index_value(_n_F,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_SM = _S.read(_parent,"SM")
	var _n_F = _S.read(_parent,"F")
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_hit = _S.read(_parent,"hit")
	var _n_t = _S.read(_parent,"t")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_stone = _S.read(_parent,"stone")
	var _n_band = _S.read(_parent,"band")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_ps = _S.read(_parent,"ps")
	var _n_progress = _S.read(_parent,"progress")
	var _n_at = _S.read(_parent,"at")
	var _n_heading = _S.read(_parent,"heading")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_MISSILE = _S.read(_parent,"MISSILE")
	var _n_pal = _S.read(_parent,"pal")
	var _n_turnSprite = _S.read(_parent,"turnSprite")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_list_b1 = _S.invoke(_n_smoke,"puffs",[])
	_S.call_value(_n_cloud,[_n_p_b0, _n_list_b1, _n_SM, [_S.index_value(_n_SM,0), _S.ColorFX.mix(_S.index_value(_n_F,1),_S.index_value(_n_SM,1),0.5), _S.ColorFX.mix(_S.index_value(_n_F,2),_S.index_value(_n_SM,2),0.4), _S.index_value(_n_F,3), _S.index_value(_n_F,4), _S.index_value(_n_F,6), _S.index_value(_n_F,7)], {"dens":1.4,"max":0.82,"lit":1.4}])
	if _S.truth(_n_hit):
		var _n_q_b3 = (float((_n_t - _n_FLY))/0.45)
		if _S.truth((_n_q_b3 < 1)):
			_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (60 * (1 - pow((1 - _n_q_b3),3))), 0.16, maxf(1,(4 * (1 - _n_q_b3))), (1.15 - _n_q_b3), [_S.named_value(_n_stone,"body"), _S.named_value(_n_stone,"light"), _S.index_value(_n_F,4), _S.index_value(_n_F,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	for _iter_0 in _S.array(_S.named_value(_n_rocks,"list")):
		var _n_b_b4 = _iter_0
		var _n_r_b5 = (0.6 + (_S.named_value(_n_b_b4,"s") * 0.75))
		var _n_fade_b6 = minf(1,(float(_S.named_value(_n_b_b4,"life"))/0.5))
		var _n_lx_b7 = ((cos(_S.named_value(_n_b_b4,"a")) * _n_r_b5) * 0.4)
		var _n_ly_b8 = ((sin(_S.named_value(_n_b_b4,"a")) * _n_r_b5) * 0.4)
		_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b4,"x") - _n_r_b5) - 1), ((_S.named_value(_n_b_b4,"y") - _n_r_b5) - 1), ((_S.named_value(_n_b_b4,"x") + _n_r_b5) + 1), ((_S.named_value(_n_b_b4,"y") + _n_r_b5) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b4,"r":_n_r_b5,"lx":_n_lx_b7,"ly":_n_ly_b8,"fade":_n_fade_b6,"this":_this}),"_f8")])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	if _S.truth((_n_t < _n_FLY)):
		var _n_u_b9 = _S.call_value(_n_progress,[_n_t])
		var _tuple_1 = _S.call_value(_n_at,[_n_u_b9])
		var _n_x_b10 = _S.prop(_tuple_1,0)
		var _n_y_b11 = _S.prop(_tuple_1,1)
		var _n_h_b12 = _S.call_value(_n_heading,[_n_u_b9])
		var _n_cx_b13 = cos(_n_h_b12)
		var _n_cy_b14 = sin(_n_h_b12)
		var _n_fr_b15 = floori((_n_t * 30))
		var _n_J_b16 = (5 + (3 * _S.MathFX.rand([_n_fr_b15,7])))
		if true:
			var _n_d_b17 = 0
			while _S.truth((_n_d_b17 <= _n_J_b16)):
				var _n_v_b18 = (float(_n_d_b17)/_n_J_b16)
				var _n_c_b19 = (_n_WHITE if _S.truth((_n_v_b18 < 0.3)) else (_S.index_value(_n_F,6) if _S.truth((_n_v_b18 < 0.6)) else _S.index_value(_n_F,4)))
				_S.invoke(_n_p_b0,"dot",[(_n_x_b10 - (_n_cx_b13 * (6.5 + _n_d_b17))), (_n_y_b11 - (_n_cy_b14 * (6.5 + _n_d_b17))), _n_c_b19])
				if _S.truth((_n_v_b18 < 0.5)):
					_S.invoke(_n_p_b0,"dot",[((_n_x_b10 - (_n_cx_b13 * (6.5 + _n_d_b17))) - (_n_cy_b14 * 0.8)), ((_n_y_b11 - (_n_cy_b14 * (6.5 + _n_d_b17))) + (_n_cx_b13 * 0.8)), _S.index_value(_n_F,5)])
				_n_d_b17 += 0.5
		_S.call_value(_n_turnSprite,[_n_p_b0, _n_MISSILE, _n_pal, _n_x_b10, _n_y_b11, _n_h_b12, 6, 2.5])
		_S.invoke(_n_p_b0,"glow",[(_n_x_b10 - (_n_cx_b13 * 8)), (_n_y_b11 - (_n_cy_b14 * 8)), 18, _S.index_value(_n_F,4), 0.5])
		_S.invoke(_n_p_b0,"glow",[(_n_x_b10 - (_n_cx_b13 * 7)), (_n_y_b11 - (_n_cy_b14 * 7)), 6, _S.index_value(_n_F,7), 0.5])
	var _n_k_b2 = (_n_t - _n_FLY)
	if _S.truth(((_n_k_b2 < 0.07) if _S.truth((_n_k_b2 >= 0)) else (_n_k_b2 >= 0))):
		var _n_r_b20 = (14 * (0.8 + (0.2 * (1 - (float(_n_k_b2)/0.07)))))
		_S.invoke(_n_p_b0,"circle",[0, (-6), (_n_r_b20 + 1.2), _S.index_value(_n_F,3)])
		_S.invoke(_n_p_b0,"circle",[0, (-6), _n_r_b20, (_S.index_value(_n_F,7) if _S.truth((_n_k_b2 < 0.035)) else _S.index_value(_n_F,6))])
		_S.invoke(_n_p_b0,"circle",[0, (-6), (_n_r_b20 * 0.6), (_n_WHITE if _S.truth((_n_k_b2 < 0.035)) else _S.index_value(_n_F,7))])
	if _S.truth(((_n_k_b2 < 0.3) if _S.truth((_n_k_b2 >= 0)) else (_n_k_b2 >= 0))):
		var _n_rr_b21 = (8 + (30 * (1 - pow((1 - (float(_n_k_b2)/0.3)),3))))
		_S.invoke(_n_p_b0,"ring",[0, (-6), _n_rr_b21, maxf(1,((2.5 * (1 - (float(_n_k_b2)/0.3))) + 0.4)), _S.index_value(_n_F,5), _S.function_value(_S.capture(_parent,{"rr":_n_rr_b21,"k":_n_k_b2,"this":_this}),"_f9")])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_hex = _S.read(_parent,"hex")
	var _n_stone = _S.read(_parent,"stone")
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
	_S.set_prop(_n_out_b2,"c",(_S.call_value(_n_hex,["#1a1422"]) if _S.truth((_n_d_b5 > _n_r)) else (_S.named_value(_n_stone,"light") if _S.truth((_n_lit_b6 < (-0.4))) else (_S.named_value(_n_stone,"shade") if _S.truth((_n_lit_b6 > 0.6)) else _S.named_value(_n_stone,"body")))),"=")
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_rr = _S.read(_parent,"rr")
	var _n_k = _S.read(_parent,"k")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_ang_b1 = _S.arg(_args,1)
	return (0 if _S.truth((((-6) + (sin(_n_ang_b1) * _n_rr)) > 0)) else minf(1,((1 - (float(_n_k)/0.3)) * 1.6)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_PATH = _S.read(_parent,"PATH")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = (1 - _n_u_b0)
	var _n_a_b2 = ((_n_v_b1 * _n_v_b1) * _n_v_b1)
	var _n_b_b3 = (((3 * _n_v_b1) * _n_v_b1) * _n_u_b0)
	var _n_c_b4 = (((3 * _n_v_b1) * _n_u_b0) * _n_u_b0)
	var _n_d_b5 = ((_n_u_b0 * _n_u_b0) * _n_u_b0)
	return [((((_n_a_b2 * _S.index_value(_S.index_value(_n_PATH,0),0)) + (_n_b_b3 * _S.index_value(_S.index_value(_n_PATH,1),0))) + (_n_c_b4 * _S.index_value(_S.index_value(_n_PATH,2),0))) + (_n_d_b5 * _S.index_value(_S.index_value(_n_PATH,3),0))), ((((_n_a_b2 * _S.index_value(_S.index_value(_n_PATH,0),1)) + (_n_b_b3 * _S.index_value(_S.index_value(_n_PATH,1),1))) + (_n_c_b4 * _S.index_value(_S.index_value(_n_PATH,2),1))) + (_n_d_b5 * _S.index_value(_S.index_value(_n_PATH,3),1)))]
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = (1 - _n_u_b0)
	var _n_d_b2 = _S.function_value(_S.capture(_parent,{"v":_n_v_b1,"u":_n_u_b0,"this":_n_this}),"_f12")
	return atan2(_S.call_value(_n_d_b2,[1]),_S.call_value(_n_d_b2,[0]))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_v = _S.read(_parent,"v")
	var _n_PATH = _S.read(_parent,"PATH")
	var _n_u = _S.read(_parent,"u")
	var _n_i_b0 = _S.arg(_args,0)
	return (((((3 * _n_v) * _n_v) * (_S.index_value(_S.index_value(_n_PATH,1),_n_i_b0) - _S.index_value(_S.index_value(_n_PATH,0),_n_i_b0))) + (((6 * _n_v) * _n_u) * (_S.index_value(_S.index_value(_n_PATH,2),_n_i_b0) - _S.index_value(_S.index_value(_n_PATH,1),_n_i_b0)))) + (((3 * _n_u) * _n_u) * (_S.index_value(_S.index_value(_n_PATH,3),_n_i_b0) - _S.index_value(_S.index_value(_n_PATH,2),_n_i_b0))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_t_b0 = _S.arg(_args,0)
	return pow(clampf((float(_n_t_b0)/_n_FLY),0.0,1.0),1.45)
	return null
