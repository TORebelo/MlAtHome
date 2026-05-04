# Sprint 2 — Generalização e Bias-Variance

> **Fase 1** · 2 semanas · pasta de output: `Fase1_Foundation/Sprint02_Generalization/`

**O que sai daqui:** intuição sólida para bias-variance trade-off, como medir generalization gap, cross-validation rigorosa, e porque é que "mais parâmetros" nem sempre é overfitting (double descent).

---

## Semana 1 — Bias-Variance trade-off

### Sessão 1 — *"Vou fittar polinómios de grau 1 a 15 a uns dados ruidosos. Quando é que começa a overfittar visualmente?"*

**Build:** dataset sintético `y = sin(2π·x) + ε`, 30 pontos. Fittar polinómios de grau 1, 3, 5, 9, 15 com `numpy.polyfit`. Plotar todos sobre os dados.

**Reference:** ESL cap 2.3 (statistical decision theory). Bishop *PRML* cap 1.1.

**Output:** `01_polynomial_overfitting.py` + plot com 5 fits.

- [ ] Sessão 1

### Sessão 2 — *"Decompor erro em bias², variância, e ruído irredutível. Vamos medir."*

**Build:** simulação Monte Carlo:
1. Gerar 100 datasets diferentes do mesmo DGP.
2. Para cada modelo (poly degree 1-15), fittar em cada dataset.
3. Calcular bias², variance, irreducible noise para cada degree.
4. Plotar U-shape do total error.

**Reference:** ESL cap 7.3 (bias-variance). Geman, Bienenstock, Doursat (1992).

**Output:** `02_bias_variance_decomp.py` + plot bias² + var + noise = total error.

- [ ] Sessão 2

### Sessão 3 — *"Train vs test error: classic curves. Quando overfit começa?"*

**Build:** mesmo dataset/modelos. Plotar:
- Training error vs degree.
- Test error vs degree (hold-out de 30%).

Mostrar gap crescente = overfitting.

**Reference:** ESL cap 7.4. Géron cap 4 (regularização).

**Output:** `03_train_vs_test.py` + plot.

- [ ] Sessão 3

### Sessão 4 — *"Double descent: o paradoxo moderno. Mais parâmetros melhoram (de novo)."*

**Build:** reproduzir mini double descent em random feature regression:
1. `n=100` datapoints.
2. Variar número de features `p` de 10 a 1000.
3. Plotar test error vs `p`. Esperado: U-shape clássico, depois descida (interpolation regime).

**Reference:** Belkin et al. (2019) — *Reconciling modern machine-learning practice and the classical bias-variance trade-off*. Nakkiran et al. (2019) — *Deep Double Descent*.

**Output:** `04_double_descent.py` + plot.

- [ ] Sessão 4

---

## Semana 2 — Cross-validation e model assessment

### Sessão 1 — *"K-fold CV. E porque é que stratified importa em classificação imbalanced?"*

**Build:** `sklearn.model_selection.cross_val_score` em dataset imbalanced (e.g. credit card fraud). Comparar K-fold vs StratifiedKFold. Mostrar variance dos folds.

**Reference:** ESL cap 7.10 (cross-validation). sklearn docs.

**Output:** `05_cv_basics.py` + boxplot de scores por fold.

- [ ] Sessão 1

### Sessão 2 — *"Time series CV: porque RandomSplit destrói a vida real."*

**Build:** dataset time series (preços SPY). Comparar:
- `KFold` random (errado).
- `TimeSeriesSplit` (correto).
- Purged K-fold (López de Prado) — para preview de Fase 4.

Mostrar como métricas são otimistas com random split.

**Reference:** López de Prado cap 7 (cross-validation in finance). sklearn `TimeSeriesSplit`.

**Output:** `06_ts_cv.py` + comparação de scores.

- [ ] Sessão 2

### Sessão 3 — *"Hyperparameter tuning honesto: nested CV vs leak."*

**Build:** ridge regression com `α` a tunar:
- **Errado:** tunar em test set.
- **Errado v2:** tunar em CV, reportar best CV score como performance estimate (otimismo).
- **Certo:** nested CV — outer loop para performance, inner loop para tuning.

**Reference:** Cawley & Talbot (2010) — *On Over-fitting in Model Selection and Subsequent Selection Bias*.

**Output:** `07_nested_cv.py` + tabela comparativa.

- [ ] Sessão 3

### Sessão 4 — *"AIC, BIC, MDL: alternativas a CV. Quando usar?"*

**Build:** model selection com critérios de informação:
1. Polynomial regression.
2. Calcular AIC e BIC para cada degree.
3. Comparar com test error e com CV.

**Reference:** ESL cap 7.5-7.7 (AIC, BIC). Burnham & Anderson — *Model Selection and Multimodel Inference*.

**Output:** `08_aic_bic.py` + tabela e plot.

- [ ] Sessão 4

---

## Entrega Sprint 2

`notas/sprint02-resumo.md`:

**Pergunta-teste:** "Bias-variance trade-off em 1 minuto. E em que situações modernas (deep learning) ele se quebra?"

- [ ] Resumo escrito.

## Bibliografia consultada

- ESL cap 2-3, 7
- Belkin et al. (2019) — double descent paper
- López de Prado cap 7 — purged CV
