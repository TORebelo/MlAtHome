# MlAtHome — Plano de Estudo (Refactor 2026-05)

> Diferente do `README.md` original (que é um roadmap PhD-style de 70 semanas até publicar paper). Aqui é **aprender ML a sério para fazer coisas, não para escrever papers**.

## Filosofia

- **Cobertura:** todos os tópicos do roadmap original ficam (FOM, generalização, linear models, DL, RL, GNNs, etc.). O que muda é **densidade**.
- **Library-first.** PyTorch + scikit-learn + transformers por defeito. From-scratch reservado para 4 conceitos load-bearing (ver lista abaixo).
- **Project/dataset-driven.** Cada sessão começa com pergunta concreta + dataset. Não com "ler ESL cap 7".
- **Math on-demand.** ESL, Goodfellow, Boyd como referência ao lado, não curriculum linear. Abrir capítulo X quando o projeto bater num conceito que precisa de profundidade.
- **Relatórios LaTeX** removidos como obrigação. Notas markdown chegam. (Re-introduzir só se quiseres carreira académica.)

## What stays from-scratch (load-bearing — 4 only)

Implementações from-scratch onde fazer **uma vez** dá intuição irrecuperável de outra forma:

1. **Gradient Descent + Newton** em 1D e 2D (`fase1`).
2. **MLP + backprop** em NumPy puro (`fase2`).
3. **Scaled Dot-Product Attention** + 1-head transformer encoder (`fase2`).
4. **REINFORCE policy gradient** + bandit em 1 ambiente (`fase3`).

Tudo o resto: **PyTorch / sklearn / HuggingFace**. Implementar Adam, ReLU, BatchNorm, ResNet, VAE encoder do zero adiciona 0 conhecimento útil — usa as libraries.

## Cuts vs roadmap original

| Item original | Decisão |
|---|---|
| Sprints 15-21 (Paper writing & submission, weeks 39-70) | **Cortado.** Esse é PhD path. Substituído por Fase 4 (Specialized + MLOps + Applied Portfolio). |
| Relatórios LaTeX por sprint | **Cortado.** Notas markdown chegam. |
| Implement 8 optimizers from scratch (Sprint 1) | **Substituído.** Implementa GD + Newton from scratch; o resto usa `torch.optim`. |
| 100 NumPy exercises por sprint | **Cortado da spine.** Faz se quiseres treinar interview-style (TensorTonic). |
| Sprint Opcionais A-E (Data Sci, Bayesian, Time Series, Data Eng, MLOps) | **Promovidos a integrados.** Dá-se o que importa para industry. |

## Cobertura por Fase

| Fase | Tópicos | Semanas | Pasta |
|------|---------|---------|-------|
| **1 — Fundamentos** | Optimization, generalização, linear models, high-dim/PCA | 8 | `fase1-fundamentos/` |
| **2 — Deep Learning** | MLP+backprop, CNN, attention/transformers, VAE/AE | 8 | `fase2-deep-learning/` |
| **3 — RL + Aplicado** | Bandits, Q-learning, PG/PPO, RL aplicado a finance/trading | 6 | `fase3-rl-aplicado/` |
| **4 — Especializadas + MLOps + Portfolio** | GNNs, evaluation rigorosa, MLOps, Bayesian/causal, applied portfolio | 6 | `fase4-especializadas-mlops/` |

**Total:** ~28 semanas (~6-7 meses a 6h/semana). Significativamente mais leve que as 70 originais, sem perder cobertura do que importa para industry.

## Convenção: Sprint 0 (on-ramp opcional)

Já existe em `Fase1_Foundation/Sprint00_StochasticThinking/` — **mantém-se como on-ramp**. Faz antes da Fase 1 se sentires que precisas de revisão de Monte Carlo / sampling / intervalos de confiança. NÃO uses cursos externos (Dataquest, etc.) para isto — o Sprint 0 já é exactamente o on-ramp certo.

## Template standard de sessão

Igual ao QuantHome:

```
### Sessão N — [pergunta concreta]

Build:        [o projeto/análise]
Dataset:      [MNIST, CIFAR-10, IMDB sentiment, Cartpole, dataset Kaggle X]
Reference:    [ESL cap X, Goodfellow cap Y]
              ↳ abrir só quando bater no problema
Deeper (opt): [paper Z — para ir mais a fundo]
Output:       [Sprint0X/notebooks/yy.ipynb + 1 plot + 1 nota]
```

## Estrutura de ficheiros

```
docs/study/
├── README.md                              ← este ficheiro
├── fase1-fundamentos/
│   ├── sprint01-optimization.md
│   ├── sprint02-generalization.md
│   ├── sprint03-linear-models.md
│   └── sprint04-high-dim-pca.md
├── fase2-deep-learning/
│   ├── sprint05-mlp-backprop.md
│   ├── sprint06-cnn-vision.md
│   ├── sprint07-attention-transformers.md
│   └── sprint08-vae-generative.md
├── fase3-rl-aplicado/
│   ├── sprint09-bandits-tabular.md
│   ├── sprint10-policy-gradient-ppo.md
│   └── sprint11-rl-finance-applied.md
├── fase4-especializadas-mlops/
│   ├── sprint12-gnn-graphs.md
│   ├── sprint13-evaluation-rigorous.md
│   ├── sprint14-mlops-deployment.md
│   └── sprint15-applied-portfolio.md
├── notas/
└── relatorios/
```

## Estado atual

- [ ] Sprint 0 (opcional) — Stochastic Thinking — já tens scaffold em `Fase1_Foundation/Sprint00_StochasticThinking/`
- [ ] **Fase 1** — Fundamentos
- [ ] **Fase 2** — Deep Learning
- [ ] **Fase 3** — RL + Aplicado
- [ ] **Fase 4** — Especializadas + MLOps + Applied Portfolio

## Bibliografia ao lado (PDFs recomendados)

**Core:**
- Hastie — *Elements of Statistical Learning* (ESL)
- Goodfellow — *Deep Learning*
- Sutton & Barto — *Reinforcement Learning*

**Aplicação:**
- Géron — *Hands-On ML with Scikit-Learn, Keras & TensorFlow*
- Stevens — *Deep Learning with PyTorch*
- Huyen — *Designing Machine Learning Systems* (MLOps)

**Math (referência on-demand):**
- Boyd — *Convex Optimization* (abrir cap 9 quando bater Newton)
- Bishop — *PRML* (alternativa a ESL para certos tópicos)
- McElreath — *Statistical Rethinking* (Bayesian)

> Para roadmap quant aplicado, ver projeto sister `QuantHome/`. A Fase 6 do QuantHome (`07_ml/`) usa o que aprenderes aqui aplicado a trading real.
