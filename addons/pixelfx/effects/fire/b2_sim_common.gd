@tool
extends "../simulation_bridge.gd"
## Pinned PixelFX src/fx/fire/_lib.js simDraw; MIT (c) Patch / Hugo Duprez.
const S = preload("../../core/sim.gd")
const F = preload("../fire_common.gd")

static func sim_draw(p, particles, hot: Array, layer: String) -> void:
	var all = particles.list
	var rest: Array = []
	var fire: Array = []
	for q in all:
		if q.k == S.P.FIRE: fire.append(q)
		else: rest.append(q)
	particles.list = rest
	if layer != "front":
		particles.draw(p,"back")
		for q in fire:
			if q.delay <= 0 and bool(q.flag & S.PF.BACK): F.fire_puff(p,q.x,q.y,q.life/q.max,q.size,fmod(q.seed,1),hot)
	if layer != "back":
		for q in fire:
			if q.delay <= 0 and not bool(q.flag & S.PF.BACK): F.fire_puff(p,q.x,q.y,q.life/q.max,q.size,fmod(q.seed,1),hot)
		particles.draw(p,"front")
	particles.list = all
