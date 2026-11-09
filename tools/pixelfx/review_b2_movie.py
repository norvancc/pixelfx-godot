"""Extract native B2 review sheets (requires ffmpeg and Pillow, authoring only)."""
from pathlib import Path
import json
import hashlib
import math
import shutil
import subprocess
from PIL import Image, ImageChops, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT/'builds/pixelfx'
rows = json.loads((ROOT/'tests/pixelfx/b2_effects.json').read_text())
samples = []
start = 0
for row in rows:
    source = (ROOT/'addons/pixelfx/effects'/row['source'].split('/')[0]/(row['id']+'.gd')).read_text()
    meta = json.loads(next(line.removeprefix('const META = ') for line in source.splitlines() if line.startswith('const META = ')))
    frames = math.ceil(max(3,meta['duration']+0.6)*30)
    for phase in [0,1]:
        ticks = sorted(set([1,5,10,20,45,frames//2,frames-2]))
        for tick in ticks:
            samples.append({'frame':start+tick,'id':row['id'],'title':meta['name'],'phase':phase,'tick':tick})
        start += frames
extract = BUILD/'b2-movie-frames'
extract.mkdir(exist_ok=True)
for old in extract.glob('frame-*.png'): old.unlink()
def select_tree(terms):
    if len(terms) == 1: return terms[0]
    middle = len(terms)//2
    return '('+select_tree(terms[:middle])+'+'+select_tree(terms[middle:])+')'
selection = select_tree(['eq(n,'+str(sample['frame'])+')' for sample in samples])
subprocess.run(['ffmpeg','-y','-v','error','-i',str(BUILD/'b2-native.mp4'),'-vf','select='+selection.replace(',',r'\,'),'-fps_mode','vfr',str(extract/'frame-%04d.png')],check=True)
files = sorted(extract.glob('frame-*.png'))
assert len(files) == len(samples), (len(files),len(samples))
for sample,frame in zip(samples,files):
    sample['path'] = BUILD/f"b2-native-{sample['id']}-{sample['phase']}-{sample['tick']}.png"
    shutil.copy2(frame,sample['path'])
# Catch a stale macOS framebuffer before any contact sheet can be used for acceptance.
identity_frames = [sample for sample in samples if sample['phase']==0 and sample['tick']==45]
if len({hashlib.sha256(sample['path'].read_bytes()).hexdigest() for sample in identity_frames}) != 20:
    raise SystemExit('Native movie repeats a stale framebuffer across effects')
for sample in samples:
    if sample['tick'] != 45: continue
    pixel = Image.open(sample['path']).convert('RGB').getpixel((50,150))
    expected = (222,200,153) if sample['phase'] else (25,39,55)
    if max(abs(a-b) for a,b in zip(pixel,expected)) > 12:
        raise SystemExit('Native movie background does not match '+sample['id']+' / '+str(sample['phase']))
font_path = Path('/System/Library/Fonts/Supplemental/Arial.ttf')
font = ImageFont.truetype(str(font_path),14) if font_path.exists() else ImageFont.load_default(size=14)

def thumb(sample, width=220, height=180):
    stage = Image.open(sample['path']).convert('RGB').crop((32,132,784,676))
    background = stage.getpixel((2,2))
    diff = ImageChops.difference(stage,Image.new('RGB',stage.size,background)).convert('L').point(lambda value:255 if value>20 else 0)
    box = diff.getbbox()
    if box:
        box = (max(0,box[0]-16),max(0,box[1]-16),min(stage.width,box[2]+16),min(stage.height,box[3]+16))
        stage = stage.crop(box)
    stage.thumbnail((width-16,height-36),Image.Resampling.NEAREST)
    tile = Image.new('RGB',(width,height),background)
    tile.paste(stage,((width-stage.width)//2,24+(height-36-stage.height)//2))
    draw = ImageDraw.Draw(tile)
    draw.text((8,5),sample['title']+' / '+str(round(sample['tick']/30,2))+'s',font=font,fill='white' if sample['phase']==0 else '#15202b')
    return tile

for phase in [0,1]:
    for page in range(2):
        sheet = Image.new('RGB',(7*220,10*180),'#121b28')
        for index,row in enumerate(rows[page*10:page*10+10]):
            selected = [sample for sample in samples if sample['id']==row['id'] and sample['phase']==phase]
            for column,sample in enumerate(selected): sheet.paste(thumb(sample),(column*220,index*180))
        sheet.save(BUILD/f'b2-lifecycle-{phase}-{page}.png')
poster = Image.new('RGB',(4*300,5*220),'#121b28')
for index,row in enumerate(rows):
    tick = 1 if row['id'] in ['cannonball','muzzle_pistol','muzzle_shotgun'] else 10 if row['id']=='magic_missile' else 45
    sample = next(sample for sample in samples if sample['id']==row['id'] and sample['phase']==0 and sample['tick']==tick)
    poster.paste(thumb(sample,300,220),((index%4)*300,(index//4)*220))
(ROOT/'docs/images').mkdir(exist_ok=True)
poster.save(ROOT/'docs/images/b2-effects.png')
print(f'Extracted {len(samples)} native frames from {start} movie frames; wrote four lifecycle sheets and the 20-effect poster.')
