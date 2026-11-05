extends Control
## Standalone demo; all flame/smoke pixels are computed by the Godot addon live.
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Layer = preload("res://addons/pixelfx/runtime/layer_2d.gd")
const C = preload("res://addons/pixelfx/core/color.gd")
const PALETTES = [
	["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],
	["#0a1730","#123968","#195b96","#288ac1","#4bb8dc","#80dfef","#b5f4ff","#e6fcff","#ffffff"],
	["#200b32","#40134c","#622276","#9233ae","#b754d6","#d889ed","#eeb5ff","#f9e3ff","#ffffff"]
]
var player: Player
var main_view
var flight_view
var font: SystemFont
var phase := 0.0
var background_index := 0
var direction := false
var angle := 0.0
var recording := false
var recorded_frames := 0
var info: Label
var status: Label
var controls: VBoxContainer
var speed_slider: HSlider
var radius_slider: HSlider
var glow_slider: HSlider
var rotation_slider: HSlider
var palette_select: OptionButton
var pause_button: Button
var flip_button: Button
var replay_button: Button
var stop_button: Button
var background_button: Button

func _ready() -> void:
	texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST
	get_window().title="PixelFX · Godot 实时火球"
	get_window().content_scale_size=Vector2i(1120,740)
	get_window().size=Vector2i(1120,740)
	get_window().min_size=Vector2i(960,640)
	font=SystemFont.new(); font.font_names=PackedStringArray(["PingFang SC","Heiti SC","Arial"])
	var ui_theme := Theme.new(); ui_theme.default_font=font; ui_theme.default_font_size=15; theme=ui_theme
	player=Player.new(); player.name="Effect"; player.external_layers=true
	player.effect=preload("res://addons/pixelfx/presets/fireball.tres"); add_child(player)
	main_view=_make_view(Rect2(32,148,752,370),Vector2(378,192),4)
	flight_view=_make_view(Rect2(32,538,752,170),Vector2(200,85),1.7)
	player.finished.connect(func(): status.text="已结束 · 点击重新播放")
	controls=VBoxContainer.new(); controls.position=Vector2(823,158); controls.size=Vector2(252,520); controls.add_theme_constant_override("separation",12); add_child(controls)
	_label("实时参数",20)
	palette_select=OptionButton.new()
	for name_text in ["原版火焰","冰蓝配色","奥术配色"]: palette_select.add_item(name_text)
	controls.add_child(palette_select)
	palette_select.item_selected.connect(func(i): player.set_parameters({"palette":PALETTES[i]}))
	speed_slider=_slider("播放速度",0.25,2,0.05,1,func(v): player.playback_speed=v)
	radius_slider=_slider("火球半径",3,9,0.25,5,func(v): player.set_parameters({"radius":v}))
	glow_slider=_slider("发光强度",0,2,0.05,1,func(v): player.set_parameters({"light":v}))
	rotation_slider=_slider("旋转角度",-180,180,5,0,func(v): angle=deg_to_rad(v); player.rotation=angle)
	var row := HBoxContainer.new(); controls.add_child(row)
	pause_button=_button("暂停",row,func(): player.paused=not player.paused; pause_button.text="继续" if player.paused else "暂停")
	flip_button=_button("左右翻转",row,func(): direction=not direction; player.flip_h=direction)
	var row2 := HBoxContainer.new(); controls.add_child(row2)
	replay_button=_button("重新播放",row2,func(): player.restart(); pause_button.text="暂停"; status.text="循环播放中")
	stop_button=_button("淡出停止",row2,func(): player.paused=false; pause_button.text="暂停"; player.stop(); status.text="淡出中…")
	background_button=_button("切换深浅背景",controls,func(): background_index=1-background_index)
	status=_label("循环播放中",14)
	info=_label("",12)
	_label("空格 暂停 / R 重播 / F 翻转",12)
	recording="--pixelfx-record" in OS.get_cmdline_user_args()
	queue_redraw()
func _label(text_value: String,font_size: int) -> Label:
	var label := Label.new(); label.text=text_value; label.add_theme_font_size_override("font_size",font_size); label.add_theme_color_override("font_color",Color("aebbc9")); controls.add_child(label); return label
func _button(text_value: String,parent: Node,fn: Callable) -> Button:
	var button := Button.new(); button.text=text_value; button.custom_minimum_size=Vector2(118,36); button.size_flags_horizontal=Control.SIZE_EXPAND_FILL; parent.add_child(button); button.pressed.connect(fn); return button
func _slider(title: String,minimum: float,maximum: float,step_value: float,value: float,fn: Callable) -> HSlider:
	var label := _label(title+"  "+str(value),14)
	var slider := HSlider.new(); slider.min_value=minimum; slider.max_value=maximum; slider.step=step_value; slider.value=value; controls.add_child(slider)
	slider.value_changed.connect(func(v): label.text=title+"  "+str(snappedf(v,0.01)); fn.call(v))
	return slider
func _unhandled_key_input(event: InputEvent) -> void:
	if not event.is_pressed() or event.is_echo(): return
	if event.is_action_pressed("ui_accept"): pause_button.pressed.emit()
	if event is InputEventKey:
		if event.keycode == KEY_R: replay_button.pressed.emit()
		if event.keycode == KEY_F: flip_button.pressed.emit()
func _process(delta: float) -> void:
	if not player.paused: phase += delta*player.playback_speed
	if is_instance_valid(main_view):
		main_view.rotation=angle; flight_view.rotation=angle
		var travel := fposmod(phase*0.24,1)
		flight_view.position.x=lerpf(178,658,1-travel if direction else travel)
	info.text="CPU 绘制 + 纹理更新  %.1f ms\n显示 %d FPS · 特效 %d FPS" % [player.last_render_ms,Engine.get_frames_per_second(),player.get_render_fps()]
	if recording:
		recorded_frames += 1
		# 12 seconds at normal 30 FPS. Exercise actual UI signals and options.
		if recorded_frames == 90: flip_button.pressed.emit()
		if recorded_frames == 135: palette_select.select(1); palette_select.item_selected.emit(1)
		if recorded_frames == 180: radius_slider.value=8; speed_slider.value=1.25
		if recorded_frames == 225: background_button.pressed.emit(); rotation_slider.value=-25
		if recorded_frames == 270: stop_button.pressed.emit()
		if recorded_frames == 300:
			palette_select.select(0); palette_select.item_selected.emit(0); radius_slider.value=5; speed_slider.value=1; rotation_slider.value=0
			direction=false; player.flip_h=false; background_index=0; replay_button.pressed.emit()
		if recorded_frames == 45: _capture.call_deferred()
		if recorded_frames >= 360: get_tree().quit()
	queue_redraw()
func _capture() -> void:
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("res://builds/pixelfx/godot-demo.png")
func _draw() -> void:
	if not font: return
	draw_rect(Rect2(Vector2.ZERO,size),Color("0d121c"))
	draw_rect(Rect2(32,32,4,59),Color("f4ae53"))
	_text("PIXELFX  /  GODOT",Vector2(52,53),15,Color("f4ae53"))
	_text("实时像素火球",Vector2(50,91),32,Color("edf2f7"))
	_text("原算法移植  ·  火舌 / 烟尘 / 余烬 / 动态光晕",Vector2(52,120),15,Color("8f9daf"))
	draw_rect(Rect2(32,148,752,370),Color("192737") if background_index==0 else Color("dec899"))
	var grid_color := Color(0.8,0.9,1,0.035) if background_index==0 else Color(0.2,0.18,0.1,0.045)
	for x in range(32,784,24): draw_line(Vector2(x,148),Vector2(x,518),grid_color)
	for y in range(148,518,24): draw_line(Vector2(32,y),Vector2(784,y),grid_color)
	_text("放大观察  /  4×",Vector2(52,177),14,Color("8093a9") if background_index==0 else Color("685d47"))
	draw_rect(Rect2(804,148,284,560),Color("161e2b"))
	draw_rect(Rect2(32,538,752,170),Color("141e2a"))
	_text("飞行演示  /  场景中的移动效果",Vector2(52,566),14,Color("8f9daf"))
	draw_line(Vector2(70,650),Vector2(746,650),Color("354354"),1)
	_text("程序实时生成  ·  非序列帧播放",Vector2(52,695),12,Color("728399"))
func _make_view(rect: Rect2,at: Vector2,zoom: float):
	var canvas := Control.new(); canvas.position=rect.position; canvas.size=rect.size
	canvas.clip_contents=true; canvas.mouse_filter=Control.MOUSE_FILTER_IGNORE; add_child(canvas)
	var layer=Layer.new(); layer.follow_source=false; layer.source_path=player.get_path()
	layer.position=at; layer.scale=Vector2.ONE*zoom; canvas.add_child(layer)
	return layer
func _text(value: String,at: Vector2,font_size: int,color: Color) -> void:
	draw_string(font,at,value,HORIZONTAL_ALIGNMENT_LEFT,-1,font_size,color)
