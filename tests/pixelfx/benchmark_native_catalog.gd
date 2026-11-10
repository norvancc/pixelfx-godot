extends SceneTree
## Three uncached lifecycle render samples per pending effect; prioritization, not a full FPS gate.
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Renderer=preload("res://addons/pixelfx/runtime/renderer.gd")
func _initialize():call_deferred("run")
func run():
 var catalog=JSON.parse_string(FileAccess.get_file_as_string("res://addons/pixelfx/native/catalog.json"));var rows=[]
 var selected=OS.get_environment("PIXELFX_EFFECT").split(",",false)
 var output="res://builds/pixelfx/acceptance/performance-native-catalog"+("-selected" if not selected.is_empty() else "")+".json"
 for entry in catalog:
  if not selected.is_empty() and entry.source not in selected:continue
  var preset=load("res://addons/pixelfx/presets/"+entry.id+".tres");var data=preset.resolve();var created=Time.get_ticks_usec();var fx=Fx.new(preset.new_module(),data.options);var cold_ms=(Time.get_ticks_usec()-created)/1000.0;var renderer=Renderer.new();var previous=0.0;var samples=[]
  for fraction in [0.17,0.51,0.97]:
   var t:float=fraction*data.meta.duration;fx.update(t-previous);previous=t
   renderer.render(fx,data.bounds,30,"catalog-probe",false)
   var start=Time.get_ticks_usec();renderer.render(fx,data.bounds,30,"catalog-probe",false);var elapsed=(Time.get_ticks_usec()-start)/1000.0
   samples.append({"fraction":fraction,"draw_ms":elapsed})
  var row={"effect":entry.source,"creation_ms":cold_ms,"samples":samples};rows.append(row);print("NATIVE_CATALOG_PERFORMANCE ",JSON.stringify(row))
  FileAccess.open(output,FileAccess.WRITE).store_string(JSON.stringify({"method":"One process, one active effect, warm uncached render at 17/51/97 percent. This prioritization sample excludes update cost and does not establish full lifecycle FPS.","records":rows}))
  fx=null;renderer=null;S.shutdown()
 print("NATIVE_CATALOG_PERFORMANCE_DONE effects=",rows.size());quit()
