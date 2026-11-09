@tool
extends "../b2_helpers.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _F = preload("../fire_common.gd")
const _B = preload("../b2_helpers.gd")
const SMOKE1 = 0xff66555b
static func burn(p, t, T, o):
	var _tuple1 = o
	var H = _tuple1.H
	var D = _tuple1.D
	var NL = _tuple1.NL
	var S = _tuple1.S
	var HC = o.height
	var X = o.get("x", 0)
	var Y = o.get("y", 0)
	var W = o.get("spread", 6)
	var G = o.get("glow", 1)
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, rate, seed_value, off)
	var fla = func(tt):
		return ((0.74 + (0.16 * NL.call(tt, 7.3, (S + 1)))) + (0.1 * NL.call(tt, 19, (S + 2))))
	var fl = fla.call(t)
	var SMOKE = _C.mix(SMOKE1, H[int(6)], 0.25)
	var EMB = [H[int(1)], H[int(2)], H[int(4)], H[int(6)]]
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	var R = _M.rng([S, 77])
	var count = func(rate):
		return _M.js_round((rate * D))
	var TT = _B.map_indexed(T, func(_arg0, i):
		var dx = _B.at(_arg0, 0)
		var dy = _B.at(_arg0, 1)
		var h = _B.at(_arg0, 2)
		var w = _B.at(_arg0, 3)
		var back = _B.at(_arg0, 4)
		return {"dx": (dx + R.range_value((-0.3), 0.3)), "y": dy, "h": (2 + ((HC * h) * R.range_value(0.92, 1.08))), "w": (w * R.range_value(0.92, 1.08)), "back": back, "env": h, "n": (((S * 7) + i) * 13)})
	var lean = func(tt):
		return (NL.call(tt, 0.67, (S + 90)) * o.get("lean", 0.1))
	var height = func(i, tt):
		var _tuple2 = TT[int(i)]
		var h = _tuple2.h
		var n = _tuple2.n
		var leap = (maxf(0, (NL.call(tt, 2.6, (n + 70)) - 0.55)) * 1.4)
		return (((h + ((0.25 * h) * NL.call(tt, 3.3, n))) + (h * leap)) * (0.9 + (0.1 * fla.call(tt))))
	var sweep = func(i, tt, h):
		return (((NL.call(tt, 2.2, (TT[int(i)].n + 40)) * (1 + (h * 0.08))) + ((lean.call(tt) * h) * 0.9)) - clampf((TT[int(i)].dx * 0.3), (-2.5), 2.5))
	var tip = func(i, tt):
		var h = height.call(i, tt)
		return [((X + TT[int(i)].dx) + (sweep.call(i, tt, h) * 0.85)), (((Y + TT[int(i)].y) - (h * 0.88)) + 3), h]
	var tongueAt = func(i):
		var _tuple3 = TT[int(i)]
		var dx = _tuple3.dx
		var y = _tuple3.y
		var w = _tuple3.w
		var n = _tuple3.n
		var back = _tuple3.back
		var h = height.call(i, t)
		_F.flame_tongue(p, (X + dx), (Y + y), h, w, sweep.call(i, t, h), N, n, H, (_F.BACK_LAYERS if back else (_F.BIG_LAYERS if (w > 2.2) else _F.LAYERS)), 0.5, (1.1 + (h * 0.04)))
	_P.looped(t, D, count.call(o.get("smoke", 12)), (S + 300), func(r, _unused1=null):
		return {"x": (r.range_value((-W), W) * 0.7), "y": (((-HC) * 0.8) - r.range_value(0, 6)), "vx": r.range_value((-2), 2), "vy": (-r.range_value(10, 17)), "life": r.range_value(o.get("smokeLife", [1.6, 2.6])[int(0)], o.get("smokeLife", [1.6, 2.6])[int(1)]), "s": (r.range_value(0.7, 1.1) * o.get("smokeSize", 3))}, func(q, age, _unused2=null):
		var _tuple4 = _P.drift(q.x, q.y, q.vx, q.vy, age, o.get("wind", 3), (-20), 1.6, 1)
		var x = _tuple4[0]
		var y = _tuple4[1]
		_F.smoke_puff(p, ((X + x) + (NL.call((t - age), 0.8, (S + 60)) * (1.5 + (2.5 * age)))), (Y + y), (1 - (float(age) / q.life)), q.s, SMOKE))
	var puffs = []
	_P.looped(t, D, (TT.size() * count.call(o.get("puffs", 8))), (S + 200), func(r, j):
		var i = fmod(j, TT.size())
		var fire = r.range_value(0.14, 0.3)
		var smokes = r.chance(0.45)
		return {"i": i, "fire": fire, "smokes": smokes, "sl": r.range_value(0.8, 1.4), "ox": r.range_value((-1), 1), "oy": r.range_value(0, 4), "vx": r.range_value((-4), 4), "vy": (-r.range_value(15, 30)), "s": (r.range_value(0.8, 1.6) * (0.8 + (0.6 * TT[int(i)].env))), "f": r.next(), "life": (fire + (1.4 if smokes else 0))}, func(q, age, _unused2=null):
		var _tuple5 = tip.call(q.i, (t - age))
		var tx = _tuple5[0]
		var ty = _tuple5[1]
		var _tuple6 = _P.drift((tx + q.ox), (ty + q.oy), q.vx, q.vy, minf(age, q.fire), 0, (-95), 5, 3.2)
		var x = _tuple6[0]
		var y = _tuple6[1]
		var vx = _tuple6[2]
		var vy = _tuple6[3]
		if (age < q.fire):
			puffs.append([x, y, (1 - (float(age) / q.fire)), q.s, q.f])
			return null
		if ((age - q.fire) > q.sl):
			return null
		var _tuple7 = _P.drift(x, y, (vx * 0.6), ((vy * 0.6) - 6), (age - q.fire), o.get("wind", 3), (-16), 1.6, 1.2)
		var sx = _tuple7[0]
		var sy = _tuple7[1]
		_F.smoke_puff(p, sx, sy, (1 - (float((age - q.fire)) / q.sl)), (q.s * 0.7), 0))
	if true:
		var i = 0
		while (i < TT.size()):
			if TT[int(i)].back:
				tongueAt.call(i)
			i += 1.0
	if true:
		var i = 0
		while (i < TT.size()):
			if (not TT[int(i)].back):
				tongueAt.call(i)
			i += 1.0
	if o.get("mid", null):
		o.mid.call()
	_P.looped(t, D, (TT.size() * count.call(o.get("licks", 4))), (S + 220), func(r, j):
		return {"i": fmod(j, TT.size()), "vx": r.range_value((-3), 3), "vy": (-r.range_value(12, 22)), "s": (r.range_value(0.9, 1.6) * (0.8 + (0.5 * TT[int(fmod(j, TT.size()))].env))), "life": 0.26}, func(q, age, _unused2=null):
		var _tuple8 = tip.call(q.i, (t - age))
		var tx = _tuple8[0]
		var ty = _tuple8[1]
		_F.lick(p, (tx + (q.vx * age)), ((ty - 2) + (q.vy * age)), (1 - (float(age) / q.life)), q.s, H))
	for _tuple9 in puffs:
		var x = _tuple9[0]
		var y = _tuple9[1]
		var k = _tuple9[2]
		var s = _tuple9[3]
		var f = _tuple9[4]
		_F.fire_puff(p, x, y, k, s, f, H)
	_P.looped(t, D, count.call(o.get("embers", 8)), (S + 500), func(r, _unused1=null):
		return {"x": r.range_value((-W), W), "y": (-r.range_value((HC * 0.3), (HC * 0.8))), "vx": r.range_value((-15), 15), "vy": (-r.range_value(25, 60)), "life": r.range_value(1.1, 2.4), "s": (2 if r.chance(0.15) else r.range_value(1, 1.6)), "a": r.range_value(0, 6.3), "b": r.range_value(0, 6.3)}, func(q, age, _unused2=null):
		var _tuple10 = _P.drift(q.x, q.y, q.vx, q.vy, age, 0, (-30), 1.6, 1.6)
		var x = _tuple10[0]
		var y = _tuple10[1]
		_F.ember(p, ((X + x) + (7 * (sin(((age * 2.3) + q.a)) - sin(q.a)))), ((Y + y) + (2 * (sin(((age * 3) + q.b)) - sin(q.b)))), (1 - (float(age) / q.life)), q.s, EMB, ((age * 40) + q.a)))
	if (G > 0):
		var R1 = o.get("glowR", 46)
		var lx = (X + (lean.call(t) * 12))
		p.glow(lx, (Y - (HC * 0.35)), (R1 * 1.5), GLOW, ((0.22 * fl) * G))
		p.glow(lx, (Y - (HC * 0.75)), R1, GLOW, ((0.34 * fl) * G))
		p.glow(X, (Y - (HC * 0.2)), (R1 * 0.32), H[int(2)], ((0.2 * fl) * G))
		p.glow(X, (Y - 2), 8, H[int(0)], ((0.14 * fl) * G))
	return {"tip": tip, "fl": fl}
