'use strict';
const $ = (q) => document.querySelector(q);
const repo = 'https://github.com/norvancc/pixelfx-godot';
const sourceURL = (id) => `${repo}/blob/main/addons/pixelfx/effects/${id.replaceAll('-', '_')}.gd`;
const dialog = $('#effect-dialog');
let effects = [], current;
function select(item) {
  current = item;
  $('#featured-image').src = item.image;
  $('#featured-image').alt = `${item.name}, rendered in Godot`;
  $('#featured-id').textContent = item.id.replace('/', ' / ').toUpperCase();
  $('#featured-name').textContent = item.name;
  $('#source-link').href = sourceURL(item.id);
  $('#featured-open').setAttribute('aria-label', `View ${item.name} effect`);
}
function openPreview(item) {
  $('#dialog-title').textContent = item.name;
  $('#dialog-image').src = item.image;
  $('#dialog-image').alt = `${item.name}, native Godot output`;
  $('#dialog-source').href = sourceURL(item.id);
  dialog.showModal();
}
function render(filter) {
  const visible = filter === 'all' ? effects : effects.filter(e => e.category === filter);
  $('#gallery-count').textContent = `${visible.length} SELECTED EFFECTS`;
  const selected = filter === 'all' ? visible.find(e => e.id === 'holy/holy-pillar') || visible[0] : visible[0];
  select(selected);
  const showcase = ['fire/flame-pillar','projectiles/homing-missile','ice/ice-spikes','holy/resurrection','ice/frost-nova','holy/heal-aoe'];
  const tiles = (filter === 'all' ? showcase.map(id => visible.find(e => e.id === id)).filter(Boolean) : visible.filter(e => e !== selected)).slice(0, 6);
  $('#tiles').replaceChildren(...tiles.map(item => {
    const button = document.createElement('button'); button.className = 'tile';
    button.setAttribute('aria-label', `Preview ${item.name}`);
    const img = document.createElement('img'); img.src = item.image; img.alt = ''; img.loading = 'lazy'; img.width=540;img.height=368;
    const label = document.createElement('span');label.className='tile-name';label.textContent=item.name;
    button.append(img,label);button.addEventListener('click',()=>{select(item);openPreview(item);});return button;
  }));
}
fetch('assets/effects.json').then(r => {if(!r.ok)throw Error('gallery');return r.json();}).then(data => { effects=data;render('all'); }).catch(() => { $('#gallery-count').textContent='VIEW THE FULL CATALOG ↗'; });
for (const button of document.querySelectorAll('[data-filter]')) button.addEventListener('click', () => {
  for (const b of document.querySelectorAll('[data-filter]')) {const active=b===button;b.classList.toggle('selected',active);b.setAttribute('aria-pressed',String(active));}
  if(effects.length)render(button.dataset.filter);
  $('#gallery').scrollIntoView({behavior:matchMedia('(prefers-reduced-motion:reduce)').matches?'instant':'smooth',block:'start'});
});
$('#featured-open').addEventListener('click',()=>current&&openPreview(current));
$('.dialog-close').addEventListener('click',()=>dialog.close());
dialog.addEventListener('click',e=>{const r=dialog.getBoundingClientRect();if(e.clientX<r.left||e.clientX>r.right||e.clientY<r.top||e.clientY>r.bottom)dialog.close();});
const video=$('#showreel'),playback=$('#playback');
function updatePlayback(){playback.textContent=video.paused?'▷ play':'Ⅱ pause';playback.setAttribute('aria-label',video.paused?'Play showcase':'Pause showcase');}
if(matchMedia('(prefers-reduced-motion:reduce)').matches)video.pause();
playback.addEventListener('click',()=>{if(video.paused)video.play().catch(()=>{});else video.pause();});
video.addEventListener('pause',updatePlayback);video.addEventListener('play',updatePlayback);updatePlayback();
