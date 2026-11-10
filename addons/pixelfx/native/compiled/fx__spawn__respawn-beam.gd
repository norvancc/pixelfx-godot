@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/respawn-beam.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "rimOf", _S.import_value("fx/spawn/_lib.js", "rimOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Respawn beam"}, {"desc": "A guide line drops, a pillar of light slams onto the spot, and a scan bar climbs from the feet writing the character back in row by row, white-hot lines cooling to its colors."}, {"tags": ["spawn", "respawn", "beam", "teleport", "scanline", "light", "one-shot"]}, {"size": [128, 150]}, {"origin": [64, 136]}, {"duration": 2.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#061e1b", "#0c3e36", "#136a5a", "#1f9c80", "#45d1a8", "#a8f5d8", "#ffffff"]}, {"width": 15}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SET", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 14)}, {"bx": 10}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "SET")], [1.4, _S.read(_e, "SET")], [1.72, _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [2.1, _S.read(_e, "READY")], [2.5, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SLAM", 0.32)
	_S.define(_e, "WRITE0", _S.binary("+", _S.read(_e, "SLAM"), 0.08))
	_S.define(_e, "WRITE", 0.95)
	_S.define(_e, "DONE", _S.binary("+", _S.read(_e, "WRITE0"), _S.read(_e, "WRITE")))
	_S.define(_e, "LIFT", _S.binary("+", _S.read(_e, "DONE"), 0.12))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f15"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "BW", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "rimOf"), [_S.read(_e, "body")]))
	_S.define(_e, "top", _S.prop(_S.read(_e, "body"), "y"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "TOPY", _S.unary("-", 136))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "scanY", _S.function_value(_e, "_f3"))
	_S.define(_e, "rowT", _S.function_value(_e, "_f4"))
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "finished", false)
	_S.define(_e, "DROP", 0.07)
	_S.define(_e, "width", _S.function_value(_e, "_f5"))
	_S.define(_e, "bottom", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"o":((_S.MathFX.rand([_n_i_b1,1]) * 1.6) - 0.8),"f":(1 + (_S.MathFX.rand([_n_i_b1,2]) * 3)),"w":_S.MathFX.rand([_n_i_b1,3])}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_WRITE0 = _S.read(_parent,"WRITE0")
	var _n_WRITE = _S.read(_parent,"WRITE")
	var _n_H = _S.read(_parent,"H")
	var _n_t_b0 = _S.arg(_args,0)
	return ((-_S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_WRITE0))/_n_WRITE),0.0,1.0)])) * (_n_H + 2))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_WRITE0 = _S.read(_parent,"WRITE0")
	var _n_WRITE = _S.read(_parent,"WRITE")
	var _n_H = _S.read(_parent,"H")
	var _n_my_b0 = _S.arg(_args,0)
	return (_n_WRITE0 + (float((_n_WRITE * acos((1 - (2 * clampf((float((_n_H - _n_my_b0))/(_n_H + 2)),0.0,1.0))))))/PI))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_BW = _S.read(_parent,"BW")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < (_n_SLAM - _n_DROP))) else ((_n_BW * 0.6) if _S.truth((_n_t_b0 < _n_SLAM)) else (((_n_BW * (1 + (0.4 * exp(((-(_n_t_b0 - _n_SLAM)) * 10))))) * (0.92 + (0.08 * sin((_n_t_b0 * 40))))) if _S.truth((_n_t_b0 < _n_LIFT)) else (_n_BW * (1 - _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_LIFT))/0.3),0.0,1.0)]))))))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < _n_LIFT)) else ((-150) * _S.invoke(_n_ease,"inCubic",[clampf((float((_n_t_b0 - _n_LIFT))/0.4),0.0,1.0)])))
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "s", _S.invoke(_S.read(_v0, "R"), "sign", []))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [18, 40]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.15, 0.25]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.binary("*", _S.read(_v0, "s"), _S.read(_v0, "D")), _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [0, 3])), _S.binary("*", _S.unary("-", _S.read(_v0, "s")), _S.read(_v0, "v")), 0, _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 5) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 4))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "slammed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SLAM")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "slammed", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 28), 64, _S.prop(_S.read(_v1, "C"), 4), 1, 0.5])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 52), 80, _S.prop(_S.read(_v1, "C"), 5), 1.1, 0.4])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 9), 24, _S.read(_v1, "WHITE"), 0.9, 0.12])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 40)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "s", _S.invoke(_S.read(_v3, "R"), "sign", []))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [60, 135]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.read(_v3, "s"), _S.invoke(_S.read(_v3, "R"), "range", [0, 6])), _S.unary("-", 1), _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "sp")), _S.unary("-", _S.invoke(_S.read(_v3, "R"), "range", [20, 140])), _S.invoke(_S.read(_v3, "R"), "range", [0.25, 0.7])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 12)):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STAR"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", _S.read(_v4, "BW")), _S.read(_v4, "BW")]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [2, 40])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [20, 70])), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v4, "R"), "pick", [[_S.read(_v4, "WHITE"), _S.prop(_S.read(_v4, "C"), 5)]]), _S.invoke(_S.read(_v4, "R"), "range", [0.8, 1.8])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v5 = _S.scope(_v1)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 8)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "s", _S.invoke(_S.read(_v6, "R"), "sign", []))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "DUST"), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "R"), "range", [4, 10])), _S.unary("-", 1), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [3, 10])), _S.invoke(_S.read(_v6, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v6, "C"), 2), _S.invoke(_S.read(_v6, "R"), "range", [1.5, 3])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "WRITE0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "DONE"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.45]))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "y", _S.call_value(_S.read(_v7, "scanY"), [_S.read(_v7, "t")]))
		_S.define(_v7, "s", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [6, 11])), _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [40, 140])), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 60), 10]), _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.35])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT"), 0.2))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.3), 1.3]), _S.read(_e, "BW")), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 90])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 90])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]]), (_S.invoke(_S.read(_e, "R"), "range", [1, 1.8]) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 0.6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "finished")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "finished", true, "=", false)
		_S.invoke(_S.read(_v8, "lights"), "add", [0, _S.binary("+", _S.read(_v8, "top"), _S.binary("/", _S.read(_v8, "H"), 2)), 40, _S.prop(_S.read(_v8, "C"), 5), 0.7, 0.3])
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 14)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "c", _S.invoke(_S.read(_v10, "R"), "pick", [_S.read(_v10, "rim")]))
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.prop(_S.read(_v10, "c"), "x"), _S.prop(_S.read(_v10, "c"), "y"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [10, 50])), _S.invoke(_S.read(_v10, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 5)]]), _S.invoke(_S.read(_v10, "R"), "range", [0.8, 1.8])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_width = _S.read(_parent,"width")
	var _n_t = _S.read(_parent,"t")
	var _n_bottom = _S.read(_parent,"bottom")
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WRITE0 = _S.read(_parent,"WRITE0")
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_LIFT = _S.read(_parent,"LIFT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_strands = _S.read(_parent,"strands")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.call_value(_n_width,[_n_t])
	var _n_b_b2 = _S.call_value(_n_bottom,[_n_t])
	if _S.truth((_n_t < _n_SLAM)):
		var _n_k_b6 = (_S.MathFX.smooth(0,(_n_SLAM * 0.7),_n_t) * (1 - (_S.MathFX.smooth((_n_SLAM - _n_DROP),_n_SLAM,_n_t) * 0.5)))
		if true:
			var _n_y_b7 = _n_TOPY
			while _S.truth((_n_y_b7 < (-1))):
				_S.invoke(_n_p_b0,"dot",[0, (_n_y_b7 + fmod(_S.binary("|",(_n_t * 60),0),2)), _S.index_value(_n_C,5), (_n_k_b6 * (0.35 + (0.65 * (float((_n_y_b7 - _n_TOPY))/(-_n_TOPY)))))])
				_n_y_b7 += 2
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (10 - (4 * _n_k_b6)), 0.2, 1, _n_k_b6, _n_C, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
		_S.invoke(_n_p_b0,"glow",[0, (-2), 16, _S.index_value(_n_C,4), (0.4 * _n_k_b6)])
	if _S.truth((_n_w_b1 <= 0.2)):
		return null
	var _n_yEnd_b3 = ((_n_TOPY + (((-1) - _n_TOPY) * _S.invoke(_n_ease,"inCubic",[clampf((float(((_n_t - _n_SLAM) + _n_DROP))/_n_DROP),0.0,1.0)]))) if _S.truth((_n_t < _n_SLAM)) else ((-1) + _n_b_b2))
	var _n_writing_b4 = (_S.MathFX.smooth((_n_WRITE0 - 0.05),(_n_WRITE0 + 0.1),_n_t) * (1 - _S.MathFX.smooth(_n_DONE,_n_LIFT,_n_t)))
	var _n_fill_b5 = (0.2 - (0.1 * _n_writing_b4))
	if true:
		var _n_y_b8 = _n_TOPY
		while _S.truth((_n_y_b8 <= _n_yEnd_b3)):
			if true:
				var _n_x_b9 = floori((-_n_w_b1))
				while _S.truth((_n_x_b9 <= ceili(_n_w_b1))):
					var _n_q_b10 = absf((float((_n_x_b9 + 0.5))/_n_w_b1))
					if _S.truth((_n_q_b10 > 1)):
						_n_x_b9 += 1.0
						continue
					if _S.truth((_n_q_b10 > 0.86)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b9, _n_y_b8, (_n_WHITE if _S.truth(((_S.MathFX.rand([_n_x_b9,_n_y_b8,_S.binary("|",(_n_t * 30),0)]) < 0.7) if _S.truth((_n_q_b10 > 0.94)) else (_n_q_b10 > 0.94))) else _S.index_value(_n_C,5)), 1])
						_n_x_b9 += 1.0
						continue
					var _n_core_b11 = (1 - _S.MathFX.smooth((_n_SLAM + 0.06),(_n_WRITE0 + 0.08),_n_t))
					if _S.truth((_n_q_b10 < (0.7 * _n_core_b11))):
						var _n_hot_b14 = (_n_q_b10 < (0.35 * _n_core_b11))
						for _iter_0 in _S.array(_n_strands):
							var _n_s_b15 = _iter_0
							if _S.truth((absf((((float((_n_x_b9 + 0.5))/_n_w_b1) - (_S.named_value(_n_s_b15,"o") * 0.6)) - (0.05 * sin((((_n_t * _S.named_value(_n_s_b15,"f")) * 3) + (_n_y_b8 * 0.05)))))) < 0.04)):
								_n_hot_b14 = false
						_S.invoke(_n_p_b0,"px",[_n_x_b9, _n_y_b8, (_n_WHITE if _S.truth(_n_hot_b14) else (_S.index_value(_n_C,6) if _S.truth((_n_q_b10 < (0.5 * _n_core_b11))) else _S.index_value(_n_C,5)))])
						_n_x_b9 += 1.0
						continue
					var _n_a_b12 = (_n_fill_b5 * (1.2 - _n_q_b10))
					var _n_c_b13 = _S.index_value(_n_C,4)
					for _iter_1 in _S.array(_n_strands):
						var _n_s_b16 = _iter_1
						if _S.truth((absf((((float((_n_x_b9 + 0.5))/_n_w_b1) - _S.named_value(_n_s_b16,"o")) - (0.06 * sin(((_n_t * _S.named_value(_n_s_b16,"f")) + (_S.named_value(_n_s_b16,"o") * 7)))))) < (0.045 + (0.03 * _S.named_value(_n_s_b16,"w"))))):
							_n_a_b12 = (0.55 - (0.25 * _n_writing_b4))
							_n_c_b13 = _S.index_value(_n_C,5)
					_S.invoke(_n_p_b0,"blend",[_n_x_b9, _n_y_b8, _n_c_b13, _n_a_b12])
					_n_x_b9 += 1.0
			_n_y_b8 += 1.0
	if _S.truth((_n_yEnd_b3 > (_n_TOPY + 24))):
		for _iter_2 in _S.array([(-1), 1]):
			var _n_s_b17 = _iter_2
			_S.invoke(_n_p_b0,"glowLine",[(_n_s_b17 * _n_w_b1), (_n_TOPY + 24), (_n_s_b17 * _n_w_b1), _n_yEnd_b3, 6, _S.index_value(_n_C,4), 0.3])
	_S.invoke(_n_p_b0,"glow",[0, (-5), ((_n_w_b1 * 1.5) + 6), _S.index_value(_n_C,5), 0.45])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_width = _S.read(_parent,"width")
	var _n_t = _S.read(_parent,"t")
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_WRITE0 = _S.read(_parent,"WRITE0")
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_scanY = _S.read(_parent,"scanY")
	var _n_rowT = _S.read(_parent,"rowT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_body = _S.read(_parent,"body")
	var _n_rim = _S.read(_parent,"rim")
	var _n_top = _S.read(_parent,"top")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_bottom = _S.read(_parent,"bottom")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.call_value(_n_width,[_n_t])
	var _n_sk_b2 = (float((_n_t - _n_SLAM))/0.45)
	if _S.truth(((_n_sk_b2 < 1) if _S.truth((_n_sk_b2 > 0)) else (_n_sk_b2 > 0))):
		var _n_rx_b4 = (14 + (18 * _S.invoke(_n_ease,"outCubic",[_n_sk_b2])))
		var _n_ry_b5 = (3 + (1.5 * _n_sk_b2))
		_S.invoke(_n_p_b0,"ellipse",[0, 0.5, _n_rx_b4, _n_ry_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"sk":_n_sk_b2,"this":_this}),"_f12")])
		_S.invoke(_n_p_b0,"glow",[0, (-2), (_n_rx_b4 * 1.3), _S.index_value(_n_C,5), (0.5 * (1 - _n_sk_b2))])
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 2)):
			var _n_k_b7 = (float(((_n_t - _n_SLAM) - (0.08 * _n_i_b6)))/0.5)
			if _S.truth(((_n_k_b7 < 1) if _S.truth((_n_k_b7 > 0)) else (_n_k_b7 > 0))):
				_S.call_value(_n_band,[_n_p_b0, 0, 0, (8 + ((22 if _S.truth(_n_i_b6) else 34) * _S.invoke(_n_ease,"outCubic",[_n_k_b7]))), 0.2, maxf(1,(3 * (1 - _n_k_b7))), (1.15 - _n_k_b7), _n_C, _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), (_n_k_b7 < 0.15)])
			_n_i_b6 += 1.0
	if _S.truth(((_n_t < (_n_DONE + 0.05)) if _S.truth((_n_t >= _n_WRITE0)) else (_n_t >= _n_WRITE0))):
		var _n_sy_b8 = _S.call_value(_n_scanY,[_n_t])
		var _n_fr_b9 = floori((_n_t * 30))
		for _iter_0 in _S.array(_S.named_value(_n_body,"list")):
			var _n_b_b10 = _iter_0
			var _n_t0_b11 = _S.call_value(_n_rowT,[_S.named_value(_n_b_b10,"my")])
			var _n_age_b12 = (_n_t - _n_t0_b11)
			if _S.truth((_n_age_b12 < 0)):
				continue
			var _n_glitch_b13 = (((-2) if _S.truth((_S.MathFX.rand([_S.named_value(_n_b_b10,"my"),_n_fr_b9,4]) < 0.5)) else 2) if _S.truth(((_S.MathFX.rand([_S.named_value(_n_b_b10,"my"),_n_fr_b9,9]) < 0.3) if _S.truth((_n_age_b12 < 0.12)) else (_n_age_b12 < 0.12))) else 0)
			var _n_c_b14 = (_n_WHITE if _S.truth((_n_age_b12 < 0.05)) else (_S.index_value(_n_C,5) if _S.truth((_n_age_b12 < 0.14)) else (_S.ColorFX.mix(_S.named_value(_n_b_b10,"c"),_S.index_value(_n_C,5),(0.5 * (1 - (float((_n_age_b12 - 0.14))/0.16)))) if _S.truth((_n_age_b12 < 0.3)) else _S.named_value(_n_b_b10,"c"))))
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_b_b10,"x") + _n_glitch_b13), _S.named_value(_n_b_b10,"y"), (_S.index_value(_n_C,6) if _S.truth(((_n_age_b12 < 0.3) if _S.truth(_S.named_value(_n_b_b10,"edge")) else _S.named_value(_n_b_b10,"edge"))) else _n_c_b14)])
		if _S.truth((_n_t < _n_DONE)):
			_S.invoke(_n_p_b0,"line",[((-_n_w_b1) - 2), _n_sy_b8, (_n_w_b1 + 2), _n_sy_b8, _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
			_S.invoke(_n_p_b0,"line",[(-_n_w_b1), (_n_sy_b8 + 1), _n_w_b1, (_n_sy_b8 + 1), _S.index_value(_n_C,4), 0.6])
			_S.invoke(_n_p_b0,"glowLine",[(-_n_w_b1), _n_sy_b8, _n_w_b1, _n_sy_b8, 6, _S.index_value(_n_C,5), 0.6])
	var _n_fk_b3 = (float((_n_t - _n_DONE))/0.25)
	if _S.truth(((_n_fk_b3 < 1) if _S.truth((_n_fk_b3 > 0)) else (_n_fk_b3 > 0))):
		for _iter_1 in _S.array(_n_rim):
			var _n_c_b15 = _iter_1
			_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_c_b15,"x"), _S.named_value(_n_c_b15,"y"), (_n_WHITE if _S.truth((_n_fk_b3 < 0.4)) else _S.index_value(_n_C,5)), (1.2 - _n_fk_b3)])
		_S.call_value(_n_sparkle,[_n_p_b0, 6, (_n_top + 6), floori((6 * (1 - _n_fk_b3))+0.5), _n_WHITE, _S.index_value(_n_C,5), 0.5])
	if _S.truth((_n_w_b1 > 0.2)):
		var _n_yEnd_b16 = ((_n_TOPY + (((-1) - _n_TOPY) * _S.invoke(_n_ease,"inCubic",[clampf((float(((_n_t - _n_SLAM) + _n_DROP))/_n_DROP),0.0,1.0)]))) if _S.truth((_n_t < _n_SLAM)) else ((-1) + _S.call_value(_n_bottom,[_n_t])))
		if _S.truth((((_n_t - _n_SLAM) < 0.1) if _S.truth((_n_t >= _n_SLAM)) else (_n_t >= _n_SLAM))):
			_S.invoke(_n_p_b0,"glow",[0, (-30), 56, _n_WHITE, (0.6 * (1 - (float((_n_t - _n_SLAM))/0.1)))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b0 < 0.7)) else _S.index_value(_n_C,5)))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_sk = _S.read(_parent,"sk")
	var _n_d_b0 = _S.arg(_args,0)
	return (((1 - _n_sk) * 1.4) * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f13(_parent,_args:Array,_this=null):
	return true
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((absf((_n_u_b0 - 0.5)) < 0.35)) else _S.index_value(_n_C,5))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < (_n_DONE + 0.04))) else 1)
	return null
