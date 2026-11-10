@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/particles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f3":"cycle"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rng", _S.import_value("core/math.js", "rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "fly", _S.function_value(_e, "_f0"))
	_S.define(_e, "flyV", _S.function_value(_e, "_f1"))
	_S.define(_e, "burst", _S.function_value(_e, "_f2"))
	_S.define(_e, "cycle", _S.function_value(_e, "_f3"))
	_S.define(_e, "stream", _S.function_value(_e, "_f4"))
	_exports["fly"] = _S.read(_e, "fly")
	_exports["flyV"] = _S.read(_e, "flyV")
	_exports["burst"] = _S.read(_e, "burst")
	_exports["cycle"] = _S.read(_e, "cycle")
	_exports["stream"] = _S.read(_e, "stream")
	_S.define(_e, "Particles", _S.class_value("Particles", _S.function_value(_e, "_f5"), {"add": _S.function_value(_e, "_f6"), "update": _S.function_value(_e, "_f7"), "k": _S.function_value(_e, "_f8")}, {}, {}, null))
	_exports["Particles"] = _S.read(_e, "Particles")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_g_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	var _n_drag_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	if _S.truth((_n_drag_b6 <= 0)):
		return [(_n_x_b0 + (_n_vx_b2 * _n_t_b4)), ((_n_y_b1 + (_n_vy_b3 * _n_t_b4)) + (((0.5 * _n_g_b5) * _n_t_b4) * _n_t_b4))]
	var _n_f_b7 = (float((1 - exp(((-_n_drag_b6) * _n_t_b4))))/_n_drag_b6)
	var _n_vt_b8 = (float(_n_g_b5)/_n_drag_b6)
	return [(_n_x_b0 + (_n_vx_b2 * _n_f_b7)), ((_n_y_b1 + (_n_vt_b8 * _n_t_b4)) + ((_n_vy_b3 - _n_vt_b8) * _n_f_b7))]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_vx_b0 = _S.arg(_args,0)
	var _n_vy_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_drag_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	if _S.truth((_n_drag_b4 <= 0)):
		return [_n_vx_b0, (_n_vy_b1 + (_n_g_b3 * _n_t_b2))]
	var _n_e_b5 = exp(((-_n_drag_b4) * _n_t_b2))
	var _n_vt_b6 = (float(_n_g_b3)/_n_drag_b4)
	return [(_n_vx_b0 * _n_e_b5), (_n_vt_b6 + ((_n_vy_b1 - _n_vt_b6) * _n_e_b5))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_n_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.arg(_args,1)
	var _n_fn_b2 = _S.arg(_args,2)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_n_b0)):
			_S.call_value(_n_fn_b2,[_S.MathFX.rng([_n_seed_b1,_n_i_b3]), _n_i_b3])
			_n_i_b3 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_period_b1 = _S.arg(_args,1)
	var _n_count_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_life_b4 = _S.arg(_args,4)
	var _n_fn_b5 = _S.arg(_args,5)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < _n_count_b2)):
			var _n_g_b7 = _S.MathFX.rng([_n_seed_b3,_n_i_b6,911])
			var _n_born_b8 = (_S.invoke(_n_g_b7,"next",[]) * _n_period_b1)
			var _n_L_b9 = (_S.call_value(_n_life_b4,[_n_g_b7]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_life_b4),"function")) else _n_life_b4)
			var _n_age_b10 = fmod((fmod((_n_t_b0 - _n_born_b8),_n_period_b1) + _n_period_b1),_n_period_b1)
			if true:
				while _S.truth((_n_age_b10 < _n_L_b9)):
					_S.call_value(_n_fn_b5,[_n_age_b10, _n_L_b9, _S.MathFX.rng([_n_seed_b3,_n_i_b6]), _n_i_b6])
					_n_age_b10 += _n_period_b1
			_n_i_b6 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_t0_b1 = _S.arg(_args,1)
	var _n_t1_b2 = _S.arg(_args,2)
	var _n_rate_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	var _n_fn_b6 = _S.arg(_args,6)
	var _n_n_b7 = floori(((minf(_n_t_b0,_n_t1_b2) - _n_t0_b1) * _n_rate_b3))
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 <= _n_n_b7)):
			var _n_born_b9 = (_n_t0_b1 + (float(_n_i_b8)/_n_rate_b3))
			var _n_g_b10 = _S.MathFX.rng([_n_seed_b4,_n_i_b8,911])
			var _n_L_b11 = (_S.call_value(_n_life_b5,[_n_g_b10]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_life_b5),"function")) else _n_life_b5)
			var _n_age_b12 = (_n_t_b0 - _n_born_b9)
			if _S.truth(((_n_age_b12 < _n_L_b11) if _S.truth((_n_age_b12 >= 0)) else (_n_age_b12 >= 0))):
				_S.call_value(_n_fn_b6,[_n_age_b12, _n_L_b11, _S.MathFX.rng([_n_seed_b4,_n_i_b8]), _n_i_b8])
			_n_i_b8 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	_S.set_prop(_n_p_b0,"age",0,"=")
	_S.set_prop(_n_p_b0,"g",0,"??=")
	_S.set_prop(_n_p_b0,"drag",0,"??=")
	_S.invoke(_S.named_value(_this,"list"),"push",[_n_p_b0])
	return _n_p_b0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			var _n_p_b2 = _S.index_value(_S.named_value(_this,"list"),_n_i_b1)
			if _S.truth((_S.set_prop(_n_p_b2,"age",_n_dt_b0,"+=") >= _S.named_value(_n_p_b2,"life"))):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_p_b2,"vx",((_S.named_value(_n_p_b2,"vx") * _S.named_value(_n_p_b2,"drag")) * _n_dt_b0),"-=")
			_S.set_prop(_n_p_b2,"vy",((_S.named_value(_n_p_b2,"g") * _n_dt_b0) - ((_S.named_value(_n_p_b2,"vy") * _S.named_value(_n_p_b2,"drag")) * _n_dt_b0)),"+=")
			_S.set_prop(_n_p_b2,"x",(_S.named_value(_n_p_b2,"vx") * _n_dt_b0),"+=")
			_S.set_prop(_n_p_b2,"y",(_S.named_value(_n_p_b2,"vy") * _n_dt_b0),"+=")
			if _S.truth(((_S.named_value(_n_p_b2,"y") > _S.named_value(_n_p_b2,"ground")) if _S.truth(_S.binary("!==",_S.named_value(_n_p_b2,"ground"),null)) else _S.binary("!==",_S.named_value(_n_p_b2,"ground"),null))):
				_S.set_prop(_n_p_b2,"y",_S.named_value(_n_p_b2,"ground"),"=")
				_S.set_prop(_n_p_b2,"vy",((-absf(_S.named_value(_n_p_b2,"vy"))) * (_S.named_value(_n_p_b2,"bounce") if _S.named_value(_n_p_b2,"bounce")!=null else 0.3)),"=")
				_S.set_prop(_n_p_b2,"vx",0.7,"*=")
			_n_i_b1 -= 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	return clampf((1 - (float(_S.named_value(_n_p_b0,"age"))/_S.named_value(_n_p_b0,"life"))),0.0,1.0)
	return null
