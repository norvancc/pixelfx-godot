extends Control
## Five independent native effects; thumbnails share the exact live player textures.
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Layer = preload("res://addons/pixelfx/runtime/layer_2d.gd")
const Cache = preload("res://addons/pixelfx/runtime/frame_cache.gd")
const IDS = ["fireball","ice_lance","laser_bolt","sunburst","ripples"]
const TITLES = ["Fireball · 火球","Ice lance · 冰枪","Laser bolt · 激光弹","Sunburst · 日芒","Ripples · 水面涟漪"]
const DESCRIPTIONS = ["翻卷火舌 / 烟尘 / 余烬", "冰晶棱面 / 冷雾 / 脱落碎晶", "炽白内核 / 激光脉冲 / 螺旋火花", "长短光芒 / 旋转呼吸 / 星点", "水面明暗 / 扩散波峰 / 前后分层"]
var players: Array = []
var selected := 0
var controls: VBoxContainer
var main_canvas: Control
var main_root: Node2D
var back_view
var front_view
var marker: Polygon2D
var font: SystemFont
var parameter_slider: HSlider
var parameter_name := ""
var palette_select: OptionButton
var pause_button: Button
var replay_button: Button
var stop_button: Button
var flip_button: Button
var speed_slider: HSlider
var glow_slider: HSlider
var rotation_slider: HSlider
var status: Label
var info: Label
var background_light := false
var record_tick := 0
var recording := false
var thumbs: Array = []
var prior_cache: Vector2i
func _ready() -> void:
	texture_filter=TEXTURE_FILTER_NEAREST
	get_window().title="PixelFX for Godot · Five effects"
	font=SystemFont.new(); font.font_names=PackedStringArray(["PingFang SC","Arial"])
	var th := Theme.new(); th.default_font=font; th.default_font_size=14; theme=th
	# This demo runs all five at once. Keep its budget local; restore it on exit.
	prior_cache=Vector2i(Cache.max_bytes,Cache.max_entries); Cache.configure(64,384)
	for i in range(IDS.size()):
		var player=Player.new(); player.name=IDS[i]; player.external_layers=true
		player.effect=load("res://addons/pixelfx/presets/"+IDS[i]+".tres"); add_child(player); players.append(player)
		var box := Control.new(); box.position=Vector2(32+i*215,550); box.size=Vector2(200,120); box.clip_contents=true; box.mouse_filter=Control.MOUSE_FILTER_IGNORE; add_child(box)
		var holder := Node2D.new(); box.add_child(holder)
		add_view(holder,player,"back"); add_view(holder,player,"front")
		var bounds:Rect2i=player.get_frame_bounds(); var zoom := minf(1.3,minf(186.0/bounds.size.x,108.0/bounds.size.y))
		holder.scale=Vector2.ONE*zoom; holder.position=Vector2(100,60)-Vector2(bounds.position+bounds.size/2)*zoom; thumbs.append(holder)
		var button := Button.new(); button.text=TITLES[i]; button.position=Vector2(32+i*215,678); button.size=Vector2(200,36); add_child(button)
		button.pressed.connect(select_effect.bind(i))
	main_canvas=Control.new(); main_canvas.position=Vector2(32,140); main_canvas.size=Vector2(752,370); main_canvas.clip_contents=true; main_canvas.mouse_filter=Control.MOUSE_FILTER_IGNORE; add_child(main_canvas)
	main_root=Node2D.new(); main_canvas.add_child(main_root)
	back_view=add_view(main_root,players[0],"back")
	marker=Polygon2D.new(); marker.polygon=PackedVector2Array([Vector2(-6,0),Vector2(-7,-20),Vector2(-4,-25),Vector2(4,-25),Vector2(7,-20),Vector2(6,0)]); marker.color=Color("d9aa7e"); main_root.add_child(marker)
	front_view=add_view(main_root,players[0],"front")
	controls=VBoxContainer.new(); controls.position=Vector2(816,151); controls.size=Vector2(275,365); controls.add_theme_constant_override("separation",5); add_child(controls)
	var nav := Button.new(); nav.text="B1 · 六种新特效 →"; nav.position=Vector2(860,40); nav.size=Vector2(230,34); add_child(nav)
	nav.pressed.connect(func(): get_tree().change_scene_to_file("res://demos/pixelfx/b1_gallery.tscn"))
	select_effect(0)
	recording="--gallery-record" in OS.get_cmdline_user_args()
	queue_redraw()
func add_view(parent:Node,player,layer_name:String):
	var view=Layer.new(); view.follow_source=false; view.layer=layer_name; view.source_path=player.get_path(); parent.add_child(view); return view
func label(text_value:String) -> Label:
	var node := Label.new(); node.text=text_value; controls.add_child(node); return node
func slider(title:String,lo:float,hi:float,step_value:float,value:float,fn:Callable) -> HSlider:
	var text_label := label(title+"  "+str(value)); var node := HSlider.new(); node.min_value=lo; node.max_value=hi; node.step=step_value; node.value=value; controls.add_child(node)
	node.value_changed.connect(func(v): text_label.text=title+"  "+str(snappedf(v,.01)); fn.call(v)); return node
func button(parent:Node,title:String,fn:Callable) -> Button:
	var b := Button.new(); b.text=title; b.size_flags_horizontal=Control.SIZE_EXPAND_FILL; b.custom_minimum_size.y=30; parent.add_child(b); b.pressed.connect(fn); return b
func select_effect(index:int) -> void:
	selected=index
	for node in controls.get_children(): controls.remove_child(node); node.queue_free()
	var player=players[index]; player.play(); player.playback_speed=1; player.flip_h=false; main_root.rotation=0
	back_view.source_path=player.get_path(); front_view.source_path=player.get_path(); marker.visible=index==4
	label(TITLES[index])
	parameter_name=""
	for field in player.effect.schema():
		if field.name in ["radius","length","rays"]:
			parameter_name=field.name
			parameter_slider=slider(field.name,field.min,field.max,1,field.default,func(v): player.set_parameters({parameter_name:int(v) if parameter_name=="rays" else v}))
	palette_select=OptionButton.new(); palette_select.add_item("原版配色"); palette_select.add_item("冷紫配色"); controls.add_child(palette_select)
	palette_select.item_selected.connect(func(i): player.set_parameters({"palette":player.effect.get_parameter("palette") if i==0 else ["#170d30","#5754aa","#a4c9f2","#ffffff"]}))
	speed_slider=slider("播放速度",0.25,2,.25,1,func(v): player.playback_speed=v)
	glow_slider=slider("光晕",0,3,.1,1,func(v): player.set_parameters({"light":v}))
	rotation_slider=slider("旋转",-180,180,15,0,func(v): main_root.rotation=deg_to_rad(v))
	var row := HBoxContainer.new(); controls.add_child(row)
	pause_button=button(row,"暂停",func(): player.paused=not player.paused; pause_button.text="继续" if player.paused else "暂停")
	flip_button=button(row,"翻转",func(): player.flip_h=not player.flip_h)
	replay_button=button(row,"重播",func(): player.restart(); pause_button.text="暂停")
	stop_button=button(row,"淡出",func(): player.paused=false; player.stop())
	var row2 := HBoxContainer.new(); controls.add_child(row2)
	button(row2,"深 / 浅背景",func(): background_light=not background_light)
	if index==4: button(row2,"遮挡参照物",func(): marker.visible=not marker.visible)
	status=label(""); info=label(""); queue_redraw()
func _process(_delta:float) -> void:
	if players.is_empty(): return
	for i in range(players.size()):
		var rect:Rect2i=players[i].get_frame_bounds()
		var center:Vector2=Vector2(rect.position)+Vector2(rect.size)*.5
		if players[i].flip_h: center.x=-center.x
		var factor := minf(1.3,minf(186.0/rect.size.x,108.0/rect.size.y))
		thumbs[i].scale=Vector2.ONE*factor
		thumbs[i].position=Vector2(100,60)-center*factor
	var player=players[selected]; var bounds:Rect2i=player.get_frame_bounds()
	var zoom := minf(3.5,minf(706.0/bounds.size.x,322.0/bounds.size.y))
	main_root.scale=Vector2.ONE*zoom
	var center := Vector2(bounds.position)+Vector2(bounds.size)*.5
	if player.flip_h: center.x=-center.x
	main_root.position=Vector2(376,196)-(center*zoom).rotated(main_root.rotation)
	status.text="已停止 · 点击重播" if not player.is_playing() else ("已暂停" if player.paused else "循环播放中")
	info.text="CPU %.2f ms / 帧 · %d FPS\nSpace 暂停 · R 重播 · F 翻转" % [player.last_render_ms,Engine.get_frames_per_second()]
	if recording:
		record_tick += 1
		if record_tick % 150 == 1: select_effect(mini(4,record_tick/150))
		if record_tick % 150 == 90: flip_button.pressed.emit()
		if record_tick % 150 == 115: background_light=not background_light
		if record_tick in [45,195,345,495,645]: capture.call_deferred()
		if record_tick >= 750: get_tree().quit()
	queue_redraw()
func capture() -> void:
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("res://builds/pixelfx/gallery-"+IDS[selected]+".png")
func _unhandled_key_input(event:InputEvent) -> void:
	if not event.is_pressed() or event.is_echo(): return
	if event is InputEventKey:
		if event.keycode==KEY_SPACE: pause_button.pressed.emit()
		if event.keycode==KEY_R: replay_button.pressed.emit()
		if event.keycode==KEY_F: flip_button.pressed.emit()
func _draw() -> void:
	if not font: return
	draw_rect(Rect2(Vector2.ZERO,size),Color("0d1420"))
	draw_string(font,Vector2(32,43),"PIXELFX  /  GODOT  /  05 EFFECTS",HORIZONTAL_ALIGNMENT_LEFT,-1,15,Color("efbb70"))
	draw_string(font,Vector2(32,83),TITLES[selected],HORIZONTAL_ALIGNMENT_LEFT,-1,30,Color("eff5fc"))
	draw_string(font,Vector2(32,116),DESCRIPTIONS[selected],HORIZONTAL_ALIGNMENT_LEFT,-1,16,Color("97aec5"))
	draw_rect(Rect2(32,140,752,370),Color("dec899") if background_light else Color("192737"))
	draw_rect(Rect2(800,140,296,398),Color("161e2b"))
	for i in range(5):
		draw_rect(Rect2(32+i*215,550,200,120),Color("243249") if i==selected else Color("151f2d"))
		if i==selected: draw_rect(Rect2(32+i*215,550,200,120),Color("c59d64"),false,2)
	draw_string(font,Vector2(32,536),"选择特效 · 下方五种均为实时生成",HORIZONTAL_ALIGNMENT_LEFT,-1,14,Color("97aec5"))
func _exit_tree() -> void:
	Cache.configure(prior_cache.x/(1024*1024),prior_cache.y)
