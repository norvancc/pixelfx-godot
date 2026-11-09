extends Control
## Lazy, one-effect-at-a-time browser. Full acceptance remains separate from basic playback.
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Act=preload("res://addons/pixelfx/native/act.gd")
var rows: Array=[]
var filtered: Array=[]
var list: ItemList
var search: LineEdit
var description: Label
var act_toggle: CheckButton
var instance
var performance_label: Label
var actor_instance
var selected: Dictionary={}
var frame
var texture: ImageTexture
var paused=false
var light_background=false
var step_accumulator=0.0
func _ready():
	texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST
	get_window().title="PixelFX · 完整迁移目录"
	var font=SystemFont.new();font.font_names=PackedStringArray(["PingFang SC","Arial"])
	var skin=Theme.new();skin.default_font=font;skin.default_font_size=16;theme=skin
	rows=JSON.parse_string(FileAccess.get_file_as_string("res://docs/migration-status.json")).entries
	var heading=Label.new();heading.text="PixelFX · 244 项目录";heading.position=Vector2(24,18);heading.add_theme_font_size_override("font_size",28);add_child(heading)
	search=LineEdit.new();search.placeholder_text="搜索类别或效果名称";search.position=Vector2(24,70);search.size=Vector2(300,36);add_child(search);search.text_changed.connect(func(_s):filter_rows())
	list=ItemList.new();list.position=Vector2(24,114);list.size=Vector2(300,582);add_child(list);list.item_selected.connect(select_effect)
	description=Label.new();description.position=Vector2(348,70);description.size=Vector2(740,70);description.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART;add_child(description)
	var buttons=HBoxContainer.new();buttons.position=Vector2(350,650);add_child(buttons)
	button(buttons,"重播",func():play_selected())
	button(buttons,"暂停 / 继续",func():paused=not paused)
	button(buttons,"深 / 浅背景",func():light_background=not light_background;queue_redraw())
	act_toggle=CheckButton.new();act_toggle.text="角色演出";buttons.add_child(act_toggle);act_toggle.toggled.connect(func(_v):play_selected())
	performance_label=Label.new();performance_label.position=Vector2(350,700);add_child(performance_label)
	filter_rows()
	if "--catalog-smoke" in OS.get_cmdline_user_args():
		search.text="holy/halo";filter_rows();select_effect(0);paused=true;get_tree().quit.call_deferred()
func button(parent,title,callback):
	var node=Button.new();node.text=title;parent.add_child(node);node.pressed.connect(callback)
func filter_rows():
	list.clear();filtered.clear()
	for row in rows:
		if not search.text.is_empty() and not row.effect.contains(search.text):continue
		filtered.append(row);list.add_item(row.effect)
		list.set_item_tooltip(list.item_count-1,"完整验收通过" if row.status=="完成" else "已迁移，待完整验收")
func select_effect(index):selected=filtered[index];play_selected()
func play_selected():
	if selected.is_empty():return
	instance=null;actor_instance=null;Act.Semantics.collect();paused=false;step_accumulator=0
	var script=load("res://"+selected.godot_path);var module=script.new();var meta=module.metadata()
	var preset=load("res://addons/pixelfx/presets/"+selected.effect.get_file().replace("-","_")+".tres")
	var resolved=preset.resolve()
	if not resolved.ok:description.text=str(resolved.errors);return
	var rect=resolved.bounds
	if act_toggle.button_pressed:
		rect=Rect2i(-220,-240,660,440);actor_instance=Act.new(selected.effect,resolved.options)
	else:instance=Fx.new(module,resolved.options)
	frame=Frame.new(rect.size.x,rect.size.y,rect.position.x,rect.position.y)
	description.text=meta.name+" · "+selected.effect+"\n"+("完整验收通过" if selected.status=="完成" else "已迁移，待完整验收")
	render_frame()
func render_frame():
	if frame==null:return
	var start=Time.get_ticks_usec();frame.clear()
	if actor_instance!=null:actor_instance.draw(frame)
	elif instance!=null:instance.draw(frame)
	var image=frame.image()
	if texture==null or texture.get_width()!=frame.w or texture.get_height()!=frame.h:texture=ImageTexture.create_from_image(image)
	else:texture.update(image)
	performance_label.text="当前帧 %.1f ms"%((Time.get_ticks_usec()-start)/1000.0);queue_redraw()
func _process(dt):
	if paused or instance==null and actor_instance==null:return
	step_accumulator+=dt
	if step_accumulator<1.0/30:return
	# A slow CPU frame slows the demo; it never queues an unbounded catch-up workload.
	step_accumulator=0
	if actor_instance!=null:
		if actor_instance.done():return
		actor_instance.update(1.0/30)
	else:
		if instance.done():return
		instance.update(1.0/30)
	render_frame()
func _draw():
	draw_rect(Rect2(Vector2.ZERO,size),Color("111923"))
	var panel=Rect2(348,156,740,480);draw_rect(panel,Color("e6e0d4") if light_background else Color("1d2b39"))
	if texture!=null:
		var scale_value=minf(panel.size.x/texture.get_width(),panel.size.y/texture.get_height())
		var target=Vector2(texture.get_size())*scale_value
		draw_texture_rect(texture,Rect2(panel.position+(panel.size-target)/2,target),false)
func _exit_tree():
	instance=null;actor_instance=null
	Act.Semantics.shutdown()
