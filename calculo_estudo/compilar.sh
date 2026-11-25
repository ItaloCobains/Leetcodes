#!/bin/sh
# Compila cada .tex a partir da pasta dele, para os \input{../preambulo.tex} e as figuras resolverem.
set -e
ROOT="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
cd "$ROOT"
find . -name '*.tex' ! -name 'preambulo.tex' | sort | while IFS= read -r f; do
  dir=$(dirname "$f")
  base=$(basename "$f")
  echo "== $f"
  (cd "$dir" && pdflatex -interaction=nonstopmode -halt-on-error "$base" >/tmp/calculo_pdflatex.log) || {
    echo "FALHOU: $f (log em /tmp/calculo_pdflatex.log)"
    exit 1
  }
done
echo "PDFs gerados ao lado de cada .tex"
