# Sprint 13 — Evaluation Rigorosa (semana 24)

**Pergunta nuclear:** *"O meu modelo tem accuracy 0.92 no test set. Que confiança real é que tenho neste número?"*

> Sprint walkthrough-augmented. Made-With-ML (vendored em Sprint 14, partilhado por Sprints 13/14/15) tem patterns canónicos de **behavioral testing** (INVariance, DIRectional, Minimum Functionality), **slice-based metrics** e **test pyramid para ML**. Estuda o `evaluate.py` + `tests/` antes de construir o teu eval suite próprio.

1. **Confidence intervals para métricas.** Build: bootstrap CI para accuracy, AUC, F1. Aplicar a um classifier qualquer. Output: `01_bootstrap_ci.py`. Reference: ESL cap 7.

2. **Significance testing entre modelos.** Build: paired t-test e McNemar test para comparar 2 classifiers. Output: `02_model_comparison.py`. Reference: Dietterich (1998) — *Approximate Statistical Tests for Comparing Supervised Classification Learning Algorithms*.

3. **Multiple testing correction.** Build: comparar 10 modelos, mostrar que sem Bonferroni/FDR tens false positives. Output: `03_multiple_testing.py`.

4. **Calibration.** Build: reliability diagrams + Brier score. Aplicar Platt scaling e Isotonic. Output: `04_calibration.py`. Reference: Niculescu-Mizil & Caruana (2005).

5. **Slice-based evaluation + behavioral testing (Made-With-ML).**

   Build:        Estudar como Made-With-ML estrutura evaluation: métricas globais + slice-based (per-tag, per-token-length) + behavioral tests (invariance/directional/MFT). Adaptar a estrutura ao teu próprio classifier.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/evaluate.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/model/test_behavioral.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/model/utils.py
   Reference:    Ribeiro et al. (2020) — *Beyond Accuracy: Behavioral Testing of NLP Models with CheckList*. Goku Mohandas — *Made With ML* lessons "Evaluation" + "Testing".
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint13_Evaluation/notebooks/05_slice_behavioral.ipynb

6. **Distribution shift detection.** Build: usar `evidently` ou `alibi-detect` para detectar drift entre train e production data. Output: `06_drift_detection.py`. Reference: Rabanser et al. (2019) — *Failing Loudly: An Empirical Study of Methods for Detecting Dataset Shift*.

7. **Fairness audit.** Build: demographic parity, equalized odds em dataset com protected attribute (Adult). Output: `07_fairness.py`. Reference: Hardt et al. (2016) — *Equality of Opportunity in Supervised Learning*.

8. **Adversarial robustness.** Build: avaliar robustness a perturbações input (FGSM, PGD). Output: `08_adversarial_eval.py`. Library: `foolbox` ou `torchattacks`.

9. **Test pyramid para ML (data + code + model).**

   Build:        Replicar a estrutura `tests/{code,data,model}/` do Made-With-ML para o teu projeto: `test_data.py` (great expectations / pandera), `test_predict.py` (smoke + sanity), `test_behavioral.py` (capabilities). Correr com pytest.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/code/test_data.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/code/test_predict.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/data/test_dataset.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/code/conftest.py
   Reference:    Goku Mohandas — *Made With ML* lesson "Testing". Huyen — *Designing ML Systems* cap 8 (model evaluation).
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint13_Evaluation/tests/ + relatório `notas/sprint13-test-pyramid.md`

10. **Final evaluation suite.** Build: package `evaluation/` reusable que aplica tudo a qualquer model (CIs, slice metrics, calibration, drift detector, fairness audit). Output: `evaluation/` lib + 1 demo notebook integrando tudo num pipeline reprodutível.

**Reference:** ESL cap 7. López de Prado caps 11-14. Dietterich (1998) — paper sobre statistical tests. Ribeiro et al. (2020) — CheckList. Goku Mohandas — *Made With ML* (lessons gratuitos online).

**Entrega:** `notas/sprint13-resumo.md` — pergunta-teste: "Em 1 minuto: qual é a diferença entre **slice-based metrics** e **behavioral tests**, e quando é que cada um te apanha bugs que accuracy global não apanha?"
