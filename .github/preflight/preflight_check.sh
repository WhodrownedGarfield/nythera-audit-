#!/usr/bin/env bash
# preflight_check.sh — robust validation for NYTHERA prompts
set -euo pipefail
PROMPTS_DIR=".prompts"
BAD=0
FAILED_FILES=()

echo "NYTHERA preflight: starting checks"

if [ ! -d "${PROMPTS_DIR}" ]; then
  echo "ERROR: ${PROMPTS_DIR} directory not found."
  exit 2
fi

mapfile -t FILES < <(find "${PROMPTS_DIR}" -type f -name "*.txt" -o -name "*.md" -o -name "*.prompt" -print)

if [ "${#FILES[@]}" -eq 0 ]; then
  echo "WARN: No prompt files found in ${PROMPTS_DIR}."
fi

check_header() {
  local f="$1"
  local header
  header=$(head -n 1 "$f" || true)
  if ! echo "$header" | grep -Eq "^NYTHERA\|LEVEL=[0-5]\|AUTHOR=[^|]+\|TS=[0-9]{4}-[0-9]{2}-[0-9]{2}"; then
    echo "Malformed header in: $f"
    return 1
  fi
  return 0
}

check_consent() {
  local f="$1"
  local header
  header=$(head -n 1 "$f" || true)
  if echo "$header" | grep -Eq "LEVEL=[2-5]"; then
    if ! grep -q -E "^CONSENT:\s*yes\s*$" "$f"; then
      echo "Missing 'CONSENT: yes' in $f (required for LEVEL>=2)"
      return 1
    fi
  fi
  return 0
}

BAD=0
for f in "${FILES[@]}"; do
  echo "Checking: $f"
  if ! check_header "$f"; then
    BAD=1
    FAILED_FILES+=("$f (bad header)")
    continue
  fi
  if ! check_consent "$f"; then
    BAD=1
    FAILED_FILES+=("$f (missing consent)")
    continue
  fi
done

if [ "$BAD" -ne 0 ]; then
  echo
  echo "PREFLIGHT FAILED. Offending files:"
  for it in "${FAILED_FILES[@]}"; do
    echo " - $it"
  done
  exit 3
fi

echo "Preflight checks passed."
exit 0
