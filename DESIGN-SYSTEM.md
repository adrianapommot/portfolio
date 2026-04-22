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
  --surface-neutral: #F5F5F5;
  --dark-surface: #2C2B2B;
  --accent: #D1F466;
  --accent-light: #EDFFB6;
}
```

Uso:
- **--black** → texto principal, títulos
- **--white** → fundo padrão, texto em fundo escuro, ícones em superfícies escuras
- **--gray-1** → variante mais escura de texto (reserva)
- **--gray-2** → corpo de texto padrão (home e cases)
- **--gray-3** → section numbers, captions, labels secundárias
- **--gray-4** → ícones de cards, labels terciárias, divisores sutis
- **--gray-5** → bordas, linhas divisoras, borders de cards
- **--surface-neutral** → único fundo alternado de seção, placeholders de imagem, superfícies de componentes
- **--dark-surface** → fundo da barra de metadata nos cases
- **--accent** → highlights, hover, pills de resultado
- **--accent-light** → highlight inline, valores da metadata bar

Regras:
- Nunca usar `#000000` como preto. O preto oficial é `--black` (`#111111`).
- Nenhum hex literal deve aparecer no código. Toda cor entra via `var(--token)`.

### Tons creme — PROIBIDOS

`#F5F1EB` (antigo `--gray-6`) e `#F9F9F9` (antigo `--cream`) estão **extirpados do sistema**. Qualquer undertone amarelado/bege está banido como fundo de seção ou de card. A paleta de superfícies não-brancas é exclusivamente **`--surface-neutral` (#F5F5F5)**, que é cinza neutro frio — sem tom quente.

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
4. Barra de metadata escura (`--dark-surface`, full-width bleed, labels `--white`, values `--accent-light`)
5. Hero image

### 5.3 Section Layout
Regra fundamental: **título sempre em cima, conteúdo abaixo. Nunca lado a lado.**

```
.ed-header (number + title, full width, margin-bottom 40px)
.ed-content (body text, max-width 586px)
[cards, images, badges, listas etc.]
```

### 5.4 Cards de Contexto
- Bg white ou surface-neutral, border gray-5, radius 8px, padding 21px
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
- Radius 12px, browser bar `--surface-neutral` com 3 dots
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

## 7.1 Diagramação tipográfica (regras absolutas)

Valem para **todo** o portfólio — index e cases. Não são estéticas opcionais, são requisito de qualidade.

### Zero viúvas, órfãs e rios
- Parágrafos: sempre `text-wrap: pretty` (redistribui para evitar palavras soltas na última linha)
- Títulos: sempre `text-wrap: balance` (equilibra linhas em multi-linha)
- Quando `text-wrap` não resolve, ajustar **conteúdo** (reescrever uma linha) ou **max-width** do container. Nunca forçar com `<br>` arbitrário.
- Revisar em desktop **e** em 640px — viúva boa em uma largura pode ser ruim em outra.

### Body text unificado (home + cases)
Body text tem **um único** padrão em todo o portfólio. Divergir entre home e case quebra a coerência.

| Propriedade | Valor |
|---|---|
| font-size | **14px** |
| font-weight | 400 |
| line-height | 1.75 |
| color | `--gray-2` (`#585550`) |
| letter-spacing | 0 |

Body de destaque (`--t-body-lg`, 18px) pode ser usado em seções específicas (objetivo, estratégia, `md-title`, statement de problema), mas a regra padrão é 14px.

### Alinhamento vertical entre colunas
Em qualquer layout two-column (home ou case), o **topo do primeiro elemento da coluna direita** alinha com o **topo do título** da coluna esquerda — **nunca com o número/etiqueta** (ex: `.ed-num`). O número é metadata (fica acima, fora do grid), e as duas colunas de conteúdo começam no mesmo baseline.

Implementação via `padding-top` calculado no container direito = altura do ed-num + gap. Exemplo em cases: `padding-top: calc(var(--t-num-sm) + var(--space-xs))` = 28px. Em outros contextos, calcular do mesmo jeito com os tokens correspondentes. **Nunca** usar valores mágicos arbitrários tipo `116px` — esses quebram quando a tipografia muda.

---

## 7.2 Disciplina de variação de estilos

A escala tipográfica do projeto tem **8 tokens**. Se um elemento novo precisa de tamanho fora desses 8, primeiro revise se dá pra reaproveitar — ou ajuste o conteúdo, não a escala.

```css
--t-hero      /* clamp(44, 7vw, 96) — case-title, cta-title, more-work-title */
--t-h2        /* 32  — TODOS os títulos de seção e subseção */
--t-body      /* 14  — TODO body text (mesmo que home) */
--t-label     /* 13  — labels, captions, card-titles uppercase */
--t-caption   /* 12  — footer, nav-links, micro-captions */
--t-num-xl    /* 48  — r-num, ba-num, result-num */
--t-num-md    /* 28  — phone-pct */
--t-num-sm    /* 20  — .ed-num, more-work-card-name */
```

**Princípios não-negociáveis:**
- Destaque em body **nunca** é feito por tamanho — usar `font-weight: 500` ou `<strong>`
- Hierarquia seção vs subseção aparece via presença/ausência do `.ed-num` (número 01-07), não via tamanho do título
- Pesos predominantes: **400** e **500**. `600` só para bold inline (strong). Nunca 700+
- Se for tentado a criar `--t-body-lg` ou `--t-h3`: pause — a diferença entre "body normal" e "body destaque" é resolvida por weight, não por size

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
- Refatorar hex literais restantes nos HTMLs para usar os tokens `--dark-surface` e `--surface-neutral`
