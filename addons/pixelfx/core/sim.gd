@tool
extends RefCounted
## Stateful particles from upstream core/sim.js. MIT (c) 2026 Hugo Duprez.
const C = preload("color.gd")
const M = preload("math.gd")
const H = preload("../effects/analytic_helpers.gd")
const GRAVITY = 950.0
const P = {"SPARK":0,"MOTE":1,"STREAK":2,"FLAKE":3,"VAPOUR":4,"DUST":5,"STAR":6,"EMBER":7,"SMOKE":8,"FIRE":9,"BRAND":10,"GRIT":11}
const PF = {"SMOKES":1,"BIG":2,"BACK":4}
const B = {"SHARD":0,"CHUNK":1,"DRIP":2}
const CROSS = [[1,0],[-1,0],[0,1],[0,-1]]
static func fire_ramp() -> Array: return C.fit(["#ffffff","#fff3a6","#ffe26b","#ffc23d","#ff8a2a","#f2561d","#c9281f","#8a1f17","#4a1712"],9)
static func hot() -> Array: return C.fit(["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],4)

class Particles:
	extends RefCounted
	var R
	var list: Array = []
	var t = 0.0
	var ground: Callable
	var sparks: Array
	var haze = 0
	var on_land: Callable
	func _init(opts: Dictionary = {}) -> void:
		R = opts.get("rng", M.Rng.new(opts.get("seed",1)))
		ground = opts.get("ground", Callable())
		sparks = C.fit(opts.get("sparks",["#fff3a6","#ffe26b","#ff8a2a","#f2561d"]),opts.get("sparks",[0,0,0,0]).size())
		haze = C.hex(opts.haze) if opts.has("haze") else 0
		on_land = opts.get("on_land",Callable())
	func spawn(kind: int,x: float,y: float,vx: float,vy: float,life: float,col = C.WHITE,size: float=1,delay: float=0,flag: int=0) -> void:
		list.append({"k":kind,"x":x,"y":y,"vx":vx,"vy":vy,"life":life,"max":life,"col":C.hex(col) if col else 0,"size":size,"seed":R.next()*100,"delay":delay,"flag":flag})
	func update(dt: float) -> void:
		t += dt
		for i in range(list.size()-1,-1,-1):
			var q: Dictionary = list[i]
			if q.delay > 0: q.delay -= dt; continue
			q.life -= dt
			if q.life <= 0:
				if q.k == P.FIRE and q.flag & PF.SMOKES:
					var big = q.flag & PF.BIG
					spawn(P.SMOKE,q.x,q.y,q.vx*0.6,q.vy*0.6-6,R.range_value(1.3,2.3) if big else R.range_value(0.8,1.4),0,q.size*(0.85 if big else 0.7),0,PF.BIG if big else 0)
				list.remove_at(i); continue
			match q.k:
				P.FIRE:
					q.vy -= 95*dt; q.vx += sin(t*17+q.seed)*30*dt; q.vx -= q.vx*5*dt; q.vy -= q.vy*3.2*dt
				P.GRIT:
					q.vy += GRAVITY*dt; q.vx -= q.vx*0.8*dt
					var g = ground.call(q.x) if ground.is_valid() else INF
					var ny = q.y+q.vy*dt
					q.x += q.vx*dt
					if q.vy > 0 and q.y <= g and ny >= g:
						q.y = g-0.25
						if q.vy > 130 and R.chance(0.4): q.vy = -q.vy*0.25; q.vx = q.vx*0.5+R.range_value(-10,10)
						else: q.vx = 0.0; q.vy = 0.0; q.life = minf(q.life,0.5)
					else: q.y = ny
					continue
				P.BRAND:
					q.vy += GRAVITY*0.8*dt; q.vx -= q.vx*0.9*dt
					if R.chance(0.9*minf(1,dt*60)):
						spawn(P.FIRE,q.x,q.y,q.vx*0.1+R.range_value(-7,7),q.vy*0.1-10,R.range_value(0.16,0.32),0,R.range_value(0.9,1.7)*(0.5+(q.life/q.max)*0.6),0,PF.SMOKES if R.chance(0.4) else 0)
					var g = ground.call(q.x) if ground.is_valid() else INF
					var ny = q.y+q.vy*dt
					q.x += q.vx*dt
					if q.vy > 0 and q.y <= g and ny >= g:
						if on_land.is_valid(): on_land.call(q.x,g)
						list.remove_at(i)
					else: q.y = ny
					continue
				P.SPARK:
					q.vy += GRAVITY*0.45*dt; q.vx -= q.vx*2.2*dt; q.vy -= q.vy*2.2*dt
					var g = ground.call(q.x) if ground.is_valid() else INF
					var ny = q.y+q.vy*dt
					q.x += q.vx*dt
					if q.vy > 0 and q.y <= g and ny >= g: q.vy = -q.vy*0.45; q.vx *= 0.7; q.y = g-0.25
					else: q.y = ny
					continue
				P.STREAK: q.vx += q.vx*3*dt; q.vy += q.vy*3*dt
				P.FLAKE: q.vx -= q.vx*2.2*dt; q.vy -= q.vy*2.2*dt-35*dt; q.x += sin(t*2.5+q.seed)*7*dt
				P.EMBER: q.vy += (-30+sin(t*3+q.seed)*20)*dt; q.vx += cos(t*2.3+q.seed)*45*dt; q.vx -= q.vx*1.6*dt; q.vy -= q.vy*1.6*dt
				P.SMOKE: q.vy -= (23 if q.flag & PF.BIG else 16)*dt; q.vx += sin(t*1.3+q.seed)*8*dt; q.vx -= q.vx*1.6*dt; q.vy -= q.vy*1.2*dt
				P.MOTE: q.vx -= q.vx*0.6*dt; q.vy -= q.vy*0.6*dt
				_:
					var drag = 4 if q.k in [P.VAPOUR,P.DUST,P.SMOKE] else 1.6
					q.vx -= q.vx*drag*dt; q.vy -= q.vy*drag*dt+5*dt
			q.x += q.vx*dt; q.y += q.vy*dt
	func draw(p,layer: String = "") -> void:
		var fire = C.fit(["#ffffff","#fff3a6","#ffe26b","#ffc23d","#ff8a2a","#f2561d","#c9281f","#8a1f17","#4a1712"],9)
		var hot = C.fit(["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],4)
		for q in list:
			if q.delay > 0: continue
			var soft = q.k in [P.VAPOUR,P.DUST,P.SMOKE] or q.flag & PF.BACK
			if layer != "" and ("back" if soft else "front") != layer: continue
			var k: float = q.life/q.max; var x: float = q.x; var y: float = q.y
			var sp = sqrt(q.vx*q.vx+q.vy*q.vy)
			if sp == 0: sp = 1.0
			var ux = q.vx/sp; var uy = q.vy/sp
			match q.k:
				P.SPARK:
					var head = sparks[0] if k > 0.6 else (sparks[1] if k > 0.3 else sparks[2]); var length = minf(9,1+sp*0.022)
					p.line(x-ux*length,y-uy*length,x-ux*length*0.4,y-uy*length*0.4,head if k > 0.5 else sparks[-1])
					p.line(x-ux*length*0.45,y-uy*length*0.45,x,y,head); p.glow(x,y,3,head,0.45*k)
				P.MOTE:
					var length = minf(16,0.5+sp*0.026)*q.size; var a = k/0.35 if k < 0.35 else 1.0
					p.line(x-ux*length,y-uy*length,x-ux*length*0.35,y-uy*length*0.35,C.scale_color(q.col,0.55),a)
					p.line(x-ux*length*0.4,y-uy*length*0.4,x,y,q.col,a); p.glow(x,y,2.5+q.size,q.col,0.4*k)
				P.STREAK:
					var length = clampf(sp/30,1,7); var d = length
					while d >= 0:
						p.dot(x-ux*d,y-uy*d,C.WHITE if d < 1 else (q.col if d < length*0.5 else C.scale_color(q.col,0.6)),1.0 if d < length*0.5 else 1.2-d/length); d -= 0.5
					p.glow(x,y,4,q.col,0.4)
				P.FLAKE:
					var a = minf(1,k*3); p.dot(x,y,q.col,a)
					if q.size > 1.3:
						for v in CROSS: p.dot(x+v[0],y+v[1],C.scale_color(q.col,0.8),a*0.8)
				P.VAPOUR:
					var r = q.size*(0.6+(1-k)*0.9); p.disc(x,y,r,q.col,pow(k,1.3)*0.45)
					if haze: p.glow(x,y,r*1.8,haze,0.16*k)
				P.DUST: p.disc(x,y,q.size*(0.6+(1-k)*0.9),q.col,pow(k,1.3)*0.7)
				P.SMOKE:
					var age = 1-k; var big = q.flag & PF.BIG
					var r = q.size*(0.65+minf(1,age*2.5)*0.45+age*(0.5 if big else 0.4))
					var a = minf(1,age*12)*minf(1,k*2.4)*(0.7 if big else 0.58)
					var c = C.mix(q.col,C.at(C.SMOKE_RAMP,age),age) if q.col else C.at(C.SMOKE_RAMP,age*1.05)
					p.disc(x,y,r,c,a*0.45); p.disc(x+r*0.05,y+r*0.06,r*0.74,c,a*0.62)
					if age < 0.5: p.disc(x-r*0.22,y-r*0.3,r*0.5,C.mix(c,C.WHITE,0.12),a*0.4*(1-age*2))
				P.FIRE:
					var age = 1-k; var heat = minf(0.999,pow(age,0.62)+fmod(q.seed,1)*0.1); var n = fire.size(); var idx = mini(n-2,floori(heat*(n-1)))
					var r = q.size*(0.55+0.45*minf(1,age*7))*(1-age*0.55); var c = fire[idx]
					if idx >= n-2: p.disc(x,y,r,c,minf(1,k*3)*0.85)
					else:
						p.circle(x,y,r,fire[mini(n-1,idx+2)]); p.circle(x-r*0.16,y-r*0.22,r*0.78,c)
						if r > 1.6: p.circle(x,y-r*0.9,r*0.42,c)
						if idx <= 3 and r > 1.8: p.circle(x-r*0.28,y-r*0.34,r*0.36,fire[maxi(0,idx-1)])
						if idx < 6: p.glow(x,y,r*2.4+2,c,0.18*k)
				P.BRAND:
					p.circle(x,y,1.6,hot[3]); p.px(x,y,hot[0] if sin(t*40+q.seed) > 0 else hot[1]); p.px(x+1,y,hot[1]); p.glow(x,y,7,hot[2],0.45)
				P.GRIT:
					if k > 0.25 or k*4 > 0.5:
						p.px(x,y,q.col)
						if q.size >= 2: p.px(x+1,y,q.col); p.px(x,y+1,C.scale_color(q.col,0.8)); p.px(x+1,y+1,C.scale_color(q.col,0.7))
				P.EMBER:
					var c = sparks[0] if k > 0.6 else (sparks[1] if k > 0.3 else sparks[2])
					if k < 0.25 and sin(t*40+q.seed) < 0: continue
					p.px(x,y,c)
					if q.size > 1.5: p.px(x,y+1,sparks[-1])
					p.glow(x,y,3+q.size,c,0.35*k)
				_:
					var tw = 0.6+0.4*sin(t*(8+fmod(q.seed,5))+q.seed)
					if q.size < 1:
						if tw*k > 0.25: p.px(x,y,C.WHITE if tw > 0.8 else q.col)
						p.glow(x,y,3,q.col,0.4*k*tw)
					else: H.sparkle(p,x,y,q.size*tw*minf(1,k*3),q.col,C.scale_color(q.col,0.75),0.5*k*tw)

class Blazes:
	extends RefCounted
	var ps
	var list: Array = []
	func _init(particles) -> void: ps = particles
	func add(x: float,y: float,life: float,power: float) -> void: list.append({"x":x,"y":y,"life":life,"max":life,"acc":ps.R.next(),"power":power})
	func update(dt: float) -> void:
		var r = ps.R
		for i in range(list.size()-1,-1,-1):
			var b: Dictionary = list[i]; b.life -= dt
			if b.life <= 0: list.remove_at(i); continue
			var k = b.life/b.max; var intensity = b.power*(1 if k > 0.7 else 0.35+(k/0.7)*0.65)
			b.acc += dt*(6+16*intensity)
			while b.acc > 1:
				var s = r.range_value(1.2,2.8)*intensity
				ps.spawn(P.FIRE,b.x+r.range_value(-1.5,1.5),b.y-s*0.6,r.range_value(-6,6),r.range_value(-30,-12),r.range_value(0.28,0.6),0,s,0,PF.BACK | (PF.SMOKES if r.chance(0.3) else 0))
				if r.chance(0.06): ps.spawn(P.EMBER,b.x,b.y-1.5,r.range_value(-15,15),r.range_value(-45,-15),r.range_value(0.6,1.4),C.hex("#ff8a2a"),1,0,PF.BACK)
				b.acc -= 1
	func draw_back(p) -> void:
		var hot = C.fit(["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],4)
		for b in list:
			var k = b.life/b.max
			p.px(b.x,b.y,(hot[1] if sin(b.life*31+b.x) > 0 else hot[2]) if k > 0.4 else hot[3]); p.glow(b.x,b.y,6+5*k*b.power,hot[2],0.3*k*b.power)

class Bits:
	extends RefCounted
	var list: Array = []
	var ground: Callable
	func _init(opts: Dictionary = {}) -> void: ground = opts.get("ground",Callable())
	func add(b: Dictionary) -> void:
		var life = b.get("life",1.0)
		var item = {"kind":B.SHARD,"vx":0.0,"vy":0.0,"a":0.0,"va":0.0,"s":1.0,"c":C.WHITE,"g":1.0,"drag":0.0,"bounce":0.0,"rest":false}
		item.merge(b,true); item.life = life; item.max = life; list.append(item)
	func update(dt: float) -> void:
		for i in range(list.size()-1,-1,-1):
			var b: Dictionary = list[i]; b.life -= dt
			if b.life <= 0: list.remove_at(i); continue
			if b.rest: continue
			b.vy += GRAVITY*b.g*dt; b.vx -= b.vx*b.drag*dt; b.vy -= b.vy*b.drag*dt; b.x += b.vx*dt; b.y += b.vy*dt; b.a += b.va*dt
			var floor_y = ground.call(b.x) if ground.is_valid() else INF; var speed = b.vy
			if b.g <= 0 or b.y < floor_y or speed <= 0: continue
			b.y = floor_y-0.01
			if b.kind == B.DRIP: b.life = 0.0
			elif b.bounce > 0 and speed > 70: b.vy = -speed*b.bounce; b.vx *= 0.7; b.va *= 0.6
			else: b.rest = true; b.vx = 0.0; b.vy = 0.0

class Lights:
	extends RefCounted
	var list: Array = []
	func add(x: float,y: float,r: float,color,k: float,life: float) -> void: list.append({"x":x,"y":y,"r":r,"color":C.hex(color),"k":k,"life":life,"max":life})
	func update(dt: float) -> void:
		for i in range(list.size()-1,-1,-1):
			list[i].life -= dt
			if list[i].life <= 0: list.remove_at(i)
	func draw(p) -> void:
		for light in list:
			var k = light.life/light.max; p.glow(light.x,light.y,light.r*(0.55+0.45*k),light.color,light.k*k*k)

static func flare(p,x: float,y: float,length: float,k: float,ramp: Array) -> void:
	if length < 1: return
	var r = C.fit(ramp,ramp.size()); var n = r.size()
	for i in range(8):
		var a = i*PI/4; var extent = length if i % 4 == 0 else (length*0.6 if i % 2 == 0 else length*0.3); var d = 0.0
		while d <= extent:
			var u = d/extent; p.dot(x+cos(a)*d,y+sin(a)*d,C.WHITE if u < 0.35 else (r[n-2] if u < 0.7 else r[n-3]),1.0 if u < 0.6 else k*1.5*(1-u)+0.2); d += 0.5
static func band(p,cx: float,cy: float,radius: float,sy: float,th: float,k: float,ramp: Array,keep: Callable,hot: bool=false) -> void:
	if radius <= 0 or k <= 0: return
	var r = C.fit(ramp,ramp.size()); var n = r.size(); var m = ceili(radius*TAU*1.2)
	for j in range(m):
		var a = float(j)/m*TAU
		if not keep.call(a): continue
		var o = th
		while o >= 0:
			var u = o/th; var c = (C.WHITE if hot else r[n-1]) if u < 0.15 else (r[n-2] if u < 0.4 else (r[n-3] if u < 0.7 else r[n-4]))
			p.dot(cx+cos(a)*(radius-o),cy+sin(a)*(radius-o)*sy,c,k*(1.2 if u < 0.4 else 1.15-u)); o -= 0.5
