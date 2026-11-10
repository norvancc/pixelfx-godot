extends SceneTree
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
func _initialize():call_deferred("run")
func run():
	var script=load("res://tests/pixelfx/native_semantics_generated.gd")
	var module=script.build(script);var actual=Semantics.call_value(module.result,[])
	var expected=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/native-semantics-expected.json"))
	var passed=JSON.parse_string(JSON.stringify(actual))==expected and Semantics.errors.is_empty()
	var frame=Semantics.Frame.new(1,1);frame.color[0]=-1
	passed=passed and Semantics.prop(Semantics.prop(frame,"color"),0)==4294967295
	for repeat in range(2):
		for i in range(80):
			var x:float=(i-40)*0.37;var y:float=(i-12)*0.19
			passed=passed and Semantics.NoiseKernels.tile_noise(x,y,9,0,i%3)==Semantics.MathFX.tile_noise(x,y,9,0,i%3)
	var star=Semantics.Accelerators.GeometryKernels.black_star(null,[-5,3,0],null)
	passed=passed and Semantics.call_value(star.at,[0.5,-4.5])==true and Semantics.call_value(star.at,[-99,-99])==false
	var decay_rows=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/decay-expected.json"));var decay_max_ulp:int=0
	for row in decay_rows:
		var value:float=row.input.hex_decode().decode_double(0);var decay_bytes=PackedByteArray();decay_bytes.resize(8);decay_bytes.encode_double(0,Semantics.Accelerators.ParticleKernels.Decay.decay(value))
		decay_max_ulp=maxi(decay_max_ulp,absi(decay_bytes.decode_u64(0)-row.expected.hex_decode().decode_u64(0)))
	passed=passed and decay_rows.size()==2048 and decay_max_ulp<=1
	print("NATIVE_DECAY_ORACLE cases=",decay_rows.size()," max_ulp=",decay_max_ulp)
	print("NATIVE_SEMANTICS passed=",passed," actual=",JSON.stringify(actual))
	Semantics.shutdown();quit(0 if passed else 1)
