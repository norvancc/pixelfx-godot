@tool
extends RefCounted
## src/fx/water/_lib.js: drops, rings, mist, foam and stone. MIT, see provenance.json.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const WATER = ["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"]
const ROCK = ["#141219","#221f2b","#34303f","#4a4558","#655f74","#8a8498"]
static func bead(p,x: float,y: float,vx: float,vy: float,s: float,c: Array,a: float=1) -> void:
	var sp = sqrt(vx*vx+vy*vy)
	if sp == 0: sp = 1.0
	var ux = vx/sp; var uy = vy/sp; var tail = minf(5,sp*0.011)
	if tail >= 1: p.line(x-ux*(tail+1),y-uy*(tail+1),x-ux*1.2,y-uy*1.2,func(u): return c[3] if u < 0.45 else (c[5] if s > 1 else c[4]),a)
	if s >= 3:
		p.circle(x,y,1.75,c[4],a); p.circle(x-0.25,y-0.25,1.15,c[6],a); p.dot(x-0.7,y-0.7,C.WHITE,a)
	elif s >= 2:
		var xx = floor(x); var yy = floor(y)
		p.dot(xx,yy,C.WHITE,a); p.dot(xx+1,yy,c[6],a); p.dot(xx,yy+1,c[5],a); p.dot(xx+1,yy+1,c[4],a)
	else: p.dot(x,y,c[6] if sp > 160 else c[5],a)

class Drops:
	extends RefCounted
	var sy = 0.22
	var g = 820.0
	var drag = 0.35
	var on_land: Callable
	var list: Array = []
	func _init(opts: Dictionary = {}) -> void:
		sy = opts.get("sy",0.22); g = opts.get("g",820.0); drag = opts.get("drag",0.35); on_land = opts.get("on_land",Callable())
	func add(d: Dictionary) -> void:
		var life = d.get("life",4.0); var item = {"x":0.0,"z":0.0,"h":0.0,"vx":0.0,"vz":0.0,"vh":0.0,"s":1.0,"delay":0.0}
		item.merge(d,true); item.life = life; item.max = life; list.append(item)
	func update(dt: float) -> void:
		var k = drag*dt
		for i in range(list.size()-1,-1,-1):
			var d: Dictionary = list[i]
			if d.delay > 0: d.delay -= dt; continue
			d.life -= dt
			if d.life <= 0: list.remove_at(i); continue
			d.vh -= g*dt; d.vx -= d.vx*k; d.vz -= d.vz*k; d.vh -= d.vh*k*0.5
			d.x += d.vx*dt; d.z += d.vz*dt; d.h += d.vh*dt
			if d.h <= 0 and d.vh < 0:
				d.h = 0.0; list.remove_at(i)
				if on_land.is_valid(): on_land.call(d)
	func draw(p,c: Array,layer: String = "") -> void:
		var lib = load("res://addons/pixelfx/effects/water/water_common.gd")
		for d in list:
			if d.delay > 0 or (layer == "back" and d.z >= 0) or (layer == "front" and d.z < 0): continue
			var x = d.x; var y = d.z*sy-d.h
			lib.bead(p,x,y,d.vx,d.vz*sy-d.vh,d.s,c,minf(1,d.life/0.2))
			p.glow(x,y,2.5+d.s,c[5],0.1+0.05*d.s)

static func ring(p,cx: float,cy: float,r: float,sy: float,k: float,c: Array,opts: Dictionary = {}) -> void:
	if k <= 0.02 or r < 0.5: return
	var n = opts.get("n",2); var gap = opts.get("gap",3.0); var half = opts.get("half",0); var hot = opts.get("hot",false); var glint = opts.get("glint",0.0); var seed_value = opts.get("seed",0); var wob = opts.get("wob",0.0)
	for j in range(n):
		var rr = r-j*gap
		if rr < 0.6: break
		var kj = k*(1-j*0.42); var m = maxi(6,ceili(rr*TAU*1.3)); var need = 1.15-2.3*minf(1,kj*1.25)
		for i in range(m):
			var a = float(i)/m*TAU; var s = sin(a); var near = s > 0
			if (half > 0 and not near) or (half < 0 and near): continue
			if M.noise(a*4.7+seed_value*13.1+j*5.3,seed_value)*0.65+M.noise(a*11.3+seed_value*7.7,seed_value+3)*0.35 < need: continue
			var lit = kj*(1.0 if near else 0.7)*(0.88-0.12*cos(a))
			var color = C.WHITE if hot and near and j == 0 else c[6 if lit > 0.7 else (5 if lit > 0.38 else 4)]
			var ra = rr+wob*M.noise(a*2.6+seed_value*1.9+j,seed_value+11) if wob else rr
			var x = cx+cos(a)*ra; var y = cy+s*ra*sy; p.dot(x,y,color)
			if j == 0: p.light(x,y,c[4],0.3*lit)
	if glint > 0 and half >= 0:
		var x = cx+cos(2.05)*r; var y = cy+sin(2.05)*r*sy
		p.px(x,y,C.WHITE); p.glow(x,y,3+glint*2,c[5],0.35*glint)

class Ripples:
	extends RefCounted
	var sy = 0.22
	var list: Array = []
	var seq = 0
	func _init(opts: Dictionary = {}) -> void: sy = opts.get("sy",0.22)
	func add(x: float,z: float,r0: float,r1: float,life: float,o: Dictionary = {}) -> void:
		seq += 1
		list.append({"x":x,"z":z,"r0":r0,"r1":r1,"life":life,"age":-o.get("delay",0.0),"k":o.get("k",1.0),"n":o.get("n",2),"gap":o.get("gap",3.0),"hot":o.get("hot",0.1),"glint":o.get("glint",0.0),"seed":seq})
	func update(dt: float) -> void:
		for i in range(list.size()-1,-1,-1):
			list[i].age += dt
			if list[i].age >= list[i].life: list.remove_at(i)
	func draw(p,c: Array,half: int=0) -> void:
		var lib = load("res://addons/pixelfx/effects/water/water_common.gd")
		for q in list:
			if q.age < 0: continue
			var u = q.age/q.life; var r = q.r0+(q.r1-q.r0)*(1-pow(1-u,2.6)); var k = q.k*pow(1-u,1.7)
			lib.ring(p,q.x,q.z*sy,r,sy,k,c,{"n":q.n,"gap":q.gap*(0.55+0.6*u),"half":half,"hot":q.age<q.hot,"glint":q.glint*k,"seed":q.seed})

static func lace(p,cx: float,cy: float,rx: float,ry: float,k: float,c: Array,t: float,seed_value: int=0) -> void:
	if k <= 0.01 or rx < 1: return
	var sy = ry/rx
	p.shade(cx-rx,cy-ry,cx+rx,cy+ry,func(x,y,o):
		var dx = (x-cx)/rx; var dy = (y-cy)/ry; var d = dx*dx+dy*dy
		if d > 1: return
		var u = (x-cx)*0.36; var v = ((y-cy)/sy)*0.36
		var n = M.noise2(u+seed_value*7.13,v-t*0.35,seed_value); var m = M.noise2(u*2.2-t*0.3,v*2.2+seed_value*3.1,seed_value+9)
		var net = 1-absf(n)*4.6+m*0.3; var need = 1.02-k*(1.15-d*0.9)
		if net < need: return
		o.c = C.WHITE if net > need+0.4 else c[6]
	)

class Mist:
	extends RefCounted
	var list: Array = []
	func add(x: float,y: float,vx: float,vy: float,r0: float,r1: float,life: float,c,a: float=0.25,delay: float=0) -> void:
		list.append({"x":x,"y":y,"vx":vx,"vy":vy,"r0":r0,"r1":r1,"life":life,"max":life,"c":C.hex(c),"a":a,"delay":delay})
	func update(dt: float) -> void:
		for i in range(list.size()-1,-1,-1):
			var m: Dictionary = list[i]
			if m.delay > 0: m.delay -= dt; continue
			m.life -= dt
			if m.life <= 0: list.remove_at(i); continue
			m.vx -= m.vx*2.4*dt; m.vy -= m.vy*2.4*dt+7*dt; m.x += m.vx*dt; m.y += m.vy*dt
	func draw(p,haze: int) -> void:
		for m in list:
			if m.delay > 0: continue
			var age = 1-m.life/m.max; var r = m.r0+(m.r1-m.r0)*(1-pow(1-age,2.2)); var a = m.a*minf(1,age/0.12)*pow(1-age,1.4)
			if a < 0.01: continue
			p.disc(m.x,m.y,r,m.c,func(d,_ang): return a*(1-d*d)*(1-d*0.5))
			p.disc(m.x-r*0.2,m.y-r*0.32,r*0.55,C.WHITE,func(d,_ang): return a*0.25*(1-d)*(1-d))
			if haze: p.glow(m.x,m.y,r*1.5,haze,(0.16*a)/m.a*minf(1,m.a*3))

static func pebble(p,x: float,y: float,r: float,st: Array) -> void:
	p.shade(x-r-1,y-r-1,x+r+1,y+r+1,func(px,py,o):
		var dx = px-x; var dy = py-y; var d = sqrt(dx*1.1*dx*1.1+dy*dy)
		if d > r+0.8: return
		var lit = (dx+dy)/maxf(0.5,r)
		o.c = st[0] if d > r else (st[5] if lit < -0.7 else (st[4] if lit < 0.2 else (st[3] if lit < 0.8 else st[2])))
	)
