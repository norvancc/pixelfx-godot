@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/magic-circle-cast.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "fract", _S.import_value("core/index.js", "fract"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "floorRing", _S.import_value("fx/arcane/_lib.js", "floorRing"))
	_S.define(_e, "bayer", _S.import_value("fx/arcane/_lib.js", "bayer"))
	_S.define(_e, "glyph", _S.import_value("fx/arcane/_lib.js", "glyph"))
	_S.define(_e, "level", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "R", 40)
	_S.define(_e, "R2", 35)
	_S.define(_e, "RI", 24)
	_S.define(_e, "RR", 30)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "TOP", 192)
	_S.define(_e, "W", 11)
	_S.define(_e, "NRUNE", 8)
	_S.define(_e, "PEN", [0.04, 0.42])
	_S.define(_e, "PEN2", [0.1, 0.48])
	_S.define(_e, "INNER", [0.3, 0.6])
	_S.define(_e, "STAR", [0.52, 0.88])
	_S.define(_e, "RUNES", [0.9, 1.3])
	_S.define(_e, "FLASH", 1.52)
	_S.define(_e, "BREAK", 2.42)
	_S.define(_e, "GONE", 3.45)
	_S.define(_e, "END", 3.9)
	_S.define(_e, "meta", _S.merge([{"name": "Magic circle cast"}, {"desc": "A circle draws itself on the floor, runes ignite one by one, it flashes, and a column of light fires up and breaks apart into glints."}, {"tags": ["arcane", "magic", "circle", "rune", "cast", "column", "summon", "ground", "one-shot"]}, {"size": [200, 220]}, {"origin": [100, 192]}, {"duration": _S.read(_e, "END")}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "wrap", _S.function_value(_e, "_f31"))
	_S.define(_e, "fromFront", _S.function_value(_e, "_f32"))
	_S.define(_e, "outerAt", _S.function_value(_e, "_f33"))
	_S.define(_e, "innerAt", _S.function_value(_e, "_f34"))
	_S.define(_e, "runeAngle", _S.function_value(_e, "_f35"))
	_S.define(_e, "runeLit", _S.function_value(_e, "_f36"))
	_S.define(_e, "runeOut", _S.function_value(_e, "_f37"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_RUNES = _S.read(_parent,"RUNES")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _S.index_value(_n_RUNES,0))):
		return 0.55
	if _S.truth((_n_t_b0 < _n_FLASH)):
		return (0.55 + (0.4 * _S.MathFX.smooth(_S.index_value(_n_RUNES,0),_n_FLASH,_n_t_b0)))
	if _S.truth((_n_t_b0 < (_n_FLASH + 0.07))):
		return 1.2
	if _S.truth((_n_t_b0 < _n_BREAK)):
		return 0.92
	return (0.92 * (1 - _S.MathFX.smooth(_n_BREAK,_n_GONE,_n_t_b0)))
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "planeLine", _S.function_value(_e, "_f2"))
	_S.define(_e, "circle", _S.function_value(_e, "_f5"))
	_S.define(_e, "runes", _S.function_value(_e, "_f15"))
	_S.define(_e, "column", _S.function_value(_e, "_f16"))
	_S.define(_e, "shock", _S.function_value(_e, "_f17"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.read(_e, "S")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f19")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "COL", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)])
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f20")]))
	_S.define(_e, "tri", _S.function_value(_e, "_f21"))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "tri"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)]))
	_S.define(_e, "Bt", _S.call_value(_S.read(_e, "tri"), [_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)]))
	_S.define(_e, "edges", [])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "k"), 3)):
		for _v27 in _S.array([_S.read(_v26, "A"), _S.read(_v26, "Bt")]):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "T", _v27)
			_S.invoke(_S.read(_v28, "edges"), "push", [_S.merge([{"p0": _S.prop(_S.read(_v28, "T"), _S.read(_v28, "k"))}, {"p1": _S.prop(_S.read(_v28, "T"), _S.binary("%", _S.binary("+", _S.read(_v28, "k"), 1), 3))}, {"t0": _S.binary("+", _S.prop(_S.read(_v28, "STAR"), 0), _S.binary("/", _S.binary("*", _S.read(_v28, "k"), _S.binary("-", _S.prop(_S.read(_v28, "STAR"), 1), _S.prop(_S.read(_v28, "STAR"), 0))), 3))}, {"dur": _S.binary("/", _S.binary("-", _S.prop(_S.read(_v28, "STAR"), 1), _S.prop(_S.read(_v28, "STAR"), 0)), 3)}])])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "k", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "flashed", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "out", _S.invoke(_S.construct(_S.read(_e, "Array"), [_S.read(_e, "NRUNE")]), "fill", [false]))
	_S.define(_e, "lineCol", _S.function_value(_e, "_f24"))
	_S.define(_e, "lineA", _S.function_value(_e, "_f25"))
	return _S.merge([{"update": _S.function_value(_e, "_f26")}, {"drawBack": _S.function_value(_e, "_f28")}, {"draw": _S.function_value(_e, "_f29")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "p0", _S.arg(_args, 1))
	_S.define(_e, "p1", _S.arg(_args, 2))
	_S.define(_e, "t0", _S.arg(_args, 3))
	_S.define(_e, "dur", _S.arg(_args, 4))
	_S.define(_e, "lvl", _S.arg(_args, 5))
	_S.define(_e, "far", _S.arg(_args, 6))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "dur"))]))
	if _S.truth(_S.binary("<=", _S.read(_e, "s"), 0)):
		return null
	_S.define(_e, "u0", 0)
	_S.define(_e, "u1", _S.read(_e, "s"))
	_S.define(_e, "v0", _S.prop(_S.read(_e, "p0"), 1))
	_S.define(_e, "v1", _S.prop(_S.read(_e, "p1"), 1))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "v0"), 0), _S.binary("<", _S.read(_e, "v1"), 0))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "uc", _S.binary("/", _S.read(_v0, "v0"), _S.binary("-", _S.read(_v0, "v0"), _S.read(_v0, "v1"))))
		if _S.truth(_S.binary("===", _S.binary("<", _S.read(_v0, "v0"), 0), _S.read(_v0, "far"))):
			_S.write(_v0, "u1", _S.invoke(_S.read(_v0, "Math"), "min", [_S.read(_v0, "u1"), _S.read(_v0, "uc")]), "=", false)
		else:
			_S.write(_v0, "u0", _S.read(_v0, "uc"), "=", false)
	else:
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "v0"), 0), _S.read(_e, "far"))):
			return null
	if _S.truth(_S.binary("<=", _S.read(_e, "u1"), _S.read(_e, "u0"))):
		return null
	_S.define(_e, "P", _S.function_value(_e, "_f3"))
	var _v1 = _S.call_value(_S.read(_e, "P"), [_S.read(_e, "u0")])
	_S.define(_e, "xa", _S.prop(_v1, 0))
	_S.define(_e, "ya", _S.prop(_v1, 1))
	var _v2 = _S.call_value(_S.read(_e, "P"), [_S.read(_e, "u1")])
	_S.define(_e, "xb", _S.prop(_v2, 0))
	_S.define(_e, "yb", _S.prop(_v2, 1))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "xa"), _S.read(_e, "ya"), _S.read(_e, "xb"), _S.read(_e, "yb"), _S.function_value(_e, "_f4"), _S.call_value(_S.read(_e, "lineA"), [_S.read(_e, "lvl")])])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p0 = _S.read(_parent,"p0")
	var _n_p1 = _S.read(_parent,"p1")
	var _n_v0 = _S.read(_parent,"v0")
	var _n_v1 = _S.read(_parent,"v1")
	var _n_SY = _S.read(_parent,"SY")
	var _n_u_b0 = _S.arg(_args,0)
	return [(_S.index_value(_n_p0,0) + ((_S.index_value(_n_p1,0) - _S.index_value(_n_p0,0)) * _n_u_b0)), ((_n_v0 + ((_n_v1 - _n_v0) * _n_u_b0)) * _n_SY)]
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_lineCol = _S.read(_parent,"lineCol")
	var _n_lvl = _S.read(_parent,"lvl")
	var _n_t = _S.read(_parent,"t")
	var _n_t0 = _S.read(_parent,"t0")
	var _n_u0 = _S.read(_parent,"u0")
	var _n_u1 = _S.read(_parent,"u1")
	var _n_dur = _S.read(_parent,"dur")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_lineCol,[_n_lvl, (_n_t - (_n_t0 + ((_n_u0 + ((_n_u1 - _n_u0) * _n_q_b0)) * _n_dur)))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_level = _S.read(_parent,"level")
	var _n_lineA = _S.read(_parent,"lineA")
	var _n_RUNES = _S.read(_parent,"RUNES")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_R = _S.read(_parent,"R")
	var _n_R2 = _S.read(_parent,"R2")
	var _n_RI = _S.read(_parent,"RI")
	var _n_innerAt = _S.read(_parent,"innerAt")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_outerAt = _S.read(_parent,"outerAt")
	var _n_PEN2 = _S.read(_parent,"PEN2")
	var _n_SY = _S.read(_parent,"SY")
	var _n_lineCol = _S.read(_parent,"lineCol")
	var _n_planeLine = _S.read(_parent,"planeLine")
	var _n_edges = _S.read(_parent,"edges")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_far_b1 = _S.arg(_args,1)
	if _S.truth((_n_t >= _n_GONE)):
		return null
	var _n_lvl_b2 = _S.call_value(_n_level,[_n_t])
	var _n_keep_b3 = (_S.function_value(_S.capture(_parent,{"this":_this}),"_f6") if _S.truth(_n_far_b1) else _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"))
	var _n_a_b4 = _S.call_value(_n_lineA,[_n_lvl_b2])
	var _n_ring_b5 = _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"lvl":_n_lvl_b2,"a":_n_a_b4,"keep":_n_keep_b3,"this":_this}),"_f8")
	var _n_run_b6 = ((((_n_t - _S.index_value(_n_RUNES,0)) * 5) + (pow((_n_t - _S.index_value(_n_RUNES,0)),2) * 4)) if _S.truth(((_n_t < _n_BREAK) if _S.truth((_n_t > _S.index_value(_n_RUNES,0))) else (_n_t > _S.index_value(_n_RUNES,0)))) else null)
	var _n_chase_b7 = (null if _S.truth(_S.binary("===",_n_run_b6,null)) else _S.function_value(_S.capture(_parent,{"run":_n_run_b6,"this":_this}),"_f11"))
	_S.call_value(_n_ring_b5,[_n_R, _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _n_chase_b7])
	_S.call_value(_n_ring_b5,[_n_R2, _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
	_S.call_value(_n_ring_b5,[_n_RI, _n_innerAt])
	if true:
		var _n_j_b8 = 0
		while _S.truth((_n_j_b8 < 32)):
			var _n_g_b9 = (float(((_n_j_b8 + 0.5) * _n_TAU))/32)
			if _S.truth(_S.binary("!==",(sin(_n_g_b9) < 0),_n_far_b1)):
				_n_j_b8 += 1.0
				continue
			var _n_when_b10 = (_S.call_value(_n_outerAt,[_n_g_b9, _n_PEN2]) + 0.03)
			if _S.truth((_n_t < _n_when_b10)):
				_n_j_b8 += 1.0
				continue
			_S.invoke(_n_p_b0,"line",[(cos(_n_g_b9) * _n_R2), ((sin(_n_g_b9) * _n_R2) * _n_SY), (cos(_n_g_b9) * _n_R), ((sin(_n_g_b9) * _n_R) * _n_SY), _S.call_value(_n_lineCol,[_n_lvl_b2, (_n_t - _n_when_b10)]), (_n_a_b4 * (0.6 if _S.truth(fmod(_n_j_b8,2)) else 1))])
			_n_j_b8 += 1.0
	for _iter_0 in _S.array(_n_edges):
		var _n_e_b11 = _iter_0
		_S.call_value(_n_planeLine,[_n_p_b0, _S.named_value(_n_e_b11,"p0"), _S.named_value(_n_e_b11,"p1"), _S.named_value(_n_e_b11,"t0"), _S.named_value(_n_e_b11,"dur"), _n_lvl_b2, _n_far_b1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_SY = _S.read(_parent,"SY")
	var _n_this = _S.read(_parent,"this")
	var _n_keep = _S.read(_parent,"keep")
	var _n_floorRing = _S.read(_parent,"floorRing")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_when_b1 = _S.arg(_args,1)
	var _n_chase_b2 = _S.arg(_args,2)
	return _S.call_value(_n_floorRing,[_n_p, 0, 0, _n_r_b0, _n_SY, _S.function_value(_S.capture(_parent,{"chase":_n_chase_b2,"when":_n_when_b1,"this":_n_this}),"_f9"), _S.function_value(_S.capture(_parent,{"when":_n_when_b1,"this":_n_this}),"_f10"), _n_keep])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_chase = _S.read(_parent,"chase")
	var _n_lineCol = _S.read(_parent,"lineCol")
	var _n_lvl = _S.read(_parent,"lvl")
	var _n_t = _S.read(_parent,"t")
	var _n_when = _S.read(_parent,"when")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_S.call_value(_n_chase,[_n_g_b0]) if _S.truth(_n_chase) else _n_chase)) else _S.call_value(_n_lineCol,[_n_lvl, (_n_t - _S.call_value(_n_when,[_n_g_b0]))]))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_when = _S.read(_parent,"when")
	var _n_a = _S.read(_parent,"a")
	var _n_g_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t < _S.call_value(_n_when,[_n_g_b0]))) else _n_a)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke([0, PI],"some",[_S.function_value(_S.capture(_parent,{"g":_n_g_b0,"this":_n_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g = _S.read(_parent,"g")
	var _n_run = _S.read(_parent,"run")
	var _n_o_b0 = _S.arg(_args,0)
	return (absf(atan2(sin(((_n_g - _n_run) - _n_o_b0)),cos(((_n_g - _n_run) - _n_o_b0)))) < 0.22)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_outerAt = _S.read(_parent,"outerAt")
	var _n_PEN = _S.read(_parent,"PEN")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_outerAt,[_n_g_b0, _n_PEN])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_outerAt = _S.read(_parent,"outerAt")
	var _n_PEN2 = _S.read(_parent,"PEN2")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_outerAt,[_n_g_b0, _n_PEN2])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_runeAngle = _S.read(_parent,"runeAngle")
	var _n_RR = _S.read(_parent,"RR")
	var _n_SY = _S.read(_parent,"SY")
	var _n_t = _S.read(_parent,"t")
	var _n_runeLit = _S.read(_parent,"runeLit")
	var _n_runeOut = _S.read(_parent,"runeOut")
	var _n_innerAt = _S.read(_parent,"innerAt")
	var _n_C = _S.read(_parent,"C")
	var _n_glyph = _S.read(_parent,"glyph")
	var _n_ease = _S.read(_parent,"ease")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_level = _S.read(_parent,"level")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_NRUNE = _S.read(_parent,"NRUNE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_far_b1 = _S.arg(_args,1)
	if true:
		var _n_k_b2 = 0
		while _S.truth((_n_k_b2 < _n_NRUNE)):
			var _n_g_b3 = _S.call_value(_n_runeAngle,[_n_k_b2])
			if _S.truth(_S.binary("!==",(sin(_n_g_b3) < 0),_n_far_b1)):
				_n_k_b2 += 1.0
				continue
			var _n_x_b4 = (cos(_n_g_b3) * _n_RR)
			var _n_y0_b5 = ((sin(_n_g_b3) * _n_RR) * _n_SY)
			var _n_lit_b6 = (_n_t - _S.call_value(_n_runeLit,[_n_k_b2]))
			var _n_gone_b7 = clampf((float((_n_t - _S.call_value(_n_runeOut,[_n_k_b2])))/0.25),0.0,1.0)
			if _S.truth(_S.logical("||",(_n_t < _S.call_value(_n_innerAt,[_n_g_b3])),func():return (_n_gone_b7 >= 1))):
				_n_k_b2 += 1.0
				continue
			if _S.truth((_n_lit_b6 < 0)):
				_S.call_value(_n_glyph,[_n_p_b0, _n_k_b2, _n_x_b4, (_n_y0_b5 - 1), _S.index_value(_n_C,3)])
				_n_k_b2 += 1.0
				continue
			var _n_rise_b8 = (3 * _S.invoke(_n_ease,"outBack",[clampf((float(_n_lit_b6)/0.2),0.0,1.0), 2.4]))
			var _n_bob_b9 = ((sin(((_n_t * 5) + _n_k_b2)) * 0.5) if _S.truth((_n_lit_b6 > 0.2)) else 0)
			var _n_y_b10 = (((_n_y0_b5 - 1) - _n_rise_b8) + _n_bob_b9)
			var _n_hot_b11 = ((_n_lit_b6 < 0.07) if _S.truth((_n_lit_b6 < 0.07)) else ((_n_t < (_n_FLASH + 0.07)) if _S.truth((_n_t > _n_FLASH)) else (_n_t > _n_FLASH)))
			var _n_lvl_b12 = _S.call_value(_n_level,[_n_t])
			_S.call_value(_n_glyph,[_n_p_b0, _n_k_b2, _n_x_b4, _n_y_b10, (_n_WHITE if _S.truth(_n_hot_b11) else (_n_WHITE if _S.truth((_n_lvl_b12 > 0.8)) else _S.index_value(_n_C,6))), (1 - _n_gone_b7), (_S.index_value(_n_C,6) if _S.truth(_n_hot_b11) else _S.index_value(_n_C,4))])
			if _S.truth((_n_lit_b6 < 0.1)):
				_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b4, (_n_y_b10 - 2), ((4 * (1 - (float(_n_lit_b6)/0.1))) + 1), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.5])
			_S.invoke(_n_p_b0,"glow",[_n_x_b4, (_n_y_b10 - 2), 8, _S.index_value(_n_C,5), ((0.3 + (0.3 * _n_lvl_b12)) * (1 - _n_gone_b7))])
			_S.invoke(_n_p_b0,"glow",[_n_x_b4, _n_y0_b5, 6, _S.index_value(_n_C,4), (0.2 * (1 - _n_gone_b7))])
			_n_k_b2 += 1.0
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_W = _S.read(_parent,"W")
	var _n_S = _S.read(_parent,"S")
	var _n_strands = _S.read(_parent,"strands")
	var _n_COL = _S.read(_parent,"COL")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t < (_n_FLASH - 0.22)) if _S.truth((_n_t < (_n_FLASH - 0.22))) else (_n_t > (_n_BREAK + 0.6)))):
		return null
	if _S.truth((_n_t < _n_FLASH)):
		var _n_a_b7 = _S.MathFX.smooth((_n_FLASH - 0.22),(_n_FLASH - 0.04),_n_t)
		var _n_top_b8 = ((-(_n_TOP - 10)) * _S.invoke(_n_ease,"outCubic",[_n_a_b7]))
		if true:
			var _n_y_b9 = (-1)
			while _S.truth((_n_y_b9 >= _n_top_b8)):
				_S.invoke(_n_p_b0,"dot",[0, _n_y_b9, (_S.index_value(_n_C,6) if _S.truth((_n_y_b9 > (_n_top_b8 + 6))) else _n_WHITE), (_n_a_b7 * (0.35 + (0.65 * (1 + (float(_n_y_b9)/_n_TOP)))))])
				_n_y_b9 -= 1.0
		_S.invoke(_n_p_b0,"glow",[0, _n_top_b8, 9, _S.index_value(_n_C,6), (0.5 * _n_a_b7)])
		_S.invoke(_n_p_b0,"glow",[0, (-6), 24, _S.index_value(_n_C,5), (0.4 * _n_a_b7)])
		return null
	var _n_u_b1 = (_n_t - _n_FLASH)
	var _n_brk_b2 = clampf((float((_n_t - _n_BREAK))/0.45),0.0,1.0)
	var _n_top_b3 = ((-_n_TOP) * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b1)/0.09),0.0,1.0)]))
	var _n_w_b4 = ((_n_W * (1 + (0.38 * exp(((-_n_u_b1) * 9))))) if _S.truth((_n_t < _n_BREAK)) else (_n_W * (1 - (_S.invoke(_n_ease,"outCubic",[_n_brk_b2]) * 0.85))))
	var _n_fade_b5 = (1 - _S.MathFX.smooth((_n_BREAK + 0.25),(_n_BREAK + 0.55),_n_t))
	var _n_white_b6 = (_n_u_b1 < 0.067)
	if _S.truth((_n_fade_b5 <= 0)):
		return null
	if true:
		var _n_y_b10 = 3
		while _S.truth((_n_y_b10 >= ceili(_n_top_b3))):
			var _n_h_b11 = (-_n_y_b10)
			var _n_ww_b12 = (_n_w_b4 * (1 + (0.5 * exp((float((-maxf(0,_n_h_b11)))/6)))))
			var _n_pulse_b13 = (1 if _S.truth((_S.MathFX.fract(((_n_h_b11 * 0.022) - (_n_u_b1 * 2.6))) < 0.07)) else 0)
			if true:
				var _n_x_b14 = floori(((-_n_ww_b12) * 1.3))
				while _S.truth((_n_x_b14 <= ceili((_n_ww_b12 * 1.3)))):
					var _n_q_b15 = (float(absf((_n_x_b14 + 0.5)))/_n_ww_b12)
					if _S.truth(((((_S.NoiseKernels.noise2((_n_x_b14 * 0.32),((_n_h_b11 * 0.11) - ((_n_t - _n_BREAK) * 6)),_n_S) * 0.5) + 0.5) < ((_n_brk_b2 * 1.25) - 0.1)) if _S.truth((_n_brk_b2 > 0)) else (_n_brk_b2 > 0))):
						_n_x_b14 += 1.0
						continue
					var _n_lv_b16 = (0 if _S.truth((_n_q_b15 < 0.2)) else (1 if _S.truth((_n_q_b15 < 0.42)) else (2 if _S.truth((_n_q_b15 < 0.66)) else (3 if _S.truth((_n_q_b15 < 0.88)) else 4))))
					for _iter_0 in _S.array(_n_strands):
						var _n_s_b18 = _iter_0
						if _S.truth((absf((((float((_n_x_b14 + 0.5))/_n_ww_b12) - _S.named_value(_n_s_b18,"o")) - (0.05 * sin(((_n_t * _S.named_value(_n_s_b18,"f")) + (_S.named_value(_n_s_b18,"o") * 9)))))) < _S.named_value(_n_s_b18,"w"))):
							_n_lv_b16 = maxf(0,(_n_lv_b16 - 1))
					_n_lv_b16 = (0 if _S.truth(_n_white_b6) else maxf(0,(_n_lv_b16 - _n_pulse_b13)))
					var _n_a_b17 = ((1 if _S.truth((_n_q_b15 < 0.88)) else (float((1.3 - _n_q_b15))/0.42)) * _n_fade_b5)
					if _S.truth((_n_a_b17 <= (((_S.Painter.BAYER[((floori(_n_y_b10)&3)<<2)|(floori(_n_x_b14)&3)]+0.5)/16.0) * (0.2 if _S.truth((_n_q_b15 < 0.66)) else 1)))):
						_n_x_b14 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[_n_x_b14, _n_y_b10, _S.index_value(_n_COL,_n_lv_b16)])
					_n_x_b14 += 1.0
			if _S.truth(((_n_h_b11 < ((_n_TOP - (_n_ww_b12 * 2.4)) - 8)) if _S.truth(_S.binary("===",_S.binary("&",_n_h_b11,7),0)) else _S.binary("===",_S.binary("&",_n_h_b11,7),0))):
				_S.invoke(_n_p_b0,"glow",[0, _n_y_b10, ((_n_ww_b12 * 2.4) + 6), _S.index_value(_n_C,5), (0.3 * _n_fade_b5)])
			_n_y_b10 -= 1.0
	if true:
		var _n_i_b19 = 0
		while _S.truth((_n_i_b19 < 6)):
			var _n_k_b20 = (float((_n_t - ((_n_FLASH + 0.08) + (_n_i_b19 * 0.16))))/0.8)
			if _S.truth(((_n_k_b20 < 0) if _S.truth((_n_k_b20 < 0)) else (_n_k_b20 > 1))):
				_n_i_b19 += 1.0
				continue
			var _n_rx_b21 = ((_n_w_b4 * 1.4) * (1 + (_n_k_b20 * 0.35)))
			var _n_ry_b22 = (_n_rx_b21 * 0.3)
			var _n_yc_b23 = ((-3) - (_S.invoke(_n_ease,"outQuad",[_n_k_b20]) * 120))
			var _n_n_b24 = ceili((_n_rx_b21 * 7))
			if true:
				var _n_j_b25 = 0
				while _S.truth((_n_j_b25 < _n_n_b24)):
					var _n_g_b26 = ((float(_n_j_b25)/_n_n_b24) * _n_TAU)
					_S.invoke(_n_p_b0,"dot",[(cos(_n_g_b26) * _n_rx_b21), (_n_yc_b23 + (sin(_n_g_b26) * _n_ry_b22)), (_n_WHITE if _S.truth((_n_k_b20 < 0.3)) else _S.index_value(_n_C,6)), (((1 - _n_k_b20) * _n_fade_b5) * (0.6 if _S.truth((sin(_n_g_b26) < 0)) else 1))])
					_n_j_b25 += 1.0
			_n_i_b19 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-4), 34, _S.index_value(_n_C,6), (0.45 * _n_fade_b5)])
	_S.invoke(_n_p_b0,"glow",[0, (-60), 70, _S.index_value(_n_C,4), (0.25 * _n_fade_b5)])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_R = _S.read(_parent,"R")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_far_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array([[0, (_n_R * 0.6), (_n_R * 2), 6, 0.5], [0.08, (_n_R * 0.4), (_n_R * 1.4), 3, 0.4]]):
		var _tuple_1 = _iter_0
		var _n_d_b2 = _S.prop(_tuple_1,0)
		var _n_r0_b3 = _S.prop(_tuple_1,1)
		var _n_r1_b4 = _S.prop(_tuple_1,2)
		var _n_th_b5 = _S.prop(_tuple_1,3)
		var _n_dur_b6 = _S.prop(_tuple_1,4)
		var _n_k_b7 = (float(((_n_t - _n_FLASH) - _n_d_b2))/_n_dur_b6)
		if _S.truth(((_n_k_b7 < 0) if _S.truth((_n_k_b7 < 0)) else (_n_k_b7 >= 1))):
			continue
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (_n_r0_b3 + ((_n_r1_b4 - _n_r0_b3) * _S.invoke(_n_ease,"outCubic",[_n_k_b7]))), _n_SY, maxf(1,(_n_th_b5 * (1 - _n_k_b7))), (1.15 - _n_k_b7), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"far":_n_far_b1,"this":_this}),"_f18"), (_n_k_b7 < 0.2)])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_far = _S.read(_parent,"far")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_far)
	return null

static func _f19(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	return {"o":_S.invoke(_n_Rg,"range",[(-0.85), 0.85]),"w":_S.invoke(_n_Rg,"range",[0.04, 0.1]),"f":_S.invoke(_n_Rg,"range",[1, 3])}
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_a0_b0 = _S.arg(_args,0)
	return _S.invoke(_S.invoke([0, 1, 2],"map",[_S.function_value(_S.capture(_parent,{"a0":_n_a0_b0,"this":_n_this}),"_f22")]),"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f23")])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_a0 = _S.read(_parent,"a0")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_k_b0 = _S.arg(_args,0)
	return (_n_a0 + (float((_n_k_b0 * _n_TAU))/3))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_RI = _S.read(_parent,"RI")
	var _n_a_b0 = _S.arg(_args,0)
	return [(cos(_n_a_b0) * _n_RI), (sin(_n_a_b0) * _n_RI)]
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_lvl_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth((_n_age_b1 < 0.05)) else (_S.index_value(_n_C,6) if _S.truth((_n_age_b1 < 0.16)) else (_n_WHITE if _S.truth((_n_lvl_b0 > 1)) else (_S.index_value(_n_C,6) if _S.truth((_n_lvl_b0 > 0.8)) else (_S.index_value(_n_C,5) if _S.truth((_n_lvl_b0 > 0.45)) else (_S.index_value(_n_C,4) if _S.truth((_n_lvl_b0 > 0.28)) else _S.index_value(_n_C,3)))))))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_lvl_b0 = _S.arg(_args,0)
	return clampf((float(_n_lvl_b0)/0.3),0.0,1.0)
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "PEN"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "STAR"), 1))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "x", null)
		_S.define(_v29, "y", null)
		if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.prop(_S.read(_v29, "PEN"), 1))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "g", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v30, "Math"), "PI"), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "Rg"), "sign", []), _S.binary("/", _S.binary("-", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "PEN"), 0)), _S.binary("-", _S.prop(_S.read(_v30, "PEN"), 1), _S.prop(_S.read(_v30, "PEN"), 0)))), _S.prop(_S.read(_v30, "Math"), "PI"))))
			_S.last([_S.write(_v30, "x", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "g")]), _S.read(_v30, "R")), "=", false), _S.write(_v30, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "g")]), _S.read(_v30, "R")), _S.read(_v30, "SY")), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.prop(_S.read(_v29, "INNER"), 1))):
				var _v31 = _S.scope(_v29)
				_S.define(_v31, "g", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v31, "Math"), "PI")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v31, "t"), _S.prop(_S.read(_v31, "INNER"), 0)), _S.binary("-", _S.prop(_S.read(_v31, "INNER"), 1), _S.prop(_S.read(_v31, "INNER"), 0))), _S.read(_v31, "TAU"))))
				_S.last([_S.write(_v31, "x", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "g")]), _S.read(_v31, "RI")), "=", false), _S.write(_v31, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "g")]), _S.read(_v31, "RI")), _S.read(_v31, "SY")), "=", false)])
			else:
				var _v32 = _S.scope(_v29)
				_S.define(_v32, "e", _S.logical("??", _S.invoke(_S.read(_v32, "Rg"), "pick", [_S.invoke(_S.read(_v32, "edges"), "filter", [_S.function_value(_v32, "_f27")])]), func(): return _S.prop(_S.read(_v32, "edges"), 0)))
				_S.define(_v32, "s", _S.call_value(_S.read(_v32, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v32, "t"), _S.prop(_S.read(_v32, "e"), "t0")), _S.prop(_S.read(_v32, "e"), "dur"))]))
				_S.last([_S.write(_v32, "x", _S.binary("+", _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v32, "e"), "p1"), 0), _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 0)), _S.read(_v32, "s"))), "=", false), _S.write(_v32, "y", _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v32, "e"), "p1"), 1), _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 1)), _S.read(_v32, "s"))), _S.read(_v32, "SY")), "=", false)])
		_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "EMBER"), _S.read(_v29, "x"), _S.binary("-", _S.read(_v29, "y"), 1), _S.invoke(_S.read(_v29, "Rg"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v29, "Rg"), "range", [_S.unary("-", 30), _S.unary("-", 8)]), _S.invoke(_S.read(_v29, "Rg"), "range", [0.25, 0.55]), _S.prop(_S.read(_v29, "C"), 6), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "RUNES"), 1), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.05))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.7]))):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "g", _S.invoke(_S.read(_v33, "Rg"), "range", [0, _S.read(_v33, "TAU")]))
		_S.define(_v33, "D", _S.invoke(_S.read(_v33, "Rg"), "range", [_S.binary("*", _S.read(_v33, "R"), 0.7), _S.binary("*", _S.read(_v33, "R"), 1.1)]))
		_S.define(_v33, "T", _S.invoke(_S.read(_v33, "Rg"), "range", [0.16, 0.24]))
		_S.define(_v33, "v", _S.binary("/", _S.binary("*", _S.read(_v33, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v33, "Math"), "exp", [_S.binary("*", 3, _S.read(_v33, "T"))]), 1)))
		_S.define(_v33, "x", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "g")]), _S.read(_v33, "D")))
		_S.define(_v33, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "g")]), _S.read(_v33, "D")), _S.read(_v33, "SY")), 1))
		_S.define(_v33, "l", _S.logical("||", _S.invoke(_S.read(_v33, "Math"), "hypot", [_S.read(_v33, "x"), _S.binary("+", _S.read(_v33, "y"), 2)]), func(): return 1))
		_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "STREAK"), _S.read(_v33, "x"), _S.read(_v33, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v33, "x")), _S.read(_v33, "l")), _S.read(_v33, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.unary("-", 2), _S.read(_v33, "y")), _S.read(_v33, "l")), _S.read(_v33, "v")), _S.read(_v33, "T"), (_S.prop(_S.read(_v33, "C"), 6) if _S.truth(_S.invoke(_S.read(_v33, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v33, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "flashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v34 = _S.scope(_e)
		_S.write(_v34, "flashed", true, "=", false)
		_S.invoke(_S.read(_v34, "lights"), "add", [0, _S.unary("-", 56), 104, _S.prop(_S.read(_v34, "C"), 5), 0.9, 0.6])
		_S.invoke(_S.read(_v34, "lights"), "add", [0, _S.unary("-", 5), 36, _S.read(_v34, "WHITE"), 0.8, 0.14])
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), 36)):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "s", _S.invoke(_S.read(_v36, "Rg"), "sign", []))
			_S.define(_v36, "sp", _S.invoke(_S.read(_v36, "Rg"), "range", [80, 175]))
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SPARK"), _S.binary("*", _S.read(_v36, "s"), _S.invoke(_S.read(_v36, "Rg"), "range", [0, _S.binary("*", _S.read(_v36, "R"), 0.5)])), _S.unary("-", 1), _S.binary("*", _S.read(_v36, "s"), _S.read(_v36, "sp")), _S.unary("-", _S.invoke(_S.read(_v36, "Rg"), "range", [30, 180])), _S.invoke(_S.read(_v36, "Rg"), "range", [0.25, 0.7])])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
		var _v37 = _S.scope(_v34)
		_S.define(_v37, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "i"), 26)):
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "STAR"), _S.invoke(_S.read(_v37, "Rg"), "range", [_S.unary("-", _S.read(_v37, "R")), _S.read(_v37, "R")]), _S.unary("-", _S.invoke(_S.read(_v37, "Rg"), "range", [1, 6])), _S.invoke(_S.read(_v37, "Rg"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v37, "Rg"), "range", [40, 130])), _S.invoke(_S.read(_v37, "Rg"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v37, "Rg"), "pick", [[_S.read(_v37, "WHITE"), _S.prop(_S.read(_v37, "C"), 6), _S.prop(_S.read(_v37, "C"), 5)]]), _S.invoke(_S.read(_v37, "Rg"), "range", [0.8, 2.3])])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "i", 1, "+=", true)
		var _v38 = _S.scope(_v34)
		_S.define(_v38, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v38, "i"), 34)):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "s", _S.invoke(_S.read(_v39, "Rg"), "sign", []))
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STAR"), _S.binary("*", _S.read(_v39, "s"), _S.invoke(_S.read(_v39, "Rg"), "range", [0, 14])), _S.unary("-", _S.invoke(_S.read(_v39, "Rg"), "range", [1, 4])), _S.binary("*", _S.read(_v39, "s"), _S.invoke(_S.read(_v39, "Rg"), "range", [50, 140])), _S.unary("-", _S.invoke(_S.read(_v39, "Rg"), "range", [10, 90])), _S.invoke(_S.read(_v39, "Rg"), "range", [0.4, 0.95]), _S.invoke(_S.read(_v39, "Rg"), "pick", [[_S.read(_v39, "WHITE"), _S.prop(_S.read(_v39, "C"), 6), _S.prop(_S.read(_v39, "C"), 6), _S.prop(_S.read(_v39, "C"), 5)]]), _S.invoke(_S.read(_v39, "Rg"), "range", [0.7, 2.2])])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 0.2))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.12]))):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "g", _S.invoke(_S.read(_v40, "Rg"), "range", [0, _S.read(_v40, "TAU")]))
		_S.define(_v40, "r", _S.invoke(_S.read(_v40, "Rg"), "pick", [[_S.read(_v40, "R"), _S.read(_v40, "R2"), _S.read(_v40, "RI")]]))
		_S.invoke(_S.read(_v40, "ps"), "spawn", [_S.prop(_S.read(_v40, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "g")]), _S.read(_v40, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "g")]), _S.read(_v40, "r")), _S.read(_v40, "SY")), 0.5), 0, _S.unary("-", _S.invoke(_S.read(_v40, "Rg"), "range", [2, 8])), _S.invoke(_S.read(_v40, "Rg"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v40, "Rg"), "pick", [[_S.read(_v40, "WHITE"), _S.prop(_S.read(_v40, "C"), 6)]]), _S.invoke(_S.read(_v40, "Rg"), "range", [0.8, 2])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v41 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.5])):
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v41, "W")), 1.5), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [0, 120])), _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [30, 85])), _S.invoke(_S.read(_v41, "Rg"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v41, "Rg"), "pick", [[_S.read(_v41, "WHITE"), _S.prop(_S.read(_v41, "C"), 6), _S.prop(_S.read(_v41, "C"), 5)]]), _S.invoke(_S.read(_v41, "Rg"), "range", [0.7, 2])])
		if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.35])):
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "MOTE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v41, "W")), 0.8), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [0, 50])), 0, _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [160, 300])), _S.invoke(_S.read(_v41, "Rg"), "range", [0.2, 0.35]), (_S.read(_v41, "WHITE") if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v41, "C"), 6)), 0.8])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broke")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v42 = _S.scope(_e)
		_S.write(_v42, "broke", true, "=", false)
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v43, "i"), 46)):
			_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v43, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v43, "W")), 0.9), _S.unary("-", _S.invoke(_S.read(_v43, "Rg"), "range", [2, _S.binary("*", _S.read(_v43, "TOP"), 0.8)])), _S.invoke(_S.read(_v43, "Rg"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v43, "Rg"), "range", [8, 40])), _S.invoke(_S.read(_v43, "Rg"), "range", [0.5, 1.15]), _S.invoke(_S.read(_v43, "Rg"), "pick", [[_S.read(_v43, "WHITE"), _S.read(_v43, "WHITE"), _S.prop(_S.read(_v43, "C"), 6), _S.prop(_S.read(_v43, "C"), 5)]]), _S.invoke(_S.read(_v43, "Rg"), "range", [0.6, 2.4])])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 0.4))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.8]))):
		var _v44 = _S.scope(_e)
		_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "W")), 0.7), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [2, _S.binary("*", _S.read(_v44, "TOP"), 0.78)])), _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [10, 50])), _S.invoke(_S.read(_v44, "Rg"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v44, "Rg"), "pick", [[_S.read(_v44, "WHITE"), _S.prop(_S.read(_v44, "C"), 6), _S.prop(_S.read(_v44, "C"), 5)]]), _S.invoke(_S.read(_v44, "Rg"), "range", [0.6, 1.8])])
		if _S.truth(_S.invoke(_S.read(_v44, "Rg"), "chance", [0.4])):
			_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "MOTE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "W")), 0.5), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [2, _S.binary("*", _S.read(_v44, "TOP"), 0.7)])), 0, _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [60, 140])), _S.invoke(_S.read(_v44, "Rg"), "range", [0.2, 0.4]), _S.prop(_S.read(_v44, "C"), 6), 0.7])
	var _v45 = _S.scope(_e)
	_S.define(_v45, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "k"), _S.read(_v45, "NRUNE"))):
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v45, "out"), _S.read(_v45, "k"))), func(): return _S.binary(">=", _S.read(_v45, "t"), _S.call_value(_S.read(_v45, "runeOut"), [_S.read(_v45, "k")])))):
			var _v46 = _S.scope(_v45)
			_S.set_prop(_S.read(_v46, "out"), _S.read(_v46, "k"), true, "=", false)
			_S.define(_v46, "g", _S.call_value(_S.read(_v46, "runeAngle"), [_S.read(_v46, "k")]))
			_S.define(_v46, "x", _S.binary("*", _S.invoke(_S.read(_v46, "Math"), "cos", [_S.read(_v46, "g")]), _S.read(_v46, "RR")))
			_S.define(_v46, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v46, "Math"), "sin", [_S.read(_v46, "g")]), _S.read(_v46, "RR")), _S.read(_v46, "SY")), 5))
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v47, "i"), 4)):
				_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.binary("+", _S.read(_v47, "x"), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v47, "y"), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v47, "Rg"), "range", [10, 40])), _S.invoke(_S.read(_v47, "Rg"), "range", [0.3, 0.55]), _S.invoke(_S.read(_v47, "Rg"), "pick", [[_S.read(_v47, "WHITE"), _S.prop(_S.read(_v47, "C"), 6)]]), _S.invoke(_S.read(_v47, "Rg"), "range", [0.6, 1.6])])
				_v47 = _S.iteration(_v47)
				_S.write(_v47, "i", 1, "+=", true)
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_e_b0 = _S.arg(_args,0)
	return ((_n_t < (_S.named_value(_n_e_b0,"t0") + _S.named_value(_n_e_b0,"dur"))) if _S.truth((_n_t >= _S.named_value(_n_e_b0,"t0"))) else (_n_t >= _S.named_value(_n_e_b0,"t0")))
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_level = _S.read(_parent,"level")
	var _n_t = _S.read(_parent,"t")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_PEN = _S.read(_parent,"PEN")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_shock = _S.read(_parent,"shock")
	var _n_circle = _S.read(_parent,"circle")
	var _n_runes = _S.read(_parent,"runes")
	var _n_column = _S.read(_parent,"column")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_lvl_b1 = _S.call_value(_n_level,[_n_t])
	if _S.truth((_n_t < _n_GONE)):
		var _n_k_b2 = (_n_lvl_b1 * _S.MathFX.smooth(_S.index_value(_n_PEN,0),(_S.index_value(_n_PEN,1) + 0.2),_n_t))
		_S.invoke(_n_p_b0,"glow",[0, 0, (_n_R * 1.3), _S.index_value(_n_C,4), (0.28 * _n_k_b2)])
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b3 = _iter_0
			_S.invoke(_n_p_b0,"glow",[((_n_s_b3 * _n_R) * 0.6), 1, (_n_R * 0.7), _S.index_value(_n_C,5), (0.12 * _n_k_b2)])
	_S.call_value(_n_shock,[_n_p_b0, true])
	_S.call_value(_n_circle,[_n_p_b0, true])
	_S.call_value(_n_runes,[_n_p_b0, true])
	_S.call_value(_n_column,[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_shock = _S.read(_parent,"shock")
	var _n_circle = _S.read(_parent,"circle")
	var _n_runes = _S.read(_parent,"runes")
	var _n_t = _S.read(_parent,"t")
	var _n_PEN = _S.read(_parent,"PEN")
	var _n_R = _S.read(_parent,"R")
	var _n_SY = _S.read(_parent,"SY")
	var _n_INNER = _S.read(_parent,"INNER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RI = _S.read(_parent,"RI")
	var _n_edges = _S.read(_parent,"edges")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_C = _S.read(_parent,"C")
	var _n_flare = _S.read(_parent,"flare")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_shock,[_n_p_b0, false])
	_S.call_value(_n_circle,[_n_p_b0, false])
	_S.call_value(_n_runes,[_n_p_b0, false])
	var _n_pen_b1 = _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"this":_this}),"_f30")
	if _S.truth(((_n_t < _S.index_value(_n_PEN,1)) if _S.truth((_n_t > _S.index_value(_n_PEN,0))) else (_n_t > _S.index_value(_n_PEN,0)))):
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b2 = _iter_0
			var _n_g_b3 = ((float(PI)/2) + ((_n_s_b2 * (float((_n_t - _S.index_value(_n_PEN,0)))/(_S.index_value(_n_PEN,1) - _S.index_value(_n_PEN,0)))) * PI))
			_S.call_value(_n_pen_b1,[(cos(_n_g_b3) * _n_R), ((sin(_n_g_b3) * _n_R) * _n_SY)])
	if _S.truth(((_n_t < _S.index_value(_n_INNER,1)) if _S.truth((_n_t > _S.index_value(_n_INNER,0))) else (_n_t > _S.index_value(_n_INNER,0)))):
		var _n_g_b4 = ((float((-PI))/2) + ((float((_n_t - _S.index_value(_n_INNER,0)))/(_S.index_value(_n_INNER,1) - _S.index_value(_n_INNER,0))) * _n_TAU))
		_S.call_value(_n_pen_b1,[(cos(_n_g_b4) * _n_RI), ((sin(_n_g_b4) * _n_RI) * _n_SY)])
	for _iter_1 in _S.array(_n_edges):
		var _n_e_b5 = _iter_1
		if _S.truth(((_n_t < (_S.named_value(_n_e_b5,"t0") + _S.named_value(_n_e_b5,"dur"))) if _S.truth((_n_t > _S.named_value(_n_e_b5,"t0"))) else (_n_t > _S.named_value(_n_e_b5,"t0")))):
			var _n_s_b6 = (float((_n_t - _S.named_value(_n_e_b5,"t0")))/_S.named_value(_n_e_b5,"dur"))
			_S.call_value(_n_pen_b1,[(_S.index_value(_S.named_value(_n_e_b5,"p0"),0) + ((_S.index_value(_S.named_value(_n_e_b5,"p1"),0) - _S.index_value(_S.named_value(_n_e_b5,"p0"),0)) * _n_s_b6)), ((_S.index_value(_S.named_value(_n_e_b5,"p0"),1) + ((_S.index_value(_S.named_value(_n_e_b5,"p1"),1) - _S.index_value(_S.named_value(_n_e_b5,"p0"),1)) * _n_s_b6)) * _n_SY)])
	if _S.truth(((_n_t < (_n_FLASH + 0.24)) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))):
		var _n_a_b7 = (float((_n_t - _n_FLASH))/0.24)
		_S.call_value(_n_flare,[_n_p_b0, 0, (-8), (34 * pow((1 - _n_a_b7),1.5)), (1 - _n_a_b7), _n_C])
		_S.invoke(_n_p_b0,"glow",[0, (-26), 56, _n_WHITE, (0.5 * (1 - _n_a_b7))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	_S.call_value(_n_sparkle,[_n_p, _n_x_b0, _n_y_b1, 2, _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.5])
	_S.invoke(_n_p,"glow",[_n_x_b0, _n_y_b1, 7, _S.index_value(_n_C,6), 0.45])
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	return fmod((fmod(_n_a_b0,_n_TAU) + _n_TAU),_n_TAU)
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return absf(atan2(sin((_n_g_b0 - (float(PI)/2))),cos((_n_g_b0 - (float(PI)/2)))))
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_fromFront = _S.read(_parent,"fromFront")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_w_b1,0) + ((float(_S.call_value(_n_fromFront,[_n_g_b0]))/PI) * (_S.index_value(_n_w_b1,1) - _S.index_value(_n_w_b1,0))))
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_INNER = _S.read(_parent,"INNER")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_g_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_INNER,0) + ((float(_S.call_value(_n_wrap,[(_n_g_b0 + (float(PI)/2))]))/_n_TAU) * (_S.index_value(_n_INNER,1) - _S.index_value(_n_INNER,0))))
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_NRUNE = _S.read(_parent,"NRUNE")
	var _n_k_b0 = _S.arg(_args,0)
	return ((float((-PI))/2) + (float(((_n_k_b0 + 0.5) * _n_TAU))/_n_NRUNE))
	return null

static func _f36(_parent,_args:Array,_this=null):
	var _n_RUNES = _S.read(_parent,"RUNES")
	var _n_NRUNE = _S.read(_parent,"NRUNE")
	var _n_k_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_RUNES,0) + (float((_n_k_b0 * (_S.index_value(_n_RUNES,1) - _S.index_value(_n_RUNES,0))))/(_n_NRUNE - 1)))
	return null

static func _f37(_parent,_args:Array,_this=null):
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_k_b0 = _S.arg(_args,0)
	return ((_n_BREAK + 0.2) + (_n_k_b0 * 0.08))
	return null
