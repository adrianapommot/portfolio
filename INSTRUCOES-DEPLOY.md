# Instruções para deploy — NÃO ALTERAR NADA

## ⚠️ LEIA E EXECUTE — não modifique nenhum arquivo

Este pacote (`deploy/`) contém o portfólio finalizado. **Apenas substitua os arquivos no repositório git pelos arquivos deste pacote e faça o deploy.** Não edite markup, CSS, JS, imagens, paths, nem reformate qualquer arquivo.

## Passos

1. Substitua TODOS os arquivos do repositório pelos arquivos deste pacote, preservando a estrutura de pastas.
2. `git add -A`
3. `git commit -m "Atualiza case Chorume (hero, seções 01-05, bastidores, CTA) + otimização de imagens"`
4. `git push`
5. Aguarde o deploy do GitHub Pages concluir.

## Cache busting (NÃO MUDAR)

Todas as páginas foram unificadas para:
- **`site-nav.js?v=12`**
- **`case-patterns.css?v=12`**

**Não mude essas versões** — elas garantem que o cache antigo não reapareça.

## Arquivos do site

```
index.html                      (home)
case-delta.html                 (case Delta Design System)
case-mrv.html                   (case MRV)
case-ford.html                  (case Ford)
case-chorume.html               (case Chorume — principal alteração desta rodada)
delta-atoms.html                (biblioteca de componentes, embarcada em iframe no case Delta)
color-tokens.html               (sub-página Delta, iframe)
diagrama-de-contrastes.html     (sub-página Delta, iframe)
tipografia.html                 (sub-página Delta, iframe)
elevacao.html                   (sub-página Delta, iframe)
opacidade.html                  (sub-página Delta, iframe)
bordas.html                     (sub-página Delta, iframe)
home.css
case-patterns.css
site-nav.js
img/                            (todas as imagens: delta, mrv, ford, chorume)
+ assets na raiz (svgs, pngs, webp)
```

## O que mudou nesta rodada (case-chorume.html)

- Hero reorganizado em 2 colunas (bloco editorial + tríptico de imagens) com prêmio Best of Show.
- Seções 01 (Contexto), 02 (Moodboard) e 03 (Tipografia) no padrão editorial; boards full-bleed alinhados.
- Seção 04 Bastidores com pull quote no estilo suíço.
- Seção 05 Universo da marca (nova) com imagem full-bleed.
- CTA "Vamos conversar?" idêntico ao da home (card lime + contatos com ícones).
- Imagens pesadas convertidas para WebP (hero e troféu) — removido o "reveal lento" de carregamento.
- Todos os efeitos de animação/reveal desativados (conteúdo fixo).

Os demais arquivos (home e outros cases) não tiveram mudanças de conteúdo nesta rodada — apenas a versão de cache foi unificada para `v=12`.
