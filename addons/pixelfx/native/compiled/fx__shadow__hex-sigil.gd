@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/hex-sigil.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "strokes", _S.function_value(_e, "_f0"))
	_S.define(_e, "glyphs", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Hex sigil"}, {"desc": "A burning pen traces a cursed sigil in the air, its glyphs pop in one by one, then it flares white and crumbles into falling embers."}, {"tags": ["shadow", "hex", "sigil", "rune", "curse", "magic", "circle", "one-shot"]}, {"size": [168, 128]}, {"origin": [84, 112]}, {"duration": 4.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 50))
	_S.define(_e, "RO", 28)
	_S.define(_e, "RI", 22)
	_S.define(_e, "RC", 6)
	_S.define(_e, "GLYPH", 1.62)
	_S.define(_e, "FLARE", 2.6)
	_S.define(_e, "BREAK", 2.74)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "paths", [])
	_S.define(_e, "circle", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RO"), _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)])])
	_S.define(_e, "star", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), 7)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v1, "Math"), "PI")), 2), _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_v1, "i"), 3), 7), _S.binary("/", _S.read(_v1, "TAU"), 7))))
		_S.invoke(_S.read(_v1, "star"), "push", [[_S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "RI")), _S.binary("+", _S.read(_v1, "CY"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "RI")))]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "paths"), "push", [_S.read(_e, "star")])
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RI"), _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)])])
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RC"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)])])
	_S.invoke(_S.read(_e, "paths"), "push", [[[0, _S.binary("-", _S.read(_e, "CY"), 3.5)], [2, _S.read(_e, "CY")], [0, _S.binary("+", _S.read(_e, "CY"), 3.5)], [_S.unary("-", 2), _S.read(_e, "CY")], [0, _S.binary("-", _S.read(_e, "CY"), 3.5)]]])
	_S.define(_e, "pts", [])
	_S.define(_e, "speeds", [420, 700, 550, 380, 300])
	_S.define(_e, "t", 0.12)
	_S.invoke(_S.read(_e, "paths"), "forEach", [_S.function_value(_e, "_f3")])
	return _S.merge([{"pts": _S.read(_e, "pts")}, {"end": _S.read(_e, "t")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_this = _S.read(_parent,"this")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_a0_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.invoke(_n_Array,"from",[{"length":((_n_n_b2 if _S.truth(_n_n_b2) else ceili((_n_r_b0 * _n_TAU))) + 1)}, _S.function_value(_S.capture(_parent,{"a0":_n_a0_b1,"n":_n_n_b2,"r":_n_r_b0,"this":_n_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_a0 = _S.read(_parent,"a0")
	var _n_n = _S.read(_parent,"n")
	var _n_r = _S.read(_parent,"r")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_CY = _S.read(_parent,"CY")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [(cos((_n_a0 + ((float(_n_i_b1)/(_n_n if _S.truth(_n_n) else ceili((_n_r * _n_TAU)))) * _n_TAU))) * _n_r), (_n_CY + (sin((_n_a0 + ((float(_n_i_b1)/(_n_n if _S.truth(_n_n) else ceili((_n_r * _n_TAU)))) * _n_TAU))) * _n_r))]
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "path", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "path"), "length"))):
		var _v3 = _S.scope(_v2)
		var _v4 = _S.prop(_S.read(_v3, "path"), _S.binary("-", _S.read(_v3, "i"), 1))
		_S.define(_v3, "x0", _S.prop(_v4, 0))
		_S.define(_v3, "y0", _S.prop(_v4, 1))
		var _v5 = _S.prop(_S.read(_v3, "path"), _S.read(_v3, "i"))
		_S.define(_v3, "x1", _S.prop(_v5, 0))
		_S.define(_v3, "y1", _S.prop(_v5, 1))
		_S.define(_v3, "L", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.read(_v3, "x1"), _S.read(_v3, "x0")), _S.binary("-", _S.read(_v3, "y1"), _S.read(_v3, "y0"))]))
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "d", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "d"), _S.read(_v6, "L"))):
			_S.invoke(_S.read(_v6, "pts"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v6, "x0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v6, "x1"), _S.read(_v6, "x0")), _S.read(_v6, "d")), _S.read(_v6, "L")))}, {"y": _S.binary("+", _S.read(_v6, "y0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v6, "y1"), _S.read(_v6, "y0")), _S.read(_v6, "d")), _S.read(_v6, "L")))}, {"t": _S.binary("+", _S.read(_v6, "t"), _S.binary("/", _S.read(_v6, "d"), _S.prop(_S.read(_v6, "speeds"), _S.read(_v6, "k"))))}])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "d", 0.5, "+=", false)
		_S.write(_v3, "t", _S.binary("/", _S.read(_v3, "L"), _S.prop(_S.read(_v3, "speeds"), _S.read(_v3, "k"))), "+=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.write(_e, "t", 0.04, "+=", false)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_seed_b0 = _S.arg(_args,0)
	return _S.invoke(_n_Array,"from",[{"length":7}, _S.function_value(_S.capture(_parent,{"seed":_n_seed_b0,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_seed = _S.read(_parent,"seed")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RO = _S.read(_parent,"RO")
	var _n_RI = _S.read(_parent,"RI")
	var _n_CY = _S.read(_parent,"CY")
	var _n_GLYPH = _S.read(_parent,"GLYPH")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.MathFX.rng([_n_seed,_n_i_b1,31])
	var _n_segs_b3 = [[[1, 0], [1, 2]]]
	if true:
		var _n_k_b6 = 0
		while _S.truth((_n_k_b6 < (2 + (1 if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.5)) else 0)))):
			var _n_a_b7 = [_S.invoke(_n_r_b2,"int",[0, 2]), _S.invoke(_n_r_b2,"int",[0, 2])]
			var _n_b_b8 = [maxf(0,minf(2,(_S.index_value(_n_a_b7,0) + _S.invoke(_n_r_b2,"int",[(-1), 1])))), maxf(0,minf(2,(_S.index_value(_n_a_b7,1) + _S.invoke(_n_r_b2,"int",[(-1), 1]))))]
			if _S.truth((_S.binary("!==",_S.index_value(_n_a_b7,0),_S.index_value(_n_b_b8,0)) if _S.truth(_S.binary("!==",_S.index_value(_n_a_b7,0),_S.index_value(_n_b_b8,0))) else _S.binary("!==",_S.index_value(_n_a_b7,1),_S.index_value(_n_b_b8,1)))):
				_S.invoke(_n_segs_b3,"push",[[_n_a_b7, _n_b_b8]])
			_n_k_b6 += 1.0
	var _n_ang_b4 = (((float((-PI))/2) + (float((_n_i_b1 * _n_TAU))/7)) + (float(PI)/7))
	var _n_rr_b5 = (float((_n_RO + _n_RI))/2)
	return {"x":(cos(_n_ang_b4) * _n_rr_b5),"y":(_n_CY + (sin(_n_ang_b4) * _n_rr_b5)),"segs":_n_segs_b3,"t":(_n_GLYPH + (_n_i_b1 * 0.07))}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "strokes"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "glyphs"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}])]))
	_S.define(_e, "embers", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "pi", 0)
	_S.define(_e, "flared", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "pen", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f10")}, {"draw": _S.function_value(_e, "_f11")}])

static func _f7(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_pi = _S.read(_parent,"pi")
	return _S.index_value(_S.named_value(_n_S,"pts"),minf((_S.prop(_S.named_value(_n_S,"pts"),"length") - 1),_n_pi))
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "pi"), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "S"), "pts"), "length"), 1)), func(): return _S.binary("<=", _S.prop(_S.prop(_S.prop(_S.read(_e, "S"), "pts"), _S.binary("+", _S.read(_e, "pi"), 1)), "t"), _S.read(_e, "t")))):
		_S.write(_e, "pi", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "S"), "end")))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "q", _S.call_value(_S.read(_v9, "pen"), []))
		if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [_S.binary("*", _S.read(_v9, "dt"), 70)])):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.prop(_S.read(_v9, "q"), "x"), _S.prop(_S.read(_v9, "q"), "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 70), 70]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 100), 20]), _S.invoke(_S.read(_v9, "R"), "range", [0.12, 0.35])])
		if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [_S.binary("*", _S.read(_v9, "dt"), 10)])):
			_S.invoke(_S.read(_v9, "embers"), "spawn", [_S.prop(_S.read(_v9, "P"), "EMBER"), _S.prop(_S.read(_v9, "q"), "x"), _S.prop(_S.read(_v9, "q"), "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v9, "R"), "range", [5, 25]), _S.invoke(_S.read(_v9, "R"), "range", [0.5, 0.9])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLARE"), 0.05))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.read(_e, "dt"), _S.binary("+", 8, _S.binary("*", 14, _S.call_value(_S.read(_e, "smooth"), [0.2, _S.read(_e, "FLARE"), _S.read(_e, "t")]))))]))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
		_S.define(_v10, "D0", _S.invoke(_S.read(_v10, "R"), "range", [40, 60]))
		_S.define(_v10, "T", _S.invoke(_S.read(_v10, "R"), "range", [0.22, 0.32]))
		_S.define(_v10, "v", _S.binary("/", _S.binary("*", _S.read(_v10, "D0"), 3), _S.binary("-", _S.invoke(_S.read(_v10, "Math"), "exp", [_S.binary("*", 3, _S.read(_v10, "T"))]), 1)))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "D0")), _S.binary("+", _S.read(_v10, "CY"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "D0"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")])), _S.read(_v10, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")])), _S.read(_v10, "v")), _S.read(_v10, "T"), (_S.prop(_S.read(_v10, "C"), 7) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 6))])
	for _v11 in _S.array(_S.read(_e, "G")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "g", _v11)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "g"), "popped")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "g"), "t")))):
			var _v13 = _S.scope(_v12)
			_S.set_prop(_S.read(_v13, "g"), "popped", true, "=", false)
			_S.invoke(_S.read(_v13, "lights"), "push", [_S.merge([{"x": _S.prop(_S.read(_v13, "g"), "x")}, {"y": _S.prop(_S.read(_v13, "g"), "y")}, {"r": 14}, {"k": 0.7}, {"life": 0.2}, {"max": 0.2}])])
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), 4)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.prop(_S.read(_v14, "g"), "x"), _S.prop(_S.read(_v14, "g"), "y"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 60), 60]), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 70), 20]), _S.invoke(_S.read(_v14, "R"), "range", [0.1, 0.25])])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLARE")), func(): return _S.unary("!", _S.read(_e, "flared")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "flared", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "push", [_S.merge([{"x": 0}, {"y": _S.read(_v15, "CY")}, {"r": 96}, {"k": 1.4}, {"life": 0.45}, {"max": 0.45}]), _S.merge([{"x": 0}, {"y": _S.read(_v15, "CY")}, {"r": 44}, {"k": 1}, {"life": 0.14}, {"max": 0.14}])])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 24)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.invoke(_S.read(_v17, "R"), "range", [0, _S.read(_v17, "TAU")]))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [60, 130]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 13), _S.binary("+", _S.read(_v17, "CY"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), 13)), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 30), _S.invoke(_S.read(_v17, "R"), "range", [0.2, 0.45])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "broke", true, "=", false)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v19, "S"), "pts"), "length"), 1))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "q", _S.prop(_S.prop(_S.read(_v20, "S"), "pts"), _S.read(_v20, "i")))
			_S.define(_v20, "n", _S.prop(_S.prop(_S.read(_v20, "S"), "pts"), _S.binary("+", _S.read(_v20, "i"), 1)))
			_S.define(_v20, "a", _S.invoke(_S.read(_v20, "Math"), "atan2", [_S.binary("-", _S.prop(_S.read(_v20, "n"), "y"), _S.prop(_S.read(_v20, "q"), "y")), _S.binary("-", _S.prop(_S.read(_v20, "n"), "x"), _S.prop(_S.read(_v20, "q"), "x"))]))
			_S.invoke(_S.read(_v20, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v20, "B"), "SHARD")}, {"x": _S.prop(_S.read(_v20, "q"), "x")}, {"y": _S.prop(_S.read(_v20, "q"), "y")}, {"vx": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 12), 6])}, {"g": _S.invoke(_S.read(_v20, "R"), "range", [0.22, 0.45])}, {"drag": 0.6}, {"bounce": 0.25}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [0.8, 1.2])}, {"a": _S.read(_v20, "a")}, {"va": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 3), 3])}, {"s": _S.invoke(_S.read(_v20, "R"), "range", [2.5, 3.5])}, {"c": _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "C"), 7), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 5)]])}])])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v20, "i"), 27), 0)):
				_S.invoke(_S.read(_v20, "embers"), "spawn", [_S.prop(_S.read(_v20, "P"), "EMBER"), _S.prop(_S.read(_v20, "q"), "x"), _S.prop(_S.read(_v20, "q"), "y"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [10, 40])), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 1.1])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 7, "+=", false)
		for _v21 in _S.array(_S.read(_v18, "G")):
			var _v22 = _S.scope(_v18)
			_S.define(_v22, "g", _v21)
			_S.invoke(_S.read(_v22, "puffs"), "spawn", [_S.prop(_S.read(_v22, "PK"), "SOOT"), _S.prop(_S.read(_v22, "g"), "x"), _S.prop(_S.read(_v22, "g"), "y"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [8, 18])), _S.invoke(_S.read(_v22, "R"), "range", [0.7, 1.1]), _S.invoke(_S.read(_v22, "R"), "range", [3, 5])])
		var _v23 = _S.scope(_v18)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 8)):
			_S.invoke(_S.read(_v23, "puffs"), "spawn", [_S.prop(_S.read(_v23, "PK"), "SOOT"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 20), 20]), _S.binary("+", _S.read(_v23, "CY"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 20), 20])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [6, 16])), _S.invoke(_S.read(_v23, "R"), "range", [0.8, 1.2]), _S.invoke(_S.read(_v23, "R"), "range", [3, 6]), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.15])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", _S.binary("-", _S.prop(_S.read(_v24, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v24, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v24, "lights"), _S.read(_v24, "i")), "life", _S.read(_v24, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v24, "lights"), "splice", [_S.read(_v24, "i"), 1])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "embers"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	var _n_CY = _S.read(_parent,"CY")
	var _n_broke = _S.read(_parent,"broke")
	var _n_t = _S.read(_parent,"t")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_puffs,"draw",[_n_p_b0, _S.named_value(_n_PK,"SOOT"), {"x":0,"y":_n_CY,"k":(0.3 if _S.truth(_n_broke) else 0),"reach":50}])
	var _n_k_b1 = (_S.MathFX.smooth(0.1,0.6,_n_t) if _S.truth((_n_t < _n_BREAK)) else (1 - _S.MathFX.smooth(_n_BREAK,(_n_BREAK + 0.6),_n_t)))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, _n_CY, 52, _S.index_value(_n_C,4), (0.3 * _n_k_b1)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_broke = _S.read(_parent,"broke")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_FLARE = _S.read(_parent,"FLARE")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_ringFast = _S.read(_parent,"ringFast")
	var _n_G = _S.read(_parent,"G")
	var _n_pen = _S.read(_parent,"pen")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_CY = _S.read(_parent,"CY")
	var _n_RO = _S.read(_parent,"RO")
	var _n_ease = _S.read(_parent,"ease")
	var _n_bits = _S.read(_parent,"bits")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	var _n_ps = _S.read(_parent,"ps")
	var _n_embers = _S.read(_parent,"embers")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(not _S.truth(_n_broke)):
		var _n_hold_b3 = ((0.5 + (0.5 * sin(((_n_t - _S.named_value(_n_S,"end")) * 9)))) if _S.truth((_n_t > _S.named_value(_n_S,"end"))) else 0)
		var _n_white_b4 = (_n_t >= _n_FLARE)
		for _iter_0 in _S.array(_S.named_value(_n_S,"pts")):
			var _n_q_b5 = _iter_0
			if _S.truth((_S.named_value(_n_q_b5,"t") > _n_t)):
				break
			var _n_age_b6 = (_n_t - _S.named_value(_n_q_b5,"t"))
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b5,"x"), _S.named_value(_n_q_b5,"y"), (_n_WHITE if _S.truth(_n_white_b4) else (_n_WHITE if _S.truth((_n_age_b6 < 0.05)) else (_S.index_value(_n_C,7) if _S.truth((_n_age_b6 < 0.15)) else (_S.index_value(_n_C,6) if _S.truth((_n_age_b6 < 0.35)) else (_S.index_value(_n_C,6) if _S.truth((_n_hold_b3 > 0.75)) else _S.index_value(_n_C,5))))))])
		if _S.truth(_n_white_b4):
			for _iter_1 in _S.array(_S.named_value(_n_S,"pts")):
				var _n_q_b7 = _iter_1
				if _S.truth(_S.binary("===",fmod(_S.binary("|",(_S.named_value(_n_q_b7,"x") * 2),0),3),0)):
					_S.invoke(_n_p_b0,"light",[_S.named_value(_n_q_b7,"x"), _S.named_value(_n_q_b7,"y"), _S.index_value(_n_C,6), 0.5])
		for _iter_2 in _S.array(_n_G):
			var _n_g_b8 = _iter_2
			if _S.truth((_n_t < _S.named_value(_n_g_b8,"t"))):
				continue
			var _n_age_b9 = (_n_t - _S.named_value(_n_g_b8,"t"))
			var _n_col_b10 = (_n_WHITE if _S.truth((_n_white_b4 if _S.truth(_n_white_b4) else (_n_age_b9 < 0.06))) else (_S.index_value(_n_C,7) if _S.truth((_n_age_b9 < 0.2)) else (_S.index_value(_n_C,7) if _S.truth((_n_hold_b3 > 0.75)) else _S.index_value(_n_C,6))))
			for _iter_3 in _S.array(_S.named_value(_n_g_b8,"segs")):
				var _tuple_4 = _iter_3
				var _n_a_b11 = _S.prop(_tuple_4,0)
				var _n_b_b12 = _S.prop(_tuple_4,1)
				_S.invoke(_n_p_b0,"line",[((_S.named_value(_n_g_b8,"x") - 2) + (_S.index_value(_n_a_b11,0) * 2)), ((_S.named_value(_n_g_b8,"y") - 2) + (_S.index_value(_n_a_b11,1) * 2)), ((_S.named_value(_n_g_b8,"x") - 2) + (_S.index_value(_n_b_b12,0) * 2)), ((_S.named_value(_n_g_b8,"y") - 2) + (_S.index_value(_n_b_b12,1) * 2)), _n_col_b10])
			if _S.truth((_n_age_b9 < 0.18)):
				_S.call_value(_n_ringFast,[_n_p_b0, _S.named_value(_n_g_b8,"x"), _S.named_value(_n_g_b8,"y"), (2 + (4 * (float(_n_age_b9)/0.18))), 1, (_S.index_value(_n_C,7) if _S.truth((_n_age_b9 < 0.09)) else _S.index_value(_n_C,5))])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_g_b8,"x"), _S.named_value(_n_g_b8,"y"), 6, _S.index_value(_n_C,5), 0.25])
		if _S.truth(((_n_t < (_S.named_value(_n_S,"end") + 0.05)) if _S.truth((_n_t > 0.12)) else (_n_t > 0.12))):
			var _n_q_b13 = _S.call_value(_n_pen,[])
			_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_q_b13,"x"), _S.named_value(_n_q_b13,"y"), (3 + sin((_n_t * 60))), _S.index_value(_n_C,7), _S.index_value(_n_C,6), 0.6])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b13,"x"), _S.named_value(_n_q_b13,"y"), 16, _S.index_value(_n_C,6), 0.55])
	var _n_fu_b1 = (float((_n_t - _n_FLARE))/0.35)
	var _n_bu_b2 = (float((_n_t - _n_FLARE))/0.22)
	if _S.truth(((_n_bu_b2 < 1) if _S.truth((_n_bu_b2 > 0)) else (_n_bu_b2 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, _n_CY, (18 * (1 - _n_bu_b2)), _S.index_value(_n_C,7), _S.index_value(_n_C,5), (0.9 * (1 - _n_bu_b2))])
	if _S.truth(((_n_fu_b1 < 1) if _S.truth((_n_fu_b1 > 0)) else (_n_fu_b1 > 0))):
		_S.call_value(_n_ringFast,[_n_p_b0, 0, _n_CY, ((_n_RO + 3) + (12 * _S.invoke(_n_ease,"outCubic",[_n_fu_b1]))), maxf(1,(3 * (1 - _n_fu_b1))), (_n_WHITE if _S.truth((_n_fu_b1 < 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_fu_b1 < 0.7)) else _S.index_value(_n_C,4)))])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_puffs,"draw",[_n_p_b0, _S.named_value(_n_PK,"FLAME")])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_embers,"draw",[_n_p_b0])
	for _iter_5 in _S.array(_n_lights):
		var _n_l_b14 = _iter_5
		var _n_q_b15 = (float(_S.named_value(_n_l_b14,"life"))/_S.named_value(_n_l_b14,"max"))
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b14,"x"), _S.named_value(_n_l_b14,"y"), (_S.named_value(_n_l_b14,"r") * (0.6 + (0.4 * _n_q_b15))), (_S.index_value(_n_C,5) if _S.truth((_S.named_value(_n_l_b14,"k") > 1)) else _S.index_value(_n_C,6)), ((_S.named_value(_n_l_b14,"k") * _n_q_b15) * _n_q_b15)])
	return null
