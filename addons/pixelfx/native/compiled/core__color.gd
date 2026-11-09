@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/color.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "hex", _S.function_value(_e, "_f0"))
	_S.define(_e, "mix", _S.function_value(_e, "_f1"))
	_S.define(_e, "fit", _S.function_value(_e, "_f2"))
	_S.define(_e, "blend", _S.function_value(_e, "_f4"))
	_S.define(_e, "rgb", _S.function_value(_e, "_f5"))
	_exports["rgb"] = _S.read(_e, "rgb")
	_S.define(_e, "red", _S.function_value(_e, "_f6"))
	_exports["red"] = _S.read(_e, "red")
	_S.define(_e, "green", _S.function_value(_e, "_f7"))
	_exports["green"] = _S.read(_e, "green")
	_S.define(_e, "blue", _S.function_value(_e, "_f8"))
	_exports["blue"] = _S.read(_e, "blue")
	_exports["hex"] = _S.read(_e, "hex")
	_S.define(_e, "toHex", _S.function_value(_e, "_f9"))
	_exports["toHex"] = _S.read(_e, "toHex")
	_exports["mix"] = _S.read(_e, "mix")
	_S.define(_e, "scale", _S.function_value(_e, "_f11"))
	_exports["scale"] = _S.read(_e, "scale")
	_S.define(_e, "luma", _S.function_value(_e, "_f12"))
	_exports["luma"] = _S.read(_e, "luma")
	_S.define(_e, "ramp", _S.function_value(_e, "_f13"))
	_exports["ramp"] = _S.read(_e, "ramp")
	_exports["fit"] = _S.read(_e, "fit")
	_S.define(_e, "at", _S.function_value(_e, "_f14"))
	_exports["at"] = _S.read(_e, "at")
	_exports["blend"] = _S.read(_e, "blend")
	_S.define(_e, "PAL", _S.merge([{"fire": ["#1f0b10", "#4a1118", "#8c1d1c", "#cc3a1a", "#f2701f", "#ffae35", "#ffe27a", "#fff8d6"]}, {"ember": ["#1a0a0e", "#3d1012", "#701a14", "#a8301a", "#e0561e", "#ff8a2a", "#ffc46a"]}, {"lava": ["#14060a", "#380a10", "#6e1210", "#ac2410", "#e8501a", "#ff8c2a", "#ffd25a"]}, {"smoke": ["#0e0c12", "#1d1a22", "#2e2a35", "#433e4b", "#5c5664", "#7b7484", "#a39cab"]}, {"dust": ["#1c1610", "#33281c", "#4f3f2c", "#6e5a40", "#927a58", "#b89f78", "#dcc8a2"]}, {"ice": ["#0c1430", "#162c5c", "#1f4f94", "#2f7fcc", "#58b4ec", "#9bdcff", "#d8f4ff", "#ffffff"]}, {"water": ["#081830", "#0e2e5a", "#14508c", "#1c76bc", "#36a2e0", "#78ccf4", "#c4ecff", "#ffffff"]}, {"electric": ["#0a0f2e", "#172a78", "#2550d0", "#3f8cff", "#7cc8ff", "#c8f0ff", "#ffffff"]}, {"volt": ["#24160a", "#5e3a0c", "#a8680f", "#e8a218", "#ffd23c", "#fff08a", "#ffffff"]}, {"poison": ["#0d1a0c", "#173a14", "#265e18", "#3f8a1e", "#6cb82a", "#a8e04a", "#e0ff8a"]}, {"holy": ["#2a1c08", "#5a3e10", "#9a6c18", "#d8a428", "#ffd84a", "#fff09a", "#fffbe6", "#ffffff"]}, {"heal": ["#08201a", "#0f3f2c", "#17663e", "#24924e", "#3ec466", "#7ee88a", "#c8ffc4", "#ffffff"]}, {"arcane": ["#140a26", "#2b1252", "#481c88", "#6b2cc0", "#9a48ec", "#c684ff", "#ecc8ff", "#ffffff"]}, {"shadow": ["#050308", "#0f0a18", "#1c1230", "#2c1a4a", "#432468", "#5e3290", "#8048b8", "#a970e0"]}, {"blood": ["#14040a", "#3a0a14", "#6a101c", "#a01824", "#d42a30", "#ff5a50", "#ff9a8a"]}, {"earth": ["#140e0a", "#2a1e14", "#47321e", "#69492a", "#8e6638", "#b88a52", "#dcb47c"]}, {"stone": ["#0e0e12", "#1c1c24", "#2c2c38", "#42424f", "#5c5c6b", "#7d7d8c", "#a4a4b2", "#d0d0da"]}, {"gold": ["#1e1206", "#4a2c08", "#86520c", "#c48412", "#f0b424", "#ffe066", "#fff6c4", "#ffffff"]}, {"leaf": ["#0c1a0e", "#163418", "#225224", "#357530", "#4f9a3a", "#7cc048", "#b4e070", "#e4ffb0"]}, {"wood": ["#160c06", "#2e1a0c", "#4a2c14", "#6a421e", "#8e5c2c", "#b47c40", "#d8a464"]}, {"metal": ["#0c0e14", "#1c2230", "#2e3648", "#4a5468", "#6e7a90", "#9aa6ba", "#d0d8e6", "#ffffff"]}, {"bone": ["#1a1814", "#3a352c", "#5e5648", "#8a806c", "#b8ad96", "#e4dcc8", "#fffaf0"]}, {"neon": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"cyber": ["#041418", "#08303a", "#0c5260", "#108088", "#18b4b0", "#4ce8d8", "#b4fff0", "#ffffff"]}, {"matrix": ["#020a04", "#05200c", "#0a3c16", "#106624", "#1a9a34", "#3cd650", "#a4ffa8", "#e8ffe8"]}, {"candy": ["#ff4a5a", "#ff9a2a", "#ffe03c", "#5ad84a", "#3cc8ff", "#7a6cff", "#f53cd1"]}, {"night": ["#07060d", "#0c0a18", "#131026", "#1b1734", "#241f44", "#2f2956"]}]))
	_exports["PAL"] = _S.read(_e, "PAL")
	_S.define(_e, "RAMP", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "PAL")]), "map", [_S.function_value(_e, "_f15")])]))
	_exports["RAMP"] = _S.read(_e, "RAMP")
	_S.define(_e, "WHITE", _S.call_value(_S.read(_e, "hex"), ["#ffffff"]))
	_exports["WHITE"] = _S.read(_e, "WHITE")
	_S.define(_e, "BLACK", _S.call_value(_S.read(_e, "hex"), ["#000000"]))
	_exports["BLACK"] = _S.read(_e, "BLACK")
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0b0a10"]))
	_exports["INK"] = _S.read(_e, "INK")
	_S.define(_e, "PATCH", _S.call_value(_S.read(_e, "hex"), ["#f53cd1"]))
	_exports["PATCH"] = _S.read(_e, "PATCH")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "h", _S.arg(_args, 0))
	if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_e, "h")), "number")):
		return _S.read(_e, "h")
	_S.define(_e, "s", _S.invoke(_S.read(_e, "h"), "replace", ["#", ""]))
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "s"), "length"), 3)):
		_S.write(_e, "s", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), 0), _S.prop(_S.read(_e, "s"), 0)), _S.prop(_S.read(_e, "s"), 1)), _S.prop(_S.read(_e, "s"), 1)), _S.prop(_S.read(_e, "s"), 2)), _S.prop(_S.read(_e, "s"), 2)), "=", false)
	_S.define(_e, "v", _S.call_value(_S.read(_e, "parseInt"), [_S.invoke(_S.read(_e, "s"), "slice", [0, 6]), 16]))
	return _S.call_value(_S.read(_e, "rgb"), [_S.binary("&", _S.binary(">>", _S.read(_e, "v"), 16), 255), _S.binary("&", _S.binary(">>", _S.read(_e, "v"), 8), 255), _S.binary("&", _S.read(_e, "v"), 255)])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "t")]), "=", false)
	return _S.call_value(_S.read(_e, "rgb"), [_S.binary("+", _S.call_value(_S.read(_e, "red"), [_S.read(_e, "a")]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "red"), [_S.read(_e, "b")]), _S.call_value(_S.read(_e, "red"), [_S.read(_e, "a")])), _S.read(_e, "t"))), _S.binary("+", _S.call_value(_S.read(_e, "green"), [_S.read(_e, "a")]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "green"), [_S.read(_e, "b")]), _S.call_value(_S.read(_e, "green"), [_S.read(_e, "a")])), _S.read(_e, "t"))), _S.binary("+", _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "a")]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "b")]), _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "a")])), _S.read(_e, "t")))])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.write(_e, "r", _S.invoke(_S.read(_e, "r"), "map", [_S.read(_e, "hex")]), "=", false)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "r"), "length"), _S.read(_e, "n"))):
		return _S.read(_e, "r")
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f3")])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1)), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("-", _S.read(_e, "n"), 1)]))]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "x", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "t")]), _S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1)))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")])]))
	return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "r"), _S.read(_e, "i")), _S.prop(_S.read(_e, "r"), _S.binary("+", _S.read(_e, "i"), 1)), _S.binary("-", _S.read(_e, "x"), _S.read(_e, "i"))])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	_S.define(_e, "b", _S.arg(_args, 2))
	return _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.binary("&", _S.read(_e, "b"), 255), 16)), _S.binary("<<", _S.binary("&", _S.read(_e, "g"), 255), 8)), _S.binary("&", _S.read(_e, "r"), 255))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("&", _S.read(_e, "c"), 255)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("&", _S.binary(">>>", _S.read(_e, "c"), 8), 255)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("&", _S.binary(">>>", _S.read(_e, "c"), 16), 255)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("+", "#", _S.invoke(_S.invoke([_S.call_value(_S.read(_e, "red"), [_S.read(_e, "c")]), _S.call_value(_S.read(_e, "green"), [_S.read(_e, "c")]), _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "c")])], "map", [_S.function_value(_e, "_f10")]), "join", [""]))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.invoke(_S.invoke(_S.read(_e, "v"), "toString", [16]), "padStart", [2, "0"])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "rgb"), [_S.invoke(_S.read(_e, "Math"), "min", [255, _S.binary("*", _S.call_value(_S.read(_e, "red"), [_S.read(_e, "c")]), _S.read(_e, "k"))]), _S.invoke(_S.read(_e, "Math"), "min", [255, _S.binary("*", _S.call_value(_S.read(_e, "green"), [_S.read(_e, "c")]), _S.read(_e, "k"))]), _S.invoke(_S.read(_e, "Math"), "min", [255, _S.binary("*", _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "c")]), _S.read(_e, "k"))])])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", 0.299, _S.call_value(_S.read(_e, "red"), [_S.read(_e, "c")])), _S.binary("*", 0.587, _S.call_value(_S.read(_e, "green"), [_S.read(_e, "c")]))), _S.binary("*", 0.114, _S.call_value(_S.read(_e, "blue"), [_S.read(_e, "c")]))), 255)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "list", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "list"), "map", [_S.read(_e, "hex")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "length"))]), 0, _S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1)]))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "k", _S.prop(_v0, 0))
	_S.define(_e, "v", _S.prop(_v0, 1))
	return [_S.read(_e, "k"), _S.call_value(_S.read(_e, "ramp"), [_S.read(_e, "v")])]
