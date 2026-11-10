@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-spikes.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "blade", _S.import_value("fx/ice/_lib.js", "blade"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice spikes"}, {"desc": "A frost line races along the floor and clusters of jagged ice blades burst up behind it in a rising wave, glint, flash white together and shatter into toppling shards."}, {"tags": ["ice", "spikes", "ground", "wave", "directional", "magic", "one-shot"]}, {"size": [264, 112]}, {"origin": [24, 96]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"reach": 172}, {"height": 56}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "START", 0.04)
	_S.define(_e, "RUN", 0.44)
	_S.define(_e, "SHIMMER", 0.74)
	_S.define(_e, "TREMBLE", 1.2)
	_S.define(_e, "FLASH", 1.36)
	_S.define(_e, "SHATTER", 1.42)
	_S.define(_e, "MELT", 1.75)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "splinter", _S.function_value(_e, "_f2"))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onCrumble": _S.function_value(_e, "_f3")}, {"onLand": _S.function_value(_e, "_f4")}])]))
	_S.define(_e, "front", _S.function_value(_e, "_f5"))
	_S.define(_e, "reachedAt", _S.function_value(_e, "_f6"))
	_S.define(_e, "env", _S.function_value(_e, "_f7"))
	_S.define(_e, "clusters", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "x", 10)
	while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.binary("-", _S.read(_v1, "REACH"), 2))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "q", _S.binary("/", _S.read(_v2, "x"), _S.read(_v2, "REACH")))
		_S.define(_v2, "H", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "o"), "height"), _S.call_value(_S.read(_v2, "env"), [_S.read(_v2, "q")])), _S.invoke(_S.read(_v2, "R"), "range", [0.88, 1.06])))
		_S.define(_v2, "W", _S.call_value(_S.read(_v2, "clamp"), [_S.binary("*", _S.read(_v2, "H"), 0.36), 5, 14]))
		_S.define(_v2, "lean", _S.binary("*", _S.read(_v2, "H"), _S.invoke(_S.read(_v2, "R"), "range", [0.2, 0.34])))
		_S.define(_v2, "list", [_S.merge([{"dx": _S.binary("*", _S.read(_v2, "W"), _S.invoke(_S.read(_v2, "R"), "range", [0.35, 0.6]))}, {"h": _S.binary("*", _S.read(_v2, "H"), _S.invoke(_S.read(_v2, "R"), "range", [0.5, 0.7]))}, {"w": _S.binary("*", _S.read(_v2, "W"), 0.7)}, {"lean": _S.binary("*", _S.read(_v2, "H"), _S.invoke(_S.read(_v2, "R"), "range", [0.4, 0.6]))}, {"back": true}, {"delay": _S.invoke(_S.read(_v2, "R"), "range", [0.02, 0.05])}, {"jag": (_S.invoke(_S.read(_v2, "R"), "range", [0.35, 0.6]) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.unary("-", 1))}]), _S.merge([{"dx": 0}, {"h": _S.read(_v2, "H")}, {"w": _S.read(_v2, "W")}, {"lean": _S.read(_v2, "lean")}, {"back": false}, {"delay": 0}, {"jag": (_S.invoke(_S.read(_v2, "R"), "range", [0.32, 0.58]) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.7])) else _S.unary("-", 1))}, {"main": true}])])
		if _S.truth(_S.binary(">", _S.read(_v2, "H"), 14)):
			_S.invoke(_S.read(_v2, "list"), "push", [_S.merge([{"dx": _S.binary("*", _S.unary("-", _S.read(_v2, "W")), _S.invoke(_S.read(_v2, "R"), "range", [0.35, 0.55]))}, {"h": _S.binary("*", _S.read(_v2, "H"), _S.invoke(_S.read(_v2, "R"), "range", [0.24, 0.4]))}, {"w": _S.binary("*", _S.read(_v2, "W"), 0.55)}, {"lean": _S.binary("*", _S.unary("-", _S.read(_v2, "H")), _S.invoke(_S.read(_v2, "R"), "range", [0, 0.12]))}, {"back": false}, {"delay": _S.invoke(_S.read(_v2, "R"), "range", [0.03, 0.07])}, {"jag": _S.unary("-", 1)}])])
		_S.invoke(_S.read(_v2, "clusters"), "push", [_S.merge([{"x": _S.read(_v2, "x")}, {"q": _S.read(_v2, "q")}, {"H": _S.read(_v2, "H")}, {"W": _S.read(_v2, "W")}, {"blades": _S.read(_v2, "list")}, {"main": _S.prop(_S.read(_v2, "list"), 1)}, {"t0": _S.binary("+", _S.call_value(_S.read(_v2, "reachedAt"), [_S.read(_v2, "x")]), 0.012)}, {"up": false}])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "x", _S.invoke(_S.read(_v1, "R"), "range", [20, 26]), "+=", false)
	_S.define(_e, "crest", _S.invoke(_S.read(_e, "clusters"), "reduce", [_S.function_value(_e, "_f8"), _S.prop(_S.read(_e, "clusters"), 0)]))
	_S.define(_e, "t", 0)
	_S.define(_e, "broke", false)
	_S.define(_e, "trembled", false)
	_S.define(_e, "pose", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawClusters", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawFrost", _S.function_value(_e, "_f11"))
	_S.define(_e, "breakBlade", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f17")}, {"drawBack": _S.function_value(_e, "_f18")}, {"draw": _S.function_value(_e, "_f19")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_n_b3)):
			_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])),"y":(_n_y_b1 - 1),"vx":((_n_vx_b2 * 0.5) + _S.invoke(_n_R,"range",[(-45), 45])),"vy":(-_S.invoke(_n_R,"range",[30, 100])),"g":0.8,"drag":0.6,"bounce":0.35,"life":_S.invoke(_n_R,"range",[0.4, 0.75]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-18), 18]),"s":_S.invoke(_n_R,"range",[1.2, 2.4]),"c":_S.index_value(_n_C,_S.invoke(_n_R,"int",[4, 7]))}])
			_n_i_b4 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_q_b0 = _S.arg(_args,0)
	_S.call_value(_n_splinter,[_S.named_value(_n_q_b0,"x"), 0, 0, 3])
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _S.named_value(_n_q_b0,"x"), (-1), _S.invoke(_n_R,"range",[(-12), 12]), (-_S.invoke(_n_R,"range",[2, 8])), _S.invoke(_n_R,"range",[0.4, 0.7]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.4, 2.2])])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_v_b3 = _S.arg(_args,3)
	if _S.truth((_n_v_b3 < 110)):
		return null
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _n_x_b1, (_n_y_b2 - 1), _S.invoke(_n_R,"range",[(-20), 20]), (-_S.invoke(_n_R,"range",[2, 8])), _S.invoke(_n_R,"range",[0.4, 0.7]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.4, 2.4])])
	_S.call_value(_n_splinter,[_n_x_b1, _n_y_b2, _S.named_value(_n_q_b0,"vx"), 3])
	if _S.truth(_S.invoke(_n_R,"chance",[0.3])):
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _n_x_b1, (_n_y_b2 - 2), 0, (-5), _S.invoke(_n_R,"range",[0.2, 0.4]), _n_WHITE, _S.invoke(_n_R,"range",[0.8, 1.6])])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_START = _S.read(_parent,"START")
	var _n_RUN = _S.read(_parent,"RUN")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_REACH * (1 - pow((1 - _S.MathFX.seg(_n_t_b0,_n_START,(_n_START + _n_RUN))),1.7)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_START = _S.read(_parent,"START")
	var _n_RUN = _S.read(_parent,"RUN")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_START + (_n_RUN * (1 - pow((1 - clampf((float(_n_x_b0)/_n_REACH),0.0,1.0)),(float(1)/1.7)))))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return (0.28 + (0.72 * exp((-pow((float((_n_q_b0 - 0.64))/0.3),2)))))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	return (_n_c_b1 if _S.truth((_S.named_value(_n_c_b1,"H") > _S.named_value(_n_a_b0,"H"))) else _n_a_b0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_SHATTER = _S.read(_parent,"SHATTER")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.invoke(_n_ease,"outBack",[clampf((float(((_n_t - _S.named_value(_n_c_b0,"t0")) - _S.named_value(_n_b_b1,"delay")))/0.09),0.0,1.0), 2.2])
	var _n_x_b3 = (_S.named_value(_n_c_b0,"x") + _S.named_value(_n_b_b1,"dx"))
	return {"g":_n_g_b2,"x":_n_x_b3,"tx":(_n_x_b3 + (_S.named_value(_n_b_b1,"lean") * _n_g_b2)),"ty":((-_S.named_value(_n_b_b1,"h")) * _n_g_b2),"white":((((_n_t - _S.named_value(_n_c_b0,"t0")) - _S.named_value(_n_b_b1,"delay")) < 0.03) if _S.truth((((_n_t - _S.named_value(_n_c_b0,"t0")) - _S.named_value(_n_b_b1,"delay")) < 0.03)) else ((_n_t < _n_SHATTER) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH)))}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_SHATTER = _S.read(_parent,"SHATTER")
	var _n_TREMBLE = _S.read(_parent,"TREMBLE")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_pose = _S.read(_parent,"pose")
	var _n_SHIMMER = _S.read(_parent,"SHIMMER")
	var _n_C = _S.read(_parent,"C")
	var _n_blade = _S.read(_parent,"blade")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_clusters = _S.read(_parent,"clusters")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t >= _n_SHATTER)):
		return null
	for _iter_0 in _S.array([0, 1, 2]):
		var _n_pass_b1 = _iter_0
		for _iter_1 in _S.array(_n_clusters):
			var _n_c_b2 = _iter_1
			if _S.truth((_n_t < _S.named_value(_n_c_b2,"t0"))):
				continue
			var _n_jx_b3 = ((1 if _S.truth(fmod((floori((_n_t * 40)) + floori(_S.named_value(_n_c_b2,"x")+0.5)),2)) else 0) if _S.truth(((_n_t < _n_FLASH) if _S.truth((_n_t >= _n_TREMBLE)) else (_n_t >= _n_TREMBLE))) else 0)
			for _iter_2 in _S.array(_S.named_value(_n_c_b2,"blades")):
				var _n_b_b4 = _iter_2
				if _S.truth((_S.binary("!==",_S.binary("===",_n_pass_b1,0),_S.named_value(_n_b_b4,"back")) if _S.truth(_S.binary("!==",_S.binary("===",_n_pass_b1,0),_S.named_value(_n_b_b4,"back"))) else _S.binary("!==",_S.binary("===",_n_pass_b1,1),not _S.truth(not _S.truth(_S.named_value(_n_b_b4,"main")))))):
					continue
				var _n_s_b5 = _S.call_value(_n_pose,[_n_c_b2, _n_b_b4])
				if _S.truth((_S.named_value(_n_s_b5,"g") <= 0)):
					continue
				var _n_gl_b6 = (float(((_n_t - _n_SHIMMER) - (_S.named_value(_n_c_b2,"q") * 0.34)))/0.2)
				_S.call_value(_n_blade,[_n_p_b0, (_S.named_value(_n_s_b5,"x") + _n_jx_b3), 0, (_S.named_value(_n_s_b5,"tx") + _n_jx_b3), _S.named_value(_n_s_b5,"ty"), _S.named_value(_n_b_b4,"w"), _n_C, {"white":_S.named_value(_n_s_b5,"white"),"jag":_S.named_value(_n_b_b4,"jag"),"dim":(1 if _S.truth(_S.named_value(_n_b_b4,"back")) else 0),"glint":(_n_gl_b6 if _S.truth(((_n_gl_b6 <= 1) if _S.truth((_n_gl_b6 >= 0)) else (_n_gl_b6 >= 0))) else (-1))}])
			if _S.truth(_S.binary("===",_n_pass_b1,2)):
				var _n_pop_b7 = clampf((1 - (float((_n_t - _S.named_value(_n_c_b2,"t0")))/0.15)),0.0,1.0)
				var _n_wh_b8 = (_n_t >= _n_FLASH)
				_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_c_b2,"x") + (_S.named_value(_S.named_value(_n_c_b2,"main"),"lean") * 0.4)), ((-_S.named_value(_n_c_b2,"H")) * 0.45), ((_S.named_value(_n_c_b2,"H") * 0.9) + 10), _S.index_value(_n_C,4), (((0.16 + (0.42 * _n_pop_b7)) + (0.4 if _S.truth(_n_wh_b8) else 0)) * (0.85 + (0.15 * sin(((_n_t * 3) + _S.named_value(_n_c_b2,"x"))))))])
				if _S.truth((_n_pop_b7 > 0)):
					_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_c_b2,"x"), (-2), 14, _n_WHITE, (0.55 * _n_pop_b7)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_reachedAt = _S.read(_parent,"reachedAt")
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_START = _S.read(_parent,"START")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fr_b1 = _S.call_value(_n_front,[_n_t])
	if true:
		var _n_x_b2 = (-3)
		while _S.truth((_n_x_b2 <= minf(_n_fr_b1,(_n_REACH + 6)))):
			var _n_q_b3 = clampf((float(_n_x_b2)/_n_REACH),0.0,1.0)
			var _n_age_b4 = (_n_t - _S.call_value(_n_reachedAt,[maxf(0,_n_x_b2)]))
			var _n_a_b5 = (1 - _S.MathFX.smooth((_n_MELT + (_n_q_b3 * 0.35)),((_n_MELT + (_n_q_b3 * 0.35)) + 0.6),_n_t))
			if _S.truth(((_n_a_b5 <= 0) if _S.truth((_n_a_b5 <= 0)) else (_n_age_b4 < 0))):
				_n_x_b2 += 1.0
				continue
			var _n_h_b6 = _S.MathFX.rand([_n_x_b2,17])
			var _n_grow_b7 = _S.MathFX.smooth(0,0.3,_n_age_b4)
			var _n_head_b8 = ((_n_fr_b1 < _n_REACH) if _S.truth(((_n_fr_b1 - _n_x_b2) < 3)) else ((_n_fr_b1 - _n_x_b2) < 3))
			_S.invoke(_n_p_b0,"dot",[_n_x_b2, 0, (_n_WHITE if _S.truth(((_n_head_b8 if _S.truth(_n_head_b8) else (_n_age_b4 < 0.06)) if _S.truth((_n_head_b8 if _S.truth(_n_head_b8) else (_n_age_b4 < 0.06))) else (_n_h_b6 < 0.3))) else _S.index_value(_n_C,6)), _n_a_b5])
			var _n_L_b9 = (floori((_n_grow_b7 * (1 + (_S.MathFX.rand([_n_x_b2,5]) * 2.6)))+0.5) if _S.truth((_n_h_b6 < 0.45)) else 0)
			if true:
				var _n_j_b11 = 1
				while _S.truth((_n_j_b11 <= _n_L_b9)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b2, (-_n_j_b11), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b11,_n_L_b9)) else _S.index_value(_n_C,5)), _n_a_b5])
					_n_j_b11 += 1.0
			if _S.truth(((_S.MathFX.rand([_n_x_b2,9]) < 0.5) if _S.truth((_n_L_b9 > 1)) else (_n_L_b9 > 1))):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b2 + 1), ((-_n_L_b9) + 1), _S.index_value(_n_C,6), _n_a_b5])
			var _n_D_b10 = ((_n_grow_b7 * (2 + (_S.MathFX.rand([_n_x_b2,11]) * 4))) * (1 - (_n_q_b3 * 0.3)))
			if true:
				var _n_j_b12 = 1
				while _S.truth((_n_j_b12 <= _n_D_b10)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b2, _n_j_b12, (_n_WHITE if _S.truth((_S.MathFX.rand([((_n_x_b2 * 31) + _n_j_b12),7]) < 0.06)) else (_S.index_value(_n_C,5) if _S.truth((_n_j_b12 < 2)) else (_S.index_value(_n_C,4) if _S.truth((_n_j_b12 < 4)) else _S.index_value(_n_C,3)))), (_n_a_b5 * (1.1 - (float(_n_j_b12)/(_n_D_b10 + 1))))])
					_n_j_b12 += 1.0
			if _S.truth(_n_head_b8):
				_S.invoke(_n_p_b0,"dot",[_n_x_b2, (-1), _n_WHITE])
			_n_x_b2 += 1.0
	if _S.truth(((_n_t > _n_START) if _S.truth((_n_fr_b1 < _n_REACH)) else (_n_fr_b1 < _n_REACH))):
		_S.invoke(_n_p_b0,"glow",[_n_fr_b1, (-2), 16, _S.index_value(_n_C,6), 0.6])
		_S.invoke(_n_p_b0,"glow",[_n_fr_b1, (-1), 7, _n_WHITE, 0.6])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "c"), _S.read(_e, "b")]))
	_S.define(_e, "ax", _S.binary("-", _S.prop(_S.read(_e, "s"), "tx"), _S.prop(_S.read(_e, "s"), "x")))
	_S.define(_e, "ay", _S.prop(_S.read(_e, "s"), "ty"))
	_S.define(_e, "L", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "ax"), _S.read(_e, "ay")]), func(): return 1))
	_S.define(_e, "nx", _S.binary("/", _S.unary("-", _S.read(_e, "ay")), _S.read(_e, "L")))
	_S.define(_e, "ny", _S.binary("/", _S.read(_e, "ax"), _S.read(_e, "L")))
	_S.define(_e, "hw", _S.binary("/", _S.prop(_S.read(_e, "b"), "w"), 2))
	_S.define(_e, "tri", [[_S.binary("-", _S.prop(_S.read(_e, "s"), "x"), _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "hw"))), _S.binary("*", _S.unary("-", _S.read(_e, "ny")), _S.read(_e, "hw"))], [_S.prop(_S.read(_e, "s"), "tx"), _S.prop(_S.read(_e, "s"), "ty")], [_S.binary("+", _S.prop(_S.read(_e, "s"), "x"), _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "hw"))), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "hw"))]])
	_S.define(_e, "ang", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "ay"), _S.read(_e, "ax")]), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)))
	_S.define(_e, "parts", [_S.read(_e, "tri")])
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "b"), "h"), 9)):
		_S.write(_e, "parts", _S.invoke(_S.read(_e, "parts"), "flatMap", [_S.function_value(_e, "_f13")]), "=", false)
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "b"), "h"), 22)):
		_S.write(_e, "parts", _S.invoke(_S.read(_e, "parts"), "flatMap", [_S.function_value(_e, "_f14")]), "=", false)
	for _v18 in _S.array(_S.read(_e, "parts")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "part", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "mx", 0)
		_S.define(_v20, "my", 0)
		for _v21 in _S.array(_S.read(_v20, "part")):
			var _v22 = _S.scope(_v20)
			var _v23 = _v21
			_S.define(_v22, "x", _S.prop(_v23, 0))
			_S.define(_v22, "y", _S.prop(_v23, 1))
			_S.last([_S.write(_v22, "mx", _S.read(_v22, "x"), "+=", false), _S.write(_v22, "my", _S.read(_v22, "y"), "+=", false)])
		_S.last([_S.write(_v20, "mx", _S.prop(_S.read(_v20, "part"), "length"), "/=", false), _S.write(_v20, "my", _S.prop(_S.read(_v20, "part"), "length"), "/=", false)])
		_S.define(_v20, "up", _S.call_value(_S.read(_v20, "clamp"), [_S.binary("/", _S.unary("-", _S.read(_v20, "my")), 40)]))
		_S.invoke(_S.read(_v20, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v20, "part"), "map", [_S.function_value(_v20, "_f16")])}, {"x": _S.read(_v20, "mx")}, {"y": _S.read(_v20, "my")}, {"vx": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 25), 60])}, {"vy": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [40, 130])), _S.binary("+", 0.5, _S.read(_v20, "up")))}, {"a": 0}, {"va": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 8), 8])}, {"f": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.7), 0.7])}, {"vf": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 6), 6])}, {"lit": (0.45 if _S.truth(_S.prop(_S.read(_v20, "b"), "back")) else 0.75)}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.3}, {"solid": true}, {"ridge": _S.invoke(_S.read(_v20, "Math"), "atan2", [_S.read(_v20, "ay"), _S.read(_v20, "ax")])}, {"brittle": (2 if _S.truth(_S.binary(">", _S.prop(_S.read(_v20, "b"), "h"), 30)) else 1)}, {"crumble": _S.invoke(_S.read(_v20, "R"), "range", [0.12, 0.4])}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [1, 1.4])}])])
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v25, "i"), _S.binary("+", 2, _S.binary("/", _S.prop(_S.read(_v25, "b"), "h"), 7)))):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "u", _S.invoke(_S.read(_v26, "R"), "next", []))
		_S.invoke(_S.read(_v26, "bits"), "add", [_S.merge([{"kind": (_S.prop(_S.read(_v26, "B"), "CHUNK") if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.15])) else _S.prop(_S.read(_v26, "B"), "SHARD"))}, {"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_v26, "s"), "x"), _S.binary("*", _S.read(_v26, "ax"), _S.read(_v26, "u"))), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 1.5), 1.5]))}, {"y": _S.binary("*", _S.read(_v26, "ay"), _S.read(_v26, "u"))}, {"vx": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 60), 90])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [60, 230]))}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [0.7, 1.3])}, {"a": _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")])}, {"va": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v26, "R"), "range", [1.2, 3.2])}, {"c": _S.prop(_S.read(_v26, "C"), _S.invoke(_S.read(_v26, "R"), "int", [4, 7]))}, {"ramp": [_S.prop(_S.read(_v26, "C"), 1), _S.prop(_S.read(_v26, "C"), 3), _S.prop(_S.read(_v26, "C"), 4), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 7)]}])])
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "+=", true)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _n_ax = _S.read(_parent,"ax")
	var _n_ay = _S.read(_parent,"ay")
	var _n_ang = _S.read(_parent,"ang")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_poly_b0 = _S.arg(_args,0)
	return _S.call_value(_n_splitPoly,[_n_poly_b0, (_S.named_value(_n_s,"x") + (_n_ax * 0.4)), (_n_ay * 0.4), _n_ang])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _n_ax = _S.read(_parent,"ax")
	var _n_ay = _S.read(_parent,"ay")
	var _n_ang = _S.read(_parent,"ang")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_this = _S.read(_parent,"this")
	var _n_poly_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_splitPoly,[_n_poly_b0, (_S.named_value(_n_s,"x") + (_n_ax * 0.72)), (_n_ay * 0.72), _n_ang]) if _S.truth(_S.invoke(_n_poly_b0,"some",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f15")])) else [_n_poly_b0])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_ay = _S.read(_parent,"ay")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return (_n_y_b0 < (_n_ay * 0.5))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 - _n_mx), (_n_y_b1 - _n_my)]
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt")), _S.read(_e, "START")), func(): return _S.binary(">", _S.read(_e, "t"), _S.read(_e, "START")))):
		var _v27 = _S.scope(_e)
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 4)):
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "VAPOUR"), _S.invoke(_S.read(_v28, "R"), "range", [0, 6]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [0, 3])), _S.invoke(_S.read(_v28, "R"), "range", [10, 60]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [2, 12])), _S.invoke(_S.read(_v28, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v28, "C"), 6), _S.invoke(_S.read(_v28, "R"), "range", [2, 3.2])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
		_S.invoke(_S.read(_v27, "lights"), "add", [4, _S.unary("-", 4), 26, _S.prop(_S.read(_v27, "C"), 5), 0.6, 0.25])
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "START")), func(): return _S.binary("<", _S.read(_e, "fr"), _S.binary("-", _S.read(_e, "REACH"), 1)))):
		var _v29 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "STREAK"), _S.binary("-", _S.read(_v29, "fr"), _S.invoke(_S.read(_v29, "R"), "range", [4, 12])), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [1, 3])), _S.invoke(_S.read(_v29, "R"), "range", [40, 80]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0, 6])), _S.invoke(_S.read(_v29, "R"), "range", [0.08, 0.14]), (_S.prop(_S.read(_v29, "C"), 6) if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.5])) else _S.read(_v29, "WHITE"))])
		if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.3])):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "FLAKE"), _S.read(_v29, "fr"), _S.unary("-", 1), _S.invoke(_S.read(_v29, "R"), "range", [10, 50]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [20, 70])), _S.invoke(_S.read(_v29, "R"), "range", [0.5, 0.9]), (_S.read(_v29, "WHITE") if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.5])) else _S.prop(_S.read(_v29, "C"), 6)), _S.invoke(_S.read(_v29, "R"), "range", [0.5, 1.2])])
		if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.12])):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "VAPOUR"), _S.read(_v29, "fr"), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0, 3])), _S.invoke(_S.read(_v29, "R"), "range", [20, 60]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [2, 10])), _S.invoke(_S.read(_v29, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v29, "C"), 6), _S.invoke(_S.read(_v29, "R"), "range", [1.6, 2.8])])
	for _v30 in _S.array(_S.read(_e, "clusters")):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "c", _v30)
		var _v32 = _S.scope(_v31)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v32, "c"), "up"), func(): return _S.binary("<", _S.read(_v32, "t"), _S.prop(_S.read(_v32, "c"), "t0")))):
			continue
		_S.set_prop(_S.read(_v32, "c"), "up", true, "=", false)
		_S.define(_v32, "big", _S.binary("===", _S.read(_v32, "c"), _S.read(_v32, "crest")))
		_S.define(_v32, "n", _S.binary("+", 3, _S.invoke(_S.read(_v32, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v32, "c"), "H"), 8)])))
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "i"), _S.read(_v33, "n"))):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v34, "Math"), "PI")), 2), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 1.1), 1])))
			_S.define(_v34, "sp", _S.binary("*", _S.invoke(_S.read(_v34, "R"), "range", [60, 190]), _S.binary("+", 0.45, _S.binary("/", _S.prop(_S.read(_v34, "c"), "H"), 44))))
			_S.invoke(_S.read(_v34, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v34, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v34, "c"), "x"), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", 1)}, {"vx": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), 25)}, {"vy": _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.read(_v34, "sp"))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.1])}, {"a": _S.invoke(_S.read(_v34, "R"), "range", [0, _S.read(_v34, "TAU")])}, {"va": _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v34, "R"), "range", [1.2, 3])}, {"c": _S.prop(_S.read(_v34, "C"), _S.invoke(_S.read(_v34, "R"), "int", [5, 7]))}])])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "i", 1, "+=", true)
		_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "VAPOUR"), _S.prop(_S.read(_v32, "c"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 10), 40]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [2, 10])), _S.invoke(_S.read(_v32, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v32, "C"), 6), _S.binary("*", _S.invoke(_S.read(_v32, "R"), "range", [2.2, 3.4]), _S.binary("+", 0.6, _S.binary("/", _S.prop(_S.read(_v32, "c"), "H"), 60)))])
		var _v35 = _S.scope(_v32)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), 2)):
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "FLAKE"), _S.binary("+", _S.prop(_S.read(_v35, "c"), "x"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [2, _S.binary("*", _S.prop(_S.read(_v35, "c"), "H"), 0.5)])), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 20), 40]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [20, 60])), _S.invoke(_S.read(_v35, "R"), "range", [0.6, 1.1]), (_S.read(_v35, "WHITE") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.5])) else _S.prop(_S.read(_v35, "C"), 6)), _S.invoke(_S.read(_v35, "R"), "range", [0.5, 1.3])])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v32, "c"), "H"), 16)):
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v32, "c"), "x"), _S.prop(_S.prop(_S.read(_v32, "c"), "main"), "lean")), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v32, "c"), "H")), 0.96), 0, _S.unary("-", 4), _S.invoke(_S.read(_v32, "R"), "range", [0.3, 0.5]), _S.read(_v32, "WHITE"), _S.invoke(_S.read(_v32, "R"), "range", [1.4, 2.6]), 0.08])
		_S.invoke(_S.read(_v32, "lights"), "add", [_S.prop(_S.read(_v32, "c"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v32, "c"), "H")), 0.4), _S.binary("+", 16, _S.binary("*", _S.prop(_S.read(_v32, "c"), "H"), 0.6)), _S.prop(_S.read(_v32, "C"), 5), 0.5, 0.18])
		if _S.truth(_S.read(_v32, "big")):
			var _v36 = _S.scope(_v32)
			_S.invoke(_S.read(_v36, "lights"), "add", [_S.prop(_S.read(_v36, "c"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v36, "c"), "H")), 0.5), 54, _S.read(_v36, "WHITE"), 0.5, 0.14])
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v37, "i"), 4)):
				_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "VAPOUR"), _S.binary("+", _S.prop(_S.read(_v37, "c"), "x"), _S.invoke(_S.read(_v37, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v37, "R"), "range", [0, 4])), _S.invoke(_S.read(_v37, "R"), "range", [_S.unary("-", 40), 60]), _S.unary("-", _S.invoke(_S.read(_v37, "R"), "range", [4, 16])), _S.invoke(_S.read(_v37, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v37, "C"), 6), _S.invoke(_S.read(_v37, "R"), "range", [3, 4.5])])
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "START"), _S.read(_e, "RUN"))), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "TREMBLE"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.09]))):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "c", _S.invoke(_S.read(_v38, "R"), "pick", [_S.read(_v38, "clusters")]))
		_S.define(_v38, "b", _S.invoke(_S.read(_v38, "R"), "pick", [_S.prop(_S.read(_v38, "c"), "blades")]))
		_S.define(_v38, "s", _S.call_value(_S.read(_v38, "pose"), [_S.read(_v38, "c"), _S.read(_v38, "b")]))
		_S.define(_v38, "u", _S.invoke(_S.read(_v38, "R"), "range", [0.3, 0.95]))
		_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v38, "s"), "x"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v38, "s"), "tx"), _S.prop(_S.read(_v38, "s"), "x")), _S.read(_v38, "u"))), _S.binary("*", _S.prop(_S.read(_v38, "s"), "ty"), _S.read(_v38, "u")), 0, _S.unary("-", 3), _S.invoke(_S.read(_v38, "R"), "range", [0.25, 0.5]), (_S.read(_v38, "WHITE") if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.6])) else _S.prop(_S.read(_v38, "C"), 6)), _S.invoke(_S.read(_v38, "R"), "range", [0.6, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "trembled")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "TREMBLE")))):
		var _v39 = _S.scope(_e)
		_S.write(_v39, "trembled", true, "=", false)
		for _v40 in _S.array(_S.read(_v39, "clusters")):
			var _v41 = _S.scope(_v39)
			_S.define(_v41, "c", _v40)
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v42, "i"), 2)):
				_S.invoke(_S.read(_v42, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v42, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v42, "c"), "x"), _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 4), 4]))}, {"y": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [4, _S.binary("*", _S.prop(_S.read(_v42, "c"), "H"), 0.8)]))}, {"vx": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 20), 20])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [0, 30]))}, {"g": 0.8}, {"drag": 0.5}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v42, "R"), "range", [0.3, 0.6])}, {"a": _S.invoke(_S.read(_v42, "R"), "range", [0, _S.read(_v42, "TAU")])}, {"va": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v42, "R"), "range", [1, 1.8])}, {"c": _S.prop(_S.read(_v42, "C"), _S.invoke(_S.read(_v42, "R"), "int", [5, 7]))}])])
				_v42 = _S.iteration(_v42)
				_S.write(_v42, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broke")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHATTER")))):
		var _v43 = _S.scope(_e)
		_S.write(_v43, "broke", true, "=", false)
		for _v44 in _S.array(_S.read(_v43, "clusters")):
			var _v45 = _S.scope(_v43)
			_S.define(_v45, "c", _v44)
			var _v46 = _S.scope(_v45)
			for _v47 in _S.array(_S.prop(_S.read(_v46, "c"), "blades")):
				var _v48 = _S.scope(_v46)
				_S.define(_v48, "b", _v47)
				_S.call_value(_S.read(_v48, "breakBlade"), [_S.read(_v48, "c"), _S.read(_v48, "b")])
			var _v49 = _S.scope(_v46)
			_S.define(_v49, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v49, "i"), 2)):
				_S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "VAPOUR"), _S.binary("+", _S.prop(_S.read(_v49, "c"), "x"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [1, 8])), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 30), 50]), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [4, 18])), _S.invoke(_S.read(_v49, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v49, "C"), 6), _S.binary("*", _S.invoke(_S.read(_v49, "R"), "range", [2.4, 4]), _S.binary("+", 0.7, _S.binary("/", _S.prop(_S.read(_v49, "c"), "H"), 60)))])
				_v49 = _S.iteration(_v49)
				_S.write(_v49, "i", 1, "+=", true)
			if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [0.7])):
				_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v46, "c"), "x"), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [4, _S.prop(_S.read(_v46, "c"), "H")])), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [6, 20])), _S.invoke(_S.read(_v46, "R"), "range", [0.4, 0.8]), (_S.read(_v46, "WHITE") if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [0.5])) else _S.prop(_S.read(_v46, "C"), 6)), _S.invoke(_S.read(_v46, "R"), "range", [1, 2.2])])
			var _v50 = _S.scope(_v46)
			_S.define(_v50, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v50, "i"), 2)):
				_S.invoke(_S.read(_v50, "ps"), "spawn", [_S.prop(_S.read(_v50, "P"), "FLAKE"), _S.binary("+", _S.prop(_S.read(_v50, "c"), "x"), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v50, "R"), "range", [4, _S.prop(_S.read(_v50, "c"), "H")])), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 30), 60]), _S.unary("-", _S.invoke(_S.read(_v50, "R"), "range", [30, 90])), _S.invoke(_S.read(_v50, "R"), "range", [0.9, 1.5]), (_S.read(_v50, "WHITE") if _S.truth(_S.invoke(_S.read(_v50, "R"), "chance", [0.6])) else _S.prop(_S.read(_v50, "C"), 6)), _S.invoke(_S.read(_v50, "R"), "range", [0.5, 1.5])])
				_v50 = _S.iteration(_v50)
				_S.write(_v50, "i", 1, "+=", true)
			_S.invoke(_S.read(_v46, "lights"), "add", [_S.prop(_S.read(_v46, "c"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v46, "c"), "H")), 0.5), _S.binary("+", 22, _S.prop(_S.read(_v46, "c"), "H")), _S.read(_v46, "WHITE"), 0.45, 0.12])
		var _v51 = _S.scope(_v43)
		_S.define(_v51, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v51, "i"), 5)):
			_S.invoke(_S.read(_v51, "lights"), "add", [_S.binary("/", _S.binary("*", _S.read(_v51, "REACH"), _S.binary("+", _S.read(_v51, "i"), 0.5)), 5), _S.unary("-", 18), 40, _S.prop(_S.read(_v51, "C"), 4), 0.4, 0.5])
			_v51 = _S.iteration(_v51)
			_S.write(_v51, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "broke"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHATTER"), 0.8))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1])), func(): return _S.prop(_S.prop(_S.read(_e, "bits"), "list"), "length"))):
		var _v52 = _S.scope(_e)
		_S.define(_v52, "b", _S.invoke(_S.read(_v52, "R"), "pick", [_S.prop(_S.read(_v52, "bits"), "list")]))
		_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "STAR"), _S.prop(_S.read(_v52, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v52, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v52, "R"), "range", [0.2, 0.4]), (_S.read(_v52, "WHITE") if _S.truth(_S.invoke(_S.read(_v52, "R"), "chance", [0.5])) else _S.prop(_S.read(_v52, "C"), 6)), _S.invoke(_S.read(_v52, "R"), "range", [0.6, 1.5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_drawFrost = _S.read(_parent,"drawFrost")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawFrost,[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_drawClusters = _S.read(_parent,"drawClusters")
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_t = _S.read(_parent,"t")
	var _n_START = _S.read(_parent,"START")
	var _n_front = _S.read(_parent,"front")
	var _n_C = _S.read(_parent,"C")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_SHATTER = _S.read(_parent,"SHATTER")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_clusters = _S.read(_parent,"clusters")
	var _n_panes = _S.read(_parent,"panes")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawClusters,[_n_p_b0])
	var _n_k_b1 = ((1 - _S.MathFX.smooth(_n_MELT,(_n_MELT + 0.9),_n_t)) * _S.MathFX.smooth(_n_START,(_n_START + 0.3),_n_t))
	var _n_fr_b2 = _S.call_value(_n_front,[_n_t])
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 6)):
			_S.invoke(_n_p_b0,"glow",[(float((_n_fr_b2 * (_n_i_b3 + 0.5)))/6), (-3), 26, _S.index_value(_n_C,4), (0.15 * _n_k_b1)])
			_n_i_b3 += 1.0
	if _S.truth(((_n_t < (_n_SHATTER + 0.1)) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))):
		for _iter_0 in _S.array(_n_clusters):
			var _n_c_b4 = _iter_0
			_S.call_value(_n_sparkle,[_n_p_b0, (_S.named_value(_n_c_b4,"x") + _S.named_value(_S.named_value(_n_c_b4,"main"),"lean")), (-_S.named_value(_n_c_b4,"H")), (6 * (1 - clampf((float((_n_t - _n_FLASH))/0.16),0.0,1.0))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.4])
	_S.invoke(_n_panes,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
