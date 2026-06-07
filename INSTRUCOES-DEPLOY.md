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

O `site-nav.js` está referenciado como `site-nav.js?v=6` em todas as páginas (home + cases). Isso força os navegadores a baixarem a versão nova sem precisar de hard refresh. **Não mude o `?v=6`** ou o cache antigo vai voltar a aparecer.

## Resumo das mudanças desta rodada

- **`site-nav.js`** — componente unificado:
  - "Adriana Pommot" sem animação de hover.
  - "← Todos os projetos" embutido via atributo `back="…"` (renderizado dentro do shadow DOM, position:absolute — scrolla com a página, separado do menu fixo).
  - Alinhamento automático do nome com a borda esquerda do conteúdo (mede o primeiro `.sec` / `.wrap` / `.container` da página, lê `padding-left` computado).
  - Nudge óptico opcional via `--nav-name-nudge` (definido em `home.css` como `6px` pra compensar a borda chata das letras gigantes do hero).
- **`home.css`** — novo estilo `.s-index` (NN · Label + linha), variante `on-dark`, override do CTA card.
- **`index.html`** — todas as seções (Serviços, Projetos, Trajetória, Perfil, Contato) usando o padrão `s-index`.
- **`case-delta.html`** — script inline de alinhamento removido (agora no site-nav.js), iframe do `delta-atoms.html` reativado em 700px de altura, copy em bold pontual nos parágrafos.
- **`delta-atoms.html`** — layout responsivo (sem `min-width:900px` nem `height:100vh`), grid de cards que reorganiza em 3/2/1 colunas conforme a largura.
- **Cases (chorume, mrv, ford, delta)** — todos usando `<site-nav back="index.html#work">`, sem `.hero-back` standalone.
- **Imagens** — `global-design-tokens.png` e `whitelabel-hero.png` convertidas pra WebP (redução de ~95%).

## Estrutura

```
index.html
home.css
site-nav.js
case-delta.html
case-mrv.html
case-ford.html
case-chorume.html
delta-atoms.html
img/
hero-delta.png
logo-delta.svg
… (demais assets)
```
