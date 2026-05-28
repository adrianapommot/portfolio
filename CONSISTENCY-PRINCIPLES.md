# CONSISTENCY PRINCIPLES

Camada de direção. Define **como decidir** durante as revisões de consistência do portfólio.

---

## O que este documento é (e não é)

**Não é** audit, checklist, nem matriz de divergência. Não lista problemas concretos nem analisa arquivos.

**É** o critério de decisão que rege a auditoria e as correções: princípios, prioridades e comportamento esperado nas revisões.

O audit real (`consistency-audit.md`) vem depois, a partir destes princípios: lê os HTMLs concretos, compara com `DESIGN-SYSTEM.md`, gera os deltas.

---

## Tese

Neste momento, **consistência vale mais que originalidade.**

Os cases precisam parecer o mesmo ecossistema editorial, não microsites independentes. Toda decisão de revisão passa por esse filtro antes de qualquer outro. A prioridade não é inventar layout novo nem adicionar complexidade: é estabilizar, consolidar, reduzir variação e fortalecer repetição estrutural.

---

## Princípios

### 1. Reutilizar antes de criar

O conjunto reutilizável já existe e está documentado: tokens, escala tipográfica e componentes cross-file do `DESIGN-SYSTEM.md` (nav, marquee, case header, barra de metadata, pill buttons, reveal).

**Decisão:** antes de inventar qualquer solução, achar o padrão equivalente que já está no sistema. Se existe e funciona, evoluir. Recriar do zero só com justificativa explícita.

**Teste de violação:** dois cases resolvendo a mesma necessidade (header, card, citação, grid de entregas) de formas estruturalmente diferentes.

### 2. Hierarquia rasa e repetida

A escala tipográfica vem da tabela do `DESIGN-SYSTEM.md`. Não se cria tamanho ou peso novo por case.

**Teto:** máximo ~3 níveis tipográficos por case (já definido na DS §11).

**Decisão:** ao precisar de ênfase, reusar um nível existente antes de adicionar um novo.

**Teste de violação:** mais de 3 tratamentos tipográficos distintos numa página, ou um case usando tamanho/peso que não existe na escala canônica.

### 3. Referência absorve estrutura, nunca estética

Referências externas servem para estudar construção editorial, modularidade, ritmo visual e relação entre blocos.

**Proibido:** copiar layout literal, identidade visual ou conteúdo.

**Decisão:** extrair o princípio sistêmico e aplicá-lo com os tokens e a linguagem do próprio portfólio.

**Teste de violação:** um case que só faz sentido visual por causa da referência, não por causa do sistema.

---

## Handoff para o audit real

O `consistency-audit.md`, partindo destes princípios, deve:

1. ler cada HTML concreto (index + cases)
2. comparar contra `DESIGN-SYSTEM.md`
3. gerar matriz **case × dimensão** (tipografia, cor, grid, spacing, componentes, reveal, cursor, section layout)
4. apontar cada delta com arquivo de origem e prioridade
5. nunca propor solução nova quando uma existente serve (Princípio 1)
