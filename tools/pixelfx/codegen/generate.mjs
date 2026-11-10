/** Ahead-of-time native GDScript generator. Acorn is a build tool only; Godot executes no JavaScript. */
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {pathToFileURL} from 'node:url';
import {parse} from './acorn.mjs';
import {directFunction,shaderFactory} from './direct.mjs';
const root=path.resolve(import.meta.dirname,'../../..');
const upstream=path.resolve(process.argv[2]??process.env.PIXELFX_UPSTREAM??root+'/builds/pixelfx/upstream/a84159688af3ca37a4be05a0d422b94451b2e24e');
const outDir=root+'/addons/pixelfx/native/compiled';fs.mkdirSync(outDir,{recursive:true});
const q=JSON.stringify,tab=d=>'\t'.repeat(d);
const registry={},manifest=[];
const accelerated={
 'fx/transitions/diamond-wipe.js::draw':'transition_diamond_draw',
 'fx/shadow/_lib.js::Puffs.draw':'shadow_puffs_draw',
 'fx/shadow/_lib.js::halo':'shadow_halo',
 'fx/shadow/_lib.js::ringLight':'shadow_ring_light',
 'fx/shadow/_lib.js::ringFast':'shadow_ring_fast',
 'fx/lightning/storm-cloud.js::scud':'sky_storm_scud',
 'fx/shadow/black-hole.js::hole':'sky_black_hole',
 'fx/lightning/storm-cloud.js::cloud':'sky_storm_cloud',
 'fx/weather/falling-leaves.js::leaf':'sky_falling_leaf',
 'fx/pickups/power-star.js::star':'sky_power_star',
 'fx/pickups/power-star.js::drawBack':'sky_power_star_back',
 'fx/nature/_lib.js::drawRock':'nature_draw_rock',
 'fx/nature/_lib.js::drawSpike':'nature_draw_spike',
 'fx/nature/thorns.js::thorn':'nature_thorn',
 'fx/weather/rain.js::mist':'weather_rain_mist',
 'fx/weather/rain.js::floor':'weather_rain_floor',
 'fx/weather/rain.js::drawBack':'weather_rain_back',
 'fx/melee/_lib.js::smear':'melee_smear',
 'fx/weather/god-rays.js::drawBack.rows.callback4':'weather_god_rays_row',
 'fx/weather/snow.js::drawBack.pass.callback4':'weather_snow_haze_pixel',
 'fx/transitions/_lib.js::field':'transition_field',
 'fx/impacts/impact-frame.js::draw':'impact_frame_draw',
 'fx/transitions/_lib.js::pixels':'transition_pixels',
 'fx/ui/_lib.js::drawWord':'ui_draw_word',
 'fx/pickups/_lib.js::drawGem':'pickup_draw_gem',
 'fx/projectiles/_lib.js::cloud':'projectile_cloud',
 'fx/pickups/_lib.js::Layer.begin':'pickup_layer_begin',
 'fx/pickups/_lib.js::Layer.idx':'pickup_layer_idx',
 'fx/pickups/_lib.js::Layer.get':'pickup_layer_get',
 'fx/pickups/_lib.js::Layer.set':'pickup_layer_set',
 'fx/pickups/_lib.js::Layer.fill':'pickup_layer_fill',
 'fx/pickups/_lib.js::Layer.outline':'pickup_layer_outline',
 'fx/pickups/_lib.js::Layer.map':'pickup_layer_map',
 'fx/pickups/_lib.js::Layer.draw':'pickup_layer_draw',
 'fx/weather/storm.js::deck':'weather_storm_deck',
 'fx/critters/butterfly.js::inPoly':'ice_in_poly',
 'fx/critters/butterfly.js::edgeDist':'geometry_edge_distance',
 'fx/shadow/_lib.js::blackStar':'geometry_black_star',
 'fx/shadow/_lib.js::inStar':'geometry_in_star',
 'fx/fire/fire-ring.js::create':'fire_ring_create',
 'fx/weather/storm.js::veil.pass.callback4':'weather_storm_veil_pixel',
 'fx/weather/blizzard.js::sheets.rows.callback4':'weather_blizzard_sheet_row',
 'fx/weather/blizzard.js::ground.rows.callback4':'weather_blizzard_ground_row',
 'fx/scifi/_lib.js::Ghosts.state':'ghost_state',
 'fx/nature/_lib.js::inPoly':'ice_in_poly',
 'fx/weather/fog.js::bank.rows.callback4':'weather_fog_bank_row',
 'fx/weather/fog.js::streaks.rows.callback4':'weather_fog_streak_row',
 'fx/weather/aurora.js::blur':'aurora_blur',
 'fx/weather/aurora.js::curtain':'aurora_curtain',
 'fx/weather/aurora.js::draw.rows.callback4':'aurora_row',
 'fx/explosions/_lib.js::lobe':'explosion_lobe',
 'fx/arcane/_lib.js::floorRing':'arcane_floor_ring',
 'fx/critters/_lib.js::Grid.idx':'grid_idx',
 'fx/critters/_lib.js::Grid.set':'grid_set_value',
 'fx/critters/_lib.js::Grid.get':'grid_get_value',
 'fx/critters/_lib.js::Grid.shade':'grid_shade',
 'fx/critters/_lib.js::Grid.ellipse':'grid_ellipse',
 'fx/critters/_lib.js::Grid.line':'grid_line',
 'fx/critters/_lib.js::Grid.draw':'grid_draw',
 'fx/critters/_lib.js::Grid.outline':'grid_outline',
 'fx/critters/_lib.js::Grid.clear':'grid_clear',

 'core/act.js::draw':'act_draw',
 'fx/weather/_lib.js::field':'weather_field',
 'fx/weather/_lib.js::sample':'weather_sample',
 'fx/weather/_lib.js::pass':'weather_pass',
 'fx/weather/_lib.js::rows':'weather_rows',
 'fx/weather/_lib.js::trips':'weather_trips',
 'core/particles.js::cycle':'cycle',
 'fx/holy/_lib.js::recolor':'recolor',
 'fx/fire/fire-ring.js::ring':'fire_ring_ring',
 'core/sim.js::Particles.draw':'particles_draw',
 'core/sim.js::Particles.update':'particles_update',
 'core/sim.js::Bits.draw':'bits_draw',
 'core/sim.js::Bits.update':'bits_update',
 'core/sim.js::Lights.draw':'lights_draw',
 'core/sim.js::Lights.update':'lights_update',
 'core/sim.js::sparkle':'sparkle',
 'core/sim.js::flare':'flare',
 'core/sim.js::band':'band',
 'core/sim.js::crystal':'crystal',
 'fx/fire/_lib.js::flameTongue':'flame_tongue',
 'fx/fire/_lib.js::simDraw':'fire_sim_draw',
 'fx/holy/_lib.js::feather':'feather',
 'fx/holy/_lib.js::oval':'oval',
 'fx/holy/_lib.js::shapeOf':'actor_shape',
 'fx/holy/blessing.js::drawBack':'blessing_back',
 'fx/fire/fire-ring.js::drawBack':'fire_ring_back',
 'fx/fire/fire-ring.js::draw':'fire_ring_draw',
 'fx/ice/frost-nova.js::drawCrystals':'nova_crystals',
 'fx/ice/frost-nova.js::draw':'nova_draw',
 'fx/fire/fire-ring.js::scorch':'fire_ring_scorch',
 'fx/fire/fire-ring.js::flames':'fire_ring_flames',
 'fx/ice/frost-nova.js::frost':'nova_frost',
 'fx/ice/frost-nova.js::ring':'nova_ring',
 'fx/holy/divine-shield.js::draw':'shield_draw',
 'fx/holy/divine-shield.js::film':'shield_film',
 'fx/holy/divine-shield.js::lattice':'shield_lattice',
 'fx/holy/heal.js::petal':'heal_petal',
 'fx/holy/resurrection.js::halo':'resurrection_halo',
 'fx/holy/resurrection.js::pool':'resurrection_pool',
 'fx/holy/resurrection.js::shaft':'resurrection_shaft',
 'fx/holy/resurrection.js::body':'resurrection_body',
 'fx/holy/resurrection.js::drawBack':'resurrection_back',
 'fx/holy/resurrection.js::draw':'resurrection_draw',
 'fx/holy/resurrection.js::drawWing':'resurrection_draw_wing',
 'fx/holy/resurrection.js::wing':'resurrection_wing',
 'fx/holy/resurrection.js::along':'wing_along',
 'fx/ice/_lib.js::Panes.draw':'panes_draw',
 'fx/ice/_lib.js::Panes.update':'panes_update',
 'fx/holy/_lib.js::Feathers.draw':'feathers_draw',
 'fx/holy/_lib.js::Feathers.update':'feathers_update',
 'fx/ice/freeze.js::on':'freeze_on',
 'fx/ice/_lib.js::inPoly':'ice_in_poly',
 'fx/ice/_lib.js::centroid':'ice_centroid',
 'fx/ice/_lib.js::iceOf':'ice_of',
 'fx/ice/freeze.js::floorFrost':'freeze_floor',
 'fx/ice/freeze.js::drawCharacter':'freeze_character',
 'fx/ice/freeze.js::drawBlock':'freeze_block',
};
const exportCache=new Map();
function moduleExports(mod){
 if(exportCache.has(mod))return exportCache.get(mod);
 const names=new Set();exportCache.set(mod,names);
 const ast=parse(fs.readFileSync(upstream+'/src/'+mod,'utf8'),{ecmaVersion:'latest',sourceType:'module'});
 for(const n of ast.body){
  if(n.type==='ExportAllDeclaration')for(const name of moduleExports(path.posix.normalize(path.posix.join(path.posix.dirname(mod),n.source.value))))names.add(name);
  if(n.type==='ExportNamedDeclaration'){
   if(n.declaration)for(const name of n.declaration.type==='VariableDeclaration'?n.declaration.declarations.map(d=>d.id.name):[n.declaration.id.name])names.add(name);
   else for(const s of n.specifiers)names.add(s.exported.name);
  }
 }
 return names;
}
function compile(mod,source){
 const ast=parse(source,{ecmaVersion:'latest',sourceType:'module'});let serial=0,functions=[],imported=new Map(),loops=[],fastFunctions={},shaderFunctions=[];
 function label(node,owner=''){
  if(!node||typeof node!=='object')return;
  if(node.type==='ClassDeclaration')owner=node.id.name;
  if(node.type==='FunctionDeclaration'){node._nativeName=node.id.name;owner=node.id.name;}
  if(node.type==='VariableDeclarator'&&['FunctionExpression','ArrowFunctionExpression'].includes(node.init?.type)){node.init._nativeName=node.id.name;owner=node.id.name;}
  if(['MethodDefinition','Property'].includes(node.type)&&['FunctionExpression','ArrowFunctionExpression'].includes(node.value?.type)){node.value._nativeName=(node.type==='MethodDefinition'?owner+'.':'')+(node.key.name??node.key.value);owner=node.value._nativeName;}
  if(node.type==='CallExpression')node.arguments.forEach((arg,i)=>{if(['ArrowFunctionExpression','FunctionExpression'].includes(arg.type))arg._nativeName=owner+'.'+(node.callee.name??node.callee.property?.name??'call')+'.callback'+i;});
  for(const [key,value]of Object.entries(node))if(!key.startsWith('_')){if(Array.isArray(value))for(const child of value)label(child,owner);else if(value&&typeof value==='object')label(value,owner);}
 }
 label(ast);
 const resolved=s=>path.posix.normalize(path.posix.join(path.posix.dirname(mod),s));
 for(const n of ast.body)if(n.type==='ImportDeclaration')for(const s of n.specifiers)imported.set(s.local.name,{module:resolved(n.source.value),name:s.imported?.name??null});
 const tmp=()=>`_v${serial++}`;
 const ref=(n,env)=>`_S.read(${env}, ${q(n)})`;
 const list=(args,env)=>args.some(x=>x.type==='SpreadElement')?`_S.concat([${args.map(x=>x.type==='SpreadElement'?`_S.array(${expr(x.argument,env)})`:`[${expr(x,env)}]`).join(', ')}])`:`[${args.map(x=>expr(x,env)).join(', ')}]`;
 function func(n,env){
  if(n._generated===undefined){n._generated=functions.length;functions.push(null);const method='_f'+n._generated;
   if(accelerated[mod+'::'+n._nativeName])fastFunctions[method]=accelerated[mod+'::'+n._nativeName];
   let body=`static func ${method}(_parent, _args: Array, _this=null):\n\tvar _e = _S.scope(_parent)\n`;
   if(n.type!=='ArrowFunctionExpression')body+=`\t_S.define(_e, "this", _this)\n`;
   n.params.forEach((p,i)=>body+=bind(p,p.type==='RestElement'?`_args.slice(${i})`:`_S.arg(_args, ${i})`,'_e',1));
   if(n.body.type==='BlockStatement')body+=bodyCode(n.body.body,'_e',1);else body+=`\treturn ${expr(n.body,'_e')}\n`;
   if(!/\n\treturn [^\n]+\n$/.test(body))body+='\treturn null\n';
   if(mod!=='core/math.js'&&mod!=='core/color.js'&&mod!=='fx/shadow/curse.js'&&mod!=='core/fx.js'&&!(mod==='fx/transitions/burn-away.js'&&n._nativeName==='draw')&&!(process.env.PIXELFX_CODEGEN_NO_DIRECT??'').split(',').includes(mod)) {
    try {
     body=directFunction(n,method,{q,imported});
     const shader=mod==='fx/explosions/_lib.js'?shaderFactory(n,method,body,{imported}):'';
     if(shader){shaderFunctions.push(method);body+='\n'+shader;}
    } catch(error) {
     // Unsupported closure/control flow retains full semantics.
     if(process.env.PIXELFX_CODEGEN_DEBUG)console.error(mod+'::'+(n._nativeName??method)+': '+error.message);
    }
   }
   functions[n._generated]=body;
  }
  return `_S.function_value(${env}, ${q('_f'+n._generated)})`;
 }
 function bind(p,value,env,d){
  if(p.type==='Identifier')return tab(d)+`_S.define(${env}, ${q(p.name)}, ${value})\n`;
  if(p.type==='RestElement')return bind(p.argument,value,env,d);
  if(p.type==='AssignmentPattern')return bind(p.left,`_S.coalesce(${value}, func(): return ${expr(p.right,env)})`,env,d);
  const v=tmp();let out=tab(d)+`var ${v} = ${value}\n`;
  if(p.type==='ArrayPattern')p.elements.forEach((x,i)=>{if(x)out+=bind(x,x.type==='RestElement'?`_S.array(${v}).slice(${i})`:`_S.prop(${v}, ${i})`,env,d);});
  else if(p.type==='ObjectPattern'){const keys=p.properties.filter(x=>x.type!=='RestElement').map(x=>x.key.name??x.key.value);for(const x of p.properties)out+=bind(x.type==='RestElement'?x.argument:x.value,x.type==='RestElement'?`_S.omit(${v}, ${q(keys)})`:`_S.prop(${v}, ${x.computed?expr(x.key,env):q(x.key.name??x.key.value)})`,env,d);}
  else throw Error('binding '+p.type);
  return out;
 }
 function assign(n,value,env,op='=',post=false){
  if(n.type==='Identifier')return `_S.write(${env}, ${q(n.name)}, ${value}, ${q(op)}, ${post})`;
  if(n.type==='MemberExpression')return `_S.set_prop(${expr(n.object,env)}, ${n.computed?expr(n.property,env):q(n.property.name)}, ${value}, ${q(op)}, ${post})`;
  if(n.type==='ArrayPattern')return `_S.destructure_targets(${value}, [${n.elements.map(x=>!x?'null':x.type==='Identifier'?`{"scope":${env},"key":${q(x.name)}}`:`{"object":${expr(x.object,env)},"key":${x.computed?expr(x.property,env):q(x.property.name)}}`).join(', ')}])`;
  throw Error('assignment '+n.type);
 }
 function expr(n,env){
  if(!n)return 'null';
  switch(n.type){
   case 'Literal':if(n.regex)return `_S.regex(${q(n.regex.pattern)}, ${q(n.regex.flags)})`;return n.value===null?'null':typeof n.value==='number'?(Number.isFinite(n.value)?String(n.value):'INF'):q(n.value);
   case 'Identifier':return n.name==='undefined'?'null':n.name==='Infinity'?'INF':n.name==='NaN'?'NAN':ref(n.name,env);
   case 'Super':return `_S.super_value(_S.read(${env}, "this"))`;
   case 'ThisExpression':return `_S.read(${env}, "this")`;
   case 'ChainExpression':return expr(n.expression,env);
   case 'ArrayExpression':return list(n.elements.map(x=>x??{type:'Literal',value:null}),env);
   case 'ObjectExpression':return `_S.merge([${n.properties.map(p=>p.type==='SpreadElement'?expr(p.argument,env):p.kind==='get'?`{"__getters": {${q(String(p.key.name??p.key.value))}: ${func(p.value,env)}}}`:`{${p.computed?`_S.string(${expr(p.key,env)})`:q(String(p.key.name??p.key.value))}: ${expr(p.value,env)}}`).join(', ')}])`;
   case 'MemberExpression':return `_S.prop(${expr(n.object,env)}, ${n.computed?expr(n.property,env):q(n.property.name)})`;
   case 'ArrowFunctionExpression':case 'FunctionExpression':return func(n,env);
   case 'ConditionalExpression':return `(${expr(n.consequent,env)} if _S.truth(${expr(n.test,env)}) else ${expr(n.alternate,env)})`;
   case 'LogicalExpression':return `_S.logical(${q(n.operator)}, ${expr(n.left,env)}, func(): return ${expr(n.right,env)})`;
   case 'BinaryExpression':{
    // A missing Map entry converts to NaN in numeric comparisons; an explicit null converts to zero.
    const operand=v=>['<','>','<=','>='].includes(n.operator)&&v.type==='CallExpression'&&v.callee.type==='MemberExpression'&&!v.callee.computed&&v.callee.property.name==='get'?`_S.relational_get(${expr(v.callee.object,env)}, ${list(v.arguments,env)})`:expr(v,env);
    return `_S.binary(${q(n.operator)}, ${operand(n.left)}, ${operand(n.right)})`;
   }
   case 'UnaryExpression':if(n.operator==='delete')return `_S.delete_prop(${expr(n.argument.object,env)}, ${n.argument.computed?expr(n.argument.property,env):q(n.argument.property.name)})`;return `_S.unary(${q(n.operator)}, ${expr(n.argument,env)})`;
   case 'AssignmentExpression':return assign(n.left,expr(n.right,env),env,n.operator);
   case 'UpdateExpression':return assign(n.argument,'1',env,n.operator==='++'?'+=':'-=',!n.prefix);
   case 'SequenceExpression':return `_S.last([${n.expressions.map(x=>expr(x,env)).join(', ')}])`;
   case 'TemplateLiteral':return '('+n.quasis.flatMap((x,i)=>[q(x.value.cooked),...(i<n.expressions.length?[`_S.string(${expr(n.expressions[i],env)})`]:[])]).join(' + ')+')';
   case 'CallExpression':if(n.optional)return `_S.optional_call(${expr(n.callee,env)}, ${list(n.arguments,env)})`;if(n.callee.type==='MemberExpression')return `_S.invoke(${expr(n.callee.object,env)}, ${n.callee.computed?expr(n.callee.property,env):q(n.callee.property.name)}, ${list(n.arguments,env)})`;return `_S.call_value(${expr(n.callee,env)}, ${list(n.arguments,env)})`;
   case 'NewExpression':return `_S.construct(${expr(n.callee,env)}, ${list(n.arguments,env)})`;
   default:throw Error('expression '+n.type);
  }
 }
 function bodyCode(nodes,env,d){
  let out='';for(const n of nodes)if(n.type==='FunctionDeclaration')out+=bind(n.id,func(n,env),env,d);
  for(const n of nodes)if(n.type!=='FunctionDeclaration')out+=stmt(n,env,d);
  return out||tab(d)+'pass\n';
 }
 function stmt(n,env,d){
  if(!n)return '';let out='';
  if(mod==='fx/impacts/impact-frame.js'&&n.type==='ForStatement'&&n.init?.declarations?.[0]?.id?.name==='f'&&n.test?.right?.value===8)
   return tab(d)+'_S.Accelerators.GeometryKernels.impact_frame_masks('+env+')\n';
  if(mod==='fx/transitions/burn-away.js'&&n.type==='ForStatement'&&n.init?.declarations?.[0]?.id?.name==='j'&&['c0','a0'].includes(n.init.declarations[0].init?.name))
   return tab(d)+'_S.Accelerators.TransitionKernels.burn_slice('+env+','+(n.init.declarations[0].init.name==='c0')+')\n';
  if(mod==='fx/transitions/burn-away.js'&&n.type==='ForStatement'&&n.init?.declarations?.[0]?.id?.name==='i'&&JSON.stringify(n.body).includes('vein'))
   return tab(d)+'_S.Accelerators.TransitionKernels.burn_initialize('+env+')\n';
  switch(n.type){
   case 'BlockStatement':{const scope=tmp();return tab(d)+`var ${scope} = _S.scope(${env})\n`+bodyCode(n.body,scope,d);}
   case 'VariableDeclaration':return n.declarations.map(x=>bind(x.id,expr(x.init,env),env,d)).join('');
   case 'ExpressionStatement':return tab(d)+expr(n.expression,env)+'\n';
   case 'ReturnStatement':return tab(d)+'return '+expr(n.argument,env)+'\n';
   case 'IfStatement':return tab(d)+`if _S.truth(${expr(n.test,env)}):\n`+(stmt(n.consequent,env,d+1)||tab(d+1)+'pass\n')+(n.alternate?tab(d)+'else:\n'+stmt(n.alternate,env,d+1):'');
   case 'ForStatement':{const se=tmp();out+=tab(d)+`var ${se} = _S.scope(${env})\n`;out+=n.init?(n.init.type==='VariableDeclaration'?stmt(n.init,se,d):tab(d)+expr(n.init,se)+'\n'):'';loops.push({update:n.update,env:se});out+=tab(d)+`while ${n.test?'_S.truth('+expr(n.test,se)+')':'true'}:\n`+stmt(n.body,se,d+1);if(n.update)out+=tab(d+1)+`${se} = _S.iteration(${se})\n`+tab(d+1)+expr(n.update,se)+'\n';loops.pop();return out;}
   case 'ForOfStatement':case 'ForInStatement':{const item=tmp(),se=tmp();out=tab(d)+`for ${item} in _S.${n.type==='ForInStatement'?'keys':'array'}(${expr(n.right,env)}):\n`+tab(d+1)+`var ${se} = _S.scope(${env})\n`;out+=n.left.type==='VariableDeclaration'?bind(n.left.declarations[0].id,item,se,d+1):tab(d+1)+assign(n.left,item,env)+'\n';loops.push({});out+=stmt(n.body,se,d+1);loops.pop();return out;}
   case 'WhileStatement':loops.push({});out=tab(d)+`while _S.truth(${expr(n.test,env)}):\n`+stmt(n.body,env,d+1);loops.pop();return out;
   case 'DoWhileStatement':loops.push({});out=tab(d)+'while true:\n'+stmt(n.body,env,d+1)+tab(d+1)+`if not _S.truth(${expr(n.test,env)}): break\n`;loops.pop();return out;
   case 'ContinueStatement':{const l=loops.at(-1);if(l?.switch)return tab(d)+`${l.continuing} = true\n`+tab(d)+'break\n';return (l?.update?tab(d)+`${l.env} = _S.iteration(${l.env})\n`+tab(d)+expr(l.update,l.env)+'\n':'')+tab(d)+'continue\n';}
   case 'BreakStatement':return tab(d)+'break\n';
   case 'SwitchStatement':{
    const value=tmp(),active=tmp(),continuing=tmp();
    out=tab(d)+`var ${value} = ${expr(n.discriminant,env)}\n`+tab(d)+`var ${active} = false\n`+tab(d)+`var ${continuing} = false\n`+tab(d)+'while true:\n';
    loops.push({switch:true,continuing});
    for(const c of n.cases){out+=tab(d+1)+`if ${active} or ${c.test?'_S.binary("===", '+value+', '+expr(c.test,env)+')':'true'}:\n`+tab(d+2)+`${active} = true\n`+bodyCode(c.consequent,env,d+2);}
    loops.pop();out+=tab(d+1)+'break\n';
    if(loops.length)out+=tab(d)+`if ${continuing}:\n`+stmt({type:'ContinueStatement'},env,d+1);
    return out;
   }
   case 'ThrowStatement':return tab(d)+`_S.fail(${expr(n.argument,env)})\n`+tab(d)+'return null\n';
   case 'EmptyStatement':return tab(d)+'pass\n';
   case 'ClassDeclaration':{const methods=[],getters=[],setters=[];let ctor='null';for(const m of n.body.body){const fn=func(m.value,env),name=q(m.key.name??m.key.value);if(m.kind==='constructor')ctor=fn;else (m.kind==='get'?getters:m.kind==='set'?setters:methods).push(`${name}: ${fn}`);}return bind(n.id,`_S.class_value(${q(n.id.name)}, ${ctor}, {${methods.join(', ')}}, {${getters.join(', ')}}, {${setters.join(', ')}}, ${n.superClass?expr(n.superClass,env):'null'})`,env,d);}
   case 'FunctionDeclaration':return '';
   default:throw Error('statement '+n.type);
  }
 }
 let build='static func build(_script) -> Dictionary:\n\tvar _e = _S.scope(null, _script)\n\tvar _exports: Dictionary = {}\n';
 for(const [name,binding] of imported)build+=tab(1)+`_S.define(_e, ${q(name)}, _S.import_value(${q(binding.module)}, ${q(binding.name)}))\n`;
 const body=[];
 for(const n of ast.body){
  if(n.type==='ImportDeclaration')continue;
  if(n.type==='ExportAllDeclaration'){for(const name of moduleExports(resolved(n.source.value)))body.push({custom:tab(1)+`_exports[${q(name)}] = _S.import_value(${q(resolved(n.source.value))}, ${q(name)})\n`});continue;}
  if(n.type==='ExportNamedDeclaration'){
   if(n.declaration){body.push(n.declaration);const ns=n.declaration.type==='VariableDeclaration'?n.declaration.declarations.map(x=>x.id.name):[n.declaration.id.name];for(const name of ns)body.push({custom:tab(1)+`_exports[${q(name)}] = ${ref(name,'_e')}\n`});}
   else for(const s of n.specifiers)body.push({custom:tab(1)+`_exports[${q(s.exported.name)}] = ${n.source?`_S.import_value(${q(resolved(n.source.value))}, ${q(s.local.name)})`:ref(s.local.name,'_e')}\n`});
  }else body.push(n);
 }
 for(const n of body)if(n.type==='FunctionDeclaration')build+=bind(n.id,func(n,'_e'),'_e',1);
 for(const n of body) {
  // This immutable lookup is populated after the standing mask, once per module.
  if(mod==='core/act.js'&&n.type==='ForStatement'&&n.init?.declarations?.[0]?.id?.name==='r') {
   build+='\t_S.initialize_actor_lookup(_e)\n';
  } else build+=n.custom??(n.type==='FunctionDeclaration'?'':stmt(n,'_e',1));
 }
 build+='\t_exports["__scope"] = _e\n\treturn _exports\n';
 return '@tool\nextends RefCounted\n## Generated native GDScript from pinned PixelFX '+mod+'; MIT Patch / Hugo Duprez.\n## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.\nconst _S = preload("../semantics.gd")\n'+(Object.keys(fastFunctions).length?'const ACCELERATED = '+q(fastFunctions)+'\n':'')+(shaderFunctions.length?'const SHADERS = '+q(shaderFunctions)+'\n':'')+build+'\n'+functions.join('\n');
}
if(process.env.PIXELFX_CODEGEN_FIXTURE){
 const source=fs.readFileSync(process.env.PIXELFX_CODEGEN_FIXTURE,'utf8');
 fs.writeFileSync(root+'/tests/pixelfx/native_semantics_generated.gd',compile('acceptance-fixture.js',source).replace('preload("../semantics.gd")','preload("res://addons/pixelfx/native/semantics.gd")'));process.exit(0);
}
const files=fs.readdirSync(upstream+'/src/core').filter(n=>n.endsWith('.js')).map(n=>'core/'+n);
for(const cat of fs.readdirSync(upstream+'/src/fx',{withFileTypes:true}).filter(d=>d.isDirectory()))
 for(const f of fs.readdirSync(upstream+'/src/fx/'+cat.name).filter(n=>n.endsWith('.js')))files.push('fx/'+cat.name+'/'+f);
files.push('fx/index.js','fx/categories.js');
for(const mod of files)registry[mod]='res://addons/pixelfx/native/compiled/'+mod.replaceAll('/','__').replace('.js','.gd');
if(process.env.PIXELFX_CODEGEN_MODULES){
 for(const mod of process.env.PIXELFX_CODEGEN_MODULES.split(','))fs.writeFileSync(root+'/'+registry[mod].replace('res://',''),compile(mod,fs.readFileSync(upstream+'/src/'+mod,'utf8')));
 process.exit(0);
}
for(const mod of files){if(mod==='core/painter.js')continue;const source=fs.readFileSync(upstream+'/src/'+mod,'utf8');try{const code=compile(mod,source);fs.writeFileSync(root+'/'+registry[mod].replace('res://',''),code);manifest.push({source:'src/'+mod,sha256:crypto.createHash('sha256').update(source).digest('hex'),generated:registry[mod]});}catch(e){throw Error(mod+': '+e.stack);}}
fs.writeFileSync(root+'/addons/pixelfx/native/registry.gd','@tool\nextends RefCounted\nconst PATHS = '+q(registry)+'\n');
fs.writeFileSync(root+'/addons/pixelfx/native/sources.json',q({upstream_revision:'a84159688af3ca37a4be05a0d422b94451b2e24e',license:'MIT',modules:manifest,native_painter_source:{path:'src/core/painter.js',sha256:crypto.createHash('sha256').update(fs.readFileSync(upstream+'/src/core/painter.js')).digest('hex'),implementation:['addons/pixelfx/core/painter.gd','addons/pixelfx/native/painter.gd']}},null,2)+'\n');
const ledger=JSON.parse(fs.readFileSync(root+'/docs/migration-status.json'));const previousCatalog=root+'/addons/pixelfx/native/catalog.json';const declared=fs.existsSync(previousCatalog)?new Set(JSON.parse(fs.readFileSync(previousCatalog)).map(x=>x.source)):null;const pending=ledger.entries.filter(x=>declared?declared.has(x.effect):x.status!=='完成');
const configs=[];
for(const row of pending){const mod=(await import(pathToFileURL(upstream+'/'+row.source.path))),meta=mod.meta;if(!meta)throw Error('No metadata '+row.effect);const ident=row.effect.split('/')[1].replaceAll('-','_');const gpath='addons/pixelfx/effects/'+row.effect.replaceAll('-','_')+'.gd';
 const data={id:'pixelfx.'+ident,...meta,cacheable:false,layers:typeof mod.drawBack==='function'||typeof mod.create==='function'?['back','front']:['front'],migration_status:'ported_pending_acceptance'};
 const code='@tool\nextends "../../native/effect_adapter.gd"\n## Source '+row.source.path+'; MIT Patch / Hugo Duprez.\nconst META = '+q(data)+'\nfunc metadata() -> Dictionary: return META\nfunc source_module() -> String: return '+q(row.source.path.replace('src/',''))+'\n';
 fs.mkdirSync(path.dirname(root+'/'+gpath),{recursive:true});fs.writeFileSync(root+'/'+gpath,code);
 fs.writeFileSync(root+'/addons/pixelfx/presets/'+ident+'.tres','[gd_resource type="Resource" script_class="PixelFXPreset" load_steps=3 format=3]\n\n[ext_resource type="Script" path="res://addons/pixelfx/resources/preset.gd" id="1"]\n[ext_resource type="Script" path="res://'+gpath+'" id="2"]\n\n[resource]\nscript = ExtResource("1")\ndisplay_name = '+q(meta.name)+'\nimplementation = ExtResource("2")\n');
 configs.push({source:row.effect,id:ident,implementation:gpath,stateful:typeof mod.create==='function',meta:data,batch:row.batch});
}
fs.writeFileSync(root+'/addons/pixelfx/native/catalog.json',q(configs)+'\n');
console.log('Generated',manifest.length,'native dependency modules and',configs.length,'new effects.');
