# Sprint 3 — Modelos Lineares e Regularização

> **Fase 1** · 2 semanas · pasta de output: `Fase1_Foundation/Sprint03_Linear/`

**O que sai daqui:** dominas regressão linear, ridge, lasso, elastic net, logistic, e GMM com EM. Implementação from-scratch só onde dá intuição (closed-form OLS, ridge, sigmoid). Resto via `sklearn`.

> **mml-book companion notebooks** (link only — não vendored, ver `docs/plans/license-verification-2026-05-04.md`): abrir lado-a-lado para fill-in-the-blank com solutions.
> - Linear Regression: https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_linear_regression.ipynb (+ `.solution.ipynb`)
> - GMM (Sessão 7 abaixo): https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_gmm.ipynb (+ `.solution.ipynb`)
>
> **Source:** https://github.com/mml-book/mml-book.github.io

---

## Semana 1 — Regressão e regularização

1. **OLS analítico vs numérico.** Implementar OLS via normal equations (`(X^T X)^{-1} X^T y`) e via SGD. Comparar resultados em Boston housing. Output: `01_ols.py`. Reference: ESL cap 3.2.
2. **Ridge from-scratch.** Implementar L2 regression, plotar coeficientes vs `α`. Mostrar shrinkage. Comparar com `sklearn.linear_model.Ridge`. Output: `02_ridge.py`. Reference: ESL 3.4.1.
3. **Lasso (sklearn) e geometria L1 vs L2.** Usar `sklearn.linear_model.Lasso`. Plotar coeficientes vs `α` — mostrar sparsity. Plot da geometria L1 (diamante) vs L2 (círculo). Output: `03_lasso_geometry.py`. Reference: ESL 3.4.2-3.4.3.
4. **Elastic Net + LARS path.** `ElasticNetCV` em high-dim dataset. `lars_path` para visualizar. Output: `04_elastic_net.py`.

**Reference:** ESL cap 3. Tibshirani (1996) — Lasso paper.

---

## Semana 2 — Classificação e EM

1. **Logistic regression from-scratch.** Implementar com gradient descent. Comparar com `sklearn.linear_model.LogisticRegression`. Aplicar a binary classification (e.g. titanic). Output: `05_logreg.py`.
2. **Multinomial / SoftMax.** Estender logistic para multi-class. Aplicar a MNIST (não convnet — só pixels flat). Mostrar accuracy ~92%. Output: `06_softmax_mnist.py`.
3. **GMM + EM algorithm.** Implementar GMM 2-componentes com EM em dados sintéticos. Comparar com `sklearn.mixture.GaussianMixture`. Output: `07_gmm_em.py`. Reference: Bishop *PRML* cap 9.
4. **LDA vs QDA vs LogReg.** Comparar 3 classifiers em Iris e em dataset com classes não-Gaussianas. Quando cada um vence? Output: `08_lda_qda.py`.

**Reference:** Bishop *PRML* cap 4 (linear classification), cap 9 (mixtures).

---

## Entrega Sprint 3

**Pergunta-teste:** "Em 1 minuto: Ridge vs Lasso — quando escolher cada um? E porque é que o Lasso 'mata' coeficientes mas Ridge não?"

- [ ] `notas/sprint03-resumo.md`
