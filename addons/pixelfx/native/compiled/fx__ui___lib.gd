@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "FONTS", _S.import_value("core/index.js", "FONTS"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "spell", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawWord", _S.function_value(_e, "_f1"))
	_S.define(_e, "tintActor", _S.function_value(_e, "_f5"))
	_S.define(_e, "lightActor", _S.function_value(_e, "_f6"))
	_S.define(_e, "haloActor", _S.function_value(_e, "_f8"))
	_S.define(_e, "panel", _S.function_value(_e, "_f10"))
	_S.define(_e, "shake", _S.function_value(_e, "_f12"))
	_exports["spell"] = _S.read(_e, "spell")
	_S.define(_e, "ids", _S.construct(_S.read(_e, "Int16Array"), [4096]))
	_S.define(_e, "edges", _S.construct(_S.read(_e, "Uint8Array"), [4096]))
	_exports["drawWord"] = _S.read(_e, "drawWord")
	_exports["tintActor"] = _S.read(_e, "tintActor")
	_exports["lightActor"] = _S.read(_e, "lightActor")
	_exports["haloActor"] = _S.read(_e, "haloActor")
	_exports["panel"] = _S.read(_e, "panel")
	_S.define(_e, "HEART", ["..kkk...kkk..", ".khhok.khook.", "khwhookoooomk", "khwoooooooomk", "khoooooooommk", "kooooooooomdk", ".kooooooomdk.", "..kooooomdk..", "...kooomdk...", "....komdk....", ".....kdk.....", "......k......"])
	_exports["HEART"] = _S.read(_e, "HEART")
	_S.define(_e, "heartPal", _S.function_value(_e, "_f13"))
	_exports["heartPal"] = _S.read(_e, "heartPal")
	_exports["shake"] = _S.read(_e, "shake")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "str", _S.arg(_args, 0))
	_S.define(_e, "font", _S.coalesce(_S.arg(_args, 1), func(): return "big"))
	_S.define(_e, "F", _S.prop(_S.read(_e, "FONTS"), _S.read(_e, "font")))
	_S.define(_e, "letters", [])
	_S.define(_e, "x", 0)
	for _v0 in _S.array(_S.call_value(_S.read(_e, "String"), [_S.read(_e, "str")])):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "ch", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "g", _S.logical("??", _S.logical("??", _S.prop(_S.prop(_S.read(_v2, "F"), "glyphs"), _S.read(_v2, "ch")), func(): return _S.prop(_S.prop(_S.read(_v2, "F"), "glyphs"), _S.invoke(_S.read(_v2, "ch"), "toUpperCase", []))), func(): return null))
		_S.define(_v2, "w", (_S.prop(_S.read(_v2, "g"), "w") if _S.truth(_S.read(_v2, "g")) else _S.prop(_S.read(_v2, "F"), "space")))
		_S.invoke(_S.read(_v2, "letters"), "push", [_S.merge([{"ch": _S.read(_v2, "ch")}, {"g": _S.read(_v2, "g")}, {"x": _S.read(_v2, "x")}, {"w": _S.read(_v2, "w")}, {"h": _S.prop(_S.read(_v2, "F"), "h")}])])
		_S.write(_v2, "x", _S.binary("+", _S.read(_v2, "w"), _S.prop(_S.read(_v2, "F"), "gap")), "+=", false)
	return _S.merge([{"letters": _S.read(_e, "letters")}, {"w": _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "F"), "gap"))])}, {"h": _S.prop(_S.read(_e, "F"), "h")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "items", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "items"), "length"))):
		return null
	_S.define(_e, "x0", INF)
	_S.define(_e, "y0", INF)
	_S.define(_e, "x1", _S.unary("-", INF))
	_S.define(_e, "y1", _S.unary("-", INF))
	for _v3 in _S.array(_S.read(_e, "items")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "it", _v3)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "h", _S.binary("*", _S.prop(_S.prop(_S.prop(_S.read(_v5, "it"), "g"), "rows"), "length"), _S.prop(_S.read(_v5, "it"), "sy")))
		_S.define(_v5, "w", _S.binary("*", _S.prop(_S.prop(_S.read(_v5, "it"), "g"), "w"), _S.prop(_S.read(_v5, "it"), "sx")))
		_S.define(_v5, "sl", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.logical("??", _S.prop(_S.read(_v5, "it"), "slant"), func(): return 0)]), _S.prop(_S.prop(_S.prop(_S.read(_v5, "it"), "g"), "rows"), "length")))
		_S.write(_v5, "x0", _S.invoke(_S.read(_v5, "Math"), "min", [_S.read(_v5, "x0"), _S.binary("-", _S.prop(_S.read(_v5, "it"), "x"), _S.read(_v5, "sl"))]), "=", false)
		_S.write(_v5, "x1", _S.invoke(_S.read(_v5, "Math"), "max", [_S.read(_v5, "x1"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v5, "it"), "x"), _S.read(_v5, "w")), _S.read(_v5, "sl"))]), "=", false)
		_S.write(_v5, "y0", _S.invoke(_S.read(_v5, "Math"), "min", [_S.read(_v5, "y0"), _S.prop(_S.read(_v5, "it"), "y")]), "=", false)
		_S.write(_v5, "y1", _S.invoke(_S.read(_v5, "Math"), "max", [_S.read(_v5, "y1"), _S.binary("+", _S.prop(_S.read(_v5, "it"), "y"), _S.read(_v5, "h"))]), "=", false)
	_S.define(_e, "ow", _S.logical("??", _S.prop(_S.read(_e, "st"), "ow"), func(): return 1))
	_S.write(_e, "x0", _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x0")]), 1), _S.read(_e, "ow")), "=", false)
	_S.write(_e, "y0", _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y0")]), 1), _S.read(_e, "ow")), "=", false)
	_S.write(_e, "x1", _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "x1")]), 2), _S.read(_e, "ow")), "=", false)
	_S.write(_e, "y1", _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "y1")]), 3), _S.read(_e, "ow")), "=", false)
	_S.define(_e, "W", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")))
	_S.define(_e, "H", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")))
	if _S.truth(_S.binary(">", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")), _S.prop(_S.read(_e, "ids"), "length"))):
		_S.last([_S.write(_e, "ids", _S.construct(_S.read(_e, "Int16Array"), [_S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")), 2)]), "=", false), _S.write(_e, "edges", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")), 2)]), "=", false)])
	_S.invoke(_S.read(_e, "ids"), "fill", [0, 0, _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))])
	_S.invoke(_S.read(_e, "items"), "forEach", [_S.function_value(_e, "_f2")])
	_S.define(_e, "at", _S.function_value(_e, "_f4"))
	_S.define(_e, "F", _S.prop(_S.read(_e, "st"), "fill"))
	_S.define(_e, "nF", _S.prop(_S.read(_e, "F"), "length"))
	_S.define(_e, "shine", _S.prop(_S.read(_e, "st"), "shine"))
	_S.define(_e, "glint", _S.logical("??", _S.prop(_S.read(_e, "st"), "glint"), func(): return _S.read(_e, "WHITE")))
	_S.define(_e, "sy0", _S.logical("??", _S.prop(_S.read(_e, "st"), "shineY"), func(): return _S.read(_e, "y0")))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "y", _S.read(_v10, "y0"))
	while _S.truth(_S.binary("<", _S.read(_v10, "y"), _S.read(_v10, "y1"))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "x", _S.read(_v11, "x0"))
		while _S.truth(_S.binary("<", _S.read(_v11, "x"), _S.read(_v11, "x1"))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "id", _S.call_value(_S.read(_v12, "at"), [_S.read(_v12, "x"), _S.read(_v12, "y")]))
			if _S.truth(_S.read(_v12, "id")):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "it", _S.prop(_S.read(_v13, "items"), _S.binary("-", _S.read(_v13, "id"), 1)))
				_S.define(_v13, "v", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v13, "y"), 0.5), _S.prop(_S.read(_v13, "it"), "y")), _S.binary("*", _S.prop(_S.prop(_S.prop(_S.read(_v13, "it"), "g"), "rows"), "length"), _S.prop(_S.read(_v13, "it"), "sy"))))
				_S.define(_v13, "i", _S.invoke(_S.read(_v13, "Math"), "min", [_S.binary("-", _S.read(_v13, "nF"), 1), _S.invoke(_S.read(_v13, "Math"), "max", [0, _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.read(_v13, "v")), _S.read(_v13, "nF"))])])]))
				_S.define(_v13, "c", _S.prop(_S.read(_v13, "F"), _S.read(_v13, "i")))
				_S.define(_v13, "e", _S.prop(_S.read(_v13, "edges"), _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v13, "y"), _S.read(_v13, "y0")), _S.read(_v13, "W")), _S.binary("-", _S.read(_v13, "x"), _S.read(_v13, "x0")))))
				if _S.truth(_S.binary("&", _S.read(_v13, "e"), 1)):
					_S.write(_v13, "c", _S.logical("??", _S.prop(_S.read(_v13, "st"), "edge"), func(): return _S.prop(_S.read(_v13, "F"), _S.binary("-", _S.read(_v13, "nF"), 1))), "=", false)
				else:
					if _S.truth(_S.binary("&", _S.read(_v13, "e"), 2)):
						_S.write(_v13, "c", _S.logical("??", _S.prop(_S.read(_v13, "st"), "under"), func(): return _S.prop(_S.read(_v13, "F"), 0)), "=", false)
					else:
						if _S.truth(_S.logical("&&", _S.binary("&", _S.read(_v13, "e"), 4), func(): return _S.binary("<", _S.read(_v13, "i"), _S.binary("-", _S.read(_v13, "nF"), 1)))):
							_S.write(_v13, "c", _S.prop(_S.read(_v13, "F"), _S.binary("+", _S.read(_v13, "i"), 1)), "=", false)
				if _S.truth(_S.logical("&&", _S.binary("!==", _S.read(_v13, "shine"), null), func(): return _S.binary("!==", _S.read(_v13, "shine"), null))):
					var _v14 = _S.scope(_v13)
					_S.define(_v14, "d", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v14, "x"), 0.5), _S.binary("*", _S.binary("-", _S.binary("+", _S.read(_v14, "y"), 0.5), _S.read(_v14, "sy0")), 0.6)), _S.read(_v14, "shine"))]))
					if _S.truth(_S.binary("<", _S.read(_v14, "d"), 1.1)):
						_S.write(_v14, "c", _S.read(_v14, "WHITE"), "=", false)
					else:
						if _S.truth(_S.binary("<", _S.read(_v14, "d"), 2.4)):
							_S.write(_v14, "c", _S.read(_v14, "glint"), "=", false)
				if _S.truth(_S.logical("||", _S.binary(">", _S.prop(_S.read(_v13, "it"), "flash"), 0.6), func(): return _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v13, "it"), "flash"), 0.25), func(): return _S.binary("<", _S.read(_v13, "v"), 0.5)))):
					_S.write(_v13, "c", _S.read(_v13, "WHITE"), "=", false)
				_S.invoke(_S.read(_v13, "p"), "dot", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c"), _S.logical("??", _S.prop(_S.read(_v13, "it"), "a"), func(): return 1)])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "x", 1, "+=", true)
				continue
			_S.define(_v12, "n", 0)
			var _v15 = _S.scope(_v12)
			_S.define(_v15, "dy", _S.unary("-", _S.read(_v15, "ow")))
			while _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v15, "dy"), _S.read(_v15, "ow")), func(): return _S.unary("!", _S.read(_v15, "n")))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "dx", _S.unary("-", _S.read(_v16, "ow")))
				while _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v16, "dx"), _S.read(_v16, "ow")), func(): return _S.unary("!", _S.read(_v16, "n")))):
					if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v16, "ow"), 2), func(): return _S.binary("<", _S.binary("+", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "dx")]), _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "dy")])), 4))):
						_S.write(_v16, "n", _S.call_value(_S.read(_v16, "at"), [_S.binary("+", _S.read(_v16, "x"), _S.read(_v16, "dx")), _S.binary("+", _S.read(_v16, "y"), _S.read(_v16, "dy"))]), "=", false)
					_v16 = _S.iteration(_v16)
					_S.write(_v16, "dx", 1, "+=", true)
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "dy", 1, "+=", true)
			if _S.truth(_S.read(_v12, "n")):
				var _v17 = _S.scope(_v12)
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.prop(_S.read(_v17, "st"), "outline"), _S.logical("??", _S.prop(_S.prop(_S.read(_v17, "items"), _S.binary("-", _S.read(_v17, "n"), 1)), "a"), func(): return 1)])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "x", 1, "+=", true)
				continue
			_S.define(_v12, "s", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v12, "at"), [_S.binary("-", _S.read(_v12, "x"), _S.read(_v12, "ow")), _S.binary("-", _S.binary("-", _S.read(_v12, "y"), 1), _S.read(_v12, "ow"))]), func(): return _S.call_value(_S.read(_v12, "at"), [_S.binary("-", _S.binary("+", _S.read(_v12, "x"), 1), _S.read(_v12, "ow")), _S.binary("-", _S.binary("-", _S.read(_v12, "y"), 1), _S.read(_v12, "ow"))])), func(): return _S.call_value(_S.read(_v12, "at"), [_S.binary("-", _S.read(_v12, "x"), _S.read(_v12, "ow")), _S.binary("-", _S.read(_v12, "y"), _S.read(_v12, "ow"))])))
			if _S.truth(_S.logical("&&", _S.read(_v12, "s"), func(): return _S.prop(_S.read(_v12, "st"), "shadow"))):
				_S.invoke(_S.read(_v12, "p"), "dot", [_S.read(_v12, "x"), _S.read(_v12, "y"), _S.prop(_S.read(_v12, "st"), "shadow"), _S.binary("*", _S.logical("??", _S.prop(_S.prop(_S.read(_v12, "items"), _S.binary("-", _S.read(_v12, "s"), 1)), "a"), func(): return 1), 0.9)])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "x", 1, "+=", true)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "y", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "g", _S.prop(_S.read(_e, "it"), "g"))
	_S.define(_e, "gh", _S.prop(_S.prop(_S.read(_e, "g"), "rows"), "length"))
	_S.define(_e, "h", _S.binary("*", _S.read(_e, "gh"), _S.prop(_S.read(_e, "it"), "sy")))
	_S.define(_e, "bot", _S.binary("+", _S.prop(_S.read(_e, "it"), "y"), _S.read(_e, "h")))
	_S.define(_e, "sl", _S.logical("??", _S.prop(_S.read(_e, "it"), "slant"), func(): return 0))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "py", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.prop(_S.read(_v6, "it"), "y")]))
	while _S.truth(_S.binary("<", _S.read(_v6, "py"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.read(_v6, "bot")]))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "gy", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v7, "py"), 0.5), _S.prop(_S.read(_v7, "it"), "y")), _S.prop(_S.read(_v7, "it"), "sy"))]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v7, "gy"), 0), func(): return _S.binary(">=", _S.read(_v7, "gy"), _S.read(_v7, "gh")))):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "py", 1, "+=", true)
			continue
		_S.define(_v7, "shift", _S.invoke(_S.read(_v7, "Math"), "round", [_S.binary("*", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v7, "bot"), _S.read(_v7, "py")), 0.5), _S.prop(_S.read(_v7, "it"), "sy")), _S.read(_v7, "sl"))]))
		_S.define(_v7, "ry", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v7, "py"), 0.5), _S.prop(_S.read(_v7, "it"), "y")), _S.binary("*", _S.read(_v7, "gy"), _S.prop(_S.read(_v7, "it"), "sy"))))
		_S.define(_v7, "row", _S.prop(_S.prop(_S.read(_v7, "g"), "rows"), _S.read(_v7, "gy")))
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "px", _S.binary("-", _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v8, "it"), "x"), _S.read(_v8, "shift"))]), 1))
		while _S.truth(_S.binary("<=", _S.read(_v8, "px"), _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v8, "it"), "x"), _S.read(_v8, "shift")), _S.binary("*", _S.prop(_S.read(_v8, "g"), "w"), _S.prop(_S.read(_v8, "it"), "sx")))]))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "fx", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v9, "px"), 0.5), _S.prop(_S.read(_v9, "it"), "x")), _S.read(_v9, "shift")))
			_S.define(_v9, "gx", _S.invoke(_S.read(_v9, "Math"), "floor", [_S.binary("/", _S.read(_v9, "fx"), _S.prop(_S.read(_v9, "it"), "sx"))]))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v9, "gx"), 0), func(): return _S.binary(">=", _S.read(_v9, "gx"), _S.prop(_S.read(_v9, "g"), "w"))), func(): return _S.unary("!", _S.prop(_S.read(_v9, "row"), _S.read(_v9, "gx"))))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "px", 1, "+=", true)
				continue
			_S.define(_v9, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v9, "py"), _S.read(_v9, "y0")), _S.read(_v9, "W")), _S.binary("-", _S.read(_v9, "px"), _S.read(_v9, "x0"))))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "i"), 0), func(): return _S.binary(">=", _S.read(_v9, "i"), _S.binary("*", _S.read(_v9, "W"), _S.read(_v9, "H"))))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "px", 1, "+=", true)
				continue
			_S.set_prop(_S.read(_v9, "ids"), _S.read(_v9, "i"), _S.binary("+", _S.read(_v9, "k"), 1), "=", false)
			_S.define(_v9, "rx", _S.binary("-", _S.read(_v9, "fx"), _S.binary("*", _S.read(_v9, "gx"), _S.prop(_S.read(_v9, "it"), "sx"))))
			_S.define(_v9, "up", (_S.prop(_S.prop(_S.read(_v9, "g"), "rows"), _S.binary("-", _S.read(_v9, "gy"), 1)) if _S.truth(_S.binary(">", _S.read(_v9, "gy"), 0)) else null))
			_S.define(_v9, "dn", (_S.prop(_S.prop(_S.read(_v9, "g"), "rows"), _S.binary("+", _S.read(_v9, "gy"), 1)) if _S.truth(_S.binary("<", _S.read(_v9, "gy"), _S.binary("-", _S.read(_v9, "gh"), 1))) else null))
			_S.define(_v9, "open", _S.function_value(_v9, "_f3"))
			_S.set_prop(_S.read(_v9, "edges"), _S.read(_v9, "i"), _S.binary("|", _S.binary("|", (1 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v9, "ry"), 1), func(): return _S.call_value(_S.read(_v9, "open"), [_S.read(_v9, "up")]))) else 0), (2 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v9, "ry"), _S.binary("-", _S.prop(_S.read(_v9, "it"), "sy"), 1)), func(): return _S.call_value(_S.read(_v9, "open"), [_S.read(_v9, "dn")]))) else 0)), (4 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v9, "rx"), 1), func(): return _S.unary("!", _S.logical("&&", _S.binary(">", _S.read(_v9, "gx"), 0), func(): return _S.prop(_S.read(_v9, "row"), _S.binary("-", _S.read(_v9, "gx"), 1)))))) else 0)), "=", false)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "px", 1, "+=", true)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "py", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.logical("||", _S.unary("!", _S.read(_e, "r")), func(): return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "r"), _S.read(_e, "gx"))), func(): return _S.unary("!", _S.prop(_S.read(_e, "r"), _S.binary("-", _S.read(_e, "gx"), 1)))), func(): return _S.unary("!", _S.prop(_S.read(_e, "r"), _S.binary("+", _S.read(_e, "gx"), 1)))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (0 if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "x"), _S.read(_e, "x0")), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "y0"))), func(): return _S.binary(">=", _S.read(_e, "x"), _S.read(_e, "x1"))), func(): return _S.binary(">=", _S.read(_e, "y"), _S.read(_e, "y1")))) else _S.prop(_S.read(_e, "ids"), _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0")), _S.read(_e, "W")), _S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0")))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "ramp", _S.arg(_args, 3))
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "A")), func(): return _S.binary("<=", _S.read(_e, "k"), 0.12))):
		return null
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "pix", _S.prop(_S.read(_e, "A"), "pixels"))
	_S.define(_e, "cut", (0 if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (0.22 if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else 0.5)))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "j"), _S.prop(_S.read(_v18, "m"), "h"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.prop(_S.read(_v19, "m"), "w"))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "q", _S.binary("+", _S.binary("*", _S.read(_v20, "j"), _S.prop(_S.read(_v20, "m"), "w")), _S.read(_v20, "i")))
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v20, "m"), "data"), _S.read(_v20, "q")))):
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
				continue
			_S.define(_v20, "l", (_S.call_value(_S.read(_v20, "luma"), [_S.prop(_S.read(_v20, "pix"), _S.read(_v20, "q"))]) if _S.truth(_S.read(_v20, "pix")) else 0.6))
			if _S.truth(_S.binary("<", _S.read(_v20, "l"), _S.read(_v20, "cut"))):
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v20, "A"), "x"), _S.read(_v20, "i")), _S.binary("+", _S.prop(_S.read(_v20, "A"), "y"), _S.read(_v20, "j")), ((_S.read(_v20, "WHITE") if _S.truth(_S.binary(">", _S.read(_v20, "k"), 0.8)) else _S.prop(_S.read(_v20, "ramp"), 2)) if _S.truth(_S.binary(">", _S.read(_v20, "l"), 0.5)) else (_S.prop(_S.read(_v20, "ramp"), 1) if _S.truth(_S.binary(">", _S.read(_v20, "l"), 0.22)) else _S.prop(_S.read(_v20, "ramp"), 0)))])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "j", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "rim", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "t", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "A")), func(): return _S.logical("&&", _S.binary("<=", _S.read(_e, "k"), 0.01), func(): return _S.binary("<=", _S.read(_e, "rim"), 0.01)))):
		return null
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "pix", _S.prop(_S.read(_e, "A"), "pixels"))
	_S.define(_e, "has", _S.function_value(_e, "_f7"))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "j"), _S.prop(_S.read(_v21, "m"), "h"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), _S.prop(_S.read(_v22, "m"), "w"))):
			var _v23 = _S.scope(_v22)
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v23, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_v23, "j"), _S.prop(_S.read(_v23, "m"), "w")), _S.read(_v23, "i"))))):
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "i", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v23, "k"), 0.01)):
				_S.invoke(_S.read(_v23, "p"), "light", [_S.binary("+", _S.prop(_S.read(_v23, "A"), "x"), _S.read(_v23, "i")), _S.binary("+", _S.prop(_S.read(_v23, "A"), "y"), _S.read(_v23, "j")), _S.read(_v23, "c"), _S.binary("*", _S.read(_v23, "k"), _S.binary("-", 1.1, _S.binary("/", _S.binary("*", 0.5, _S.read(_v23, "j")), _S.prop(_S.read(_v23, "m"), "h"))))])
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_v23, "rim"), 0.01), func(): return _S.unary("!", _S.call_value(_S.read(_v23, "has"), [_S.binary("-", _S.read(_v23, "i"), 1), _S.read(_v23, "j")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v23, "has"), [_S.binary("+", _S.read(_v23, "i"), 1), _S.read(_v23, "j")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v23, "has"), [_S.read(_v23, "i"), _S.binary("-", _S.read(_v23, "j"), 1)])))):
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "i", 1, "+=", true)
				continue
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.call_value(_S.read(_v23, "has"), [_S.binary("-", _S.read(_v23, "i"), 2), _S.read(_v23, "j")]), func(): return _S.call_value(_S.read(_v23, "has"), [_S.binary("+", _S.read(_v23, "i"), 2), _S.read(_v23, "j")])), func(): return _S.call_value(_S.read(_v23, "has"), [_S.read(_v23, "i"), _S.binary("-", _S.read(_v23, "j"), 2)]))):
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "i", 1, "+=", true)
				continue
			_S.define(_v23, "f", _S.binary("*", _S.read(_v23, "rim"), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.call_value(_S.read(_v23, "noise"), [_S.binary("-", _S.binary("*", _S.read(_v23, "j"), 0.6), _S.binary("*", _S.read(_v23, "t"), 8)), _S.binary("*", _S.read(_v23, "i"), 3)])))))
			if _S.truth(_S.binary(">", _S.read(_v23, "f"), 0.25)):
				_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v23, "A"), "x"), _S.read(_v23, "i")), _S.binary("+", _S.prop(_S.read(_v23, "A"), "y"), _S.read(_v23, "j")), _S.call_value(_S.read(_v23, "mix"), [(_S.logical("||", _S.prop(_S.read(_v23, "pix"), _S.binary("+", _S.binary("*", _S.read(_v23, "j"), _S.prop(_S.read(_v23, "m"), "w")), _S.read(_v23, "i"))), func(): return _S.read(_v23, "c")) if _S.truth(_S.read(_v23, "pix")) else _S.read(_v23, "c")), _S.read(_v23, "c"), _S.invoke(_S.read(_v23, "Math"), "min", [0.85, _S.read(_v23, "f")])])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "j", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.prop(_S.read(_e, "m"), "w"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.prop(_S.read(_e, "m"), "h"))), func(): return _S.prop(_S.prop(_S.read(_e, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.prop(_S.read(_e, "m"), "w")), _S.read(_e, "i"))))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "t", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "A")), func(): return _S.binary("<=", _S.read(_e, "k"), 0.02))):
		return null
	_S.invoke(_S.read(_e, "p"), "outline", [_S.prop(_S.read(_e, "A"), "mask"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), _S.read(_e, "c"), _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return _S.binary("*", _S.read(_e, "k"), _S.binary("+", 0.75, _S.binary("*", 0.45, _S.call_value(_S.read(_e, "noise"), [_S.binary("-", _S.binary("*", _S.read(_e, "my"), 0.45), _S.binary("*", _S.read(_e, "t"), 7)), _S.binary("*", _S.read(_e, "mx"), 3)]))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	_S.define(_e, "h", _S.arg(_args, 4))
	_S.define(_e, "col", _S.arg(_args, 5))
	var _v24 = _S.coalesce(_S.arg(_args, 6), func(): return _S.merge([]))
	_S.define(_e, "r", _S.coalesce(_S.prop(_v24, "r"), func(): return 3))
	_S.define(_e, "a", _S.coalesce(_S.prop(_v24, "a"), func(): return 1))
	_S.define(_e, "shine", _S.coalesce(_S.prop(_v24, "shine"), func(): return null))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "w"), 2), func(): return _S.binary("<", _S.read(_e, "h"), 2))):
		return null
	_S.define(_e, "X1", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "w")))
	_S.define(_e, "Y1", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "X1"), _S.read(_e, "Y1"), _S.function_value(_e, "_f11")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "cx", _S.invoke(_S.read(_e, "Math"), "max", [_S.binary("-", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), _S.read(_e, "px")), 0, _S.binary("-", _S.read(_e, "px"), _S.binary("-", _S.read(_e, "X1"), _S.read(_e, "r")))]))
	_S.define(_e, "cy", _S.invoke(_S.read(_e, "Math"), "max", [_S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "r")), _S.read(_e, "py")), 0, _S.binary("-", _S.read(_e, "py"), _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "r")))]))
	_S.define(_e, "e", (_S.binary("-", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "cx"), _S.read(_e, "cy")])) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "cx"), 0), func(): return _S.binary(">", _S.read(_e, "cy"), 0))) else _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.binary("-", _S.read(_e, "X1"), _S.read(_e, "px")), _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "py"))])))
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 0)):
		return null
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 1)):
		return _S.prop(_S.read(_e, "col"), "outline")
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), 2)):
		return _S.prop(_S.read(_e, "col"), "rim")
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "py")), 2)):
		return _S.prop(_S.read(_e, "col"), "low")
	if _S.truth(_S.binary("!==", _S.read(_e, "shine"), null)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "d", _S.invoke(_S.read(_v25, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_v25, "px"), _S.binary("*", _S.binary("-", _S.read(_v25, "py"), _S.read(_v25, "y")), 0.6)), _S.read(_v25, "shine"))]))
		if _S.truth(_S.binary("<", _S.read(_v25, "d"), 1.3)):
			return _S.read(_v25, "WHITE")
		if _S.truth(_S.binary("<", _S.read(_v25, "d"), 3)):
			return _S.prop(_S.read(_v25, "col"), "rim")
	return (_S.prop(_S.read(_e, "col"), "top") if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.binary("*", _S.read(_e, "h"), 0.45))) else _S.prop(_S.read(_e, "col"), "body"))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "amp", _S.arg(_args, 1))
	_S.define(_e, "t0", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "len", _S.coalesce(_S.arg(_args, 3), func(): return 0.3))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 4), func(): return 1))
	_S.define(_e, "hz", _S.coalesce(_S.arg(_args, 5), func(): return 32))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "t0")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "t0"), _S.read(_e, "len"))))):
		return [0, 0]
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "len"))))
	return [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "t"), _S.read(_e, "hz")), _S.read(_e, "seed")]), _S.read(_e, "amp")), _S.read(_e, "k")), 1.7)]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "t"), _S.read(_e, "hz")), _S.binary("+", _S.read(_e, "seed"), 7)]), _S.read(_e, "amp")), _S.read(_e, "k")), 1.3)])]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "C", _S.arg(_args, 0))
	return _S.merge([{"k": _S.prop(_S.read(_e, "C"), 0)}, {"w": _S.read(_e, "WHITE")}, {"h": _S.prop(_S.read(_e, "C"), 5)}, {"o": _S.prop(_S.read(_e, "C"), 4)}, {"m": _S.prop(_S.read(_e, "C"), 3)}, {"d": _S.prop(_S.read(_e, "C"), 2)}])
