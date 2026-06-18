# Design System — Adriana Pommot Portfolio

Documentação completa do sistema visual usado em todo o portfólio: home (index.html) e cases (MRV, Delta, Ford).

---

## 1. Paleta de Cores

### Cores Base

| Token | Hex | Uso | Context |
|-------|-----|-----|---------|
| `--black` | `#111111` | Texto principal, títulos, elementos de destaque | Foreground |
| `--white` | `#ffffff` | Fundo padrão | Background |
| `--bone` | `#f4f3ef` | Off-white discreto (backgrounds alternativos) | Background |

### Escala de Cinzas

| Token | Hex | Uso |
|-------|-----|-----|
| `--gray-1` | `#37342F` | Títulos, texto forte, labels em contextos claros |
| `--gray-2` | `#585550` | Corpo de texto, descrições |
| `--gray-3` | `#756F67` | Labels, eyebrows, text subdued |
| `--gray-4` | `#AEA89D` | Cinza mais claro — labels do header de case, texto muito leve |
| `--gray-5` | `#EBE7E1` | (Reservado para backgrounds muito claros) |

### Cores Funcionais

| Token | Hex | Uso |
|-------|-----|-----|
| `--line` | `#E3E0DA` | Dividers, borders, separadores |
| `--chip` | `#F2F1EE` | Background de cards, buttons hover (neutro) |
| `--accent` | `#e0ff33` | Lime — destaque principal, nav pill, CTA buttons, highlights |
| `--accent-press` | `#d2f51c` | Lime escuro — hover state do accent |
| `--accent-dark` | `#8A8A20` | Lime muito escuro — ícones/bordas legíveis em fundo claro |
| `--paper-case` | `#FAFAF8` | Fundo off-white do hero dos cases (claros) |

### Dark Mode (Aprendizados, Footer)

Para seções com fundo `#111` (dark):
- Texto base: `#ffffff` (white)
- Texto secundário: `rgba(255,255,255,0.6)` (60% opacity)
- Texto terciário: `rgba(255,255,255,0.4)` (40% opacity)
- Dividers: `rgba(255,255,255,0.14)` (14% opacity)
- Accent: `--accent` (#e0ff33) mantém legibilidade em dark

---

## 2. Tipografia

### Fonte Única

**Plus Jakarta Sans** (Google Fonts)
- Weights: 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- URL: `https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap`

### Escala Tipográfica

Todos os tamanhos usam `clamp()` para fluidez responsiva.

| Token | Fórmula | Desktop Min | Desktop Max | Uso |
|-------|---------|------------|-------------|-----|
| `--ty-display` | `clamp(54px, 5.6vw, 74px)` | 54px | 74px | Headlines grandes (reservado) |
| `--ty-title` | `clamp(32px, 3.4vw, 48px)` | 32px | 48px | Títulos de seção (uppercase, 700) |
| `--ty-lead` | `clamp(16px, 1.4vw, 19px)` | 16px | 19px | Leads, subtítulos (500) |
| `--ty-copy` | `17px` | 17px | 17px | Corpo de texto (400) |
| `--ty-small` | `14px` | 14px | 14px | Descrições, captions (400) |
| `--ty-metric` | `32px` | 32px | 32px | Números grandes (stats) |
| `--ty-label` | `12px` | 12px | 12px | Labels, eyebrows uppercase (700) |

### Escala Tipográfica dos Cases

Os cases (case-*.html) usam tokens próprios, distintos da home. NUNCA inventar tamanho fora desta lista.

| Token | Fórmula | Uso |
|-------|---------|-----|
| `--ty-hero` | `clamp(38px, 4.4vw, 62px)` | Display do título de case (700, uppercase) |
| `--ty-title` | `clamp(44px, 4.8vw, 60px)` | Título de seção do case |
| `--ty-lead` | `24px / 500` | Lead (frase após o título) e subtítulo de bloco |
| `--ty-copy` | `17px` | Corpo; **17px/600** = título de card/item (.sol-t, .prob-title, .res-title, .esc-title) |
| `--ty-small` | `14px` | Descrição de card, legenda |
| `--ty-metric` | `32px` | Métrica média; números grandes via clamp |
| `--ty-label` | `12px` | Labels uppercase 12–13px / 700, cor `--gray-3` |

**Hierarquia por PESO, não por tamanho.** Proibido criar tamanho novo (ex.: 21px). Pesos: apenas 400 / 500 / 600 / 700.

Cinzas de texto: `--black` títulos · `--gray-1` lead/forte · `--gray-2` corpo · `--gray-3` labels.

### Hierarquia de Peso

| Função | Weight | Line-height | Letter-spacing |
|--------|--------|-------------|-----------------|
| Títulos, headlines | 700 | 1.0–1.1 | -0.015em a -0.04em |
| Subtítulos, leads | 500–600 | 1.4–1.6 | -0.005em a 0 |
| Corpo | 400 | 1.6 | 0 |
| Labels, badges | 600–700 | 1.3 | 0.08em–0.2em |

### Estilos de Texto (Classes CSS)

```css
.s-index     /* Numeração + traço (01, 02, ...) */
.s-title     /* Título de seção: clamp 32–48px / 700 / uppercase / -0.015em */
.s-lead      /* Lead/subtítulo: clamp 16–19px / 500 / -0.005em */
.s-body      /* Corpo: 17px / 400 / 1.6 */
.s-label     /* Label: 12px / 700 / uppercase / 0.14em */
.s-metric    /* Número grande: 32px / 500 / -0.02em */
.s-small     /* Caption: 14px / 400 */
```

---

## 3. Espaçamento (Spacing Scale)

### Escala base-8 (fonte única)

Múltiplos inteiros de 8, SEM clamp. Nenhum espaçamento fora da grade de 8 — proibido 14, 18, 19, 36, 104.

```
--space-8  --space-16  --space-24  --space-32  --space-40  --space-48
--space-56 --space-64  --space-72  --space-80  --space-96  --space-112
```

| Token de layout | Valor | Uso |
|-----------------|-------|-----|
| `--m` | `clamp(24px, 5vw, 64px)` | Margem lateral (padding left/right das seções) |
| `--gut` | `24px` | Gutter de grid (= `--space-24`) |

Espaçamento de seção: `clamp(48px, 5.5vw, 80px)` (ritmo reduzido, alinhado entre index e cases).

### Padrão de cabeçalho de seção (`.section-head`)

O grupo eyebrow → título → lead de QUALQUER seção (index + cases) usa uma classe única. Proibido `margin-top` inline ou `gap` ad-hoc nos heads.

```css
--head-pt:        var(--space-56)   /* topo do grupo */
--head-gap-title: var(--space-16)   /* eyebrow → título */
--head-gap-lead:  var(--space-24)   /* título → lead */
--head-pb:        var(--space-32)   /* base do grupo — sempre < topo */

.section-head          { padding: var(--head-pt) 0 var(--head-pb); }
.section-head .s-title { margin-top: var(--head-gap-title); }
.section-head .s-lead  { margin-top: var(--head-gap-lead); }
```

### Tokens APOSENTADOS (não usar — migrar para a escala base-8)

```
--space-md (24)       → --space-24
--space-lg (36)       → --space-32 / --space-40   (36 era off-grid)
--space-title (72)    → --space-72
--space-section (112) → --space-112
--gap-after-title(72) → --head-pb (agora 32)
```

---

## 4. Layout & Grid

### Container Principal

```css
.flow {
  max-width: calc(1440px + 2 * var(--m));
  margin: 0 auto;
}

.sec {
  padding: clamp(48px, 5.5vw, 80px) var(--m);
}

.sec + .sec {
  border-top: 1px solid var(--line);
}
```

- **Max-width desktop**: 1440px
- **Margin lateral fluida**: `clamp(24px, 5vw, 64px)` (24px mobile → 64px desktop)
- **Divisória entre seções**: linha cinza `--line`

### Grids Responsivos

#### Grid 2-coluna (Hero, Main)

```css
.grid-2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--gut);
}

@media (max-width: 768px) {
  .grid-2 { grid-template-columns: 1fr; }
}
```

#### Grid 3-coluna (Features, Stats)

```css
.grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--gut);
}

@media (max-width: 1024px) {
  .grid-3 { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .grid-3 { grid-template-columns: 1fr; }
}
```

#### Grid 4-coluna (Stats, Metadata)

```css
.grid-4 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--gut);
}

@media (max-width: 1024px) {
  .grid-4 { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .grid-4 { grid-template-columns: 1fr; }
}
```

### Breakpoints Responsivos

| Ponto | Largura | Contexto |
|-------|---------|----------|
| Desktop | > 1024px | Layout full 4/3 colunas, grids multi-col |
| Tablet | 768px–1024px | Grids 2-col, ajustes de spacing |
| Mobile | < 768px | Single-column, margins reduzidas |

---

## 5. Componentes Reutilizáveis

### Card Padrão

```html
<div class="card">
  <div class="card-hd">
    <div class="card-idx"><b>01</b></div>
    <svg class="ico"><!-- icon --></svg>
  </div>
  <h3 class="s-label">Label</h3>
  <p class="card-desc">Description text</p>
</div>
```

**Estilos**:
```css
.card {
  border: 1px solid var(--line);
  border-radius: 6px;
  padding: 22px 22px 26px;
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
}

.card:hover {
  border-color: var(--gray-3);
  /* optional: box-shadow para depth */
}
```

### Imagens

```html
<div class="full-img">
  <img src="img/..." alt="..." loading="lazy">
  <p class="img-caption">Caption text</p>
</div>

<div class="img-grid img-grid-2">
  <div><img src="..." alt="..."><p class="img-caption">Caption</p></div>
  <div><img src="..." alt="..."><p class="img-caption">Caption</p></div>
</div>
```

**Estilos**:
```css
.full-img {
  margin-top: var(--space-lg);
  border-radius: 8px;
  overflow: hidden;
}

.full-img img {
  width: 100%;
  height: auto;
  display: block;
}

.img-caption {
  font-size: var(--ty-label);
  color: var(--gray-3);
  margin-top: 12px;
  max-width: 720px;
}

.img-grid {
  display: grid;
  gap: 16px;
  margin-top: var(--space-lg);
}

.img-grid-2 { grid-template-columns: 1fr 1fr; }
.img-grid-3 { grid-template-columns: 1fr 1fr 1fr; }

@media (max-width: 768px) {
  .img-grid-2, .img-grid-3 { grid-template-columns: 1fr; }
}
```

### Stats (Resultados)

```html
<div class="res-stats">
  <div class="res-stat">
    <div class="res-num">4</div>
    <div class="res-label">Label describing the metric</div>
  </div>
  <!-- repeat 3x para 4-col layout -->
</div>
```

**Estilos**:
```css
.res-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  border-top: 1px solid var(--line);
  border-bottom: 1px solid var(--line);
  padding: 48px 0;
  margin-top: var(--space-lg);
  gap: 0;
}

.res-stat {
  padding: 0 32px;
  border-right: 1px solid var(--line);
}

.res-stat:first-child { padding-left: 0; }
.res-stat:last-child { border-right: none; padding-right: 0; }

.res-num {
  font-size: clamp(40px, 5vw, 48px);
  font-weight: 500;
  line-height: 1;
  letter-spacing: -0.02em;
  color: var(--black);
  margin-bottom: 16px;
  font-variant-numeric: tabular-nums;
}

.res-label {
  font-size: var(--ty-small);
  font-weight: 400;
  line-height: 1.5;
  color: var(--gray-2);
  text-wrap: pretty;
}
```

---

## 5b. Botões retangulares — TAMANHO ÚNICO

Um só tamanho de botão retangular em todo o projeto (modelo compacto):

```css
display:inline-flex; align-items:center; gap:8px;
font-size:12px; font-weight:500; letter-spacing:.04em;
text-transform:none;            /* caixa normal — nada de CAIXA ALTA */
border:1px solid;               /* SEMPRE 1px — cheios usam a cor do fundo */
border-radius:4px;
padding:8px 16px;               /* 1×8 / 2×8 (grade base-8) */
```

Variantes: **primary** (accent/ink) · **ghost** (borda ink) · **dark** (ink/#fff).
Aplicado: `.btn` · `.btn-sm` · `.poster-cta` · `.traj-archive` (home) · `.lib-cta` · `.proc-zoom` (delta).
As **pills** do menu (`.nav-cta` / `.nav-link`, radius 999) são família à parte — não mexer.

**Copy do LinkedIn:** todo *botão* de LinkedIn usa o texto "Perfil no LinkedIn" (hero, sobre, trajetória). Links de rodapé e do menu de contato seguem "LinkedIn" curto.

---

## 5c. Header / Hero do case — PADRÃO APROVADO

Replicar em todos os cases. Ritmo todo em ×8, tipo reduzido a poucos tamanhos/pesos/cores.

- Fundo off-white `--paper-case` (#FAFAF8), nunca escuro (exceto a variante dark do Chorume).
- **Back-link** "← Todos os projetos": renderizado pelo `site-nav.js` no lugar da marca (topo-esquerda), texto simples em `--gray-4`, seta pendurada na margem, SEM borda/pílula. Cor via `--nav-back-color` (default `--gray-3`; chorume usa `rgba(255,255,255,.55)`).
- **Linha de marca:** só o logo (sem subtítulo), colado ao título (gap pequeno).
- **Título:** `--ty-hero` clamp(38,4.4vw,62) / 700 / uppercase, 2 linhas, palavra-chave marcada com bloco lime (`.hero-hl`). NUNCA gigante.
- **Foot:** coluna esquerda = intro (lead) + bloco de resultado (rótulo uppercase em cima, valor embaixo, alinhado à esquerda); à direita, alinhada à base do resultado, a tag "Case de Product Design · ANO".
- **Barra de metadados:** 4 colunas à esquerda, divisórias finas, rótulo 11px/700/uppercase/gray-3 + valor 16px/600/black.
- **Nav** (pílula + toggle + menu) IDÊNTICA à home: lime sólido, roll no hover.

Espaçamento do hero (×8): `.hero` padding-top clamp(56,7vh,80) · `.hero-top` margin-bottom 8 · `.hero-foot` margin-top 24 · `.hero-foot-main` gap 24 · `.hero-result span` margin-bottom 8 · `.hero-meta` margin-top clamp(48,6vh,72), padding 24 0 · `.hm-item` padding 0 24, gap 8.

**Variante DARK (chorume):** mesmas medidas e tamanhos; cores brancas/rgba (não usar `--gray-4`); estrutura usa `.hero-inner-stack`.

---

## 6. Componentes Chrome (Navbar, CTA, Footer)

### Navbar (Fixed, Top)

```html
<a href="index.html" class="nav-name">
  <span class="nav-roll">
    <span>Adriana Pommot</span>
    <span>Adriana Pommot</span>
  </span>
</a>
<div class="nav-float" id="navFloat">
  <button class="nav-toggle" id="navToggle">
    <svg class="icon-menu"><!-- menu icon --></svg>
    <svg class="icon-x"><!-- x icon --></svg>
  </button>
  <div class="nav-menu">
    <a href="..." class="nav-cta">Download CV</a>
    <a href="..." class="nav-link">Projetos</a>
    <!-- ... -->
  </div>
</div>
```

**Estilos**:
```css
.nav-name {
  position: fixed;
  top: 36px;
  left: var(--m);
  z-index: 100;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  color: var(--black);
  background: var(--accent);
  padding: 9px 20px;
  border-radius: 999px;
  overflow: hidden;
}

.nav-name span {
  display: block;
  line-height: 1;
  white-space: nowrap;
  transition: transform 0.45s cubic-bezier(0.19, 1, 0.22, 1);
}

.nav-name:hover span {
  transform: translateY(-100%);
}

.nav-toggle {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  border: 1px solid var(--accent);
  cursor: pointer;
  background: var(--accent);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.3s, border-color 0.3s;
}

.nav-toggle:hover {
  background: var(--black);
  border-color: var(--black);
}

.nav-menu {
  opacity: 0;
  transform: translateY(-8px);
  pointer-events: none;
  transition: opacity 0.3s, transform 0.3s;
}

.nav-float.open .nav-menu {
  opacity: 1;
  transform: none;
  pointer-events: auto;
}
```

### CTA Section (Lime Background)

```html
<section class="cta" id="contact">
  <div class="cta-grid">
    <div>
      <p class="cta-eyebrow">Disponível para projetos</p>
      <h2 class="cta-title">Vamos<br>conversar?</h2>
      <p class="cta-sub">Visual & Interface Design</p>
    </div>
    <nav class="cta-menu">
      <a href="..." class="cta-row">
        <span class="cl">E-mail</span>
        <span class="cv">adrianapommot@gmail.com</span>
        <span class="car">↗</span>
      </a>
      <!-- ... -->
    </nav>
  </div>
</section>
```

**Estilos**:
```css
.cta {
  background: var(--accent);
  padding: clamp(56px, 6vw, 84px) 0;
}

.cta-grid {
  display: grid;
  grid-template-columns: 0.85fr 1.15fr;
  gap: clamp(32px, 5vw, 56px);
  align-items: end;
}

.cta-title {
  font-size: clamp(48px, 7vw, 72px);
  font-weight: 700;
  letter-spacing: -0.04em;
  line-height: 0.88;
  text-transform: uppercase;
  color: var(--black);
}

.cta-row {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 20px;
  align-items: baseline;
  padding: clamp(16px, 2vw, 20px) 8px;
  border-bottom: 1px solid rgba(17, 17, 17, 0.2);
  color: var(--black);
  transition: padding-left 0.25s ease;
}

.cta-row:hover {
  padding-left: 18px;
}

.cta-row .car {
  transition: transform 0.25s ease;
}

.cta-row:hover .car {
  transform: translate(4px, -4px);
}

@media (max-width: 760px) {
  .cta-grid { grid-template-columns: 1fr; }
}
```

### Footer (Dark Background)

```html
<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="footer-logo">Adriana Pommot</div>
        <div class="footer-social">
          <a href="...">LinkedIn</a>
          <a href="...">Instagram</a>
          <a href="...">Email</a>
        </div>
      </div>
      <!-- ... 3 more columns ... -->
    </div>
    <div class="footer-bottom">
      <span class="footer-copy">© 2026 Adriana Pommot</span>
      <span class="footer-copy">Visual & Interface Design</span>
    </div>
  </div>
</footer>
```

**Estilos**:
```css
footer {
  background: var(--black);
  color: var(--white);
  padding: 64px 0 32px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.footer-grid {
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr 1fr;
  gap: 48px;
  margin-bottom: 64px;
}

.footer-col-title {
  font-size: 12px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.25);
  margin-bottom: 20px;
}

.footer-col-links a {
  font-size: 13px;
  color: rgba(255, 255, 255, 0.4);
  transition: color 0.3s;
}

.footer-col-links a:hover {
  color: var(--white);
}

@media (max-width: 768px) {
  .footer-grid { grid-template-columns: 1fr 1fr; }
}
```

---

## 7. Animações & Interações

### Reveal on Scroll (`.rv` class)

> Nota: o reveal-on-scroll está **desativado nos cases** (páginas estáticas, render instantâneo — `.rv,.rv.visible{opacity:1;transform:none;transition:none;animation:none}`). Permanece ativo apenas na home.

```css
.rv {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.7s cubic-bezier(0.16, 1, 0.3, 1),
              transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
}

.rv.visible {
  opacity: 1;
  transform: none;
}

.d1 { transition-delay: 0.12s; }
.d2 { transition-delay: 0.22s; }
.d3 { transition-delay: 0.34s; }
.d4 { transition-delay: 0.46s; }
```

**JavaScript**:
```javascript
(function() {
  try {
    var ro = new IntersectionObserver(function(entries) {
      entries.forEach(function(e) {
        if (e.isIntersecting) {
          e.target.classList.add('visible');
          ro.unobserve(e.target);
        }
      });
    }, { threshold: 0.1 });
    
    document.querySelectorAll('.rv').forEach(function(el) {
      ro.observe(el);
    });
  } catch (e) {
    console.warn('observer error', e);
  }
})();
```

### Hover States

- **Cards**: `border-color: var(--gray-3)` + opcional shadow
- **Images**: `transform: scale(1.04)` (duration 0.55s)
- **Links**: `color: var(--accent)` ou underline
- **Buttons**: `background: var(--black)` (lime → black)

### Transitions

```css
transition: background 0.25s, 
            color 0.25s, 
            border-color 0.25s,
            transform 0.55s cubic-bezier(0.2, 0.7, 0.2, 1);
```

---

## 8. Ícones

### Estilo & Tamanho

```css
.ico {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  width: 28px;
  height: 28px;
  color: var(--black);
}

.ico svg {
  width: 100%;
  height: 100%;
  fill: none;
  stroke: currentColor;
  stroke-width: 1.5;
  stroke-linecap: round;
  stroke-linejoin: round;
}
```

- **Stroke only**: sem fills, preto (#111), stroke-width 1.5
- **Tamanho padrão**: 28px × 28px
- **Variações**: 20px, 22px, 24px conforme contexto
- **Cores**: herdam `currentColor` (preto por padrão, white em dark mode)

---

## 9. Acessibilidade & Performance

### Acessibilidade

- Semântica HTML: `<h1>`, `<h2>`, `<button>`, `<nav>`, `<section>`, etc.
- Contraste: todos os textos >= 4.5:1 WCAG AA
- Labels em SVGs: `aria-label` quando necessário
- Mobile: hit targets >= 44px × 44px

### Performance

- **Imagens**: `loading="eager" decoding="sync"` (sem pop-in de lazy; render previsível)
- **Formatos**: webp otimizado, fallback PNG/JPG
- **Fonts**: Google Fonts pré-carregada (1 request)
- **CSS**: inline (sem separate stylesheet) ou concatenado
- **JS**: vanilla (sem dependencies)

### SEO

- Meta tags: og:title, og:description, og:image
- Structured data: (optional, não usado atualmente)
- Alt text: em todas as imagens

---

## 10. Arquivos & Estrutura

```
portfolio/
├── index.html              (Home — usa home.css)
├── home.css                (Estilos da home)
├── site-nav.js             (Web component <site-nav>, nav compartilhada)
├── case-patterns.css       (Padrões compartilhados entre cases: intro-grid, prob-grid, lightbox)
├── case-mrv.html           (CSS inline)
├── case-delta.html         (CSS inline — case principal)
├── case-ford.html          (CSS inline)
├── case-chorume.html       (CSS inline — variante dark)
├── color-tokens.html · delta-atoms.html · diagrama-de-contrastes.html
├── tipografia.html · elevacao.html · opacidade.html · bordas.html   (sub-páginas do Delta, em iframe)
├── AdrianaPommot_2026updated.pdf   (CV)
└── img/  (delta · mrv · ford · chorume)
```

---

## 11. Regras de Uso

### Copy (NUNCA fazer)

- ❌ Travessões (—) ou en-dash: use vírgula, ponto, parênteses
- ❌ Viúvas ou frases quebradas no meio: usar `text-wrap: balance` ou ajustar max-width
- ❌ Novos tamanhos de fonte: só usar `--ty-*` tokens existentes

### Espaçamento (SEMPRE fazer)

- ✅ Usar `--space-md`, `--space-lg`, `--space-title`, `--space-section`
- ✅ Adicionar `.sec+.sec { border-top }` em novo caso
- ✅ Respeitar `--m` (margin lateral fluida) e `--gut` (gap de grid)

### Cores (NUNCA inventar)

- ❌ Inventar hex codes novo
- ✅ Só usar tokens de `--black`, `--gray-*`, `--accent`, `--line`

### Tipografia

- ✅ Font-weight: 400, 500, 600, 700 (Plus Jakarta Sans)
- ✅ Hierarquia por weight, não só por size
- ✅ letter-spacing: só para labels (uppercase) e headlines

---

## 12. Checklist para Novo Case

- [ ] Hero com back-link, brand, título 2-linhas (uppercase), intro, metadata 4-col
- [ ] `.sec` com `.s-index`, `.s-title` (margin-bottom), `.s-lead` (margin-bottom)
- [ ] `.sec+.sec` divisória (border-top)
- [ ] Imagens com `loading="lazy"` e captions
- [ ] Grids responsivos (3-col desktop → 1-col mobile)
- [ ] Stats 4-col com números grandes
- [ ] Dark section (aprendizados) com `--black` bg
- [ ] CTA + Footer idênticos à home
- [ ] Nav pill + toggle menu
- [ ] Reveal animations (`.rv` + delay classes)
- [ ] Sem erros console (check com done → fork_verifier_agent)

---

**Versão**: 2.0
**Última atualização**: 2026-06-18
**Responsável**: Adriana Pommot
