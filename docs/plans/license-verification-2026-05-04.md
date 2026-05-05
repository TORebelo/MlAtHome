# License Verification — Absorb External Walkthroughs

**Date:** 2026-05-04
**Method:** `curl` of LICENSE/license/COPYING from each repo's default branch on GitHub.
**Affected design doc:** `2026-05-04-absorb-external-walkthroughs-design.md` — manifest updated for blocked repo (mml-book).

---

## Summary

| # | Repo | License | Vendor decision | Notes |
|---|---|---|---|---|
| 1 | `karpathy/nn-zero-to-hero` | MIT | ✅ vendor | Standard MIT. |
| 2 | `labmlai/annotated_deep_learning_paper_implementations` | MIT | ✅ vendor | LICENSE filename is lowercase `license` — the snapshot copy must preserve casing. |
| 3 | `GokuMohandas/Made-With-ML` | MIT | ✅ vendor | Standard MIT. |
| 4 | `NirDiamant/RAG_Techniques` | Custom non-commercial | ✅ vendor (with flag) | Non-commercial use granted. Attribution + repo link required. Commercial use forbidden without permission. |
| 5 | `NirDiamant/GenAI_Agents` | Custom non-commercial (identical to RAG_Techniques) | ✅ vendor (with flag) | Same as #4. |
| 6 | `HandsOnLLM/Hands-On-Large-Language-Models` | Apache-2.0 | ✅ vendor | Apache OK; preserve LICENSE + NOTICE if present. |
| 7 | `mml-book/mml-book.github.io` | **NONE — all rights reserved** | ❌ **link-only** | No LICENSE file. Copyright Deisenroth/Faisal/Ong 2020. README encourages Colab/Binder usage but does not grant redistribution. **Fallback:** Sprints 3+4 use `Reference:` links to GitHub instead of `Walkthrough:` to vendored files. User-owned scaffold notebooks are the `Build:`. |
| 8 | `FareedKhan-dev/all-rl-algorithms` | MIT | ✅ vendor | Standard MIT. |
| 9 | `vwxyzjn/cleanrl` | MIT | ✅ vendor | Standard MIT. |
| 10 | `openai/spinningup` | MIT | ✅ vendor | Standard MIT. |
| 11 | `AI4Finance-Foundation/FinRL` | MIT | ✅ vendor | Standard MIT. |
| 12 | `werner-duvaud/muzero-general` | MIT | ✅ vendor | Standard MIT. |
| 13 | `microsoft/ai-agents-for-beginners` | MIT | ✅ vendor | Standard MIT. |

**Total:** 12 vendor / 1 link-only.

---

## NirDiamant non-commercial flag (Sprints 17-21)

The two NirDiamant repos use an identical "Custom License Agreement". Key terms relevant to this project:

- **Section 1.1:** Non-commercial use granted (worldwide, royalty-free, non-exclusive, non-transferable) — **CAN reproduce, modify, distribute** for non-commercial purposes.
- **Section 1.2:** Attribution required — cite Licensor's name, link to repository, indicate changes if any.
- **Section 1.3:** No commercial use without prior written permission from Nir Diamant (`nirdiamant21@gmail.com`).

MlAtHome is a personal study repo (non-commercial). Vendoring NirDiamant content satisfies §1.1. Attribution requirements are satisfied by the standard `_ATTRIBUTION.md` template plus a non-commercial flag:

```markdown
**License flag:** Non-commercial only. Commercial use requires permission from Nir Diamant.
```

If MlAtHome ever becomes commercial (paid course, hosted SaaS, etc.), the NirDiamant snapshots must be removed or relicensed.

---

## mml-book fallback design (Sprints 3, 4)

Affected sprints in design doc manifest update from `vendor` to `link-only`:

| # | Sprint | Original plan | Updated plan |
|---|---|---|---|
| 3 | Linear models (Fase 1) | Vendor `mml-book/tutorials/linear_regression.{ipynb,_solutions.ipynb}` | `Reference:` link to `https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_linear_regression.ipynb` (and `.solution.ipynb`). User creates own `scaffolded.ipynb` adapting the exercises. |
| 4 | PCA (Fase 1) | Vendor `mml-book/tutorials/pca.{ipynb,_solutions.ipynb}` | Same pattern: link via `Reference:`, own scaffold for `Build:`. |

The "auto-contained" principle is partially violated for these two sprints — single allowed redirection (videos) becomes "videos + mml-book GitHub for Fase 1 tutorials". User accepts this trade-off given mml-book has no license to permit vendoring.

**Future option:** if mml-book authors add a permissive license later, revisit and vendor.

---

## Verification commands (reproducibility)

Each repo verified via:

```bash
for path in main/LICENSE master/LICENSE main/license master/license main/LICENSE.md master/LICENSE.md ...; do
  curl -fsSL "https://raw.githubusercontent.com/<repo>/$path" 2>/dev/null
done
```

Re-run before re-vendoring if the repo's license file may have changed (rare).
