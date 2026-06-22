#!/usr/bin/env bash
# Guard de deploy do portfólio (adrianapommot.com).
# Roda no pre-commit e pode ser chamado à mão: bash tools/deploy-check.sh [arquivos.html...]
# Bloqueia: travessão (— ou –) em texto RENDERIZADO (texto, alt, title, aria-label, placeholder)
#           e referência de imagem quebrada (src=/url() apontando p/ arquivo inexistente).
# Avisa (não bloqueia): imagem raster >400KB que deveria ser webp.
# Por que: o Claude design LÊ o repo e re-exporta; quem comita os exports é o deploy.
# Travar aqui mantém o repo (fonte que o design consome) sempre limpo e impede reincidência.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1

# Arquivos a checar: argumentos, ou todos os HTML versionados da raiz.
if [ "$#" -gt 0 ]; then
  FILES=("$@")
else
  FILES=()
  while IFS= read -r line; do
    [ -n "$line" ] && FILES+=("$line")
  done < <(git ls-files '*.html' | grep -vE '^_archive/')
fi
[ "${#FILES[@]}" -eq 0 ] && { echo "✓ deploy-check: nada a checar."; exit 0; }

fail=0

# --- 1. Travessões em texto renderizado ---
# Detecta SÓ em dash (U+2014) e en dash (U+2013) em texto renderizado ou nos
# atributos alt/title/aria-label/placeholder. Usa perl em UTF-8 para não
# confundir com minus (−), setas (→ ↗ ↓), ponto-médio (·) etc.
for f in "${FILES[@]}"; do
  [ -f "$f" ] || continue
  hits=$(perl -CSD -ne 'print "$.:$_" if /(?:>[^<]*[\x{2014}\x{2013}])|(?:(?:alt|title|aria-label|placeholder)="[^"]*[\x{2014}\x{2013}])/' "$f")
  if [ -n "$hits" ]; then
    echo "✖ TRAVESSÃO em texto renderizado: $f"
    echo "$hits" | sed 's/^/    /'
    echo "   -> troque — por vírgula / dois-pontos / ponto na copy, ou ponto-médio (·) em rótulos."
    fail=1
  fi
done

# --- 2. Referências de imagem quebradas (html + css) ---
CSS=$(git ls-files '*.css' | grep -vE '^_archive/')
broken=$( { for f in "${FILES[@]}"; do [ -f "$f" ] && grep -hoE 'src="[^"]+\.(webp|png|jpe?g|gif|svg)"' "$f" | sed 's/src="//;s/"//'; done
           for c in $CSS; do [ -f "$c" ] && grep -hoE "url\(['\"]?[^)'\"]+\.(webp|png|jpe?g|gif|svg)" "$c" | sed -E "s/url\(['\"]*//"; done
           for f in "${FILES[@]}"; do [ -f "$f" ] && grep -hoE "url\(['\"]?[^)'\"]+\.(webp|png|jpe?g|gif|svg)" "$f" | sed -E "s/url\(['\"]*//"; done
         } | sort -u | while read -r ref; do [ -f "$ref" ] || echo "$ref"; done )
if [ -n "$broken" ]; then
  echo "✖ REFERÊNCIA DE IMAGEM QUEBRADA (arquivo não existe):"
  echo "$broken" | sed 's/^/    /'
  fail=1
fi

# --- 3. Aviso: raster pesado fora de webp ---
heavy=$( { for f in "${FILES[@]}"; do [ -f "$f" ] && grep -hoE 'src="[^"]+\.(png|jpe?g)"' "$f" | sed 's/src="//;s/"//'; done; } \
         | sort -u | while read -r ref; do
             [ -f "$ref" ] || continue
             kb=$(du -k "$ref" | cut -f1)
             [ "$kb" -gt 400 ] && echo "    ${kb}KB  $ref"
           done )
if [ -n "$heavy" ]; then
  echo "⚠ AVISO: raster >400KB ainda em PNG/JPG (considere converter p/ webp):"
  echo "$heavy"
fi

if [ "$fail" -ne 0 ]; then
  echo ""
  echo "Commit bloqueado pelo guard de deploy. Corrija os ✖ acima."
  echo "(Para checar à mão: bash tools/deploy-check.sh)"
  exit 1
fi
echo "✓ deploy-check: sem travessões renderizados, sem refs quebradas."
exit 0
