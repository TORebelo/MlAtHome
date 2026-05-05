# Sprint 4 — Alta Dimensão e PCA

> **Fase 1** · 2 semanas · pasta de output: `Fase1_Foundation/Sprint04_HighDim/`

**O que sai daqui:** intuição para "curse of dimensionality", PCA implementada via SVD (uma vez do zero — load-bearing para perceber o que o sklearn faz), feature selection rigorosa, e quando regressão linear colapsa em `p > N`.

> **mml-book PCA companion notebook** (link only — não vendored): abrir lado-a-lado.
> - https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_pca.ipynb (+ `.solution.ipynb`)
>
> **Source:** https://github.com/mml-book/mml-book.github.io

---

## Semana 1 — Curse of dimensionality + PCA

### Sessão 1 — Curse of dim — distâncias colapsam

Reference:    ESL cap 2.5
Build:        Amostrar pontos uniformemente em `[0,1]^d` para `d = 1, 5, 50, 500`. Plotar histograma das distâncias par-a-par. Mostrar que em high-d, todas as distâncias são parecidas.
Output:       01_curse_distances.py

### Sessão 2 — PCA via SVD from-scratch

Reference:    ESL cap 14.5
Reference:    https://github.com/mml-book/mml-book.github.io/blob/master/tutorials/tutorial_pca.ipynb
Build:        `X = U S V^T`. Implementar PCA from scratch usando `np.linalg.svd`. Comparar com `sklearn.decomposition.PCA`. Aplicar a MNIST — visualizar projecções 2D.
Output:       02_pca_svd.py

### Sessão 3 — PCA scree plot e variance explained

Build:        Para CIFAR-10 ou Olivetti faces, plotar variance explained vs num components. Quantos PCs precisas para 95%?
Output:       03_pca_variance.py

### Sessão 4 — Eigenfaces

Reference:    Turk & Pentland (1991)
Build:        Aplicar PCA a faces, visualizar primeiras 16 componentes principais como imagens. Reconstruction com k=10, 50, 200.
Output:       04_eigenfaces.py

---

## Semana 2 — High-dim regression + sparse recovery

### Sessão 5 — OLS colapsa quando p > N

Build:        Gerar dataset com `p > N`. Mostrar que `(X^T X)` é singular → OLS impossível. Comparar Ridge (sempre soluciona) vs Lasso (sparse).
Output:       05_ols_colapso.py

### Sessão 6 — Lasso recupera signal sparse

Reference:    Donoho — compressed sensing
Build:        Gerar `y = Xβ + ε` com `β` esparso (10 coefs nonzero em 1000). Lasso recupera? Plotar trajectória `α`.
Output:       06_sparse_recovery.py

### Sessão 7 — Feature selection methods

Build:        Comparar 4 métodos em high-dim dataset: Univariate (`SelectKBest` + F-test); Recursive Feature Elimination; Lasso path (coefs nonzero); SHAP-based importance (XGBoost).
Output:       07_feature_selection.py

### Sessão 8 — Pipeline completo

Reference:    ESL cap 18 (high-dim); López de Prado para PCA em finance
Build:        `sklearn.pipeline.Pipeline` com imputer + scaler + PCA + classifier. CV honesta (não data leakage entre folds). Aplicar a Pima Indians Diabetes ou similar.
Output:       08_pipeline.py

---

## Entrega Sprint 4 + Fase 1 ✅

`notas/fase1-retrospectiva.md`:

1. Quanto tempo a Fase 1 realmente demorou (vs 8 semanas estimadas)?
2. Sprints leves vs pesados?
3. Tópicos que ainda não estão sólidos?
4. Sentes-te pronto para Deep Learning (Fase 2)?

**Pergunta-teste:** "Em 1 minuto: porque é que regressão linear standard falha em `p > N`, e como é que Lasso/Ridge resolvem o problema (e por caminhos diferentes)?"

- [ ] Resumo escrito.
- [ ] Retrospectiva da Fase 1 escrita.
