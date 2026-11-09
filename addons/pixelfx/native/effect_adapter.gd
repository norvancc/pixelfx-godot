@tool
extends "../core/effect.gd"
## Native GDScript adapter for the remaining catalog. Full acceptance remains pending.
const Semantics=preload("semantics.gd")
var _module: Dictionary={}
var _instance
var _options: Dictionary={}
var _native_painter
func compatible_painter(p):
	if _native_painter==null or _native_painter.frame!=p.frame:_native_painter=Semantics.Painter.new(p.frame)
	for key in ["tx","ty","fx","cs","sn","fade","light_k","layer"]:_native_painter.set(key,p.get(key))
	return _native_painter
func source_module() -> String:return ""
func parameter_schema() -> Array[Dictionary]:
	var result: Array[Dictionary]=[]
	for key in metadata().get("options",{}):
		var value=metadata().options[key]
		if value is Array and not value.is_empty() and value[0] is String and value[0].begins_with("#"):
			var colors=PackedColorArray()
			for color in value:colors.append(Color(color))
			result.append({"name":key,"type":TYPE_PACKED_COLOR_ARRAY,"default":colors})
		elif value is String and value.begins_with("#"):result.append({"name":key,"type":TYPE_COLOR,"default":Color(value)})
		else:result.append({"name":key,"type":typeof(value),"default":value})
	result.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0})
	# Actor and scene inputs are native Dictionaries; the default actor matches upstream metadata.
	if metadata().get("actor"):result.append({"name":"actor","type":TYPE_DICTIONARY,"default":{}})
	return result
func bounds(_o: Dictionary) -> Rect2i:
	var meta=metadata();var size=meta.get("size",[128,128]);var origin=meta.get("origin",[64,64])
	# Keep the entire declared canvas and a simulation margin; later boundary acceptance may refine it.
	var margin=0 if source_module().begins_with("fx/transitions/") else 96
	return Rect2i(-int(origin[0])-margin,-int(origin[1])-margin,mini(1024,int(size[0])+margin*2),mini(1024,int(size[1])+margin*2))
func create(options: Dictionary):
	_module=Semantics.module(source_module())
	if not _module.has("meta") or not (_module.has("draw") or _module.has("create")):
		Semantics.fail("Incomplete effect module "+source_module())
	_options=options.duplicate(true)
	if metadata().get("actor") and not Semantics.truth(_options.get("actor")):
		_options.actor=Semantics.call_value(Semantics.module("core/actor.js").stockActor,[2 if metadata().actor==2 else 1])
	elif metadata().get("actor") and _options.get("actor",{}).is_empty():
		_options.actor=Semantics.call_value(Semantics.module("core/actor.js").stockActor,[2 if metadata().actor==2 else 1])
	_instance=Semantics.call_value(_module.create,[_options]) if _module.has("create") else _module
	Semantics.register_owner(self)
	return self
func update(dt: float,_o: Dictionary) -> void:
	if _instance!=null and Semantics.prop(_instance,"update")!=null:Semantics.invoke(_instance,"update",[dt,_options])
func draw(p,t: float,_o: Dictionary) -> void:
	if _instance==null:create(_o)
	if Semantics.prop(_instance,"draw")!=null:Semantics.invoke(_instance,"draw",[compatible_painter(p),t,_options])
	Semantics.collect_after_draw()
func draw_back(p,t: float,_o: Dictionary) -> void:
	if _instance==null:create(_o)
	if Semantics.prop(_instance,"drawBack")!=null:Semantics.invoke(_instance,"drawBack",[compatible_painter(p),t,_options])
func input_contract() -> Dictionary:
	return {"actor":"{mask:{w,h,data},pixels,x,y,...}; native stockActor/posed helpers available", "act":_module.get("act"),"module":source_module()}
