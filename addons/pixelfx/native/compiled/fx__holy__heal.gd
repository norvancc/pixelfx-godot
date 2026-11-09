@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/heal.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "recolor", _S.import_value("fx/holy/_lib.js", "recolor"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "heart", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Heal"}, {"desc": "Petals of light bloom under the feet, a hoop of light rises up the body restoring its colour and leaving sparkles, and motes spiral up and pop into tiny hearts."}, {"tags": ["holy", "heal", "restore", "buff", "petals", "hearts", "character", "one-shot"]}, {"size": [80, 104]}, {"origin": [40, 92]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3d2027", "#7d3f35", "#c97a4a", "#f2b46a", "#ffd994", "#fff0cf", "#fffaf2", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HURT", _S.merge([{"turn": 0.8}, {"crouch": 5}, {"lean": 3}, {"hy": 1}, {"fx": 1}, {"fy": _S.unary("-", 21)}, {"bx": 7}, {"by": _S.unary("-", 15)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "UP", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.3), _S.read(_e, "HURT")], [0.16, _S.merge([_S.read(_e, "HURT"), {"crouch": 6}])], [0.5, _S.merge([_S.read(_e, "HURT"), {"crouch": 3}, {"lean": 1}, {"hy": 0}])], [0.78, _S.read(_e, "UP")], [1.2, _S.merge([_S.read(_e, "UP"), {"crouch": 0}, {"fy": _S.unary("-", 30)}, {"by": _S.unary("-", 30)}, {"hy": 0}])], [1.9, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "NP", 8)
	_S.define(_e, "PR", 16)
	_S.define(_e, "LIFT0", 0.16)
	_S.define(_e, "LIFT1", 0.74)
	_S.define(_e, "TOPY", _S.unary("-", 43))
	_S.define(_e, "HEART", [".#.#.", "#####", ".###.", "..#.."])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "X", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 2))
	_S.define(_e, "Y", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), 2))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "j"), 4)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "i"), 5)):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.call_value(_S.read(_v2, "at"), [_S.read(_v2, "i"), _S.read(_v2, "j")])):
				_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "X"), _S.read(_v2, "i")), _S.binary("+", _S.read(_v2, "Y"), _S.read(_v2, "j")), (_S.read(_v2, "WHITE") if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v2, "i"), 1), func(): return _S.binary("===", _S.read(_v2, "j"), 1))) else (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary(">=", _S.read(_v2, "j"), 2)) else _S.prop(_S.read(_v2, "C"), 6))), _S.read(_v2, "a")])
			else:
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v2, "at"), [_S.binary("-", _S.read(_v2, "i"), 1), _S.read(_v2, "j")]), func(): return _S.call_value(_S.read(_v2, "at"), [_S.binary("+", _S.read(_v2, "i"), 1), _S.read(_v2, "j")])), func(): return _S.call_value(_S.read(_v2, "at"), [_S.read(_v2, "i"), _S.binary("-", _S.read(_v2, "j"), 1)])), func(): return _S.call_value(_S.read(_v2, "at"), [_S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "j"), 1)]))):
					_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "X"), _S.read(_v2, "i")), _S.binary("+", _S.read(_v2, "Y"), _S.read(_v2, "j")), _S.prop(_S.read(_v2, "C"), 3), _S.binary("*", _S.read(_v2, "a"), 0.9)])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "a"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "j"), 0), func(): return _S.binary("<", _S.read(_e, "j"), 4)), func(): return _S.binary(">=", _S.read(_e, "i"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), 5)), func(): return _S.binary("===", _S.prop(_S.prop(_S.read(_e, "HEART"), _S.read(_e, "j")), _S.read(_e, "i")), "#"))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "bloom", _S.function_value(_e, "_f3"))
	_S.define(_e, "petal", _S.function_value(_e, "_f4"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f6"))
	_S.define(_e, "riders", _S.function_value(_e, "_f10"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f12")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	for _v14 in _S.array(_S.prop(_S.read(_e, "S"), "edge")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.invoke(_S.logical("??", _S.invoke(_S.read(_v15, "rows"), "get", [_S.read(_v15, "y")]), func(): return _S.invoke(_S.invoke(_S.read(_v15, "rows"), "set", [_S.read(_v15, "y"), []]), "get", [_S.read(_v15, "y")])), "push", [_S.read(_v15, "x")])
	_S.define(_e, "petals", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NP")}]), _S.function_value(_e, "_f13")]))
	_S.define(_e, "motes", [])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "k"), _S.read(_v17, "NP"))):
		_S.invoke(_S.read(_v17, "motes"), "push", [_S.merge([{"t0": _S.binary("+", 0.2, _S.binary("*", _S.read(_v17, "k"), 0.05))}, {"th0": _S.prop(_S.prop(_S.read(_v17, "petals"), _S.read(_v17, "k")), "a")}, {"r0": _S.binary("*", _S.read(_v17, "PR"), 0.9)}, {"y0": _S.unary("-", 1)}, {"w": _S.binary("*", 4.2, (1 if _S.truth(_S.binary("%", _S.read(_v17, "k"), 2)) else _S.unary("-", 1)))}, {"v": _S.invoke(_S.read(_v17, "R"), "range", [46, 58])}, {"life": _S.invoke(_S.read(_v17, "R"), "range", [0.75, 0.95])}, {"kind": _S.binary("%", _S.read(_v17, "k"), 2)}])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "k", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "k"), 8)):
		_S.invoke(_S.read(_v18, "motes"), "push", [_S.merge([{"t0": _S.binary("+", _S.read(_v18, "LIFT1"), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.06]))}, {"th0": _S.binary("*", _S.binary("/", _S.read(_v18, "k"), 8), _S.read(_v18, "TAU"))}, {"r0": _S.invoke(_S.read(_v18, "R"), "range", [12, 18])}, {"y0": _S.binary("+", _S.read(_v18, "TOPY"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 2), 4]))}, {"w": _S.binary("*", 3.6, (1 if _S.truth(_S.binary("%", _S.read(_v18, "k"), 2)) else _S.unary("-", 1)))}, {"v": _S.invoke(_S.read(_v18, "R"), "range", [14, 34])}, {"life": _S.invoke(_S.read(_v18, "R"), "range", [0.35, 0.6])}, {"kind": _S.binary("%", _S.binary("+", _S.read(_v18, "k"), 1), 2)}])])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "k", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "lastRow", 1)
	_S.define(_e, "hoopY", _S.function_value(_e, "_f14"))
	_S.define(_e, "hoopR", _S.function_value(_e, "_f15"))
	return _S.merge([{"update": _S.function_value(_e, "_f16")}, {"drawBack": _S.function_value(_e, "_f17")}, {"draw": _S.function_value(_e, "_f18")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "pe", _S.prop(_S.read(_e, "petals"), _S.read(_e, "k")))
	return _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.prop(_S.read(_e, "pe"), "t0"), _S.binary("+", _S.prop(_S.read(_e, "pe"), "t0"), 0.3)]), 1.8]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("+", 1.25, _S.binary("*", _S.read(_e, "k"), 0.02)), _S.binary("+", 1.6, _S.binary("*", _S.read(_e, "k"), 0.02))]), 1.4])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "back", _S.arg(_args, 2))
	_S.define(_e, "pe", _S.prop(_S.read(_e, "petals"), _S.read(_e, "k")))
	_S.define(_e, "g", _S.binary("+", _S.prop(_S.read(_e, "pe"), "a"), _S.binary("*", _S.read(_e, "t"), 0.4)))
	_S.define(_e, "near", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "bloom"), [_S.read(_e, "k"), _S.read(_e, "t")]))
	if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "near"), _S.read(_e, "back")), func(): return _S.binary("<=", _S.read(_e, "b"), 0.02))):
		return null
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]))
	_S.define(_e, "rb", 6)
	_S.define(_e, "rt", _S.binary("+", _S.read(_e, "rb"), _S.binary("*", 9, _S.invoke(_S.read(_e, "Math"), "min", [1.2, _S.read(_e, "b")]))))
	_S.define(_e, "h", _S.binary("*", (7 if _S.truth(_S.binary("%", _S.read(_e, "k"), 2)) else 9), _S.read(_e, "b")))
	_S.define(_e, "bx", _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "rb")))
	_S.define(_e, "by", _S.binary("*", _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "rb")), _S.read(_e, "SY")))
	_S.define(_e, "tx", _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "rt")))
	_S.define(_e, "ty", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "rt")), _S.read(_e, "SY")), _S.read(_e, "h")))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "tx"), _S.read(_e, "bx")), _S.binary("-", _S.read(_e, "ty"), _S.read(_e, "by"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 1.5)):
		return null
	_S.define(_e, "ux", _S.binary("/", _S.binary("-", _S.read(_e, "tx"), _S.read(_e, "bx")), _S.read(_e, "L")))
	_S.define(_e, "uy", _S.binary("/", _S.binary("-", _S.read(_e, "ty"), _S.read(_e, "by")), _S.read(_e, "L")))
	_S.define(_e, "W", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "pe"), "w"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "b")])), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sa")])))))
	_S.define(_e, "pad", _S.binary("+", _S.read(_e, "W"), 1))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "bx"), _S.read(_e, "tx")]), _S.read(_e, "pad")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "by"), _S.read(_e, "ty")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "bx"), _S.read(_e, "tx")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "by"), _S.read(_e, "ty")]), _S.read(_e, "pad")), _S.function_value(_e, "_f5")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "tx"), _S.read(_e, "ty"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "b")]))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "bx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "by")))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ux")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "uy"))), _S.read(_e, "L")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "hw", _S.binary("+", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 0.6]))]), 0.7])), 0.2))
	_S.define(_e, "v", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "uy")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ux")))]), _S.read(_e, "hw")))
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 1)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.9)):
		return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "WHITE"), 1])
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.7)):
		return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 6))), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "v"), 0.2), func(): return _S.binary(">", _S.read(_e, "u"), 0.15)), func(): return _S.binary("<", _S.read(_e, "u"), 0.85))):
		return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else _S.prop(_S.read(_e, "C"), 6)), (0.75 if _S.truth(_S.read(_e, "back")) else 0.85)])
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.45)) else _S.prop(_S.read(_e, "C"), 4)), (0.6 if _S.truth(_S.read(_e, "back")) else 0.45)])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT0")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT1"), 0.12)))):
		return null
	_S.define(_e, "y", _S.call_value(_S.read(_e, "hoopY"), [_S.read(_e, "t")]))
	_S.define(_e, "r", _S.binary("*", _S.call_value(_S.read(_e, "hoopR"), [_S.read(_e, "t")]), (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT1")), 0.12)) if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "LIFT1"))) else 1)))
	_S.define(_e, "keep", (_S.function_value(_e, "_f7") if _S.truth(_S.read(_e, "back")) else _S.function_value(_e, "_f8")))
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, _S.read(_e, "y"), _S.read(_e, "r"), _S.binary("*", _S.read(_e, "r"), _S.read(_e, "SY")), _S.function_value(_e, "_f9"), (0.8 if _S.truth(_S.read(_e, "back")) else 1), _S.read(_e, "keep")])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		var _v3 = _S.scope(_e)
		_S.call_value(_S.read(_v3, "oval"), [_S.read(_v3, "p"), 0, _S.binary("+", _S.read(_v3, "y"), 1), _S.binary("-", _S.read(_v3, "r"), 0.5), _S.binary("*", _S.read(_v3, "r"), _S.read(_v3, "SY")), _S.prop(_S.read(_v3, "C"), 4), 1, _S.read(_v3, "keep")])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v4, "i"), 2)):
			_S.invoke(_S.read(_v4, "p"), "glow", [_S.binary("*", _S.binary("*", _S.read(_v4, "i"), _S.read(_v4, "r")), 0.45), _S.read(_v4, "y"), 8, _S.prop(_S.read(_v4, "C"), 5), 0.32])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0.5)) else _S.prop(_S.read(_e, "C"), 6))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	for _v5 in _S.array(_S.read(_e, "motes")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "m", _v5)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.binary("-", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "m"), "t0")))
		if _S.truth(_S.binary("<", _S.read(_v7, "a"), 0)):
			continue
		_S.define(_v7, "at", _S.function_value(_v7, "_f11"))
		if _S.truth(_S.binary("<", _S.read(_v7, "a"), _S.prop(_S.read(_v7, "m"), "life"))):
			var _v8 = _S.scope(_v7)
			var _v9 = _S.call_value(_S.read(_v8, "at"), [_S.read(_v8, "a")])
			_S.define(_v8, "x", _S.prop(_v9, 0))
			_S.define(_v8, "y", _S.prop(_v9, 1))
			_S.define(_v8, "z", _S.prop(_v9, 2))
			if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v8, "z"), 0), _S.read(_v8, "back"))):
				continue
			var _v10 = _S.scope(_v8)
			_S.define(_v10, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v10, "j"), 7)):
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "aj", _S.binary("-", _S.read(_v11, "a"), _S.binary("*", _S.read(_v11, "j"), 0.03)))
				if _S.truth(_S.binary("<", _S.read(_v11, "aj"), 0)):
					break
				var _v12 = _S.call_value(_S.read(_v11, "at"), [_S.read(_v11, "aj")])
				_S.define(_v11, "tx", _S.prop(_v12, 0))
				_S.define(_v11, "ty", _S.prop(_v12, 1))
				_S.define(_v11, "tz", _S.prop(_v12, 2))
				if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v11, "tz"), 0), _S.read(_v11, "back"))):
					_v10 = _S.iteration(_v10)
					_S.write(_v10, "j", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v11, "p"), "dot", [_S.read(_v11, "tx"), _S.read(_v11, "ty"), (_S.read(_v11, "WHITE") if _S.truth(_S.binary("===", _S.read(_v11, "j"), 0)) else (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v11, "j"), 3)) else _S.prop(_S.read(_v11, "C"), 5))), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v11, "j"), 7)), (0.6 if _S.truth(_S.read(_v11, "back")) else 1))])
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "j", 1, "+=", true)
			_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "x"), _S.read(_v8, "y"), 4, _S.prop(_S.read(_v8, "C"), 5), (0.2 if _S.truth(_S.read(_v8, "back")) else 0.4)])
			continue
		_S.define(_v7, "u", _S.binary("/", _S.binary("-", _S.read(_v7, "a"), _S.prop(_S.read(_v7, "m"), "life")), 0.36))
		if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v7, "u"), 1), func(): return _S.read(_v7, "back"))):
			continue
		var _v13 = _S.call_value(_S.read(_v7, "at"), [_S.prop(_S.read(_v7, "m"), "life")])
		_S.define(_v7, "x", _S.prop(_v13, 0))
		_S.define(_v7, "y", _S.prop(_v13, 1))
		_S.define(_v7, "k", _S.binary("-", 1, _S.call_value(_S.read(_v7, "smooth"), [0.5, 1, _S.read(_v7, "u")])))
		if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.12)):
			_S.call_value(_S.read(_v7, "sparkle"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.read(_v7, "y"), 3, _S.read(_v7, "WHITE"), _S.prop(_S.read(_v7, "C"), 6), 0.5])
		else:
			if _S.truth(_S.prop(_S.read(_v7, "m"), "kind")):
				_S.call_value(_S.read(_v7, "heart"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.binary("-", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "u"), 6)), _S.read(_v7, "C"), _S.read(_v7, "k")])
			else:
				_S.call_value(_S.read(_v7, "sparkle"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.binary("-", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "u"), 5)), _S.binary("+", 1, _S.binary("*", _S.binary("*", 2, _S.read(_v7, "k")), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "a"), 30)]))))), _S.read(_v7, "WHITE"), _S.prop(_S.read(_v7, "C"), 5), _S.binary("*", 0.45, _S.read(_v7, "k"))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	_S.define(_e, "th", _S.binary("+", _S.prop(_S.read(_e, "m"), "th0"), _S.binary("*", _S.prop(_S.read(_e, "m"), "w"), _S.read(_e, "aa"))))
	_S.define(_e, "r", _S.binary("*", _S.prop(_S.read(_e, "m"), "r0"), _S.binary("-", 1, _S.binary("*", 0.45, _S.binary("/", _S.read(_e, "aa"), _S.prop(_S.read(_e, "m"), "life"))))))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "r")), _S.binary("-", _S.prop(_S.read(_e, "m"), "y0"), _S.binary("*", _S.prop(_S.read(_e, "m"), "v"), _S.read(_e, "aa"))), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])]

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "k"), _S.read(_e, "NP")), _S.read(_e, "TAU")), 0.2)}, {"t0": _S.binary("+", 0.02, _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_e, "k"), 3), _S.read(_e, "NP")), 0.035))}, {"w": _S.invoke(_S.read(_e, "R"), "range", [4.2, 5.2])}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [0, _S.read(_e, "TOPY"), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "LIFT0"), _S.read(_e, "LIFT1")])])])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "PR"), 12, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "LIFT0"), _S.read(_e, "LIFT1")])])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LIFT0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT1")))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "Y", _S.invoke(_S.read(_v19, "Math"), "round", [_S.call_value(_S.read(_v19, "hoopY"), [_S.read(_v19, "t")])]))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "y", _S.read(_v20, "lastRow"))
		while _S.truth(_S.binary(">", _S.read(_v20, "y"), _S.read(_v20, "Y"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "xs", _S.invoke(_S.read(_v21, "rows"), "get", [_S.read(_v21, "y")]))
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v21, "xs")), func(): return _S.unary("!", _S.invoke(_S.read(_v21, "R"), "chance", [0.45])))):
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "y", 1, "-=", true)
				continue
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "STAR"), _S.binary("+", _S.invoke(_S.read(_v21, "R"), "pick", [_S.read(_v21, "xs")]), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1), 1]), 2)), _S.read(_v21, "y"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [4, 12])), _S.invoke(_S.read(_v21, "R"), "range", [0.3, 0.55]), (_S.read(_v21, "WHITE") if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 6)), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "y", 1, "-=", true)
		_S.write(_v19, "lastRow", _S.invoke(_S.read(_v19, "Math"), "min", [_S.read(_v19, "lastRow"), _S.read(_v19, "Y")]), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT1")))):
		var _v22 = _S.scope(_e)
		_S.write(_v22, "burst", true, "=", false)
		_S.invoke(_S.read(_v22, "lights"), "add", [0, _S.read(_v22, "TOPY"), 26, _S.prop(_S.read(_v22, "C"), 5), 0.55, 0.3])
		_S.invoke(_S.read(_v22, "lights"), "add", [0, _S.read(_v22, "TOPY"), 10, _S.read(_v22, "WHITE"), 0.45, 0.08])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pool", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.2, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [1.3, 1.75, _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "pool"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 30, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "pool"))])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "k"), _S.read(_v23, "NP"))):
		_S.call_value(_S.read(_v23, "petal"), [_S.read(_v23, "p"), _S.read(_v23, "k"), true])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.call_value(_S.read(_e, "riders"), [_S.read(_e, "p"), true])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "drain", _S.call_value(_S.read(_e, "smooth"), [0, 0.08, _S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT1"), 0.35))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "Y", (1 if _S.truth(_S.binary("<", _S.read(_v24, "t"), _S.read(_v24, "LIFT0"))) else _S.call_value(_S.read(_v24, "hoopY"), [_S.read(_v24, "t")])))
		_S.define(_v24, "done", _S.binary(">=", _S.read(_v24, "t"), _S.read(_v24, "LIFT1")))
		_S.call_value(_S.read(_v24, "recolor"), [_S.read(_v24, "p"), _S.read(_v24, "A"), _S.function_value(_v24, "_f19")])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v24, "t"), _S.read(_v24, "LIFT0")), func(): return _S.unary("!", _S.read(_v24, "done")))):
			_S.invoke(_S.read(_v24, "p"), "glow", [0, _S.read(_v24, "Y"), 18, _S.prop(_S.read(_v24, "C"), 5), 0.35])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "k"), _S.read(_v26, "NP"))):
		_S.call_value(_S.read(_v26, "petal"), [_S.read(_v26, "p"), _S.read(_v26, "k"), false])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), false])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LIFT1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT1"), 0.25)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.read(_e, "TOPY"), _S.binary("*", 8, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT1")), 0.25))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.call_value(_S.read(_e, "riders"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "done")), func(): return _S.binary("<", _S.read(_e, "d"), _S.unary("-", 0.5)))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "l", _S.binary("*", _S.call_value(_S.read(_v25, "luma"), [_S.read(_v25, "c")]), 0.88))
		return _S.call_value(_S.read(_v25, "mix"), [_S.read(_v25, "c"), _S.call_value(_S.read(_v25, "rgb"), [_S.binary("*", _S.read(_v25, "l"), 236), _S.binary("*", _S.read(_v25, "l"), 226), _S.binary("*", _S.read(_v25, "l"), 222)]), _S.binary("*", 0.68, _S.read(_v25, "drain"))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "done")), func(): return _S.binary("<", _S.read(_e, "d"), 1))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "done")), func(): return _S.binary("<", _S.read(_e, "d"), 2.5))):
		return _S.prop(_S.read(_e, "C"), 6)
	_S.define(_e, "k", (_S.binary("*", 0.45, _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "LIFT1"), _S.binary("+", _S.read(_e, "LIFT1"), 0.35)]))) if _S.truth(_S.read(_e, "done")) else _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "d"), 2.5)), 5)]))))
	return (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 5), _S.read(_e, "k")]) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.05)) else 0)
