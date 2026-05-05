#!/usr/bin/env bash
# For each sprint markdown, list session blocks and their declared fields.
# Used to verify normalization completed — every sprint should show >=1
# `### Sessão N — title` line, except documented capstone exceptions
# (sprint03, sprint15) which carry an HTML comment marker at the top.
set -euo pipefail

for f in docs/study/fase*/sprint*.md; do
  echo "## $f"
  grep -E '^### Sessão' "$f" | head -20 || echo "  (no sessions)"
  echo ""
done
