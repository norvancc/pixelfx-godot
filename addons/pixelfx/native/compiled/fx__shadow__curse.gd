@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/curse.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "attract", _S.import_value("fx/shadow/_lib.js", "attract"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "skull", _S.function_value(_e, "_f0"))
	_S.define(_e, "eyeFire", _S.function_value(_e, "_f2"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Curse"}, {"desc": "Wisps gather over the head, a skull stamps down with a flash, its eyes burn as the curse floods the body violet, then it cracks and crumbles."}, {"tags": ["shadow", "curse", "debuff", "skull", "status", "dark", "magic", "one-shot"]}, {"size": [112, 124]}, {"origin": [56, 108]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"bone": ["#170f26", "#4a3a6e", "#7f6ea6", "#b3a4d4", "#e2d8f6"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "COWER", _S.merge([{"turn": 1}, {"crouch": 6}, {"lean": 2}, {"hy": 1}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 38)}, {"bx": 7}, {"by": _S.unary("-", 38)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.3, _S.merge([{"turn": 0.9}, {"hy": _S.unary("-", 1)}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 19)}, {"bx": 10}, {"by": _S.unary("-", 19)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.55, _S.read(_e, "COWER"), "snap"], [0.8, _S.merge([_S.read(_e, "COWER"), {"crouch": 7}])], [1.2, _S.merge([_S.read(_e, "COWER"), {"crouch": 6}, {"lean": 3}])], [1.72, _S.merge([_S.read(_e, "COWER"), {"crouch": 7}, {"lean": 2}])], [2.1, _S.merge([{"turn": 1}, {"crouch": 4}, {"lean": 3}, {"hy": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 15)}, {"bx": 9}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}])], [2.9, _S.merge([{"turn": 1}, {"crouch": 3}, {"lean": 1}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 16)}, {"bx": 9}, {"by": _S.unary("-", 16)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [3.4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.55}, {"stop": 0.09}, {"shake": 0.2}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", _S.unary("-", 60))
	_S.define(_e, "STAMP", 0.55)
	_S.define(_e, "CRACK", 1.72)
	_S.define(_e, "BREAK", 1.98)
	_S.define(_e, "SKULL", ["......kkkkk......", "....kkhhhhlkk....", "...khhhhhhlllk...", "..khhhhhllllllk..", ".khhhhlllllllmmk.", ".khhhllllllllmmk.", "khhllllllllllmmdk", "khlldddllldddmmdk", "khleeeeelleeeeedk", "kleeeeeelleeeeedk", "kleeeeeemleeeeedk", "kmleeeelmmleeedkk", ".kmmlllmnnmlmddk.", "..kmmlmnnnnmddk..", "..kdmlllmmlmddk..", "...kgtgtgtgtgk...", "...kdgtgtgtgdk...", "....kkkkkkkkk...."])
	_S.define(_e, "SW", 17)
	_S.define(_e, "SH", 18)
	_S.define(_e, "EYES", [[_S.unary("-", 3.5), 1.5], [3.5, 1.5]])
	_S.define(_e, "inSkull", _S.function_value(_e, "_f16"))
	_S.define(_e, "CRACKS", _S.call_value(_S.function_value(_e, "_f17"), []))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "K", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "sq", _S.arg(_args, 4))
	_S.define(_e, "ox", _S.arg(_args, 5))
	_S.define(_e, "oy", _S.arg(_args, 6))
	_S.define(_e, "white", _S.arg(_args, 7))
	_S.define(_e, "crack", _S.arg(_args, 8))
	_S.define(_e, "PAL", _S.merge([{"k": _S.prop(_S.read(_e, "K"), 0)}, {"d": _S.prop(_S.read(_e, "K"), 1)}, {"m": _S.prop(_S.read(_e, "K"), 2)}, {"l": _S.prop(_S.read(_e, "K"), 3)}, {"h": _S.prop(_S.read(_e, "K"), 4)}, {"e": _S.prop(_S.read(_e, "C"), 0)}, {"n": _S.prop(_S.read(_e, "C"), 0)}, {"t": _S.prop(_S.read(_e, "K"), 3)}, {"g": _S.prop(_S.read(_e, "K"), 0)}]))
	_S.define(_e, "cx", _S.read(_e, "ox"))
	_S.define(_e, "cy", _S.binary("+", _S.read(_e, "SY"), _S.read(_e, "oy")))
	_S.define(_e, "hw", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "SW"), 2), _S.read(_e, "s")), 1))
	_S.define(_e, "hh", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "SH"), 2), _S.read(_e, "s")), _S.read(_e, "sq")), 1))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "cx"), _S.read(_e, "hw")), _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "hh")), _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "hw")), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "hh")), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "s")), _S.binary("/", _S.read(_e, "SW"), 2))]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.binary("*", _S.read(_e, "s"), _S.read(_e, "sq"))), _S.binary("/", _S.read(_e, "SH"), 2))]))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.read(_e, "u"), _S.read(_e, "v")]))):
		return null
	_S.define(_e, "ch", _S.prop(_S.prop(_S.read(_e, "SKULL"), _S.read(_e, "v")), _S.read(_e, "u")))
	if _S.truth(_S.read(_e, "white")):
		return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "ch"), "e"), func(): return _S.binary("===", _S.read(_e, "ch"), "n"))) else _S.read(_e, "WHITE"))
	_S.define(_e, "ck", _S.invoke(_S.read(_e, "CRACKS"), "get", [_S.binary("+", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "SW")), _S.read(_e, "u"))]))
	if _S.truth(_S.logical("&&", _S.binary("!==", _S.read(_e, "ck"), null), func(): return _S.binary("<", _S.read(_e, "ck"), _S.read(_e, "crack")))):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "crack"), 0.55), func(): return _S.binary("%", _S.binary("+", _S.read(_e, "u"), _S.read(_e, "v")), 2))) else _S.prop(_S.read(_e, "K"), 0))
	return _S.prop(_S.read(_e, "PAL"), _S.read(_e, "ch"))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "i", _S.arg(_args, 6))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	for _v0 in _S.array([_S.unary("-", 0.6), 0.7]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "j", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "h", _S.binary("*", _S.binary("+", 1.5, _S.binary("*", 3, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v2, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v2, "t"), 8), _S.binary("*", _S.read(_v2, "j"), 3.1)), _S.binary("*", _S.read(_v2, "i"), 7)), 4]))))), _S.read(_v2, "k")))
		_S.define(_v2, "sw", _S.binary("*", _S.call_value(_S.read(_v2, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v2, "t"), 4), _S.binary("*", _S.read(_v2, "j"), 2)), _S.binary("*", _S.read(_v2, "i"), 3)), 8]), 1.2))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v3, "d"), _S.read(_v3, "h"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "u", _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "h")))
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("+", _S.binary("+", _S.read(_v4, "x"), _S.read(_v4, "j")), _S.binary("*", _S.binary("*", _S.read(_v4, "sw"), _S.read(_v4, "u")), _S.read(_v4, "u"))), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "d")), (_S.prop(_S.read(_v4, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.3)) else (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.6)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.85)) else _S.prop(_S.read(_v4, "C"), 4)))), (1 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.75)) else _S.binary("*", _S.binary("-", 1, _S.read(_v4, "u")), 4))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "d", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 8, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.read(_e, "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bone"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0), 0.3])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "dust", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE")]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "K"), 2), _S.prop(_S.read(_e, "K"), 1), 0.4]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "K"), 1), _S.prop(_S.read(_e, "K"), 0), 0.5])]}, {"cap": _S.prop(_S.read(_e, "K"), 3)}, {"rim": [_S.prop(_S.read(_e, "K"), 4), _S.prop(_S.read(_e, "K"), 3), _S.prop(_S.read(_e, "K"), 2)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "stamped", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "acc", 0)
	_S.define(_e, "light", _S.function_value(_e, "_f5"))
	_S.define(_e, "head", (_S.prop(_S.read(_e, "A"), "y") if _S.truth(_S.read(_e, "A")) else _S.unary("-", 38)))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "c", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	return _S.invoke(_S.read(_e, "lights"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.read(_e, "r")}, {"c": _S.read(_e, "c")}, {"k": _S.read(_e, "k")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "STAMP"), 0.05))):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "k", _S.binary("/", _S.read(_v5, "t"), _S.read(_v5, "STAMP")))
		var _v6 = _S.scope(_v5)
		_S.write(_v6, "acc", _S.binary("*", _S.read(_v6, "dt"), _S.binary("+", 40, _S.binary("*", 60, _S.read(_v6, "k")))), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v6, "acc"), 1)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "D", _S.invoke(_S.read(_v7, "R"), "range", [22, 44]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "D")), _S.binary("+", _S.read(_v7, "SY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "D")), 0.8)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")])), 60), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 60), 0.8, _S.invoke(_S.read(_v7, "R"), "pick", [[_S.read(_v7, "WHITE"), _S.prop(_S.read(_v7, "C"), 7), _S.prop(_S.read(_v7, "C"), 6), _S.prop(_S.read(_v7, "C"), 5)]]), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 1])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [_S.binary("*", _S.read(_v5, "dt"), 14)])):
			var _v8 = _S.scope(_v5)
			_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
			_S.define(_v8, "D", _S.invoke(_S.read(_v8, "R"), "range", [20, 34]))
			_S.invoke(_S.read(_v8, "puffs"), "spawn", [_S.prop(_S.read(_v8, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "D")), _S.binary("+", _S.read(_v8, "SY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "D")), 0.7)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")])), 40), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.5, 0.7]), _S.invoke(_S.read(_v8, "R"), "range", [3, 5.5])])
		_S.call_value(_S.read(_v5, "attract"), [_S.prop(_S.read(_v5, "ps"), "list"), 0, _S.read(_v5, "SY"), _S.binary("*", 900000, _S.binary("+", 0.4, _S.read(_v5, "k"))), 70, 0.6, 2.5, _S.read(_v5, "dt"), _S.function_value(_v5, "_f7"), 300])
		_S.call_value(_S.read(_v5, "attract"), [_S.prop(_S.read(_v5, "puffs"), "list"), 0, _S.read(_v5, "SY"), _S.binary("*", 500000, _S.binary("+", 0.4, _S.read(_v5, "k"))), 60, 0.7, 3.5, _S.read(_v5, "dt"), _S.function_value(_v5, "_f8"), 120])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "STAMP")), func(): return _S.unary("!", _S.read(_e, "stamped")))):
		var _v9 = _S.scope(_e)
		_S.write(_v9, "stamped", true, "=", false)
		_S.set_prop(_S.prop(_S.read(_v9, "ps"), "list"), "length", 0, "=", false)
		_S.set_prop(_S.prop(_S.read(_v9, "puffs"), "list"), "length", 0, "=", false)
		_S.call_value(_S.read(_v9, "light"), [0, _S.read(_v9, "SY"), 64, _S.prop(_S.read(_v9, "C"), 5), 1, 0.35])
		_S.call_value(_S.read(_v9, "light"), [0, _S.read(_v9, "SY"), 30, _S.read(_v9, "WHITE"), 1, 0.1])
		_S.call_value(_S.read(_v9, "light"), [0, _S.binary("+", _S.read(_v9, "head"), 12), 40, _S.prop(_S.read(_v9, "C"), 4), 0.6, 0.5])
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 22)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
			_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [80, 160]))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), 6), _S.binary("+", _S.read(_v11, "SY"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 30), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.5])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v12 = _S.scope(_v9)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 6)):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
			_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [20, 45]))
			_S.invoke(_S.read(_v13, "puffs"), "spawn", [_S.prop(_S.read(_v13, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), 8), _S.binary("+", _S.read(_v13, "SY"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 0.6), 10), _S.invoke(_S.read(_v13, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v13, "R"), "range", [2.5, 4.5])])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "stamped"), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v14 = _S.scope(_e)
		for _v15 in _S.array(_S.read(_v14, "EYES")):
			var _v16 = _S.scope(_v14)
			var _v17 = _v15
			_S.define(_v16, "ex", _S.prop(_v17, 0))
			_S.define(_v16, "ey", _S.prop(_v17, 1))
			var _v18 = _S.scope(_v16)
			if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [_S.binary("*", _S.read(_v18, "dt"), 9)])):
				_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "EMBER"), _S.read(_v18, "ex"), _S.binary("-", _S.binary("+", _S.read(_v18, "SY"), _S.read(_v18, "ey")), 3), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [20, 45])), _S.invoke(_S.read(_v18, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v18, "C"), 6)])
			if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [_S.binary("*", _S.read(_v18, "dt"), 7)])):
				_S.invoke(_S.read(_v18, "puffs"), "spawn", [_S.prop(_S.read(_v18, "PK"), "SOOT"), _S.binary("+", _S.read(_v18, "ex"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("-", _S.binary("+", _S.read(_v18, "SY"), _S.read(_v18, "ey")), 3), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [14, 26])), _S.invoke(_S.read(_v18, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v18, "R"), "range", [1.4, 2.4])])
		if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", _S.read(_v14, "dt"), 8)])):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "VAPOUR"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 7), 7]), _S.binary("+", _S.read(_v14, "SY"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 12), 4]), _S.invoke(_S.read(_v14, "R"), "range", [0.5, 0.8]), (_S.prop(_S.read(_v14, "C"), 3) if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.5])) else _S.prop(_S.read(_v14, "C"), 4)), _S.invoke(_S.read(_v14, "R"), "range", [5, 8])])
		if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", _S.read(_v14, "dt"), 12)])):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "MOTE"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4]), _S.binary("+", _S.read(_v14, "SY"), 9), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v14, "R"), "range", [40, 70]), _S.invoke(_S.read(_v14, "R"), "range", [0.25, 0.4]), (_S.prop(_S.read(_v14, "C"), 6) if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.5])) else _S.prop(_S.read(_v14, "C"), 5)), 0.8])
		if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", _S.read(_v14, "dt"), 10)])):
			_S.invoke(_S.read(_v14, "puffs"), "spawn", [_S.prop(_S.read(_v14, "PK"), "SOOT"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3.5), 3.5]), _S.binary("+", _S.read(_v14, "SY"), 9), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3), 3]), _S.invoke(_S.read(_v14, "R"), "range", [14, 26]), _S.invoke(_S.read(_v14, "R"), "range", [0.45, 0.7]), _S.invoke(_S.read(_v14, "R"), "range", [1.2, 2.2])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v14, "t"), _S.binary("+", _S.read(_v14, "STAMP"), 0.3)), func(): return _S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", _S.read(_v14, "dt"), 5)]))):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1), 1]), (_S.binary("/", _S.prop(_S.read(_v14, "A"), "w"), 2) if _S.truth(_S.read(_v14, "A")) else 10)), _S.binary("+", _S.read(_v14, "head"), _S.invoke(_S.read(_v14, "R"), "range", [4, (_S.binary("-", _S.prop(_S.read(_v14, "A"), "h"), 4) if _S.truth(_S.read(_v14, "A")) else 30)])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v14, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_v14, "C"), 6), _S.invoke(_S.read(_v14, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v19 = _S.scope(_e)
		_S.write(_v19, "broke", true, "=", false)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 24)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "x", null)
			_S.define(_v21, "y", null)
			while true:
				_S.last([_S.write(_v21, "x", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 8.5), 8.5]), "=", false), _S.write(_v21, "y", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 9), 9]), "=", false)])
				if not _S.truth(_S.unary("!", _S.call_value(_S.read(_v21, "inSkull"), [_S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("+", _S.read(_v21, "x"), _S.binary("/", _S.read(_v21, "SW"), 2))]), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("+", _S.read(_v21, "y"), _S.binary("/", _S.read(_v21, "SH"), 2))])]))): break
			_S.invoke(_S.read(_v21, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "CHUNK")}, {"x": _S.read(_v21, "x")}, {"y": _S.binary("+", _S.read(_v21, "SY"), _S.read(_v21, "y"))}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v21, "x"), _S.invoke(_S.read(_v21, "R"), "range", [2.5, 6])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 12), 12]))}, {"vy": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 70), 10])}, {"g": 0.85}, {"drag": 0.4}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.2])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1, 2.4])}, {"ramp": [_S.prop(_S.read(_v21, "K"), 0), _S.prop(_S.read(_v21, "K"), 1), _S.prop(_S.read(_v21, "K"), 2), _S.prop(_S.read(_v21, "K"), 3), _S.prop(_S.read(_v21, "K"), 4)]}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v19)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 26)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "GRIT"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 7), 7]), _S.binary("+", _S.read(_v22, "SY"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 32), 32]), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 60), 20]), _S.invoke(_S.read(_v22, "R"), "range", [0.8, 1.3]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.prop(_S.read(_v22, "K"), 2), _S.prop(_S.read(_v22, "K"), 3), _S.prop(_S.read(_v22, "K"), 3), _S.prop(_S.read(_v22, "K"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.3])) else 1)])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v19)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 7)):
			_S.invoke(_S.read(_v23, "dust"), "spawn", [_S.prop(_S.read(_v23, "PK"), "SOOT"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 7), 7]), _S.binary("+", _S.read(_v23, "SY"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 6])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 20), 5]), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v23, "R"), "range", [2, 4]), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.1])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		for _v24 in _S.array(_S.read(_v19, "EYES")):
			var _v25 = _S.scope(_v19)
			var _v26 = _v24
			_S.define(_v25, "ex", _S.prop(_v26, 0))
			_S.define(_v25, "ey", _S.prop(_v26, 1))
			_S.invoke(_S.read(_v25, "puffs"), "spawn", [_S.prop(_S.read(_v25, "PK"), "FLAME"), _S.read(_v25, "ex"), _S.binary("+", _S.read(_v25, "SY"), _S.read(_v25, "ey")), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sign", [_S.read(_v25, "ex")]), 6), _S.unary("-", 30), 0.5, 2.6, 0, false])
		_S.call_value(_S.read(_v19, "light"), [0, _S.read(_v19, "SY"), 40, _S.prop(_S.read(_v19, "C"), 5), 0.5, 0.25])
	var _v27 = _S.scope(_e)
	_S.define(_v27, "i", _S.binary("-", _S.prop(_S.read(_v27, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v27, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v27, "lights"), _S.read(_v27, "i")), "life", _S.read(_v27, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v27, "lights"), "splice", [_S.read(_v27, "i"), 1])
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v28 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "b", _v28)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v29, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v29, "b"), "dusted")))):
			var _v30 = _S.scope(_v29)
			_S.set_prop(_S.read(_v30, "b"), "dusted", true, "=", false)
			_S.invoke(_S.read(_v30, "dust"), "spawn", [_S.prop(_S.read(_v30, "PK"), "SOOT"), _S.prop(_S.read(_v30, "b"), "x"), _S.unary("-", 1.5), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [4, 10])), _S.invoke(_S.read(_v30, "R"), "range", [0.35, 0.6]), _S.invoke(_S.read(_v30, "R"), "range", [1.5, 2.5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "dust"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "q"), "k"), _S.prop(_S.read(_e, "P"), "MOTE"))) else 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 1

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT"), _S.merge([{"x": 0}, {"y": _S.read(_e, "SY")}, {"k": (0.8 if _S.truth(_S.logical("&&", _S.read(_e, "stamped"), func(): return _S.unary("!", _S.read(_e, "broke")))) else 0.3)}, {"reach": 50}])])
	_S.invoke(_S.read(_e, "dust"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "flood", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "STAMP"), 0.04), _S.binary("+", _S.read(_e, "STAMP"), 0.42), _S.read(_e, "t")]))
	_S.define(_e, "ebb", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "BREAK"), 0.15), _S.binary("+", _S.read(_e, "BREAK"), 0.75), _S.read(_e, "t")])))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "A"), func(): return _S.binary(">", _S.read(_e, "flood"), 0)), func(): return _S.binary(">", _S.read(_e, "ebb"), 0))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "k", _S.read(_v31, "ebb"))
		_S.define(_v31, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_v31, "Math"), "sin", [_S.binary("*", _S.read(_v31, "t"), 9)]))))
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "my", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "my"), _S.prop(_S.read(_v32, "A"), "h"))):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "u", _S.binary("/", _S.read(_v33, "my"), _S.prop(_S.read(_v33, "A"), "h")))
			if _S.truth(_S.binary(">", _S.read(_v33, "u"), _S.binary("+", _S.read(_v33, "flood"), 0.06))):
				break
			_S.define(_v33, "edge", _S.logical("&&", _S.binary("<", _S.read(_v33, "flood"), 1), func(): return _S.binary("<", _S.invoke(_S.read(_v33, "Math"), "abs", [_S.binary("-", _S.read(_v33, "u"), _S.read(_v33, "flood"))]), 0.05)))
			_S.define(_v33, "band", _S.logical("&&", _S.binary(">=", _S.read(_v33, "flood"), 1), func(): return _S.binary("<", _S.invoke(_S.read(_v33, "Math"), "abs", [_S.binary("+", _S.binary("-", _S.read(_v33, "u"), _S.binary("%", _S.binary("*", _S.binary("-", _S.read(_v33, "t"), _S.read(_v33, "STAMP")), 1.3), 1.4)), 0.2)]), 0.06)))
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "mx", 0)
			while _S.truth(_S.binary("<", _S.read(_v34, "mx"), _S.prop(_S.read(_v34, "A"), "w"))):
				var _v35 = _S.scope(_v34)
				_S.define(_v35, "c0", _S.prop(_S.prop(_S.read(_v35, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v35, "my"), _S.prop(_S.read(_v35, "A"), "w")), _S.read(_v35, "mx"))))
				if _S.truth(_S.unary("!", _S.read(_v35, "c0"))):
					_v34 = _S.iteration(_v34)
					_S.write(_v34, "mx", 1, "+=", true)
					continue
				_S.define(_v35, "l", _S.call_value(_S.read(_v35, "luma"), [_S.read(_v35, "c0")]))
				_S.define(_v35, "cc", (_S.prop(_S.read(_v35, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v35, "l"), 0.72)) else (_S.prop(_S.read(_v35, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v35, "l"), 0.5)) else (_S.prop(_S.read(_v35, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v35, "l"), 0.33)) else (_S.prop(_S.read(_v35, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v35, "l"), 0.18)) else _S.prop(_S.read(_v35, "C"), 2))))))
				_S.invoke(_S.read(_v35, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v35, "A"), "x"), _S.read(_v35, "mx")), _S.binary("+", _S.prop(_S.read(_v35, "A"), "y"), _S.read(_v35, "my")), (_S.prop(_S.read(_v35, "C"), 7) if _S.truth(_S.read(_v35, "edge")) else (_S.prop(_S.read(_v35, "C"), 6) if _S.truth(_S.read(_v35, "band")) else _S.read(_v35, "cc"))), (0.85 if _S.truth(_S.read(_v35, "edge")) else (_S.binary("*", 0.7, _S.read(_v35, "k")) if _S.truth(_S.read(_v35, "band")) else _S.binary("*", _S.binary("*", 0.6, _S.read(_v35, "k")), _S.read(_v35, "pulse"))))])
				_v34 = _S.iteration(_v34)
				_S.write(_v34, "mx", 1, "+=", true)
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "my", 1, "+=", true)
		_S.invoke(_S.read(_v31, "p"), "outline", [_S.prop(_S.read(_v31, "A"), "mask"), _S.prop(_S.read(_v31, "A"), "x"), _S.prop(_S.read(_v31, "A"), "y"), _S.function_value(_v31, "_f11"), _S.function_value(_v31, "_f12")])
		_S.invoke(_S.read(_v31, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_v31, "A"), "y"), _S.binary("*", _S.prop(_S.read(_v31, "A"), "h"), 0.45)), 30, _S.prop(_S.read(_v31, "C"), 4), _S.binary("*", _S.binary("*", 0.3, _S.read(_v31, "k")), _S.read(_v31, "pulse"))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "STAMP"))):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "q", _S.binary("/", _S.read(_v36, "t"), _S.read(_v36, "STAMP")))
		_S.invoke(_S.read(_v36, "p"), "glow", [0, _S.read(_v36, "SY"), _S.binary("+", 14, _S.binary("*", 16, _S.read(_v36, "q"))), _S.prop(_S.read(_v36, "C"), 5), _S.binary("+", 0.2, _S.binary("*", 0.5, _S.read(_v36, "q")))])
		if _S.truth(_S.binary(">", _S.read(_v36, "q"), 0.15)):
			_S.call_value(_S.read(_v36, "ringFast"), [_S.read(_v36, "p"), 0, _S.read(_v36, "SY"), _S.binary("+", 4, _S.binary("*", 30, _S.binary("-", 1, _S.invoke(_S.read(_v36, "ease"), "inQuad", [_S.read(_v36, "q")])))), 1, (_S.prop(_S.read(_v36, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v36, "q"), 0.7)) else (_S.prop(_S.read(_v36, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v36, "q"), 0.4)) else _S.prop(_S.read(_v36, "C"), 3)))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "STAMP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "u", _S.binary("/", _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "STAMP")), 0.1))
		_S.define(_v37, "s", (_S.binary("-", 1.7, _S.binary("*", 0.7, _S.invoke(_S.read(_v37, "ease"), "inQuad", [_S.read(_v37, "u")]))) if _S.truth(_S.binary("<", _S.read(_v37, "u"), 1)) else 1))
		_S.define(_v37, "land", _S.binary("-", _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "STAMP")), 0.1))
		_S.define(_v37, "sq", (_S.binary("-", 1, _S.binary("*", _S.binary("*", 0.16, _S.invoke(_S.read(_v37, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v37, "land")), 18)])), _S.invoke(_S.read(_v37, "Math"), "cos", [_S.binary("*", _S.read(_v37, "land"), 40)]))) if _S.truth(_S.binary(">", _S.read(_v37, "land"), 0)) else 1))
		_S.define(_v37, "shake", (_S.binary("*", _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "CRACK")), 4) if _S.truth(_S.binary(">", _S.read(_v37, "t"), _S.read(_v37, "CRACK"))) else 0))
		_S.define(_v37, "ox", _S.invoke(_S.read(_v37, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("*", _S.read(_v37, "t"), 61)]), _S.read(_v37, "shake"))]))
		_S.define(_v37, "oy", (_S.invoke(_S.read(_v37, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("*", _S.read(_v37, "t"), 3.4)]), 1.2)]) if _S.truth(_S.binary(">", _S.read(_v37, "land"), 0)) else 0))
		_S.call_value(_S.read(_v37, "skull"), [_S.read(_v37, "p"), _S.read(_v37, "C"), _S.read(_v37, "K"), _S.read(_v37, "s"), _S.read(_v37, "sq"), _S.read(_v37, "ox"), _S.read(_v37, "oy"), _S.binary("<", _S.read(_v37, "t"), _S.binary("+", _S.read(_v37, "STAMP"), 0.067)), _S.call_value(_S.read(_v37, "smooth"), [_S.read(_v37, "CRACK"), _S.read(_v37, "BREAK"), _S.read(_v37, "t")])])
		_S.define(_v37, "burn", _S.call_value(_S.read(_v37, "smooth"), [_S.binary("+", _S.read(_v37, "STAMP"), 0.1), _S.binary("+", _S.read(_v37, "STAMP"), 0.25), _S.read(_v37, "t")]))
		if _S.truth(_S.binary(">=", _S.read(_v37, "u"), 1)):
			_S.invoke(_S.read(_v37, "EYES"), "forEach", [_S.function_value(_v37, "_f13")])
		if _S.truth(_S.binary("<", _S.read(_v37, "u"), 1.2)):
			_S.call_value(_S.read(_v37, "sparkle"), [_S.read(_v37, "p"), 0, _S.read(_v37, "SY"), _S.binary("*", 14, _S.binary("-", 1, _S.binary("/", _S.read(_v37, "u"), 1.2))), _S.prop(_S.read(_v37, "C"), 7), _S.prop(_S.read(_v37, "C"), 5), 0.6])
		_S.invoke(_S.read(_v37, "p"), "glow", [0, _S.read(_v37, "SY"), 26, _S.prop(_S.read(_v37, "C"), 4), 0.25])
	_S.define(_e, "ru", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "STAMP")), 0.08), 0.3))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "ru"), 0), func(): return _S.binary("<", _S.read(_e, "ru"), 1))):
		_S.call_value(_S.read(_e, "ringFast"), [_S.read(_e, "p"), 0, _S.binary("+", _S.read(_e, "SY"), 2), _S.binary("+", 10, _S.binary("*", 26, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "ru")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_e, "ru")))]), _S.function_value(_e, "_f14"), _S.binary("-", 1.2, _S.read(_e, "ru"))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "FLAME")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	for _v39 in _S.array(_S.read(_e, "lights")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "l", _v39)
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "q", _S.binary("/", _S.prop(_S.read(_v41, "l"), "life"), _S.prop(_S.read(_v41, "l"), "max")))
		_S.invoke(_S.read(_v41, "p"), "glow", [_S.prop(_S.read(_v41, "l"), "x"), _S.prop(_S.read(_v41, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v41, "l"), "r"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v41, "q")))), _S.prop(_S.read(_v41, "l"), "c"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v41, "l"), "k"), _S.read(_v41, "q")), _S.read(_v41, "q"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "STAMP"), 0.067)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", 10), _S.binary("-", _S.read(_e, "SY"), 10), 10, _S.binary("+", _S.read(_e, "SY"), 10), _S.function_value(_e, "_f15"), 0.2])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "my"), 0.7), _S.binary("*", _S.read(_e, "t"), 14)), _S.binary("*", _S.read(_e, "mx"), 0.3))]), 0.2)) else _S.prop(_S.read(_e, "C"), 4))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return (_S.read(_e, "k") if _S.truth(_S.binary("<=", _S.binary("/", _S.read(_e, "my"), _S.prop(_S.read(_e, "A"), "h")), _S.read(_e, "flood"))) else 0)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v38 = _S.arg(_args, 0)
	_S.define(_e, "ex", _S.prop(_v38, 0))
	_S.define(_e, "ey", _S.prop(_v38, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "eyeFire"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.binary("+", _S.read(_e, "ox"), _S.read(_e, "ex")), _S.binary("+", _S.binary("+", _S.read(_e, "SY"), _S.read(_e, "oy")), _S.read(_e, "ey")), _S.read(_e, "t"), _S.binary("*", _S.read(_e, "burn"), _S.binary("+", 1, _S.binary("*", 0.4, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "CRACK"), _S.read(_e, "BREAK"), _S.read(_e, "t")])))), _S.read(_e, "i")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "SW"), 2))]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "SY")), _S.binary("/", _S.read(_e, "SH"), 2))]))
	return _S.logical("&&", _S.call_value(_S.read(_e, "inSkull"), [_S.read(_e, "u"), _S.read(_e, "v")]), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "SKULL"), _S.read(_e, "v")), _S.read(_e, "u")), "e"))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary(">=", _S.read(_e, "v"), 0)), func(): return _S.binary("<", _S.read(_e, "u"), _S.read(_e, "SW"))), func(): return _S.binary("<", _S.read(_e, "v"), _S.read(_e, "SH"))), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "SKULL"), _S.read(_e, "v")), _S.read(_e, "u")), "."))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "out", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "paths", [[[8, 1], [7, 3], [8, 5], [6, 6], [5, 7]], [[9, 1], [10, 3], [10, 4], [12, 6], [12, 7]], [[4, 3], [3, 5], [2, 6]], [[13, 4], [14, 6]]])
	for _v42 in _S.array(_S.read(_e, "paths")):
		var _v43 = _S.scope(_e)
		_S.define(_v43, "path", _v42)
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "n", 0)
		_S.define(_v44, "len", _S.binary("-", _S.prop(_S.read(_v44, "path"), "length"), 1))
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v45, "k"), _S.read(_v45, "len"))):
			var _v46 = _S.scope(_v45)
			var _v47 = _S.prop(_S.read(_v46, "path"), _S.read(_v46, "k"))
			_S.define(_v46, "x0", _S.prop(_v47, 0))
			_S.define(_v46, "y0", _S.prop(_v47, 1))
			var _v48 = _S.prop(_S.read(_v46, "path"), _S.binary("+", _S.read(_v46, "k"), 1))
			_S.define(_v46, "x1", _S.prop(_v48, 0))
			_S.define(_v46, "y1", _S.prop(_v48, 1))
			_S.define(_v46, "steps", _S.invoke(_S.read(_v46, "Math"), "max", [_S.invoke(_S.read(_v46, "Math"), "abs", [_S.binary("-", _S.read(_v46, "x1"), _S.read(_v46, "x0"))]), _S.invoke(_S.read(_v46, "Math"), "abs", [_S.binary("-", _S.read(_v46, "y1"), _S.read(_v46, "y0"))])]))
			var _v49 = _S.scope(_v46)
			_S.define(_v49, "s", 0)
			while _S.truth(_S.binary("<=", _S.read(_v49, "s"), _S.read(_v49, "steps"))):
				var _v50 = _S.scope(_v49)
				_S.define(_v50, "x", _S.invoke(_S.read(_v50, "Math"), "round", [_S.binary("+", _S.read(_v50, "x0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v50, "x1"), _S.read(_v50, "x0")), _S.read(_v50, "s")), _S.read(_v50, "steps")))]))
				_S.define(_v50, "y", _S.invoke(_S.read(_v50, "Math"), "round", [_S.binary("+", _S.read(_v50, "y0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v50, "y1"), _S.read(_v50, "y0")), _S.read(_v50, "s")), _S.read(_v50, "steps")))]))
				_S.define(_v50, "key", _S.binary("+", _S.binary("*", _S.read(_v50, "y"), _S.read(_v50, "SW")), _S.read(_v50, "x")))
				if _S.truth(_S.unary("!", _S.invoke(_S.read(_v50, "out"), "has", [_S.read(_v50, "key")]))):
					_S.invoke(_S.read(_v50, "out"), "set", [_S.read(_v50, "key"), _S.binary("/", _S.binary("+", _S.read(_v50, "k"), _S.binary("/", _S.read(_v50, "s"), _S.invoke(_S.read(_v50, "Math"), "max", [1, _S.read(_v50, "steps")]))), _S.read(_v50, "len"))])
				_S.write(_v50, "n", 1, "+=", true)
				_v49 = _S.iteration(_v49)
				_S.write(_v49, "s", 1, "+=", true)
			_v45 = _S.iteration(_v45)
			_S.write(_v45, "k", 1, "+=", true)
	return _S.read(_e, "out")
