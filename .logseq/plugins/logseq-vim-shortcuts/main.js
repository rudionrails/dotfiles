/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./node_modules/@logseq/libs/dist/lsplugin.user.js":
/*!*********************************************************!*\
  !*** ./node_modules/@logseq/libs/dist/lsplugin.user.js ***!
  \*********************************************************/
/***/ ((module) => {

/*! For license information please see lsplugin.user.js.LICENSE.txt */
!function(e,t){ true?module.exports=t():0}(self,(function(){return(()=>{var e={227:(e,t,n)=>{var r=n(155);t.formatArgs=function(t){if(t[0]=(this.useColors?"%c":"")+this.namespace+(this.useColors?" %c":" ")+t[0]+(this.useColors?"%c ":" ")+"+"+e.exports.humanize(this.diff),!this.useColors)return;const n="color: "+this.color;t.splice(1,0,n,"color: inherit");let r=0,o=0;t[0].replace(/%[a-zA-Z%]/g,(e=>{"%%"!==e&&(r++,"%c"===e&&(o=r))})),t.splice(o,0,n)},t.save=function(e){try{e?t.storage.setItem("debug",e):t.storage.removeItem("debug")}catch(e){}},t.load=function(){let e;try{e=t.storage.getItem("debug")}catch(e){}return!e&&void 0!==r&&"env"in r&&(e=r.env.DEBUG),e},t.useColors=function(){return!("undefined"==typeof window||!window.process||"renderer"!==window.process.type&&!window.process.__nwjs)||("undefined"==typeof navigator||!navigator.userAgent||!navigator.userAgent.toLowerCase().match(/(edge|trident)\/(\d+)/))&&("undefined"!=typeof document&&document.documentElement&&document.documentElement.style&&document.documentElement.style.WebkitAppearance||"undefined"!=typeof window&&window.console&&(window.console.firebug||window.console.exception&&window.console.table)||"undefined"!=typeof navigator&&navigator.userAgent&&navigator.userAgent.toLowerCase().match(/firefox\/(\d+)/)&&parseInt(RegExp.$1,10)>=31||"undefined"!=typeof navigator&&navigator.userAgent&&navigator.userAgent.toLowerCase().match(/applewebkit\/(\d+)/))},t.storage=function(){try{return localStorage}catch(e){}}(),t.destroy=(()=>{let e=!1;return()=>{e||(e=!0,console.warn("Instance method `debug.destroy()` is deprecated and no longer does anything. It will be removed in the next major version of `debug`."))}})(),t.colors=["#0000CC","#0000FF","#0033CC","#0033FF","#0066CC","#0066FF","#0099CC","#0099FF","#00CC00","#00CC33","#00CC66","#00CC99","#00CCCC","#00CCFF","#3300CC","#3300FF","#3333CC","#3333FF","#3366CC","#3366FF","#3399CC","#3399FF","#33CC00","#33CC33","#33CC66","#33CC99","#33CCCC","#33CCFF","#6600CC","#6600FF","#6633CC","#6633FF","#66CC00","#66CC33","#9900CC","#9900FF","#9933CC","#9933FF","#99CC00","#99CC33","#CC0000","#CC0033","#CC0066","#CC0099","#CC00CC","#CC00FF","#CC3300","#CC3333","#CC3366","#CC3399","#CC33CC","#CC33FF","#CC6600","#CC6633","#CC9900","#CC9933","#CCCC00","#CCCC33","#FF0000","#FF0033","#FF0066","#FF0099","#FF00CC","#FF00FF","#FF3300","#FF3333","#FF3366","#FF3399","#FF33CC","#FF33FF","#FF6600","#FF6633","#FF9900","#FF9933","#FFCC00","#FFCC33"],t.log=console.debug||console.log||(()=>{}),e.exports=n(447)(t);const{formatters:o}=e.exports;o.j=function(e){try{return JSON.stringify(e)}catch(e){return"[UnexpectedJSONParseError]: "+e.message}}},447:(e,t,n)=>{e.exports=function(e){function t(e){let n,o,i,s=null;function a(...e){if(!a.enabled)return;const r=a,o=Number(new Date),i=o-(n||o);r.diff=i,r.prev=n,r.curr=o,n=o,e[0]=t.coerce(e[0]),"string"!=typeof e[0]&&e.unshift("%O");let s=0;e[0]=e[0].replace(/%([a-zA-Z%])/g,((n,o)=>{if("%%"===n)return"%";s++;const i=t.formatters[o];if("function"==typeof i){const t=e[s];n=i.call(r,t),e.splice(s,1),s--}return n})),t.formatArgs.call(r,e),(r.log||t.log).apply(r,e)}return a.namespace=e,a.useColors=t.useColors(),a.color=t.selectColor(e),a.extend=r,a.destroy=t.destroy,Object.defineProperty(a,"enabled",{enumerable:!0,configurable:!1,get:()=>null!==s?s:(o!==t.namespaces&&(o=t.namespaces,i=t.enabled(e)),i),set:e=>{s=e}}),"function"==typeof t.init&&t.init(a),a}function r(e,n){const r=t(this.namespace+(void 0===n?":":n)+e);return r.log=this.log,r}function o(e){return e.toString().substring(2,e.toString().length-2).replace(/\.\*\?$/,"*")}return t.debug=t,t.default=t,t.coerce=function(e){return e instanceof Error?e.stack||e.message:e},t.disable=function(){const e=[...t.names.map(o),...t.skips.map(o).map((e=>"-"+e))].join(",");return t.enable(""),e},t.enable=function(e){let n;t.save(e),t.namespaces=e,t.names=[],t.skips=[];const r=("string"==typeof e?e:"").split(/[\s,]+/),o=r.length;for(n=0;n<o;n++)r[n]&&("-"===(e=r[n].replace(/\*/g,".*?"))[0]?t.skips.push(new RegExp("^"+e.substr(1)+"$")):t.names.push(new RegExp("^"+e+"$")))},t.enabled=function(e){if("*"===e[e.length-1])return!0;let n,r;for(n=0,r=t.skips.length;n<r;n++)if(t.skips[n].test(e))return!1;for(n=0,r=t.names.length;n<r;n++)if(t.names[n].test(e))return!0;return!1},t.humanize=n(824),t.destroy=function(){console.warn("Instance method `debug.destroy()` is deprecated and no longer does anything. It will be removed in the next major version of `debug`.")},Object.keys(e).forEach((n=>{t[n]=e[n]})),t.names=[],t.skips=[],t.formatters={},t.selectColor=function(e){let n=0;for(let t=0;t<e.length;t++)n=(n<<5)-n+e.charCodeAt(t),n|=0;return t.colors[Math.abs(n)%t.colors.length]},t.enable(t.load()),t}},856:function(e){e.exports=function(){"use strict";var e=Object.hasOwnProperty,t=Object.setPrototypeOf,n=Object.isFrozen,r=Object.getPrototypeOf,o=Object.getOwnPropertyDescriptor,i=Object.freeze,s=Object.seal,a=Object.create,l="undefined"!=typeof Reflect&&Reflect,c=l.apply,u=l.construct;c||(c=function(e,t,n){return e.apply(t,n)}),i||(i=function(e){return e}),s||(s=function(e){return e}),u||(u=function(e,t){return new(Function.prototype.bind.apply(e,[null].concat(function(e){if(Array.isArray(e)){for(var t=0,n=Array(e.length);t<e.length;t++)n[t]=e[t];return n}return Array.from(e)}(t))))});var d,p=C(Array.prototype.forEach),f=C(Array.prototype.pop),h=C(Array.prototype.push),m=C(String.prototype.toLowerCase),g=C(String.prototype.match),y=C(String.prototype.replace),v=C(String.prototype.indexOf),b=C(String.prototype.trim),w=C(RegExp.prototype.test),_=(d=TypeError,function(){for(var e=arguments.length,t=Array(e),n=0;n<e;n++)t[n]=arguments[n];return u(d,t)});function C(e){return function(t){for(var n=arguments.length,r=Array(n>1?n-1:0),o=1;o<n;o++)r[o-1]=arguments[o];return c(e,t,r)}}function x(e,r){t&&t(e,null);for(var o=r.length;o--;){var i=r[o];if("string"==typeof i){var s=m(i);s!==i&&(n(r)||(r[o]=s),i=s)}e[i]=!0}return e}function S(t){var n=a(null),r=void 0;for(r in t)c(e,t,[r])&&(n[r]=t[r]);return n}function T(e,t){for(;null!==e;){var n=o(e,t);if(n){if(n.get)return C(n.get);if("function"==typeof n.value)return C(n.value)}e=r(e)}return function(e){return console.warn("fallback value for",e),null}}var A=i(["a","abbr","acronym","address","area","article","aside","audio","b","bdi","bdo","big","blink","blockquote","body","br","button","canvas","caption","center","cite","code","col","colgroup","content","data","datalist","dd","decorator","del","details","dfn","dialog","dir","div","dl","dt","element","em","fieldset","figcaption","figure","font","footer","form","h1","h2","h3","h4","h5","h6","head","header","hgroup","hr","html","i","img","input","ins","kbd","label","legend","li","main","map","mark","marquee","menu","menuitem","meter","nav","nobr","ol","optgroup","option","output","p","picture","pre","progress","q","rp","rt","ruby","s","samp","section","select","shadow","small","source","spacer","span","strike","strong","style","sub","summary","sup","table","tbody","td","template","textarea","tfoot","th","thead","time","tr","track","tt","u","ul","var","video","wbr"]),O=i(["svg","a","altglyph","altglyphdef","altglyphitem","animatecolor","animatemotion","animatetransform","circle","clippath","defs","desc","ellipse","filter","font","g","glyph","glyphref","hkern","image","line","lineargradient","marker","mask","metadata","mpath","path","pattern","polygon","polyline","radialgradient","rect","stop","style","switch","symbol","text","textpath","title","tref","tspan","view","vkern"]),k=i(["feBlend","feColorMatrix","feComponentTransfer","feComposite","feConvolveMatrix","feDiffuseLighting","feDisplacementMap","feDistantLight","feFlood","feFuncA","feFuncB","feFuncG","feFuncR","feGaussianBlur","feMerge","feMergeNode","feMorphology","feOffset","fePointLight","feSpecularLighting","feSpotLight","feTile","feTurbulence"]),E=i(["animate","color-profile","cursor","discard","fedropshadow","feimage","font-face","font-face-format","font-face-name","font-face-src","font-face-uri","foreignobject","hatch","hatchpath","mesh","meshgradient","meshpatch","meshrow","missing-glyph","script","set","solidcolor","unknown","use"]),F=i(["math","menclose","merror","mfenced","mfrac","mglyph","mi","mlabeledtr","mmultiscripts","mn","mo","mover","mpadded","mphantom","mroot","mrow","ms","mspace","msqrt","mstyle","msub","msup","msubsup","mtable","mtd","mtext","mtr","munder","munderover"]),L=i(["maction","maligngroup","malignmark","mlongdiv","mscarries","mscarry","msgroup","mstack","msline","msrow","semantics","annotation","annotation-xml","mprescripts","none"]),M=i(["#text"]),j=i(["accept","action","align","alt","autocapitalize","autocomplete","autopictureinpicture","autoplay","background","bgcolor","border","capture","cellpadding","cellspacing","checked","cite","class","clear","color","cols","colspan","controls","controlslist","coords","crossorigin","datetime","decoding","default","dir","disabled","disablepictureinpicture","disableremoteplayback","download","draggable","enctype","enterkeyhint","face","for","headers","height","hidden","high","href","hreflang","id","inputmode","integrity","ismap","kind","label","lang","list","loading","loop","low","max","maxlength","media","method","min","minlength","multiple","muted","name","noshade","novalidate","nowrap","open","optimum","pattern","placeholder","playsinline","poster","preload","pubdate","radiogroup","readonly","rel","required","rev","reversed","role","rows","rowspan","spellcheck","scope","selected","shape","size","sizes","span","srclang","start","src","srcset","step","style","summary","tabindex","title","translate","type","usemap","valign","value","width","xmlns","slot"]),I=i(["accent-height","accumulate","additive","alignment-baseline","ascent","attributename","attributetype","azimuth","basefrequency","baseline-shift","begin","bias","by","class","clip","clippathunits","clip-path","clip-rule","color","color-interpolation","color-interpolation-filters","color-profile","color-rendering","cx","cy","d","dx","dy","diffuseconstant","direction","display","divisor","dur","edgemode","elevation","end","fill","fill-opacity","fill-rule","filter","filterunits","flood-color","flood-opacity","font-family","font-size","font-size-adjust","font-stretch","font-style","font-variant","font-weight","fx","fy","g1","g2","glyph-name","glyphref","gradientunits","gradienttransform","height","href","id","image-rendering","in","in2","k","k1","k2","k3","k4","kerning","keypoints","keysplines","keytimes","lang","lengthadjust","letter-spacing","kernelmatrix","kernelunitlength","lighting-color","local","marker-end","marker-mid","marker-start","markerheight","markerunits","markerwidth","maskcontentunits","maskunits","max","mask","media","method","mode","min","name","numoctaves","offset","operator","opacity","order","orient","orientation","origin","overflow","paint-order","path","pathlength","patterncontentunits","patterntransform","patternunits","points","preservealpha","preserveaspectratio","primitiveunits","r","rx","ry","radius","refx","refy","repeatcount","repeatdur","restart","result","rotate","scale","seed","shape-rendering","specularconstant","specularexponent","spreadmethod","startoffset","stddeviation","stitchtiles","stop-color","stop-opacity","stroke-dasharray","stroke-dashoffset","stroke-linecap","stroke-linejoin","stroke-miterlimit","stroke-opacity","stroke","stroke-width","style","surfacescale","systemlanguage","tabindex","targetx","targety","transform","text-anchor","text-decoration","text-rendering","textlength","type","u1","u2","unicode","values","viewbox","visibility","version","vert-adv-y","vert-origin-x","vert-origin-y","width","word-spacing","wrap","writing-mode","xchannelselector","ychannelselector","x","x1","x2","xmlns","y","y1","y2","z","zoomandpan"]),N=i(["accent","accentunder","align","bevelled","close","columnsalign","columnlines","columnspan","denomalign","depth","dir","display","displaystyle","encoding","fence","frame","height","href","id","largeop","length","linethickness","lspace","lquote","mathbackground","mathcolor","mathsize","mathvariant","maxsize","minsize","movablelimits","notation","numalign","open","rowalign","rowlines","rowspacing","rowspan","rspace","rquote","scriptlevel","scriptminsize","scriptsizemultiplier","selection","separator","separators","stretchy","subscriptshift","supscriptshift","symmetric","voffset","width","xmlns"]),R=i(["xlink:href","xml:id","xlink:title","xml:space","xmlns:xlink"]),D=s(/\{\{[\s\S]*|[\s\S]*\}\}/gm),U=s(/<%[\s\S]*|[\s\S]*%>/gm),P=s(/^data-[\-\w.\u00B7-\uFFFF]/),z=s(/^aria-[\-\w]+$/),$=s(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|cid|xmpp):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),H=s(/^(?:\w+script|data):/i),B=s(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),W="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e};function G(e){if(Array.isArray(e)){for(var t=0,n=Array(e.length);t<e.length;t++)n[t]=e[t];return n}return Array.from(e)}var J=function(){return"undefined"==typeof window?null:window},q=function(e,t){if("object"!==(void 0===e?"undefined":W(e))||"function"!=typeof e.createPolicy)return null;var n=null,r="data-tt-policy-suffix";t.currentScript&&t.currentScript.hasAttribute(r)&&(n=t.currentScript.getAttribute(r));var o="dompurify"+(n?"#"+n:"");try{return e.createPolicy(o,{createHTML:function(e){return e}})}catch(e){return console.warn("TrustedTypes policy "+o+" could not be created."),null}};return function e(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:J(),n=function(t){return e(t)};if(n.version="2.3.1",n.removed=[],!t||!t.document||9!==t.document.nodeType)return n.isSupported=!1,n;var r=t.document,o=t.document,s=t.DocumentFragment,a=t.HTMLTemplateElement,l=t.Node,c=t.Element,u=t.NodeFilter,d=t.NamedNodeMap,C=void 0===d?t.NamedNodeMap||t.MozNamedAttrMap:d,Z=t.Text,V=t.Comment,K=t.DOMParser,Y=t.trustedTypes,X=c.prototype,Q=T(X,"cloneNode"),ee=T(X,"nextSibling"),te=T(X,"childNodes"),ne=T(X,"parentNode");if("function"==typeof a){var re=o.createElement("template");re.content&&re.content.ownerDocument&&(o=re.content.ownerDocument)}var oe=q(Y,r),ie=oe&&De?oe.createHTML(""):"",se=o,ae=se.implementation,le=se.createNodeIterator,ce=se.createDocumentFragment,ue=se.getElementsByTagName,de=r.importNode,pe={};try{pe=S(o).documentMode?o.documentMode:{}}catch(e){}var fe={};n.isSupported="function"==typeof ne&&ae&&void 0!==ae.createHTMLDocument&&9!==pe;var he=D,me=U,ge=P,ye=z,ve=H,be=B,we=$,_e=null,Ce=x({},[].concat(G(A),G(O),G(k),G(F),G(M))),xe=null,Se=x({},[].concat(G(j),G(I),G(N),G(R))),Te=null,Ae=null,Oe=!0,ke=!0,Ee=!1,Fe=!1,Le=!1,Me=!1,je=!1,Ie=!1,Ne=!1,Re=!0,De=!1,Ue=!0,Pe=!0,ze=!1,$e={},He=null,Be=x({},["annotation-xml","audio","colgroup","desc","foreignobject","head","iframe","math","mi","mn","mo","ms","mtext","noembed","noframes","noscript","plaintext","script","style","svg","template","thead","title","video","xmp"]),We=null,Ge=x({},["audio","video","img","source","image","track"]),Je=null,qe=x({},["alt","class","for","id","label","name","pattern","placeholder","role","summary","title","value","style","xmlns"]),Ze="http://www.w3.org/1998/Math/MathML",Ve="http://www.w3.org/2000/svg",Ke="http://www.w3.org/1999/xhtml",Ye=Ke,Xe=!1,Qe=null,et=o.createElement("form"),tt=function(e){Qe&&Qe===e||(e&&"object"===(void 0===e?"undefined":W(e))||(e={}),e=S(e),_e="ALLOWED_TAGS"in e?x({},e.ALLOWED_TAGS):Ce,xe="ALLOWED_ATTR"in e?x({},e.ALLOWED_ATTR):Se,Je="ADD_URI_SAFE_ATTR"in e?x(S(qe),e.ADD_URI_SAFE_ATTR):qe,We="ADD_DATA_URI_TAGS"in e?x(S(Ge),e.ADD_DATA_URI_TAGS):Ge,He="FORBID_CONTENTS"in e?x({},e.FORBID_CONTENTS):Be,Te="FORBID_TAGS"in e?x({},e.FORBID_TAGS):{},Ae="FORBID_ATTR"in e?x({},e.FORBID_ATTR):{},$e="USE_PROFILES"in e&&e.USE_PROFILES,Oe=!1!==e.ALLOW_ARIA_ATTR,ke=!1!==e.ALLOW_DATA_ATTR,Ee=e.ALLOW_UNKNOWN_PROTOCOLS||!1,Fe=e.SAFE_FOR_TEMPLATES||!1,Le=e.WHOLE_DOCUMENT||!1,Ie=e.RETURN_DOM||!1,Ne=e.RETURN_DOM_FRAGMENT||!1,Re=!1!==e.RETURN_DOM_IMPORT,De=e.RETURN_TRUSTED_TYPE||!1,je=e.FORCE_BODY||!1,Ue=!1!==e.SANITIZE_DOM,Pe=!1!==e.KEEP_CONTENT,ze=e.IN_PLACE||!1,we=e.ALLOWED_URI_REGEXP||we,Ye=e.NAMESPACE||Ke,Fe&&(ke=!1),Ne&&(Ie=!0),$e&&(_e=x({},[].concat(G(M))),xe=[],!0===$e.html&&(x(_e,A),x(xe,j)),!0===$e.svg&&(x(_e,O),x(xe,I),x(xe,R)),!0===$e.svgFilters&&(x(_e,k),x(xe,I),x(xe,R)),!0===$e.mathMl&&(x(_e,F),x(xe,N),x(xe,R))),e.ADD_TAGS&&(_e===Ce&&(_e=S(_e)),x(_e,e.ADD_TAGS)),e.ADD_ATTR&&(xe===Se&&(xe=S(xe)),x(xe,e.ADD_ATTR)),e.ADD_URI_SAFE_ATTR&&x(Je,e.ADD_URI_SAFE_ATTR),e.FORBID_CONTENTS&&(He===Be&&(He=S(He)),x(He,e.FORBID_CONTENTS)),Pe&&(_e["#text"]=!0),Le&&x(_e,["html","head","body"]),_e.table&&(x(_e,["tbody"]),delete Te.tbody),i&&i(e),Qe=e)},nt=x({},["mi","mo","mn","ms","mtext"]),rt=x({},["foreignobject","desc","title","annotation-xml"]),ot=x({},O);x(ot,k),x(ot,E);var it=x({},F);x(it,L);var st=function(e){var t=ne(e);t&&t.tagName||(t={namespaceURI:Ke,tagName:"template"});var n=m(e.tagName),r=m(t.tagName);if(e.namespaceURI===Ve)return t.namespaceURI===Ke?"svg"===n:t.namespaceURI===Ze?"svg"===n&&("annotation-xml"===r||nt[r]):Boolean(ot[n]);if(e.namespaceURI===Ze)return t.namespaceURI===Ke?"math"===n:t.namespaceURI===Ve?"math"===n&&rt[r]:Boolean(it[n]);if(e.namespaceURI===Ke){if(t.namespaceURI===Ve&&!rt[r])return!1;if(t.namespaceURI===Ze&&!nt[r])return!1;var o=x({},["title","style","font","a","script"]);return!it[n]&&(o[n]||!ot[n])}return!1},at=function(e){h(n.removed,{element:e});try{e.parentNode.removeChild(e)}catch(t){try{e.outerHTML=ie}catch(t){e.remove()}}},lt=function(e,t){try{h(n.removed,{attribute:t.getAttributeNode(e),from:t})}catch(e){h(n.removed,{attribute:null,from:t})}if(t.removeAttribute(e),"is"===e&&!xe[e])if(Ie||Ne)try{at(t)}catch(e){}else try{t.setAttribute(e,"")}catch(e){}},ct=function(e){var t=void 0,n=void 0;if(je)e="<remove></remove>"+e;else{var r=g(e,/^[\r\n\t ]+/);n=r&&r[0]}var i=oe?oe.createHTML(e):e;if(Ye===Ke)try{t=(new K).parseFromString(i,"text/html")}catch(e){}if(!t||!t.documentElement){t=ae.createDocument(Ye,"template",null);try{t.documentElement.innerHTML=Xe?"":i}catch(e){}}var s=t.body||t.documentElement;return e&&n&&s.insertBefore(o.createTextNode(n),s.childNodes[0]||null),Ye===Ke?ue.call(t,Le?"html":"body")[0]:Le?t.documentElement:s},ut=function(e){return le.call(e.ownerDocument||e,e,u.SHOW_ELEMENT|u.SHOW_COMMENT|u.SHOW_TEXT,null,!1)},dt=function(e){return!(e instanceof Z||e instanceof V||"string"==typeof e.nodeName&&"string"==typeof e.textContent&&"function"==typeof e.removeChild&&e.attributes instanceof C&&"function"==typeof e.removeAttribute&&"function"==typeof e.setAttribute&&"string"==typeof e.namespaceURI&&"function"==typeof e.insertBefore)},pt=function(e){return"object"===(void 0===l?"undefined":W(l))?e instanceof l:e&&"object"===(void 0===e?"undefined":W(e))&&"number"==typeof e.nodeType&&"string"==typeof e.nodeName},ft=function(e,t,r){fe[e]&&p(fe[e],(function(e){e.call(n,t,r,Qe)}))},ht=function(e){var t=void 0;if(ft("beforeSanitizeElements",e,null),dt(e))return at(e),!0;if(g(e.nodeName,/[\u0080-\uFFFF]/))return at(e),!0;var r=m(e.nodeName);if(ft("uponSanitizeElement",e,{tagName:r,allowedTags:_e}),!pt(e.firstElementChild)&&(!pt(e.content)||!pt(e.content.firstElementChild))&&w(/<[/\w]/g,e.innerHTML)&&w(/<[/\w]/g,e.textContent))return at(e),!0;if("select"===r&&w(/<template/i,e.innerHTML))return at(e),!0;if(!_e[r]||Te[r]){if(Pe&&!He[r]){var o=ne(e)||e.parentNode,i=te(e)||e.childNodes;if(i&&o)for(var s=i.length-1;s>=0;--s)o.insertBefore(Q(i[s],!0),ee(e))}return at(e),!0}return e instanceof c&&!st(e)?(at(e),!0):"noscript"!==r&&"noembed"!==r||!w(/<\/no(script|embed)/i,e.innerHTML)?(Fe&&3===e.nodeType&&(t=e.textContent,t=y(t,he," "),t=y(t,me," "),e.textContent!==t&&(h(n.removed,{element:e.cloneNode()}),e.textContent=t)),ft("afterSanitizeElements",e,null),!1):(at(e),!0)},mt=function(e,t,n){if(Ue&&("id"===t||"name"===t)&&(n in o||n in et))return!1;if(ke&&!Ae[t]&&w(ge,t));else if(Oe&&w(ye,t));else{if(!xe[t]||Ae[t])return!1;if(Je[t]);else if(w(we,y(n,be,"")));else if("src"!==t&&"xlink:href"!==t&&"href"!==t||"script"===e||0!==v(n,"data:")||!We[e])if(Ee&&!w(ve,y(n,be,"")));else if(n)return!1}return!0},gt=function(e){var t=void 0,r=void 0,o=void 0,i=void 0;ft("beforeSanitizeAttributes",e,null);var s=e.attributes;if(s){var a={attrName:"",attrValue:"",keepAttr:!0,allowedAttributes:xe};for(i=s.length;i--;){var l=t=s[i],c=l.name,u=l.namespaceURI;if(r=b(t.value),o=m(c),a.attrName=o,a.attrValue=r,a.keepAttr=!0,a.forceKeepAttr=void 0,ft("uponSanitizeAttribute",e,a),r=a.attrValue,!a.forceKeepAttr&&(lt(c,e),a.keepAttr))if(w(/\/>/i,r))lt(c,e);else{Fe&&(r=y(r,he," "),r=y(r,me," "));var d=e.nodeName.toLowerCase();if(mt(d,o,r))try{u?e.setAttributeNS(u,c,r):e.setAttribute(c,r),f(n.removed)}catch(e){}}}ft("afterSanitizeAttributes",e,null)}},yt=function e(t){var n=void 0,r=ut(t);for(ft("beforeSanitizeShadowDOM",t,null);n=r.nextNode();)ft("uponSanitizeShadowNode",n,null),ht(n)||(n.content instanceof s&&e(n.content),gt(n));ft("afterSanitizeShadowDOM",t,null)};return n.sanitize=function(e,o){var i=void 0,a=void 0,c=void 0,u=void 0,d=void 0;if((Xe=!e)&&(e="\x3c!--\x3e"),"string"!=typeof e&&!pt(e)){if("function"!=typeof e.toString)throw _("toString is not a function");if("string"!=typeof(e=e.toString()))throw _("dirty is not a string, aborting")}if(!n.isSupported){if("object"===W(t.toStaticHTML)||"function"==typeof t.toStaticHTML){if("string"==typeof e)return t.toStaticHTML(e);if(pt(e))return t.toStaticHTML(e.outerHTML)}return e}if(Me||tt(o),n.removed=[],"string"==typeof e&&(ze=!1),ze);else if(e instanceof l)1===(a=(i=ct("\x3c!----\x3e")).ownerDocument.importNode(e,!0)).nodeType&&"BODY"===a.nodeName||"HTML"===a.nodeName?i=a:i.appendChild(a);else{if(!Ie&&!Fe&&!Le&&-1===e.indexOf("<"))return oe&&De?oe.createHTML(e):e;if(!(i=ct(e)))return Ie?null:ie}i&&je&&at(i.firstChild);for(var p=ut(ze?e:i);c=p.nextNode();)3===c.nodeType&&c===u||ht(c)||(c.content instanceof s&&yt(c.content),gt(c),u=c);if(u=null,ze)return e;if(Ie){if(Ne)for(d=ce.call(i.ownerDocument);i.firstChild;)d.appendChild(i.firstChild);else d=i;return Re&&(d=de.call(r,d,!0)),d}var f=Le?i.outerHTML:i.innerHTML;return Fe&&(f=y(f,he," "),f=y(f,me," ")),oe&&De?oe.createHTML(f):f},n.setConfig=function(e){tt(e),Me=!0},n.clearConfig=function(){Qe=null,Me=!1},n.isValidAttribute=function(e,t,n){Qe||tt({});var r=m(e),o=m(t);return mt(r,o,n)},n.addHook=function(e,t){"function"==typeof t&&(fe[e]=fe[e]||[],h(fe[e],t))},n.removeHook=function(e){fe[e]&&f(fe[e])},n.removeHooks=function(e){fe[e]&&(fe[e]=[])},n.removeAllHooks=function(){fe={}},n}()}()},729:e=>{"use strict";var t=Object.prototype.hasOwnProperty,n="~";function r(){}function o(e,t,n){this.fn=e,this.context=t,this.once=n||!1}function i(e,t,r,i,s){if("function"!=typeof r)throw new TypeError("The listener must be a function");var a=new o(r,i||e,s),l=n?n+t:t;return e._events[l]?e._events[l].fn?e._events[l]=[e._events[l],a]:e._events[l].push(a):(e._events[l]=a,e._eventsCount++),e}function s(e,t){0==--e._eventsCount?e._events=new r:delete e._events[t]}function a(){this._events=new r,this._eventsCount=0}Object.create&&(r.prototype=Object.create(null),(new r).__proto__||(n=!1)),a.prototype.eventNames=function(){var e,r,o=[];if(0===this._eventsCount)return o;for(r in e=this._events)t.call(e,r)&&o.push(n?r.slice(1):r);return Object.getOwnPropertySymbols?o.concat(Object.getOwnPropertySymbols(e)):o},a.prototype.listeners=function(e){var t=n?n+e:e,r=this._events[t];if(!r)return[];if(r.fn)return[r.fn];for(var o=0,i=r.length,s=new Array(i);o<i;o++)s[o]=r[o].fn;return s},a.prototype.listenerCount=function(e){var t=n?n+e:e,r=this._events[t];return r?r.fn?1:r.length:0},a.prototype.emit=function(e,t,r,o,i,s){var a=n?n+e:e;if(!this._events[a])return!1;var l,c,u=this._events[a],d=arguments.length;if(u.fn){switch(u.once&&this.removeListener(e,u.fn,void 0,!0),d){case 1:return u.fn.call(u.context),!0;case 2:return u.fn.call(u.context,t),!0;case 3:return u.fn.call(u.context,t,r),!0;case 4:return u.fn.call(u.context,t,r,o),!0;case 5:return u.fn.call(u.context,t,r,o,i),!0;case 6:return u.fn.call(u.context,t,r,o,i,s),!0}for(c=1,l=new Array(d-1);c<d;c++)l[c-1]=arguments[c];u.fn.apply(u.context,l)}else{var p,f=u.length;for(c=0;c<f;c++)switch(u[c].once&&this.removeListener(e,u[c].fn,void 0,!0),d){case 1:u[c].fn.call(u[c].context);break;case 2:u[c].fn.call(u[c].context,t);break;case 3:u[c].fn.call(u[c].context,t,r);break;case 4:u[c].fn.call(u[c].context,t,r,o);break;default:if(!l)for(p=1,l=new Array(d-1);p<d;p++)l[p-1]=arguments[p];u[c].fn.apply(u[c].context,l)}}return!0},a.prototype.on=function(e,t,n){return i(this,e,t,n,!1)},a.prototype.once=function(e,t,n){return i(this,e,t,n,!0)},a.prototype.removeListener=function(e,t,r,o){var i=n?n+e:e;if(!this._events[i])return this;if(!t)return s(this,i),this;var a=this._events[i];if(a.fn)a.fn!==t||o&&!a.once||r&&a.context!==r||s(this,i);else{for(var l=0,c=[],u=a.length;l<u;l++)(a[l].fn!==t||o&&!a[l].once||r&&a[l].context!==r)&&c.push(a[l]);c.length?this._events[i]=1===c.length?c[0]:c:s(this,i)}return this},a.prototype.removeAllListeners=function(e){var t;return e?(t=n?n+e:e,this._events[t]&&s(this,t)):(this._events=new r,this._eventsCount=0),this},a.prototype.off=a.prototype.removeListener,a.prototype.addListener=a.prototype.on,a.prefixed=n,a.EventEmitter=a,e.exports=a},717:e=>{"function"==typeof Object.create?e.exports=function(e,t){e.super_=t,e.prototype=Object.create(t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}})}:e.exports=function(e,t){e.super_=t;var n=function(){};n.prototype=t.prototype,e.prototype=new n,e.prototype.constructor=e}},824:e=>{var t=1e3,n=60*t,r=60*n,o=24*r;function i(e,t,n,r){var o=t>=1.5*n;return Math.round(e/n)+" "+r+(o?"s":"")}e.exports=function(e,s){s=s||{};var a,l,c=typeof e;if("string"===c&&e.length>0)return function(e){if(!((e=String(e)).length>100)){var i=/^(-?(?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|weeks?|w|years?|yrs?|y)?$/i.exec(e);if(i){var s=parseFloat(i[1]);switch((i[2]||"ms").toLowerCase()){case"years":case"year":case"yrs":case"yr":case"y":return 315576e5*s;case"weeks":case"week":case"w":return 6048e5*s;case"days":case"day":case"d":return s*o;case"hours":case"hour":case"hrs":case"hr":case"h":return s*r;case"minutes":case"minute":case"mins":case"min":case"m":return s*n;case"seconds":case"second":case"secs":case"sec":case"s":return s*t;case"milliseconds":case"millisecond":case"msecs":case"msec":case"ms":return s;default:return}}}}(e);if("number"===c&&isFinite(e))return s.long?(a=e,(l=Math.abs(a))>=o?i(a,l,o,"day"):l>=r?i(a,l,r,"hour"):l>=n?i(a,l,n,"minute"):l>=t?i(a,l,t,"second"):a+" ms"):function(e){var i=Math.abs(e);return i>=o?Math.round(e/o)+"d":i>=r?Math.round(e/r)+"h":i>=n?Math.round(e/n)+"m":i>=t?Math.round(e/t)+"s":e+"ms"}(e);throw new Error("val is not a non-empty string or a valid number. val="+JSON.stringify(e))}},520:(e,t,n)=>{"use strict";var r=n(155),o="win32"===r.platform,i=n(539);function s(e,t){for(var n=[],r=0;r<e.length;r++){var o=e[r];o&&"."!==o&&(".."===o?n.length&&".."!==n[n.length-1]?n.pop():t&&n.push(".."):n.push(o))}return n}function a(e){for(var t=e.length-1,n=0;n<=t&&!e[n];n++);for(var r=t;r>=0&&!e[r];r--);return 0===n&&r===t?e:n>r?[]:e.slice(n,r+1)}var l=/^([a-zA-Z]:|[\\\/]{2}[^\\\/]+[\\\/]+[^\\\/]+)?([\\\/])?([\s\S]*?)$/,c=/^([\s\S]*?)((?:\.{1,2}|[^\\\/]+?|)(\.[^.\/\\]*|))(?:[\\\/]*)$/,u={};function d(e){var t=l.exec(e),n=(t[1]||"")+(t[2]||""),r=t[3]||"",o=c.exec(r);return[n,o[1],o[2],o[3]]}function p(e){var t=l.exec(e),n=t[1]||"",r=!!n&&":"!==n[1];return{device:n,isUnc:r,isAbsolute:r||!!t[2],tail:t[3]}}function f(e){return"\\\\"+e.replace(/^[\\\/]+/,"").replace(/[\\\/]+/g,"\\")}u.resolve=function(){for(var e="",t="",n=!1,o=arguments.length-1;o>=-1;o--){var a;if(o>=0?a=arguments[o]:e?(a=r.env["="+e])&&a.substr(0,3).toLowerCase()===e.toLowerCase()+"\\"||(a=e+"\\"):a=r.cwd(),!i.isString(a))throw new TypeError("Arguments to path.resolve must be strings");if(a){var l=p(a),c=l.device,u=l.isUnc,d=l.isAbsolute,h=l.tail;if((!c||!e||c.toLowerCase()===e.toLowerCase())&&(e||(e=c),n||(t=h+"\\"+t,n=d),e&&n))break}}return u&&(e=f(e)),e+(n?"\\":"")+(t=s(t.split(/[\\\/]+/),!n).join("\\"))||"."},u.normalize=function(e){var t=p(e),n=t.device,r=t.isUnc,o=t.isAbsolute,i=t.tail,a=/[\\\/]$/.test(i);return(i=s(i.split(/[\\\/]+/),!o).join("\\"))||o||(i="."),i&&a&&(i+="\\"),r&&(n=f(n)),n+(o?"\\":"")+i},u.isAbsolute=function(e){return p(e).isAbsolute},u.join=function(){for(var e=[],t=0;t<arguments.length;t++){var n=arguments[t];if(!i.isString(n))throw new TypeError("Arguments to path.join must be strings");n&&e.push(n)}var r=e.join("\\");return/^[\\\/]{2}[^\\\/]/.test(e[0])||(r=r.replace(/^[\\\/]{2,}/,"\\")),u.normalize(r)},u.relative=function(e,t){e=u.resolve(e),t=u.resolve(t);for(var n=e.toLowerCase(),r=t.toLowerCase(),o=a(t.split("\\")),i=a(n.split("\\")),s=a(r.split("\\")),l=Math.min(i.length,s.length),c=l,d=0;d<l;d++)if(i[d]!==s[d]){c=d;break}if(0==c)return t;var p=[];for(d=c;d<i.length;d++)p.push("..");return(p=p.concat(o.slice(c))).join("\\")},u._makeLong=function(e){if(!i.isString(e))return e;if(!e)return"";var t=u.resolve(e);return/^[a-zA-Z]\:\\/.test(t)?"\\\\?\\"+t:/^\\\\[^?.]/.test(t)?"\\\\?\\UNC\\"+t.substring(2):e},u.dirname=function(e){var t=d(e),n=t[0],r=t[1];return n||r?(r&&(r=r.substr(0,r.length-1)),n+r):"."},u.basename=function(e,t){var n=d(e)[2];return t&&n.substr(-1*t.length)===t&&(n=n.substr(0,n.length-t.length)),n},u.extname=function(e){return d(e)[3]},u.format=function(e){if(!i.isObject(e))throw new TypeError("Parameter 'pathObject' must be an object, not "+typeof e);var t=e.root||"";if(!i.isString(t))throw new TypeError("'pathObject.root' must be a string or undefined, not "+typeof e.root);var n=e.dir,r=e.base||"";return n?n[n.length-1]===u.sep?n+r:n+u.sep+r:r},u.parse=function(e){if(!i.isString(e))throw new TypeError("Parameter 'pathString' must be a string, not "+typeof e);var t=d(e);if(!t||4!==t.length)throw new TypeError("Invalid path '"+e+"'");return{root:t[0],dir:t[0]+t[1].slice(0,-1),base:t[2],ext:t[3],name:t[2].slice(0,t[2].length-t[3].length)}},u.sep="\\",u.delimiter=";";var h=/^(\/?|)([\s\S]*?)((?:\.{1,2}|[^\/]+?|)(\.[^.\/]*|))(?:[\/]*)$/,m={};function g(e){return h.exec(e).slice(1)}m.resolve=function(){for(var e="",t=!1,n=arguments.length-1;n>=-1&&!t;n--){var o=n>=0?arguments[n]:r.cwd();if(!i.isString(o))throw new TypeError("Arguments to path.resolve must be strings");o&&(e=o+"/"+e,t="/"===o[0])}return(t?"/":"")+(e=s(e.split("/"),!t).join("/"))||"."},m.normalize=function(e){var t=m.isAbsolute(e),n=e&&"/"===e[e.length-1];return(e=s(e.split("/"),!t).join("/"))||t||(e="."),e&&n&&(e+="/"),(t?"/":"")+e},m.isAbsolute=function(e){return"/"===e.charAt(0)},m.join=function(){for(var e="",t=0;t<arguments.length;t++){var n=arguments[t];if(!i.isString(n))throw new TypeError("Arguments to path.join must be strings");n&&(e+=e?"/"+n:n)}return m.normalize(e)},m.relative=function(e,t){e=m.resolve(e).substr(1),t=m.resolve(t).substr(1);for(var n=a(e.split("/")),r=a(t.split("/")),o=Math.min(n.length,r.length),i=o,s=0;s<o;s++)if(n[s]!==r[s]){i=s;break}var l=[];for(s=i;s<n.length;s++)l.push("..");return(l=l.concat(r.slice(i))).join("/")},m._makeLong=function(e){return e},m.dirname=function(e){var t=g(e),n=t[0],r=t[1];return n||r?(r&&(r=r.substr(0,r.length-1)),n+r):"."},m.basename=function(e,t){var n=g(e)[2];return t&&n.substr(-1*t.length)===t&&(n=n.substr(0,n.length-t.length)),n},m.extname=function(e){return g(e)[3]},m.format=function(e){if(!i.isObject(e))throw new TypeError("Parameter 'pathObject' must be an object, not "+typeof e);var t=e.root||"";if(!i.isString(t))throw new TypeError("'pathObject.root' must be a string or undefined, not "+typeof e.root);return(e.dir?e.dir+m.sep:"")+(e.base||"")},m.parse=function(e){if(!i.isString(e))throw new TypeError("Parameter 'pathString' must be a string, not "+typeof e);var t=g(e);if(!t||4!==t.length)throw new TypeError("Invalid path '"+e+"'");return t[1]=t[1]||"",t[2]=t[2]||"",t[3]=t[3]||"",{root:t[0],dir:t[0]+t[1].slice(0,-1),base:t[2],ext:t[3],name:t[2].slice(0,t[2].length-t[3].length)}},m.sep="/",m.delimiter=":",e.exports=o?u:m,e.exports.posix=m,e.exports.win32=u},155:e=>{var t,n,r=e.exports={};function o(){throw new Error("setTimeout has not been defined")}function i(){throw new Error("clearTimeout has not been defined")}function s(e){if(t===setTimeout)return setTimeout(e,0);if((t===o||!t)&&setTimeout)return t=setTimeout,setTimeout(e,0);try{return t(e,0)}catch(n){try{return t.call(null,e,0)}catch(n){return t.call(this,e,0)}}}!function(){try{t="function"==typeof setTimeout?setTimeout:o}catch(e){t=o}try{n="function"==typeof clearTimeout?clearTimeout:i}catch(e){n=i}}();var a,l=[],c=!1,u=-1;function d(){c&&a&&(c=!1,a.length?l=a.concat(l):u=-1,l.length&&p())}function p(){if(!c){var e=s(d);c=!0;for(var t=l.length;t;){for(a=l,l=[];++u<t;)a&&a[u].run();u=-1,t=l.length}a=null,c=!1,function(e){if(n===clearTimeout)return clearTimeout(e);if((n===i||!n)&&clearTimeout)return n=clearTimeout,clearTimeout(e);try{n(e)}catch(t){try{return n.call(null,e)}catch(t){return n.call(this,e)}}}(e)}}function f(e,t){this.fun=e,this.array=t}function h(){}r.nextTick=function(e){var t=new Array(arguments.length-1);if(arguments.length>1)for(var n=1;n<arguments.length;n++)t[n-1]=arguments[n];l.push(new f(e,t)),1!==l.length||c||s(p)},f.prototype.run=function(){this.fun.apply(null,this.array)},r.title="browser",r.browser=!0,r.env={},r.argv=[],r.version="",r.versions={},r.on=h,r.addListener=h,r.once=h,r.off=h,r.removeListener=h,r.removeAllListeners=h,r.emit=h,r.prependListener=h,r.prependOnceListener=h,r.listeners=function(e){return[]},r.binding=function(e){throw new Error("process.binding is not supported")},r.cwd=function(){return"/"},r.chdir=function(e){throw new Error("process.chdir is not supported")},r.umask=function(){return 0}},384:e=>{e.exports=function(e){return e&&"object"==typeof e&&"function"==typeof e.copy&&"function"==typeof e.fill&&"function"==typeof e.readUInt8}},539:(e,t,n)=>{var r=n(155),o=/%[sdj%]/g;t.format=function(e){if(!y(e)){for(var t=[],n=0;n<arguments.length;n++)t.push(a(arguments[n]));return t.join(" ")}n=1;for(var r=arguments,i=r.length,s=String(e).replace(o,(function(e){if("%%"===e)return"%";if(n>=i)return e;switch(e){case"%s":return String(r[n++]);case"%d":return Number(r[n++]);case"%j":try{return JSON.stringify(r[n++])}catch(e){return"[Circular]"}default:return e}})),l=r[n];n<i;l=r[++n])m(l)||!w(l)?s+=" "+l:s+=" "+a(l);return s},t.deprecate=function(e,o){if(v(n.g.process))return function(){return t.deprecate(e,o).apply(this,arguments)};if(!0===r.noDeprecation)return e;var i=!1;return function(){if(!i){if(r.throwDeprecation)throw new Error(o);r.traceDeprecation?console.trace(o):console.error(o),i=!0}return e.apply(this,arguments)}};var i,s={};function a(e,n){var r={seen:[],stylize:c};return arguments.length>=3&&(r.depth=arguments[2]),arguments.length>=4&&(r.colors=arguments[3]),h(n)?r.showHidden=n:n&&t._extend(r,n),v(r.showHidden)&&(r.showHidden=!1),v(r.depth)&&(r.depth=2),v(r.colors)&&(r.colors=!1),v(r.customInspect)&&(r.customInspect=!0),r.colors&&(r.stylize=l),u(r,e,r.depth)}function l(e,t){var n=a.styles[t];return n?"["+a.colors[n][0]+"m"+e+"["+a.colors[n][1]+"m":e}function c(e,t){return e}function u(e,n,r){if(e.customInspect&&n&&x(n.inspect)&&n.inspect!==t.inspect&&(!n.constructor||n.constructor.prototype!==n)){var o=n.inspect(r,e);return y(o)||(o=u(e,o,r)),o}var i=function(e,t){if(v(t))return e.stylize("undefined","undefined");if(y(t)){var n="'"+JSON.stringify(t).replace(/^"|"$/g,"").replace(/'/g,"\\'").replace(/\\"/g,'"')+"'";return e.stylize(n,"string")}return g(t)?e.stylize(""+t,"number"):h(t)?e.stylize(""+t,"boolean"):m(t)?e.stylize("null","null"):void 0}(e,n);if(i)return i;var s=Object.keys(n),a=function(e){var t={};return e.forEach((function(e,n){t[e]=!0})),t}(s);if(e.showHidden&&(s=Object.getOwnPropertyNames(n)),C(n)&&(s.indexOf("message")>=0||s.indexOf("description")>=0))return d(n);if(0===s.length){if(x(n)){var l=n.name?": "+n.name:"";return e.stylize("[Function"+l+"]","special")}if(b(n))return e.stylize(RegExp.prototype.toString.call(n),"regexp");if(_(n))return e.stylize(Date.prototype.toString.call(n),"date");if(C(n))return d(n)}var c,w="",S=!1,T=["{","}"];return f(n)&&(S=!0,T=["[","]"]),x(n)&&(w=" [Function"+(n.name?": "+n.name:"")+"]"),b(n)&&(w=" "+RegExp.prototype.toString.call(n)),_(n)&&(w=" "+Date.prototype.toUTCString.call(n)),C(n)&&(w=" "+d(n)),0!==s.length||S&&0!=n.length?r<0?b(n)?e.stylize(RegExp.prototype.toString.call(n),"regexp"):e.stylize("[Object]","special"):(e.seen.push(n),c=S?function(e,t,n,r,o){for(var i=[],s=0,a=t.length;s<a;++s)k(t,String(s))?i.push(p(e,t,n,r,String(s),!0)):i.push("");return o.forEach((function(o){o.match(/^\d+$/)||i.push(p(e,t,n,r,o,!0))})),i}(e,n,r,a,s):s.map((function(t){return p(e,n,r,a,t,S)})),e.seen.pop(),function(e,t,n){return e.reduce((function(e,t){return t.indexOf("\n"),e+t.replace(/\u001b\[\d\d?m/g,"").length+1}),0)>60?n[0]+(""===t?"":t+"\n ")+" "+e.join(",\n  ")+" "+n[1]:n[0]+t+" "+e.join(", ")+" "+n[1]}(c,w,T)):T[0]+w+T[1]}function d(e){return"["+Error.prototype.toString.call(e)+"]"}function p(e,t,n,r,o,i){var s,a,l;if((l=Object.getOwnPropertyDescriptor(t,o)||{value:t[o]}).get?a=l.set?e.stylize("[Getter/Setter]","special"):e.stylize("[Getter]","special"):l.set&&(a=e.stylize("[Setter]","special")),k(r,o)||(s="["+o+"]"),a||(e.seen.indexOf(l.value)<0?(a=m(n)?u(e,l.value,null):u(e,l.value,n-1)).indexOf("\n")>-1&&(a=i?a.split("\n").map((function(e){return"  "+e})).join("\n").substr(2):"\n"+a.split("\n").map((function(e){return"   "+e})).join("\n")):a=e.stylize("[Circular]","special")),v(s)){if(i&&o.match(/^\d+$/))return a;(s=JSON.stringify(""+o)).match(/^"([a-zA-Z_][a-zA-Z_0-9]*)"$/)?(s=s.substr(1,s.length-2),s=e.stylize(s,"name")):(s=s.replace(/'/g,"\\'").replace(/\\"/g,'"').replace(/(^"|"$)/g,"'"),s=e.stylize(s,"string"))}return s+": "+a}function f(e){return Array.isArray(e)}function h(e){return"boolean"==typeof e}function m(e){return null===e}function g(e){return"number"==typeof e}function y(e){return"string"==typeof e}function v(e){return void 0===e}function b(e){return w(e)&&"[object RegExp]"===S(e)}function w(e){return"object"==typeof e&&null!==e}function _(e){return w(e)&&"[object Date]"===S(e)}function C(e){return w(e)&&("[object Error]"===S(e)||e instanceof Error)}function x(e){return"function"==typeof e}function S(e){return Object.prototype.toString.call(e)}function T(e){return e<10?"0"+e.toString(10):e.toString(10)}t.debuglog=function(e){if(v(i)&&(i=r.env.NODE_DEBUG||""),e=e.toUpperCase(),!s[e])if(new RegExp("\\b"+e+"\\b","i").test(i)){var n=r.pid;s[e]=function(){var r=t.format.apply(t,arguments);console.error("%s %d: %s",e,n,r)}}else s[e]=function(){};return s[e]},t.inspect=a,a.colors={bold:[1,22],italic:[3,23],underline:[4,24],inverse:[7,27],white:[37,39],grey:[90,39],black:[30,39],blue:[34,39],cyan:[36,39],green:[32,39],magenta:[35,39],red:[31,39],yellow:[33,39]},a.styles={special:"cyan",number:"yellow",boolean:"yellow",undefined:"grey",null:"bold",string:"green",date:"magenta",regexp:"red"},t.isArray=f,t.isBoolean=h,t.isNull=m,t.isNullOrUndefined=function(e){return null==e},t.isNumber=g,t.isString=y,t.isSymbol=function(e){return"symbol"==typeof e},t.isUndefined=v,t.isRegExp=b,t.isObject=w,t.isDate=_,t.isError=C,t.isFunction=x,t.isPrimitive=function(e){return null===e||"boolean"==typeof e||"number"==typeof e||"string"==typeof e||"symbol"==typeof e||void 0===e},t.isBuffer=n(384);var A=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];function O(){var e=new Date,t=[T(e.getHours()),T(e.getMinutes()),T(e.getSeconds())].join(":");return[e.getDate(),A[e.getMonth()],t].join(" ")}function k(e,t){return Object.prototype.hasOwnProperty.call(e,t)}t.log=function(){console.log("%s - %s",O(),t.format.apply(t,arguments))},t.inherits=n(717),t._extend=function(e,t){if(!t||!w(t))return e;for(var n=Object.keys(t),r=n.length;r--;)e[n[r]]=t[n[r]];return e}}},t={};function n(r){var o=t[r];if(void 0!==o)return o.exports;var i=t[r]={exports:{}};return e[r].call(i.exports,i,i.exports,n),i.exports}n.n=e=>{var t=e&&e.__esModule?()=>e.default:()=>e;return n.d(t,{a:t}),t},n.d=(e,t)=>{for(var r in t)n.o(t,r)&&!n.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})},n.g=function(){if("object"==typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"==typeof window)return window}}(),n.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),n.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var r={};return(()=>{"use strict";n.r(r),n.d(r,{LSPluginUser:()=>$,setupPluginUserInstance:()=>H});var e=n(520);n(856);const t="win32"===navigator.platform.toLowerCase()?e.win32:e.posix;function o(e){return e===Object(e)&&!Array.isArray(e)}function i(e,...t){if(!t.length)return e;const n=e;if(o(n)){const e=t.length;for(let r=0;r<e;r+=1){const e=t[r];if(o(e))for(const t in e)e.hasOwnProperty(t)&&(o(e[t])?(n[t]&&o(n[t])||(n[t]={}),i(n[t],e[t])):Array.isArray(n[t])&&Array.isArray(e[t])?n[t]=Array.from(new Set(n[t].concat(e[t]))):n[t]=e[t])}}return n}function s(e,t){let n,r,o=!1;const i=t=>n=>{e&&clearTimeout(e),t(n),o=!0},s=new Promise(((o,s)=>{n=i(o),r=i(s),e&&(e=setTimeout((()=>r(new Error(`[deferred timeout] ${t}`))),e))}));return{created:Date.now(),setTag:e=>t=e,resolve:n,reject:r,promise:s,get settled(){return o}}}new Map;var a=n(227),l=n.n(a);const c="application/x-postmate-v1+json";let u=0;const d={handshake:1,"handshake-reply":1,call:1,emit:1,reply:1,request:1},p=(e,t)=>!("string"==typeof t&&e.origin!==t||!e.data||"object"==typeof e.data&&!("postmate"in e.data)||e.data.type!==c||!d[e.data.postmate]);class f{parent;frame;child;events={};childOrigin;listener;constructor(e){this.parent=e.parent,this.frame=e.frame,this.child=e.child,this.childOrigin=e.childOrigin,this.listener=e=>{if(!p(e,this.childOrigin))return!1;const{data:t,name:n}=((e||{}).data||{}).value||{};"emit"===e.data.postmate&&n in this.events&&this.events[n].forEach((e=>{e.call(this,t)}))},this.parent.addEventListener("message",this.listener,!1)}get(e){return new Promise((t=>{const n=++u,r=e=>{e.data.uid===n&&"reply"===e.data.postmate&&(this.parent.removeEventListener("message",r,!1),t(e.data.value))};this.parent.addEventListener("message",r,!1),this.child.postMessage({postmate:"request",type:c,property:e,uid:n},this.childOrigin)}))}call(e,t){this.child.postMessage({postmate:"call",type:c,property:e,data:t},this.childOrigin)}on(e,t){this.events[e]||(this.events[e]=[]),this.events[e].push(t)}destroy(){window.removeEventListener("message",this.listener,!1),this.frame.parentNode.removeChild(this.frame)}}class h{model;parent;parentOrigin;child;constructor(e){this.model=e.model,this.parent=e.parent,this.parentOrigin=e.parentOrigin,this.child=e.child,this.child.addEventListener("message",(e=>{if(!p(e,this.parentOrigin))return;const{property:t,uid:n,data:r}=e.data;"call"!==e.data.postmate?((e,t)=>{const n="function"==typeof e[t]?e[t]():e[t];return Promise.resolve(n)})(this.model,t).then((r=>{e.source.postMessage({property:t,postmate:"reply",type:c,uid:n,value:r},e.origin)})):t in this.model&&"function"==typeof this.model[t]&&this.model[t](r)}))}emit(e,t){this.parent.postMessage({postmate:"emit",type:c,value:{name:e,data:t}},this.parentOrigin)}}class m{static debug=!1;container;parent;frame;child;childOrigin;url;model;static Model;constructor(e){this.container=e.container,this.url=e.url,this.parent=window,this.frame=document.createElement("iframe"),e.id&&(this.frame.id=e.id),e.name&&(this.frame.name=e.name),this.frame.classList.add.apply(this.frame.classList,e.classListArray||[]),this.container.appendChild(this.frame),this.child=this.frame.contentWindow,this.model=e.model||{}}sendHandshake(e){const t=(e=>{const t=document.createElement("a");t.href=e;const n=t.protocol.length>4?t.protocol:window.location.protocol,r=t.host.length?"80"===t.port||"443"===t.port?t.hostname:t.host:window.location.host;return t.origin||`${n}//${r}`})(e=e||this.url);let n,r=0;return new Promise(((o,i)=>{const s=e=>!!p(e,t)&&("handshake-reply"===e.data.postmate?(clearInterval(n),this.parent.removeEventListener("message",s,!1),this.childOrigin=e.origin,o(new f(this))):i("Failed handshake"));this.parent.addEventListener("message",s,!1);const a=()=>{r++,this.child.postMessage({postmate:"handshake",type:c,model:this.model},t),5===r&&clearInterval(n)};this.frame.addEventListener("load",(()=>{a(),n=setInterval(a,500)})),this.frame.src=e}))}}class g{child;model;parent;parentOrigin;constructor(e){this.child=window,this.model=e,this.parent=this.child.parent}sendHandshakeReply(){return new Promise(((e,t)=>{const n=r=>{if(r.data.postmate){if("handshake"===r.data.postmate){this.child.removeEventListener("message",n,!1),r.source.postMessage({postmate:"handshake-reply",type:c},r.origin),this.parentOrigin=r.origin;const t=r.data.model;return t&&Object.keys(t).forEach((e=>{this.model[e]=t[e]})),e(new h(this))}return t("Handshake Reply Failed")}};this.child.addEventListener("message",n,!1)}))}}var y=n(729),v=n.n(y);const{importHTML:b,createSandboxContainer:w}=window.QSandbox||{};function _(e,t){return e.startsWith("http")?fetch(e,t):(e=e.replace("file://",""),new Promise((async(t,n)=>{try{const n=await window.apis.doAction(["readFile",e]);t({text:()=>n})}catch(e){console.error(e),n(e)}})))}class C extends(v()){_pluginLocal;_frame;_root;_loaded=!1;_unmountFns=[];constructor(e){super(),this._pluginLocal=e,e._dispose((()=>{this._unmount()}))}async load(){const{name:e,entry:t}=this._pluginLocal.options;if(this.loaded||!t)return;const{template:n,execScripts:r}=await b(t,{fetch:_});this._mount(n,document.body);const o=w(e,{elementGetter:()=>this._root?.firstChild}).instance.proxy;o.__shadow_mode__=!0,o.LSPluginLocal=this._pluginLocal,o.LSPluginShadow=this,o.LSPluginUser=o.logseq=new $(this._pluginLocal.toJSON(),this._pluginLocal.caller);const i=await r(o,!0);this._unmountFns.push(i.unmount),this._loaded=!0}_mount(e,t){const n=this._frame=document.createElement("div");n.classList.add("lsp-shadow-sandbox"),n.id=this._pluginLocal.id,this._root=n.attachShadow({mode:"open"}),this._root.innerHTML=`<div>${e}</div>`,t.appendChild(n),this.emit("mounted")}_unmount(){for(const e of this._unmountFns)e&&e.call(null)}destroy(){this.frame?.parentNode?.removeChild(this.frame)}get loaded(){return this._loaded}get document(){return this._root?.firstChild}get frame(){return this._frame}}const x=l()("LSPlugin:caller"),S="#await#response#",T="#lspmsg#error#",A=e=>`#lspmsg#${e}`;class O extends(v()){_pluginLocal;_connected=!1;_parent;_child;_shadow;_status;_userModel={};_call;_callUserModel;_debugTag="";constructor(e){super(),this._pluginLocal=e,e&&(this._debugTag=e.debugTag)}async connectToChild(){if(this._connected)return;const{shadow:e}=this._pluginLocal;e?await this._setupShadowSandbox():await this._setupIframeSandbox()}async connectToParent(e={}){if(this._connected)return;const t=this,n=null!=this._pluginLocal;let r=0,o=0;const i=new Map,a=s(5e3),l=this._extendUserModel({"#lspmsg#ready#":async e=>{l[A(e?.pid)]=({type:e,payload:n})=>{x(`[call from host (_call)] ${this._debugTag}`,e,n),t.emit(e,n)},await a.resolve()},"#lspmsg#beforeunload#":async e=>{const n=s(1e4);t.emit("beforeunload",Object.assign({actor:n},e)),await n.promise},"#lspmsg#settings#":async({type:e,payload:n})=>{t.emit("settings:changed",n)},"#lspmsg#":async({ns:e,type:n,payload:r})=>{x(`[call from host (async)] ${this._debugTag}`,e,n,r),e&&e.startsWith("hook")?t.emit(`${e}:${n}`,r):t.emit(n,r)},"#lspmsg#reply#":({_sync:e,result:t})=>{if(x(`[sync reply] #${e}`,t),i.has(e)){const n=i.get(e);n&&(t?.hasOwnProperty(T)?n.reject(t[T]):n.resolve(t),i.delete(e))}},...e});if(n)return await a.promise,JSON.parse(JSON.stringify(this._pluginLocal?.toJSON()));const c=new g(l).sendHandshakeReply();return this._status="pending",await c.then((e=>{this._child=e,this._connected=!0,this._call=async(t,n={},r)=>{if(r){const e=++o;i.set(e,r),n._sync=e,r.setTag(`async call #${e}`),x("async call #",e)}return e.emit(A(l.baseInfo.id),{type:t,payload:n}),r?.promise},this._callUserModel=async(e,t)=>{try{l[e](t)}catch(t){x(`[model method] #${e} not existed`)}},r=setInterval((()=>{if(i.size>100)for(const[e,t]of i)t.settled&&i.delete(e)}),18e5)})).finally((()=>{this._status=void 0})),await a.promise,l.baseInfo}async call(e,t={}){return this._call?.call(this,e,t)}async callAsync(e,t={}){const n=s(1e4);return this._call?.call(this,e,t,n)}async callUserModel(e,t={}){return this._callUserModel?.call(this,e,t)}async _setupIframeSandbox(){const e=this._pluginLocal,t=e.id,n=new URL(e.options.entry);n.searchParams.set("__v__",e.options.version);const r=document.querySelector(`#${t}`);r&&r.parentElement.removeChild(r);const o=document.createElement("div");o.classList.add("lsp-iframe-sandbox-container"),o.id=t;{const e=this._pluginLocal.settings.get("layout")?.[0];if(e){o.dataset.inited_layout="true";const{width:t,height:n,left:r,top:i}=e;Object.assign(o.style,{width:t+"px",height:n+"px",left:r+"px",top:i+"px"})}}document.body.appendChild(o);let i,s=new m({id:t+"_iframe",container:o,url:n.href,classListArray:["lsp-iframe-sandbox"],model:{baseInfo:JSON.parse(JSON.stringify(e.toJSON()))}}).sendHandshake();return this._status="pending",new Promise(((t,n)=>{i=setTimeout((()=>{n(new Error("handshake Timeout"))}),3e3),s.then((n=>{this._parent=n,this._connected=!0,this.emit("connected"),n.on(A(e.id),(({type:e,payload:t})=>{x("[call from plugin] ",e,t),this._pluginLocal?.emit(e,t||{})})),this._call=async(...t)=>{await n.call(A(e.id),{type:t[0],payload:Object.assign(t[1]||{},{$$pid:e.id})})},this._callUserModel=async(e,t)=>{if(e.startsWith(S))return await n.get(e.replace(S,""));n.call(e,t)},t(null)})).catch((e=>{n(e)})).finally((()=>{clearTimeout(i)}))})).catch((e=>{throw x("[iframe sandbox] error",e),e})).finally((()=>{this._status=void 0}))}async _setupShadowSandbox(){const e=this._pluginLocal,t=this._shadow=new C(e);try{this._status="pending",await t.load(),this._connected=!0,this.emit("connected"),this._call=async(t,n={},r)=>(r&&(n.actor=r),this._pluginLocal?.emit(t,Object.assign(n,{$$pid:e.id})),r?.promise),this._callUserModel=async(...e)=>{let t=e[0];t?.startsWith(S)&&(t=t.replace(S,""));const n=e[1]||{},r=this._userModel[t];"function"==typeof r&&await r.call(null,n)}}catch(e){throw x("[shadow sandbox] error",e),e}finally{this._status=void 0}}_extendUserModel(e){return Object.assign(this._userModel,e)}_getSandboxIframeContainer(){return this._parent?.frame.parentNode}_getSandboxShadowContainer(){return this._shadow?.frame.parentNode}_getSandboxIframeRoot(){return this._parent?.frame}_getSandboxShadowRoot(){return this._shadow?.frame}set debugTag(e){this._debugTag=e}async destroy(){let e=null;this._parent&&(e=this._getSandboxIframeContainer(),await this._parent.destroy()),this._shadow&&(e=this._getSandboxShadowContainer(),this._shadow.destroy()),e?.parentNode.removeChild(e)}}var k=function(){return(k=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var o in t=arguments[n])Object.prototype.hasOwnProperty.call(t,o)&&(e[o]=t[o]);return e}).apply(this,arguments)};function E(e){return e.toLowerCase()}Object.create,Object.create;var F=[/([a-z0-9])([A-Z])/g,/([A-Z])([A-Z][a-z])/g],L=/[^A-Z0-9]+/gi;function M(e,t,n){return t instanceof RegExp?e.replace(t,n):t.reduce((function(e,t){return e.replace(t,n)}),e)}class j{ctx;constructor(e){this.ctx=e}get ctxId(){return this.ctx.baseInfo.id}setItem(e,t){return this.ctx.caller.callAsync("api:call",{method:"write-plugin-storage-file",args:[this.ctxId,e,t]})}getItem(e){return this.ctx.caller.callAsync("api:call",{method:"read-plugin-storage-file",args:[this.ctxId,e]})}removeItem(e){return this.ctx.caller.call("api:call",{method:"unlink-plugin-storage-file",args:[this.ctxId,e]})}clear(){return this.ctx.caller.call("api:call",{method:"clear-plugin-storage-files",args:[this.ctxId]})}hasItem(e){return this.ctx.caller.callAsync("api:call",{method:"exist-plugin-storage-file",args:[this.ctxId,e]})}}const I=Symbol.for("proxy-continue"),N=l()("LSPlugin:user");function R(e,t,n){if("function"!=typeof n)return!1;const{key:r,label:o,desc:i,palette:s,keybinding:a}=t,l=`SimpleCommandHook${r}${++U}`;this.Editor["on"+l](n),this.caller?.call("api:call",{method:"register-plugin-simple-command",args:[this.baseInfo.id,[{key:r,label:o,type:e,desc:i,keybinding:a},["editor/hook",l]],s]})}const D={registerCommand:R,registerCommandPalette(e,t){const{key:n,label:r,keybinding:o}=e;return R.call(this,"global-palette-command",{key:n,label:r,palette:!0,keybinding:o},t)},registerUIItem(e,t){const n=this.baseInfo.id;this.caller?.call("api:call",{method:"register-plugin-ui-item",args:[n,e,t]})},registerPageMenuItem(e,t){if("function"!=typeof t)return!1;const n=e+"_"+this.baseInfo.id,r=e;R.call(this,"page-menu-item",{key:n,label:r},t)},setFullScreen(e){const t=(...e)=>this._callWin("setFullScreen",...e);"toggle"===e?this._callWin("isFullScreen").then((e=>{e?t():t(!0)})):e?t(!0):t()}};let U=0;const P={registerSlashCommand(e,t){N("Register slash command #",this.baseInfo.id,e,t),"function"==typeof t&&(t=[["editor/clear-current-slash",!1],["editor/restore-saved-cursor"],["editor/hook",t]]),t=t.map((e=>{const[t,...n]=e;switch(t){case"editor/hook":let r=n[0],o=()=>{this.caller?.callUserModel(r)};"function"==typeof r&&(o=r);const i=`SlashCommandHook${t}${++U}`;e[1]=i,this.Editor["on"+i](o)}return e})),this.caller?.call("api:call",{method:"register-plugin-slash-command",args:[this.baseInfo.id,[e,t]]})},registerBlockContextMenuItem(e,t){if("function"!=typeof t)return!1;const n=e+"_"+this.baseInfo.id,r=e;R.call(this,"block-context-menu-item",{key:n,label:r},t)},scrollToBlockInPage(e,t){const n="block-content-"+t;this.App.pushState("page",{name:e},{anchor:n})}},z={};class $ extends(v()){_baseInfo;_caller;_connected=!1;_ui=new Map;_fileStorage;_beforeunloadCallback;constructor(e,t){super(),this._baseInfo=e,this._caller=t,t.on("sys:ui:visible",(e=>{e?.toggle&&this.toggleMainUI()})),t.on("settings:changed",(e=>{const t=Object.assign({},this.settings),n=Object.assign(this._baseInfo.settings,e);this.emit("settings:changed",{...n},t)})),t.on("beforeunload",(async e=>{const{actor:n,...r}=e,o=this._beforeunloadCallback;try{o&&await o(r),n?.resolve(null)}catch(e){console.debug(`${t.debugTag} [beforeunload] `,e),n?.reject(e)}})),this._fileStorage=new j(this)}async ready(e,t){if(!this._connected)try{"function"==typeof e&&(t=e,e={});let n=await this._caller.connectToParent(e);n=i(this._baseInfo,n),this._connected=!0,n?.id&&(this._caller.debugTag=`#${n.id} [${n.name}]`),t&&t.call(this,n)}catch(e){console.error("[LSPlugin Ready Error]",e)}}ensureConnected(){if(!this._connected)throw new Error("not connected")}beforeunload(e){"function"==typeof e&&(this._beforeunloadCallback=e)}provideModel(e){return this.caller._extendUserModel(e),this}provideTheme(e){return this.caller.call("provider:theme",e),this}provideStyle(e){return this.caller.call("provider:style",e),this}provideUI(e){return this.caller.call("provider:ui",e),this}updateSettings(e){this.caller.call("settings:update",e)}setMainUIAttrs(e){this.caller.call("main-ui:attrs",e)}setMainUIInlineStyle(e){this.caller.call("main-ui:style",e)}hideMainUI(e){const t={key:0,visible:!1,cursor:e?.restoreEditingCursor};this.caller.call("main-ui:visible",t),this.emit("ui:visible:changed",t),this._ui.set(t.key,t)}showMainUI(e){const t={key:0,visible:!0,autoFocus:e?.autoFocus};this.caller.call("main-ui:visible",t),this.emit("ui:visible:changed",t),this._ui.set(t.key,t)}toggleMainUI(){const e=this._ui.get(0);e&&e.visible?this.hideMainUI():this.showMainUI()}get isMainUIVisible(){const e=this._ui.get(0);return Boolean(e&&e.visible)}get connected(){return this._connected}get baseInfo(){return this._baseInfo}get settings(){return this.baseInfo?.settings}get caller(){return this._caller}resolveResourceFullUrl(e){if(this.ensureConnected(),e)return e=e.replace(/^[.\\/]+/,""),function(e,...n){try{const r=new URL(e);if(!r.origin)throw new Error(null);const o=t.join(e.substr(r.origin.length),...n);return r.origin+o}catch(r){return t.join(e,...n)}}(this._baseInfo.lsr,e)}_makeUserProxy(e,t){const n=this,r=this.caller;return new Proxy(e,{get(e,o,i){const s=e[o];return function(...e){if(!s||s.apply(n,e)===I){if(t){const n=o.toString().match(/^(once|off|on)/i);if(null!=n){const o=n[0].toLowerCase(),s=n.input.slice(o.length),l=`hook:${t}:${i=s,void 0===a&&(a={}),function(e,t){return void 0===t&&(t={}),function(e,t){void 0===t&&(t={});for(var n=t.splitRegexp,r=void 0===n?F:n,o=t.stripRegexp,i=void 0===o?L:o,s=t.transform,a=void 0===s?E:s,l=t.delimiter,c=void 0===l?" ":l,u=M(M(e,r,"$1\0$2"),i,"\0"),d=0,p=u.length;"\0"===u.charAt(d);)d++;for(;"\0"===u.charAt(p-1);)p--;return u.slice(d,p).split("\0").map(a).join(c)}(e,k({delimiter:"."},t))}(i,k({delimiter:"_"},a))}`,c=e[0];return r[o](l,c),"off"!==o?()=>r.off(l,c):void 0}}var i,a;return r.callAsync("api:call",{tag:t,method:o,args:e})}}}})}_callWin(...e){return this._caller.callAsync("api:call",{method:"_callMainWin",args:e})}get App(){return this._makeUserProxy(D,"app")}get Editor(){return this._makeUserProxy(P,"editor")}get DB(){return this._makeUserProxy(z)}get FileStorage(){return this._fileStorage}}function H(e,t){return new $(e,t)}if(null==window.__LSP__HOST__){const e=new O(null);window.logseq=H({},e)}})(),r})()}));

/***/ }),

/***/ "./src/common/funcs.ts":
/*!*****************************!*\
  !*** ./src/common/funcs.ts ***!
  \*****************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.getCurrentPage = exports.getCurrentBlockUUID = exports.scrollToBlockInPage = exports.readClipboard = exports.writeClipboard = exports.getSettings = exports.initSettings = exports.defaultSettings = exports.debug = exports.setNumber = exports.getNumber = exports.resetNumber = exports.sleep = void 0;
__webpack_require__(/*! @logseq/libs */ "./node_modules/@logseq/libs/dist/lsplugin.user.js");
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
exports.sleep = sleep;
const tempCache = {
    clipboard: '',
    lastPage: '',
};
const numberCache = {
    n: 1,
    lastChange: null
};
const resetNumber = () => {
    numberCache.n = 1;
    numberCache.lastChange = null;
};
exports.resetNumber = resetNumber;
const getNumber = () => {
    const now = new Date();
    if (numberCache.lastChange && now.getTime() - numberCache.lastChange.getTime() >= 10000) {
        (0, exports.resetNumber)();
    }
    return numberCache.n;
};
exports.getNumber = getNumber;
const setNumber = (n) => {
    const now = new Date();
    if (numberCache.lastChange === null) {
        if (n > 0) {
            numberCache.n = n;
            numberCache.lastChange = now;
        }
    }
    else {
        if (now.getTime() - numberCache.lastChange.getTime() >= 1000) {
            numberCache.n = n;
            numberCache.lastChange = now;
        }
        else {
            numberCache.n = numberCache.n * 10 + n;
            numberCache.lastChange = now;
        }
    }
};
exports.setNumber = setNumber;
const debugMode = true;
const debug = (msg, status = 'success') => {
    if (debugMode) {
        // logseq.App.showMsg(msg, status);
        console.log(msg);
    }
};
exports.debug = debug;
const settingsVersion = 'v1';
exports.defaultSettings = {
    bottom: 'shift+g',
    collapse: 'z m',
    collapseAll: 'z shift+m',
    copyCurrentBlockContent: 'y y',
    copyCurrentBlockRef: 'shift+y',
    deleteCurrentBlock: 'd d',
    down: 'j',
    extend: 'z o',
    extendAll: 'z shift+o',
    highlightFocusIn: 'shift+l',
    highlightFocusOut: 'shift+h',
    indent: 'l',
    insert: ['i', 'a'],
    insertBefore: 'shift+i',
    nextNewBlock: 'o',
    nextSibling: 'shift+j',
    outdent: 'h',
    pasteNext: 'p',
    pastePrev: 'shift+p',
    prevNewBlock: 'shift+o',
    prevSibling: 'shift+k',
    redo: 'ctrl+r',
    search: '/',
    searchBaidu: 's b',
    searchGithub: 's h',
    searchGoogle: 's g',
    searchStackoverflow: 's s',
    searchWikipedia: 's e',
    searchYoutube: 's y',
    top: 'shift+t',
    undo: 'u',
    up: 'k',
    exitEditing: ['mod+j mod+j', 'ctrl+['],
    jumpInto: 'mod+shift+enter',
    joinNextLine: 'mod+alt+j',
    settingsVersion,
    disabled: false,
};
const initSettings = () => {
    let settings = logseq.settings;
    const shouldUpdateSettings = !settings || settings.settingsVersion != exports.defaultSettings.settingsVersion;
    if (shouldUpdateSettings) {
        settings = exports.defaultSettings;
        logseq.updateSettings(settings);
    }
};
exports.initSettings = initSettings;
const getSettings = () => {
    let settings = logseq.settings;
    const merged = Object.assign(exports.defaultSettings, settings);
    return merged;
};
exports.getSettings = getSettings;
const writeClipboard = (content) => {
    tempCache.clipboard = content;
};
exports.writeClipboard = writeClipboard;
const readClipboard = () => {
    return tempCache.clipboard;
};
exports.readClipboard = readClipboard;
const scrollToBlockInPage = (pageName, blockId) => {
    logseq.Editor.scrollToBlockInPage(pageName, blockId);
};
exports.scrollToBlockInPage = scrollToBlockInPage;
const getCurrentBlockUUID = () => __awaiter(void 0, void 0, void 0, function* () {
    let block = yield logseq.Editor.getCurrentBlock();
    return block === null || block === void 0 ? void 0 : block.uuid;
});
exports.getCurrentBlockUUID = getCurrentBlockUUID;
const getCurrentPage = () => __awaiter(void 0, void 0, void 0, function* () {
    let page = yield logseq.Editor.getCurrentPage();
    if (!page) {
        let blockUUID = yield (0, exports.getCurrentBlockUUID)();
        if (blockUUID) {
            let block = yield logseq.Editor.getBlock(blockUUID);
            if (block === null || block === void 0 ? void 0 : block.page.id) {
                page = yield logseq.Editor.getPage(block.page.id);
            }
        }
    }
    if (page === null || page === void 0 ? void 0 : page.name) {
        tempCache.lastPage = page.name;
    }
    return page;
});
exports.getCurrentPage = getCurrentPage;


/***/ }),

/***/ "./src/keybindings/bottom.ts":
/*!***********************************!*\
  !*** ./src/keybindings/bottom.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.bottom) ? settings.bottom : [settings.bottom];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-bottom',
            label: 'Go to current page bottom',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('bottom');
            const page = yield (0, funcs_1.getCurrentPage)();
            if (page === null || page === void 0 ? void 0 : page.name) {
                const blocks = yield logseq.Editor.getPageBlocksTree(page === null || page === void 0 ? void 0 : page.name);
                if (blocks.length > 0) {
                    let block = blocks[blocks.length - 1];
                    (0, funcs_1.scrollToBlockInPage)(page.name, block.uuid);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/collapse.ts":
/*!*************************************!*\
  !*** ./src/keybindings/collapse.ts ***!
  \*************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.collapse) ? settings.collapse : [settings.collapse];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-collapse',
            label: 'Collapse block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Collapse block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                yield logseq.Editor.setBlockCollapsed(blockUUID, { flag: true });
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/copyCurrentBlockContent.ts":
/*!****************************************************!*\
  !*** ./src/keybindings/copyCurrentBlockContent.ts ***!
  \****************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.copyCurrentBlockContent) ? settings.copyCurrentBlockContent : [settings.copyCurrentBlockContent];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-copy-current-block-content',
            label: 'Copy current block content',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Copy current block contents');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                const block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    const { content } = block;
                    (0, funcs_1.writeClipboard)(content);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/copyCurrentBlockRef.ts":
/*!************************************************!*\
  !*** ./src/keybindings/copyCurrentBlockRef.ts ***!
  \************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.copyCurrentBlockRef) ? settings.copyCurrentBlockRef : [settings.copyCurrentBlockRef];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-copy-current-block-ref',
            label: 'Copy current block ref',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            var _a;
            (0, funcs_1.debug)('Copy current block ref');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    if (!((_a = block === null || block === void 0 ? void 0 : block.properties) === null || _a === void 0 ? void 0 : _a.id)) {
                        yield logseq.Editor.upsertBlockProperty(block.uuid, 'id', block.uuid);
                    }
                    const ref = `((${block.uuid}))`;
                    (0, funcs_1.writeClipboard)(ref);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/deleteCurrentBlock.ts":
/*!***********************************************!*\
  !*** ./src/keybindings/deleteCurrentBlock.ts ***!
  \***********************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
const deleteCurrentBlock = (number) => __awaiter(void 0, void 0, void 0, function* () {
    const page = yield (0, funcs_1.getCurrentPage)();
    if (page === null || page === void 0 ? void 0 : page.name) {
        let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
        if (blockUUID) {
            let block = yield logseq.Editor.getBlock(blockUUID);
            if (block === null || block === void 0 ? void 0 : block.uuid) {
                let prevBlock = yield logseq.Editor.getPreviousSiblingBlock(block.uuid);
                let nextBlock, currentBlock;
                currentBlock = block;
                for (let i = 0; i < number; i++) {
                    (0, funcs_1.writeClipboard)(currentBlock.content);
                    nextBlock = yield logseq.Editor.getNextSiblingBlock(currentBlock.uuid);
                    yield logseq.Editor.removeBlock(currentBlock.uuid);
                    if (!nextBlock) {
                        break;
                    }
                    else {
                        currentBlock = nextBlock;
                    }
                }
                let focusBlock = prevBlock || nextBlock || null;
                if (focusBlock === null || focusBlock === void 0 ? void 0 : focusBlock.uuid) {
                    (0, funcs_1.scrollToBlockInPage)(page.name, focusBlock.uuid);
                }
                else if (block.left.id) {
                    const parentBlock = yield logseq.Editor.getBlock(block.left.id);
                    if (parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid) {
                        (0, funcs_1.scrollToBlockInPage)(page.name, parentBlock.uuid);
                    }
                }
            }
        }
    }
    else {
        let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
        if (blockUUID) {
            let block = yield logseq.Editor.getBlock(blockUUID);
            if (block === null || block === void 0 ? void 0 : block.uuid) {
                let prevBlock = yield logseq.Editor.getPreviousSiblingBlock(block.uuid);
                let nextBlock, currentBlock;
                currentBlock = block;
                for (let i = 0; i < number; i++) {
                    (0, funcs_1.writeClipboard)(currentBlock.content);
                    nextBlock = yield logseq.Editor.getNextSiblingBlock(currentBlock.uuid);
                    yield logseq.Editor.removeBlock(currentBlock.uuid);
                    if (!nextBlock) {
                        break;
                    }
                    else {
                        currentBlock = nextBlock;
                    }
                }
                let focusBlock = prevBlock || nextBlock || null;
                if (focusBlock === null || focusBlock === void 0 ? void 0 : focusBlock.uuid) {
                    yield logseq.Editor.editBlock(focusBlock.uuid);
                    yield logseq.Editor.exitEditingMode(true);
                }
                else if (block.left.id) {
                    const parentBlock = yield logseq.Editor.getBlock(block.left.id);
                    if (parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid) {
                        yield logseq.Editor.editBlock(parentBlock.uuid);
                        yield logseq.Editor.exitEditingMode(true);
                    }
                }
            }
        }
    }
});
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.deleteCurrentBlock) ? settings.deleteCurrentBlock : [settings.deleteCurrentBlock];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-delete-current-block',
            label: 'Delete current block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('delete current block');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            yield deleteCurrentBlock(number);
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/down.ts":
/*!*********************************!*\
  !*** ./src/keybindings/down.ts ***!
  \*********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.down) ? settings.down : [settings.down];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-down',
            label: 'down',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Down');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            for (let i = 0; i < number; i++) {
                // @ts-ignore
                yield logseq.App.invokeExternalCommand('logseq.editor/down');
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/exitEditing.ts":
/*!****************************************!*\
  !*** ./src/keybindings/exitEditing.ts ***!
  \****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.exitEditing) ? settings.exitEditing : [settings.exitEditing];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-exit-editing',
            label: 'Exit editing',
            keybinding: {
                mode: 'global',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Exit editing');
            yield logseq.Editor.exitEditingMode(true);
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/extend.ts":
/*!***********************************!*\
  !*** ./src/keybindings/extend.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.extend) ? settings.extend : [settings.extend];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-extend',
            label: 'Extend block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Extend block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                yield logseq.Editor.setBlockCollapsed(blockUUID, { flag: false });
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/highlightFocusIn.ts":
/*!*********************************************!*\
  !*** ./src/keybindings/highlightFocusIn.ts ***!
  \*********************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.highlightFocusIn) ? settings.highlightFocusIn : [settings.highlightFocusIn];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-highlightFocusIn',
            label: 'Highlight focus in',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            var _a;
            (0, funcs_1.debug)('Highlight focus in');
            const page = yield (0, funcs_1.getCurrentPage)();
            if (page === null || page === void 0 ? void 0 : page.name) {
                let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
                if (blockUUID) {
                    let block = yield logseq.Editor.getBlock(blockUUID);
                    if ((block === null || block === void 0 ? void 0 : block.children) && ((_a = block === null || block === void 0 ? void 0 : block.children) === null || _a === void 0 ? void 0 : _a.length) > 0) {
                        let focusInBlock = block.children[block.children.length - 1];
                        if (Array.isArray(focusInBlock) && focusInBlock[0] === 'uuid') {
                            (0, funcs_1.scrollToBlockInPage)(page.name, focusInBlock[1]);
                        }
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/highlightFocusOut.ts":
/*!**********************************************!*\
  !*** ./src/keybindings/highlightFocusOut.ts ***!
  \**********************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.highlightFocusOut) ? settings.highlightFocusOut : [settings.highlightFocusOut];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-highlightFocusOut',
            label: 'Highlight focus out',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Highlight focus out');
            const page = yield (0, funcs_1.getCurrentPage)();
            if (page === null || page === void 0 ? void 0 : page.name) {
                let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
                if (blockUUID) {
                    let block = yield logseq.Editor.getBlock(blockUUID);
                    if (block === null || block === void 0 ? void 0 : block.parent.id) {
                        const parentBlock = yield logseq.Editor.getBlock(block === null || block === void 0 ? void 0 : block.parent.id);
                        if (parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid) {
                            (0, funcs_1.scrollToBlockInPage)(page.name, parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid);
                        }
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/indent.ts":
/*!***********************************!*\
  !*** ./src/keybindings/indent.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.indent) ? settings.indent : [settings.indent];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-indent',
            label: 'indent',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Indent');
            // @ts-ignore
            yield logseq.App.invokeExternalCommand('logseq.editor/indent');
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/insert.ts":
/*!***********************************!*\
  !*** ./src/keybindings/insert.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.insert) ? settings.insert : [settings.insert];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-insert',
            label: 'Enter insert mode',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Insert');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                yield logseq.Editor.editBlock(blockUUID);
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/insertBefore.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/insertBefore.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.insertBefore) ? settings.insertBefore : [settings.insertBefore];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-insert-before',
            label: 'Enter insert mode at first pos ',
            keybinding: {
                mode: 'non-editing',
                binding,
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Insert before');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                yield logseq.Editor.editBlock(blockUUID, {
                    pos: 0
                });
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/joinNextLine.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/joinNextLine.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.joinNextLine) ? settings.joinNextLine : [settings.joinNextLine];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-join-next-line',
            label: 'Join next line',
            keybinding: {
                mode: 'global',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Join next line');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            for (let i = 0; i < number; i++) {
                const block = yield logseq.Editor.getCurrentBlock();
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    const nextBlock = yield logseq.Editor.getNextSiblingBlock(block === null || block === void 0 ? void 0 : block.uuid);
                    if (nextBlock === null || nextBlock === void 0 ? void 0 : nextBlock.uuid) {
                        if ((!block.children || block.children.length === 0) && (!nextBlock.children || nextBlock.children.length === 0)) {
                            if (block.content.search(/\n\s*[^ ]+:: /) === -1) {
                                yield logseq.Editor.updateBlock(block.uuid, block.content + ' ' + nextBlock.content);
                            }
                            else {
                                const pos = block.content.search(/\n\s*[^ ]+:: /);
                                const newContent = block.content.substring(0, pos) + ' ' + nextBlock.content + block.content.substring(pos);
                                yield logseq.Editor.updateBlock(block.uuid, newContent);
                            }
                            yield logseq.Editor.removeBlock(nextBlock.uuid);
                        }
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/jumpInto.ts":
/*!*************************************!*\
  !*** ./src/keybindings/jumpInto.ts ***!
  \*************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.jumpInto) ? settings.jumpInto : [settings.jumpInto];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-jump-internal-link',
            label: 'Jump into internal link',
            keybinding: {
                mode: 'global',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Jump into internal link');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            const block = yield logseq.Editor.getCurrentBlock();
            if (block === null || block === void 0 ? void 0 : block.content) {
                if (/\[\[(.*?)\]\]|#([^ #]+?)/.test(block.content)) {
                    const matchedAll = [...block.content.matchAll(/\[\[(.*?)\]\]|#([^ #]+?)/g)];
                    if (matchedAll[number - 1]) {
                        if (matchedAll[number - 1][0][0] === '#') {
                            logseq.App.pushState('page', { name: matchedAll[number - 1][2] });
                        }
                        else {
                            logseq.App.pushState('page', { name: matchedAll[number - 1][1] });
                        }
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/nextNewBlock.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/nextNewBlock.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.nextNewBlock) ? settings.nextNewBlock : [settings.nextNewBlock];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-next-new-block',
            label: 'Create new next block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('create new next block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    const newBlock = yield logseq.Editor.insertBlock(block.uuid, '', {
                        before: false,
                        sibling: true,
                    });
                    if (newBlock === null || newBlock === void 0 ? void 0 : newBlock.uuid) {
                        yield logseq.Editor.editBlock(newBlock.uuid);
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/nextSibling.ts":
/*!****************************************!*\
  !*** ./src/keybindings/nextSibling.ts ***!
  \****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
const findNextBlockRecur = (page, block) => __awaiter(void 0, void 0, void 0, function* () {
    if (block.parent.id) {
        const parentBlock = yield logseq.Editor.getBlock(block.parent.id);
        if (parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid) {
            const parentNextBlock = yield logseq.Editor.getNextSiblingBlock(parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid);
            if (parentNextBlock === null || parentNextBlock === void 0 ? void 0 : parentNextBlock.uuid) {
                (0, funcs_1.scrollToBlockInPage)(page.name, parentNextBlock.uuid);
            }
            else if (parentBlock.parent.id) {
                yield findNextBlockRecur(page, parentBlock);
            }
        }
    }
});
const goNextSibling = (lastBlockUUID) => __awaiter(void 0, void 0, void 0, function* () {
    const page = yield (0, funcs_1.getCurrentPage)();
    if (page === null || page === void 0 ? void 0 : page.name) {
        let blockUUID = lastBlockUUID || (yield (0, funcs_1.getCurrentBlockUUID)());
        if (blockUUID) {
            let block = yield logseq.Editor.getBlock(blockUUID);
            if (block === null || block === void 0 ? void 0 : block.uuid) {
                const nextBlock = yield logseq.Editor.getNextSiblingBlock(block.uuid);
                if (nextBlock === null || nextBlock === void 0 ? void 0 : nextBlock.uuid) {
                    (0, funcs_1.scrollToBlockInPage)(page.name, nextBlock.uuid);
                    return nextBlock === null || nextBlock === void 0 ? void 0 : nextBlock.uuid;
                }
                else if (block.parent.id) {
                    yield findNextBlockRecur(page, block);
                }
            }
        }
    }
});
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.nextSibling) ? settings.nextSibling : [settings.nextSibling];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-next-sibling',
            label: 'Go to next sibling',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Next sibling');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            let lastBlockUUID;
            for (let i = 0; i < number; i++) {
                // @ts-ignore
                lastBlockUUID = yield goNextSibling(lastBlockUUID);
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/number.ts":
/*!***********************************!*\
  !*** ./src/keybindings/number.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    for (let n of [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) {
        logseq.App.registerCommandPalette({
            key: `vim-shortcut-number-${n}`,
            label: `${n}`,
            keybinding: {
                mode: 'non-editing',
                binding: `${n}`
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)(`${n}`);
            (0, funcs_1.setNumber)(n);
        }));
    }
};


/***/ }),

/***/ "./src/keybindings/outdent.ts":
/*!************************************!*\
  !*** ./src/keybindings/outdent.ts ***!
  \************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.outdent) ? settings.outdent : [settings.outdent];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-outdent',
            label: 'outdent',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Outdent');
            // @ts-ignore
            yield logseq.App.invokeExternalCommand('logseq.editor/outdent');
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/pasteNext.ts":
/*!**************************************!*\
  !*** ./src/keybindings/pasteNext.ts ***!
  \**************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.pasteNext) ? settings.pasteNext : [settings.pasteNext];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-paste-next',
            label: 'Paste to next block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Paste to next block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    yield logseq.Editor.insertBlock(block.uuid, (0, funcs_1.readClipboard)(), {
                        before: false,
                        sibling: true,
                    });
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/pastePrev.ts":
/*!**************************************!*\
  !*** ./src/keybindings/pastePrev.ts ***!
  \**************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.pastePrev) ? settings.pastePrev : [settings.pastePrev];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-paste-prev',
            label: 'Paste to prev block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Paste to prev block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    yield logseq.Editor.insertBlock(block.uuid, (0, funcs_1.readClipboard)(), {
                        before: true,
                        sibling: true,
                    });
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/prevNewBlock.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/prevNewBlock.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.prevNewBlock) ? settings.prevNewBlock : [settings.prevNewBlock];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-prev-new-block',
            label: 'Create new prev block',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Create new prev block');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.uuid) {
                    const newBlock = yield logseq.Editor.insertBlock(block.uuid, '', {
                        before: true,
                        sibling: true,
                    });
                    if (newBlock === null || newBlock === void 0 ? void 0 : newBlock.uuid) {
                        yield logseq.Editor.editBlock(newBlock.uuid);
                    }
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/prevSibling.ts":
/*!****************************************!*\
  !*** ./src/keybindings/prevSibling.ts ***!
  \****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
const goPrevSibling = (lastBlockUUID) => __awaiter(void 0, void 0, void 0, function* () {
    const page = yield (0, funcs_1.getCurrentPage)();
    if (page === null || page === void 0 ? void 0 : page.name) {
        let blockUUID = lastBlockUUID || (yield (0, funcs_1.getCurrentBlockUUID)());
        if (blockUUID) {
            let block = yield logseq.Editor.getBlock(blockUUID);
            if (block === null || block === void 0 ? void 0 : block.uuid) {
                const prevBlock = yield logseq.Editor.getPreviousSiblingBlock(block.uuid);
                if (prevBlock === null || prevBlock === void 0 ? void 0 : prevBlock.uuid) {
                    (0, funcs_1.scrollToBlockInPage)(page.name, prevBlock.uuid);
                    return prevBlock.uuid;
                }
                else if (block.parent.id) {
                    const parentBlock = yield logseq.Editor.getBlock(block.parent.id);
                    if (parentBlock === null || parentBlock === void 0 ? void 0 : parentBlock.uuid) {
                        (0, funcs_1.scrollToBlockInPage)(page.name, parentBlock.uuid);
                        return parentBlock.uuid;
                    }
                }
            }
        }
    }
});
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.prevSibling) ? settings.prevSibling : [settings.prevSibling];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-prev-sibling',
            label: 'Go to previous sibling',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Prev sibling');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            let lastBlockUUID = undefined;
            for (let i = 0; i < number; i++) {
                lastBlockUUID = yield goPrevSibling(lastBlockUUID);
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/redo.ts":
/*!*********************************!*\
  !*** ./src/keybindings/redo.ts ***!
  \*********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.redo) ? settings.redo : [settings.redo];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-redo',
            label: 'Redo',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('redo');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            for (let i = 0; i < number; i++) {
                // @ts-ignore
                yield logseq.App.invokeExternalCommand('logseq.editor/redo');
                yield logseq.Editor.exitEditingMode(true);
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/search.ts":
/*!***********************************!*\
  !*** ./src/keybindings/search.ts ***!
  \***********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.search) ? settings.search : [settings.search];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search',
            label: 'Search',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search');
            // @ts-ignore
            yield logseq.App.invokeExternalCommand('logseq.go/search-in-page');
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchBaidu.ts":
/*!****************************************!*\
  !*** ./src/keybindings/searchBaidu.ts ***!
  \****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchBaidu) ? settings.searchBaidu : [settings.searchBaidu];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-baidu',
            label: 'Search in Baidu',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Baidu');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`https://www.baidu.com/s?wd=${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchGithub.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/searchGithub.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchGithub) ? settings.searchGithub : [settings.searchGithub];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-github',
            label: 'Search in Github',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Github');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`https://github.com/search?q=${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchGoogle.ts":
/*!*****************************************!*\
  !*** ./src/keybindings/searchGoogle.ts ***!
  \*****************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchGoogle) ? settings.searchGoogle : [settings.searchGoogle];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-google',
            label: 'Search in Google',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Google');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`https://www.google.com/search?q=${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchStackoverflow.ts":
/*!************************************************!*\
  !*** ./src/keybindings/searchStackoverflow.ts ***!
  \************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchStackoverflow) ? settings.searchStackoverflow : [settings.searchStackoverflow];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-stackoverflow',
            label: 'Search in Stackoverflow',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Stackoverflow');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`http://stackoverflow.com/search?q=${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchWikipedia.ts":
/*!********************************************!*\
  !*** ./src/keybindings/searchWikipedia.ts ***!
  \********************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchWikipedia) ? settings.searchWikipedia : [settings.searchWikipedia];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-wikipedia',
            label: 'Search in Wikipedia',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Wikipedia');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`https://en.wikipedia.org/wiki/${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/searchYoutube.ts":
/*!******************************************!*\
  !*** ./src/keybindings/searchYoutube.ts ***!
  \******************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.searchYoutube) ? settings.searchYoutube : [settings.searchYoutube];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-search-youtube',
            label: 'Search in Youtube',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Search in Youtube');
            let blockUUID = yield (0, funcs_1.getCurrentBlockUUID)();
            if (blockUUID) {
                let block = yield logseq.Editor.getBlock(blockUUID);
                if (block === null || block === void 0 ? void 0 : block.content) {
                    yield logseq.App.openExternalLink(`https://www.youtube.com/results?search_query=${block.content}`);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/top.ts":
/*!********************************!*\
  !*** ./src/keybindings/top.ts ***!
  \********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.top) ? settings.top : [settings.top];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-top',
            label: 'Go to current page top',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('top');
            const page = yield (0, funcs_1.getCurrentPage)();
            if (page === null || page === void 0 ? void 0 : page.name) {
                const blocks = yield logseq.Editor.getPageBlocksTree(page === null || page === void 0 ? void 0 : page.name);
                if (blocks.length > 0) {
                    let block = blocks[0];
                    (0, funcs_1.scrollToBlockInPage)(page.name, block.uuid);
                }
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/undo.ts":
/*!*********************************!*\
  !*** ./src/keybindings/undo.ts ***!
  \*********************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.undo) ? settings.undo : [settings.undo];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-undo',
            label: 'Undo',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Undo');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            for (let i = 0; i < number; i++) {
                // @ts-ignore
                yield logseq.App.invokeExternalCommand('logseq.editor/undo');
                yield logseq.Editor.exitEditingMode(true);
            }
        }));
    });
};


/***/ }),

/***/ "./src/keybindings/up.ts":
/*!*******************************!*\
  !*** ./src/keybindings/up.ts ***!
  \*******************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
const funcs_1 = __webpack_require__(/*! ../common/funcs */ "./src/common/funcs.ts");
exports["default"] = (logseq) => {
    const settings = (0, funcs_1.getSettings)();
    const bindings = Array.isArray(settings.up) ? settings.up : [settings.up];
    bindings.forEach(binding => {
        logseq.App.registerCommandPalette({
            key: 'vim-shortcut-up',
            label: 'up',
            keybinding: {
                mode: 'non-editing',
                binding
            }
        }, () => __awaiter(void 0, void 0, void 0, function* () {
            (0, funcs_1.debug)('Up');
            const number = (0, funcs_1.getNumber)();
            (0, funcs_1.resetNumber)();
            for (let i = 0; i < number; i++) {
                // @ts-ignore
                yield logseq.App.invokeExternalCommand('logseq.editor/up');
            }
        }));
    });
};


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
__webpack_require__(/*! @logseq/libs */ "./node_modules/@logseq/libs/dist/lsplugin.user.js");
const funcs_1 = __webpack_require__(/*! ./common/funcs */ "./src/common/funcs.ts");
const bottom_1 = __importDefault(__webpack_require__(/*! ./keybindings/bottom */ "./src/keybindings/bottom.ts"));
const collapse_1 = __importDefault(__webpack_require__(/*! ./keybindings/collapse */ "./src/keybindings/collapse.ts"));
const copyCurrentBlockContent_1 = __importDefault(__webpack_require__(/*! ./keybindings/copyCurrentBlockContent */ "./src/keybindings/copyCurrentBlockContent.ts"));
const copyCurrentBlockRef_1 = __importDefault(__webpack_require__(/*! ./keybindings/copyCurrentBlockRef */ "./src/keybindings/copyCurrentBlockRef.ts"));
const deleteCurrentBlock_1 = __importDefault(__webpack_require__(/*! ./keybindings/deleteCurrentBlock */ "./src/keybindings/deleteCurrentBlock.ts"));
const down_1 = __importDefault(__webpack_require__(/*! ./keybindings/down */ "./src/keybindings/down.ts"));
const exitEditing_1 = __importDefault(__webpack_require__(/*! ./keybindings/exitEditing */ "./src/keybindings/exitEditing.ts"));
const extend_1 = __importDefault(__webpack_require__(/*! ./keybindings/extend */ "./src/keybindings/extend.ts"));
const highlightFocusIn_1 = __importDefault(__webpack_require__(/*! ./keybindings/highlightFocusIn */ "./src/keybindings/highlightFocusIn.ts"));
const highlightFocusOut_1 = __importDefault(__webpack_require__(/*! ./keybindings/highlightFocusOut */ "./src/keybindings/highlightFocusOut.ts"));
const indent_1 = __importDefault(__webpack_require__(/*! ./keybindings/indent */ "./src/keybindings/indent.ts"));
const insert_1 = __importDefault(__webpack_require__(/*! ./keybindings/insert */ "./src/keybindings/insert.ts"));
const insertBefore_1 = __importDefault(__webpack_require__(/*! ./keybindings/insertBefore */ "./src/keybindings/insertBefore.ts"));
const joinNextLine_1 = __importDefault(__webpack_require__(/*! ./keybindings/joinNextLine */ "./src/keybindings/joinNextLine.ts"));
const jumpInto_1 = __importDefault(__webpack_require__(/*! ./keybindings/jumpInto */ "./src/keybindings/jumpInto.ts"));
const nextNewBlock_1 = __importDefault(__webpack_require__(/*! ./keybindings/nextNewBlock */ "./src/keybindings/nextNewBlock.ts"));
const nextSibling_1 = __importDefault(__webpack_require__(/*! ./keybindings/nextSibling */ "./src/keybindings/nextSibling.ts"));
const number_1 = __importDefault(__webpack_require__(/*! ./keybindings/number */ "./src/keybindings/number.ts"));
const outdent_1 = __importDefault(__webpack_require__(/*! ./keybindings/outdent */ "./src/keybindings/outdent.ts"));
const pasteNext_1 = __importDefault(__webpack_require__(/*! ./keybindings/pasteNext */ "./src/keybindings/pasteNext.ts"));
const pastePrev_1 = __importDefault(__webpack_require__(/*! ./keybindings/pastePrev */ "./src/keybindings/pastePrev.ts"));
const prevNewBlock_1 = __importDefault(__webpack_require__(/*! ./keybindings/prevNewBlock */ "./src/keybindings/prevNewBlock.ts"));
const prevSibling_1 = __importDefault(__webpack_require__(/*! ./keybindings/prevSibling */ "./src/keybindings/prevSibling.ts"));
const redo_1 = __importDefault(__webpack_require__(/*! ./keybindings/redo */ "./src/keybindings/redo.ts"));
const search_1 = __importDefault(__webpack_require__(/*! ./keybindings/search */ "./src/keybindings/search.ts"));
const searchBaidu_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchBaidu */ "./src/keybindings/searchBaidu.ts"));
const searchGithub_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchGithub */ "./src/keybindings/searchGithub.ts"));
const searchGoogle_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchGoogle */ "./src/keybindings/searchGoogle.ts"));
const searchStackoverflow_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchStackoverflow */ "./src/keybindings/searchStackoverflow.ts"));
const searchWikipedia_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchWikipedia */ "./src/keybindings/searchWikipedia.ts"));
const searchYoutube_1 = __importDefault(__webpack_require__(/*! ./keybindings/searchYoutube */ "./src/keybindings/searchYoutube.ts"));
const top_1 = __importDefault(__webpack_require__(/*! ./keybindings/top */ "./src/keybindings/top.ts"));
const undo_1 = __importDefault(__webpack_require__(/*! ./keybindings/undo */ "./src/keybindings/undo.ts"));
const up_1 = __importDefault(__webpack_require__(/*! ./keybindings/up */ "./src/keybindings/up.ts"));
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        // settings
        (0, funcs_1.initSettings)();
        // bindings
        (0, number_1.default)(logseq);
        (0, undo_1.default)(logseq);
        (0, redo_1.default)(logseq);
        (0, search_1.default)(logseq);
        (0, insert_1.default)(logseq);
        (0, insertBefore_1.default)(logseq);
        (0, top_1.default)(logseq);
        (0, bottom_1.default)(logseq);
        (0, nextSibling_1.default)(logseq);
        (0, prevSibling_1.default)(logseq);
        (0, up_1.default)(logseq);
        (0, down_1.default)(logseq);
        (0, indent_1.default)(logseq);
        (0, outdent_1.default)(logseq);
        (0, nextNewBlock_1.default)(logseq);
        (0, prevNewBlock_1.default)(logseq);
        (0, deleteCurrentBlock_1.default)(logseq);
        (0, copyCurrentBlockContent_1.default)(logseq);
        (0, copyCurrentBlockRef_1.default)(logseq);
        (0, pasteNext_1.default)(logseq);
        (0, pastePrev_1.default)(logseq);
        (0, collapse_1.default)(logseq);
        (0, extend_1.default)(logseq);
        // collapseAll(logseq);
        // extendAll(logseq);
        (0, highlightFocusIn_1.default)(logseq);
        (0, highlightFocusOut_1.default)(logseq);
        (0, searchBaidu_1.default)(logseq);
        (0, searchGithub_1.default)(logseq);
        (0, searchGoogle_1.default)(logseq);
        (0, searchStackoverflow_1.default)(logseq);
        (0, searchWikipedia_1.default)(logseq);
        (0, searchYoutube_1.default)(logseq);
        (0, exitEditing_1.default)(logseq);
        (0, jumpInto_1.default)(logseq);
        (0, joinNextLine_1.default)(logseq);
    });
}
logseq.ready(main).catch(console.error);


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = __webpack_require__("./src/main.ts");
/******/ 	
/******/ })()
;
//# sourceMappingURL=main.js.map