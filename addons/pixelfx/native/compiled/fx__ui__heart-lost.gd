@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/heart-lost.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "shadeAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawPart", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Heart lost"}, {"desc": "A HUD heart is hit: it flashes white and jolts, a crack runs down it, it splits into two halves that tumble away, leaving an empty socket that fades."}, {"tags": ["ui", "health", "heart", "hud", "damage", "one-shot"]}, {"size": [96, 88]}, {"origin": [48, 34]}, {"duration": 1.5}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0508", "#4a0b12", "#8c1420", "#d42a2e", "#ff5a4a", "#ff9a86", "#ffd8cc", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.14)
	_S.define(_e, "CRACK", 0.24)
	_S.define(_e, "SPLIT", 0.5)
	_S.define(_e, "MASK", ["....xxxx...xxxx....", "..xxxxxxx.xxxxxxx..", ".xxxxxxxxxxxxxxxxx.", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", ".xxxxxxxxxxxxxxxxx.", "..xxxxxxxxxxxxxxx..", "...xxxxxxxxxxxxx...", "....xxxxxxxxxxx....", ".....xxxxxxxxx.....", "......xxxxxxx......", ".......xxxxx.......", "........xxx........", ".........x........."])
	_S.define(_e, "MW", 19)
	_S.define(_e, "MH", 16)
	_S.define(_e, "OX", _S.unary("-", 9.5))
	_S.define(_e, "OY", _S.unary("-", 8))
	_S.define(_e, "inMask", _S.function_value(_e, "_f9"))
	_S.define(_e, "CRACK_X", [9, 9, 10, 9, 8, 8, 9, 10, 10, 9, 8, 9, 9, 10, 9, 9])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_j_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((_n_i_b1 - 9))/9.5)
	var _n_v_b4 = (float((_n_j_b2 - 7))/8)
	if _S.truth((not _S.truth((_S.binary("===",_n_j_b2,3) if _S.truth(_S.binary("===",_n_i_b1,4)) else _S.binary("===",_n_i_b1,4))) if _S.truth(((_S.binary("===",_n_j_b2,2) if _S.truth(_S.binary("===",_n_j_b2,2)) else _S.binary("===",_n_j_b2,3)) if _S.truth((_S.binary("===",_n_i_b1,3) if _S.truth(_S.binary("===",_n_i_b1,3)) else _S.binary("===",_n_i_b1,4))) else (_S.binary("===",_n_i_b1,3) if _S.truth(_S.binary("===",_n_i_b1,3)) else _S.binary("===",_n_i_b1,4)))) else ((_S.binary("===",_n_j_b2,2) if _S.truth(_S.binary("===",_n_j_b2,2)) else _S.binary("===",_n_j_b2,3)) if _S.truth((_S.binary("===",_n_i_b1,3) if _S.truth(_S.binary("===",_n_i_b1,3)) else _S.binary("===",_n_i_b1,4))) else (_S.binary("===",_n_i_b1,3) if _S.truth(_S.binary("===",_n_i_b1,3)) else _S.binary("===",_n_i_b1,4))))):
		return _n_WHITE
	if _S.truth((((_n_u_b3 + _n_v_b4) < (-0.75)) if _S.truth(((_n_j_b2 <= 5) if _S.truth(((_n_j_b2 >= 2) if _S.truth(((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2))) else ((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2)))) else ((_n_j_b2 >= 2) if _S.truth(((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2))) else ((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2))))) else ((_n_j_b2 <= 5) if _S.truth(((_n_j_b2 >= 2) if _S.truth(((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2))) else ((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2)))) else ((_n_j_b2 >= 2) if _S.truth(((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2))) else ((_n_i_b1 <= 5) if _S.truth((_n_i_b1 >= 2)) else (_n_i_b1 >= 2)))))):
		return _S.index_value(_n_C_b0,5)
	var _n_l_b5 = (-((_n_u_b3 * 0.55) + (_n_v_b4 * 0.65)))
	return (_S.index_value(_n_C_b0,4) if _S.truth((_n_l_b5 > 0.25)) else (_S.index_value(_n_C_b0,3) if _S.truth((_n_l_b5 > (-0.3))) else (_S.index_value(_n_C_b0,2) if _S.truth((_n_l_b5 > (-0.6))) else _S.index_value(_n_C_b0,1))))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_side_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.arg(_args,3)
	var _n_y_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_white_b6 = _S.arg(_args,6)
	var _n_crackK_b7 = _S.arg(_args,7)
	var _n_alpha_b8 = _S.arg(_args,8)
	var _n_ca_b9 = cos(_n_a_b5)
	var _n_sa_b10 = sin(_n_a_b5)
	var _n_px0_b11 = ((-4.5) if _S.truth((_n_side_b2 < 0)) else (4.5 if _S.truth((_n_side_b2 > 0)) else 0))
	var _n_py0_b12 = 0
	var _n_own_b13 = _S.function_value(_S.capture(_parent,{"side":_n_side_b2,"this":_this}),"_f2")
	_S.invoke(_n_p_b0,"shade",[(_n_x_b3 - 13), (_n_y_b4 - 13), (_n_x_b3 + 13), (_n_y_b4 + 13), _S.function_value(_S.capture(_parent,{"x":_n_x_b3,"y":_n_y_b4,"ca":_n_ca_b9,"sa":_n_sa_b10,"px0":_n_px0_b11,"py0":_n_py0_b12,"own":_n_own_b13,"alpha":_n_alpha_b8,"white":_n_white_b6,"C":_n_C_b1,"side":_n_side_b2,"crackK":_n_crackK_b7,"this":_this}),"_f3")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_inMask = _S.read(_parent,"inMask")
	var _n_side = _S.read(_parent,"side")
	var _n_CRACK_X = _S.read(_parent,"CRACK_X")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return _S.logical("&&",_S.call_value(_n_inMask,[_n_i_b0, _n_j_b1]),func():return (_S.binary("===",_n_side,0) if _S.truth(_S.binary("===",_n_side,0)) else ((_n_i_b0 < _S.index_value(_n_CRACK_X,_n_j_b1)) if _S.truth((_n_side < 0)) else (_n_i_b0 >= _S.index_value(_n_CRACK_X,_n_j_b1)))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_px0 = _S.read(_parent,"px0")
	var _n_py0 = _S.read(_parent,"py0")
	var _n_OX = _S.read(_parent,"OX")
	var _n_OY = _S.read(_parent,"OY")
	var _n_own = _S.read(_parent,"own")
	var _n_alpha = _S.read(_parent,"alpha")
	var _n_white = _S.read(_parent,"white")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_side = _S.read(_parent,"side")
	var _n_MH = _S.read(_parent,"MH")
	var _n_crackK = _S.read(_parent,"crackK")
	var _n_CRACK_X = _S.read(_parent,"CRACK_X")
	var _n_shadeAt = _S.read(_parent,"shadeAt")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_sx_b0 - _n_x)
	var _n_dy_b4 = (_n_sy_b1 - _n_y)
	var _n_lx_b5 = (((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa)) + _n_px0)
	var _n_ly_b6 = ((((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca)) + _n_py0)
	var _n_i_b7 = floori((_n_lx_b5 - _n_OX))
	var _n_j_b8 = floori((_n_ly_b6 - _n_OY))
	if _S.truth(not _S.truth(_S.call_value(_n_own,[_n_i_b7, _n_j_b8]))):
		return null
	_S.set_prop(_n_o_b2,"a",_n_alpha,"=")
	var _n_edge_b9 = _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_own,[(_n_i_b7 - 1), _n_j_b8])),func():return not _S.truth(_S.call_value(_n_own,[(_n_i_b7 + 1), _n_j_b8]))),func():return not _S.truth(_S.call_value(_n_own,[_n_i_b7, (_n_j_b8 - 1)]))),func():return not _S.truth(_S.call_value(_n_own,[_n_i_b7, (_n_j_b8 + 1)])))
	if _S.truth(_n_white):
		return (_S.index_value(_n_C,6) if _S.truth(_n_edge_b9) else _n_WHITE)
	if _S.truth(_n_edge_b9):
		return _S.index_value(_n_C,0)
	if _S.truth((((float(_n_j_b8)/_n_MH) < _n_crackK) if _S.truth(_S.binary("===",_n_side,0)) else _S.binary("===",_n_side,0))):
		if _S.truth(_S.binary("===",_n_i_b7,_S.index_value(_n_CRACK_X,_n_j_b8))):
			return _S.index_value(_n_C,0)
		if _S.truth(_S.binary("===",_n_i_b7,(_S.index_value(_n_CRACK_X,_n_j_b8) - 1))):
			return _S.index_value(_n_C,6)
	return _S.call_value(_n_shadeAt,[_n_C, _n_i_b7, _n_j_b8])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "SOCKET", [_S.call_value(_S.read(_e, "hex"), ["#0d0a14"]), _S.call_value(_S.read(_e, "hex"), ["#2a2338"]), _S.call_value(_S.read(_e, "hex"), ["#3c3350"])])
	_S.define(_e, "halves", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "split", false)
	_S.define(_e, "gone", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_s_b0 = _S.arg(_args,0)
	return {"s":_n_s_b0,"x":(_n_s_b0 * 4.5),"y":0,"vx":(_n_s_b0 * _S.invoke(_n_R,"range",[55, 70])),"vy":(-_S.invoke(_n_R,"range",[60, 80])),"a":0,"va":(_n_s_b0 * _S.invoke(_n_R,"range",[2.2, 3.2]))}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "hit", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, 0, 40, _S.prop(_S.read(_v1, "C"), 5), 0.6, 0.3])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 8)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "an", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [80, 170]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]), 9), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]), 7), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), 30), _S.invoke(_S.read(_v3, "R"), "range", [0.1, 0.22])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "split")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SPLIT")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "split", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 44, _S.read(_v4, "WHITE"), 0.6, 0.12])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 50, _S.prop(_S.read(_v4, "C"), 5), 0.5, 0.4])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 12)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "j", _S.invoke(_S.read(_v6, "R"), "int", [1, 14]))
			_S.define(_v6, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v6, "Math"), "PI")), 2), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [40, 100]))
			_S.invoke(_S.read(_v6, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v6, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v6, "CRACK_X"), _S.read(_v6, "j")), _S.read(_v6, "OX"))}, {"y": _S.binary("+", _S.read(_v6, "j"), _S.read(_v6, "OY"))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"g": 0.5}, {"drag": 1}, {"life": _S.invoke(_S.read(_v6, "R"), "range", [0.35, 0.55])}, {"a": _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")])}, {"va": _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v6, "R"), "range", [1.5, 3])}, {"c": _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 6), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 4), _S.prop(_S.read(_v6, "C"), 3)]])}])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 5)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "DUST"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 2), 2]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 5]), _S.invoke(_S.read(_v7, "R"), "range", [0.35, 0.6]), _S.prop(_S.read(_v7, "C"), 2), _S.invoke(_S.read(_v7, "R"), "range", [2, 3.5])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		var _v8 = _S.scope(_v4)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 6)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [30, 70]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "C"), 7), _S.prop(_S.read(_v9, "C"), 6)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v9, "i"), 2)) else 1.4)])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "split"), func(): return _S.unary("!", _S.read(_e, "gone"))), func(): return _S.binary(">=", _S.read(_e, "t"), 0.95))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "gone", true, "=", false)
		for _v11 in _S.array(_S.read(_v10, "halves")):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "h", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "i"), 5)):
				var _v14 = _S.scope(_v13)
				_S.define(_v14, "an", _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")]))
				_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [20, 50]))
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v14, "h"), "x"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), 4)), _S.binary("+", _S.prop(_S.read(_v14, "h"), "y"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), 4)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), 10), _S.invoke(_S.read(_v14, "Math"), "min", [_S.invoke(_S.read(_v14, "R"), "range", [0.2, 0.35]), _S.binary("-", _S.read(_v14, "end"), _S.read(_v14, "t"))]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 7), _S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 5)]]), (0.6 if _S.truth(_S.read(_v14, "i")) else 1.3)])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "split")):
		for _v15 in _S.array(_S.read(_e, "halves")):
			var _v16 = _S.scope(_e)
			_S.define(_v16, "h", _v15)
			var _v17 = _S.scope(_v16)
			_S.set_prop(_S.read(_v17, "h"), "vy", _S.binary("*", 520, _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vx"), 0.6), _S.read(_v17, "dt")), "-=", false)
			_S.set_prop(_S.read(_v17, "h"), "x", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vx"), _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "y", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vy"), _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "a", _S.binary("*", _S.prop(_S.read(_v17, "h"), "va"), _S.read(_v17, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v17, "t"), 0.92), func(): return _S.invoke(_S.read(_v17, "R"), "chance", [0.05]))):
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "EMBER"), _S.prop(_S.read(_v17, "h"), "x"), _S.prop(_S.read(_v17, "h"), "y"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 5]), _S.invoke(_S.read(_v17, "Math"), "min", [_S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_v17, "end"), _S.read(_v17, "t"))]), _S.prop(_S.read(_v17, "C"), 4), 1])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_o = _S.read(_parent,"o")
	var _n_shake = _S.read(_parent,"shake")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_SPLIT = _S.read(_parent,"SPLIT")
	var _n_drawPart = _S.read(_parent,"drawPart")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_halves = _S.read(_parent,"halves")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.call_value(_n_shake,[_n_t, 3, _n_HIT, 0.25, _S.named_value(_n_o,"seed")])
	var _n_jx_b1 = _S.prop(_tuple_0,0)
	var _n_jy_b2 = _S.prop(_tuple_0,1)
	var _n_tremble_b3 = (floori(sin((_n_t * 90))+0.5) if _S.truth(((_n_t < _n_SPLIT) if _S.truth((_n_t > _n_CRACK)) else (_n_t > _n_CRACK))) else 0)
	var _n_sk_b4 = (_S.MathFX.seg(_n_t,(_n_SPLIT - 0.05),(_n_SPLIT + 0.1)) * (1 - _S.MathFX.seg(_n_t,1.15,1.4)))
	if _S.truth((_n_sk_b4 > 0)):
		_S.invoke(_n_p_b0,"shade",[(-12), (-10), 12, 10, _S.function_value(_S.capture(_parent,{"sk":_n_sk_b4,"this":_this}),"_f8")])
	if _S.truth((_n_t < _n_SPLIT)):
		var _n_beat_b5 = ((1 + (0.08 * maxf(0,sin((_n_t * 22))))) if _S.truth((_n_t < _n_HIT)) else 1)
		var _n_white_b6 = ((_n_t < (_n_HIT + 0.07)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))
		_S.call_value(_n_drawPart,[_n_p_b0, _n_C, 0, (_n_jx_b1 + _n_tremble_b3), _n_jy_b2, 0, _n_white_b6, _S.MathFX.seg(_n_t,_n_CRACK,(_n_SPLIT - 0.06)), 1])
		_S.invoke(_n_p_b0,"glow",[0, 0, (18 * _n_beat_b5), _S.index_value(_n_C,4), (0.3 + (0.5 if _S.truth(_n_white_b6) else 0))])
		if _S.truth((_n_t < _n_HIT)):
			_S.call_value(_n_sparkle,[_n_p_b0, (-6), (-5), (2.5 * maxf(0,sin((_n_t * 22)))), _S.index_value(_n_C,7), _S.index_value(_n_C,6), 0.3])
	else:
		var _n_fade_b7 = (1 - _S.MathFX.seg(_n_t,0.9,1))
		var _n_white_b8 = (_n_t < (_n_SPLIT + 0.05))
		if _S.truth((_n_fade_b7 > 0)):
			for _iter_1 in _S.array(_n_halves):
				var _n_h_b10 = _iter_1
				_S.call_value(_n_drawPart,[_n_p_b0, _n_C, _S.named_value(_n_h_b10,"s"), _S.named_value(_n_h_b10,"x"), _S.named_value(_n_h_b10,"y"), _S.named_value(_n_h_b10,"a"), _n_white_b8, 0, _n_fade_b7])
		var _n_rk_b9 = (float((_n_t - _n_SPLIT))/0.3)
		if _S.truth((_n_rk_b9 < 1)):
			_S.invoke(_n_p_b0,"ring",[0, 0, (8 + (16 * _S.invoke(_n_ease,"outCubic",[_n_rk_b9]))), maxf(1,(2 * (1 - _n_rk_b9))), (_n_WHITE if _S.truth((_n_rk_b9 < 0.3)) else _S.index_value(_n_C,5)), (1.2 - _n_rk_b9)])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_OX = _S.read(_parent,"OX")
	var _n_OY = _S.read(_parent,"OY")
	var _n_inMask = _S.read(_parent,"inMask")
	var _n_sk = _S.read(_parent,"sk")
	var _n_SOCKET = _S.read(_parent,"SOCKET")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_i_b3 = floori((_n_sx_b0 - _n_OX))
	var _n_j_b4 = floori((_n_sy_b1 - _n_OY))
	if _S.truth(not _S.truth(_S.call_value(_n_inMask,[_n_i_b3, _n_j_b4]))):
		return null
	_S.set_prop(_n_out_b2,"a",_n_sk,"=")
	var _n_edge_b5 = _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_inMask,[(_n_i_b3 - 1), _n_j_b4])),func():return not _S.truth(_S.call_value(_n_inMask,[(_n_i_b3 + 1), _n_j_b4]))),func():return not _S.truth(_S.call_value(_n_inMask,[_n_i_b3, (_n_j_b4 - 1)]))),func():return not _S.truth(_S.call_value(_n_inMask,[_n_i_b3, (_n_j_b4 + 1)])))
	return (_S.index_value(_n_SOCKET,2) if _S.truth(_n_edge_b5) else (_S.index_value(_n_SOCKET,1) if _S.truth((_n_j_b4 < 3)) else _S.index_value(_n_SOCKET,0)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_MW = _S.read(_parent,"MW")
	var _n_MH = _S.read(_parent,"MH")
	var _n_MASK = _S.read(_parent,"MASK")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.binary("===",_S.index_value(_S.index_value(_n_MASK,_n_j_b1),_n_i_b0),"x") if _S.truth(((_n_j_b1 < _n_MH) if _S.truth(((_n_i_b0 < _n_MW) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_MW) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _n_MH) if _S.truth(((_n_i_b0 < _n_MW) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_MW) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))))
	return null
