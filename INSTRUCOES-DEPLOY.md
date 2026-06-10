# Instruções para deploy — LEIA E EXECUTE · NÃO ALTERE NADA

## ⚠️ Importante

Este pacote (`deploy/`) contém o portfólio finalizado. Sua única tarefa é **substituir os arquivos no repositório git por estes e fazer o deploy**. 

**NÃO modifique, edite, reformate, "melhore" ou refatore nenhum arquivo.** Nada de markup, CSS, JS, imagens, paths ou versões. Apenas copie como está, commit e push.

## Passos

1. Substitua TODOS os arquivos do repositório pelos arquivos deste pacote, preservando a estrutura de pastas.
2. `git add -A`
3. `git commit -m "CV: adiciona PDF real e conserta todos os links Download CV"`
4. `git push`
5. Aguarde o deploy do GitHub Pages concluir.

## Cache busting (NÃO MUDAR)

Todas as páginas estão unificadas em:
- **`site-nav.js?v=12`**
- **`case-patterns.css?v=12`**

Não altere essas versões — elas evitam que o cache antigo reapareça.

## Arquivos do site

```
index.html                      home
cv-adriana-pommot.pdf           currículo (PDF — NOVO, obrigatório na raiz do repo)
case-delta.html                 case Delta Design System
case-mrv.html                   case MRV
case-ford.html                  case Ford
case-chorume.html               case Chorume
delta-atoms.html                biblioteca de componentes (iframe no case Delta)
color-tokens.html               sub-página Delta (iframe)
diagrama-de-contrastes.html     sub-página Delta (iframe)
tipografia.html                 sub-página Delta (iframe)
elevacao.html                   sub-página Delta (iframe)
opacidade.html                  sub-página Delta (iframe)
bordas.html                     sub-página Delta (iframe)
home.css
case-patterns.css
site-nav.js
img/                            todas as imagens (delta, mrv, ford, chorume)
+ assets na raiz (svgs, pngs, webp, ícones)
```

## O que mudou nesta rodada

**Correção crítica do Download CV.** Antes, os links de currículo apontavam para `#contato` ou `#` e o arquivo PDF nem existia no repo.

1. **`cv-adriana-pommot.pdf` — ARQUIVO NOVO.** Deve ficar na **raiz do repo**, junto do `index.html`, com exatamente esse nome. Sem ele, todos os botões de CV dão 404.
2. **`index.html`** — links de CV consertados (menu, hero "Download CV ↓", seção Sobre "Currículo ↓", seção Contato "Currículo PDF · 2026") → todos apontam para `cv-adriana-pommot.pdf` com atributo `download`. Também inclui o ajuste anterior: subtítulo de Serviços com `font-size: 14px`.
3. **`case-delta.html`, `case-mrv.html`, `case-chorume.html`** — link "Currículo" do rodapé/contato consertado (`#` → `cv-adriana-pommot.pdf` com `download`).
4. `case-ford.html` e demais arquivos: **sem mudanças**.

**NÃO altere nada além de copiar os arquivos.** Não renomeie o PDF, não mova de pasta, não mude links, não toque nas versões de cache.

Tudo já está aplicado nos arquivos deste pacote. É só subir.
