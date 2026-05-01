# 🚩 Checkpoint 02: The Geometry (A Geometria)
**Status:** ⚪ Por iniciar
**Objetivo:** Sair do 1D. Construir a álgebra das matrizes, ver a paisagem do erro em 2D, e aprender o conceito que governa toda a otimização: **convexidade**.

---

## 🧠 1. Teoria & Intuição

### 📖 Leitura Rápida (Site Modules)
- [ ] **Linear Algebra:** Matrix Multiplication & Tensor Ops.
- [ ] **Linear Algebra:** Determinants & Matrix Inverses.
- [ ] **Linear Algebra:** Orthogonality & Basis Vectors.
- [ ] **Optimization:** Convex vs Non-Convex Optimization.

### 📺 Vídeos (Intuição)
- [ ] **Weinberger Lec 3 (KNN):** porque é que distâncias importam.
- [ ] **Weinberger Lec 4-5:** perceptron e a primeira fronteira de decisão.

### 📘 Livro (A Verdade)
- [ ] **[Boyd] Convex Optimization:** Capítulo 2 (resto de Convex Sets).
    * *Missão:* responder à pergunta-âncora — *qual é o teste-relâmpago para saberes se um conjunto é convexo?*

---

## 🛠️ 2. Prática (The Gym)
*Trabalha em `solutions/local.ipynb` (cópia local de `scaffolded.ipynb`).*

```bash
cp scaffolded.ipynb solutions/local.ipynb   # primeira vez
```

Tasks no notebook (todas com asserts):

| § | Task | Foco |
| - | ---- | ---- |
| §1.1 | Transposta (manual + numpy) | troca linha↔coluna; (Aᵀ)ᵀ = A |
| §1.2 | Multiplicação de matrizes | triplo loop manual + `@`; (AB)ᵀ = BᵀAᵀ |
| §1.3 | Diagonal e identidade | base do traço, da inversão, do PCA |
| §2.1 | MSE manual e vectorizado | a perda que vais minimizar com GD/Newton/Adam |
| §2.2 | Paisagem MSE em 2D | contour plot de `L(w, b)` para regressão linear; ver o parabolóide convexo |
| §3.1 | Combinação convexa | `θx + (1-θ)y` com `θ ∈ [0,1]` |
| §3.2 | Disco vs anel | dois conjuntos visualizados; só um é convexo (e descobres porquê) |

---

## ✅ 3. Definition of Done
*Só avanças para o Checkpoint 03 se marcares tudo abaixo:*

- [ ] As tasks do `solutions/local.ipynb` correm sem `AssertionError`
- [ ] Sabes explicar (sem ver):
  - [ ] Por que é que `(AB)ᵀ = BᵀAᵀ` (e não `AᵀBᵀ`)
  - [ ] Quando é que `AB = BA` — comutatividade matricial é a regra ou a exceção?
  - [ ] O teste de uma linha para verificar se um conjunto é convexo
  - [ ] Por que a paisagem MSE da regressão linear é sempre convexa
