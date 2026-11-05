@tool
extends RefCounted
## Live effect contract: metadata/options, update, draw, stop, done, restart.
const Painter = preload("painter.gd")
const C = preload("color.gd")
var meta: Dictionary
var options: Dictionary
var implementation: RefCounted
var t := 0.0
var stop_at := INF
# Painter is retained, but owns no copies of the frame buffers.
var _painter: Painter

func _init(module: RefCounted, overrides: Dictionary = {}) -> void:
	meta = module.metadata().duplicate(true)
	options = resolve_options(meta,overrides)
	implementation = module.create(options) if module.has_method("create") else module

static func is_ramp(value) -> bool:
	if not value is Array or value.is_empty(): return false
	for item in value:
		if item is int or item is float: continue
		if not item is String or not item.begins_with("#") or not item.trim_prefix("#").is_valid_hex_number(): return false
	return true
static func resolve_options(metadata: Dictionary, overrides: Dictionary) -> Dictionary:
	var defaults: Dictionary=metadata.get("options",{})
	var result := defaults.duplicate(true); result.merge(overrides,true)
	for key in defaults:
		if is_ramp(defaults[key]) and is_ramp(overrides.get(key)) and defaults[key].size() != overrides[key].size(): result[key]=C.fit(overrides[key],defaults[key].size())
	return result
func update(dt: float) -> void:
	assert(is_finite(dt) and dt >= 0)
	t += dt
	if not implementation.has_method("update"): return
	var n := maxi(1,ceili(dt*120-1e-9))
	for i in range(n): implementation.update(dt/n,options)
func draw(frame, requested_layer: String="") -> void:
	if _painter == null or _painter.frame != frame: _painter=Painter.new(frame)
	var p := _painter; p.reset()
	p.place(options.get("x",0),options.get("y",0),options.get("flip",false),options.get("angle",0))
	p.fade=1.0 if stop_at == INF else clampf(1-(t-stop_at)/0.3,0,1)
	p.light_k=options.get("light",1.0)
	var duration: float=meta.get("duration",1.0)
	var tt := fposmod(t,duration) if meta.get("loop",false) else minf(t,duration)
	if requested_layer != "front" and implementation.has_method("draw_back"):
		p.layer="back"; implementation.draw_back(p,tt,options)
	if requested_layer != "back":
		p.layer="front"; implementation.draw(p,tt,options)
func stop() -> void:
	if stop_at == INF: stop_at=t
func done() -> bool: return t-stop_at >= 0.3 or (not meta.get("loop",false) and t >= meta.get("duration",1.0))
