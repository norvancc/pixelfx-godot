@tool
extends "b2_common.gd"
## Pinned PixelFX src/fx/projectiles/_lib.js turnSprite; MIT (c) Patch / Hugo Duprez.
const Native = preload("../native_bridge.gd")
static func turn_sprite(p, rows: Array, palette: Dictionary, x, y, angle, pivot_x, pivot_y, alpha=1) -> void:
	var height = rows.size(); var width = rows[0].length()
	var cs = cos(angle); var sn = sin(angle)
	var radius = Native.hypot([maxf(pivot_x,width-pivot_x),maxf(pivot_y,height-pivot_y)])+1
	p.shade(x-radius,y-radius,x+radius,y+radius,func(lx,ly,out):
		var dx = lx-x; var dy = ly-y
		var i = floori(dx*cs+dy*sn+pivot_x); var j = floori(-dx*sn+dy*cs+pivot_y)
		if i < 0 or j < 0 or i >= width or j >= height: return
		var color = palette.get(rows[j][i],0)
		if not color: return
		out.c = color; out.a = alpha
	)
