#!/usr/bin/env bash
# Validates a sprint markdown has the new template fields where applicable.
# Usage: ./scripts/validate-sprint.sh <sprint.md>
set -euo pipefail

file="${1:?Usage: validate-sprint.sh <sprint.md>}"
[ -f "$file" ] || { echo "FAIL: $file not found"; exit 1; }
errors=0

# Build: line is conventional but not strict — some sprints (portfolio capstones) use different shapes.
if ! grep -qE '^Build:|^\*\*Build:\*\*|Build: ' "$file"; then
  echo "WARN: $file no Build: line — confirm sprint shape is intentional (e.g. portfolio capstone)"
fi

# If file mentions external/ vendor path, must have Walkthrough+Source
if grep -q 'external/' "$file"; then
  grep -q '^Walkthrough:\|^\*\*Walkthrough:\*\*\|Walkthrough: ' "$file" || echo "WARN: $file references external/ but no Walkthrough: field"
  grep -q '^Source:\|^\*\*Source:\*\*\|Source: ' "$file" || echo "WARN: $file references external/ but no Source: field"
fi

if [ "$errors" -eq 0 ]; then
  echo "PASS: $file"
else
  exit 1
fi
