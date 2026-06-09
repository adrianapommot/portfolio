# Contexto do projeto — Portfólio Adriana Pommot

## O que é
Portfólio profissional de Adriana Pommot, designer de produto e design systems. Site estático em HTML/CSS/JS puro, sem frameworks, hospedado via GitHub Pages.

---

## Estrutura de arquivos

```
index.html          → Homepage (lista de projetos, sobre, contato)
home.css            → Estilos compartilhados da homepage
site-nav.js         → Web component <site-nav> (nav flutuante, compartilhado entre pages)

case-delta.html     → Case study: Delta Design System (principal, mais elaborado)
case-mrv.html       → Case study: Fluxo de Renegociação MRV
case-ford.html      → Case study: Ford Immersion Room
case-chorume.html   → Case study: Tipografia Chorume

— Sub-páginas interativas do case Delta (carregadas em iframes) —
color-tokens.html
delta-atoms.html
diagrama-de-contrastes.html
tipografia.html
elevacao.html
opacidade.html
bordas.html

img/
  delta/     → Imagens do case Delta
  mrv/       → Imagens do case MRV
  ford/      → Imagens do case Ford
  chorume/   → Imagens do case Chorume

— Assets raiz —
hero-delta.png, logo-delta.svg
icn_*.png          → Ícones dos tokens (cores, tipografia, sombras, opacidade, bordas)
icn_prob_*.png     → Ícones dos problemas (Entendendo o desafio)
global-design-tokens.png
simulacao.svg, desktop-siteoficial.svg, mobile-siteoficial.svg
```

---

## Stack e convenções

- **HTML/CSS/JS puro** — sem React, sem Tailwind, sem bundler
- **Fonte principal:** Plus Jakarta Sans (Google Fonts)
- **Fonte mono:** IBM Plex Mono
- **CSS custom properties** definidas em `:root` no início de cada arquivo
- Cada case é um HTML auto-contido com estilos inline em `<style>`
- Nav compartilhada via `<site-nav>` (web component em `site-nav.js`)

---

## Vocabulário visual (case-delta.html)

```css
--black: #111110
--white: #FAFAF8
--accent: #e0ff33        /* lime amarelo */
--bone: #f4f3ef
--gray-1: #353535
--gray-2: #464646
--gray-3: #6F6F6F
--gray-4: #B3B3B3
--line: #E8E5DF           /* bordas/divisores */
--chip: #F5F4F0

--ty-display: clamp(54px, 5.6vw, 74px)
--ty-title:   clamp(32px, 3.4vw, 48px)
--ty-lead:    clamp(16px, 1.4vw, 19px)
--ty-copy:    17px
--ty-small:   14px
--ty-label:   12px

--m: clamp(24px, 5vw, 64px)   /* padding lateral das seções */
--gut: 24px                    /* gap do grid */
--gap-after-title: 72px
```

---

## Estado atual

- `case-delta.html` é o arquivo mais trabalhado — editado recentemente com vários ajustes de layout, espaçamento e tokens
- Os sub-arquivos interativos (color-tokens.html, delta-atoms.html etc.) estão estáveis
- O portfólio está pronto para subir ao GitHub Pages

---

## O que NÃO existe mais no projeto

Todos os arquivos de estudo, exploração e backup foram removidos. O que está na raiz é exatamente o que vai para produção.
