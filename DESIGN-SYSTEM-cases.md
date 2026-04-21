# Portfolio Adriana Pommot — Design System de Case Studies

Framework narrativo e visual dos case studies. Complementa `DESIGN-SYSTEM.md` (home + foundation). Todo token, componente ou regra que aparece na home está lá; este documento cobre apenas o que é exclusivo de case.

Benchmark atual: `case-mrv.html`. Este case define o padrão que `case-delta.html`, `case-dasa.html` e `case-chorume.html` devem replicar.

Atualizado em 21 de abril de 2026.

---

## 1. Filosofia narrativa

Cada case é uma narrativa de design resolvida em sete seções. A ordem é fixa, o conteúdo respira livre dentro de cada uma. O case não é um relatório corporativo (não abre com "objetivos estratégicos") nem um portfólio Behance (não começa com mockup glamouroso). Abre com contexto humano e fecha com aprendizado pessoal.

O tom é de designer contando o próprio trabalho. Primeira pessoa moderada, sem heroísmo. Termos técnicos específicos da disciplina são bem-vindos. Jargão corporativo é descartado.

A voz é a mesma da home. Zero em-dashes. Zero exclamações. Zero "incrível" ou "transformou". Verbos de ação no pretérito quando falando do processo; presente quando falando do impacto atual.

Visualmente, o case alterna entre leitura e demonstração. Blocos de texto editoriais (sem ornamentação) se intercalam com mockups, tabelas de KR, flows visuais. Nunca dois blocos visuais seguidos sem um texto intermediário, nem dois blocos de texto sem respiro visual.

---

## 2. Tokens exclusivos de case

Estes tokens **não aparecem** em `index.html`. Existem apenas nos HTMLs de case:

```css
--dark-surface: #2C2B2B;   /* metadata bar do case header */
```

O `--accent-light: #e0ff98` (definido no DS principal como token legado suspenso) tem uso específico em cases: é a cor do **valor** na metadata bar do case header. Quando a home for revisada para remover lime completamente, a metadata bar dos cases precisa ser reavaliada — hoje é a última aparição do `--accent-light` visualmente ativa no portfólio.

**Estado atual (decisão pendente):** manter `--accent-light` na metadata value até decisão final sobre o lime. Quando o lime for descartado em definitivo, metadata value passa a ser `--white` com `opacity: 0.7` ou `--gray-4`.

### Outros tokens herdados

Todo o resto vem do DS principal: `--black`, `--white`, escala `--gray-*`, `--font-display`, `--font-body`, `--max-w`, `--px`, `--space-tight/mid/loose`, `--section-gap`, e os tokens da tabela editorial (`--col-*`).

---

## 3. Escala tipográfica de case (benchmark MRV)

Case tem papéis tipográficos próprios que não existem na home. Mantive a mesma lógica geral — letter-spacing negativo universal, uppercase em labels, line-heights comprimidos em títulos.

| Papel | Classe | Size | Weight | LH | LS | Case | Cor |
|---|---|---|---|---|---|---|---|
| **Case header** |
| Case title | `.case-title` | clamp(44px, 7vw, 96px) | 400 | 1 | -0.02em | upper | `--black` |
| Case focus (subtítulo) | `.case-focus` | 16px | 400 | 1.6 | — | — | `--gray-3` |
| Case back link | `.case-back` | 13px | 500 | — | 0.08em | upper | `--gray-3` |
| **Metadata bar** |
| Metadata label | `.case-meta-label` | 14px | 500 | — | — | upper | `--white` |
| Metadata value | `.case-meta-value` | 13px | 400 | — | — | — | `--accent-light` (ver nota acima) |
| **Estrutura editorial (ed-*)** |
| Section number (ed-num) | `.ed-num` | 20px | 500 | 1 | — | — | `--gray-3` |
| Section heading (ed-title) | `.ed-title` | 32px | 500 | 1.1 | 0.026em | upper | `--black` |
| Body (ed-body) | `.ed-body` | 16px | 400 | 1.75 | 0.01em | — | `--gray-3` |
| Body bold (strong em ed-body) | `<strong>` | — | 600 | — | — | — | `--black` |
| Body large (ed-two-col-body-lg) | `.ed-two-col-body-lg` | 18px | 400 | 1.6 | 0.04em | — | `--gray-2` |
| Badge (ed-badge) | `.ed-badge` | 14px | 400 | — | — | upper | — |
| Highlight inline | `<span class="highlight">` | 16px | 500 | — | — | — | bg `--accent-light` |
| **Cards** |
| Card title | `.card-title` (ou `.sprint-label`) | 16px | 500 | 1.3 | 0.033em | upper | `--black` |
| Card description | `.card-desc` (ou `.sprint-desc`) | 13px | 400 | 1.55 | — | — | `--gray-3` |
| Card number (big) | `.r-num`, `.l-num` | 40px | 400 | 1 | -0.014em | — | `--black` |
| **Challenge cards** |
| Challenge name | `.challenge-name` | 16px | 500 | 1.3 | — | — | `--black` |
| Challenge desc | `.challenge-desc` | 13px | 400 | 1.55 | — | — | `--gray-3` |
| **KR card** |
| KR card title | `.kr-card-title` | 14px | 500 | — | 0.08em | upper | `--gray-3` |
| KR subtitle | `.kr-subtitle` | 20px | 500 | 1.3 | -0.02em | — | `--black` |
| **Metric** |
| Metric label | `.metric-label` | 16px | 500 | — | 0.033em | upper | `--black` |
| Result number (metric big) | `.r-num` | clamp(28px, 4vw, 48px) | 400 | 1 | -0.02em | — | `--black` |
| **Caption** |
| Caption | `.fw-img-caption` | 13px | 400 | 1.5 | 0.03em | — | `--gray-3` |
| **Impact (pull quote)** |
| Impact quote | `.impact-quote` | clamp(28px, 3.5vw, 40px) | 500 | 1.3 | -0.01em | — | `--black` |

### Hierarquia de títulos em case

Quatro níveis máximos:

1. Case title (hero do case) — 96px
2. Section heading `.ed-title` — 32px
3. Card title / Challenge name — 16px
4. Label / metadata — 12-14px

Se você quiser introduzir um nível intermediário entre 2 e 3, pause. Provavelmente está tentando encher espaço; case bem estruturado precisa no máximo de três níveis.

---

## 4. Framework editorial — 7 seções fixas

Todo case segue esta ordem. Pular seções só com justificativa explícita no arquivo.

### Seção 1 — Contexto do produto

**Propósito:** situar o leitor. Quem era o produto, qual o problema de negócio que ele resolvia, que escala tinha.

**Estrutura:**
- `ed-header` com número `01` e título "Contexto do produto"
- `ed-content` com 1-2 parágrafos curtos
- Opcional: grid lateral com 3 métricas contextuais (volume, tempo, escala) usando `.ctx-metrics`

**Tom:** factual, sem heroísmo. "Produto X atendia N clientes em M anos de financiamento."

**Tempo verbal:** pretérito (estava em operação) ou presente (se ainda está em operação). Nunca futuro.

### Seção 2 — O problema

**Propósito:** tornar a dor visível. Esta seção é a que faz o leitor lembrar da experiência ruim que ele mesmo já teve com produtos similares.

**Estrutura recomendada (MRV benchmark):**
- `ed-header` com número `02` e título "O problema"
- Highlight de abertura (pull quote ou parágrafo grifado)
- Body de contexto
- Grid de 4 `challenge-cards` com ícone SVG + nome + descrição

**Dos:** usar verbos de fricção ("gerava desistência", "dominava a interface", "bloqueava a ação").
**Don'ts:** não generalizar ("a experiência era ruim"). Especificidade vende credibilidade.

Benchmark de especificidade: no MRV, a seção cita "Duração média de 8 minutos por chamada" e "Mais de 40 termos como 'encargo moratório'". Números concretos.

### Seção 3 — Objetivo

**Propósito:** dizer o que você foi contratada para fazer, em uma frase, e o que seriam os Key Results de sucesso.

**Estrutura:**
- `ed-header` 03 "Objetivo"
- Badge com escopo/período ("Período do piloto — 2 sprints")
- Parágrafo principal em `ed-two-col-body-lg` (18px) afirmando o objetivo em uma frase com `<strong>`
- Parágrafo secundário (mesmo estilo) qualificando: "o desafio não era X, era Y"
- `kr-card` à direita com lista de Key Results mensuráveis

**Tom:** ambicioso sem ser vago. Se o KR é "aumentar visualização em 10-20%", é isso mesmo — não "aumentar engajamento significativamente".

### Seção 4 — Estratégia de design

**Propósito:** revelar a tese de design que guiou a solução. É aqui que o case vira design, não release note.

**Estrutura:**
- `ed-header` 04 "Estratégia de design"
- Parágrafo principal em `ed-two-col-body-lg` nomeando a tese (ex: "A acessibilidade cognitiva orientou cada decisão")
- Badge "A solução priorizou"
- Lista `.ed-list` com 3-5 princípios aplicados
- Grid lateral `.ctx-metrics` com 3 métricas de escopo (quantos componentes, quantas telas, etc)

**Dos:** nomear uma tese clara, com poucas palavras. Benchmark MRV: "acessibilidade cognitiva". Dois substantivos.
**Don'ts:** listar 10 princípios. Se a tese não cabe em 3-5 itens, você ainda não formou a tese.

### Seção 5 — A solução

**Propósito:** demonstrar visualmente. Menos texto, mais imagem.

**Estrutura variável por caso, mas no MRV:**
- `ed-header` 05 "A solução"
- Parágrafo curto de contextualização
- `md-viewer` (master-detail) com telas do fluxo — thumbs clicáveis, caption ativa, preview grande
- Opcional: segundo `md-viewer` para fundação visual (tokens)
- Image full-width como "overview"

**Regra de ouro:** cada tela mostrada precisa provar um ponto narrativo (fazer parte da tese). Tela bonita "pra encher" tira autoridade do case.

### Seção 6 — Resultados

**Propósito:** provar que a tese funcionou com números.

**Estrutura MRV:**
- `ed-header` 06 "Resultados do piloto"
- Card hero (`.results-hero`) com 4 métricas principais em destaque
- Row com texto de performance qualitativa + tabela de KR comparando meta vs resultado
- Row de "Desdobramento pós-piloto" com sprints listados

**Tipografia de números:** número grande (28-56px / weight 400 / letter-spacing negativo) + label 13-16px. Número nunca aparece sozinho — sempre com contexto imediato (gap 8-16px entre número e label).

### Seção 7 — Aprendizados

**Propósito:** fechamento pessoal. O que o case ensinou você como designer.

**Estrutura:**
- `ed-header` 07 "Aprendizados"
- 1-2 parágrafos em primeira pessoa moderada ("Em fluxos financeiros sensíveis, a ausência de sinalização...")

**Dos:** tirar uma lição transferível para outros contextos. Mostrar que você extrai padrão de projeto, não apenas executa.
**Don'ts:** clichê genérico ("aprendi a importância do trabalho em equipe"). Se soa como resposta de processo seletivo, corta.

---

## 5. Componentes específicos de case

### 5.1 Case header

Estrutura fixa em todo case:

```html
<section class="case-header"><div class="container">
  <a href="index.html#work" class="case-back">
    <svg viewBox="0 0 16 16">...</svg>
    Todos os projetos
  </a>
  <h1 class="case-title">MRV<br>Ecossistema<br>Financeiro</h1>
  <p class="case-focus">
    Redesenhei o autoatendimento financeiro... <strong>27% de engajamento e 14% de conversão autônoma no piloto.</strong>
  </p>
  <div class="case-meta-bar">
    <div class="case-meta">
      <div class="case-meta-item">
        <span class="case-meta-label">Função</span>
        <span class="case-meta-value">Product Designer Sênior</span>
      </div>
      <!-- Empresa, Período, Foco -->
    </div>
  </div>
</div></section>
```

### 5.2 Metadata bar

Barra escura full-width com 4 slots fixos: **Função**, **Empresa**, **Período**, **Foco**.

```css
.case-meta-bar {
  background: var(--dark-surface);  /* #2C2B2B */
  margin: 48px calc(50% - 50vw) 0;  /* bleed full-width */
  padding: 32px max(var(--px), calc((100vw - var(--max-w))/2 + var(--px)));
}
.case-meta {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 48px;
}
.case-meta-item {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.case-meta-label {
  font-size: 14px;
  font-weight: 500;
  text-transform: uppercase;
  color: var(--white);
}
.case-meta-value {
  font-size: 13px;
  font-weight: 400;
  color: var(--accent-light);  /* ver nota de pendência na seção 2 */
}
```

### 5.3 Editorial section (ed-*)

Base estrutural de toda seção narrativa do case.

```css
.ed {
  padding: 96px 0;  /* via --section-gap */
}
.ed--shaded {
  background: var(--gray-6);  /* alternância de superfície */
}
.ed-header {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 40px;
}
.ed-num {
  font-size: 20px;
  font-weight: 500;
  color: var(--gray-3);
}
.ed-title {
  font-size: 32px;
  font-weight: 500;
  line-height: 1.1;
  letter-spacing: 0.026em;
  text-transform: uppercase;
  color: var(--black);
}
.ed-content {
  max-width: 720px;
}
.ed-body {
  font-size: 16px;
  font-weight: 400;
  line-height: 1.75;
  letter-spacing: 0.01em;
  color: var(--gray-3);
}
.ed-body + .ed-body {
  margin-top: 16px;
}
.ed-body strong {
  font-weight: 600;
  color: var(--black);
}
```

**Regra fundamental:** ed-header (número + título) sempre fica **em cima**, ed-content embaixo. Nunca lado a lado. Se o layout pede duas colunas, use `.ed-two-col` que empilha header + content na coluna esquerda e coloca sidebar (card, métricas, KR) à direita.

### 5.4 Two-column editorial

```css
.ed-two-col {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: 96px;
  align-items: start;
}
.ed-two-col-left {
  display: flex;
  flex-direction: column;
  gap: 24px;
}
.ed-two-col-body-lg {
  font-size: 18px;
  font-weight: 400;
  line-height: 1.6;
  letter-spacing: 0.04em;
  color: var(--gray-2);
}
```

Mobile (1024px): 1 coluna, gap reduzido.

### 5.5 Badge

```css
.ed-badge {
  display: inline-block;
  padding: 6px 12px;
  font-size: 14px;
  font-weight: 400;
  text-transform: uppercase;
  border: 1px solid var(--gray-5);
  border-radius: 999px;
  color: var(--black);
  width: fit-content;
}
```

### 5.6 Challenge cards

Grid 4 colunas com icon SVG + nome + descrição.

```css
.challenges-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
  margin-top: 48px;
}
.challenge {
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: 0;
}
.challenge-icon {
  width: 40px; height: 40px;
}
.challenge-icon svg {
  width: 100%; height: 100%;
  stroke: var(--black);
  fill: none;
  stroke-width: 1.5;
}
.challenge-name {
  font-size: 16px;
  font-weight: 500;
  line-height: 1.3;
  color: var(--black);
}
.challenge-desc {
  font-size: 13px;
  font-weight: 400;
  line-height: 1.55;
  color: var(--gray-3);
}
```

Responsive: 1024px → 3 cols, 640px → 2 cols.

**Sem background cream, sem background white, sem border.** Decisão histórica: cards viraram estruturas abertas, sem container visual. Só ícone + texto no fluxo da página.

### 5.7 KR card

Card com título e lista de Key Results.

```css
.kr-card {
  padding: 40px;
  background: var(--gray-6);
  border-radius: 8px;
}
.kr-card-title {
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--gray-3);
  margin-bottom: 24px;
}
.kr-card ul {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.kr-card li {
  font-size: 16px;
  line-height: 1.5;
  color: var(--black);
  padding-left: 20px;
  position: relative;
}
.kr-card li::before {
  content: '→';
  position: absolute;
  left: 0;
  color: var(--gray-4);
}
```

### 5.8 Master-detail viewer (md-viewer)

Componente interativo: thumbs na lateral, caption + preview à direita. Clicar no thumb ativa o respectivo caption/preview.

```css
.md-viewer {
  display: grid;
  grid-template-columns: 160px 1fr;
  gap: 40px;
  margin-top: 48px;
}
.md-thumbs {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.md-thumb {
  aspect-ratio: 1.6;
  border: 1px solid var(--gray-5);
  background: var(--gray-6);
  cursor: pointer;
  opacity: 0.5;
  transition: opacity 0.3s;
}
.md-thumb[aria-selected="true"] {
  opacity: 1;
  border-color: var(--black);
}
.md-thumb img {
  width: 100%; height: 100%;
  object-fit: cover;
}
.md-stage {
  display: flex;
  flex-direction: column;
  gap: 24px;
}
.md-caption {
  display: flex;
  align-items: baseline;
  gap: 16px;
}
.md-num {
  font-size: 14px;
  font-weight: 500;
  color: var(--gray-3);
  letter-spacing: 0.08em;
}
.md-title {
  font-size: 20px;
  font-weight: 500;
  color: var(--black);
}
.md-desc {
  font-size: 14px;
  font-weight: 400;
  line-height: 1.6;
  color: var(--gray-3);
  max-width: 600px;
}
.md-preview {
  aspect-ratio: 16/10;
  background: var(--gray-6);
  overflow: hidden;
}
.md-img {
  width: 100%; height: 100%;
  object-fit: cover;
}
```

Implementação JS: click handler em `.md-thumb` troca `aria-selected`, atualiza `.md-num`, `.md-title`, `.md-desc`, `.md-img` baseado num array de dados.

Responsive: mobile vira horizontal scroll nos thumbs.

### 5.9 Results hero card

Cartão de destaque com 4 métricas principais do case.

```css
.results-hero {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 0;
  padding: 48px 40px;
  background: var(--gray-6);
  border-radius: 8px;
  margin: 48px 0;
}
.results-hero-item {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding: 0 24px;
  border-right: 1px solid var(--gray-5);
}
.results-hero-item:last-child { border-right: none; }
.r-num {
  font-size: clamp(28px, 4vw, 48px);
  font-weight: 400;
  line-height: 1;
  letter-spacing: -0.02em;
  color: var(--black);
}
.r-label {
  font-size: 14px;
  font-weight: 400;
  line-height: 1.4;
  color: var(--gray-3);
}
```

### 5.10 KR comparison table

Tabela de 3 colunas: indicador, meta, resultado.

```css
.kr-compare {
  display: flex;
  flex-direction: column;
  border-top: 1px solid var(--gray-5);
}
.kr-compare-header,
.kr-compare-row {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr;
  gap: 24px;
  padding: 20px 0;
  border-bottom: 1px solid var(--gray-5);
}
.kr-compare-header {
  font-size: 12px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--gray-3);
}
.kr-compare-label {
  font-size: 14px;
  color: var(--black);
}
.kr-compare-target {
  font-size: 14px;
  color: var(--gray-3);
}
.kr-compare-result {
  font-size: 14px;
  font-weight: 500;
  color: var(--black);
}
.kr-compare-result.hit {
  color: var(--black);  /* substituído de --accent */
  /* opcional: adicionar ::before "✓" */
}
```

**Nota:** no código atual, `.hit` usa `--accent` (lime). Com lime suspenso, vira preto sólido. Adicionar um checkmark SVG na frente do número pode compensar a perda de distinção visual.

### 5.11 Sprint (desdobramento pós-piloto)

```css
.sprints {
  display: flex;
  flex-direction: column;
  gap: 32px;
}
.sprint {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding-left: 24px;
  border-left: 2px solid var(--gray-5);
}
.sprint-label {
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--gray-3);
}
.sprint-desc {
  font-size: 16px;
  line-height: 1.6;
  color: var(--black);
}
```

### 5.12 Full-width image + caption

```css
.fw-img {
  width: 100%;
  margin: 48px 0;
}
.fw-img img {
  width: 100%;
  height: auto;
  display: block;
}
.fw-img-caption {
  font-size: 13px;
  font-weight: 400;
  line-height: 1.5;
  letter-spacing: 0.03em;
  color: var(--gray-3);
  max-width: 720px;
}
```

### 5.13 More Work

Seção final linkando 2 outros cases.

```css
.more-work {
  padding: 120px 0;
  border-top: 1px solid var(--gray-5);
}
.more-work-title {
  font-size: clamp(32px, 5vw, 56px);
  font-weight: 400;
  text-transform: uppercase;
  letter-spacing: -0.01em;
  margin-bottom: 48px;
}
.more-work-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 40px;
}
.more-work-card {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.more-work-card-img {
  aspect-ratio: 3/2;
  overflow: hidden;
  background: var(--gray-6);
}
.more-work-card-img img {
  width: 100%; height: 100%;
  object-fit: cover;
  transition: transform 0.6s;
}
.more-work-card:hover .more-work-card-img img {
  transform: scale(1.03);
}
.more-work-card-tag {
  font-size: 12px;
  color: var(--gray-3);
  letter-spacing: 0.04em;
}
.more-work-card-name {
  font-size: 20px;
  font-weight: 500;
  line-height: 1.2;
  color: var(--black);
}
```

Responsive: 1024px → 2 cols, 640px → 1 col.

### 5.14 Impact quote (fechamento de seção)

```css
.impact-quote {
  font-size: clamp(28px, 3.5vw, 40px);
  font-weight: 500;
  line-height: 1.3;
  letter-spacing: -0.01em;
  color: var(--black);
  max-width: 800px;
}
.impact-quote strong {
  font-weight: 600;
}
```

---

## 6. MRV como benchmark

`case-mrv.html` é o único case totalmente aderente a este DS. Os demais estão em estágios diferentes:

### Estado atual dos cases

| Case | Estado | Ação recomendada |
|---|---|---|
| **MRV** | Aderente (benchmark) | Auditar pequenos detalhes (posicionamento no CTA: "Inteligência Visual" → "Craft Visual") |
| **Delta** | Parcialmente aderente | Alinhar tokens, aplicar framework de 7 seções, refatorar componentes que divergem |
| **Chorume** | Pouco aderente | Decidir: é case completo ou showcase curto? Se case, refatorar para 7 seções. Se showcase, migrar para formato reduzido |
| **Dasa** | Em construção | Continuar a partir do MRV como referência |

### Protocolo de replicação

Quando for alinhar um case ao MRV, seguir esta ordem:

1. **Tokens:** remover declarações duplicadas de cor/tipografia no `:root` do case; usar apenas o que é específico (`--dark-surface`)
2. **Estrutura HTML:** verificar se as 7 seções existem na ordem certa (`ed-num` 01 a 07 + more-work + cta + footer)
3. **Componentes compartilhados:** nav, cta-section, footer devem usar o mesmo HTML/CSS do index (basicamente copy-paste da home)
4. **Componentes de case:** case-header, metadata-bar, ed-* — conferir classes, tamanhos, cores
5. **Narrativa:** validar que o tom está em português, sem em-dashes, primeira pessoa moderada
6. **Responsive:** testar 1024px e 640px em cada seção

---

## 7. Decisões em aberto

Três pontos que precisam de decisão antes de o DS ser considerado estável:

**1. Destino do `--accent-light` na metadata bar**
Hoje é a última aparição visual do lime. Decisão pendente: manter até reconsideração do lime, ou substituir por `--gray-4` / `--white` com opacity.

**2. Indicador de "hit" na KR comparison table**
Com lime suspenso, a coluna de resultado não diferencia visualmente um KR batido. Opção: adicionar checkmark SVG, ou usar weight 600 em vez de cor.

**3. More Work em Dasa/Delta**
Atualmente apontam para MRV e Delta. Quando Chorume e Dasa ficarem prontos, rebalancear os cruzamentos para que cada case aponte para os dois próximos naturais.

---

## 8. Do's & Don'ts de case

### Do

- Siga as 7 seções na ordem: contexto → problema → objetivo → estratégia → solução → resultados → aprendizados
- Use números concretos no problema (métricas de fricção, volume, tempo)
- Nomeie sua tese de design em 2-3 palavras (ex: "acessibilidade cognitiva")
- Mostre telas que **provam pontos narrativos**, não telas decorativas
- Apresente Key Results com meta vs resultado lado a lado
- Feche com aprendizado transferível para outros projetos
- Mantenha o framework editorial `ed-*` como estrutura primária
- Replique os componentes de header, nav, CTA e footer da home sem variação

### Don't

- Não pule a seção de aprendizados — ela é o diferencial entre case e release note
- Não apresente mockups sem legenda explicativa
- Não use cores novas, tokens novos ou fontes novas em case
- Não misture português e inglês (termos técnicos consagrados em inglês são aceitos: "handoff", "onboarding", "design token")
- Não escreva em terceira pessoa ("a designer desenvolveu...") — é primeira pessoa moderada
- Não reintroduza cards com fundo cream ou white com borders — o padrão atual é card sem container visual
- Não use spacing 120px entre seções — o padrão é 96px via `--section-gap`
- Não adicione sprites decorativos (ícones sem função, divisores ornamentais, pull quotes com aspas gigantes)

---

## 9. O que este documento não cobre

O sistema da home e os componentes compartilhados (nav, hero, marquees, services, projects, trajectory, about, CTA section, footer, buttons, reveal animations, tabela editorial svc/traj) estão em `DESIGN-SYSTEM.md`.

Este arquivo cobre **apenas o que é exclusivo de case**. Se um componente aparece tanto na home quanto no case (ex: nav, cta-section, footer), a fonte de verdade é o DS principal.
