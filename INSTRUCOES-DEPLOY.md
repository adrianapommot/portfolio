# Instruções para deploy

## ⚠️ NÃO MODIFICAR NADA

Este pacote contém o portfólio finalizado. **Substitua os arquivos no repositório git como estão** e faça o deploy. Não altere markup, CSS, JS, imagens, paths ou qualquer outro conteúdo.

## Passos

1. Substitua TODOS os arquivos do repositório pelos arquivos deste pacote (preservando estrutura de pastas).
2. `git add -A`
3. `git commit -m "Atualização do portfólio"`
4. `git push`
5. Aguarde o deploy do GitHub Pages concluir.

## Cache busting

Esta entrega usa **`site-nav.js?v=8`** e **`case-patterns.css?v=2`** em todas as páginas que carregam esses arquivos. **Não mude essas versões** ou o cache antigo vai voltar a aparecer.

## Resumo das mudanças desta rodada

### Novo arquivo
- **`case-patterns.css`** — padrões reutilizáveis compartilhados entre os cases (Delta, MRV, Ford, Chorume). Inclui:
  - **Dark intro-grid** (`.sec.dark` + `.intro-grid` + `.intro-statement` + `.intro-side` + `.intro-pivot` + `.intro-role`) — usado no Contexto / Estratégia.
  - **Prob-grid** (`.prob-grid` + `.prob-item` + `.prob-ico`) — usado em "Entendendo o desafio". Aceita 2 variantes: `<img>` (ícone 3D) ou `prob-ico-svg` (card branco com SVG inline).
  - **Inline highlight** (`.txt-hl`) — banda amarela com `linear-gradient` pra destaque em texto corrido.
  - **Lightbox modal** — qualquer container com `data-maximizable` torna as imagens internas clicáveis, abrem em modal fullscreen (ESC ou clique fora pra fechar).

### Mudanças por arquivo

- **`index.html`**
  - Subtítulo do bloco "03 · Trajetória" reescrito.
- **`case-ford.html`** — refatoração grande:
  - **Bug crítico corrigido**: script morto que tentava `addEventListener` em elementos do nav antigo (`#navToggle`) crashava antes do reveal observer rodar, deixando todas as seções `.rv` invisíveis. Removido.
  - **Hero** alinhado ao padrão Delta (font-size, line-height, font-weight do `.hero-intro`, `.hero-result b`, `.hero-foot`; `flex-wrap` removido do `.hero-meta` pra fila FUNÇÃO · EMPRESA · PERÍODO · FOCO caber em uma linha).
  - **Seção 01 Contexto** convertida pro padrão dark intro-grid (com a foto `workshop-team` mantida grande em full-width abaixo).
  - **Seção 02 Problema** decomposta em 4 tópicos com ícones 3D (`icn-prob-volume`, `icn-prob-distancia`, `icn-prob-material`, `icn-prob-empatia`) — fundo branco removido via flood-fill.
  - **Seção 03 Objetivo** convertida pro padrão dark intro-grid (com a foto `participants` mantida grande em full-width abaixo).
  - **Seção 04 Estratégia e solução** padronizada: eyebrow `04 · Estratégia`, intro em `.s-lead`, linha divisória removida das `.subsection`.
  - **Linguagem visual das features** com imagens maximizáveis (`data-maximizable`).
  - **Imagens** todas `loading="eager" decoding="sync"` (sem mais pop-in lazy).
  - **Reveal animation** desativado (mesmo padrão Delta) — página estática, instantânea.
- **`case-mrv.html`** — `loading="eager"`, reveal desativado, thumbnails de "outros projetos" sincronizadas com index.
- **`case-chorume.html`** — `loading="eager"`, reveal desativado, thumbnails sincronizadas.
- **`case-delta.html`** — thumbnails sincronizadas com index.

### Imagens

- 4 novos ícones 3D processados pra `img/ford/` (icn-prob-*).
- Todos os thumbnails de "Outros projetos" agora usam as mesmas imagens do index.

## Estrutura

```
index.html
case-delta.html
case-mrv.html
case-ford.html
case-chorume.html
home.css
case-patterns.css   ← NOVO
site-nav.js
img/
  delta/
  mrv/
  ford/
  chorume/
… (demais assets)
```
