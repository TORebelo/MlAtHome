# 🚩 Checkpoint 05: The Showdown (Capstone)
**Status:** ⚪ Por iniciar
**Objetivo:** Reunir os otimizadores construídos nos CPs 01-04 e pô-los a competir num teste canónico (Rosenbrock). Aprender três ferramentas profissionais — gradient check, Armijo line search, eigenvalue analysis.

---

## 🧠 1. Teoria & Intuição

### 📖 Leitura Rápida (Site Modules)
- [ ] **Optimization:** Loss Landscapes.
- [ ] **Calculus:** Local Minima vs Saddle Points.
- [ ] **Linear Algebra:** Eigenvalues & Eigenvectors.

### 📺 Vídeos (Intuição)
- [ ] **Weinberger Lec 12 (final):** condição de KKT e Newton-Lagrange.

### 📘 Livro (A Verdade)
- [ ] **[Boyd] Convex Optimization:** Capítulo 9.5 (Newton's Method) e 9.7 (Implementation).
    * *Missão:* responder à pergunta — *em que tipo de problema é que GD vanilla bate Adam?*

---

## 🛠️ 2. Prática (The Gym)
*Trabalha em `solutions/local.ipynb` (cópia local de `scaffolded.ipynb`).*

```bash
cp scaffolded.ipynb solutions/local.ipynb   # primeira vez
```

Tasks no notebook (todas com asserts):

| § | Task | Foco |
| - | ---- | ---- |
| §1.1 | Numerical gradient check | erro relativo entre analítico e numérico; deteta bugs no gradiente |
| §2.1 | Armijo backtracking line search | escolha automática de `α`; condição de redução suficiente |
| §3.1 | Nadam (Nesterov + Adam) | melhoria de Adam com lookahead Nesterov-style |
| §3.2 | Cosine LR scheduler | decaimento suave entre `lr_max` e `lr_min` |
| §4.1+4.2 | Showdown — 7 otimizadores em Rosenbrock | tabela final + curvas de convergência |
| §5.1 | Classificação de pontos críticos | min vs max vs saddle via eigenvalues da Hessiana |

---

## 💻 3. Projeto / Entrega

- Notebook completo com tabela do showdown
- (Opcional) Relatório curto em `solutions/relatorio.md` com tabela final e 2 conclusões empíricas

---

## ✅ 4. Definition of Done
*Sprint 1 só fecha se:*

- [ ] As tasks do `solutions/local.ipynb` correm sem `AssertionError`
- [ ] Sabes responder (sem ver):
  - [ ] Em que tipo de problema é que **GD vanilla bate Adam**? (Pista: bem-condicionado → não há bonus para adaptativos)
  - [ ] Qual o argumento intuitivo para o número de iterações ser linear no condition number $\kappa = \lambda_{\max}/\lambda_{\min}$ em GD
  - [ ] Se descobrires um ponto crítico onde a Hessiana tem um eigenvalue zero, o que isso significa? Como decides se é mínimo, máximo ou outra coisa?
- [ ] (Opcional) `solutions/relatorio.md` com tabela do showdown e 2 conclusões empíricas tuas

---

## 🔗 Próximo passo

→ Sprint 2 (Phase 1 final) — regressão linear/logística com regularização (Ridge, Lasso) + uma rede neural pequena from scratch. A álgebra que construíste em Sprint 1 é o combustível.
