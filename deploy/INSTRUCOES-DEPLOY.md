# Instruções para deploy — LEIA E EXECUTE · NÃO ALTERE NADA

## ⚠️ Importante

Este pacote (`deploy/`) contém o portfólio finalizado. Sua única tarefa é **substituir os arquivos no repositório git por estes e fazer o deploy**. 

**NÃO modifique, edite, reformate, "melhore" ou refatore nenhum arquivo.** Nada de markup, CSS, JS, imagens, paths ou versões. Apenas copie como está, commit e push.

## Passos

1. Substitua TODOS os arquivos do repositório pelos arquivos deste pacote, preservando a estrutura de pastas.
2. `git add -A`
3. `git commit -m "Atualiza portfólio: thumbs, footers, CTA, botões e seção Outros Projetos"`
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

- **Thumbs novos** (Delta, MRV, Ford) em WebP otimizado, na home e na seção "Outros projetos" dos cases.
- **Seção "Outros projetos"** (todos os cases): proporção corrigida para 2:1 — sem mais corte.
- **Home · thumbs de projeto**: arte limpa, com título + tag à esquerda e botão "Ver case →" à direita, abaixo da imagem (toda a área clicável).
- **Botões padronizados** retangulares (border-radius 4px) em todo o projeto.
- **CTA "Vamos conversar?"** em tarja lime full-width na home e no Chorume (igual Ford/MRV).
- **Footers padronizados** em index, delta, mrv e chorume.
- **Case Chorume**: hero, seções 01–05, bastidores e encerramento revisados; imagens pesadas convertidas para WebP.
- **Case Delta**: subtítulos das seções 03 e 04 ajustados.

Tudo já está aplicado nos arquivos deste pacote. É só subir.
