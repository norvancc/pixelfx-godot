@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/actor.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "maskOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "pixelsOf", _S.function_value(_e, "_f3"))
	_S.define(_e, "stockActor", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawActor", _S.function_value(_e, "_f7"))
	_S.define(_e, "HERO", ["....kkkkk...", "..kkhhhhhk..", ".khhhhhhhhk.", ".khhhhhhhhhk", ".khhssssshhk", ".khsessesshk", ".khsessesshk", "..ksssssssk.", "...kkSSSkk..", "..kttttttk..", ".kttTttTttk.", ".ksttTTttsk.", ".kstttttttk.", "..kbbbbbbk..", "..kppkkppk..", "..kppk.kppk.", "..kppk.kppk.", "..koook.kook", "..kkkkk.kkkk"])
	_S.define(_e, "HERO_PAL", _S.merge([{"k": "#17121f"}, {"h": "#7a4128"}, {"s": "#f3c49d"}, {"S": "#c98b6c"}, {"e": "#17121f"}, {"t": "#5f6f94"}, {"T": "#46536f"}, {"b": "#8a5a32"}, {"p": "#38334a"}, {"o": "#6a4030"}, {"H": "#a35d34"}, {"w": "#ffffff"}, {"m": "#a3564a"}, {"g": "#e8c060"}, {"L": "#7f90b6"}, {"O": "#8f5a3f"}, {"P": "#4b4560"}, {"c": "#f53cd1"}, {"C": "#ff8fe6"}, {"D": "#a31f8a"}]))
	_S.define(_e, "DUMMY_PAL", _S.merge([{"k": "#0e0c14"}, {"A": "#e4e6ec"}, {"B": "#b6b9c3"}, {"C": "#868995"}, {"D": "#5c5e6a"}, {"E": "#6e707c"}, {"F": "#4b4d58"}, {"G": "#34353f"}, {"J": "#2a2b33"}, {"m": "#f53cd1"}]))
	_S.define(_e, "HERO2", ["...........kkk..........", "..........kAABk.........", ".........kAAABJk........", ".........kABBJJk........", ".........kBBBJCDk.......", ".........kBCJDDDk.......", ".........kkJJJDk........", ".......kkkkABBJCkk......", "......kAABCJBCCCkDk.....", "......kABBCJCCCmDkDk....", "......kBBCDDJCDDDkDk....", "......kABCDJDDDDDkk.....", ".....kAABDkDDDDJkk......", ".....kABCDkDDJJGkk......", ".....kABCkJJJGGGkk......", "....kJJCDkFFFGGGk.......", "....kAJJDkJJJGGGk.......", "....kJCJJkABBJGGk.......", ".....kJCCkBBCDJJJk......", ".....kCCCJBBCDJJDk......", ".....kCCCDJCCDkJDDk.....", "......kCDDJBCDkDDDk.....", ".......kDJJJCDkDDDkk....", ".......kJBCJCDkDDDkk....", ".......kBDJBCDkCDDkk....", "........kJJBCDkCDDk.....", "........kBBBCDkCCDDk....", "........kBBBCDkCCDDk....", ".........kBBCDkJDDDk....", "........kBJJJJkCJJJk....", "........kBBCCDkCCDDk....", "........kBBCDDkCDDk.....", "........kBBCDkCCDDk.....", "........kBCCDkCCDDk.....", "........kBCDDkCDDDk.....", ".......kJBCJkkkDJkkkk...", ".......kAJJAAAAkCCCCCk..", "........kkkkkkkkkkkkk..."])
	_S.define(_e, "MASKS", _S.merge([{1: _S.call_value(_S.read(_e, "maskOf"), [_S.read(_e, "HERO"), 1])}, {2: _S.call_value(_S.read(_e, "maskOf"), [_S.read(_e, "HERO2"), 1])}]))
	_S.define(_e, "SPRITES", _S.merge([{1: _S.read(_e, "HERO")}, {2: _S.read(_e, "HERO2")}]))
	_S.define(_e, "PIXELS", _S.merge([{1: _S.call_value(_S.read(_e, "pixelsOf"), [_S.read(_e, "HERO"), _S.read(_e, "HERO_PAL")])}, {2: _S.call_value(_S.read(_e, "pixelsOf"), [_S.read(_e, "HERO2"), _S.read(_e, "DUMMY_PAL")])}]))
	_exports["stockActor"] = _S.read(_e, "stockActor")
	_exports["drawActor"] = _S.read(_e, "drawActor")
	_S.define(_e, "actorAlphaOf", _S.function_value(_e, "_f8"))
	_exports["actorAlphaOf"] = _S.read(_e, "actorAlphaOf")
	_exports["HERO"] = _S.read(_e, "HERO")
	_exports["HERO2"] = _S.read(_e, "HERO2")
	_exports["HERO_PAL"] = _S.read(_e, "HERO_PAL")
	_exports["DUMMY_PAL"] = _S.read(_e, "DUMMY_PAL")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rows", _S.arg(_args, 0))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	_S.define(_e, "h", _S.binary("*", _S.prop(_S.read(_e, "rows"), "length"), _S.read(_e, "k")))
	_S.define(_e, "w", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "rows"), 0), "length"), _S.read(_e, "k")))
	_S.define(_e, "data", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]))
	_S.invoke(_S.read(_e, "rows"), "forEach", [_S.function_value(_e, "_f1")])
	return _S.merge([{"w": _S.read(_e, "w")}, {"h": _S.read(_e, "h")}, {"data": _S.read(_e, "data")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.concat([_S.array(_S.read(_e, "r"))]), "forEach", [_S.function_value(_e, "_f2")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ch", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	if _S.truth(_S.binary("===", _S.read(_e, "ch"), ".")):
		return null
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), _S.binary("*", _S.read(_v0, "k"), _S.read(_v0, "k")))):
		_S.set_prop(_S.read(_v0, "data"), _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v0, "y"), _S.read(_v0, "k")), _S.binary("|", _S.binary("/", _S.read(_v0, "j"), _S.read(_v0, "k")), 0)), _S.read(_v0, "w")), _S.binary("*", _S.read(_v0, "x"), _S.read(_v0, "k"))), _S.binary("%", _S.read(_v0, "j"), _S.read(_v0, "k"))), 1, "=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rows", _S.arg(_args, 0))
	_S.define(_e, "pal", _S.arg(_args, 1))
	_S.define(_e, "w", _S.prop(_S.prop(_S.read(_e, "rows"), 0), "length"))
	_S.define(_e, "data", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.prop(_S.read(_e, "rows"), "length"))]))
	_S.invoke(_S.read(_e, "rows"), "forEach", [_S.function_value(_e, "_f4")])
	return _S.read(_e, "data")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.concat([_S.array(_S.read(_e, "r"))]), "forEach", [_S.function_value(_e, "_f5")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ch", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	return _S.set_prop(_S.read(_e, "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "w")), _S.read(_e, "x")), (0 if _S.truth(_S.binary("===", _S.read(_e, "ch"), ".")) else _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "pal"), _S.read(_e, "ch"))])), "=", false)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 0), func(): return 1))
	_S.write(_e, "k", (2 if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else 1), "=", false)
	_S.define(_e, "m", _S.prop(_S.read(_e, "MASKS"), _S.read(_e, "k")))
	_S.define(_e, "x", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.prop(_S.read(_e, "m"), "w"), 2)])))
	_S.define(_e, "y", _S.unary("-", _S.prop(_S.read(_e, "m"), "h")))
	return _S.merge([{"mask": _S.read(_e, "m")}, {"pixels": _S.prop(_S.read(_e, "PIXELS"), _S.read(_e, "k"))}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"w": _S.prop(_S.read(_e, "m"), "w")}, {"h": _S.prop(_S.read(_e, "m"), "h")}, {"k": _S.read(_e, "k")}, {"head": [0, _S.read(_e, "y")]}, {"chest": [0, (_S.unary("-", 26) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else _S.binary("+", _S.read(_e, "y"), 11))]}, (_S.merge([{"eyes": [[13, 3], [15, 3]]}]) if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)) else _S.merge([]))])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "actor", _S.coalesce(_S.arg(_args, 1), func(): return _S.call_value(_S.read(_e, "stockActor"), [])))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 2), func(): return 1))
	if _S.truth(_S.binary(">", _S.read(_e, "a"), 0)):
		_S.invoke(_S.read(_e, "p"), "sprite", [_S.prop(_S.read(_e, "SPRITES"), (2 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "actor"), "k"), 2)) else 1)), (_S.read(_e, "DUMMY_PAL") if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "actor"), "k"), 2)) else _S.read(_e, "HERO_PAL")), _S.prop(_S.read(_e, "actor"), "x"), _S.prop(_S.read(_e, "actor"), "y"), _S.merge([{"a": _S.read(_e, "a")}])])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	return (_S.invoke(_S.read(_e, "mod"), "actorAlpha", [_S.read(_e, "t"), _S.read(_e, "o")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.prop(_S.read(_e, "mod"), "actorAlpha")), "function")) else 1)
