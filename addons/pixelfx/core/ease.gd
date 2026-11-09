@tool
extends RefCounted
## Easing functions used by the B1 ports, from upstream core/math.js.
static func out_cubic(t: float) -> float: return 1-pow(1-t,3)
static func in_cubic(t: float) -> float: return t*t*t
static func in_quad(t: float) -> float: return t*t
static func out_expo(t: float) -> float: return 1.0 if t >= 1 else 1-pow(2,-10*t)
static func in_back(t: float,s: float=1.70158) -> float: return 0.0 if t <= 0 else (1.0 if t >= 1 else (s+1)*t*t*t-s*t*t)
static func out_back(t: float,s: float=1.70158) -> float: return 0.0 if t <= 0 else (1.0 if t >= 1 else 1+(s+1)*pow(t-1,3)+s*pow(t-1,2))
