# Sprint 1 — Optimization (Fundamentos)

> **Fase 1** · 2 semanas · pasta de output: `Fase1_Foundation/Sprint01_Optimization/`

**O que sai daqui:** intuição matemática + código para Gradient Descent, Newton, e os otimizadores que vais usar todos os dias em DL (Adam, SGD-Momentum). Implementas GD/Newton from-scratch (load-bearing — uma vez); usas o resto via `torch.optim`.

---

## Semana 1 — Gradient Descent intuição + implementação

### Sessão 1 — *"Como é que a derivada me diz para onde minimizar uma função? Vamos descer um vale 1D."*

**Build:** GD 1D from-scratch:
1. Função: `f(x) = x² + sin(5x)` (não-convexa).
2. Implementar GD com learning rate variável.
3. Visualizar trajectória sobre o gráfico da função.
4. Mostrar comportamento com lr muito grande / pequeno.

**Reference:** Boyd cap 9.1-9.3 (gradient descent). Karpathy: *micrograd* (intuição visual).

**Slides (intuição):** [DLS C2_W2 — Optimization algorithms](resources/slides/DLS/DLS_C2/C2_W2.pdf) (Andrew Ng). Mini-batch, momentum, RMSProp, Adam — vê antes de implementar para teres o mental model.

**Output:** `Fase1_Foundation/Sprint01_Optimization/01_gd_1d.py` + 3 plots (lr pequeno/médio/grande).

- [ ] Sessão 1

### Sessão 2 — *"E em 2D, com função quadrática? Visualizar contornos."*

**Build:** GD 2D em `f(x, y) = x² + 10y²` (mal-condicionada):
1. Plotar contornos.
2. Sobrepor trajectória de GD.
3. Mostrar o zigzag típico de funções mal-condicionadas.
4. Repetir com `Momentum`: `v ← βv - η∇f`. Mostrar suavização.

**Reference:** Sutskever et al. (2013) — *On the importance of initialization and momentum*. Distill.pub: *Why Momentum Really Works*.

**Output:** `02_gd_2d_momentum.py` + plot comparativo (vanilla vs momentum).

- [ ] Sessão 2

### Sessão 3 — *"Newton's method usa segunda derivada e converge muito mais rápido. Quando usar?"*

**Build:** Newton 2D from-scratch:
1. `x_{k+1} = x_k - H^{-1} ∇f(x_k)`.
2. Comparar convergência GD vs Newton em quadrática.
3. Mostrar convergência quadrática vs linear (gráfico log-erro vs iter).
4. Discutir custo computacional do Hessiano em dim alta.

**Reference:** Boyd cap 9.5 (Newton's method). Numerical Recipes cap 10.

**Output:** `03_newton_2d.py` + 1 plot (convergência log-log GD vs Newton).

- [ ] Sessão 3

### Sessão 4 — *"E se eu não consigo calcular o Hessiano? Quasi-Newton (BFGS)."*

**Build:** usar `scipy.optimize.minimize` com BFGS e L-BFGS. Comparar com GD/Newton em problema teste (Rosenbrock). Tabela: iterations, time, final error.

**Reference:** Nocedal & Wright — *Numerical Optimization* cap 6.

**Output:** `04_quasi_newton.py` + tabela comparativa.

- [ ] Sessão 4

---

## Semana 2 — DL optimizers (PyTorch + uma comparação honesta)

### Sessão 1 — *"Adam é o default em DL. O que faz exactamente?"*

**Build:** **NÃO** implementar Adam from-scratch. Usar `torch.optim.Adam`:
1. Treinar regressão linear com SGD, SGD+Momentum, RMSProp, Adam, AdamW.
2. Plotar loss curves.
3. Para cada optimizer, ler `torch.optim` source code (link na docs) — escrever 1-página de notas explicando o que cada um faz por cima do GD vanilla.

**Reference:** Kingma & Ba (2014) — Adam paper (curto e claro). Loshchilov & Hutter (2019) — AdamW.

**Output:** `05_optimizers_pytorch.py` + `notas/optimizers.md`.

- [ ] Sessão 1

### Sessão 2 — *"Learning rate scheduling. Cosine, warmup, OneCycle. Mostra-me a diferença."*

**Build:** treinar MNIST (MLP simples PyTorch) com 3 schedulers diferentes:
1. Constant lr.
2. Cosine annealing.
3. OneCycleLR.

Plotar lr ao longo do treino + loss/accuracy.

**Reference:** Smith (2018) — *Super-convergence* (OneCycle). PyTorch docs `lr_scheduler`.

**Output:** `06_lr_scheduling.py` + plots.

- [ ] Sessão 2

### Sessão 3 — *"Showdown final: 5 optimizers em Rosenbrock (não-convexo, ill-conditioned)."*

**Build:** correr SGD, Momentum, Adam, AdamW, L-BFGS no Rosenbrock. Comparar trajectórias 2D + tempo de convergência.

**Reference:** Choi et al. (2019) — *On Empirical Comparisons of Optimizers for Deep Learning*.

**Output:** `07_rosenbrock_showdown.py` + plot comparativo (5 trajectórias sobre contornos).

- [ ] Sessão 3

### Sessão 4 — *"Loss landscape: porque é que minima largos generalizam melhor?"*

**Build:** visualização da loss landscape de uma rede pequena treinada em MNIST:
1. Treinar 2 redes — uma com SGD, outra com Adam.
2. Plotar loss landscape ao longo de uma linha entre `θ_init` e `θ_final` (filter normalization, Li et al. 2018).
3. Comparar curvatura visual.

**Reference:** Li et al. (2018) — *Visualizing the Loss Landscape of Neural Nets*.

**Output:** `08_loss_landscape.py` + 1 plot.

- [ ] Sessão 4

---

## Entrega Sprint 1

`docs/study/notas/sprint01-resumo.md`:

**Pergunta-teste:** "Em 1 minuto: porque é que Adam costuma funcionar melhor que SGD em DL, e em que casos é que SGD vence?"

- [ ] Resumo escrito.

## Bibliografia consultada (referência)

- Boyd & Vandenberghe — *Convex Optimization* cap 9
- Kingma & Ba (2014) — Adam paper
- Distill.pub: "Why Momentum Really Works"
- Karpathy: micrograd YouTube series (intuição)
