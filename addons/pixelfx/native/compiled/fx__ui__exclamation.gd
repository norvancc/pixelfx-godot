@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/exclamation.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bang", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Exclamation"}, {"desc": "A bold ! springs up off the hero's head, stretching as it shoots up and squashing as it lands; surprise ticks flick out, it wobbles, then pops away."}, {"tags": ["ui", "alert", "surprise", "emote", "character", "one-shot"]}, {"size": [84, 104]}, {"origin": [42, 92]}, {"duration": 1.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1405", "#6a2e06", "#b85a0a", "#f08c14", "#ffc23a", "#ffe580", "#fff6c8", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STARTLED", _S.merge([{"turn": 1}, {"y": _S.unary("-", 5)}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 14)}, {"fy": _S.unary("-", 34)}, {"bx": 15}, {"by": _S.unary("-", 34)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 6)}, {"fbx": 4}, {"fby": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.08), _S.read(_e, "READY")], [0, _S.read(_e, "STARTLED"), "snap"], [0.14, _S.merge([_S.read(_e, "STARTLED"), {"y": 0}, {"crouch": 4}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}, {"fy": _S.unary("-", 26)}, {"by": _S.unary("-", 26)}]), "in"], [0.3, _S.merge([{"turn": 1}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 23)}, {"bx": 11}, {"by": _S.unary("-", 23)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [1.1, _S.merge([{"turn": 1}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 23)}, {"bx": 11}, {"by": _S.unary("-", 23)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [1.4, _S.read(_e, "READY")]]}, {"dust": [_S.merge([{"t": 0.14}, {"x": 0}, {"n": 4}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "HEAD", _S.unary("-", 40))
	_S.define(_e, "REST", _S.unary("-", 45))
	_S.define(_e, "POP", 1.1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_sx_b4 = _S.arg(_args,4)
	var _n_sy_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	var _n_white_b7 = _S.arg(_args,7)
	var _n_ca_b8 = cos(_n_a_b6)
	var _n_sa_b9 = sin(_n_a_b6)
	var _n_hw_b10 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f1")
	var _n_inBar_b11 = _S.function_value(_S.capture(_parent,{"hw":_n_hw_b10,"this":_this}),"_f2")
	var _n_inDot_b12 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f3")
	var _n_inside_b13 = _S.function_value(_S.capture(_parent,{"inBar":_n_inBar_b11,"inDot":_n_inDot_b12,"this":_this}),"_f4")
	_S.invoke(_n_p_b0,"shade",[(_n_x_b2 - 16), (_n_y_b3 - 34), (_n_x_b2 + 16), (_n_y_b3 + 6), _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"y":_n_y_b3,"ca":_n_ca_b8,"sa":_n_sa_b9,"sx":_n_sx_b4,"sy":_n_sy_b5,"inside":_n_inside_b13,"C":_n_C_b1,"white":_n_white_b7,"inDot":_n_inDot_b12,"hw":_n_hw_b10,"this":_this}),"_f5")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_V_b0 = _S.arg(_args,0)
	return (2.3 + (((-_n_V_b0) - 10) * 0.09))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_hw = _S.read(_parent,"hw")
	var _n_U_b0 = _S.arg(_args,0)
	var _n_V_b1 = _S.arg(_args,1)
	return ((absf(_n_U_b0) < _S.call_value(_n_hw,[_n_V_b1])) if _S.truth(((_n_V_b1 < (-9.5)) if _S.truth((_n_V_b1 > (-24))) else (_n_V_b1 > (-24)))) else ((_n_V_b1 < (-9.5)) if _S.truth((_n_V_b1 > (-24))) else (_n_V_b1 > (-24))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_U_b0 = _S.arg(_args,0)
	var _n_V_b1 = _S.arg(_args,1)
	return (_S.Bridge.hypot([_n_U_b0, (_n_V_b1 + 3.6)]) < 3.3)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_inBar = _S.read(_parent,"inBar")
	var _n_inDot = _S.read(_parent,"inDot")
	var _n_U_b0 = _S.arg(_args,0)
	var _n_V_b1 = _S.arg(_args,1)
	return _S.logical("||",_S.call_value(_n_inBar,[_n_U_b0, _n_V_b1]),func():return _S.call_value(_n_inDot,[_n_U_b0, _n_V_b1]))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_inside = _S.read(_parent,"inside")
	var _n_C = _S.read(_parent,"C")
	var _n_white = _S.read(_parent,"white")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_inDot = _S.read(_parent,"inDot")
	var _n_hw = _S.read(_parent,"hw")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_x)
	var _n_dy_b3 = (_n_py_b1 - _n_y)
	var _n_u_b4 = (float(((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa)))/_n_sx)
	var _n_v_b5 = (float((((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca)))/_n_sy)
	var _n_ex_b6 = (float(1)/_n_sx)
	var _n_ey_b7 = (float(1)/_n_sy)
	if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_u_b4, _n_v_b5]))):
		return (_S.index_value(_n_C,0) if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside,[(_n_u_b4 - _n_ex_b6), _n_v_b5]),func():return _S.call_value(_n_inside,[(_n_u_b4 + _n_ex_b6), _n_v_b5])),func():return _S.call_value(_n_inside,[_n_u_b4, (_n_v_b5 - _n_ey_b7)])),func():return _S.call_value(_n_inside,[_n_u_b4, (_n_v_b5 + _n_ey_b7)]))) else null)
	if _S.truth(_n_white):
		return _n_WHITE
	if _S.truth(_S.call_value(_n_inDot,[_n_u_b4, _n_v_b5])):
		return (_n_WHITE if _S.truth((_S.Bridge.hypot([(_n_u_b4 + 1.2), (_n_v_b5 + 4.8)]) < 1.2)) else (_S.index_value(_n_C,6) if _S.truth((((_n_u_b4 + _n_v_b5) + 3.6) < (-0.5))) else (_S.index_value(_n_C,5) if _S.truth((((_n_u_b4 + _n_v_b5) + 3.6) < 1.5)) else _S.index_value(_n_C,4))))
	var _n_w_b8 = _S.call_value(_n_hw,[_n_v_b5])
	var _n_q_b9 = (float((_n_u_b4 + _n_w_b8))/(2 * _n_w_b8))
	if _S.truth((_n_q_b9 < 0.28)):
		return (_n_WHITE if _S.truth((_n_v_b5 < (-20))) else _S.index_value(_n_C,7))
	if _S.truth((_n_q_b9 > 0.74)):
		return _S.index_value(_n_C,4)
	return (_S.index_value(_n_C,6) if _S.truth((_n_v_b5 < (-18))) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b5 < (-13))) else _S.index_value(_n_C,5)))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "m", _S.merge([{"y": _S.read(_e, "HEAD")}, {"vy": _S.unary("-", 420)}, {"sq": 0}, {"landed": false}]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "sprung", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v0 = _S.scope(_e)
		_S.set_prop(_S.read(_v0, "m"), "vy", _S.binary("*", _S.binary("-", _S.binary("*", _S.unary("-", _S.binary("-", _S.prop(_S.read(_v0, "m"), "y"), _S.read(_v0, "REST"))), 900), _S.binary("*", _S.prop(_S.read(_v0, "m"), "vy"), 14)), _S.read(_v0, "dt")), "+=", false)
		_S.set_prop(_S.read(_v0, "m"), "y", _S.binary("*", _S.prop(_S.read(_v0, "m"), "vy"), _S.read(_v0, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v0, "m"), "landed")), func(): return _S.binary(">", _S.prop(_S.read(_v0, "m"), "vy"), 0))):
			_S.last([_S.set_prop(_S.read(_v0, "m"), "landed", true, "=", false), _S.set_prop(_S.read(_v0, "m"), "sq", 1, "=", false)])
	_S.set_prop(_S.read(_e, "m"), "sq", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_e, "m"), "sq"), _S.binary("/", _S.read(_e, "dt"), 0.12))]), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "sprung")), func(): return _S.binary(">=", _S.read(_e, "t"), 0.04))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "sprung", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.binary("-", _S.read(_v1, "HEAD"), 4), 26, _S.prop(_S.read(_v1, "C"), 5), 0.6, 0.25])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 8)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v3, "Math"), "PI")), 2), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [40, 90]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "STAR"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 4), 4]), _S.binary("-", _S.read(_v3, "HEAD"), 2), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v3, "R"), "pick", [[_S.prop(_S.read(_v3, "C"), 7), _S.prop(_S.read(_v3, "C"), 6), _S.prop(_S.read(_v3, "C"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v3, "i"), 3)) else 1.3)])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.05)))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "popped", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, _S.binary("-", _S.read(_v4, "REST"), 13), 28, _S.prop(_S.read(_v4, "C"), 5), 0.5, 0.2])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 7)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v6, "i"), 7), _S.read(_v6, "TAU")), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [30, 60]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), 5), _S.binary("+", _S.binary("-", _S.read(_v6, "REST"), 13), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), 9)), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "Math"), "min", [_S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.35]), _S.binary("-", _S.read(_v6, "end"), _S.read(_v6, "t"))]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 7), _S.prop(_S.read(_v6, "C"), 6), _S.prop(_S.read(_v6, "C"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v6, "i"), 3)) else 1.4)])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.read(_e, "t"))
	for _v7 in _S.array([[0.04, 6], [0.48, 4.5]]):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "t0", _S.prop(_v9, 0))
		_S.define(_v8, "len", _S.prop(_v9, 1))
		var _v10 = _S.scope(_v8)
		_S.define(_v10, "u", _S.binary("/", _S.binary("-", _S.read(_v10, "k"), _S.read(_v10, "t0")), 0.24))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v10, "u"), 0), func(): return _S.binary(">=", _S.read(_v10, "u"), 1))):
			continue
		for _v11 in _S.array([_S.unary("-", 1), 1]):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "s", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "i"), 3)):
				var _v14 = _S.scope(_v13)
				_S.define(_v14, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.binary("*", _S.read(_v14, "s"), _S.binary("+", 0.55, _S.binary("*", _S.read(_v14, "i"), 0.42)))))
				_S.define(_v14, "r0", _S.binary("+", 14, _S.binary("*", 7, _S.invoke(_S.read(_v14, "ease"), "outCubic", [_S.read(_v14, "u")]))))
				_S.define(_v14, "L", _S.binary("*", _S.binary("*", _S.read(_v14, "len"), _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("*", _S.read(_v14, "u"), _S.prop(_S.read(_v14, "Math"), "PI"))])), (1 if _S.truth(_S.binary("===", _S.read(_v14, "i"), 1)) else 0.75)))
				_S.define(_v14, "cx", 0)
				_S.define(_v14, "cy", _S.binary("-", _S.read(_v14, "REST"), 13))
				_S.define(_v14, "ca", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]))
				_S.define(_v14, "sa", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]))
				if _S.truth(_S.binary("<", _S.read(_v14, "L"), 0.8)):
					_v13 = _S.iteration(_v13)
					_S.write(_v13, "i", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v14, "p"), "line", [_S.binary("+", _S.read(_v14, "cx"), _S.binary("*", _S.read(_v14, "ca"), _S.read(_v14, "r0"))), _S.binary("+", _S.read(_v14, "cy"), _S.binary("*", _S.read(_v14, "sa"), _S.read(_v14, "r0"))), _S.binary("+", _S.read(_v14, "cx"), _S.binary("*", _S.read(_v14, "ca"), _S.binary("+", _S.read(_v14, "r0"), _S.read(_v14, "L")))), _S.binary("+", _S.read(_v14, "cy"), _S.binary("*", _S.read(_v14, "sa"), _S.binary("+", _S.read(_v14, "r0"), _S.read(_v14, "L")))), _S.function_value(_v14, "_f9")])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
	_S.define(_e, "pu", _S.binary("/", _S.binary("-", _S.read(_e, "k"), _S.read(_e, "POP")), 0.06))
	if _S.truth(_S.binary("<", _S.read(_e, "pu"), 1)):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "speed", _S.invoke(_S.read(_v15, "Math"), "min", [1, _S.binary("/", _S.invoke(_S.read(_v15, "Math"), "abs", [_S.prop(_S.read(_v15, "m"), "vy")]), 420)]))
		_S.define(_v15, "up", (_S.read(_v15, "speed") if _S.truth(_S.binary("<", _S.prop(_S.read(_v15, "m"), "vy"), 0)) else 0))
		_S.define(_v15, "sx", _S.binary("+", _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v15, "up"))), _S.binary("*", 0.3, _S.prop(_S.read(_v15, "m"), "sq"))))
		_S.define(_v15, "sy", _S.binary("-", _S.binary("+", 1, _S.binary("*", 0.45, _S.read(_v15, "up"))), _S.binary("*", 0.28, _S.prop(_S.read(_v15, "m"), "sq"))))
		if _S.truth(_S.binary("<", _S.read(_v15, "k"), 0.05)):
			_S.last([_S.write(_v15, "sx", _S.binary("/", _S.read(_v15, "k"), 0.05), "*=", false), _S.write(_v15, "sy", _S.binary("/", _S.read(_v15, "k"), 0.05), "*=", false)])
		if _S.truth(_S.binary(">", _S.read(_v15, "pu"), 0)):
			_S.write(_v15, "sx", _S.write(_v15, "sy", _S.binary("+", 1, _S.binary("*", 0.3, _S.read(_v15, "pu"))), "=", false), "=", false)
		_S.define(_v15, "wob", _S.binary("*", _S.binary("*", 0.28, _S.invoke(_S.read(_v15, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v15, "k")), 4)])), _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("*", _S.read(_v15, "k"), 26)])))
		_S.define(_v15, "white", _S.logical("||", _S.binary("<", _S.read(_v15, "k"), 0.06), func(): return _S.binary(">", _S.read(_v15, "pu"), 0)))
		if _S.truth(_S.binary(">", _S.read(_v15, "sx"), 0.1)):
			_S.call_value(_S.read(_v15, "bang"), [_S.read(_v15, "p"), _S.read(_v15, "C"), 0, _S.prop(_S.read(_v15, "m"), "y"), _S.read(_v15, "sx"), _S.read(_v15, "sy"), _S.read(_v15, "wob"), _S.read(_v15, "white")])
		_S.invoke(_S.read(_v15, "p"), "glow", [0, _S.binary("-", _S.prop(_S.read(_v15, "m"), "y"), 13), 20, _S.prop(_S.read(_v15, "C"), 5), _S.binary("+", 0.35, (0.3 if _S.truth(_S.read(_v15, "white")) else 0))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "k"), 0.6), func(): return _S.binary("<", _S.read(_v15, "k"), 0.85))):
			_S.call_value(_S.read(_v15, "sparkle"), [_S.read(_v15, "p"), _S.unary("-", 3), _S.binary("-", _S.prop(_S.read(_v15, "m"), "y"), 22), _S.binary("*", 3.5, _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v15, "k"), 0.6), 0.25), _S.prop(_S.read(_v15, "Math"), "PI"))])), _S.prop(_S.read(_v15, "C"), 7), _S.prop(_S.read(_v15, "C"), 6), 0.4])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_q_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_q_b0 < 0.5)) else _S.index_value(_n_C,5))
	return null
