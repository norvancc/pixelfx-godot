@tool
extends RefCounted
## Explicit native Image inputs; this library never reads another app's scene or files.
const Frame=preload("../core/frame.gd")
const Colors=preload("../core/color.gd")
static func actor_from_image(image: Image,top_left=Vector2i.ZERO) -> Dictionary:
	if image==null or image.is_empty():return {}
	var w=image.get_width();var h=image.get_height()
	var pixels: Array=[];var mask: Array=[];pixels.resize(w*h);mask.resize(w*h)
	for y in range(h):
		for x in range(w):
			var c=image.get_pixel(x,y);var alpha=Frame.byte_clamp(c.a*255)
			pixels[y*w+x]=((alpha<<24)|((Frame.byte_clamp(c.b*255))<<16)|((Frame.byte_clamp(c.g*255))<<8)|Frame.byte_clamp(c.r*255)) if alpha>0 else 0
			mask[y*w+x]=1 if alpha>0 else 0
	return {"mask":{"w":w,"h":h,"data":mask},"pixels":pixels,"x":top_left.x,"y":top_left.y,"w":w,"h":h,"k":1,"head":[top_left.x+w/2,top_left.y],"chest":[top_left.x+w/2,top_left.y+h*0.55]}
static func scene_from_image(image: Image,origin=Vector2i.ZERO):
	if image==null or image.is_empty():return null
	var frame=Frame.new(image.get_width(),image.get_height(),origin.x,origin.y)
	for y in range(frame.h):
		for x in range(frame.w):
			var c=image.get_pixel(x,y)
			frame.color[y*frame.w+x]=(Frame.byte_clamp(c.a*255)<<24)|(Frame.byte_clamp(c.b*255)<<16)|(Frame.byte_clamp(c.g*255)<<8)|Frame.byte_clamp(c.r*255)
	return frame
