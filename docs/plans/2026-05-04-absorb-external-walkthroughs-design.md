# Design — Absorb External Walkthroughs into MlAtHome

**Date:** 2026-05-04
**Branch:** `feature/absorb-external-walkthroughs`
**Status:** Approved (5 sections, brainstorming flow)
**Approach:** A — maximalist absorption with vendor-with-attribution model; Sprints 22-23 included.

> Companion plan (writing-plans output) lives next to this doc when implementation kicks off.

---

## Context

User has a 28-week ML roadmap (`docs/study/`) with 4 fases (Fundamentos, DL, RL, MLOps). After surveying 16 ML/AI repos shared from a LinkedIn list, ~11 of them rise to the level of being absorbed into the roadmap rather than just linked. User wants the content **inside** the repo (no external redirection during study sessions). Vendored content lives next to the sprint that uses it; sprint markdown treats vendored files as local.

**Two principles up front:**

1. **Forma estável vs Manifesto volátil.** This doc separates the absorption *form* (template, vendor pattern, attribution, naming) from the per-sprint *manifest* (what gets vendored where). The form is the contract; the manifest evolves during execution. Form revision is small surface area (~15-30 min sed across markdowns) — manifest revision is per-sprint discovery work.

2. **Single redirection allowed: YouTube videos.** Code, notebooks, PDFs all vendor in. Videos can't fit in a repo (size + license + practicality), so `Video:` lines link to YouTube — temporarily as plain links, eventually as iframe embeds inside LearningHub (LH-2 ticket).

---

## 1. Forma estável

### 1.1 Template de sessão (novo)

```
### Sessão N — [pergunta concreta]

Build:        [o projeto/análise — output esperado]
Dataset:      [se aplicável]
Walkthrough:  [path local — vendored notebook ou markdown, relativo ao sprint]
Video:        [URL YouTube — opcional, futuro iframe LH]
Reference:    [livros/papers — abrir on-demand]
Deeper (opt): [paper Z, repo X — para fundo]
Source:       [URL repo original do Walkthrough — atribuição visível]
Output:       [Sprint0X/notebooks/yy.ipynb + 1 plot + 1 nota]
```

**Differences vs prior template:**
- `Walkthrough:` is new — points to a vendored file (e.g. `Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/lectures/micrograd/micrograd.ipynb`).
- `Video:` is new — only YouTube URLs; rendered as plain link until LH-2 lands.
- `Source:` is new — repo URL for attribution. Visible at session level so the user always knows the upstream.
- `Reference:` and `Deeper:` keep their existing on-demand semantics.

### 1.2 Vendor pattern

```
{Fase{N}_Domain}/Sprint0Y_Topic/external/{repo-slug}/
├── _ATTRIBUTION.md      ← obrigatório
├── _SNAPSHOT.md         ← commit hash + data
├── LICENSE              ← copiada do repo original
└── {ficheiros vendored mantendo estrutura original}
```

**`_ATTRIBUTION.md` template:**
```markdown
# {Repo Name}

**Source:** https://github.com/{org}/{repo}
**License:** {SPDX id, e.g. MIT}
**Snapshot date:** YYYY-MM-DD
**Commit:** {short SHA}
**Vendored subset:** {paths/scope description}

Original work © {authors}. See `LICENSE` in this folder.
```

**Non-commercial flag (NirDiamant repos only):**

NirDiamant/RAG_Techniques and NirDiamant/GenAI_Agents use a Custom License Agreement permitting non-commercial use only with attribution. For these vendor folders, append the following to `_ATTRIBUTION.md`:

```markdown
**License flag:** Non-commercial only. Commercial use requires written permission from Nir Diamant (nirdiamant21@gmail.com).
```

If MlAtHome ever becomes commercial, NirDiamant snapshots must be removed.

**`_SNAPSHOT.md` template:**
```markdown
# Snapshot

- **Source:** https://github.com/{org}/{repo}
- **Commit:** {full SHA}
- **Date:** YYYY-MM-DD
- **Vendor command (reference):** `git clone --depth 1 ... && cp ...`

Re-pull policy: manual, when upstream has material updates worth absorbing.
```

### 1.3 Naming

**Repo slugs (kebab-case, prefixed by org/author when ambiguous):**

- `karpathy-nn-zero-to-hero`
- `labmlai-annotated-dl`
- `made-with-ml`
- `nirdiamant-rag-techniques`
- `nirdiamant-genai-agents`
- `handsonllm-hands-on-llms`
- `mml-book`
- `fareedkhan-all-rl-algorithms`
- `cleanrl`
- `openai-spinningup`
- `ai4finance-finrl`
- `werner-duvaud-muzero-general`
- `microsoft-ai-agents-for-beginners`

**Sprint filenames (`docs/study/`):**
- `sprint{NN}-{kebab-topic}.md` (e.g., `sprint05-mlp-backprop.md`).
- Decimal sprint numbers permitted (e.g., `sprint11.5-alphazero-muzero.md`); LH parser already supports decimals (`PHASE_DIR_RE` in `studyLoader.ts:12`).

**Code sprint folders (top-level by Fase):**
- `Fase{N}_Domain/Sprint{NN}_Topic/` (e.g., `Fase2_DeepLearning/Sprint05_MLP/`).

### 1.4 Status lifecycle (manifest column)

```
planned → vendored → walkthrough-written → executed
```

- `planned`: row exists in manifest, nothing on disk.
- `vendored`: `external/{repo-slug}/` populated with files + `_ATTRIBUTION.md` + `LICENSE` + `_SNAPSHOT.md`.
- `walkthrough-written`: sprint markdown rewritten to use the vendored content; sessions linked.
- `executed`: user has actually worked through the sprint (out of scope for this design — it's a study log marker).

---

## 2. Manifesto por sprint (volátil)

Initial state: all `planned`. Updated during execution.

| # | Sprint | Repos vendored | Vendor scope | Video? | Status |
|---|---|---|---|---|---|
| 3 | Linear models (Fase 1) | — (link-only) | mml-book has no LICENSE; `Reference:` link to GitHub. User-owned `scaffolded.ipynb` for `Build:` | — | link-only |
| 4 | PCA (Fase 1) | — (link-only) | same as Sprint 3 | — | link-only |
| 5 | MLP+Backprop (Fase 2) | karpathy-nn-zero-to-hero | `lectures/micrograd/`, `lectures/makemore/{1..5}/` | YT L1–L5 | walkthrough-written |
| 7 | Attention/Transformers (Fase 2) | karpathy-nn-zero-to-hero | `lectures/gpt/`, `lectures/tokenizer/` | YT L7+L8 | planned |
| 8 | VAE/Generative (Fase 2) | labmlai-annotated-dl | `labml_nn/diffusion/{ddpm,ddim,stable_diffusion}/` | — | planned |
| 9 | Bandits/Tabular (Fase 3) | fareedkhan-all-rl-algorithms, openai-spinningup | FareedKhan: REINFORCE+SARSA+Q-Learning notebooks. Spinning Up: VPG docs+code. | — | planned |
| 10 | PG/PPO (Fase 3) | cleanrl, fareedkhan-all-rl-algorithms, labmlai-annotated-dl | CleanRL: ppo.py, sac.py, ddpg.py, td3.py. FareedKhan: A2C/A3C/TRPO/PPO/DDPG/SAC notebooks. labmlai: PPO ref. | — | planned |
| 11 | RL applied (finance) (Fase 3) | ai4finance-finrl | `tutorials/`, 1 stock-trading example | — | planned |
| 11.5 | AlphaZero/MuZero (Fase 3, novo) | werner-duvaud-muzero-general | `games/` (1 game config), `muzero.py` core | — | planned |
| 13 | Evaluation (Fase 4) | made-with-ml | `madewithml/{tests,evaluation}.py`, testing notebooks | — | planned |
| 14 | MLOps (Fase 4) | made-with-ml | `madewithml/` complete pipeline (data, train, tune, serve, predict, monitor) | — | planned |
| 15 | Applied portfolio (Fase 4) | made-with-ml | reuse Sprint 14 snapshot as scaffold reference | — | planned |
| 16 | LLM Internals (Fase 5) | handsonllm-hands-on-llms | `chapter01-03/`, `chapter08/`, `chapter10/` | — | planned |
| 17 | RAG Fundamentals (Fase 5) | nirdiamant-rag-techniques | `all_rag_techniques/{simple_rag,query_transformations,semantic_chunking,...}` (~6 notebooks) | — | planned |
| 18 | RAG Advanced (Fase 5) | nirdiamant-rag-techniques | `all_rag_techniques/{reranking,fusion,self_rag,corrective_rag,graph_rag}` (~6 notebooks) | — | planned |
| 19 | Agents Fundamentals (Fase 5) | nirdiamant-genai-agents | beginner notebooks (3) + LangGraph framework tutorial (2) | — | planned |
| 20 | Multi-agent (Fase 5) | nirdiamant-genai-agents | Scientific Paper Agent, ATLAS, 1 business agent | — | planned |
| 21 | Agentic RAG produção (Fase 5) | nirdiamant-genai-agents, nirdiamant-rag-techniques | Controllable RAG Agent + RAG evaluation notebooks | — | planned |
| 22 | Fine-tuning (Fase 5) | handsonllm-hands-on-llms | `chapter11-12/` (LoRA, QLoRA, DPO) | — | planned |
| 23 | MCP/A2A (Fase 5) | microsoft-ai-agents-for-beginners | Lesson 11 (MCP/A2A/NLWeb) + Lesson 14 (MAF) | — | planned |

**Reuse of snapshots** (avoid duplication):
- Made with ML vendored once at `Sprint14_MLOps/external/`. Sprints 13 and 15 reference it via relative path.
- NirDiamant repos vendored once each; Sprints 17/18/20/21 share snapshots.
- Hands-On LLMs vendored once at `Sprint16_LLMInternals/external/`; Sprint 22 references same snapshot.

**Reference shelf** (no vendor; linked from `docs/study/README.md`):
- `mml-book/mml-book.github.io` — `tutorials/{linear_regression,pca}.{ipynb,solution.ipynb}` linked for Sprints 3+4 (vendor blocked: no LICENSE in upstream).
- `TheAlgorithms/Python` — `Deeper:` opcional para SMO, K-means, t-SNE.
- `dair-ai/Prompt-Engineering-Guide` — leitura ReAct/Tool Use ~2h antes de Sprint 19.
- `academic/awesome-datascience` — descoberta lateral de tools.
- `keon/awesome-nlp` — libs PT-específicas, multilingual.

**Skip (não absorvidos, não linkados):**
- `microsoft/ML-For-Beginners` (excepto roubar 1 dataset opcional, e.g. pumpkin pricing).
- `Avik-Jain/100-Days-Of-ML-Code`.
- `aikorea/awesome-rl` (desactualizado).

---

## 3. Estrutura de pastas resultante

Only deltas shown. Existing tree unchanged elsewhere.

```
MlAtHome/
├── docs/
│   ├── plans/
│   │   └── 2026-05-04-absorb-external-walkthroughs-design.md   ← este doc
│   └── study/
│       ├── README.md                                            ← see Section 4 deltas
│       ├── fase1-fundamentos/
│       │   ├── sprint01-optimization.md
│       │   ├── sprint02-generalization.md
│       │   ├── sprint03-linear-models.md                        ← updated (mml-book Walkthrough)
│       │   └── sprint04-high-dim-pca.md                         ← updated (mml-book Walkthrough)
│       ├── fase2-deep-learning/
│       │   ├── README.md                                        ← shrinks to intro only
│       │   ├── sprint05-mlp-backprop.md                         ← split + Karpathy rewrite
│       │   ├── sprint06-cnn-vision.md                           ← split (no vendor)
│       │   ├── sprint07-attention-transformers.md               ← split + Karpathy rewrite
│       │   └── sprint08-vae-generative.md                       ← split + labmlai diffusion
│       ├── fase3-rl-aplicado/
│       │   ├── README.md                                        ← intro only
│       │   ├── sprint09-bandits-tabular.md
│       │   ├── sprint10-policy-gradient.md
│       │   ├── sprint11-rl-finance.md
│       │   └── sprint11.5-alphazero-muzero.md
│       ├── fase4-especializadas-mlops/
│       │   ├── README.md                                        ← intro only
│       │   ├── sprint12-gnn-graphs.md
│       │   ├── sprint13-evaluation.md                           ← Made with ML testing section
│       │   ├── sprint14-mlops-deployment.md                     ← Made with ML domina
│       │   └── sprint15-applied-portfolio.md                    ← Made with ML scaffold
│       └── fase5-llm-agents/                                    ← NOVA pasta
│           ├── README.md
│           ├── sprint16-llm-internals.md
│           ├── sprint17-rag-fundamentals.md
│           ├── sprint18-rag-advanced.md
│           ├── sprint19-agents-fundamentals.md
│           ├── sprint20-multi-agent.md
│           ├── sprint21-agentic-rag-production.md
│           ├── sprint22-fine-tuning.md
│           └── sprint23-mcp-a2a.md
│
├── Fase1_Foundation/
│   ├── Sprint03_LinearModels/external/mml-book/...
│   └── Sprint04_PCA/external/mml-book/...
│
├── Fase2_DeepLearning/
│   ├── Sprint05_MLP/external/karpathy-nn-zero-to-hero/{lectures/micrograd, lectures/makemore-1..5}/
│   ├── Sprint07_Transformers/external/karpathy-nn-zero-to-hero/{lectures/gpt, lectures/tokenizer}/
│   └── Sprint08_Generative/external/labmlai-annotated-dl/labml_nn/diffusion/{ddpm,ddim,stable_diffusion}/
│
├── Fase3_RL/
│   ├── Sprint09_BanditsTabular/external/{fareedkhan-all-rl-algorithms,openai-spinningup}/
│   ├── Sprint10_PolicyGradient/external/{cleanrl,fareedkhan-all-rl-algorithms,labmlai-annotated-dl}/
│   ├── Sprint11_RLFinance/external/ai4finance-finrl/
│   └── Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/
│
├── Fase4_SpecializedMLOps/
│   ├── Sprint13_Evaluation/external/made-with-ml/
│   ├── Sprint14_MLOps/external/made-with-ml/         ← canonical snapshot
│   └── Sprint15_Portfolio/external/made-with-ml/     ← reuse via relative path
│
└── Fase5_LLMAgents/                                  ← NOVA fase top-level
    ├── Sprint16_LLMInternals/external/handsonllm-hands-on-llms/
    ├── Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/
    ├── Sprint18_RAGAdvanced/external/nirdiamant-rag-techniques/    ← reuse
    ├── Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/
    ├── Sprint20_MultiAgent/external/nirdiamant-genai-agents/        ← reuse
    ├── Sprint21_AgenticRAGProduction/external/{nirdiamant-genai-agents,nirdiamant-rag-techniques}/  ← reuse both
    ├── Sprint22_FineTuning/external/handsonllm-hands-on-llms/      ← reuse
    └── Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/
```

**Three implicit decisions:**

1. **Splits Fases 2-4** — current single-file READMEs become per-sprint files (consistent with Fase 1 and the new Fase 5). Existing content migrates; nothing lost.
2. **Snapshot reuse via relative paths** — Made with ML vendored once at `Sprint14_MLOps/external/`; Sprints 13 and 15 reference via `../../Sprint14_MLOps/external/made-with-ml/`. Same for NirDiamant repos and Hands-On LLMs.
3. **Sprint 11.5** — fractional sprint number for insertion. Parser already supports (`PHASE_DIR_RE` allows `\d+(?:\.\d+)?` per `studyLoader.ts:12`).

---

## 4. Deltas a `docs/study/README.md`

Five localized diffs. Not a rewrite.

### 4.1 Filosofia — adicionar princípio "auto-contained"

```diff
 ## Filosofia

 - **Cobertura:** todos os tópicos do roadmap original ficam.
 - **Library-first.** PyTorch + scikit-learn + transformers por defeito.
 - **Project/dataset-driven.**
 - **Math on-demand.**
 - **Relatórios LaTeX** removidos como obrigação.
+- **Auto-contido.** Walkthroughs externos canónicos vivem dentro do repo (`Fase{N}_X/SprintY/external/{repo}/`) com atribuição completa. Único redireccionamento permitido: vídeos YouTube (`Video:`).
```

### 4.2 Load-bearing list — Karpathy é canonical

```diff
 ## What stays from-scratch (load-bearing — 4 only)

-1. **Gradient Descent + Newton** em 1D e 2D (`fase1`).
-2. **MLP + backprop** em NumPy puro (`fase2`).
-3. **Scaled Dot-Product Attention** + 1-head transformer encoder (`fase2`).
-4. **REINFORCE policy gradient** + bandit em 1 ambiente (`fase3`).
+1. **Gradient Descent + Newton** em 1D e 2D (`fase1`, próprio).
+2. **MLP + backprop** via Karpathy nn-zero-to-hero L1–L5 vendored (`fase2`, walkthrough canónico).
+3. **Attention + GPT** via Karpathy L7+L8 vendored (`fase2`, walkthrough canónico).
+4. **REINFORCE + bandit** em 1 ambiente (`fase3`, próprio com FareedKhan vendored como referência).
+
+> Karpathy substitui re-implementação NumPy: é literalmente o exercício from-scratch melhor explicado que existe. Repetir = redundante.
```

### 4.3 Tabela de cobertura — Fase 5 + ajustes

```diff
 | Fase | Tópicos | Semanas | Pasta |
 |------|---------|---------|-------|
 | **1 — Fundamentos** | Optimization, generalização, linear models, high-dim/PCA | 8 | `fase1-fundamentos/` |
 | **2 — Deep Learning** | MLP+backprop, CNN, attention/transformers, VAE/diffusion | 8 | `fase2-deep-learning/` |
-| **3 — RL + Aplicado** | Bandits, Q-learning, PG/PPO, RL aplicado a finance/trading | 6 | `fase3-rl-aplicado/` |
+| **3 — RL + Aplicado** | Bandits, Q-learning, PG/PPO, RL finance, AlphaZero/MuZero | 8 | `fase3-rl-aplicado/` |
 | **4 — Especializadas + MLOps + Portfolio** | GNNs, evaluation rigorosa, MLOps, applied portfolio | 6 | `fase4-especializadas-mlops/` |
+| **5 — LLM/Agents** | LLM internals, RAG fund/avançado, Agents, Multi-agent, Agentic RAG, Fine-tuning, MCP/A2A | 8 | `fase5-llm-agents/` |

-**Total:** ~28 semanas (~6-7 meses a 6h/semana).
+**Total:** ~38 semanas (~9 meses a 6h/semana). Acréscimo: Sprint 11.5 (AlphaZero/MuZero) + Fase 5 (8 sprints LLM/Agents).
```

### 4.4 Bibliografia — adicionar mml-book + Hands-On LLMs

```diff
 **Math (referência on-demand):**
+- Deisenroth/Faisal/Ong — *Mathematics for Machine Learning* (PDF gratuito + 3 notebooks vendored em Fase 1)
 - Boyd — *Convex Optimization* (abrir cap 9 quando bater Newton)
 - Bishop — *PRML* (alternativa a ESL para certos tópicos)
 - McElreath — *Statistical Rethinking* (Bayesian)
+
+**LLM/Agents (Fase 5):**
+- Alammar/Grootendorst — *Hands-On Large Language Models* (notebooks Colab vendored em Fase 5; livro O'Reilly opcional)
```

### 4.5 Nova secção — External walkthroughs absorbed (após Bibliografia)

```markdown
## External walkthroughs absorbed

Repos vendored com atribuição completa em `Fase{N}_X/Sprint0Y/external/{repo}/`. Snapshot frozen, atualização manual.

| Repo | Vendored em | Cobre |
|---|---|---|
| Karpathy nn-zero-to-hero | Sprint 5, 7 | MLP+backprop, GPT from scratch, BPE |
| labmlai annotated DL papers | Sprint 8, 10 | Diffusion (DDPM/DDIM/SD), PPO ref |
<!-- mml-book row removed: no LICENSE in upstream repo, fell back to Reference link in Sprints 3+4. See license-verification-2026-05-04.md. -->
| FareedKhan all-rl-algorithms | Sprint 9, 10 | 18 RL algos didáticos (A2C, A3C, TRPO, SAC, MADDPG) |
| CleanRL | Sprint 10 | Single-file PPO, SAC, DDPG, TD3 (production-grade) |
| OpenAI Spinning Up | Sprint 9 | VPG docs + code, theoretical anchor |
| AI4Finance FinRL | Sprint 11 | RL applied to trading (quickstart + 1 strategy) |
| werner-duvaud muzero-general | Sprint 11.5 | AlphaZero + MuZero unified |
| Made with ML | Sprint 13, 14, 15 | MLOps end-to-end (Ray + MLflow + FastAPI + GH Actions) |
| Hands-On LLMs | Sprint 16, 22 | Tokenization, embeddings, fine-tuning (LoRA/QLoRA/DPO) |
| NirDiamant RAG_Techniques | Sprint 17, 18, 21 | Foundational + advanced RAG (~12 técnicas) |
| NirDiamant GenAI_Agents | Sprint 19, 20, 21 | Agents fundamentals + multi-agent + agentic RAG |
| Microsoft ai-agents-for-beginners | Sprint 23 | MCP/A2A/MAF (lessons 11+14) |

## Reference shelf (não vendored, link only)

- TheAlgorithms/Python — `Deeper:` opcional para SMO, K-means, t-SNE
- dair-ai/Prompt-Engineering-Guide — leitura ReAct/Tool Use 2h antes de Sprint 19
- academic/awesome-datascience — descoberta lateral de tools
- keon/awesome-nlp — libs PT-específicas, multilingual
```

---

## 5. LearningHub impacts

### 5.1 No parser change required

`studyLoader.ts` is markdown-permissive (lines 79-93 read `.md` raw and return as `contentMarkdown`). The new `Walkthrough:`, `Video:`, `Source:` fields render as plain text/links inside the rendered markdown body. Decimal sprint numbers (Sprint 11.5) are already supported via `PHASE_DIR_RE` (line 12). Splits of Fases 2-4 from single README to per-sprint files are already supported (line 84 condition).

**Nothing in LearningHub blocks this content work. Nothing must ship before vendoring begins.**

### 5.2 Future LH tickets (separate workstreams)

| ID | Ticket | Cost | Trigger |
|---|---|---|---|
| LH-1 | Smoke test Sprint 5 vendored render in LH dev | 5 min | After Sprint 5 commit |
| LH-2 | Iframe YouTube for `Video:` field (markdown remark plugin) | ~30 min | After Fase 5 written |
| LH-3 | Commit pending May 2 LH refactor (`M load.ts`, `?? studyLoader.ts`) | unknown — investigate | Before LH-2 |
| LH-4 | JupyterLite integration to render `.ipynb` inline | days | When user has appetite — orthogonal |
| LH-5 | Attribution badge UI ("Vendored from X · MIT") | ~1h | Nice-to-have |

### 5.3 Out of scope

- Inline notebook rendering (LH-4 — large feature, orthogonal).
- Periodic upstream sync of vendored repos — manual snapshot policy until proven insufficient.
- QuantHome equivalent absorption — separate workstream when user opens it.
- **LH v2 vision** (multi-source LMS with DB-backed progress, faculty as 3rd source, content-in-DB question) — captured separately as deferred briefing in `~/.claude/projects/-home-tor-Documents-personal/memory/project_learninghub_v2_vision.md`. Dedicated `/brainstorming` session in `~/Documents/code/LearningHub` when user opens it. Current absorb design is forward-compatible.

---

## License compatibility (verified during execution)

Pre-vendor checklist for each repo:
- [ ] License is permissive (MIT/Apache-2.0/BSD/CC-BY) — most are MIT.
- [ ] License file copied into `external/{repo}/LICENSE`.
- [ ] Attribution complete in `_ATTRIBUTION.md`.

**Verified 2026-05-04** (see `license-verification-2026-05-04.md`):
- 12 of 13 repos have permissive licenses (MIT or Apache-2.0).
- NirDiamant repos (RAG_Techniques + GenAI_Agents) have Custom non-commercial license — vendor permitted with attribution + non-commercial flag in `_ATTRIBUTION.md`.
- **`mml-book`: BLOCKED** — no LICENSE in upstream repo. Sprints 3+4 fall back to `Reference:` link to GitHub instead of `Walkthrough:` to vendored files. Manifest updated.
- `labmlai`: LICENSE is lowercase `license` filename — vendor copy must preserve casing.

---

## Execution chunks (informs writing-plans handoff)

The implementation plan (writing-plans output, separate doc) will sequence vendor work into discrete chunks. High-level shape:

- **Chunk 0:** License batch verification (parallel agents per repo, ~30 min total).
- **Chunk 1:** `docs/study/README.md` deltas + create empty Fase 5 directory + branch infrastructure (~30 min).
- **Chunk 2:** Splits — Fases 2/3/4 single-README → per-sprint files (no content change, just split). (~1h)
- **Chunk 3:** Sprint 5 vendor + walkthrough rewrite (Karpathy L1-5). PILOT — first time the form is exercised. (~2h)
- **Chunk 4:** Smoke test in LH; revise form if Sprint 5 reveals problems.
- **Chunk 5+:** Replicate pattern across remaining sprints. Parallelizable via subagents (one sprint per agent).
- **Final:** Update manifest in this doc with execution status, commit, optionally merge.

---

## Open questions / risks

- **mml-book license:** if not vendor-compatible, fall back to `Reference:` link for those notebooks (does not invalidate the rest of the design).
- **Vendor size:** total vendored content estimate <500 MB. Acceptable for a study repo; revisit if it grows unexpectedly.
- **Upstream drift:** snapshot policy is "freeze and forget unless update is material". Risk of vendored content going stale. Mitigated by `_SNAPSHOT.md` + manual re-pull when warranted.
- **Sprint 11.5 in LearningHub UI:** needs visual confirmation that decimal sprint numbers display sensibly in the dock (probably fine, but LH-1 smoke test catches it).

---

## Summary

- **What:** vendor 11 ML/AI repos into MlAtHome's existing folder structure, treating their content as local (no redirection during study).
- **How:** consistent template additions (`Walkthrough:` / `Video:` / `Source:`) + `external/{repo-slug}/` folders with `_ATTRIBUTION.md` + `LICENSE` + `_SNAPSHOT.md`.
- **Scope:** 18 sprints touched, 8 brand-new (Fase 5). Roadmap grows from 28 to ~38 weeks. AlphaZero/MuZero gap closed via Sprint 11.5.
- **LH impact:** none for content rendering. Future iframe + JupyterLite tickets are separate.
- **Branch:** `feature/absorb-external-walkthroughs`. Merge decision deferred until first sprint validates the form.
