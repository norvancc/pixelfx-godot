@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/healing-bloom.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "cross", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Healing bloom"}, {"desc": "A sprout pushes up and unfurls, a bud swells and opens round a glowing golden heart in a flare of healing light; its petals lift away one by one as motes."}, {"tags": ["nature", "heal", "flower", "plant", "buff", "ground", "one-shot"]}, {"size": [124, 120]}, {"origin": [62, 108]}, {"duration": 3.3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0c1a10", "#173a1a", "#24582a", "#357a34", "#52a03e", "#86c84e", "#c4ec7a", "#f4ffd0"]}, {"petal": ["#4a1a3a", "#a8406e", "#ec8ab0", "#ffd8e8"]}, {"heart": ["#a8641a", "#f0b42e", "#ffe680", "#fffbe0"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STEM", 0.42)
	_S.define(_e, "BUD", 0.75)
	_S.define(_e, "OPEN", 1.05)
	_S.define(_e, "LIFT", 1.7)
	_S.define(_e, "WILT", 2.4)
	_S.define(_e, "H", 36)
	_S.define(_e, "NPET", 6)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_glint_b6 = _S.arg(_args,6)
	var _n_X_b7 = floori(_n_x_b1+0.5)
	var _n_Y_b8 = floori(_n_y_b2+0.5)
	var _n_ins_b9 = _S.function_value(_S.capture(_parent,{"L":_n_L_b3,"this":_this}),"_f1")
	if true:
		var _n_dy_b10 = ((-_n_L_b3) - 1)
		while _S.truth((_n_dy_b10 <= (_n_L_b3 + 1))):
			if true:
				var _n_dx_b11 = ((-_n_L_b3) - 1)
				while _S.truth((_n_dx_b11 <= (_n_L_b3 + 1))):
					if _S.truth(_S.call_value(_n_ins_b9,[_n_dx_b11, _n_dy_b10])):
						_S.invoke(_n_p_b0,"dot",[(_n_X_b7 + _n_dx_b11), (_n_Y_b8 + _n_dy_b10), (_n_WHITE if _S.truth((not _S.truth(_n_dy_b10) if _S.truth((not _S.truth(_n_dx_b11) if _S.truth(_n_glint_b6) else _n_glint_b6)) else (not _S.truth(_n_dx_b11) if _S.truth(_n_glint_b6) else _n_glint_b6))) else (_S.index_value(_n_C_b4,6) if _S.truth(((_n_dy_b10 < 0) if _S.truth((_n_dy_b10 < 0)) else (_n_dx_b11 < 0))) else _S.index_value(_n_C_b4,5))), _n_a_b5])
					else:
						if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_ins_b9,[(_n_dx_b11 - 1), _n_dy_b10]),func():return _S.call_value(_n_ins_b9,[(_n_dx_b11 + 1), _n_dy_b10])),func():return _S.call_value(_n_ins_b9,[_n_dx_b11, (_n_dy_b10 - 1)])),func():return _S.call_value(_n_ins_b9,[_n_dx_b11, (_n_dy_b10 + 1)])) if _S.truth((_n_L_b3 > 1)) else (_n_L_b3 > 1))):
							_S.invoke(_n_p_b0,"dot",[(_n_X_b7 + _n_dx_b11), (_n_Y_b8 + _n_dy_b10), _S.index_value(_n_C_b4,2), (_n_a_b5 * 0.8)])
					_n_dx_b11 += 1.0
			_n_dy_b10 += 1.0
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (5 + (_n_L_b3 * 2)), _S.index_value(_n_C_b4,6), (0.35 * _n_a_b5)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	return _S.logical("||",((absf(_n_dy_b1) <= _n_L) if _S.truth(_S.binary("===",_n_dx_b0,0)) else _S.binary("===",_n_dx_b0,0)),func():return ((absf(_n_dx_b0) <= _n_L) if _S.truth(_S.binary("===",_n_dy_b1,0)) else _S.binary("===",_n_dy_b1,0)))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "petal", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Pt", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "petal"), 4]))
	_S.define(_e, "Ht", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "heart"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "Ht"), 3), _S.prop(_S.read(_e, "Ht"), 2), _S.prop(_S.read(_e, "Ht"), 1), _S.prop(_S.read(_e, "Ht"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flying", [])
	_S.define(_e, "glyphs", [])
	_S.define(_e, "petals", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NPET")}]), _S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "sprouted", false)
	_S.define(_e, "grow", _S.function_value(_e, "_f6"))
	_S.define(_e, "sway", _S.function_value(_e, "_f7"))
	_S.define(_e, "stem", _S.function_value(_e, "_f8"))
	_S.define(_e, "open", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_open = _S.read(_parent,"open")
	var _n_Pt = _S.read(_parent,"Pt")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_top_b2 = _S.arg(_args,2)
	var _n_op_b3 = _S.call_value(_n_open,[])
	var _n_e_b4 = _S.numeric_lerp(0.15,((float(PI)/2) - 0.2),_n_op_b3)
	var _n_dx_b5 = (sin(_n_e_b4) * cos(_S.named_value(_n_q_b1,"az")))
	var _n_dz_b6 = (sin(_n_e_b4) * sin(_S.named_value(_n_q_b1,"az")))
	var _n_dy_b7 = (-cos(_n_e_b4))
	var _n_L_b8 = _S.numeric_lerp(8,12,_n_op_b3)
	var _n_len_b9 = (_n_L_b8 * _S.Bridge.hypot([_n_dx_b5, _n_dy_b7]))
	var _n_ang_b10 = atan2(_n_dy_b7,_n_dx_b5)
	var _n_back_b11 = (_n_dz_b6 < 0)
	var _n_cy_b12 = (_S.index_value(_n_top_b2,1) - 3)
	if _S.truth((_n_len_b9 < 1.5)):
		return null
	_S.call_value(_n_drawLeaf,[_n_p_b0, (_S.index_value(_n_top_b2,0) + ((_n_dx_b5 * _n_L_b8) * 0.5)), (_n_cy_b12 + ((_n_dy_b7 * _n_L_b8) * 0.5)), (_n_len_b9 + 1), (3 + ((1 - absf(_n_dz_b6)) * 0.8)), _n_ang_b10, (0.9 if _S.truth(_n_back_b11) else 0.2), ([_S.index_value(_n_Pt,0), _S.index_value(_n_Pt,0), _S.index_value(_n_Pt,1), _S.index_value(_n_Pt,2)] if _S.truth(_n_back_b11) else [_S.index_value(_n_Pt,0), _S.index_value(_n_Pt,1), _S.index_value(_n_Pt,2), _S.index_value(_n_Pt,3)])])
	return null

static func _f4(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_NPET = _S.read(_parent,"NPET")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"az":(((float(_n_i_b1)/_n_NPET) * _n_TAU) + 0.3),"off":fmod((_n_i_b1 * 0.7),1),"gone":false,"at":(_n_LIFT + (fmod((_n_i_b1 * 0.37),1) * 0.55))}
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_STEM = _S.read(_parent,"STEM")
	var _n_WILT = _S.read(_parent,"WILT")
	return (_S.invoke(_n_ease,"outCubic",[clampf((float(_n_t)/_n_STEM),0.0,1.0)]) * (1 - _S.invoke(_n_ease,"inCubic",[clampf((float((_n_t - _n_WILT))/0.6),0.0,1.0)])))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	return ((sin((_n_t * 2.6)) * 1.4) * _S.MathFX.smooth(0.2,0.6,_n_t))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_grow = _S.read(_parent,"grow")
	var _n_sway = _S.read(_parent,"sway")
	var _n_H = _S.read(_parent,"H")
	var _n_g_b0 = _S.call_value(_n_grow,[])
	var _n_pts_b1 = []
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 <= 12)):
			var _n_s_b3 = (float(_n_i_b2)/12)
			_S.invoke(_n_pts_b1,"push",[[(((sin((_n_s_b3 * 3.2)) * 2.2) * _n_s_b3) + ((_S.call_value(_n_sway,[]) * _n_s_b3) * _n_s_b3)), ((((1 - _n_g_b0) * _n_H) * 1.1) - (_n_s_b3 * _n_H))]])
			_n_i_b2 += 1.0
	return _n_pts_b1
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_BUD = _S.read(_parent,"BUD")
	var _n_OPEN = _S.read(_parent,"OPEN")
	return _S.invoke(_n_ease,"outBack",[clampf((float((_n_t - _n_BUD))/(_n_OPEN - _n_BUD)),0.0,1.0), 1.4])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	_S.define(_e, "top", _S.prop(_S.call_value(_S.read(_e, "stem"), []), 12))
	if _S.truth(_S.unary("!", _S.read(_e, "sprouted"))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "sprouted", true, "=", false)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 8)):
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "GRIT"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [40, 100])), _S.invoke(_S.read(_v6, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 2), _S.prop(_S.read(_v6, "C"), 3)]]), 1])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v7 = _S.scope(_v5)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 3)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "DUST"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v7, "R"), "sign", []), _S.invoke(_S.read(_v7, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [4, 10])), _S.invoke(_S.read(_v7, "R"), "range", [0.4, 0.6]), _S.prop(_S.read(_v7, "C"), 3), _S.invoke(_S.read(_v7, "R"), "range", [1.5, 2.5])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "STEM")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BUD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.3, _S.read(_e, "f"))]))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "R"), "range", [14, 26]))
		_S.define(_v8, "x", _S.binary("+", _S.prop(_S.read(_v8, "top"), 0), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d"))))
		_S.define(_v8, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v8, "top"), 1), 3), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d")), 0.8)))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "STREAK"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v8, "top"), 0), _S.read(_v8, "x")), 3.4), _S.binary("*", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v8, "top"), 1), 3), _S.read(_v8, "y")), 3.4), _S.invoke(_S.read(_v8, "R"), "range", [0.18, 0.26]), (_S.prop(_S.read(_v8, "Ht"), 2) if _S.truth(_S.invoke(_S.read(_v8, "R"), "chance", [0.5])) else _S.prop(_S.read(_v8, "C"), 6))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.12)))):
		var _v9 = _S.scope(_e)
		_S.write(_v9, "popped", true, "=", false)
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "top"), 0), _S.binary("-", _S.prop(_S.read(_v9, "top"), 1), 3), 22, _S.read(_v9, "WHITE"), 0.45, 0.08])
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "top"), 0), _S.binary("-", _S.prop(_S.read(_v9, "top"), 1), 3), 70, _S.prop(_S.read(_v9, "Ht"), 2), 0.5, 0.8])
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 16)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
			_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [40, 120]))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "MOTE"), _S.prop(_S.read(_v11, "top"), 0), _S.binary("-", _S.prop(_S.read(_v11, "top"), 1), 3), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 20), _S.invoke(_S.read(_v11, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v11, "Ht"), 3) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 7)), 0.7])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v12 = _S.scope(_v9)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 5)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v12, "top"), 0), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 10), 10])), _S.binary("-", _S.prop(_S.read(_v12, "top"), 1), _S.invoke(_S.read(_v12, "R"), "range", [0, 14])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v12, "Ht"), 3), _S.invoke(_S.read(_v12, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v12, "R"), "range", [0, 0.3])])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WILT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.13, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "glyphs"), "push", [_S.merge([{"x": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 22), 22])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 36]))}, {"t0": _S.read(_e, "t")}, {"life": _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.7, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))])}, {"L": (3 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.35])) else 2)}, {"seed": _S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), 9)}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WILT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.35, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "EMBER"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 8])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [25, 55])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.6, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))]), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.6])) else _S.prop(_S.read(_e, "Ht"), 2)), (2 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 1)])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.read(_v13, "glyphs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v13, "t"), _S.prop(_S.prop(_S.read(_v13, "glyphs"), _S.read(_v13, "i")), "t0")), _S.prop(_S.prop(_S.read(_v13, "glyphs"), _S.read(_v13, "i")), "life"))):
			_S.invoke(_S.read(_v13, "glyphs"), "splice", [_S.read(_v13, "i"), 1])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	for _v14 in _S.array(_S.read(_e, "petals")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "q", _v14)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v15, "q"), "gone")), func(): return _S.binary(">=", _S.read(_v15, "t"), _S.prop(_S.read(_v15, "q"), "at")))):
			var _v16 = _S.scope(_v15)
			_S.set_prop(_S.read(_v16, "q"), "gone", true, "=", false)
			_S.define(_v16, "e", _S.binary("-", _S.binary("/", _S.prop(_S.read(_v16, "Math"), "PI"), 2), 0.15))
			_S.define(_v16, "dx", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "e")]), _S.invoke(_S.read(_v16, "Math"), "cos", [_S.prop(_S.read(_v16, "q"), "az")])))
			_S.define(_v16, "L", 10)
			_S.invoke(_S.read(_v16, "flying"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v16, "top"), 0), _S.binary("*", _S.binary("*", _S.read(_v16, "dx"), _S.read(_v16, "L")), 0.6))}, {"y": _S.binary("-", _S.binary("-", _S.prop(_S.read(_v16, "top"), 1), 3), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "e")]), _S.read(_v16, "L")), 0.6))}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v16, "dx"), 30), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 10), 10]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [25, 45]))}, {"a": _S.invoke(_S.read(_v16, "Math"), "atan2", [_S.unary("-", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "e")])), _S.read(_v16, "dx")])}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 5), 5])}, {"fl": 0}, {"vf": _S.invoke(_S.read(_v16, "R"), "range", [5, 9])}, {"life": _S.invoke(_S.read(_v16, "Math"), "min", [_S.invoke(_S.read(_v16, "R"), "range", [0.75, 1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v16, "meta"), "duration"), 0.45), _S.read(_v16, "t"))])}, {"max": 0}])])
			_S.set_prop(_S.prop(_S.read(_v16, "flying"), _S.binary("-", _S.prop(_S.read(_v16, "flying"), "length"), 1)), "max", _S.prop(_S.prop(_S.read(_v16, "flying"), _S.binary("-", _S.prop(_S.read(_v16, "flying"), "length"), 1)), "life"), "=", false)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.binary("-", _S.prop(_S.read(_v17, "flying"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v17, "i"), 0)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "q", _S.prop(_S.read(_v18, "flying"), _S.read(_v18, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v18, "q"), "life", _S.read(_v18, "dt"), "-=", false), 0)):
			var _v19 = _S.scope(_v18)
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "STAR"), _S.prop(_S.read(_v19, "q"), "x"), _S.prop(_S.read(_v19, "q"), "y"), 0, _S.unary("-", 8), _S.invoke(_S.read(_v19, "Math"), "min", [0.35, _S.binary("-", _S.binary("-", _S.prop(_S.read(_v19, "meta"), "duration"), 0.05), _S.read(_v19, "t"))]), _S.prop(_S.read(_v19, "Pt"), 3), 1.8])
			_S.invoke(_S.read(_v19, "flying"), "splice", [_S.read(_v19, "i"), 1])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v18, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), 1.5), _S.read(_v18, "dt")), "-=", false)
		_S.set_prop(_S.read(_v18, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), 0.8), _S.read(_v18, "dt")), _S.binary("*", 10, _S.read(_v18, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v18, "q"), "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), _S.read(_v18, "dt")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.prop(_S.read(_v18, "q"), "fl")]), 12), _S.read(_v18, "dt"))), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "y", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "a", _S.binary("*", _S.prop(_S.read(_v18, "q"), "va"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "fl", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vf"), _S.read(_v18, "dt")), "+=", false)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_t = _S.read(_parent,"t")
	var _n_WILT = _S.read(_parent,"WILT")
	var _n_stem = _S.read(_parent,"stem")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_Ht = _S.read(_parent,"Ht")
	var _n_band = _S.read(_parent,"band")
	var _n_BUD = _S.read(_parent,"BUD")
	var _n_petal = _S.read(_parent,"petal")
	var _n_petals = _S.read(_parent,"petals")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_bloom_b1 = (_S.MathFX.smooth((_n_OPEN - 0.15),(_n_OPEN + 0.2),_n_t) * (1 - _S.MathFX.smooth((_n_WILT - 0.2),(_n_WILT + 0.5),_n_t)))
	var _n_top_b2 = _S.index_value(_S.call_value(_n_stem,[]),12)
	if true:
		var _n_h_b5 = 0
		while _S.truth((_n_h_b5 < 70)):
			_S.invoke(_n_p_b0,"glow",[0, (-_n_h_b5), 22, _S.index_value(_n_C,5), ((0.12 * _n_bloom_b1) * (1 - (float(_n_h_b5)/80)))])
			_n_h_b5 += 7
	var _n_k_b3 = clampf((float(((_n_t - _n_OPEN) + 0.12))/0.6),0.0,1.0)
	if _S.truth(((_n_k_b3 < 1) if _S.truth((_n_k_b3 > 0)) else (_n_k_b3 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (6 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b3]))), 0.18, maxf(1,(3 * (1 - _n_k_b3))), (1.1 - _n_k_b3), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_Ht,2), _S.index_value(_n_Ht,3)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	var _n_fw_b4 = (6 + (16 * _S.MathFX.smooth(0,0.8,_n_t)))
	if true:
		var _n_x_b6 = floori((-_n_fw_b4))
		while _S.truth((_n_x_b6 <= _n_fw_b4)):
			var _n_u_b7 = (float(absf(_n_x_b6))/_n_fw_b4)
			var _n_a_b8 = ((sqrt((1 - _n_u_b7)) * _S.MathFX.smooth(0,0.4,_n_t)) * (1 - _S.MathFX.smooth(_n_WILT,(_n_WILT + 0.6),_n_t)))
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, 0, (_S.index_value(_n_C,6) if _S.truth((_n_u_b7 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b7 < 0.65)) else _S.index_value(_n_C,4))), _n_a_b8])
			if _S.truth(_S.binary("===",fmod(_n_x_b6,5),0)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b6, 0, 8, _S.index_value(_n_C,5), ((0.2 * _n_a_b8) * (1 - _n_u_b7))])
			_n_x_b6 += 1.0
	if _S.truth((_n_t > (_n_BUD - 0.05))):
		for _iter_0 in _S.array(_n_petals):
			var _n_q_b9 = _iter_0
			if _S.truth(_S.logical("&&",(sin(_S.named_value(_n_q_b9,"az")) < 0),func():return not _S.truth(_S.named_value(_n_q_b9,"gone")))):
				_S.call_value(_n_petal,[_n_p_b0, _n_q_b9, _n_top_b2])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_stem = _S.read(_parent,"stem")
	var _n_grow = _S.read(_parent,"grow")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_WILT = _S.read(_parent,"WILT")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_STEM = _S.read(_parent,"STEM")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_BUD = _S.read(_parent,"BUD")
	var _n_Ht = _S.read(_parent,"Ht")
	var _n_petal = _S.read(_parent,"petal")
	var _n_petals = _S.read(_parent,"petals")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_Pt = _S.read(_parent,"Pt")
	var _n_flying = _S.read(_parent,"flying")
	var _n_cross = _S.read(_parent,"cross")
	var _n_glyphs = _S.read(_parent,"glyphs")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.call_value(_n_stem,[])
	var _n_top_b2 = _S.index_value(_n_pts_b1,12)
	var _n_g_b3 = _S.call_value(_n_grow,[])
	if _S.truth((_n_g_b3 > 0.02)):
		if true:
			var _n_i_b5 = 1
			while _S.truth((_n_i_b5 < _S.prop(_n_pts_b1,"length"))):
				var _tuple_0 = _S.index_value(_n_pts_b1,(_n_i_b5 - 1))
				var _n_x0_b6 = _S.prop(_tuple_0,0)
				var _n_y0_b7 = _S.prop(_tuple_0,1)
				var _tuple_1 = _S.index_value(_n_pts_b1,_n_i_b5)
				var _n_x1_b8 = _S.prop(_tuple_1,0)
				var _n_y1_b9 = _S.prop(_tuple_1,1)
				if _S.truth((_n_y1_b9 > 0)):
					_n_i_b5 += 1.0
					continue
				_S.invoke(_n_p_b0,"line",[_n_x0_b6, _n_y0_b7, _n_x1_b8, _n_y1_b9, _S.index_value(_n_C,5)])
				_S.invoke(_n_p_b0,"line",[(_n_x0_b6 + 1), _n_y0_b7, (_n_x1_b8 + 1), _n_y1_b9, _S.index_value(_n_C,3)])
				_n_i_b5 += 1.0
		for _iter_2 in _S.array([[4, (-1), 0.1], [7, 1, 0.22]]):
			var _tuple_3 = _iter_2
			var _n_i_b10 = _S.prop(_tuple_3,0)
			var _n_sd_b11 = _S.prop(_tuple_3,1)
			var _n_d_b12 = _S.prop(_tuple_3,2)
			var _n_lk_b13 = (_S.invoke(_n_ease,"outBack",[clampf((float(((_n_t - _n_d_b12) - 0.12))/0.3),0.0,1.0), 1.6]) * (1 - (_S.MathFX.smooth(_n_WILT,(_n_WILT + 0.5),_n_t) * 0.4)))
			var _tuple_4 = _S.index_value(_n_pts_b1,_n_i_b10)
			var _n_x_b14 = _S.prop(_tuple_4,0)
			var _n_y_b15 = _S.prop(_tuple_4,1)
			if _S.truth(((_n_lk_b13 <= 0) if _S.truth((_n_lk_b13 <= 0)) else (_n_y_b15 > (-1)))):
				continue
			var _n_la_b16 = (((-2.6) + (0.4 * (1 - _n_lk_b13))) if _S.truth((_n_sd_b11 < 0)) else ((-0.55) - (0.4 * (1 - _n_lk_b13))))
			_S.call_value(_n_drawLeaf,[_n_p_b0, (_n_x_b14 + ((cos(_n_la_b16) * 6) * _n_lk_b13)), (_n_y_b15 + ((sin(_n_la_b16) * 6) * _n_lk_b13)), (12 * _n_lk_b13), 3.4, _n_la_b16, 0.25, [_S.index_value(_n_C,1), _S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6)]])
		if _S.truth(((_n_t < (_n_OPEN - 0.1)) if _S.truth((_n_t > (_n_STEM - 0.1))) else (_n_t > (_n_STEM - 0.1)))):
			var _n_b_b17 = clampf((float(((_n_t - _n_STEM) + 0.1))/(_n_BUD - _n_STEM)),0.0,1.0)
			var _n_w_b18 = (2 + (2.5 * _n_b_b17))
			var _n_h_b19 = (3.5 + (5 * _n_b_b17))
			_S.invoke(_n_p_b0,"ellipse",[_S.index_value(_n_top_b2,0), (_S.index_value(_n_top_b2,1) - (_n_h_b19 * 0.6)), _n_w_b18, _n_h_b19, _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
			_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_top_b2,0), (_S.index_value(_n_top_b2,1) - (_n_h_b19 * 0.6)), (8 + (8 * _n_b_b17)), _S.index_value(_n_Ht,2), (0.25 * _n_b_b17)])
	for _iter_5 in _S.array(_n_petals):
		var _n_q_b20 = _iter_5
		if _S.truth(_S.logical("&&",_S.logical("&&",(sin(_S.named_value(_n_q_b20,"az")) >= 0),func():return not _S.truth(_S.named_value(_n_q_b20,"gone"))),func():return (_n_t > (_n_BUD - 0.05)))):
			_S.call_value(_n_petal,[_n_p_b0, _n_q_b20, _n_top_b2])
	if _S.truth(((_n_t < (_n_WILT + 0.3)) if _S.truth((_n_t > (_n_OPEN - 0.12))) else (_n_t > (_n_OPEN - 0.12)))):
		var _n_pulse_b21 = (0.85 + (0.15 * sin((_n_t * 9))))
		var _n_k_b22 = (1 - _S.MathFX.smooth((_n_WILT - 0.3),(_n_WILT + 0.3),_n_t))
		var _n_cy_b23 = (_S.index_value(_n_top_b2,1) - 4)
		_S.invoke(_n_p_b0,"circle",[_S.index_value(_n_top_b2,0), _n_cy_b23, (3.3 * _n_k_b22), _S.index_value(_n_Ht,1)])
		_S.invoke(_n_p_b0,"circle",[(_S.index_value(_n_top_b2,0) - 0.5), (_n_cy_b23 - 0.5), (2.2 * _n_k_b22), _S.index_value(_n_Ht,2)])
		_S.invoke(_n_p_b0,"px",[(_S.index_value(_n_top_b2,0) - 1), (_n_cy_b23 - 1), _S.index_value(_n_Ht,3)])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_top_b2,0), _n_cy_b23, (16 * _n_pulse_b21), _S.index_value(_n_Ht,2), (0.5 * _n_k_b22)])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_top_b2,0), _n_cy_b23, 34, _S.index_value(_n_C,5), (0.2 * _n_k_b22)])
	var _n_e_b4 = ((_n_t - _n_OPEN) + 0.12)
	if _S.truth(((_n_e_b4 < 0.16) if _S.truth((_n_e_b4 > 0)) else (_n_e_b4 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, _S.index_value(_n_top_b2,0), (_S.index_value(_n_top_b2,1) - 3), (10 * (1 - (float(_n_e_b4)/0.16))), _S.index_value(_n_Ht,3), _S.index_value(_n_Ht,2), 0.6])
	for _iter_6 in _S.array(_n_flying):
		var _n_q_b24 = _iter_6
		_S.call_value(_n_drawLeaf,[_n_p_b0, _S.named_value(_n_q_b24,"x"), _S.named_value(_n_q_b24,"y"), 6, 2.2, _S.named_value(_n_q_b24,"a"), _S.named_value(_n_q_b24,"fl"), [_S.index_value(_n_Pt,0), _S.index_value(_n_Pt,1), _S.index_value(_n_Pt,2), _S.index_value(_n_Pt,3)], minf(1,(float(_S.named_value(_n_q_b24,"life"))/0.3))])
	for _iter_7 in _S.array(_n_glyphs):
		var _n_q_b25 = _iter_7
		var _n_k_b26 = (float((_n_t - _S.named_value(_n_q_b25,"t0")))/_S.named_value(_n_q_b25,"life"))
		_S.call_value(_n_cross,[_n_p_b0, (_S.named_value(_n_q_b25,"x") + (sin(((_n_k_b26 * 5) + _S.named_value(_n_q_b25,"seed"))) * 2)), (_S.named_value(_n_q_b25,"y") - (_n_k_b26 * 24)), _S.named_value(_n_q_b25,"L"), _n_C, sin((PI * _n_k_b26)), (sin(((_n_k_b26 * 14) + _S.named_value(_n_q_b25,"seed"))) > 0.8)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_Pt = _S.read(_parent,"Pt")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_Pt,2) if _S.truth((cos(_n_a_b1) < (-0.2))) else (_S.index_value(_n_Pt,0) if _S.truth((_n_d_b0 > 0.7)) else _S.index_value(_n_Pt,1)))
	return null
