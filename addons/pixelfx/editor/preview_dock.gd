@tool
extends VBoxContainer
const Player = preload("../pixel_fx_player_2d.gd")
const Preset = preload("../resources/preset.gd")
const Catalog = preload("catalog.gd")
const Cache = preload("../runtime/frame_cache.gd")
var player
var edited: Preset
var choices := OptionButton.new()
var inspector := EditorInspector.new()
var status := Label.new()
var view := SubViewport.new()
var save_dialog := EditorFileDialog.new()
var load_dialog := EditorFileDialog.new()
var _presets: Array = []
var _restart := Timer.new()
var _refresh_pending := false
var _background := ColorRect.new()
var _zoom := 3.0
var _time := HSlider.new()
var _sync_time := false
var _notice := ""
var _notice_until := 0

func _ready() -> void:
	name = "PixelFX"
	custom_minimum_size = Vector2(700, 360)
	var bar := HBoxContainer.new(); add_child(bar)
	choices.size_flags_horizontal = Control.SIZE_EXPAND_FILL; bar.add_child(choices)
	choices.item_selected.connect(func(i): edit_preset(_presets[i]))
	_button(bar, "刷新", refresh_catalog)
	_button(bar, "打开预设", func(): load_dialog.popup_centered_ratio(0.65))
	_button(bar, "另存预设", func(): save_dialog.popup_centered_ratio(0.65))
	_button(bar, "清除缓存", func(): Cache.clear(); _replay())
	var split := HSplitContainer.new(); split.size_flags_vertical = Control.SIZE_EXPAND_FILL; add_child(split)
	var left := VBoxContainer.new(); left.custom_minimum_size.x = 400; left.size_flags_horizontal = Control.SIZE_EXPAND_FILL; split.add_child(left)
	var container := SubViewportContainer.new(); container.stretch = true; container.custom_minimum_size = Vector2(400, 220)
	container.size_flags_vertical = Control.SIZE_EXPAND_FILL; container.size_flags_horizontal = Control.SIZE_EXPAND_FILL; left.add_child(container)
	view.size = Vector2i(540, 260); view.render_target_update_mode = SubViewport.UPDATE_ALWAYS; container.add_child(view)
	_background.color = Color("172333"); _background.size = Vector2(4000, 4000); view.add_child(_background)
	player = Player.new(); player.autoplay = false; player.preview_in_editor = true; view.add_child(player)
	player.validation_failed.connect(func(errors): status.text = "\n".join(errors))
	var controls := HBoxContainer.new(); left.add_child(controls)
	_button(controls, "播放/重播", _replay)
	_button(controls, "暂停/继续", func(): player.paused = not player.paused)
	_button(controls, "淡出", func(): player.paused = false; player.stop())
	_button(controls, "翻转", func(): player.flip_h = not player.flip_h)
	_button(controls, "背景", func(): _background.color = Color("dec899") if _background.color == Color("172333") else Color("172333"))
	var settings := HBoxContainer.new(); left.add_child(settings)
	var speed := SpinBox.new(); speed.min_value = 0.1; speed.max_value = 4; speed.step = 0.1; speed.value = 1; speed.prefix = "速度 "; settings.add_child(speed)
	speed.value_changed.connect(func(v): player.playback_speed = v)
	var zoom := SpinBox.new(); zoom.min_value = 1; zoom.max_value = 8; zoom.value = 3; zoom.prefix = "缩放 "; settings.add_child(zoom)
	zoom.value_changed.connect(func(v): _zoom = v)
	_time.step = 0.001; _time.size_flags_horizontal = Control.SIZE_EXPAND_FILL; settings.add_child(_time)
	_time.value_changed.connect(func(value):
		if not _sync_time: player.paused = true; player.seek(value)
	)
	inspector.custom_minimum_size.x = 320; inspector.size_flags_horizontal = Control.SIZE_EXPAND_FILL; split.add_child(inspector)
	status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; add_child(status)
	_restart.one_shot = true; _restart.wait_time = 0.15; add_child(_restart); _restart.timeout.connect(_replay)
	for dialog in [save_dialog, load_dialog]:
		dialog.access = EditorFileDialog.ACCESS_RESOURCES; dialog.filters = PackedStringArray(["*.tres ; PixelFX Preset"]); add_child(dialog)
	save_dialog.file_mode = EditorFileDialog.FILE_MODE_SAVE_FILE
	save_dialog.file_selected.connect(_save)
	load_dialog.file_mode = EditorFileDialog.FILE_MODE_OPEN_FILE
	load_dialog.file_selected.connect(func(path):
		var resource = load(path)
		if resource is Preset: edit_preset(resource)
		else: status.text = "请选择 PixelFXPreset 资源。"
	)
	refresh_catalog()

func _button(parent: Node, title: String, fn: Callable) -> void:
	var button := Button.new(); button.text = title; parent.add_child(button); button.pressed.connect(fn)

func refresh_catalog() -> void:
	if not is_inside_tree() or is_queued_for_deletion(): return
	_refresh_pending = false
	Cache.clear()
	var roots := PackedStringArray(["res://addons/pixelfx/presets", "res://addons/pixelfx/effects", "res://pixelfx"])
	if ProjectSettings.has_setting("pixelfx/editor/effect_directories"):
		for path in ProjectSettings.get_setting("pixelfx/editor/effect_directories"): roots.append(str(path))
	_presets = Catalog.discover(roots); choices.clear()
	for preset in _presets: choices.add_item(preset.display_name if not preset.display_name.is_empty() else preset.resource_path.get_file())
	if edited == null and not _presets.is_empty(): edit_preset(_presets[0])
	elif edited != null: _restart.start()

func request_refresh() -> void:
	if not is_inside_tree() or is_queued_for_deletion(): return
	if _refresh_pending: return
	_refresh_pending = true; call_deferred("refresh_catalog")

func edit_preset(preset: Preset) -> void:
	if edited and edited.changed.is_connected(_on_changed): edited.changed.disconnect(_on_changed)
	# Preview works on a private copy; opening a preset must not mutate project assets.
	edited = preset.duplicate(true)
	edited.changed.connect(_on_changed)
	inspector.edit(edited)
	_replay()

func _on_changed() -> void:
	if is_inside_tree() and not is_queued_for_deletion(): _restart.start()
func _replay() -> void:
	if not is_inside_tree() or is_queued_for_deletion(): return
	if edited == null: return
	var errors := edited.validate()
	if not errors.is_empty(): status.text = "\n".join(errors); player.cancel(); return
	player.effect = edited.duplicate(true)
	player.play()
	var meta: Dictionary = edited.new_module().metadata()
	_time.editable = meta.get("cacheable", false); _time.max_value = float(meta.duration) - 0.001

func _save(path: String) -> void:
	if edited == null: return
	if not edited.validate().is_empty(): status.text = "参数无效，未保存。"; return
	var copy := edited.duplicate(true)
	var error := ResourceSaver.save(copy, path)
	_notice = "已保存：" + path if error == OK else "保存失败：" + error_string(error)
	_notice_until = Time.get_ticks_msec() + 5000
	status.text = _notice
	if error == OK: EditorInterface.get_resource_filesystem().scan()

func _process(_delta: float) -> void:
	if player == null: return
	player.position = Vector2(view.size) * Vector2(0.6, 0.5); player.scale = Vector2.ONE * _zoom
	if player.instance:
		_sync_time = true; _time.value = fposmod(player.instance.t, player.instance.meta.duration); _sync_time = false
		var stats := Cache.statistics()
		status.text = "%s | %.2f ms / frame | cache %d frames, %.1f MB | %s" % [player.instance.meta.name, player.last_render_ms, stats.entries, stats.bytes / 1048576.0, "暂停" if player.paused else "实时预览"]
	if Time.get_ticks_msec() < _notice_until: status.text = _notice
func _exit_tree() -> void:
	_restart.stop()
	if edited and edited.changed.is_connected(_on_changed): edited.changed.disconnect(_on_changed)
	if is_instance_valid(player): player.cancel()
