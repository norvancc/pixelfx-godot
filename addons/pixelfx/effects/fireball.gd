@tool
extends "../core/effect.gd"
## Algorithm port of src/fx/fire/fireball.js, not a sprite sheet approximation.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const P = preload("../core/particles.gd")
const F = preload("fire_common.gd")
const D := 1.2
const META = {
	"id": "pixelfx.fireball", "cacheable": true, "layers": ["front"], "name": "Fireball", "size": [136,56], "origin": [112,28], "duration": D, "loop": true, "fps": 30,
	"options": {"palette": ["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"], "radius": 5.0, "speed": 120.0, "seed": 5}
}
const BODY = [[30,4.2,0],[23,4.4,-1.6],[22,4.4,1.6],[15,4.6,0]]
const CORONA = [[-1.3,6,1.1],[-1.8,8,1.2],[-2.3,7,1.1],[1.3,6,1.1],[1.8,8,1.2],[2.3,7,1.1]]
func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for color in META.options.palette: palette.append(Color(color))
	return [
		{"name": "radius", "type": TYPE_FLOAT, "default": 5.0, "min": 1.0, "max": 16.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "1,16,0.25"},
		{"name": "speed", "type": TYPE_FLOAT, "default": 120.0, "min": 0.0, "max": 300.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,300,1"},
		{"name": "seed", "type": TYPE_INT, "default": 5},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette}
	]

func bounds(options: Dictionary) -> Rect2i:
	# Include fading smoke, full tail and glow; placement/rotation are Node2D transforms.
	var left := ceili(maxf(112, options.speed * 0.9 + 48))
	var half_height := ceili(maxf(56, options.radius * 2.4 + 24))
	return Rect2i(-left, -half_height, left + 56, half_height * 2)

func draw(p,t: float,o: Dictionary) -> void:
	var hot := C.fit(o.palette,9); hot.reverse()
	var seed_value: int=o.seed; var radius: float=o.radius; var speed: float=o.speed
	var noise_fn := func(rate, seed_arg=0, off=0): return M.noise_for(t,D,rate,seed_arg,off)
	var glow := C.mix(C.mix(hot[3],hot[4],0.5),C.WHITE,0.25)
	var smoke_color := C.mix(C.hex("#5b5566"),hot[6],0.3)
	var sparks := [hot[1],hot[2],hot[4],hot[5]]; var emb := [hot[1],hot[2],hot[4],hot[6]]
	var hx: float=noise_fn.call(3,seed_value+50)*0.5; var hy: float=noise_fn.call(2.5,seed_value+51)*0.7
	var fire := []; var smoke := []
	P.looped(t,D,130,seed_value+100,func(r,_i):
		var fl: float=r.range_value(0.22,0.55); var sm: bool=r.chance(0.55); var x: float=-r.range_value(2,24)
		return {"x":x,"y":r.range_value(-1,1)*(radius-0.1*-x),"v":speed*r.range_value(0.3,0.6),"vy":r.range_value(-16,16),"fl":fl,"sm":sm,"sl":r.range_value(0.25,0.45),"s":r.range_value(1.3,2.9),"f":r.next()*0.5+0.5*(-x/24),"life":fl+(0.45 if sm else 0.0)},
		func(q,age,_i):
			var ta: float=minf(age,q.fl); var drift := P.drift(0,q.y,q.v,q.vy,ta,0,-70,4.5,3)
			var x: float=q.x+drift[0]-speed*ta
			if age < q.fl: fire.append([age,x,drift[1],q]); return
			if not q.sm or age-q.fl > q.sl: return
			var sa: float=age-q.fl; var sd := P.drift(x,drift[1],drift[2]-speed,drift[3]*0.6-6,sa,speed*2,-30,2,1.2)
			smoke.append([sa,sd[0],sd[1],q])
	)
	for entry in smoke:
		var q: Dictionary=entry[3]
		F.smoke_puff(p,entry[1],entry[2],1-entry[0]/q.sl,q.s*0.9,smoke_color)
	fire.sort_custom(func(a,b): return a[0] > b[0])
	for entry in fire:
		var q: Dictionary=entry[3]; var u: float=entry[0]/q.fl
		F.fire_puff(p,entry[1],entry[2],1-u,q.s*(1+1.3*u),q.f,hot,0.07,-0.86,-0.5)
	for i in range(BODY.size()):
		var entry: Array=BODY[i]; var n := (seed_value*5+i)*17
		var length: float=entry[0]*(0.82+0.25*noise_fn.call(4,n))*(1+0.3*maxf(0,noise_fn.call(2.4,n+3)))
		var dy: float=entry[2]
		F.flame_blade(p,hx+1,hy+dy*0.5,-1,dy*0.02,length,entry[1]*radius/5,noise_fn.call(3,n+5)*3+dy,noise_fn,n,hot,F.LAYERS,0.5,1.1+length*0.05)
	for i in range(CORONA.size()):
		var entry: Array=CORONA[i]; var n := (seed_value*5+i+20)*17; var a: float=entry[0]
		var length: float=entry[1]*(0.7+0.4*(0.5+0.5*noise_fn.call(6,n)))
		var dx := cos(a)*0.55-1; var dy := sin(a)*0.55; var l := sqrt(dx*dx+dy*dy)
		F.flame_blade(p,hx+cos(a)*radius*0.85,hy+sin(a)*radius*0.85,dx/l,dy/l,length,entry[2],-signf(a)*1.5,noise_fn,n,hot)
	_head(p,hot,t,radius,seed_value,hx,hy)
	P.looped(t,D,26,seed_value+200,func(r,_i): return {"a":r.range_value(-2.4,2.4),"v":r.range_value(30,70),"life":r.range_value(0.08,0.18)},
		func(q,age,_i):
			var ca: float=cos(q.a); var sa: float=sin(q.a); var d: float=radius*0.9+q.v*age
			var x: float=hx+ca*d-speed*0.4*age; var y: float=hy+sa*d
			var k: float=1-age/q.life; var length := 1+2*k
			p.line(x-ca*length+speed*0.02,y-sa*length,x,y,hot[1] if k > 0.5 else hot[3]); p.glow(x,y,3,hot[2],0.4*k)
	)
	P.looped(t,D,30,seed_value+300,func(r,_i): return {"x":-r.range_value(2,16),"y":r.range_value(-3,3),"v":speed*r.range_value(0.3,0.8),"vy":r.range_value(-20,20),"life":r.range_value(0.25,0.55),"big":r.chance(0.25),"ph":r.range_value(0,6.3)},
		func(q,age,_i):
			var d := P.drift(0,q.y,q.v,q.vy,age,0,50,3,2)
			var x: float=q.x+d[0]-speed*age; var k: float=1-age/q.life
			if q.big: F.ember(p,x,d[1],k,2,emb,age*40+q.ph)
			else: F.spark(p,x,d[1],d[2]-speed,d[3],k,sparks)
	)
	var fl: float=0.85+0.15*noise_fn.call(9,seed_value+7)
	p.glow_line(hx-6,hy,-50,-2,12,glow,0.2*fl); p.glow(hx-2,hy,42,glow,0.42*fl); p.glow(hx,hy,13,hot[1],0.3*fl)

func _head(p,hot: Array,t: float,radius: float,seed_value: int,hx: float,hy: float) -> void:
	var ph := t/D
	p.shade(hx-radius*2.4,hy-radius*1.7,hx+radius*1.5,hy+radius*1.7,func(x,y,_out):
		x -= hx; y -= hy
		var d: float=sqrt(x*x+y*y); var th: float=atan2(y,x); var back := maxf(0,-cos(th)); var a := th/TAU
		var bump := 0.55*M.pnoise(a*9+ph*9,9,seed_value)+0.35*M.pnoise(a*5-ph*10,5,seed_value+1)
		var rim := radius*(1+0.55*back*back)+bump
		if d > rim: return 0
		var swirl := M.pnoise(a*5-ph*10+d*0.45,5,seed_value+2)
		var h := 1-d/rim+0.26*swirl+0.1*(1-back)
		if rim-d < 1 and back < 0.3: return hot[3] if h > 0.3 else hot[5]
		if h > 0.74: return hot[0]
		if h > 0.58: return hot[1]
		if h > 0.42: return hot[2]
		if h > 0.27: return hot[4]
		if h > 0.13: return hot[5]
		return hot[6]
	)
