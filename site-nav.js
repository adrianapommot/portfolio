/* site-nav.js — navegação compartilhada (nome estático + menu fixo + back link opcional).
   Fonte única para todas as páginas. Uso:
     <site-nav back="index.html#work"></site-nav>       (cases — com link "Todos os projetos")
     <site-nav brand-href="#top" base="" contact="#contato" cv="#contato"></site-nav>  (home)
   Atributos:
     brand-href  href do nome (default "index.html")
     base        prefixo dos links de seção (default "index.html"; home "")
     contact     href do "Contato" (default "#contact")
     cv          href do "Download CV" (default "cv-adriana-pommot.pdf"; .pdf vira download)
     back        se presente, renderiza "← Todos os projetos" à esquerda do botão de menu
     back-label  texto do back link (default "Todos os projetos")
   Herda os tokens de cor/espaçamento (var(--accent), --m, --black, --gray-1, --font) da página. */
(function () {
  const css = `
  :host{display:contents}
  a{text-decoration:none;font-family:var(--font,'Plus Jakarta Sans',sans-serif)}
  .nav-name{position:absolute;top:40px;left:var(--nav-name-left, var(--m));z-index:30;font-size:12px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--black);line-height:1;white-space:nowrap}
  .nav-float{position:fixed;top:24px;right:var(--m);z-index:30;display:flex;flex-direction:column;align-items:flex-end;gap:8px}
  .nav-back{position:absolute;top:49px;right:calc(var(--m) + 66px);transform:translateY(-50%);white-space:nowrap;z-index:30;display:inline-flex;align-items:center;gap:5px;font-size:11px;font-weight:600;letter-spacing:.04em;color:var(--gray-3,#756F67);transition:color .25s}
  .nav-back:hover{color:var(--black,#111)}
  .nav-back svg{width:13px;height:13px;fill:none;stroke:currentColor;stroke-width:1.7;stroke-linecap:round;stroke-linejoin:round;transition:transform .3s cubic-bezier(.19,1,.22,1)}
  .nav-back:hover svg{transform:translateX(-4px)}
  .nav-toggle{width:50px;height:50px;border-radius:50%;border:1px solid var(--accent);cursor:pointer;background:var(--accent);display:flex;align-items:center;justify-content:center;transition:background .3s,border-color .3s;padding:0}
  .nav-toggle:hover{background:var(--black);border-color:var(--black)}
  .nav-toggle:hover svg{stroke:#fff}
  .nav-toggle svg{width:20px;height:20px;stroke:var(--black);stroke-width:1.2;fill:none}
  .nav-toggle .icon-x{display:none}
  .nav-float.open .nav-toggle{background:var(--black);border-color:var(--black)}
  .nav-float.open .nav-toggle svg{stroke:#fff}
  .nav-float.open .nav-toggle .icon-menu{display:none}
  .nav-float.open .nav-toggle .icon-x{display:block}
  .nav-menu{display:flex;flex-direction:column;align-items:flex-end;gap:6px;opacity:0;transform:translateY(-8px);pointer-events:none;transition:opacity .3s,transform .3s}
  .nav-float.open .nav-menu{opacity:1;transform:none;pointer-events:auto}
  .nav-menu a{font-size:12px;font-weight:600;letter-spacing:.04em;text-transform:uppercase;padding:9px 18px;border-radius:999px;white-space:nowrap;transition:background .25s,color .25s}
  .nav-menu .nav-cta{color:#fff;background:var(--black);display:inline-flex;align-items:center;gap:8px}
  .nav-menu .nav-cta:hover{background:var(--accent);color:var(--black)}
  .nav-menu .nav-cta svg{width:13px;height:13px;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
  .nav-menu .nav-link{color:var(--gray-1);background:rgba(255,255,255,.6);backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px)}
  .nav-menu .nav-link:hover{background:var(--black);color:#fff}`;

  class SiteNav extends HTMLElement {
    connectedCallback() {
      if (this._init) return;
      this._init = true;
      const attr = (n, d) => (this.getAttribute(n) !== null ? this.getAttribute(n) : d);
      const brand = attr('brand-href', 'index.html');
      const base = attr('base', 'index.html');
      const contact = attr('contact', '#contact');
      const cv = attr('cv', 'cv-adriana-pommot.pdf');
      const back = this.getAttribute('back');
      const backLabel = attr('back-label', 'Todos os projetos');
      const dl = /\.pdf($|\?)/i.test(cv) ? ' download' : '';
      const backHtml = back !== null
        ? '<a class="nav-back" href="' + back + '"><svg viewBox="0 0 16 16"><path d="M10 3 5 8l5 5"/><path d="M5 8h7"/></svg>' + backLabel + '</a>'
        : '';
      const root = this.attachShadow({ mode: 'open' });
      root.innerHTML =
        '<style>' + css + '</style>' +
        '<a href="' + brand + '" class="nav-name">Adriana Pommot</a>' +
        backHtml +
        '<div class="nav-float">' +
        '<button class="nav-toggle" aria-label="Menu">' +
        '<svg class="icon-menu" viewBox="0 0 24 24"><line x1="4" y1="7" x2="20" y2="7"/><line x1="4" y1="12" x2="20" y2="12"/><line x1="4" y1="17" x2="20" y2="17"/></svg>' +
        '<svg class="icon-x" viewBox="0 0 24 24"><line x1="6" y1="6" x2="18" y2="18"/><line x1="18" y1="6" x2="6" y2="18"/></svg>' +
        '</button>' +
        '<nav class="nav-menu">' +
        '<a href="' + cv + '"' + dl + ' class="nav-cta">Download CV<svg viewBox="0 0 16 16"><path d="M8 3v8M4 8l4 4 4-4"/><path d="M3 13h10"/></svg></a>' +
        '<a href="' + base + '#work" class="nav-link">Projetos</a>' +
        '<a href="' + base + '#services" class="nav-link">Serviços</a>' +
        '<a href="' + base + '#about" class="nav-link">Sobre Mim</a>' +
        '<a href="' + contact + '" class="nav-link">Contato</a>' +
        '</nav></div>';
      const float = root.querySelector('.nav-float');
      root.querySelector('.nav-toggle').addEventListener('click', function () { float.classList.toggle('open'); });
      root.querySelectorAll('.nav-menu a').forEach(function (a) { a.addEventListener('click', function () { float.classList.remove('open'); }); });
    }
  }
  if (!customElements.get('site-nav')) customElements.define('site-nav', SiteNav);
})();
