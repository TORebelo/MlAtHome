# 🚩 Checkpoint 04: Newton & Heavy Artillery (2ª Ordem + Adaptativos)
**Status:** ⚪ Por iniciar
**Objetivo:** Sair das primeiras derivadas. Construir gradiente e Hessiana numericamente, implementar Newton com line search, e os otimizadores adaptativos modernos (RMSProp, Adam, AdamW).

---

## 🧠 1. Teoria & Intuição

### 📖 Leitura Rápida (Site Modules)
- [ ] **Calculus:** Matrix Calculus (derivar vetores em relação a vetores).
- [ ] **Calculus:** Jacobian and Hessian Matrices.
- [ ] **Optimization:** Adaptive Learning Rate Methods (Adam e amigos).
- [ ] **Optimization:** Newton's Method.

### 📺 Vídeos (Intuição)
- [ ] **Weinberger Lec 6 (Proof):** convergência de descent methods.
- [ ] **Weinberger Lec 12 (Newton):** porque é que Newton é uma "rotação" do gradiente para coordenadas onde a Hessiana é a identidade.

### 📘 Livro (A Verdade)
- [ ] **[Boyd] Convex Optimization:** Capítulo 9 (Unconstrained Minimization, especialmente 9.5 Newton's Method).
    * *Missão:* responder à pergunta — *porque é que Newton converge em 1 passo numa quadrática?*

---

## 🛠️ 2. Prática (The Gym)
*Trabalha em `solutions/local.ipynb` (cópia local de `scaffolded.ipynb`).*

```bash
cp scaffolded.ipynb solutions/local.ipynb   # primeira vez
```

Tasks no notebook (todas com asserts):

| § | Task | Foco |
| - | ---- | ---- |
| §1.1 | Gradiente numérico (central diff) | base para verificar gradientes analíticos em qualquer projeto |
| §2.1 | Hessiana numérica | matriz simétrica, definida positiva em mínimos convexos |
| §3.1 | Newton em 1 passo (quadrática) | $p = -H^{-1} g$ resolve quadrática num passo |
| §3.2 | Damped Newton + line search em Rosenbrock | safeguard com backtracking; bate GD por ordens de magnitude |
| §4.1 | RMSProp | média móvel exponencial de $g^2$; fix ao "morrer" do AdaGrad |
| §5.1 | Adam | momentum + RMSProp + bias correction; default da indústria |
| §6.1 | AdamW | weight decay desacoplado; padrão dos transformers modernos |

---

## ✅ 3. Definition of Done
*Só avanças para o Checkpoint 05 se marcares tudo abaixo:*

- [ ] As tasks do `solutions/local.ipynb` correm sem `AssertionError`
- [ ] Sabes explicar (sem ver):
  - [ ] Por que Newton converge em 1 passo numa quadrática
  - [ ] Custo do passo de Newton em $\mathbb{R}^d$ — e como Adam/RMSProp evitam o $O(d^3)$
  - [ ] Diferença entre Adam e AdamW; quando importa
  - [ ] Para que serve o **bias correction** de Adam nos primeiros passos
