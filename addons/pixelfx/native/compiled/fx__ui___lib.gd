@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"ui_draw_word"}
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

static func _f0(_parent,_args:Array,_this=null):
	var _n_FONTS = _S.read(_parent,"FONTS")
	var _n_String = _S.read(_parent,"String")
	var _n_str_b0 = _S.arg(_args,0)
	var _n_font_b1 = _S.coalesce(_S.arg(_args,1),func():return "big")
	var _n_F_b2 = _S.index_value(_n_FONTS,_n_font_b1)
	var _n_letters_b3 = []
	var _n_x_b4 = 0
	for _iter_0 in _S.array(_S.call_value(_n_String,[_n_str_b0])):
		var _n_ch_b5 = _iter_0
		var _n_g_b6 = _S.logical("??",(_S.index_value(_S.named_value(_n_F_b2,"glyphs"),_n_ch_b5) if _S.index_value(_S.named_value(_n_F_b2,"glyphs"),_n_ch_b5)!=null else _S.index_value(_S.named_value(_n_F_b2,"glyphs"),_S.invoke(_n_ch_b5,"toUpperCase",[]))),func():return null)
		var _n_w_b7 = (_S.named_value(_n_g_b6,"w") if _S.truth(_n_g_b6) else _S.named_value(_n_F_b2,"space"))
		_S.invoke(_n_letters_b3,"push",[{"ch":_n_ch_b5,"g":_n_g_b6,"x":_n_x_b4,"w":_n_w_b7,"h":_S.named_value(_n_F_b2,"h")}])
		_n_x_b4 += (_n_w_b7 + _S.named_value(_n_F_b2,"gap"))
	return {"letters":_n_letters_b3,"w":maxf(0,(_n_x_b4 - _S.named_value(_n_F_b2,"gap"))),"h":_S.named_value(_n_F_b2,"h")}
	return null

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

static func _f2(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_W = _S.read(_parent,"W")
	var _n_x0 = _S.read(_parent,"x0")
	var _n_H = _S.read(_parent,"H")
	var _n_ids = _S.read(_parent,"ids")
	var _n_this = _S.read(_parent,"this")
	var _n_edges = _S.read(_parent,"edges")
	var _n_it_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.named_value(_n_it_b0,"g")
	var _n_gh_b3 = _S.prop(_S.named_value(_n_g_b2,"rows"),"length")
	var _n_h_b4 = (_n_gh_b3 * _S.named_value(_n_it_b0,"sy"))
	var _n_bot_b5 = (_S.named_value(_n_it_b0,"y") + _n_h_b4)
	var _n_sl_b6 = (_S.named_value(_n_it_b0,"slant") if _S.named_value(_n_it_b0,"slant")!=null else 0)
	if true:
		var _n_py_b7 = floori(_S.named_value(_n_it_b0,"y"))
		while _S.truth((_n_py_b7 < ceili(_n_bot_b5))):
			var _n_gy_b8 = floori((float(((_n_py_b7 + 0.5) - _S.named_value(_n_it_b0,"y")))/_S.named_value(_n_it_b0,"sy")))
			if _S.truth(((_n_gy_b8 < 0) if _S.truth((_n_gy_b8 < 0)) else (_n_gy_b8 >= _n_gh_b3))):
				_n_py_b7 += 1.0
				continue
			var _n_shift_b9 = floori(((float(((_n_bot_b5 - _n_py_b7) - 0.5))/_S.named_value(_n_it_b0,"sy")) * _n_sl_b6)+0.5)
			var _n_ry_b10 = (((_n_py_b7 + 0.5) - _S.named_value(_n_it_b0,"y")) - (_n_gy_b8 * _S.named_value(_n_it_b0,"sy")))
			var _n_row_b11 = _S.index_value(_S.named_value(_n_g_b2,"rows"),_n_gy_b8)
			if true:
				var _n_px_b12 = (floori((_S.named_value(_n_it_b0,"x") + _n_shift_b9)) - 1)
				while _S.truth((_n_px_b12 <= ceili(((_S.named_value(_n_it_b0,"x") + _n_shift_b9) + (_S.named_value(_n_g_b2,"w") * _S.named_value(_n_it_b0,"sx")))))):
					var _n_fx_b13 = (((_n_px_b12 + 0.5) - _S.named_value(_n_it_b0,"x")) - _n_shift_b9)
					var _n_gx_b14 = floori((float(_n_fx_b13)/_S.named_value(_n_it_b0,"sx")))
					if _S.truth((((_n_gx_b14 < 0) if _S.truth((_n_gx_b14 < 0)) else (_n_gx_b14 >= _S.named_value(_n_g_b2,"w"))) if _S.truth(((_n_gx_b14 < 0) if _S.truth((_n_gx_b14 < 0)) else (_n_gx_b14 >= _S.named_value(_n_g_b2,"w")))) else not _S.truth(_S.index_value(_n_row_b11,_n_gx_b14)))):
						_n_px_b12 += 1.0
						continue
					var _n_i_b15 = (((_n_py_b7 - _n_y0) * _n_W) + (_n_px_b12 - _n_x0))
					if _S.truth(((_n_i_b15 < 0) if _S.truth((_n_i_b15 < 0)) else (_n_i_b15 >= (_n_W * _n_H)))):
						_n_px_b12 += 1.0
						continue
					_S.set_prop(_n_ids,_n_i_b15,(_n_k_b1 + 1),"=")
					var _n_rx_b16 = (_n_fx_b13 - (_n_gx_b14 * _S.named_value(_n_it_b0,"sx")))
					var _n_up_b17 = (_S.index_value(_S.named_value(_n_g_b2,"rows"),(_n_gy_b8 - 1)) if _S.truth((_n_gy_b8 > 0)) else null)
					var _n_dn_b18 = (_S.index_value(_S.named_value(_n_g_b2,"rows"),(_n_gy_b8 + 1)) if _S.truth((_n_gy_b8 < (_n_gh_b3 - 1))) else null)
					var _n_open_b19 = _S.function_value(_S.capture(_parent,{"gx":_n_gx_b14,"this":_n_this}),"_f3")
					_S.set_prop(_n_edges,_n_i_b15,_S.binary("|",_S.binary("|",(1 if _S.truth((_S.call_value(_n_open_b19,[_n_up_b17]) if _S.truth((_n_ry_b10 < 1)) else (_n_ry_b10 < 1))) else 0),(2 if _S.truth((_S.call_value(_n_open_b19,[_n_dn_b18]) if _S.truth((_n_ry_b10 >= (_S.named_value(_n_it_b0,"sy") - 1))) else (_n_ry_b10 >= (_S.named_value(_n_it_b0,"sy") - 1)))) else 0)),(4 if _S.truth((not _S.truth((_S.index_value(_n_row_b11,(_n_gx_b14 - 1)) if _S.truth((_n_gx_b14 > 0)) else (_n_gx_b14 > 0))) if _S.truth((_n_rx_b16 < 1)) else (_n_rx_b16 < 1))) else 0)),"=")
					_n_px_b12 += 1.0
			_n_py_b7 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_gx = _S.read(_parent,"gx")
	var _n_r_b0 = _S.arg(_args,0)
	return (not _S.truth(_n_r_b0) if _S.truth(not _S.truth(_n_r_b0)) else (not _S.truth(_S.index_value(_n_r_b0,(_n_gx + 1))) if _S.truth((not _S.truth(_S.index_value(_n_r_b0,(_n_gx - 1))) if _S.truth(not _S.truth(_S.index_value(_n_r_b0,_n_gx))) else not _S.truth(_S.index_value(_n_r_b0,_n_gx)))) else (not _S.truth(_S.index_value(_n_r_b0,(_n_gx - 1))) if _S.truth(not _S.truth(_S.index_value(_n_r_b0,_n_gx))) else not _S.truth(_S.index_value(_n_r_b0,_n_gx)))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_x1 = _S.read(_parent,"x1")
	var _n_y1 = _S.read(_parent,"y1")
	var _n_ids = _S.read(_parent,"ids")
	var _n_W = _S.read(_parent,"W")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((((_n_x_b0 < _n_x0) if _S.truth((_n_x_b0 < _n_x0)) else (_n_y_b1 < _n_y0)) if _S.truth(((_n_x_b0 < _n_x0) if _S.truth((_n_x_b0 < _n_x0)) else (_n_y_b1 < _n_y0))) else (_n_x_b0 >= _n_x1)) if _S.truth((((_n_x_b0 < _n_x0) if _S.truth((_n_x_b0 < _n_x0)) else (_n_y_b1 < _n_y0)) if _S.truth(((_n_x_b0 < _n_x0) if _S.truth((_n_x_b0 < _n_x0)) else (_n_y_b1 < _n_y0))) else (_n_x_b0 >= _n_x1))) else (_n_y_b1 >= _n_y1))) else _S.index_value(_n_ids,(((_n_y_b1 - _n_y0) * _n_W) + (_n_x_b0 - _n_x0))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_ramp_b3 = _S.arg(_args,3)
	if _S.truth((not _S.truth(_n_A_b1) if _S.truth(not _S.truth(_n_A_b1)) else (_n_k_b2 <= 0.12))):
		return null
	var _n_m_b4 = _S.named_value(_n_A_b1,"mask")
	var _n_pix_b5 = _S.named_value(_n_A_b1,"pixels")
	var _n_cut_b6 = (0 if _S.truth((_n_k_b2 > 0.6)) else (0.22 if _S.truth((_n_k_b2 > 0.3)) else 0.5))
	if true:
		var _n_j_b7 = 0
		while _S.truth((_n_j_b7 < _S.named_value(_n_m_b4,"h"))):
			if true:
				var _n_i_b8 = 0
				while _S.truth((_n_i_b8 < _S.named_value(_n_m_b4,"w"))):
					var _n_q_b9 = ((_n_j_b7 * _S.named_value(_n_m_b4,"w")) + _n_i_b8)
					if _S.truth(not _S.truth(_S.index_value(_S.named_value(_n_m_b4,"data"),_n_q_b9))):
						_n_i_b8 += 1.0
						continue
					var _n_l_b10 = (_S.ColorFX.luma(_S.index_value(_n_pix_b5,_n_q_b9)) if _S.truth(_n_pix_b5) else 0.6)
					if _S.truth((_n_l_b10 < _n_cut_b6)):
						_n_i_b8 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A_b1,"x") + _n_i_b8), (_S.named_value(_n_A_b1,"y") + _n_j_b7), ((_n_WHITE if _S.truth((_n_k_b2 > 0.8)) else _S.index_value(_n_ramp_b3,2)) if _S.truth((_n_l_b10 > 0.5)) else (_S.index_value(_n_ramp_b3,1) if _S.truth((_n_l_b10 > 0.22)) else _S.index_value(_n_ramp_b3,0)))])
					_n_i_b8 += 1.0
			_n_j_b7 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_rim_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	var _n_t_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	if _S.truth((not _S.truth(_n_A_b1) if _S.truth(not _S.truth(_n_A_b1)) else ((_n_rim_b4 <= 0.01) if _S.truth((_n_k_b3 <= 0.01)) else (_n_k_b3 <= 0.01)))):
		return null
	var _n_m_b6 = _S.named_value(_n_A_b1,"mask")
	var _n_pix_b7 = _S.named_value(_n_A_b1,"pixels")
	var _n_has_b8 = _S.function_value(_S.capture(_parent,{"m":_n_m_b6,"this":_this}),"_f7")
	if true:
		var _n_j_b9 = 0
		while _S.truth((_n_j_b9 < _S.named_value(_n_m_b6,"h"))):
			if true:
				var _n_i_b10 = 0
				while _S.truth((_n_i_b10 < _S.named_value(_n_m_b6,"w"))):
					if _S.truth(not _S.truth(_S.index_value(_S.named_value(_n_m_b6,"data"),((_n_j_b9 * _S.named_value(_n_m_b6,"w")) + _n_i_b10)))):
						_n_i_b10 += 1.0
						continue
					if _S.truth((_n_k_b3 > 0.01)):
						_S.invoke(_n_p_b0,"light",[(_S.named_value(_n_A_b1,"x") + _n_i_b10), (_S.named_value(_n_A_b1,"y") + _n_j_b9), _n_c_b2, (_n_k_b3 * (1.1 - (float((0.5 * _n_j_b9))/_S.named_value(_n_m_b6,"h"))))])
					if _S.truth(_S.logical("||",_S.logical("||",((_n_rim_b4 <= 0.01) if _S.truth((_n_rim_b4 <= 0.01)) else not _S.truth(_S.call_value(_n_has_b8,[(_n_i_b10 - 1), _n_j_b9]))),func():return not _S.truth(_S.call_value(_n_has_b8,[(_n_i_b10 + 1), _n_j_b9]))),func():return not _S.truth(_S.call_value(_n_has_b8,[_n_i_b10, (_n_j_b9 - 1)])))):
						_n_i_b10 += 1.0
						continue
					if _S.truth(_S.logical("&&",_S.logical("&&",_S.call_value(_n_has_b8,[(_n_i_b10 - 2), _n_j_b9]),func():return _S.call_value(_n_has_b8,[(_n_i_b10 + 2), _n_j_b9])),func():return _S.call_value(_n_has_b8,[_n_i_b10, (_n_j_b9 - 2)]))):
						_n_i_b10 += 1.0
						continue
					var _n_f_b11 = (_n_rim_b4 * (0.75 + (0.35 * _S.MathFX.noise(((_n_j_b9 * 0.6) - (_n_t_b5 * 8)),(_n_i_b10 * 3)))))
					if _S.truth((_n_f_b11 > 0.25)):
						_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A_b1,"x") + _n_i_b10), (_S.named_value(_n_A_b1,"y") + _n_j_b9), _S.ColorFX.mix(((_S.index_value(_n_pix_b7,((_n_j_b9 * _S.named_value(_n_m_b6,"w")) + _n_i_b10)) if _S.truth(_S.index_value(_n_pix_b7,((_n_j_b9 * _S.named_value(_n_m_b6,"w")) + _n_i_b10))) else _n_c_b2) if _S.truth(_n_pix_b7) else _n_c_b2),_n_c_b2,minf(0.85,_n_f_b11))])
					_n_i_b10 += 1.0
			_n_j_b9 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_n_m,"data"),((_n_j_b1 * _S.named_value(_n_m,"w")) + _n_i_b0)) if _S.truth(((_n_j_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	if _S.truth((not _S.truth(_n_A_b1) if _S.truth(not _S.truth(_n_A_b1)) else (_n_k_b3 <= 0.02))):
		return null
	_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_A_b1,"mask"), _S.named_value(_n_A_b1,"x"), _S.named_value(_n_A_b1,"y"), _n_c_b2, _S.function_value(_S.capture(_parent,{"k":_n_k_b3,"t":_n_t_b4,"this":_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_t = _S.read(_parent,"t")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	return (_n_k * (0.75 + (0.45 * _S.MathFX.noise(((_n_my_b1 * 0.45) - (_n_t * 7)),(_n_mx_b0 * 3)))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_w_b3 = _S.arg(_args,3)
	var _n_h_b4 = _S.arg(_args,4)
	var _n_col_b5 = _S.arg(_args,5)
	var _object_0 = _S.coalesce(_S.arg(_args,6),func():return {})
	var _n_r_b6 = _S.coalesce(_S.named_value(_object_0,"r"),func():return 3)
	var _n_a_b7 = _S.coalesce(_S.named_value(_object_0,"a"),func():return 1)
	var _n_shine_b8 = _S.coalesce(_S.named_value(_object_0,"shine"),func():return null)
	if _S.truth(((_n_w_b3 < 2) if _S.truth((_n_w_b3 < 2)) else (_n_h_b4 < 2))):
		return null
	var _n_X1_b9 = (_n_x_b1 + _n_w_b3)
	var _n_Y1_b10 = (_n_y_b2 + _n_h_b4)
	_S.invoke(_n_p_b0,"shade",[_n_x_b1, _n_y_b2, _n_X1_b9, _n_Y1_b10, _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"r":_n_r_b6,"X1":_n_X1_b9,"y":_n_y_b2,"Y1":_n_Y1_b10,"a":_n_a_b7,"col":_n_col_b5,"shine":_n_shine_b8,"h":_n_h_b4,"this":_this}),"_f11")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_r = _S.read(_parent,"r")
	var _n_X1 = _S.read(_parent,"X1")
	var _n_y = _S.read(_parent,"y")
	var _n_Y1 = _S.read(_parent,"Y1")
	var _n_a = _S.read(_parent,"a")
	var _n_col = _S.read(_parent,"col")
	var _n_shine = _S.read(_parent,"shine")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_h = _S.read(_parent,"h")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_cx_b3 = maxf(maxf(((_n_x + _n_r) - _n_px_b0),0),(_n_px_b0 - (_n_X1 - _n_r)))
	var _n_cy_b4 = maxf(maxf(((_n_y + _n_r) - _n_py_b1),0),(_n_py_b1 - (_n_Y1 - _n_r)))
	var _n_e_b5 = ((_n_r - _S.Bridge.hypot([_n_cx_b3, _n_cy_b4])) if _S.truth(((_n_cy_b4 > 0) if _S.truth((_n_cx_b3 > 0)) else (_n_cx_b3 > 0))) else minf(minf(minf((_n_px_b0 - _n_x),(_n_X1 - _n_px_b0)),(_n_py_b1 - _n_y)),(_n_Y1 - _n_py_b1)))
	if _S.truth((_n_e_b5 < 0)):
		return null
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	if _S.truth((_n_e_b5 < 1)):
		return _S.named_value(_n_col,"outline")
	if _S.truth(((_n_py_b1 - _n_y) < 2)):
		return _S.named_value(_n_col,"rim")
	if _S.truth(((_n_Y1 - _n_py_b1) < 2)):
		return _S.named_value(_n_col,"low")
	if _S.truth(_S.binary("!==",_n_shine,null)):
		var _n_d_b6 = absf(((_n_px_b0 - ((_n_py_b1 - _n_y) * 0.6)) - _n_shine))
		if _S.truth((_n_d_b6 < 1.3)):
			return _n_WHITE
		if _S.truth((_n_d_b6 < 3)):
			return _S.named_value(_n_col,"rim")
	return (_S.named_value(_n_col,"top") if _S.truth(((_n_py_b1 - _n_y) < (_n_h * 0.45))) else _S.named_value(_n_col,"body"))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_amp_b1 = _S.arg(_args,1)
	var _n_t0_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_len_b3 = _S.coalesce(_S.arg(_args,3),func():return 0.3)
	var _n_seed_b4 = _S.coalesce(_S.arg(_args,4),func():return 1)
	var _n_hz_b5 = _S.coalesce(_S.arg(_args,5),func():return 32)
	if _S.truth(((_n_t_b0 < _n_t0_b2) if _S.truth((_n_t_b0 < _n_t0_b2)) else (_n_t_b0 > (_n_t0_b2 + _n_len_b3)))):
		return [0, 0]
	var _n_k_b6 = (1 - (float((_n_t_b0 - _n_t0_b2))/_n_len_b3))
	return [floori((((_S.MathFX.noise((_n_t_b0 * _n_hz_b5),_n_seed_b4) * _n_amp_b1) * _n_k_b6) * 1.7)+0.5), floori((((_S.MathFX.noise((_n_t_b0 * _n_hz_b5),(_n_seed_b4 + 7)) * _n_amp_b1) * _n_k_b6) * 1.3)+0.5)]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C_b0 = _S.arg(_args,0)
	return {"k":_S.index_value(_n_C_b0,0),"w":_n_WHITE,"h":_S.index_value(_n_C_b0,5),"o":_S.index_value(_n_C_b0,4),"m":_S.index_value(_n_C_b0,3),"d":_S.index_value(_n_C_b0,2)}
	return null
