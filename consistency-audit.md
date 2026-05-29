# Consistency Audit — Portfolio Adriana Pommot

Auditoria concreta dos cases contra o cânone (`DESIGN-SYSTEM.md` + `DESIGN-SYSTEM-cases.md`, decisões travadas de 28/mai). Gerado a partir da leitura dos HTMLs reais do repo.

Régua: `case-mrv.html`. Escopo auditado: MRV, Delta, Ford, Chorume, Dasa.

Dividido em duas fases por decisão da Adri:
- **Fase 1 — convergência sistêmica mecânica** (este documento, acionável).
- **Fase 2 — convergência estrutural/editorial** (escopada no fim, executada depois, um case por vez).

---

## 1. Matriz — case × dimensão

Legenda: ✅ aderente · ⚠️ divergência leve · 🔴 violação · — não se aplica.

| Dimensão | MRV (régua) | Delta | Ford | Chorume | Dasa |
|---|---|---|---|---|---|
| Tipografia (Jakarta exclusiva) | ✅ | ⚠️ `monospace` solto | ✅ | ✅ (não General Sans) | rebuild |
| Cor — metadata value | 🔴 lime | 🔴 lime | 🔴 lime | 🔴 lime | rebuild |
| Cor — chrome (nav, ::selection) | herança home | herança home | herança home | herança home | — |
| Cor — fundo de seção | ✅ | ✅ | ✅ | ✅ | 🔴 `--gray-6` creme |
| Grid / escala de token | ✅ | ✅ idêntico | ✅ idêntico | ✅ idêntico | antigo |
| Spacing (moldura 120px) | base | ✅ igual base | ✅ igual base | ✅ igual base | — |
| Containers / max-width | ✅ | ✅ | ✅ | ✅ | antigo |
| Componentes de conteúdo | ✅ completo | ⚠️ bespoke | ⚠️ bespoke | ⚠️ bespoke | nenhum |
| Reveal (.rv + observer) | ✅ | ✅ | ✅ | ✅ | ✅ |
| Cursor (default em case) | ✅ | ✅ | ✅ | ✅ | 🔴 custom |
| Seções 01–07 | ✅ | ✅ | ✅ | ✅ | 🔴 zero |

**Leitura geral:** o chrome (nav, tokens, escala tipográfica, containers, reveal, spacing de moldura) está unificado entre os 4 cases ativos — todos compartilham o mesmo vocabulário. A fragmentação real está na **camada de componentes de conteúdo** (Fase 2) e numa **única violação de cor uniforme** (Fase 1).

---

## 2. FASE 1 — Convergência mecânica (acionável)

Três correções reais. As demais dimensões da lista de prioridade da Adri (spacing, grids, containers, tokens, chrome) foram auditadas e **já estão consistentes** — ver §2.4. Não inventar trabalho onde não há divergência.

### 2.1 — [ALTA] Lime na metadata value → cinza

**Divergência:** a decisão de 28/mai (lime fora dos cases; `.case-meta-value` = `--gray-4`) foi documentada mas **nunca aplicada ao código**. Os 4 cases — incluindo o benchmark MRV — ainda renderizam a metadata value em lime (`--accent-light`).

**Correção:** trocar a cor da regra `.case-meta-value` de `var(--accent-light)` para `var(--gray-4)`, nos 4 arquivos.

| Arquivo | Linha | Tem hoje | Trocar por |
|---|---|---|---|
| case-mrv.html | ~293 | `color: var(--accent-light);` | `color: var(--gray-4);` |
| case-ford.html | ~279 | `color: var(--accent-light);` | `color: var(--gray-4);` |
| case-chorume.html | ~276 | `color: var(--accent-light);` | `color: var(--gray-4);` |
| case-delta.html | ~88 | `...letter-spacing:.02em;color:var(--accent-light)}` | `...letter-spacing:.02em;color:var(--gray-4)}` |

**Guarda-corpo (NÃO tocar):** em cada arquivo, `var(--accent)` e `var(--accent-light)` continuam aparecendo em `::selection`, `.nav-toggle:hover` e `.nav-menu .nav-cta:hover`. **Esses são a nav da home colada e devem permanecer lime.** A correção é cirúrgica: só a regra `.case-meta-value`. Cada arquivo tem exatamente 1 ocorrência de `color` com `--accent-light` dentro de `.case-meta-value` — é essa e só essa.

### 2.2 — [MÉDIA] Delta: fonte monospace solta → Jakarta

**Divergência:** `case-delta.html` tem uma família `monospace` num placeholder, violando "Jakarta exclusiva".

**Correção:**

| Arquivo | Linha | Seletor | Tem hoje | Trocar por |
|---|---|---|---|---|
| case-delta.html | ~167 | `.proc-visual-placeholder-path` | `font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,monospace;` | `font-family:var(--font-body);` |

**Guarda-corpo:** trocar apenas o valor de `font-family` dessa regra. Não mexer em `font-size`, `color` nem no resto do bloco.

### 2.3 — [BAIXA / opcional] MRV: token morto

**Divergência:** `case-mrv.html` define `--accent-faint: #F9FDEE` (lime desbotado) que **não é usado em lugar nenhum** (verificado: 0 usos). Token órfão. Com lime fora dos cases, não deve voltar a ser usado.

**Correção (opcional, faxina):** remover a linha `--accent-faint: #F9FDEE;` do `:root` do MRV (~L29). Não quebra nada porque não tem uso. Pode ficar pra Fase 1 ou ser ignorado.

### 2.4 — Dimensões auditadas SEM divergência (não tocar)

Registrado para evitar refactor desnecessário:

- **Spacing:** os `120px` em `.case-header` (padding-top), `.more-work` e `.cta-section` são **moldura estrutural**, idênticos nos 4 cases e no benchmark. Não são o gap entre seções `ed-*` (esse usa `--section-gap` = 96px, correto). O cânone proíbe 120px *entre seções*, não na moldura. **Manter.**
- **Grids / containers / max-width:** consistentes entre os 4.
- **Tokens de escala** (`--t-*`, `--space-*`, `--col-*`): vocabulário **idêntico** nos 4 cases. Boa notícia sistêmica — ninguém inventou escala própria.
- **Chrome (nav, marquee, CTA, footer, reveal):** cópia consistente da home. Lime na nav/seleção é correto e fica.
- **`.highlight` lime:** não existe no CSS dos cases (componente já extinto). Nada a fazer.

### 2.5 — Dasa: fora da Fase 1

Dasa roda num sistema antigo (`--gray-6: #F5F1EB` como fundo, cursor custom `cursor-dot` + `cursor:none`, zero seções `ed-num`, tokens pré-reconciliação). **Não corrigir por cima.** Está fora do ar e será refeito a partir do MRV. Os "pecados" de Fase 1 dele (cursor, fundo creme, tokens antigos) se resolvem no rebuild, não em patch. Rebuild pertence à Fase 2 ou a uma trilha de build separada.

---

## 3. Resumo de execução para o Code (Fase 1)

Bloco pronto pra instruir o Claude Code. Cinco edições, todas cirúrgicas:

```
1. case-mrv.html      → na regra .case-meta-value, trocar color: var(--accent-light) por color: var(--gray-4)
2. case-ford.html     → idem
3. case-chorume.html  → idem
4. case-delta.html    → na regra .case-meta-value (linha única), trocar color:var(--accent-light) por color:var(--gray-4)
5. case-delta.html    → na regra .proc-visual-placeholder-path, trocar font-family:ui-monospace,...,monospace por font-family:var(--font-body)

OPCIONAL:
6. case-mrv.html      → remover a linha --accent-faint: #F9FDEE; do :root (token sem uso)

NÃO TOCAR em nenhum arquivo:
- ::selection { background: var(--accent) ... }
- .nav-toggle:hover { background: var(--accent) ... }
- .nav-menu .nav-cta:hover { color: var(--accent) }
- qualquer 120px de .case-header / .more-work / .cta-section
- case-dasa.html (rebuild, não patch)
```

**Validação pós-edição:** renderizar o header de cada case a 1440px e confirmar que a metadata value (Função / Empresa / Período / Foco) aparece em cinza, não em lime — e que a nav continua com hover lime.

---

## 4. FASE 2 — Convergência estrutural/editorial (escopo, não executar agora)

Depois da base mecânica estável. Um case por vez, sessão separada. **Não é redesign** — é consolidação de modularidade.

**Pergunta central:** MRV é o único com o vocabulário completo de componentes de case (`kr-card`, `md-viewer`, `results-hero`, `challenge`, `ed-two-col`). Delta, Ford e Chorume usam estruturas bespoke. Decidir, por case, o que **deve convergir** para componente canônico e o que é **bespoke justificado pelo tipo de conteúdo**:

- **Delta** (design system): conteúdo é tokens/componentes, não fluxo de produto. `md-viewer` pode não caber; avaliar adoção de `results-hero`/`ed-two-col` onde fizer sentido.
- **Ford** (workshop/ideação): conteúdo é processo e ambiente. Avaliar `challenge` cards e `ed-two-col`.
- **Chorume** (identidade visual): showcase. Decidir antes: vira case de 7 seções completo ou formato reduzido?
- **Dasa**: rebuild from MRV.

**Apoio estrutural (não estético) da referência visual** — usar só como estudo de:
- organização e arquitetura dos blocos
- progressão editorial entre seções
- ritmo visual e cadência
- modularidade e repetição compositiva

Sem copiar layout, identidade ou conteúdo. Resultado final permanece nativo do sistema do portfólio.

**Pendências de repo (faxina, fora do escopo de audit):** root sujo (`0_3 (1).jpeg`, `download (1).png`, `MRV_extra.png`), `img-delta/` duplicando `img/delta/`, worktree `.claude/worktrees/...` versionado no zip, `cv-adriana-pommot-2026.pdf` ausente na raiz (confirmar se deleção foi intencional).
