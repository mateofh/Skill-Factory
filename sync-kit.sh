#!/usr/bin/env bash
# Regenera la copia distribuible del kit desde la fuente de verdad en AI-OS.
#
#   Fuente:  $AIOS_ROOT/clients/bootcamp-cc/skills/
#   Destino: ./plugins/kit/skills/
#
# La copia NUNCA se edita a mano. Se edita en AI-OS y se corre esto.
# Los SKILL.md son idénticos en los dos lados: Claude Code ignora los campos
# de frontmatter que solo usa AI-OS (domain, audience, triggers, complexity),
# así que un mismo archivo sirve para los dos hogares.

set -euo pipefail

if [[ -z "${AIOS_ROOT:-}" ]]; then
  echo "error: AIOS_ROOT no está definido." >&2
  exit 1
fi

SRC="$AIOS_ROOT/clients/bootcamp-cc/skills"
DST="$(cd "$(dirname "$0")" && pwd)/plugins/kit/skills"

if [[ ! -d "$SRC" ]]; then
  echo "error: no existe la fuente: $SRC" >&2
  exit 1
fi

if ! compgen -G "$SRC/*/SKILL.md" > /dev/null; then
  echo "error: no hay ningún SKILL.md en $SRC — nada que copiar." >&2
  exit 1
fi

# Espejo exacto: lo que se borró en la fuente se borra en el destino.
mkdir -p "$DST"
rsync -a --delete --exclude '.DS_Store' "$SRC/" "$DST/"

COUNT=$(find "$DST" -name SKILL.md -mindepth 2 -maxdepth 2 | wc -l | tr -d ' ')
echo "Copiados $COUNT skills -> $DST"

echo
echo "Verificando el paquete..."
claude plugin validate "$(dirname "$DST")"
