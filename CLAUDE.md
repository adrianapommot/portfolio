# Portfólio — Adriana Pommot · Regras permanentes

## Inegociáveis de copy (memorizar sempre)
- **NUNCA usar travessões (—) ou em dash.** Denuncia texto de IA. Usar vírgula, ponto, dois-pontos ou parênteses no lugar.
- **NUNCA deixar viúvas nem frases quebradas em "meia linha".** Toda linha de texto deve ocupar largura cheia e harmônica. Se a diagramação não fechar, ajustar max-width/copy ou adicionar texto para equilibrar. Usar text-wrap: pretty/balance.
- **Só usar estilos de texto que já existem** no sistema (index / home). Não inventar novos tamanhos/pesos de fonte.

## Sistema
- Fonte única: Plus Jakarta Sans.
- Paleta: preto #111, bone #f4f3ef, lime #e0ff33 (accent, igual ao index — o DESIGN-SYSTEM.md cita amarelo ácido #E8E94D mas o index NÃO foi migrado: vale o lime). off-white discreto #FAFAF8.
- Espaçamento de seção: clamp(48px,5.5vw,80px) — ritmo reduzido, alinhado entre index e cases.
- Sem emoji no produto. Sem gradientes chamativos. Minimalismo premium.

## Escala tipográfica do case (NUNCA inventar tamanho fora dela)
- --ty-title clamp(44,4.8vw,60) · título de seção
- --ty-lead 24px/500 · lead (frase após título) e subtítulo de bloco
- --ty-copy 17px · corpo; 17px/600 = título de card/item (.sol-t, .prob-title, .res-title, .esc-title)
- --ty-small 14px · descrição de card, legenda
- --ty-metric 32px · métrica média; números grandes via clamp
- --ty-label 12px / labels uppercase 12-13px 700, cor --gray-3 (#756f67, igual eyebrow do index)
- Hierarquia por PESO, não por tamanho. Proibido criar tamanho novo (ex.: 21px).
- Cinzas de texto: --black títulos, --gray-1 lead/forte, --gray-2 corpo, --gray-3 labels.

## Header/Hero do case — PADRÃO APROVADO (memorizado, replicar em todos os cases)
- Fundo off-white #FAFAF8 (claro, nunca escuro).
- "Todos os projetos" (back link): topo, texto simples em --gray-4 (cinza claro), seta, SEM borda/pílula (não competir com a pílula da nav). Margem grande abaixo, afastado do bloco.
- Linha de marca: só o logo MRV (sem "MRV · Fintech"), colado ao título (gap pequeno).
- Título: type-forward, 2 linhas, clamp(38px,4.4vw,62px)/700/uppercase, palavra-chave marcada com bloco lime (.hero-hl). NUNCA gigante.
- Foot: coluna esquerda = intro (lead 16-19) + bloco de resultado (rótulo uppercase em cima, valor embaixo, alinhado à esquerda); à direita, alinhado à base da linha do resultado, a tag "Case de Product Design · 2019".
- Barra de metadados: 4 colunas alinhadas à esquerda, divisórias finas, rótulo 11px/700/uppercase/gray-3 + valor 16px/600/black (hierarquia clara).
- Nav (pílula "Adriana Pommot" + toggle + menu) IDÊNTICA à home: lime sólido, roll no hover.

## Narrativa do case (arco de designer sênior)
Hero → Contexto → Problema → Estratégia → Solução → Fluxo Desktop → Resultados → Piloto à Escala → Fundação Visual → Aprendizados → Em Movimento → Visão Geral.
Métricas aparecem UMA vez (sem duplicar entre Resultados e Piloto).

## Arquivos
- index.html (home, usa home.css)
- case-mrv.html (case completo, CSS inline)
- Outros cases (Ford, Delta, Chorume) foram perdidos; capas usam placeholder.
