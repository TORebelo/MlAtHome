#!/usr/bin/env bash
# Validates one vendored repo folder has required attribution files.
# Usage: ./scripts/validate-vendor.sh <vendor-dir>
set -euo pipefail

dir="${1:?Usage: validate-vendor.sh <vendor-dir>}"
[ -d "$dir" ] || { echo "FAIL: $dir not a directory"; exit 1; }
[ -f "$dir/_ATTRIBUTION.md" ] || { echo "FAIL: $dir missing _ATTRIBUTION.md"; exit 1; }
[ -f "$dir/_SNAPSHOT.md" ] || { echo "FAIL: $dir missing _SNAPSHOT.md"; exit 1; }
[ -f "$dir/LICENSE" ] || { echo "FAIL: $dir missing LICENSE"; exit 1; }
grep -q '^\*\*Source:\*\*' "$dir/_ATTRIBUTION.md" || { echo "FAIL: $dir/_ATTRIBUTION.md missing Source"; exit 1; }
grep -q '^\*\*License:\*\*' "$dir/_ATTRIBUTION.md" || { echo "FAIL: $dir/_ATTRIBUTION.md missing License"; exit 1; }
grep -q '^\*\*Snapshot date:\*\*' "$dir/_ATTRIBUTION.md" || { echo "FAIL: $dir/_ATTRIBUTION.md missing Snapshot date"; exit 1; }
grep -q '^\*\*Commit:\*\*' "$dir/_ATTRIBUTION.md" || { echo "FAIL: $dir/_ATTRIBUTION.md missing Commit"; exit 1; }
grep -q '^- \*\*Commit:\*\*' "$dir/_SNAPSHOT.md" || { echo "FAIL: $dir/_SNAPSHOT.md missing Commit"; exit 1; }
echo "PASS: $dir"
