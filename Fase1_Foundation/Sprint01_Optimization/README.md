# 🚩 Sprint 1 — Convex Optimization

**Status:** ⚪ Por iniciar
**Duração estimada:** 12-20h (3-5 semanas a 1h/dia)
**Pré-requisito:** Sprint 0 (Stochastic Thinking) ou conhecimento equivalente em NumPy + estatística básica.

---

## 🎯 Objetivo

Construir, do zero em NumPy puro, todo o tronco da otimização contínua que sustenta o ML moderno: gradient descent (1D e nD), momentum, Nesterov, AdaGrad, RMSProp, Adam, AdamW, Nadam, e Newton com line search. Aplicar a regressão linear e a um benchmark canónico (Rosenbrock).

No fim deste sprint deves saber:

- Como GD chega ao mínimo, e em que condições **diverge**
- Por que existe um trade-off entre 1ª e 2ª ordem (Newton vs adaptativos)
- Como verificar se o teu gradiente analítico está certo (gradient check)
- Como escolher `α` automaticamente (Armijo line search)
- Quando momentum/Adam **não** ajudam (problemas bem-condicionados)
- Como classificar pontos críticos via eigenvalues da Hessiana

---

## 📚 Filosofia: Companion ao Boyd + Weinberger

Este sprint **não reinventa** a teoria. Apoia-se em:

- **[Boyd & Vandenberghe — *Convex Optimization*](https://web.stanford.edu/~boyd/cvxbook/)** (Cap 2-4, 9). PDF gratuito.
- **Cornell Weinberger Machine Learning Lectures** (Lec 1-15) — disponível em YouTube.

Cada checkpoint tem leituras curtas (2-4 secções por CP) e o `scaffolded.ipynb` dá-te os hands-on para cada conceito.

---

## 🗺️ Estrutura

```
Sprint01_Optimization/
├── README.md                      ← este ficheiro
├── Sprint1_tasklist.md            ← versão original em bullets
├── 01_Checkpoint_Engine/          ← Vetores, GD 1D
│   ├── goal.md
│   ├── scaffolded.ipynb
│   ├── notes_boyd.md
│   ├── solutions/                 (cópia local — gitignored)
│   └── Lecture *.pdf              (Weinberger PDFs)
├── 02_Checkpoint_Geometry/        ← Matrizes, MSE landscape, conjuntos convexos
├── 03_Checkpoint_Velocity/        ← Momentum, Nesterov, AdaGrad
├── 04_Checkpoint_Newton/          ← Hessiana, Newton+line search, RMSProp, Adam, AdamW
└── 05_Checkpoint_Showdown/        ← Capstone: gradient check, Armijo, Nadam, eigenvalue classification
```

| CP | Tema | Tasks | Boyd | Weinberger |
| -- | ---- | ----- | ---- | ---------- |
| 01 | Vetores, GD 1D | 8 | 2.1 | 1, 2, 12 (parte 1) |
| 02 | Matrizes, convexidade | 7 | 2 | 3, 4, 5 |
| 03 | Momentum, NAG, AdaGrad | 7 | 3, 4 | 11, 13, 14, 15 |
| 04 | Newton, Adam, AdamW | 8 | 9 | 6, 12 |
| 05 | Showdown capstone | 8 | 9.5, 9.7 | 12 (final) |

---

## 🧠 Como trabalhar

**Loop diário (~30-60 min):**

1. Lê 1 secção curta do Boyd (~3 páginas) ou vê 1 aula Weinberger (a 1.5x).
2. Abre `solutions/local.ipynb` na secção correspondente.
3. Preenche o próximo `# TODO`.
4. Corre a célula → lê a `assert` → corrige até passar.
5. Avança para a próxima task.

**Setup pela primeira vez em cada checkpoint:**

```bash
cp scaffolded.ipynb solutions/local.ipynb
```

Trabalha em `solutions/local.ipynb` (gitignored). O `scaffolded.ipynb` é a tua referência limpa — não o edites.

---

## ✅ Definition of Done

Só avanças para o Sprint 2 (Phase 1 final) se:

- [ ] Os 5 checkpoints fechados (todas as asserts passam em cada `solutions/local.ipynb`)
- [ ] Sabes responder (sem ver):
  - [ ] Diferença geométrica entre GD e Newton (CP01)
  - [ ] Teste de uma linha para verificar convexidade (CP02)
  - [ ] Por que `momentum` precisa que `β < 1` e o que é "gradiente Lipschitz" (CP03)
  - [ ] Por que Newton converge em 1 passo na quadrática; custo $O(d^3)$ vs Adam $O(d)$ (CP04)
  - [ ] Em que tipo de problema é que GD vanilla bate Adam (CP05)
- [ ] (Opcional) Relatório de 1 página em `05_Checkpoint_Showdown/solutions/relatorio.md` com a tabela do showdown e 2 conclusões empíricas

---

## 📦 Bibliografia complementar (opcional)

Só para aprofundar:

- **Goodfellow, Bengio & Courville — *Deep Learning Book*** Cap 4 (Numerical Computation), Cap 8 (Optimization for Training Deep Models). PDF online.
- **Bertsekas — *Nonlinear Programming***. Bíblia da otimização clássica, capítulos 1-2 cobrem GD/Newton com rigor.
- **Nocedal & Wright — *Numerical Optimization***. Para BFGS/L-BFGS e métodos quasi-Newton.

---

## 🔗 Próximo passo

→ Sprint 2 (TBD) — Regressão linear/logística com regularização, primeira rede neural from scratch. A maquinaria de otimização deste Sprint 1 vai treinar todos os modelos de Sprint 2.
