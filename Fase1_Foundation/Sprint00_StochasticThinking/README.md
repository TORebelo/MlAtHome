# 🎲 Sprint 0 — Stochastic Thinking & Monte Carlo

**Status:** ⚪ Por iniciar
**Duração estimada:** 6-10h (1-2 semanas a 1h/dia)
**Pré-requisito:** NumPy básico (índices, arrays, broadcasting)

---

## 🎯 Objetivo

Construir intuição rigorosa sobre **probabilidade aplicada via simulação**: random walks, Monte Carlo, intervalos de confiança, bootstrap, e testes de hipóteses. Tudo do zero em NumPy puro.

No fim deste sprint deves saber:

- Quando uma estimativa é *boa o suficiente* (e provar com simulação)
- Como construir um intervalo de confiança sem decorar a fórmula
- Por que o bootstrap funciona (e onde falha)
- Diferença entre erro padrão da média e desvio padrão da população
- Como **simular** um teste de hipótese antes de aplicar a fórmula

---

## 📚 Filosofia: Companion ao MIT 6.0002

Este sprint **não reinventa** o que o Prof. Guttag explica melhor.
Vês as aulas dele, e o `scaffolded.ipynb` dá-te os hands-on para cada uma.

**Curso:** [MIT 6.0002 — Introduction to Computational Thinking and Data Science (Fall 2016)](https://ocw.mit.edu/courses/6-0002-introduction-to-computational-thinking-and-data-science-fall-2016/)

| Aula | Tópico | Tasks no notebook |
| ---- | ------ | ----------------- |
| L4   | Stochastic Thinking | §1.1–1.2 (random walks 1D, distance scaling) |
| L5   | Random Walks | §1.3–1.4 (random walk 2D, biased walk) |
| L6   | Monte Carlo Simulation | §2.1–2.4 (estimar π, integrais) |
| L7   | Confidence Intervals | §3.1–3.3 (CI normal, cobertura, SE) |
| L8   | Sampling and Standard Error | §4.1–4.3 (bootstrap CI) |
| L10  | Hypothesis Testing | §5.1–5.3 (t-test from scratch) |

> L9 (Experimental Data: regressão linear) fica para o **Sprint 1** que mergulha em otimização — a tua regressão sai de lá.

---

## 🧠 Como trabalhar

```
Sprint00_StochasticThinking/
├── README.md              ← este ficheiro
├── scaffolded.ipynb       ← TEMPLATE (não editar — fica no git)
└── solutions/             ← TUA PASTA DE TRABALHO (gitignored)
    └── local.ipynb        ← cópia onde escreves o código
```

**Loop diário (~30-60 min):**

1. Ver UMA aula do Guttag (cada uma ~50 min, vê a 1.5x se preferires)
2. Abrir o teu `solutions/local.ipynb` na secção correspondente
3. Preencher os `# TODO` da próxima micro-task
4. Correr a célula → ler a assertion → corrigir até passar
5. Mover-te para a próxima task

**Setup pela primeira vez:**

```bash
cp scaffolded.ipynb solutions/local.ipynb   # ou abre no LearningHub
```

---

## ✅ Definition of Done

Só avanças para o Sprint 1 se:

- [ ] As 15 micro-tasks do `solutions/local.ipynb` correm sem AssertionError
- [ ] Sabes responder, sem ver as respostas:
  - [ ] Por que é que E[|distância|] num random walk simétrico cresce como √n?
  - [ ] Quantas amostras Monte Carlo precisas para estimar π com erro absoluto < 0.001 (ordem de magnitude)?
  - [ ] Diferença entre **erro padrão** (SE = σ/√n) e **desvio padrão** (σ)?
  - [ ] Quando é que a CI normal-aproximada falha? (sample pequeno, ou cauda pesada)
  - [ ] Por que o bootstrap não exige conhecer a distribuição da estatística?
- [ ] Escreveste 1 parágrafo (em `solutions/notas.md`) sobre algo que te surpreendeu

---

## 📦 Bibliografia complementar (opcional)

Só se quiseres aprofundar — não é necessário para fechar o sprint:

- **Guttag (2021)** — *Introduction to Computation and Programming Using Python*, Cap. 16-19. Cobre o mesmo material das aulas com exemplos extra.
- **Wasserman (2004)** — *All of Statistics*, Cap. 6 (Models, Statistical Inference) e Cap. 8 (The Bootstrap). Versão mais formal/teórica.
- **Efron & Tibshirani (1993)** — *An Introduction to the Bootstrap*. Para quando quiseres saber por que o bootstrap funciona matematicamente.

---

## 🔗 Próximo passo

→ **Sprint 1 — Convex Optimization** (`../Sprint01_Optimization/`)

A regressão linear, gradient descent, Newton, e tudo o que vais derivar mecanicamente lá, vai assentar em cima da intuição estatística que constróis aqui.
