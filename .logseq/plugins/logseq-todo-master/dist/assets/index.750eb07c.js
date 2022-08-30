import{j as u,d as m,e as b,R as h}from"./vendor.c775ebdb.js";const _=function(){const r=document.createElement("link").relList;if(r&&r.supports&&r.supports("modulepreload"))return;for(const e of document.querySelectorAll('link[rel="modulepreload"]'))o(e);new MutationObserver(e=>{for(const s of e)if(s.type==="childList")for(const c of s.addedNodes)c.tagName==="LINK"&&c.rel==="modulepreload"&&o(c)}).observe(document,{childList:!0,subtree:!0});function t(e){const s={};return e.integrity&&(s.integrity=e.integrity),e.referrerpolicy&&(s.referrerPolicy=e.referrerpolicy),e.crossorigin==="use-credentials"?s.credentials="include":e.crossorigin==="anonymous"?s.credentials="omit":s.credentials="same-origin",s}function o(e){if(e.ep)return;e.ep=!0;const s=t(e);fetch(e.href,s)}};_();const i=u.exports.jsx,l=u.exports.jsxs;var y=`.todo-master-progress-bar {
  max-width: 100%;
  height: 1rem;
  cursor: default;
  font-family: monospace;
  display: inline-flex;
  font-size: 0.8rem;
  transform: translate(0, 2px);
}

.todo-master-progress-bar__bars {
  display: flex;
  flex: 1;
  overflow: hidden;
  margin-right: 0.5rem;
  border-radius: 4px;
  border: 1px solid #eaeaea;
  width: 240px;
}

.todo-master-progress-bar__bar {
  transition: all 0.2s;
  position: relative;
}

.todo-master-progress-bar__bar-inner-text {
  position: absolute;
  margin-left: 0.25rem;
  display: none;
  white-space: nowrap;
  line-height: 14px;
}

.todo-master-progress-bar__bar:hover .todo-master-progress-bar__bar-inner-text {
  display: block;
}

.todo-master-progress-bar__bar-done {
  background-color: var(--ph-highlight-color-green);
}
.todo-master-progress-bar__bar-now {
  background-color: var(--ph-highlight-color-blue);
}
.todo-master-progress-bar__bar-later {
  background-color: transparent;
}

.todo-master-progress-bar__label {
  position: relative;
  white-space: nowrap;
  font-weight: 600;
  line-height: 14px;
  width: 8ch;
}

.todo-master-progress-bar__fraction-label,
.todo-master-progress-bar__percentage-label {
  position: absolute;
  left: 0;
  transition: all 0.2s;
}

.todo-master-progress-bar__percentage-label {
  opacity: 1;
}

.todo-master-progress-bar__fraction-label {
  opacity: 0;
}

.todo-master-progress-bar__label:hover
  .todo-master-progress-bar__percentage-label {
  opacity: 0;
}

.todo-master-progress-bar__label:hover
  .todo-master-progress-bar__fraction-label {
  opacity: 1;
}

.todo-master-progress-bar__target-not-found {
  color: red;
  transform: translate(0, -2px);
}
`;function g(n,r){return i("div",{style:{flexGrow:n},className:`todo-master-progress-bar__bar-${r} todo-master-progress-bar__bar`,children:l("div",{className:"todo-master-progress-bar__bar-inner-text",children:[r,":",n]})})}function w({status:n}){if(!n)return i("div",{className:"todo-master-progress-bar",children:i("div",{className:"todo-master-progress-bar__target-not-found",children:"Tracking target not found."})});const{done:r,now:t,later:o}=n,e=r+t+o,s=e===0?"0":(r/e*100).toFixed(0);return l("div",{className:"todo-master-progress-bar",children:[l("div",{className:"todo-master-progress-bar__bars",children:[g(r,"done"),g(t,"now"),g(o,"later")]}),l("div",{className:"todo-master-progress-bar__label",children:[l("div",{className:"todo-master-progress-bar__percentage-label",children:[s,"%"]}),i("div",{className:"todo-master-progress-bar__fraction-label",children:`${r}/${e}`})]})]})}const d=":todomaster",v=n=>{function r(t){return t==="todo"?"later":t==="doing"?"now":t}return(n??[]).reduce((t,o)=>{const e=r(o);return t[e]=t[e]+1,t},{done:0,later:0,now:0})};async function x(n){const r=await q(n);return r?v(r):null}function k(n){return n.length===36&&n.includes("-")}async function q(n){let r;if(k(n)?r=await logseq.Editor.getBlock(n,{includeChildren:!0}):r={children:await logseq.Editor.getPageBlocksTree(n)},!r||!r.children)return null;const t=[];function o(e){if(e.children)for(const s of e.children)o(s);e.uuid&&e.marker&&t.push(e.marker.toLowerCase())}return o(r),t}const p="todomaster",N=n=>`${p}-${n}-${logseq.baseInfo.id}`;function f(n){return Promise.resolve(logseq.App.queryElementById(N(n)))}const a=new Map;async function E(n,r,t){try{if(a.get(r)?.maybeUUID!==n)return;const o=await x(n);if(a.get(r)?.maybeUUID!==n)return;const e=h.renderToStaticMarkup(i(w,{status:o}));if(t===0||await f(r))return a.get(r)?.template===e||(a.get(r).template=e,logseq.provideUI({key:p,slot:r,reset:!0,template:e})),!0}catch(o){console.error(o)}}async function M(n,r){a.set(r,{maybeUUID:n,template:""});let t=0;for(;await E(n,r,t++);)if(await new Promise(o=>setTimeout(o,3e3)),!await f(r)){a.delete(r);break}}function O(){logseq.provideStyle(y),logseq.App.onMacroRendererSlotted(async({payload:r,slot:t})=>{const[o]=r.arguments;if(!o?.startsWith(d))return;logseq.provideStyle(`#${t} {display: inline-flex;}`);let e=null;o===d?e=r.uuid:e=m(o.substring(d.length+1)),e&&M(e,t)});async function n(r){const t=await logseq.Editor.getCurrentBlock();if(t&&t.uuid){let o="",e="";if(r==="block")e=t.uuid;else{const s=await logseq.Editor.getPage(t.page.id);s?.originalName&&(e=s.originalName)}e&&(o=`{{renderer ${d}-${b(e)}}}`,await logseq.Editor.insertAtEditingCursor(o))}}logseq.Editor.registerSlashCommand("[TODO Master] Add Progress Bar for children blocks",async()=>n("block")),logseq.Editor.registerSlashCommand("[TODO Master] Add Progress Bar for current page",async()=>n("page"))}function $(){const n=logseq.baseInfo.id;logseq.hideMainUI(),console.info(`#${n}: MAIN`),O(),console.info(`#${n}: MAIN DONE`)}logseq.ready($).catch(console.error);
