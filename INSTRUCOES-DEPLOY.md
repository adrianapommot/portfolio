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

O `site-nav.js` está referenciado como `site-nav.js?v=3` em todas as páginas (home + cases). Isso força os navegadores a baixarem a versão nova sem precisar de hard refresh. **Não mude o `?v=3`** ou o cache antigo vai voltar a aparecer.

## Arquivos modificados desde o último deploy

- `index.html` — seções com novo padrão `s-index` (NN · Label + linha)
- `home.css` — adicionado estilo `.s-index`, removidos estilos antigos de eyebrow
- `site-nav.js` — componente unificado com back link "Todos os projetos" via atributo `back="…"`, sem animação no hover do nome
- `case-delta.html`, `case-mrv.html`, `case-ford.html`, `case-chorume.html` — adotam `<site-nav back="index.html#work">`, sem `.hero-back` standalone
- `case-delta.html` — pequenos ajustes de copy/bold, imagens convertidas para WebP (`global-design-tokens.webp`, `whitelabel-hero.webp`), iframe do Delta Atoms com altura 700px
- `delta-atoms.html` — layout responsivo (sem `min-width:900px`, sem `height:100vh`)

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
