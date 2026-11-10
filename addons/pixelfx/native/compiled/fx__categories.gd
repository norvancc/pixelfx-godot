@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/categories.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "categories", [_S.merge([{"id": "moves"}, {"name": "moves"}, {"blurb": "whole attacks, wind-up to recovery, chained from the effects below"}]), _S.merge([{"id": "fire"}, {"name": "fire"}, {"blurb": "torches, breath, pillars, walls of flame"}]), _S.merge([{"id": "explosions"}, {"name": "explosions"}, {"blurb": "blasts, smoke, fireworks, mushroom clouds"}]), _S.merge([{"id": "water"}, {"name": "water"}, {"blurb": "splashes, falls, fountains, waves"}]), _S.merge([{"id": "ice"}, {"name": "ice"}, {"blurb": "spikes, novas, freezing, shattering"}]), _S.merge([{"id": "lightning"}, {"name": "lightning"}, {"blurb": "strikes, arcs, coils, storms"}]), _S.merge([{"id": "scifi"}, {"name": "sci-fi"}, {"blurb": "holograms, shields, scanners, warps"}]), _S.merge([{"id": "melee"}, {"name": "melee"}, {"blurb": "slashes, smears, cleaves, combos"}]), _S.merge([{"id": "impacts"}, {"name": "impacts"}, {"blurb": "hit sparks, shockwaves, landings"}]), _S.merge([{"id": "projectiles"}, {"name": "projectiles"}, {"blurb": "bullets, rockets, lasers, arrows"}]), _S.merge([{"id": "spawn"}, {"name": "spawn & death"}, {"blurb": "poofs, portals, souls, shatters"}]), _S.merge([{"id": "arcane"}, {"name": "arcane"}, {"blurb": "portals, runes, missiles, beams"}]), _S.merge([{"id": "holy"}, {"name": "holy"}, {"blurb": "heals, halos, pillars of light"}]), _S.merge([{"id": "shadow"}, {"name": "shadow"}, {"blurb": "curses, voids, tendrils, souls"}]), _S.merge([{"id": "status"}, {"name": "status"}, {"blurb": "burning, frozen, poisoned, asleep"}]), _S.merge([{"id": "nature"}, {"name": "nature"}, {"blurb": "poison, vines, thorns, quakes"}]), _S.merge([{"id": "weather"}, {"name": "weather"}, {"blurb": "rain, snow, fog, aurora"}]), _S.merge([{"id": "ui"}, {"name": "ui"}, {"blurb": "level ups, numbers, toasts, countdowns"}]), _S.merge([{"id": "pickups"}, {"name": "pickups"}, {"blurb": "coins, gems, chests, potions"}]), _S.merge([{"id": "transitions"}, {"name": "transitions"}, {"blurb": "wipes, irises, dissolves"}]), _S.merge([{"id": "critters"}, {"name": "critters"}, {"blurb": "slimes, bats, ghosts, frogs"}])])
	_exports["categories"] = _S.read(_e, "categories")
	_exports["__scope"] = _e
	return _exports

