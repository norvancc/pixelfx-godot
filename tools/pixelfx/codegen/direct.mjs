/** Direct local numeric bodies; JS semantics remain at API boundaries. */
export function directFunction(node, method, {q,imported}) {
 node=renameLocals(structuredClone(node));
 const locals=new Set(),free=new Set(),loops=[],declared=new Set();
 // JS permits different values in disjoint block scopes. Use the semantic compiler
 // whenever a flattened local name would shadow another binding.
 const name=s=>'_n_'+s;
 function walk(n){
  if(!n||typeof n!=='object')return;
  if(['ArrowFunctionExpression','FunctionExpression','FunctionDeclaration'].includes(n.type)&&n!==node)return;
  if(n.type==='VariableDeclarator')bindNames(n.id);
  for(const [k,v]of Object.entries(n))if(!k.startsWith('_')){if(Array.isArray(v))v.forEach(walk);else if(v&&typeof v==='object')walk(v);}
 }
 function bindNames(n){if(n.type==='Identifier')locals.add(n.name);else if(n.type==='AssignmentPattern')bindNames(n.left);else if(n.type==='ArrayPattern')n.elements.filter(Boolean).forEach(bindNames);else if(n.type==='ObjectPattern')n.properties.forEach(p=>bindNames(p.value));else throw Error('pattern '+n.type);}
 node.params.forEach(bindNames);walk(node);
 const tab=d=>'\t'.repeat(d),read=s=>locals.has(s)?name(s):s==='undefined'?'null':s==='Infinity'?'INF':s==='NaN'?'NAN':(free.add(s),name(s));
 const args=(a,d)=>'['+a.map(v=>expr(v,d)).join(', ')+']';
 const member=(n,d)=>n.computed?expr(n.property,d):q(n.property.name);
 function expr(n,d=1){
  if(!n)return 'null';
  switch(n.type){
   case 'Literal':if(n.regex)throw Error('regex literal');return q(n.value);
   case 'TemplateLiteral':return '('+n.quasis.map((part,i)=>q(part.value.cooked)+(i<n.expressions.length?' + _S.string('+expr(n.expressions[i],d)+')':'')).join(' + ')+')';
   case 'Identifier':return read(n.name);
   case 'ThisExpression':return node.type==='ArrowFunctionExpression'?read('this'):'_this';
   case 'ArrayExpression':return n.elements.some(e=>e?.type==='SpreadElement')?'_S.concat(['+n.elements.map(e=>e?.type==='SpreadElement'?'_S.array('+expr(e.argument,d)+')':'['+expr(e,d)+']').join(',')+'])':args(n.elements,d);
   case 'ObjectExpression':if(n.properties.some(p=>p.type!=='Property'||p.computed||p.kind!=='init'))throw Error('dynamic object');return '{'+n.properties.map(p=>q(String(p.key.name??p.key.value))+':'+expr(p.value,d)).join(',')+'}';
   case 'MemberExpression':
    if(n.optional)throw Error('optional property');
    if(n.object.name==='Math')return {PI:'PI',SQRT2:'sqrt(2.0)'}[n.property.name]??(()=>{throw Error('Math property');})();
    if(!n.computed&&n.property.name==='length')return '_S.prop('+expr(n.object,d)+',"length")';
    return (n.computed?'_S.index_value(':'_S.named_value(')+expr(n.object,d)+','+member(n,d)+')';
   case 'BinaryExpression':{
    if(JSON.stringify(n).includes('get')&&['<','>','<=','>='].includes(n.operator))throw Error('nullable comparison');
    const a=expr(n.left,d),b=expr(n.right,d),op=n.operator;
    if(op==='**')return 'pow('+a+','+b+')';
    if(op==='/')return '(float('+a+')/'+b+')';
    if(op==='%')return 'fmod('+a+','+b+')';
    if(['&','|','^','<<','>>','>>>'].includes(op))return '_S.binary('+q(op)+','+a+','+b+')';
    if(['===','!=='].includes(op))return '_S.binary('+q(op)+','+a+','+b+')';
    if(op==='+'&&[n.left,n.right].some(v=>v.type==='Literal'&&typeof v.value==='string'))throw Error('string coercion');
    return '('+a+' '+op+' '+b+')';
   }
   case 'LogicalExpression':{
    const a=expr(n.left,d),b=expr(n.right,d);
    if(JSON.stringify(n.left).includes('CallExpression'))return '_S.logical('+q(n.operator)+','+a+',func():return '+b+')';
    return n.operator==='&&'?'('+b+' if _S.truth('+a+') else '+a+')':n.operator==='||'?'('+a+' if _S.truth('+a+') else '+b+')':'('+a+' if '+a+'!=null else '+b+')';
   }
   case 'ConditionalExpression':return '('+expr(n.consequent,d)+' if _S.truth('+expr(n.test,d)+') else '+expr(n.alternate,d)+')';
   case 'UnaryExpression':if(['typeof','+','~'].includes(n.operator))return '_S.unary('+q(n.operator)+','+expr(n.argument,d)+')';if(!['!','-','void'].includes(n.operator))throw Error('unary '+n.operator);if(n.operator==='!')return 'not _S.truth('+expr(n.argument,d)+')';if(n.operator==='void')throw Error('void value');return '('+n.operator+expr(n.argument,d)+')';
   case 'CallExpression':{
    if(n.optional)throw Error('optional call');
    if(n.arguments.some(x=>x.type==='SpreadElement'))throw Error('spread argument');
    if(n.callee.type==='Identifier'&&!locals.has(n.callee.name)&&imported.has(n.callee.name)) {
     const binding=imported.get(n.callee.name),op=binding.name,aa=n.arguments.map(x=>expr(x,d));
     if(binding.module==='fx/weather/_lib.js'&&op==='sample')return '_S.Accelerators.Weather.sample_at('+aa.join(',')+')';
     if(op==='bayer')return '((_S.Painter.BAYER[((floori('+aa[1]+')&3)<<2)|(floori('+aa[0]+')&3)]+0.5)/16.0)';
     if(binding.module.startsWith('core/')) {
      const noise={tileNoise:'tile_noise',tileFbm:'tile_fbm',noise2:'noise2',fbm:'fbm',loopNoise:'loop_noise'}[op];
      if(noise)return '_S.NoiseKernels.'+noise+'('+aa.join(',')+')';
      if(op==='clamp')return 'clampf('+[aa[0],aa[1]??'0.0',aa[2]??'1.0'].join(',')+')';
      // Arguments can advance an RNG. Evaluate each once, in source order.
      if(op==='lerp')return '_S.numeric_lerp('+aa.join(',')+')';
      if(op==='rand'||op==='rng')return '_S.MathFX.'+op+'(['+aa.join(',')+'])';
      if(['smooth','seg','bump','fract','noise'].includes(op))return '_S.MathFX.'+op+'('+aa.join(',')+')';
      if(['fit','mix','luma','rgb'].includes(op))return '_S.ColorFX.'+op+'('+aa.join(',')+')';
      if(op==='scale')return '_S.ColorFX.scale_color('+aa.join(',')+')';
     }
    }
    if(n.callee.type==='MemberExpression'&&n.callee.object.name==='Math'){
     const op=n.callee.property.name,aa=n.arguments.map(x=>expr(x,d));
     if(op==='min'||op==='max')return aa.slice(1).reduce((a,b)=>op+'f('+a+','+b+')',aa[0]);
     const f={round:'floori',floor:'floori',ceil:'ceili',trunc:'int',abs:'absf',sign:'signf',sin:'sin',cos:'cos',tan:'tan',asin:'asin',acos:'acos',atan:'atan',atan2:'atan2',exp:'exp',pow:'pow',sqrt:'sqrt',log:'log',hypot:null}[op];
     if(op==='log2')return '(log('+aa[0]+')/log(2.0))';
     if(op==='cbrt')return '(signf('+aa[0]+')*pow(absf('+aa[0]+'),1.0/3))';
     if(op==='hypot')return '_S.Bridge.hypot('+args(n.arguments,d)+')';
     if(!f)throw Error('Math '+op);return f+'('+aa.join(',')+(op==='round'?'+0.5':'')+')';
    }
    if(n.callee.type==='MemberExpression')return '_S.invoke('+expr(n.callee.object,d)+','+member(n.callee,d)+','+args(n.arguments,d)+')';
    return '_S.call_value('+expr(n.callee,d)+','+args(n.arguments,d)+')';
   }
   case 'NewExpression':if(n.arguments.some(e=>e.type==='SpreadElement'))throw Error('spread constructor');return '_S.construct('+expr(n.callee,d)+','+args(n.arguments,d)+')';
   case 'ArrowFunctionExpression':case 'FunctionExpression':{
    if(n._generated===undefined)throw Error('uncompiled callback');
    const captures=n._captures.map(([key,value])=>{
     if(!declared.has(value))throw Error('capture before declaration');
     return q(key)+':'+read(value);
    });
    if(n.type==='ArrowFunctionExpression')captures.push('"this":'+(node.type==='ArrowFunctionExpression'?read('this'):'_this'));
    return '_S.function_value(_S.capture(_parent,{'+captures.join(',')+'}),'+q('_f'+n._generated)+')';
   }
   case 'SequenceExpression':throw Error('sequence value');
   case 'AssignmentExpression':
    if(n.left.type!=='MemberExpression')throw Error('local assignment value');
    return '_S.set_prop('+expr(n.left.object,d)+','+member(n.left,d)+','+expr(n.right,d)+','+q(n.operator)+')';
   default:throw Error('expression '+n.type);
  }
 }
 function bind(p,value,d,declare=true){
  if(p.type==='Identifier'){if(declared.has(p.name))throw Error('shadowed local');declared.add(p.name);return tab(d)+(declare?'var ':'')+name(p.name)+' = '+value+'\n';}
  if(p.type==='AssignmentPattern')return bind(p.left,'_S.coalesce('+value+',func():return '+expr(p.right,d)+')',d,declare);
  if(p.type==='ArrayPattern'){const tmp='_tuple_'+serial++;return tab(d)+'var '+tmp+' = '+value+'\n'+p.elements.map((p,i)=>p?bind(p,'_S.prop('+tmp+','+i+')',d,declare):'').join('');}
  if(p.type==='ObjectPattern'){
   if(p.properties.some(p=>p.type!=='Property'||p.computed))throw Error('dynamic pattern');
   const tmp='_object_'+serial++;
   return tab(d)+'var '+tmp+' = '+value+'\n'+p.properties.map(p=>bind(p.value,'_S.named_value('+tmp+','+q(String(p.key.name??p.key.value))+')',d,declare)).join('');
  }
  throw Error('binding '+p.type);
 }
 let serial=0;
 function statementExpr(n,d){
  if(n.type==='SequenceExpression')return n.expressions.map(x=>statementExpr(x,d)).join('');
  if(n.type==='UpdateExpression'&&(n.argument.type!=='Identifier'||!locals.has(n.argument.name)))throw Error('outer update');
  if(n.type==='UpdateExpression')return tab(d)+expr(n.argument,d)+(n.operator==='++'?' += 1.0':' -= 1.0')+'\n';
  if(n.type==='AssignmentExpression'){
   if(n.left.type==='Identifier'&&n.right.type==='UpdateExpression'&&n.right.argument.type==='Identifier'&&n.right.prefix===false) {
    if(!locals.has(n.left.name)||!locals.has(n.right.argument.name))throw Error('outer update');
    return tab(d)+read(n.left.name)+' = '+read(n.right.argument.name)+'\n'+statementExpr(n.right,d);
   }
   if(n.left.type==='Identifier'&&!locals.has(n.left.name))throw Error('outer assignment');
   if(n.left.type==='Identifier')return tab(d)+read(n.left.name)+' '+n.operator+' '+expr(n.right,d)+'\n';
   return tab(d)+'_S.set_prop('+expr(n.left.object,d)+','+member(n.left,d)+','+expr(n.right,d)+','+q(n.operator)+')\n';
  }
  if(n.type==='UnaryExpression'&&n.operator==='void')return statementExpr(n.argument,d);
  if(n.type==='LogicalExpression'&&n.operator==='&&')return tab(d)+'if _S.truth('+expr(n.left,d)+'):\n'+statementExpr(n.right,d+1);
  return tab(d)+expr(n,d)+'\n';
 }
 function stmt(n,d){
  switch(n.type){
   case 'VariableDeclaration':return n.declarations.map(v=>bind(v.id,expr(v.init,d),d)).join('');
   case 'ExpressionStatement':return statementExpr(n.expression,d);
   case 'BlockStatement':return n.body.map(x=>stmt(x,d)).join('')||tab(d)+'pass\n';
   case 'IfStatement':return tab(d)+'if _S.truth('+expr(n.test,d)+'):\n'+stmt(n.consequent,d+1)+(n.alternate?tab(d)+'else:\n'+stmt(n.alternate,d+1):'');
   case 'ReturnStatement':if(n.argument?.type==='UnaryExpression'&&n.argument.operator==='void')return statementExpr(n.argument.argument,d)+tab(d)+'return null\n';return tab(d)+'return '+expr(n.argument,d)+'\n';
   case 'ContinueStatement':return (loops.at(-1)?statementExpr(loops.at(-1),d):'')+tab(d)+'continue\n';
   case 'BreakStatement':return tab(d)+'break\n';
   case 'ForStatement':{
    const init=n.init?(n.init.type==='VariableDeclaration'?stmt(n.init,d+1):statementExpr(n.init,d+1)):'';
    loops.push(n.update);const body=stmt(n.body,d+2)+statementExpr(n.update,d+2);loops.pop();
    return tab(d)+'if true:\n'+init+tab(d+1)+'while _S.truth('+expr(n.test,d+1)+'):\n'+body;
   }
   case 'ForOfStatement':{
    const p=n.left.declarations[0].id;const tmp='_iter_'+serial++;loops.push(null);const body=bind(p,tmp,d+1)+stmt(n.body,d+1);loops.pop();return tab(d)+'for '+tmp+' in _S.array('+expr(n.right,d)+'):\n'+body;
   }
   case 'WhileStatement':loops.push(null);var body=stmt(n.body,d+1);loops.pop();return tab(d)+'while _S.truth('+expr(n.test,d)+'):\n'+body;
   default:throw Error('statement '+n.type);
  }
 }
 let body=node.params.map((p,i)=>bind(p,'_S.arg(_args,'+i+')',1)).join('')+(node.body.type==='BlockStatement'?stmt(node.body,1):'\treturn '+expr(node.body,1)+'\n');
 return 'static func '+method+'(_parent,_args:Array,_this=null):\n'+[...free].map(s=>'\tvar '+name(s)+' = _S.read(_parent,'+q(s)+')\n').join('')+body+'\treturn null\n';
}

// Painter.shade consumes this callback synchronously. Hoist read-only lexical
// loads once per shade call, keeping object references live between pixels.
export function shaderFactory(node,method,body,{imported}) {
 if(node.params.length>4||JSON.stringify(node).includes('ThisExpression'))return '';
 const pureCore=new Set(['clamp','lerp','rand','smooth','seg','bump','fract','noise','tileNoise','tileFbm','noise2','fbm','loopNoise','fit','mix','luma','rgb','scale']);
 function safe(n) {
  if(!n||typeof n!=='object')return true;
  if(n!==node&&['ArrowFunctionExpression','FunctionExpression','FunctionDeclaration'].includes(n.type))return false;
  if(n.type==='NewExpression')return false;
  if(n.type==='CallExpression'){
   const callee=n.callee;
   if(callee.type==='MemberExpression'&&callee.object.name==='Math'){}
   else if(callee.type==='Identifier'&&imported.has(callee.name)){
    const binding=imported.get(callee.name);
    if(!binding.module.startsWith('core/')||!pureCore.has(binding.name))return false;
   }else return false;
  }
  return Object.entries(n).filter(([key])=>!key.startsWith('_')).every(([,v])=>Array.isArray(v)?v.every(safe):safe(v));
 }
 if(!safe(node))return '';
 if(!node._nativeName?.includes('.shade.callback'))return '';
 const output=node.params[2];
 if(!output||output.type!=='Identifier')return '';
 function writesOut(n){if(!n||typeof n!=='object')return false;if(n.type==='AssignmentExpression'&&(n.left.type!=='MemberExpression'||n.left.object.name!==output.name))return true;return Object.entries(n).some(([key,v])=>!key.startsWith('_')&&(Array.isArray(v)?v.some(writesOut):writesOut(v)));}
 if(writesOut(node.body))return '';
 const lines=body.split('\n');lines.shift();
 const free=[];
 while(lines[0]?.match(/^\tvar _n_\w+ = _S\.read\(_parent,/))free.push(lines.shift());
 // No mutable enclosing primitive can change during a pure synchronous shader.
 let shader=lines.join('\n');
 if(shader.includes('_parent')||shader.includes('_this'))return '';
 for(let i=0;i<4;i++)shader=shader.replaceAll('_S.arg(_args,'+i+')','_cb'+i);
 if(shader.includes('_args'))return '';
 return 'static func '+method+'_shader(_parent):\n'+free.join('\n')+(free.length?'\n':'')+'\treturn func(_cb0=null,_cb1=null,_cb2=null,_cb3=null):\n'+shader.split('\n').filter(Boolean).map(line=>'\t'+line).join('\n')+'\n';
}

// Give every lexical binding a unique GDScript identifier before flattening blocks.
function renameLocals(root) {
 let serial=0;
 const rootScope=new Map(),mutated=new Set(),captured=new Set(),iterationUpdates=new WeakSet();
 function binding(pattern,scope) {
  if(pattern.type==='Identifier') {const original=pattern.name;const renamed=original+'_b'+serial++;scope.set(original,renamed);pattern.name=renamed;}
  else if(pattern.type==='AssignmentPattern')binding(pattern.left,scope);
  else if(pattern.type==='ArrayPattern')pattern.elements.filter(Boolean).forEach(p=>binding(p,scope));
  else if(pattern.type==='ObjectPattern')pattern.properties.forEach(p=>{if(p.type!=='Property'||p.computed)throw Error('dynamic pattern');p.key=structuredClone(p.key);binding(p.value,scope);});
  else throw Error('binding pattern');
 }
 function reference(id,scopes) {for(let i=scopes.length-1;i>=0;i--)if(scopes[i].has(id.name)){id.name=scopes[i].get(id.name);return;}}
 root.params.forEach(p=>binding(p,rootScope));
 function visit(n,scopes) {
  if(!n||typeof n!=='object')return;
  if(n.type==='Identifier'){reference(n,scopes);return;}
  if(['ArrowFunctionExpression','FunctionExpression'].includes(n.type)) {
   n._captures=captureNames(n,scopes);
   n._captures.forEach(([,value])=>captured.add(value));return;
  }
  if(n.type==='FunctionDeclaration')throw Error('nested declaration');
  if(n.type==='BlockStatement') {
   const scope=new Map();
   for(const statement of n.body)if(statement.type==='VariableDeclaration')for(const d of statement.declarations)binding(d.id,scope);
   for(const statement of n.body)visit(statement,[...scopes,scope]);return;
  }
  if(['ForStatement','ForOfStatement'].includes(n.type)) {
   const scope=new Map(),decl=n.type==='ForStatement'?n.init:n.left;
   if(decl?.type==='VariableDeclaration')for(const d of decl.declarations)binding(d.id,scope);
   if(n.type==='ForStatement'&&decl?.kind==='let'&&n.update&&scope.has((n.update.argument??n.update.left)?.name))iterationUpdates.add(n.update);
   const chain=[...scopes,scope];
   if(n.type==='ForStatement'){visit(n.init,chain);visit(n.test,chain);visit(n.update,chain);}else {visit(n.right,scopes);}
   visit(n.body,chain);return;
  }
  if(n.type==='VariableDeclaration'){for(const d of n.declarations)visit(d.init,scopes);return;}
  if((n.type==='AssignmentExpression'&&n.left.type==='Identifier')||(n.type==='UpdateExpression'&&n.argument.type==='Identifier')) {
   const id=n.left??n.argument;reference(id,scopes);
   if(!iterationUpdates.has(n))mutated.add(id.name);
   if(n.right)visit(n.right,scopes);return;
  }
  if(n.type==='MemberExpression'){visit(n.object,scopes);if(n.computed)visit(n.property,scopes);return;}
  if(n.type==='Property'){if(n.computed)visit(n.key,scopes);else n.key=structuredClone(n.key);visit(n.value,scopes);return;}
  for(const [key,value]of Object.entries(n))if(!key.startsWith('_')&&key!=='id'){
   if(Array.isArray(value))value.forEach(x=>visit(x,scopes));else if(value&&typeof value==='object')visit(value,scopes);
  }
 }
 for(const p of root.params)if(p.type==='AssignmentPattern')visit(p.right,[rootScope]);
 visit(root.body,[rootScope]);
 if([...captured].some(name=>mutated.has(name)))throw Error('mutable closure');
 return root;
}

// A direct body may snapshot read-only lexical bindings for an existing compiled
// callback. Mutable closures keep the general scope implementation.
function captureNames(root,outer) {
 const captures=new Map();
 function names(p,set){if(p.type==='Identifier')set.add(p.name);else if(p.type==='AssignmentPattern')names(p.left,set);else if(p.type==='ArrayPattern')p.elements.filter(Boolean).forEach(p=>names(p,set));else if(p.type==='ObjectPattern')p.properties.forEach(p=>names(p.value,set));else throw Error('callback pattern');}
 function ref(id,scopes,write=false){
  if(scopes.some(s=>s.has(id.name)))return;
  for(let i=outer.length-1;i>=0;i--)if(outer[i].has(id.name)){
   if(write)throw Error('mutable callback');
   captures.set(id.name,outer[i].get(id.name));return;
  }
 }
 function visit(n,scopes){
  if(!n||typeof n!=='object')return;
  if(n.type==='Identifier'){ref(n,scopes);return;}
  if(['ArrowFunctionExpression','FunctionExpression'].includes(n.type)){
   const own=new Set();n.params.forEach(p=>names(p,own));
   n.params.forEach(p=>{if(p.type==='AssignmentPattern')visit(p.right,[...scopes,own]);});
   visit(n.body,[...scopes,own]);return;
  }
  if(n.type==='FunctionDeclaration')throw Error('nested declaration');
  if(n.type==='BlockStatement'){
   const own=new Set();for(const s of n.body)if(s.type==='VariableDeclaration')s.declarations.forEach(d=>names(d.id,own));
   n.body.forEach(s=>visit(s,[...scopes,own]));return;
  }
  if(['ForStatement','ForOfStatement'].includes(n.type)){
   const own=new Set(),decl=n.init??n.left;
   if(decl?.type==='VariableDeclaration')decl.declarations.forEach(d=>names(d.id,own));
   if(n.type==='ForStatement'){visit(n.init,[...scopes,own]);visit(n.test,[...scopes,own]);visit(n.update,[...scopes,own]);}
   else visit(n.right,scopes);
   visit(n.body,[...scopes,own]);return;
  }
  if(n.type==='VariableDeclaration'){n.declarations.forEach(d=>visit(d.init,scopes));return;}
  if((n.type==='AssignmentExpression'&&n.left.type==='Identifier')||(n.type==='UpdateExpression'&&n.argument.type==='Identifier')){
   ref(n.left??n.argument,scopes,true);if(n.right)visit(n.right,scopes);return;
  }
  if(n.type==='MemberExpression'){visit(n.object,scopes);if(n.computed)visit(n.property,scopes);return;}
  if(n.type==='Property'){if(n.computed)visit(n.key,scopes);visit(n.value,scopes);return;}
  for(const [key,value]of Object.entries(n))if(!key.startsWith('_')&&key!=='id'){
   if(Array.isArray(value))value.forEach(v=>visit(v,scopes));else if(value&&typeof value==='object')visit(value,scopes);
  }
 }
 visit(root,[]);return [...captures];
}
