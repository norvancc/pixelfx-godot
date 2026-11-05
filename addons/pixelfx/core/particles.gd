@tool
extends RefCounted
## Closed-form particles and the upstream basic stateful particle list.
const M = preload("math.gd")
var list: Array = []

static func fly(x: float,y: float,vx: float,vy: float,t: float,g: float=0,drag: float=0) -> Array:
	if drag <= 0: return [x+vx*t,y+vy*t+0.5*g*t*t]
	var f := (1-exp(-drag*t))/drag; var vt := g/drag
	return [x+vx*f,y+vt*t+(vy-vt)*f]
static func fly_v(vx: float,vy: float,t: float,g: float=0,drag: float=0) -> Array:
	if drag <= 0: return [vx,vy+g*t]
	var e := exp(-drag*t); var vt := g/drag
	return [vx*e,vt+(vy-vt)*e]
static func along(x: float,v: float,a: float,k: float,t: float) -> Array:
	if k <= 0: return [x+v*t+0.5*a*t*t,v+a*t]
	var e := exp(-k*t); var vt := a/k
	return [x+vt*t+((v-vt)*(1-e))/k,vt+(v-vt)*e]
static func drift(x: float,y: float,vx: float,vy: float,t: float,ax: float,ay: float,kx: float,ky: float) -> Array:
	var xx := along(x,vx,ax,kx,t); var yy := along(y,vy,ay,ky,t)
	return [xx[0],yy[0],xx[1],yy[1]]
static func burst(n: int,seed_value: int,fn: Callable) -> void:
	for i in range(n): fn.call(M.rng([seed_value,i]),i)
static func cycle(t: float,period: float,count: int,seed_value: int,life,fn: Callable) -> void:
	assert(period > 0)
	for i in range(count):
		var g := M.rng([seed_value,i,911]); var born := g.next()*period
		var duration: float = life.call(g) if life is Callable else life
		var age := fposmod(t-born,period)
		while age < duration:
			fn.call(age,duration,M.rng([seed_value,i]),i); age += period
static func stream(t: float,t0: float,t1: float,rate: float,seed_value: int,life,fn: Callable) -> void:
	assert(rate > 0)
	var n := floori((minf(t,t1)-t0)*rate)
	for i in range(n+1):
		var born := t0+i/rate; var g := M.rng([seed_value,i,911])
		var duration: float = life.call(g) if life is Callable else life
		var age := t-born
		if age >= 0 and age < duration: fn.call(age,duration,M.rng([seed_value,i]),i)
static func looped(t: float,duration: float,count: int,seed_value: int,make: Callable,draw: Callable) -> void:
	assert(duration > 0)
	for i in range(count):
		var r := M.rng([seed_value,i]); var born := r.next()*duration
		var q: Dictionary = make.call(r,i)
		var age := fposmod(t-born,duration)
		while age < q.life:
			draw.call(q,age,i); age += duration
func add(p: Dictionary) -> Dictionary:
	p.age=0.0; p.g=p.get("g",0.0); p.drag=p.get("drag",0.0); list.append(p)
	return p
func update(dt: float) -> void:
	for i in range(list.size()-1,-1,-1):
		var p: Dictionary=list[i]
		p.age += dt
		if p.age >= p.life: list.remove_at(i); continue
		p.vx -= p.vx*p.drag*dt; p.vy += p.g*dt-p.vy*p.drag*dt
		p.x += p.vx*dt; p.y += p.vy*dt
		if p.has("ground") and p.y > p.ground:
			p.y=p.ground; p.vy=-absf(p.vy)*p.get("bounce",0.3); p.vx *= 0.7
static func k(p: Dictionary) -> float: return clampf(1-p.age/p.life,0,1)
