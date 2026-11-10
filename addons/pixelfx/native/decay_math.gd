@tool
extends RefCounted
## V8/fdlibm power reduction for visible particle decay k^1.3 (0.001 <= k <= 1).
## Adapted from v8/v8 12.4.254 src/base/ieee754.cc; see third_party/fdlibm-LICENSE.
static func _bits(value:int)->float:
	var bytes=PackedByteArray();bytes.resize(8);bytes.encode_u64(0,value);return bytes.decode_double(0)
# Godot's decimal literal parser can differ by one bit; retain the fdlibm bit patterns.
static var K:PackedFloat64Array=[_bits(0x3fe2b80340000000),_bits(0x3e4cfdeb43cfd006),_bits(0x3fe3333333333303),_bits(0x3fdb6db6db6fabff),_bits(0x3fd55555518f264d),_bits(0x3fd17460a91d4101),_bits(0x3fcd864a93c9db65),_bits(0x3fca7e284a454eef),_bits(0x3feec709e0000000),_bits(0x3e3e2fe0145b01f5),_bits(0x3feec709dc3a03fd),_bits(0x3fe62e4300000000),_bits(0x3fe62e42fefa39ef),_bits(0x3e205c610ca86c39),_bits(0x3fc555555555553e),_bits(0x3f66c16c16bebd93),_bits(0x3f11566aaf25de2c),_bits(0x3ebbbd41c5d26bf1),_bits(0x3e66376972bea4d0)]
static func _high(value:float)->int:
	var bytes=PackedByteArray();bytes.resize(8);bytes.encode_double(0,value);return bytes.decode_u32(4)
static func _set_high(value:float,high:int)->float:
	var bytes=PackedByteArray();bytes.resize(8);bytes.encode_double(0,value);bytes.encode_u32(4,high&0xffffffff);return bytes.decode_double(0)
static func _chop(value:float)->float:
	var bytes=PackedByteArray();bytes.resize(8);bytes.encode_double(0,value);bytes.encode_u32(0,0);return bytes.decode_double(0)
static func decay(value:float)->float:
	# Below this range alpha is below the rasterizer cutoff; keep ordinary pow for outliers.
	if value<0.001 or value>=1:return pow(value,1.3)
	var ax:float=value;var ix:int=_high(ax);var n:int=(ix>>20)-0x3ff;var j:int=ix&0xfffff;var k:int=0;ix=j|0x3ff00000
	if j<=0x3988e:k=0
	elif j<0xbb67a:k=1
	else:k=0;n+=1;ix-=0x100000
	ax=_set_high(ax,ix)
	var bp:float=1.0 if k==0 else 1.5;var dp_h:float=0 if k==0 else K[0];var dp_l:float=0 if k==0 else K[1]
	var u:float=ax-bp;var v:float=1/(ax+bp);var ss:float=u*v;var s_h:float=_chop(ss);var t_h:float=_set_high(0,((ix>>1)|0x20000000)+0x80000+(k<<18));var t_l:float=ax-(t_h-bp);var s_l:float=v*((u-s_h*t_h)-s_h*t_l);var s2:float=ss*ss
	var r:float=s2*s2*(K[2]+s2*(K[3]+s2*(K[4]+s2*(K[5]+s2*(K[6]+s2*K[7])))))
	r+=s_l*(s_h+ss);s2=s_h*s_h;t_h=_chop(3.0+s2+r);t_l=r-((t_h-3.0)-s2);u=s_h*t_h;v=s_l*t_h+t_l*ss
	var p_h:float=_chop(u+v);var p_l:float=v-(p_h-u);var z_h:float=K[8]*p_h;var z_l:float=-K[9]*p_h+p_l*K[10]+dp_l;var t:float=n;var t1:float=_chop(((z_h+z_l)+dp_h)+t);var t2:float=z_l-(((t1-t)-dp_h)-z_h)
	var y1:float=_chop(1.3);p_l=(1.3-y1)*t1+1.3*t2;p_h=y1*t1;var z:float=p_l+p_h;j=_high(z)
	if j>=0x80000000:j-=0x100000000
	var i:int=j&0x7fffffff;k=(i>>20)-0x3ff;n=0
	if i>0x3fe00000:
		n=j+(0x100000>>(k+1));k=((n&0x7fffffff)>>20)-0x3ff;t=_set_high(0,n&~(0xfffff>>k));n=((n&0xfffff)|0x100000)>>(20-k)
		if j<0:n=-n
		p_h-=t
	t=_chop(p_l+p_h);u=t*K[11];v=(p_l-(t-p_h))*K[12]+t* -K[13];z=u+v;var w:float=v-(z-u);t=z*z
	t1=z-t*(K[14]+t*(-K[15]+t*(K[16]+t*(-K[17]+t*K[18]))))
	r=(z*t1)/((t1-2.0)-(w+z*w));z=1.0-(r-z)
	return _set_high(z,_high(z)+(n<<20))
