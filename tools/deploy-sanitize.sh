#!/usr/bin/env bash
# Sanitizador de deploy do portfólio (adrianapommot.com).
# Rodar como PRIMEIRO passo de cada deploy, depois de copiar os arquivos do export
# e ANTES do commit:  bash tools/deploy-sanitize.sh
#
# Faz 2 coisas que o export do design re-quebra a cada rodada:
#   1. Remove os travessões (—) conhecidos em copy/alt/title (substituições vetadas).
#   2. Trava o cache-buster ?v= de home.css/case-patterns.css: nunca abaixo do que
#      está no ar; +1 automático quando o conteúdo do CSS mudou.
# No fim roda o guard (tools/deploy-check.sh). Se sobrar travessão NOVO/desconhecido,
# o guard aponta e aí é correção manual (não adivinhamos pontuação de copy nova).
#
# Compatível com bash 3.2 (macOS). Detecção/edição de — em perl UTF-8.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1

echo "── deploy-sanitize ───────────────────────────────"

# ---------------------------------------------------------------------------
# 1. Travessões conhecidos (mesmos pontos re-exportados toda rodada)
# ---------------------------------------------------------------------------
# Copy corrida e alt: vírgula / dois-pontos / ponto.
[ -f case-mrv.html ] && perl -CSD -Mutf8 -i -pe 's/sem novas etapas \x{2014} a interface se reorganizou/sem novas etapas. A interface se reorganizou/g' case-mrv.html
[ -f case-ford.html ] && perl -CSD -Mutf8 -i -pe 's/produto e espaço \x{2014} para que cada engenheiro/produto e espaço, para que cada engenheiro/g' case-ford.html
if [ -f case-delta.html ]; then
  perl -CSD -Mutf8 -i -pe 's/Estimativa \x{2014} feedback de prazos/Estimativa: feedback de prazos/g' case-delta.html
  perl -CSD -Mutf8 -i -pe 's/Global Design Tokens \x{2014} fundação visual/Global Design Tokens, fundação visual/g' case-delta.html
  # title= de iframes do Delta: ponto-médio (·)
  perl -CSD -Mutf8 -i -pe 's/(title="[^"]*?) \x{2014} (Delta Design System")/$1 \x{00B7} $2/g; s/(title="Delta Atoms) \x{2014} (biblioteca)/$1 \x{00B7} $2/g' case-delta.html
fi
if [ -f case-chorume.html ]; then
  perl -CSD -Mutf8 -i -pe 's/Troféu The Fudge \x{2014} Best of Show, Miami Ad School/Troféu The Fudge, Best of Show, Miami Ad School/g' case-chorume.html
  perl -CSD -Mutf8 -i -pe 's/Troféu The Fudge \x{2014} Best of Show Miami Ad School \x{2014} cenografia/Troféu The Fudge, Best of Show Miami Ad School, cenografia/g' case-chorume.html
fi
echo "  ✓ travessões conhecidos tratados (mrv/ford/delta/chorume)"

# ---------------------------------------------------------------------------
# 2. Trava de cache-buster ?v= (home.css, case-patterns.css)
# ---------------------------------------------------------------------------
max_ver_in() {  # uso: max_ver_in <css> <conteudo>  -> maior N em "<css>?v=N"
  printf '%s' "$2" | grep -oE "$(printf '%s' "$1" | sed 's/[.]/\\./g')\?v=[0-9]+" \
    | grep -oE '[0-9]+$' | sort -n | tail -1
}

lock_version() {  # uso: lock_version <css>
  css="$1"
  # arquivos (working tree) que importam esse css
  refs=$(grep -lE "$(printf '%s' "$css" | sed 's/[.]/\\./g')\?v=[0-9]+" *.html 2>/dev/null)
  [ -z "$refs" ] && return 0
  # versão viva = maior N no HEAD entre os que importam
  live=0
  for f in $refs; do
    head_content=$(git show "HEAD:$f" 2>/dev/null) || continue
    v=$(max_ver_in "$css" "$head_content"); [ -n "$v" ] && [ "$v" -gt "$live" ] && live="$v"
  done
  # maior N atual no working tree (caso eu já tenha bumpado à mão)
  cur=0
  for f in $refs; do
    v=$(max_ver_in "$css" "$(cat "$f")"); [ -n "$v" ] && [ "$v" -gt "$cur" ] && cur="$v"
  done
  # conteúdo do css mudou vs HEAD?
  if git diff --quiet HEAD -- "$css" 2>/dev/null; then changed=0; else changed=1; fi
  target="$live"; [ "$changed" -eq 1 ] && target=$((live+1))
  [ "$cur" -gt "$target" ] && target="$cur"   # nunca baixar
  # aplica
  for f in $refs; do
    perl -i -pe "s/\Q$css\E\?v=[0-9]+/$css?v=$target/g" "$f"
  done
  state="inalterado"; [ "$changed" -eq 1 ] && state="MUDOU"
  echo "  ✓ $css ($state): ?v travado em v$target (vivo=v$live)"
}

lock_version home.css
lock_version case-patterns.css

# ---------------------------------------------------------------------------
# 3. Guard final (rede de segurança p/ travessões novos / refs quebradas)
# ---------------------------------------------------------------------------
echo "── guard ─────────────────────────────────────────"
bash "$ROOT/tools/deploy-check.sh"
rc=$?
if [ "$rc" -ne 0 ]; then
  echo ""
  echo "⚠ Guard encontrou item NÃO coberto pela sanitização automática (travessão novo?)."
  echo "  Corrija manualmente o(s) ✖ acima e rode de novo."
fi
exit "$rc"
