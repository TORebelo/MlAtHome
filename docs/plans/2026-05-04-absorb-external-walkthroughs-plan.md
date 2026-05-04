# Absorb External Walkthroughs — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Vendor 11 ML/AI repos into MlAtHome's existing folder structure with attribution, rewrite/create 18 sprint markdowns to use the vendored content as `Walkthrough:`, and grow the roadmap to ~38 weeks (8 new Fase 5 sprints + Sprint 11.5).

**Architecture:** Vendor-with-attribution model — each repo's relevant subset is copied into `Fase{N}_X/Sprint{NN}_Topic/external/{repo-slug}/` with `_ATTRIBUTION.md` + `_SNAPSHOT.md` + `LICENSE`. Sprint markdown gets new template fields (`Walkthrough:`, `Video:`, `Source:`) pointing to local vendored paths (or YouTube URLs for videos — only redirection allowed). LearningHub parser unchanged: markdown-permissive renderer absorbs new fields as plain text/links.

**Tech Stack:** bash + git + Python (notebook content, untouched). Validation via bash scripts. No JavaScript/Node changes in MlAtHome. LearningHub side: see LH-1..LH-5 tickets in design doc — separate workstream.

**Design doc reference:** `docs/plans/2026-05-04-absorb-external-walkthroughs-design.md` (committed `c8f9c27` on this branch).

**Branch:** `feature/absorb-external-walkthroughs` (already created).

**Conventions:**
- All paths relative to `/home/tor/Documents/code/MlAtHome` unless absolute.
- All bash blocks assume that as the working directory.
- `git commit` lines use HEREDOC for multi-line messages following the repo's style (see `git log` for examples).
- Each task ends with a commit (frequent commits convention).

---

## Phase 0 — Prerequisites

### Task 0.1: Confirm baseline `docs/study/` is committed

**Files:**
- Check: `docs/study/` (currently untracked — May 2 refactor)

**Step 1: Check what's untracked**

Run: `git status --short docs/study/`
Expected: lists Fase 1-4 sprint files + README.md as untracked OR shows nothing if already committed.

**Step 2: If untracked, ask user before committing**

The May 2 study refactor is the foundation of this design. Without it on the branch, deltas in Phase 1 reference content that doesn't exist. Two options:
- (a) Commit `docs/study/` baseline as one preliminary commit on this branch (`Add 2026-05 study roadmap baseline`), then continue.
- (b) Switch to main, commit baseline there, then `git merge main` into the feature branch.

**STOP and ask user which option** if `docs/study/` is still untracked. Don't proceed until decided.

**Step 3: After resolution, verify branch state**

Run: `git status --short && ls docs/study/fase{1..4}-*/`
Expected: clean tree; phase folders exist with sprint files.

**Step 4: Commit (if option a chosen)**

```bash
git add docs/study/
git commit -m "$(cat <<'EOF'
Add 2026-05 study roadmap baseline (untracked migration)

Migrates the May 2 refactor from untracked working tree to git history
so the absorb-walkthroughs design doc has a concrete baseline to delta
against. No content change — just promoting filesystem state to commits.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 0.2: Create vendor validation script

**Files:**
- Create: `scripts/validate-vendor.sh`

**Step 1: Write the validator**

```bash
mkdir -p scripts
cat > scripts/validate-vendor.sh <<'EOF'
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
EOF
chmod +x scripts/validate-vendor.sh
```

**Step 2: Run on a non-existent dir to verify FAIL**

Run: `./scripts/validate-vendor.sh /tmp/nonexistent`
Expected: `FAIL: /tmp/nonexistent not a directory` and exit 1.

**Step 3: Commit**

```bash
git add scripts/validate-vendor.sh
git commit -m "$(cat <<'EOF'
Add validate-vendor.sh — checks attribution files in external/ folders

Required for every vendored repo: _ATTRIBUTION.md, _SNAPSHOT.md, LICENSE.
Script fails fast if any missing or malformed.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 0.3: Create sprint markdown validator

**Files:**
- Create: `scripts/validate-sprint.sh`

**Step 1: Write the validator**

```bash
cat > scripts/validate-sprint.sh <<'EOF'
#!/usr/bin/env bash
# Validates a sprint markdown has the new template fields where applicable.
# Usage: ./scripts/validate-sprint.sh <sprint.md>
set -euo pipefail

file="${1:?Usage: validate-sprint.sh <sprint.md>}"
[ -f "$file" ] || { echo "FAIL: $file not found"; exit 1; }
errors=0

# Required field
if ! grep -qE '^Build:|^\*\*Build:\*\*|Build: ' "$file"; then
  echo "FAIL: $file no Build: line in any session"
  errors=$((errors+1))
fi

# If file mentions external/ vendor path, must have Walkthrough+Source
if grep -q 'external/' "$file"; then
  grep -q '^Walkthrough:\|^\*\*Walkthrough:\*\*\|Walkthrough: ' "$file" || { echo "WARN: $file references external/ but no Walkthrough: field"; }
  grep -q '^Source:\|^\*\*Source:\*\*\|Source: ' "$file" || { echo "WARN: $file references external/ but no Source: field"; }
fi

[ "$errors" -eq 0 ] && echo "PASS: $file" || exit 1
EOF
chmod +x scripts/validate-sprint.sh
```

**Step 2: Run on existing file to verify it passes**

Run: `./scripts/validate-sprint.sh docs/study/fase1-fundamentos/sprint01-optimization.md`
Expected: `PASS: ...` (existing file has Build: lines).

**Step 3: Commit**

```bash
git add scripts/validate-sprint.sh
git commit -m "$(cat <<'EOF'
Add validate-sprint.sh — checks sprint markdown has Build/Walkthrough/Source

Lightweight linter; warns on missing Walkthrough/Source when external/
is referenced; fails if Build: missing entirely.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 0.4: License batch verification — dispatch 11 parallel research agents

**Files:**
- None (research only)

**Step 1: Dispatch 1 agent per repo**

For each of the 11 repos in the manifest, dispatch a `general-purpose` agent in parallel asking:
- Confirm SPDX license id (from LICENSE file in repo root)
- Note redistribution permissions (especially for `mml-book` and `handsonllm-hands-on-llms`)
- Reply <80 words each

Repos to check:
1. `karpathy/nn-zero-to-hero`
2. `labmlai/annotated_deep_learning_paper_implementations`
3. `GokuMohandas/Made-With-ML`
4. `NirDiamant/RAG_Techniques`
5. `NirDiamant/GenAI_Agents`
6. `HandsOnLLM/Hands-On-Large-Language-Models`
7. `mml-book/mml-book.github.io`
8. `FareedKhan-dev/all-rl-algorithms`
9. `vwxyzjn/cleanrl`
10. `openai/spinningup`
11. `AI4Finance-Foundation/FinRL`
12. `werner-duvaud/muzero-general`
13. `microsoft/ai-agents-for-beginners`

**Step 2: Collect verdicts into a license summary file**

Create `docs/plans/license-verification-2026-05-04.md` with one row per repo:
- repo URL
- SPDX id
- redistribution OK? (yes/no/conditional)
- vendor decision (proceed/fallback-to-link)

**Step 3: If any repo blocks vendor, update manifest in design doc**

For each blocked repo, change Status in design doc manifest from `planned` to `link-only` and add fallback note. Re-commit design doc.

**Step 4: Commit**

```bash
git add docs/plans/license-verification-2026-05-04.md
git commit -m "$(cat <<'EOF'
Verify licenses for the 13 repos to be vendored or referenced

All confirmed permissive (MIT/Apache-2.0/CC-BY-*) unless noted.
Decisions per repo recorded for audit trail.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Phase 1 — `docs/study/README.md` deltas + Fase 5 scaffold

### Task 1.1: Apply Delta 1 — Filosofia auto-contained

**Files:**
- Modify: `docs/study/README.md` (Filosofia section)

**Step 1: Open and edit**

Add the new bullet `- **Auto-contido.** Walkthroughs externos canónicos vivem dentro do repo (Fase{N}_X/SprintY/external/{repo}/) com atribuição completa. Único redireccionamento permitido: vídeos YouTube (Video:).` after the `Relatórios LaTeX` line.

**Step 2: Verify the file still loads cleanly**

Run: `head -25 docs/study/README.md`
Expected: 6 bullets in Filosofia (was 5).

**Step 3: No commit yet — bundle Deltas 1-5 in one commit**

---

### Task 1.2: Apply Delta 2 — Load-bearing list with Karpathy

**Files:**
- Modify: `docs/study/README.md` (load-bearing section, ~lines 13-22)

**Step 1: Replace the 4-item list per Section 4.2 of design doc**

Replace items 2 and 3 (MLP+backprop, Attention) with Karpathy-vendored versions. Add the explanatory blockquote after item 4.

**Step 2: Verify**

Run: `grep -A 6 'load-bearing' docs/study/README.md`
Expected: 4 numbered items + Karpathy blockquote.

---

### Task 1.3: Apply Delta 3 — Tabela de cobertura with Fase 5

**Files:**
- Modify: `docs/study/README.md` (Cobertura por Fase table, ~lines 36-43)

**Step 1: Update Fase 3 row (6→8 weeks), add Fase 5 row**

Per Section 4.3 of design doc. Update Total line from `~28 semanas` to `~38 semanas`.

**Step 2: Verify**

Run: `grep -A 8 'Cobertura por Fase' docs/study/README.md`
Expected: 5 rows (Fase 1-5) + Total.

---

### Task 1.4: Apply Delta 4 — Bibliografia (mml-book + Hands-On LLMs)

**Files:**
- Modify: `docs/study/README.md` (Bibliografia section, ~line 100)

**Step 1: Add mml-book under Math; add new "LLM/Agents (Fase 5)" subsection**

Per Section 4.4 of design doc.

**Step 2: Verify**

Run: `grep -A 4 'Math (referência' docs/study/README.md && grep -A 2 'LLM/Agents' docs/study/README.md`
Expected: mml-book listed; Hands-On LLMs subsection visible.

---

### Task 1.5: Apply Delta 5 — Add "External walkthroughs absorbed" + Reference shelf sections

**Files:**
- Modify: `docs/study/README.md` (append after Bibliografia)

**Step 1: Append both sections**

Per Section 4.5 of design doc. Two new H2 sections at end of file.

**Step 2: Verify**

Run: `grep -c '^## ' docs/study/README.md`
Expected: count increased by 2 vs before.

---

### Task 1.6: Create Fase 5 directory + intro README

**Files:**
- Create: `docs/study/fase5-llm-agents/README.md`

**Step 1: Create directory and README**

```bash
mkdir -p docs/study/fase5-llm-agents
cat > docs/study/fase5-llm-agents/README.md <<'EOF'
# Fase 5 — LLM / Agents

> 8 sprints, 8 semanas. From-scratch zero — fase totalmente library-first.
> Spine: Hands-On LLMs (caps 1-3, 8, 10) → NirDiamant RAG_Techniques → NirDiamant GenAI_Agents.

**Pasta de output:** `Fase5_LLMAgents/Sprint{NN}_Topic/`.

## Sprints

- Sprint 16 — LLM Internals (tokenization, embeddings, fine-tuning intro)
- Sprint 17 — RAG Fundamentals (foundational + query enhancement)
- Sprint 18 — RAG Advanced (reranking, fusion, self-RAG, corrective RAG, GraphRAG)
- Sprint 19 — Agents Fundamentals (LangGraph + 3 beginner patterns)
- Sprint 20 — Multi-agent (Scientific Paper Agent, ATLAS)
- Sprint 21 — Agentic RAG produção (Controllable RAG Agent + evaluation)
- Sprint 22 — Fine-tuning (LoRA, QLoRA, DPO via Hands-On LLMs caps 11-12)
- Sprint 23 — MCP / A2A (MS Lessons 11+14)

Cada sprint vive em ficheiro próprio (`sprint16-...md`, etc.) e usa a forma de template definida em `docs/plans/2026-05-04-absorb-external-walkthroughs-design.md`.
EOF
```

**Step 2: Verify**

Run: `ls docs/study/fase5-llm-agents/ && head -5 docs/study/fase5-llm-agents/README.md`
Expected: README.md present; title line correct.

---

### Task 1.7: Verify LearningHub still parses cleanly + commit Phase 1

**Files:**
- None changed; verification step only.

**Step 1: Run LH typecheck**

```bash
cd /home/tor/Documents/code/LearningHub
npm run typecheck
cd /home/tor/Documents/code/MlAtHome
```

Expected: no type errors. (Parser shouldn't care about MlAtHome content changes; this is a sanity check.)

**Step 2: Run LH tests if they exist**

```bash
cd /home/tor/Documents/code/LearningHub
npm test -- --run
cd /home/tor/Documents/code/MlAtHome
```

Expected: all pass.

**Step 3: Commit Phase 1 deltas**

```bash
git add docs/study/README.md docs/study/fase5-llm-agents/
git commit -m "$(cat <<'EOF'
Apply 5 deltas to study/README + scaffold Fase 5

- Filosofia: add auto-contained principle
- Load-bearing list: Karpathy substitutes NumPy from-scratch for MLP+backprop and attention
- Cobertura table: Fase 3 grows to 8 weeks (Sprint 11.5), Fase 5 added (8 weeks)
- Bibliografia: add mml-book + Hands-On LLMs
- New sections: External walkthroughs absorbed + Reference shelf
- Fase 5: create empty folder with intro README listing 8 sprints

Total: ~28 → ~38 semanas. LearningHub parser unaffected (markdown-permissive).

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Phase 2 — Splits Fases 2-4 from single READMEs to per-sprint files

Mechanical — content stays the same, just split. Each phase has 4 sprints.

### Task 2.1: Split `fase2-deep-learning/README.md` into 4 sprint files

**Files:**
- Read: `docs/study/fase2-deep-learning/README.md`
- Create: `docs/study/fase2-deep-learning/sprint05-mlp-backprop.md`
- Create: `docs/study/fase2-deep-learning/sprint06-cnn-vision.md`
- Create: `docs/study/fase2-deep-learning/sprint07-attention-transformers.md`
- Create: `docs/study/fase2-deep-learning/sprint08-vae-generative.md`
- Modify: `docs/study/fase2-deep-learning/README.md` (shrink to intro only)

**Step 1: Read source**

Run: `cat docs/study/fase2-deep-learning/README.md`
Note the 4 `## Sprint N — ...` blocks.

**Step 2: Extract each block into its own file**

For each sprint:
- Copy the `## Sprint N — Title (semanas X-Y)` heading line + body until next `## Sprint` or `## Bibliografia`.
- In the new file, change `## Sprint N — Title (semanas X-Y)` to `# Sprint N — Title (semanas X-Y)` (top-level H1).
- Keep all `### Semana 1 / 2`, `### `, paragraphs as-is.

**Step 3: Reduce README.md to intro + bibliography only**

The new README should contain:
- The `# Fase 2 — Deep Learning` heading and intro paragraph
- The `**Pasta de output:**` line
- A Sprints list pointing to per-sprint files
- The `## Bibliografia da Fase 2` section (kept at phase level)

**Step 4: Validate each sprint file**

```bash
for f in docs/study/fase2-deep-learning/sprint*.md; do
  ./scripts/validate-sprint.sh "$f" || echo "  ↳ check $f"
done
```
Expected: PASS or warn-only (no Walkthrough yet — sprints will gain those in Phase 3+).

**Step 5: LH typecheck again**

```bash
cd /home/tor/Documents/code/LearningHub && npm run typecheck && cd -
```

**Step 6: Commit**

```bash
git add docs/study/fase2-deep-learning/
git commit -m "$(cat <<'EOF'
Split fase2 README into per-sprint files

No content change — mechanical split of the single README.md into
sprint05-mlp-backprop.md, sprint06-cnn-vision.md,
sprint07-attention-transformers.md, sprint08-vae-generative.md.

README.md kept as phase-level intro + bibliography. Mirrors fase1
convention; sets up Phase 3 (Sprint 5 Karpathy rewrite).

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 2.2: Split `fase3-rl-aplicado/README.md` into per-sprint files

**Files:**
- Same pattern as Task 2.1.
- Create: `sprint09-bandits-tabular.md`, `sprint10-policy-gradient.md`, `sprint11-rl-finance.md`.
- (Sprint 11.5 created later in Phase 5.)

Replicate steps 1-6 from Task 2.1 for fase3.

---

### Task 2.3: Split `fase4-especializadas-mlops/README.md` into per-sprint files

**Files:**
- Create: `sprint12-gnn-graphs.md`, `sprint13-evaluation.md`, `sprint14-mlops-deployment.md`, `sprint15-applied-portfolio.md`.

Replicate steps 1-6 from Task 2.1 for fase4.

---

## Phase 3 — Sprint 5 PILOT (Karpathy nn-zero-to-hero)

This is the form validator. Other sprints follow the same pattern.

### Task 3.1: Clone karpathy/nn-zero-to-hero shallow

**Files:**
- Create: `/tmp/karpathy-clone/` (temporary)

**Step 1: Clone**

```bash
mkdir -p /tmp/karpathy-clone
cd /tmp/karpathy-clone
git clone --depth 1 https://github.com/karpathy/nn-zero-to-hero.git
cd nn-zero-to-hero
git rev-parse HEAD > /tmp/karpathy-commit.txt
cat /tmp/karpathy-commit.txt
cd /home/tor/Documents/code/MlAtHome
```

Expected: SHA written and printed.

---

### Task 3.2: Create vendor folder structure + copy files

**Files:**
- Create: `Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/`
- Copy: `lectures/micrograd/`, `lectures/makemore/`

**Step 1: Make folder + copy**

```bash
mkdir -p Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero
cp -r /tmp/karpathy-clone/nn-zero-to-hero/lectures/micrograd \
      Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/
cp -r /tmp/karpathy-clone/nn-zero-to-hero/lectures/makemore \
      Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/
cp /tmp/karpathy-clone/nn-zero-to-hero/LICENSE \
   Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/
```

**Step 2: Verify files copied**

Run: `ls Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/`
Expected: `LICENSE`, `lectures/`.

---

### Task 3.3: Write `_ATTRIBUTION.md` and `_SNAPSHOT.md`

**Files:**
- Create: `Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/_ATTRIBUTION.md`
- Create: `Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/_SNAPSHOT.md`

**Step 1: Write `_ATTRIBUTION.md`**

```bash
COMMIT_SHA=$(cat /tmp/karpathy-commit.txt)
TODAY=$(date +%Y-%m-%d)
cat > Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/_ATTRIBUTION.md <<EOF
# Karpathy — Neural Networks: Zero to Hero

**Source:** https://github.com/karpathy/nn-zero-to-hero
**License:** MIT
**Snapshot date:** $TODAY
**Commit:** $COMMIT_SHA
**Vendored subset:** lectures/micrograd/, lectures/makemore/ (Lectures 1–5)

Original work © Andrej Karpathy. See \`LICENSE\` in this folder.
EOF
```

**Step 2: Write `_SNAPSHOT.md`**

```bash
cat > Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/_SNAPSHOT.md <<EOF
# Snapshot

- **Source:** https://github.com/karpathy/nn-zero-to-hero
- **Commit:** $COMMIT_SHA
- **Date:** $TODAY
- **Vendor command (reference):** \`git clone --depth 1 https://github.com/karpathy/nn-zero-to-hero && cp -r lectures/{micrograd,makemore} <dest>\`

Re-pull policy: manual, when upstream has material updates worth absorbing.
EOF
```

**Step 3: Run validator**

Run: `./scripts/validate-vendor.sh Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero`
Expected: `PASS`.

---

### Task 3.4: Rewrite `sprint05-mlp-backprop.md` to use Karpathy walkthrough

**Files:**
- Modify: `docs/study/fase2-deep-learning/sprint05-mlp-backprop.md` (full rewrite)

**Step 1: Write new content using template**

Structure (full content; not pseudocode — write all 5 sessions):

```markdown
# Sprint 5 — MLP + Backprop (semanas 9-10)

**Pergunta nuclear:** *"O que é exactamente backpropagation? Vou perceber-o uma vez para nunca mais ter dúvidas — pela mão de quem o explica melhor."*

> Sprint walkthrough-driven. Substitui re-implementação NumPy planeada. Karpathy faz exatamente este from-scratch melhor que qualquer alternativa; repetir = redundante.

### Sessão 1 — Micrograd: scalar autograd from scratch (Lecture 1)

Build:        Construir motor autograd escalar (`Value` class com `+`, `*`, `tanh`, backward) seguindo o vídeo.
Walkthrough:  ../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/micrograd/
Video:        https://www.youtube.com/watch?v=VMj-3S1tku0
Reference:    Goodfellow cap 6.5 (chain rule)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/01_micrograd.ipynb + nota `notas/sprint05-micrograd.md`

### Sessão 2 — Makemore Part 1: Bigrams char-level (Lecture 2)

Build:        Modelo bigrama em PyTorch — contagens + NN equivalente sobre `names.txt`.
Walkthrough:  ../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/makemore/makemore_part1_bigrams.ipynb
Video:        https://www.youtube.com/watch?v=PaCmpygFfXo
Reference:    —
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/02_bigrams.ipynb

### Sessão 3 — Makemore Part 2: MLP char-level (Lecture 3)

Build:        MLP char-level (Bengio 2003); train/dev/test, hyperparam sweeps.
Walkthrough:  ../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/makemore/makemore_part2_mlp.ipynb
Video:        https://www.youtube.com/watch?v=TCH_1BHY58I
Reference:    Bengio 2003 (paper); Goodfellow cap 6
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/03_mlp.ipynb

### Sessão 4 — Makemore Part 3: Activations, Gradients, BatchNorm (Lecture 4)

Build:        MLP profundo + diagnósticos de ativações/gradientes + BatchNorm.
Walkthrough:  ../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/makemore/makemore_part3_bn.ipynb
Video:        https://www.youtube.com/watch?v=P6sfmUTpUmc
Reference:    Ioffe & Szegedy 2015 (BatchNorm paper)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/04_diagnostics.ipynb

### Sessão 5 — Makemore Part 4: Manual Backprop (Lecture 5)

Build:        Backprop manual sem autograd, atravessando cross-entropy, linear, tanh, batchnorm, embeddings.
Walkthrough:  ../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/makemore/makemore_part4_backprop.ipynb
Video:        https://www.youtube.com/watch?v=q8SA3rM6ckI
Reference:    Goodfellow cap 6.5 (chain rule revisited)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/05_manual_backprop.ipynb + `notas/sprint05-resumo.md` (resposta de 30s ao "o que é backprop").

**Entrega:** `notas/sprint05-resumo.md` — pergunta-teste: "Backprop em 30 segundos: chain rule + cache das activations + topological order do DAG."

> Lectures 4 e 6 (WaveNet) opcionais — não são load-bearing para o caminho LLM. Saltar se foco é Sprint 7 (GPT).
```

**Step 2: Validate the sprint file**

Run: `./scripts/validate-sprint.sh docs/study/fase2-deep-learning/sprint05-mlp-backprop.md`
Expected: `PASS`.

**Step 3: Confirm relative paths resolve**

Run:
```bash
cd docs/study/fase2-deep-learning
for p in $(grep -oE '\.\./\.\./Fase2.+karpathy[^\s]+' sprint05-mlp-backprop.md | tr -d ' '); do
  ls "$p" >/dev/null && echo "OK: $p" || echo "BROKEN: $p"
done
cd /home/tor/Documents/code/MlAtHome
```
Expected: all `OK:` lines.

---

### Task 3.5: Update manifest in design doc + commit Phase 3

**Files:**
- Modify: `docs/plans/2026-05-04-absorb-external-walkthroughs-design.md` (Sprint 5 row: status `planned` → `walkthrough-written`)

**Step 1: Edit manifest row**

Change Sprint 5's `Status` column from `planned` to `walkthrough-written`.

**Step 2: Commit Phase 3**

```bash
git add Fase2_DeepLearning/Sprint05_MLP/ docs/study/fase2-deep-learning/sprint05-mlp-backprop.md docs/plans/2026-05-04-absorb-external-walkthroughs-design.md
git commit -m "$(cat <<'EOF'
Vendor karpathy/nn-zero-to-hero L1-L5 + rewrite Sprint 5 walkthrough

PILOT for the absorb-walkthroughs form. Vendors lectures/micrograd
and lectures/makemore (Lectures 1-5) under Sprint05_MLP/external/.
Includes _ATTRIBUTION.md, _SNAPSHOT.md, LICENSE.

Sprint 5 markdown rewritten with new template (Walkthrough/Video/
Source fields). Replaces NumPy from-scratch plan — Karpathy IS the
canonical from-scratch experience.

Manifest updated: Sprint 5 → walkthrough-written.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

**Step 3: Cleanup temp**

```bash
rm -rf /tmp/karpathy-clone
```

---

## Phase 4 — LearningHub smoke test (LH-1 ticket)

### Task 4.1: Open Sprint 5 in LearningHub dev server

**Files:**
- None modified.

**Step 1: Run LH dev server**

```bash
cd /home/tor/Documents/code/LearningHub
npm run dev
```

Expected: server on http://localhost:3010.

**Step 2: Visual check Sprint 5 renders**

Open browser to http://localhost:3010, navigate to MlAtHome → Fase 2 → Sprint 5. Confirm:
- All 5 sessions visible
- `Walkthrough:`, `Video:`, `Source:` fields appear as plain text/links
- No parser errors in browser console
- No errors in terminal

**Step 3: Stop server**

Ctrl-C the dev server.

**Step 4: Decide form-revision branch**

If form is broken:
- STOP and revise design doc form section, then re-apply to Sprint 5.
- Document issue in commit.

If form is fine:
- Proceed to Phase 5+. The form is the contract; replicate.

---

## Phase 5 — Vendor remaining repos (parallelizable via subagents)

Each sub-task is a self-contained "vendor one repo" job. Pattern from Phase 3 applies. Can be dispatched in parallel via the Agent tool when executing.

### Task 5.1: Vendor `karpathy/nn-zero-to-hero` for Sprint 7 (GPT + tokenizer)

**Files:**
- Create: `Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nn-zero-to-hero/`

**Step 1-3: Same clone + copy + attribution pattern as Phase 3**

Subset: `lectures/gpt/`, `lectures/tokenizer/`. Reuse the SHA from Task 3.1 (or re-clone).

**Step 4: Run validator**

Run: `./scripts/validate-vendor.sh Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nn-zero-to-hero`
Expected: PASS.

**Step 5: Commit**

```bash
git add Fase2_DeepLearning/Sprint07_Transformers/
git commit -m "Vendor karpathy/nn-zero-to-hero L7+L8 (GPT + tokenizer) for Sprint 7"
```

---

### Task 5.2: Vendor `labmlai/annotated_deep_learning_paper_implementations`

**Files:**
- Create: `Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl/`
- Create: `Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/` (reuse symlink or duplicate)

**Step 1: Clone**

```bash
mkdir -p /tmp/labmlai && cd /tmp/labmlai
git clone --depth 1 https://github.com/labmlai/annotated_deep_learning_paper_implementations.git
```

**Step 2: Copy diffusion subset to Sprint 8**

```bash
cd /home/tor/Documents/code/MlAtHome
mkdir -p Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl
cp -r /tmp/labmlai/annotated_deep_learning_paper_implementations/labml_nn/diffusion \
      Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl/
cp /tmp/labmlai/annotated_deep_learning_paper_implementations/LICENSE \
   Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl/
```

**Step 3: Copy PPO subset to Sprint 10**

```bash
mkdir -p Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl
cp -r /tmp/labmlai/annotated_deep_learning_paper_implementations/labml_nn/rl \
      Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/
cp /tmp/labmlai/annotated_deep_learning_paper_implementations/LICENSE \
   Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/
```

**Step 4: Write `_ATTRIBUTION.md` + `_SNAPSHOT.md` for both**

Two attribution files (one per Sprint folder); each notes its specific subset.

**Step 5: Validate both**

```bash
./scripts/validate-vendor.sh Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl
./scripts/validate-vendor.sh Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl
```

**Step 6: Commit**

```bash
git add Fase2_DeepLearning/Sprint08_Generative/external/ Fase3_RL/Sprint10_PolicyGradient/external/
git commit -m "Vendor labmlai/annotated-dl: diffusion (Sprint 8) + RL/PPO (Sprint 10)"
rm -rf /tmp/labmlai
```

---

### Task 5.3: ~~Vendor `mml-book`~~ — **SKIPPED (link-only)**

Per `license-verification-2026-05-04.md`: mml-book has no LICENSE in upstream repo, so vendoring is blocked. Sprints 3+4 fall back to `Reference:` link to the GitHub URLs:

- Linear Regression: `https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_linear_regression.ipynb` (and `.solution.ipynb`)
- PCA: `https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_pca.ipynb` (and `.solution.ipynb`)

No vendor work; sprint markdowns in Tasks 6.3 + 6.4 use `Reference:` for these links and create user-owned `scaffolded.ipynb` for `Build:`.

---

### Task 5.4: Vendor `FareedKhan-dev/all-rl-algorithms` for Sprints 9+10

Subset: REINFORCE, SARSA, Q-Learning notebooks → Sprint 9. A2C, A3C, TRPO, PPO, DDPG, SAC notebooks → Sprint 10.

Same pattern, two vendor folders.

---

### Task 5.5: Vendor `vwxyzjn/cleanrl` for Sprint 10

Subset: `cleanrl/{ppo,sac,ddpg,td3}.py` (single-file algos).

---

### Task 5.6: Vendor `openai/spinningup` for Sprint 9

Subset: `spinup/algos/pytorch/vpg/` + `docs/algorithms/vpg.rst` (or built docs).

---

### Task 5.7: Vendor `AI4Finance-Foundation/FinRL` for Sprint 11

Subset: `tutorials/{1-Introduction,2-Advance}/` + 1 stock-trading example notebook.

---

### Task 5.8: Vendor `werner-duvaud/muzero-general` for Sprint 11.5

Subset: `muzero.py` + `games/cartpole.py` (1 game config) + `models.py` + `self_play.py`.

---

### Task 5.9: Vendor `GokuMohandas/Made-With-ML` for Sprints 13/14/15

Single canonical snapshot at `Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/`. Sprints 13 + 15 reference via relative path; no separate vendor folder.

Subset: full repo (it's the curriculum spine).

---

### Task 5.10: Vendor `HandsOnLLM/Hands-On-Large-Language-Models` for Sprints 16+22

Single snapshot at `Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/`. Sprint 22 reuses.

Subset: chapters/ folders, all 12 (small). Verify license is permissive at vendor time (Task 0.4 result).

---

### Task 5.11: Vendor `NirDiamant/RAG_Techniques` for Sprints 17/18/21

Snapshot at `Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/`. Sprints 18 + 21 reuse.

Subset: `all_rag_techniques/` (curated subset of 12 notebooks per design).

---

### Task 5.12: Vendor `NirDiamant/GenAI_Agents` for Sprints 19/20/21

Snapshot at `Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/`. Sprints 20 + 21 reuse.

Subset: 3 beginner notebooks + LangGraph framework + Scientific Paper Agent + ATLAS + 1 business agent.

---

### Task 5.13: Vendor `microsoft/ai-agents-for-beginners` for Sprint 23

Subset: Lessons 11 (MCP/A2A/NLWeb) and 14 (MAF) only — not the whole curriculum.

---

### Task 5.14: Run all validators + commit recap

**Step 1: Validate every vendor folder**

```bash
find . -path '*/external/*' -name '_ATTRIBUTION.md' -execdir ../../scripts/validate-vendor.sh '{}' \;
```

(Or simpler: a single loop.)

**Step 2: If anything fails, fix and re-validate.**

---

## Phase 6 — Write remaining sprint markdowns (parallelizable)

Each sprint markdown task = ~15-20 min. Pattern from Sprint 5 (Phase 3 Task 3.4) applies. Can be dispatched in parallel via subagents.

For each of these sprints, replicate the Sprint 5 markdown structure (`### Sessão N` blocks with all template fields filled from the vendored content):

- **Task 6.1:** Sprint 7 — Attention/Transformers (Karpathy GPT + tokenizer)
- **Task 6.2:** Sprint 8 — VAE/Generative (existing content + add labmlai diffusion sessions)
- **Task 6.3:** Sprint 3 — Linear models. mml-book is link-only (no vendor); use `Reference:` to GitHub URLs. Create `Fase1_Foundation/Sprint03_LinearModels/notebooks/scaffolded.ipynb` (user-owned, follows mml-book exercises but written fresh).
- **Task 6.4:** Sprint 4 — PCA. Same pattern as 6.3.
- **Task 6.5:** Sprint 9 — Bandits/Tabular (FareedKhan + Spinning Up)
- **Task 6.6:** Sprint 10 — Policy Gradient/PPO (CleanRL + FareedKhan + labmlai)
- **Task 6.7:** Sprint 11 — RL Finance (FinRL)
- **Task 6.8:** Sprint 11.5 — AlphaZero/MuZero (muzero-general) — NEW FILE
- **Task 6.9:** Sprint 13 — Evaluation (Made with ML testing)
- **Task 6.10:** Sprint 14 — MLOps (Made with ML domina)
- **Task 6.11:** Sprint 15 — Applied portfolio (Made with ML scaffold)
- **Task 6.12:** Sprint 16 — LLM Internals (Hands-On LLMs caps 1-3, 8, 10) — NEW FILE
- **Task 6.13:** Sprint 17 — RAG Fundamentals — NEW FILE
- **Task 6.14:** Sprint 18 — RAG Advanced — NEW FILE
- **Task 6.15:** Sprint 19 — Agents Fundamentals — NEW FILE
- **Task 6.16:** Sprint 20 — Multi-agent — NEW FILE
- **Task 6.17:** Sprint 21 — Agentic RAG produção — NEW FILE
- **Task 6.18:** Sprint 22 — Fine-tuning — NEW FILE
- **Task 6.19:** Sprint 23 — MCP/A2A — NEW FILE

For each task:

**Step 1:** Read the vendored content listing (`ls Fase{N}_X/Sprint0Y/external/{repo}/`) to know what files exist.

**Step 2:** Map vendored files to 4-6 `### Sessão N — ...` blocks following Sprint 5 template.

**Step 3:** Fill all template fields for each session (Build/Walkthrough/Video/Reference/Source/Output).

**Step 4:** Run `./scripts/validate-sprint.sh <file>` — expect PASS.

**Step 5:** Verify relative paths resolve (`ls` each Walkthrough path).

**Step 6:** Commit.

---

## Phase 7 — Final review + manifest update

### Task 7.1: Update manifest in design doc — all sprints to walkthrough-written

**Files:**
- Modify: `docs/plans/2026-05-04-absorb-external-walkthroughs-design.md`

**Step 1:** Bulk update Status column from `planned` → `walkthrough-written` for every sprint that has been written.

**Step 2:** Commit.

```bash
git commit -m "Update manifest: all sprints walkthrough-written"
```

---

### Task 7.2: Re-read all changed files (CLAUDE.md Section 3 — post-implementation review)

**Files:**
- Read: every file in this branch's diff vs main.

**Step 1: Generate diff list**

```bash
git diff --name-only main
```

**Step 2: Read each file and verify:**

1. No broken logic (no broken paths)
2. No architecture gaps (every sprint that mentions `external/` has `Walkthrough:` + `Source:`)
3. No unused files (no orphaned `external/` folders without a sprint pointing to them)
4. Format consistency (template fields aligned)
5. Markdown headings hierarchy correct

**Step 3: Run all validators one more time**

```bash
find . -path '*/external/*' -name '_ATTRIBUTION.md' -exec dirname {} \; | xargs -I {} ./scripts/validate-vendor.sh {}
find docs/study -name 'sprint*.md' -exec ./scripts/validate-sprint.sh {} \;
```

Expected: every PASS.

**Step 4: Run LH typecheck/test**

```bash
cd /home/tor/Documents/code/LearningHub && npm run typecheck && npm test -- --run && cd -
```

---

### Task 7.3: Decide merge strategy with user

Don't merge automatically. Show user:

```bash
git log --oneline main..feature/absorb-external-walkthroughs
git diff --stat main
```

Ask: merge into main, keep on branch for staged review, or open PR?

---

## Skills referenced

- `superpowers:executing-plans` — execute this plan task-by-task.
- `superpowers:subagent-driven-development` — for parallel subagent dispatch in Phases 5+6.
- `verification-before-completion` — required before claiming any task is "done".

## Out of scope (for clarity)

- LearningHub iframe ticket (LH-2) — separate workstream after Phase 6.
- LearningHub v2 multi-source vision — separate brainstorm at `~/Documents/code/LearningHub`.
- QuantHome equivalent absorption — same model when user opens it.
- JupyterLite integration (LH-4) — orthogonal LH feature.

---

## Rough time estimate

- Phase 0 (prerequisites + license verification): ~1h (mostly waiting for parallel agents)
- Phase 1 (README deltas + Fase 5 scaffold): ~30 min
- Phase 2 (splits): ~1h
- Phase 3 (Sprint 5 PILOT): ~1.5h
- Phase 4 (smoke test): 15 min
- Phase 5 (vendor 13 repos): ~3-4h serial, ~1.5h parallel via subagents
- Phase 6 (write 19 sprint markdowns): ~5-6h serial, ~2h parallel
- Phase 7 (final review): ~1h

**Total:** ~13h serial, **~7h parallelized** with subagent dispatch.
