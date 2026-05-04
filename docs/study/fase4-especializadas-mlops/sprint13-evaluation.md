# Sprint 13 — Evaluation Rigorosa (semana 24)

**Pergunta nuclear:** *"O meu modelo tem accuracy 0.92 no test set. Que confiança real é que tenho neste número?"*

1. **Confidence intervals para métricas.** Build: bootstrap CI para accuracy, AUC, F1. Aplicar a um classifier qualquer. Output: `01_bootstrap_ci.py`.
2. **Significance testing entre modelos.** Build: paired t-test e McNemar test para comparar 2 classifiers. Output: `02_model_comparison.py`. Reference: Dietterich (1998).
3. **Multiple testing correction.** Build: comparar 10 modelos, mostrar que sem Bonferroni/FDR tens false positives. Output: `03_multiple_testing.py`.
4. **Calibration.** Build: reliability diagrams + Brier score. Aplicar Platt scaling e Isotonic. Output: `04_calibration.py`. Reference: Niculescu-Mizil & Caruana (2005).
5. **Distribution shift detection.** Build: usar `evidently` ou `alibi-detect` para detectar drift entre train e production data. Output: `05_drift_detection.py`.
6. **Fairness audit.** Build: demographic parity, equalized odds em dataset com protected attribute (Adult). Output: `06_fairness.py`. Reference: Hardt et al. (2016).
7. **Adversarial robustness.** Build: avaliar robustness a perturbações input (FGSM, PGD). Output: `07_adversarial_eval.py`. Library: `foolbox`.
8. **Final evaluation suite.** Build: package `evaluation/` reusable que aplica tudo a qualquer model. Output: `08_eval_suite/`.

**Reference:** ESL cap 7. López de Prado caps 11-14. Dietterich (1998) — paper sobre statistical tests.

**Entrega:** `notas/sprint13-resumo.md`.
