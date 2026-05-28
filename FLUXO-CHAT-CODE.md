# FLUXO Chat ↔ Code — Protocolo de trabalho

Documento de processo do portfólio. Define como uma decisão vira código sem desgastar a Adri com QA das instruções.

## Princípio
- **Chat** = olho, julgamento e teste. Renderiza, decide com a Adri, escreve a instrução, audita a instrução.
- **Code** = mão no repo. Executa, renderiza o resultado, faz push.
- **Adri** = decisão final e correção.
- A **doc é fonte de verdade**; o repo conforma à doc, nunca o contrário.

---

## As 7 etapas

1. **Chat testa** — render/espécime com fontes reais (npm `@fontsource`, Playwright headless a 1440px **e** 640px). Decisão visual da Adri.
2. **Fecha doc** — a decisão vira regra na `DESIGN-SYSTEM.md` (ou doc relevante).
3. **Chat escreve o changeset** — ancorado por **seletor/conteúdo, NUNCA por número de linha**. Antes→depois explícito quando troca conteúdo.
4. **Auditoria adversarial** — gate obrigatório (checklist abaixo). Só depois disso o batch pode ir pro Code.
5. **Handoff** — Chat entrega o batch com um `LEIA-PRIMEIRO` que orquestra: o que é cada arquivo, a ordem, o escopo e o verify.
6. **Code executa + render-verify** — Code roda, renderiza (1440 + 640) e devolve screenshot.
7. **Adri confere** — e corrige com o Chat se algo escapou.

---

## Etapa 4 — Checklist da auditoria adversarial

> Antes de qualquer "pode mandar pro Code", o Chat relê as próprias instruções **como se fosse o Code recebendo a frio** e confirma cada item. Esta etapa é do Chat; a Adri não deve precisar ser o QA das instruções.

- [ ] Ancoragem por seletor/conteúdo, sem número de linha.
- [ ] Troca de conteúdo tem **antes→depois exato**. Texto reescrito está marcado como reescrito, com instrução de **não preservar o antigo**.
- [ ] Anchor robusto a indentação/espaços (não depende de match exato de whitespace).
- [ ] Mudança de marcação (ex: `span`→`p`, `p`→`div`) checada contra o **CSS existente**: a classe não assume a tag antiga? O layout não quebra?
- [ ] Dependências entre changesets declaradas (ex: 02 depende de 01) + pré-condição verificável escrita.
- [ ] Tokens/variáveis citados **existem** (todo `var(--x)` está definido).
- [ ] Verify cobre: render 1440 **e** 640, fonte real (não fallback), regra de borda §7.1, **e** confirmação de que o conteúdo antigo sumiu inteiro (listar trechos a não encontrar).
- [ ] Escopo travado e explícito: quais arquivos mexer e quais **não** tocar.
- [ ] Contradições com outras docs (`DESIGN-SYSTEM-cases.md` etc.) checadas. Se houver, ou reconcilia, ou declara deferimento consciente.
- [ ] Itens fora de escopo **nomeados** no fim, pra não virarem surpresa depois.

---

## Restrições fixas do fluxo

- **Chat NÃO renderiza o site ao vivo** — a rede do container não alcança `github.io`. Verify visual = screenshot do Code ou zip de volta pro Chat. Ao vivo, o Chat só faz checagem do **código-fonte publicado**, nunca visual.
- Render do Chat usa **fontes reais** via npm `@fontsource` (Jakarta), nunca fallback de sistema — senão o espécime mente.
- **Snapshot fresco por ciclo** — todo changeset parte de um zip/pull atual. Instrução não pode citar código velho.
- **Entrega consolidada** — um batch fechado por ciclo (com `LEIA-PRIMEIRO`), não patches soltos.
- Ações irreversíveis (deletar, push, mudar sharing) o Chat não faz — instrui a Adri a executar.
- A cada deliverable fechado, **chat novo** pra não acumular peso de contexto; o Chat deixa um resumo de estado pra colar.

---

## Definições (canônicas na DESIGN-SYSTEM.md §7.1)
- **Viúva (nossa def):** não é só palavra única na última linha — é qualquer linha que termina **curta no meio da medida** OU **em conector** (e, de, que, com, em).
- **Changeset:** instrução de mudança ancorada por seletor, com antes→depois.
