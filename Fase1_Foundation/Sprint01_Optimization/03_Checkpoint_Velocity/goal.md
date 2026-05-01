# 🚩 Checkpoint 03: Velocity (Momentum & Métodos de 1ª Ordem)
**Status:** ⚪ Por iniciar
**Objetivo:** Ver porque GD puro é lento, e adicionar-lhe três upgrades históricos (Momentum, Nesterov, AdaGrad). Aplicar tudo a uma regressão linear via gradient descent.

---

## 🧠 1. Teoria & Intuição

### 📖 Leitura Rápida (Site Modules)
- [ ] **Linear Algebra:** Projections & Least Squares (a matemática da Regressão).
- [ ] **Linear Algebra:** Positive Definite Matrices (o teste de convexidade).
- [ ] **Optimization:** Momentum & Nesterov Acceleration.

### 📺 Vídeos (Intuição)
- [ ] **Weinberger Lec 11 (Logistic), Lec 13 (Ridge), Lec 14-15 (SVM).**
    * *Foco:* problemas convexos clássicos onde GD/momento brilham.

### 📘 Livro (A Verdade)
- [ ] **[Boyd] Convex Optimization:** Capítulo 3 (Convex Functions), Capítulo 4 (Convex Problems).
    * *Missão:* responder à pergunta — *o que significa “gradiente Lipschitz” e onde aparece o $L$ na escolha de `lr`?*

---

## 🛠️ 2. Prática (The Gym)
*Trabalha em `solutions/local.ipynb` (cópia local de `scaffolded.ipynb`).*

```bash
cp scaffolded.ipynb solutions/local.ipynb   # primeira vez
```

Tasks no notebook (todas com asserts):

| § | Task | Foco |
| - | ---- | ---- |
| §1.1 | GD num vale alongado | $f(x,y) = (x^2 + 50 y^2)/2$; condição de estabilidade `lr < 2/α` |
| §1.2 | Visualizar zigzag | contour + trajetória; contar mudanças de sinal em y |
| §2.1 | Heavy-ball Momentum | `v = β·v + g; x = x - lr·v`; ver amortecer |
| §3.1 | Nesterov (NAG) | lookahead antes do passo; teorema $O(1/k^2)$ |
| §4.1 | AdaGrad | passo por-coordenada; sem oscilação no vale |
| §5.1 | Regressão linear via 4 métodos | gradiente do MSE em `(w, b)`; comparação de curvas |

---

## ✅ 3. Definition of Done
*Só avanças para o Checkpoint 04 se marcares tudo abaixo:*

- [ ] As tasks do `solutions/local.ipynb` correm sem `AssertionError`
- [ ] Sabes explicar (sem ver):
  - [ ] Por que momentum precisa que `β < 1`
  - [ ] O que significa "gradiente Lipschitz" e onde aparece o $L$ na escolha de `lr`
  - [ ] Por que AdaGrad **morre** em problemas de muitos passos (pista: $G$ é monotonamente crescente)
  - [ ] Porquê momentum/Nesterov com `β=0.9` e `lr` próximo do limite GD podem **divergir**
