@tool
extends RefCounted
## Memoize deterministic lattice values, never rendered frames or time samples.
const M=preload("../core/math.gd")
static var _lattice:Dictionary={}
static var _entries:int=0
static func clear():
	_lattice.clear();_entries=0
static func _cells(seed_value:int) -> Dictionary:
	if _entries>=65536:clear()
	if not _lattice.has(seed_value):_lattice[seed_value]={}
	return _lattice[seed_value]
static func _at(cells:Dictionary,x:int,y:int,seed_value:int) -> float:
	var key:int=(x<<32)|(y&0xffffffff)
	if cells.has(key):return cells[key]
	var result:float=M.rand([x,y,seed_value]);cells[key]=result;_entries+=1;return result
static func tile_noise(x:float,y:float,px:int=0,py:int=0,seed_value:int=0) -> float:
	var ix:int=floori(x);var iy:int=floori(y);var fx:float=x-ix;var fy:float=y-iy
	var ux:float=fx*fx*(3-2*fx);var uy:float=fy*fy*(3-2*fy)
	var x0:int=posmod(ix,px) if px else ix;var x1:int=posmod(ix+1,px) if px else ix+1
	var y0:int=posmod(iy,py) if py else iy;var y1:int=posmod(iy+1,py) if py else iy+1;var cells:Dictionary=_cells(seed_value)
	return lerpf(lerpf(_at(cells,x0,y0,seed_value),_at(cells,x1,y0,seed_value),ux),lerpf(_at(cells,x0,y1,seed_value),_at(cells,x1,y1,seed_value),ux),uy)*2-1
static func noise2(x:float,y:float,seed_value:int=0) -> float:return tile_noise(x,y,0,0,seed_value)
static func tile_fbm(x:float,y:float,px:int=0,py:int=0,seed_value:int=0,octaves:int=3) -> float:
	var s:float=0;var a:float=0.5;var n:float=0;var k:int=1
	for o in range(octaves):
		s+=tile_noise(x*k,y*k,px*k,py*k,seed_value+o*101)*a;n+=a;a*=0.5;k*=2
	return s/n
static func fbm(x:float,y:float,seed_value:int=0,octaves:int=3) -> float:
	var s:float=0;var a:float=0.5;var n:float=0
	for o in range(octaves):
		s+=noise2(x,y,seed_value+o*101)*a;n+=a;x*=2.03;y*=2.03;a*=0.5
	return s/n
static func loop_noise(phase:float,radius:float=1,seed_value:int=0) -> float:
	return noise2(cos(phase*TAU)*radius+50,sin(phase*TAU)*radius+50,seed_value)
