extends Control
## One active player: selecting a probe does not prewarm the full catalog.
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Layer = preload("res://addons/pixelfx/runtime/layer_2d.gd")
const IDS = ["fire_ring", "blessing", "divine_shield", "halo", "heal", "resurrection", "freeze", "frost_nova"]
const TITLES = ["Fire ring", "Blessing", "Divine shield", "Halo", "Heal", "Resurrection", "Freeze", "Frost nova"]
var player
var stage: Node2D
var back_view
var front_view
var marker: Sprite2D
var selected = 0
var light_background = false
var picker: OptionButton
var pause_button: Button
var replay_button: Button
var stop_button: Button
var flip_button: Button
var speed: HSlider
var light_slider: HSlider
var parameter_controls: VBoxContainer
var stone_button: CheckButton
var status: Label
var title_label: Label
var recording = false
var record_tick = 0
var segment_tick = 0
var record_phase = 0
var occluder_enabled = true
func _ready() -> void:
	texture_filter=TEXTURE_FILTER_NEAREST
	get_window().title="PixelFX · B2 completion gallery"
	var font=SystemFont.new(); font.font_names=PackedStringArray(["PingFang SC","Arial"])
	var skin=Theme.new(); skin.default_font=font; skin.default_font_size=16; theme=skin
	var subtitle=Label.new(); subtitle.text="PIXELFX / B2 · 元素与圣光 · 最后 8 项验收"; subtitle.position=Vector2(32,28); subtitle.add_theme_color_override("font_color",Color("efbb70")); add_child(subtitle)
	title_label=Label.new(); title_label.position=Vector2(32,65); title_label.add_theme_font_size_override("font_size",30); add_child(title_label)
	var canvas=Control.new(); canvas.position=Vector2(32,132); canvas.size=Vector2(752,544); canvas.clip_contents=true; canvas.mouse_filter=MOUSE_FILTER_IGNORE; add_child(canvas)
	stage=Node2D.new(); canvas.add_child(stage)
	player=Player.new(); player.autoplay=false; player.external_layers=true; add_child(player)
	back_view=_view("back")
	marker=Sprite2D.new(); marker.centered=false; marker.position=Vector2(-20,-45)
	var semantics=load("res://addons/pixelfx/native/semantics.gd")
	var actor_frame=load("res://addons/pixelfx/core/frame.gd").new(40,50,-20,-45)
	var painter=semantics.Painter.new(actor_frame)
	var actor=semantics.module("core/actor.js")
	semantics.call_value(actor.drawActor,[painter,semantics.call_value(actor.stockActor,[2]),1])
	marker.texture=ImageTexture.create_from_image(actor_frame.image()); stage.add_child(marker)
	front_view=_view("front")
	var scroll=ScrollContainer.new(); scroll.position=Vector2(810,132); scroll.size=Vector2(278,544); add_child(scroll)
	var controls=VBoxContainer.new(); controls.size_flags_horizontal=Control.SIZE_EXPAND_FILL; controls.add_theme_constant_override("separation",7); scroll.add_child(controls)
	picker=OptionButton.new()
	for text_value in TITLES: picker.add_item(text_value)
	controls.add_child(picker); picker.item_selected.connect(select_effect)
	var label=Label.new(); label.text="播放速度"; controls.add_child(label)
	speed=HSlider.new(); speed.min_value=0.25; speed.max_value=2; speed.step=0.25; speed.value=1; controls.add_child(speed); speed.value_changed.connect(func(v): player.playback_speed=v)
	label=Label.new(); label.text="光照强度"; controls.add_child(label)
	light_slider=HSlider.new(); light_slider.min_value=0; light_slider.max_value=3; light_slider.step=0.1; light_slider.value=1; controls.add_child(light_slider); light_slider.value_changed.connect(func(v): player.set_parameters({"light":v}))
	parameter_controls=VBoxContainer.new(); controls.add_child(parameter_controls)
	pause_button=_button(controls,"暂停 / 继续",func(): player.paused=not player.paused)
	replay_button=_button(controls,"重播",func(): player.restart())
	stop_button=_button(controls,"淡出停止",func(): player.paused=false; player.stop())
	flip_button=_button(controls,"水平翻转",func(): player.flip_h=not player.flip_h)
	_button(controls,"深 / 浅背景",func(): light_background=not light_background; queue_redraw())
	_button(controls,"显示 / 隐藏遮挡物",func(): occluder_enabled=not occluder_enabled; marker.visible=occluder_enabled)
	status=Label.new(); status.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; controls.add_child(status)
	recording="--b2-completion-record" in OS.get_cmdline_user_args()
	if recording: player.update_mode=Player.UpdateMode.MANUAL
	var nav=_button(self,"← 五效果图鉴",func(): get_tree().change_scene_to_file("res://demos/pixelfx/gallery.tscn")); nav.position=Vector2(860,40); nav.size=Vector2(230,34)
	select_effect(0)
func _view(layer_name: String):
	var view=Layer.new(); view.follow_source=false; view.layer=layer_name; view.source_path=player.get_path(); stage.add_child(view); return view
func _button(parent: Node,text_value: String,callback: Callable) -> Button:
	var button=Button.new(); button.text=text_value; button.custom_minimum_size.y=32; parent.add_child(button); button.pressed.connect(callback); return button
func select_effect(index: int) -> void:
	selected=index; picker.select(index); player.effect=load("res://addons/pixelfx/presets/"+IDS[index]+".tres"); player.play(); player.playback_speed=1; player.flip_h=false
	speed.set_value_no_signal(1); light_slider.set_value_no_signal(1); title_label.text=TITLES[index]
	for child in parameter_controls.get_children(): parameter_controls.remove_child(child); child.queue_free()
	for field in player.effect.schema():
		if field.type in [TYPE_FLOAT,TYPE_INT] and field.name not in ["light","seed"]:
			var label=Label.new(); label.text=field.name; parameter_controls.add_child(label)
			var slider=HSlider.new(); slider.min_value=field.min; slider.max_value=field.max; slider.step=1.0 if field.type==TYPE_INT else (0.01 if field.max-field.min<=4 else 0.5); slider.value=field.default; parameter_controls.add_child(slider)
			slider.value_changed.connect(_set_parameter.bind(field.name))
		elif field.type==TYPE_BOOL:
			stone_button=CheckButton.new(); stone_button.text={"source":"源头岩石","ledge":"岩壁"}.get(field.name,field.name); stone_button.button_pressed=field.default; parameter_controls.add_child(stone_button); stone_button.toggled.connect(_set_parameter.bind(field.name))
	marker.position=Vector2(-20,-45)
	marker.visible=occluder_enabled
	_fit(); queue_redraw()
func _set_parameter(value,key: String) -> void:
	for field in player.effect.schema():
		if field.name==key and field.type==TYPE_INT: value=int(value); break
	player.set_parameters({key:value})
func _fit() -> void:
	var rect: Rect2i=player.get_frame_bounds(); var zoom=minf(3.5,minf(704.0/rect.size.x,496.0/rect.size.y))
	var center=Vector2(rect.position)+Vector2(rect.size)*0.5
	if player.flip_h: center.x=-center.x
	stage.scale=Vector2.ONE*zoom; stage.position=Vector2(376,272)-center*zoom
func _process(_dt: float) -> void:
	if player==null or player.instance==null: return
	marker.flip_h=player.flip_h
	_fit()
	status.text=("已结束 · 点击重播" if not player.is_playing() else ("暂停中" if player.paused else "循环播放" if player.instance.meta.loop else "单次播放"))+"\nCPU %.2f ms · %d FPS" % [player.last_render_ms,Engine.get_frames_per_second()]
	if not recording: return
	if segment_tick>0: player.advance(1.0/30)
	record_tick+=1; segment_tick+=1
	var duration: float=player.instance.meta.duration
	var segment_frames=ceili(maxf(3.0,duration+0.6)*30)
	if segment_tick==2:
		print("B2_COMPLETION_VISUAL ",IDS[selected]," background=",record_phase," mirror=",player.flip_h)
		light_background=record_phase==1; marker.visible=true; queue_redraw()
	if segment_tick>=segment_frames:
		segment_tick=0
		if record_phase==0: record_phase=1; player.flip_h=true; player.restart()
		else:
			record_phase=0
			if selected+1>=IDS.size(): get_tree().quit()
			else: select_effect(selected+1)
	# Movie Maker can retain an occluded macOS window's previous framebuffer.
	# Force a real draw after queued canvas updates before the next recorded tick.
	RenderingServer.force_draw.call_deferred(false,1.0/30)
func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO,size),Color("0d1420")); draw_rect(Rect2(32,132,752,544),Color("dec899") if light_background else Color("192737")); draw_rect(Rect2(800,132,296,544),Color("161e2b"))
