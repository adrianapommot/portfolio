# Portfolio Adriana Pommot — Mini Design System
Fonte única de verdade para todos os arquivos do portfólio.

---

## 1. Tipografia

Família única: **Plus Jakarta Sans** (Google Fonts)

```
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
```

Pesos utilizados:
- **400** — body, títulos grandes (case title, hero title, result numbers)
- **500** — section headings, labels, nav links, badge text, metric labels
- **600** — nav name, bold inline (strong), footer logo
- **700** — reservado (não utilizado atualmente)

Nenhuma outra fonte. General Sans, Roboto Mono, Inter, DM Sans — todas removidas.

---

## 2. Paleta de Cores

```css
:root {
  --black: #111111;
  --white: #ffffff;
  --gray-1: #37342F;
  --gray-2: #585550;
  --gray-3: #756F67;
  --gray-4: #B8B2A8;
  --gray-5: #EBE7E1;
  --gray-6: #F5F1EB;
  --cream: #F9F9F9;
  --accent: #D1F466;
  --accent-light: #EDFFB6;
}
```

Uso:
- **--black** → texto principal, títulos
- **--gray-2** → corpo de texto na homepage
- **--gray-3** → corpo de texto nos cases, section numbers, captions, labels
- **--gray-4** → ícones de cards, labels secundárias
- **--gray-5** → bordas, linhas divisoras, borders de cards
- **--gray-6** → fundo quente (homepage)
- **--cream** → fundo de cards de contexto
- **#F5F5F5** → fundo neutro de seções sombreadas nos cases
- **#2C2B2B** → fundo da barra de metadata nos cases
- **--accent** → highlights, hover, pills de resultado
- **--accent-light** → highlight inline, valores da metadata bar

---

## 3. Escala Tipográfica

### Homepage

- **Hero title:** clamp(56px, 8vw, 112px) / 400 / uppercase / -0.02em
- **Hero H2:** clamp(28px, 3.5vw, 48px) / 400 / uppercase / -0.01em
- **Hero body:** 16px / 400 / lh 1.75 / gray-2
- **Section label:** 11px / 500 / uppercase / 0.1em / gray-3
- **Nav name:** 13px / 600 / uppercase / 0.04em
- **Nav links:** 12px / 500 / uppercase / 0.04em

### Cases (MRV como benchmark)

- **Case title:** clamp(44px, 7vw, 96px) / 400 / uppercase / -0.02em
- **Section number:** 20px / 500 / gray-3
- **Section heading (H2):** 32px / 500 / uppercase / 0.026em
- **Body text:** 16px / 400 / lh 1.75 / gray-3 / ls 0.01em
- **Body bold (strong):** 600 / black
- **Body large (estratégia):** 18px / 400 / ls 0.04em / #6d6d6d
- **Highlight inline:** 16px / 500 / bg accent-light
- **Caption:** 13px / 400 / gray-3 / ls 0.03em
- **Card title:** 16px / 500 / uppercase / 0.033em
- **Card description:** 13px / 400 / gray-3 / lh 1.55
- **Card number (big):** 40px / 400 / ls -0.014em
- **Metric label:** 16px / 500 / uppercase / 0.033em
- **Metadata label:** 14px / 500 / uppercase / white
- **Metadata value:** 13px / 400 / accent-light
- **Badge text:** 14px / 400 / uppercase
- **KR subtitle:** 20px / 500 / ls -0.02em
- **Result number:** clamp(28px, 4vw, 48px) / 400 / ls -0.02em

---

## 4. Espaçamento

### Seções
- Padding de seção: **96px** top e bottom (56px mobile)
- Border entre seções: **1px solid gray-5**

### Dentro de seções
- ed-header → conteúdo: **40px**
- Entre parágrafos (ed-content > * + *): **16px**
- Subtítulo margin-top: **96px** (56px mobile)
- Subtítulo margin-bottom: **40px**
- Cards gap: **16px**

### Container
- max-width: **1440px**
- padding horizontal: **40px** (24px mobile)

---

## 5. Componentes

### 5.1 Nav (cross-file)
- Name pill: fixed top-left, 13px/600, uppercase, radius 999px, bg rgba(255,255,255,0.55), blur
- Menu toggle: 54px circle, radius 50%, bg rgba(255,255,255,0.72)
- Menu links: 12px/500, uppercase, radius 999px
- CTA link: bg black, color white, ícone SVG

### 5.2 Case Header (padrão fixo)
Ordem obrigatória:
1. Back link (13px/500, gray-3, uppercase, seta SVG)
2. Título uppercase em múltiplas linhas
3. Parágrafo de foco (16px, gray-3, max-width 668px)
4. Barra de metadata escura (#2C2B2B, full-width bleed, labels white, values accent-light)
5. Hero image

### 5.3 Section Layout
Regra fundamental: **título sempre em cima, conteúdo abaixo. Nunca lado a lado.**

```
.ed-header (number + title, full width, margin-bottom 40px)
.ed-content (body text, max-width 586px)
[cards, images, badges, listas etc.]
```

### 5.4 Cards de Contexto
- Bg cream, border gray-5, radius 8px, padding 21px
- Número 40px + ícone SVG (alinhados horizontal)
- Label 16px/500/uppercase abaixo
- Separador 26px × 1px gray-5
- Descrição 16px abaixo
- Grid 3 colunas, gap 16px

### 5.5 Challenge Cards
- Bg white (em seção sombreada = float effect), border white
- Radius 8px, padding 21px
- Ícone + título 16px/500/uppercase + descrição 13px
- Grid 5 colunas, gap 16px

### 5.6 Badge / Tag
- Border 1px solid black, radius 8px, padding 8px 16px
- Font 14px/400, uppercase

### 5.7 Highlight Inline
- Bg accent-light, font 16px/500
- box-decoration-break clone

### 5.8 Phone Mockups (seção escura)
- Bg seção: black
- Frames: radius 16px, bg #1A1A19, aspect-ratio 9/19.5
- Grid 5 colunas (percentual → nome → descrição → gap → frame)
- Frame hero: border accent, glow

### 5.9 Browser Mockups
- Radius 12px, browser bar #F5F5F5 com 3 dots
- Grid 2 colunas, gap 24px

### 5.10 KR Compare Table
- Grid 1fr 120px 120px
- Header 13px/500/uppercase/gray-3
- Rows border-bottom gray-5
- Result hit: bg accent, pill radius 999px

---

## 6. Animações

- Reveal: classe `.rv` com IntersectionObserver
- Keyframe: translateY(24px) → none, opacity 0 → 1
- Easing: cubic-bezier(0.16, 1, 0.3, 1), duração 0.7s
- Delays: .d1 (0.12s), .d2 (0.22s), .d3 (0.34s), .d4 (0.46s)
- Nav text roll: translateY(-100%) no hover
- Nav bg scroll: rgba(0.55) → rgba(0.85) após 60px

---

## 7. Tom de Voz

- ZERO travessões (—)
- Linguagem humanizada, designer falando do próprio trabalho
- Proibido: "direção de arte" → usar "identidade visual de produto"
- Sem linguagem corporativa genérica
- Todo texto em português
- text-wrap: pretty em body, balance em headings

---

## 8. Framework de Seções (Case Study)

1. Contexto do produto
2. O problema (highlight + body + challenge cards)
3. Objetivo (body + badge + KR list, tudo empilhado)
4. Estratégia de design (body + badge + prioridades, tudo empilhado)
5. A solução (mockups phone, desktop, fundação visual)
6. Resultados (números, tabela KR, performance inline, sprints empilhados)
7. Aprendizados

---

## 9. Responsivo

Breakpoints:
- Acima de 1024px: layout completo
- 1024px ou menos: challenges 3 cols, phones 3 cols
- 640px ou menos: px 24px, challenges 2 cols, phones 2 cols, metrics 1 col

---

## 10. Pendências

- Homepage: migrar de General Sans para Plus Jakarta Sans
- Case Delta: aplicar novo layout
- Case Chorume: aplicar novo layout
- Case Dasa: continuar construção com novo layout
- Cases Ford e Ultraviolenta: criar
- Headline da homepage: resolver copy
- CV: atualizar
