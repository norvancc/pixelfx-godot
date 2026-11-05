@tool
class_name PixelFXPreset
extends Resource
## Serializable effect preset. Inspector fields are generated from the effect's schema.
const Effect = preload("../core/effect.gd")
const Colors = preload("../core/color.gd")

@export var display_name := ""
@export var implementation: Script:
	set(value):
		if implementation == value: return
		implementation = value
		parameter_values = {}
		notify_property_list_changed()
		emit_changed()
@export_storage var parameter_values: Dictionary = {}
@export_storage var format_version: int = 1

func new_module():
	if implementation == null or not implementation.can_instantiate(): return null
	var base: Script = implementation
	while base != null and base != Effect: base = base.get_base_script()
	if base == null: return null
	return implementation.new()

func schema() -> Array:
	var module = new_module()
	return module.parameter_schema() if module else []

func _get_property_list() -> Array[Dictionary]:
	var properties: Array[Dictionary] = []
	for field in schema():
		properties.append({"name": "parameters/" + str(field.name), "type": field.type,
			"hint": field.get("hint", PROPERTY_HINT_NONE), "hint_string": field.get("hint_string", ""),
			"usage": PROPERTY_USAGE_EDITOR})
	return properties

func _get(property: StringName):
	var key := str(property).trim_prefix("parameters/")
	if not str(property).begins_with("parameters/"): return null
	for field in schema():
		if field.name == key:
			var value = parameter_values.get(key, field.get("default"))
			if field.type == TYPE_PACKED_COLOR_ARRAY and value is Array:
				var colors := PackedColorArray()
				for item in value:
					if item is Color: colors.append(item); continue
					var packed := Colors.hex(item)
					colors.append(Color8(packed & 255, (packed >> 8) & 255, (packed >> 16) & 255))
				return colors
			return value
	return null

func _set(property: StringName, value) -> bool:
	if not str(property).begins_with("parameters/"): return false
	return set_parameter(str(property).trim_prefix("parameters/"), value)

func _property_can_revert(property: StringName) -> bool:
	return str(property).begins_with("parameters/")

func _property_get_revert(property: StringName):
	var key := str(property).trim_prefix("parameters/")
	for field in schema():
		if field.name == key: return field.get("default")
	return null

func set_parameter(key: StringName, value) -> bool:
	var trial := parameter_values.duplicate(true)
	trial[str(key)] = value
	if not resolve(trial, false).ok: return false
	parameter_values = trial
	emit_changed()
	return true

func get_parameter(key: StringName):
	return _get("parameters/" + str(key))

func resolve(overrides: Dictionary = {}, include_saved: bool = true) -> Dictionary:
	var errors := PackedStringArray()
	if format_version != 1: errors.append("Unsupported preset format version.")
	var module = new_module()
	if module == null: return {"ok": false, "errors": PackedStringArray(["Implementation must extend PixelFXEffect."])}
	var meta: Dictionary = module.metadata().duplicate(true)
	if meta.get("api_version", 1) != 1: errors.append("Unsupported effect API version.")
	if not is_finite(float(meta.get("duration", 0))) or float(meta.get("duration", 0)) <= 0:
		errors.append("duration must be finite and positive.")
	if int(meta.get("fps", 30)) < 1 or int(meta.get("fps", 30)) > 120: errors.append("fps must be in 1..120.")
	if not meta.get("options", {}) is Dictionary: errors.append("metadata.options must be a Dictionary.")
	if str(meta.get("id", "")).is_empty(): errors.append("metadata.id is required.")
	var layers = meta.get("layers", ["front"])
	if not layers is Array or layers.is_empty(): errors.append("layers must contain front and/or back.")
	else:
		for layer in layers:
			if layer not in ["front", "back"]: errors.append("Unknown layer: " + str(layer))
	var values := parameter_values.duplicate(true) if include_saved else {}
	values.merge(overrides, true)
	var resolved: Dictionary = {}
	var names := {}
	for field in module.parameter_schema():
		var key: String = field.get("name", "")
		if key.is_empty() or names.has(key): errors.append("Empty or duplicate parameter: " + key); continue
		names[key] = true
		var value = values.get(key, field.get("default"))
		var kind: int = field.get("type", TYPE_NIL)
		var valid := typeof(value) == kind
		if kind == TYPE_FLOAT and typeof(value) == TYPE_INT: value = float(value); valid = true
		# JSON/code callers may provide a regular Array of hex colors; Inspector uses PackedColorArray.
		if kind == TYPE_PACKED_COLOR_ARRAY:
			valid = value is Array or value is PackedColorArray
			if valid:
				var colors: Array = []
				if value.size() < 1 or value.size() > 64: valid = false
				for color in value:
					if color is Color:
						if not is_finite(color.r) or not is_finite(color.g) or not is_finite(color.b) or not is_equal_approx(color.a, 1): valid = false
						colors.append(Colors.hex(color.to_html(false)))
					elif color is String and Color.html_is_valid(color) and color.trim_prefix("#").length() in [3, 6]: colors.append(Colors.hex(color))
					elif color is int: colors.append(color & 0xffffffff)
					else: valid = false
				value = colors
		if kind in [TYPE_FLOAT, TYPE_INT] and valid:
			if not is_finite(float(value)): valid = false
			if field.has("min") and value < field.min: valid = false
			if field.has("max") and value > field.max: valid = false
		if not valid: errors.append("Invalid value for parameter '%s'." % key)
		else: resolved[key] = value
	for key in values:
		if not names.has(key): errors.append("Unknown parameter '%s'." % key)
	# Do not call effect bounds with invalid input.
	var rect := Rect2i()
	if errors.is_empty():
		rect = module.bounds(resolved)
		if rect.size.x <= 0 or rect.size.y <= 0 or rect.size.x > 1024 or rect.size.y > 1024:
			errors.append("Effect bounds must be positive and no larger than 1024 x 1024.")
	return {"ok": errors.is_empty(), "errors": errors, "options": resolved, "meta": meta, "bounds": rect}

func validate() -> PackedStringArray:
	return resolve().errors

func signature(options: Dictionary, rect: Rect2i) -> String:
	var ordered: Array = [implementation.resource_path, implementation.source_code.sha256_text(), rect]
	var keys := options.keys(); keys.sort()
	for key in keys: ordered.append([key, options[key]])
	return var_to_bytes(ordered).hex_encode().sha256_text()
