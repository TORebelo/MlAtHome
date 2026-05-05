# MlAtHome — Plano de Estudo (Refactor 2026-05)

> Diferente do `README.md` original (que é um roadmap PhD-style de 70 semanas até publicar paper). Aqui é **aprender ML a sério para fazer coisas, não para escrever papers**.

## Filosofia

- **Cobertura:** todos os tópicos do roadmap original ficam (FOM, generalização, linear models, DL, RL, GNNs, etc.). O que muda é **densidade**.
- **Library-first.** PyTorch + scikit-learn + transformers por defeito. From-scratch reservado para 4 conceitos load-bearing (ver lista abaixo).
- **Project/dataset-driven.** Cada sessão começa com pergunta concreta + dataset. Não com "ler ESL cap 7".
- **Math on-demand.** ESL, Goodfellow, Boyd como referência ao lado, não curriculum linear. Abrir capítulo X quando o projeto bater num conceito que precisa de profundidade.
- **Relatórios LaTeX** removidos como obrigação. Notas markdown chegam. (Re-introduzir só se quiseres carreira académica.)
- **Auto-contido.** Walkthroughs externos canónicos vivem dentro do repo (`Fase{N}_X/SprintY/external/{repo}/`) com atribuição completa. Único redireccionamento permitido: vídeos YouTube (`Video:`).

## What stays from-scratch (load-bearing — 4 only)

Implementações from-scratch onde fazer **uma vez** dá intuição irrecuperável de outra forma:

1. **Gradient Descent + Newton** em 1D e 2D (`fase1`, próprio).
2. **MLP + backprop** via Karpathy nn-zero-to-hero L1–L5 vendored (`fase2`, walkthrough canónico).
3. **Attention + GPT** via Karpathy L7+L8 vendored (`fase2`, walkthrough canónico).
4. **REINFORCE + bandit** em 1 ambiente (`fase3`, próprio com FareedKhan vendored como referência).

> Karpathy substitui re-implementação NumPy: é literalmente o exercício from-scratch melhor explicado que existe. Repetir = redundante.

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
| **3 — RL + Aplicado** | Bandits, Q-learning, PG/PPO, RL finance, AlphaZero/MuZero | 8 | `fase3-rl-aplicado/` |
| **4 — Especializadas + MLOps + Portfolio** | GNNs, evaluation rigorosa, MLOps, Bayesian/causal, applied portfolio | 6 | `fase4-especializadas-mlops/` |
| **5 — LLM/Agents** | LLM internals, RAG fund/avançado, Agents, Multi-agent, Agentic RAG, Fine-tuning, MCP/A2A | 8 | `fase5-llm-agents/` |

**Total:** ~38 semanas (~9 meses a 6h/semana). Acréscimo: Sprint 11.5 (AlphaZero/MuZero) + Fase 5 (8 sprints LLM/Agents).

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
│   ├── sprint10-policy-gradient.md
│   ├── sprint11-rl-finance.md
│   └── sprint11.5-alphazero-muzero.md
├── fase4-especializadas-mlops/
│   ├── sprint12-gnn-graphs.md
│   ├── sprint13-evaluation.md
│   ├── sprint14-mlops-deployment.md
│   └── sprint15-applied-portfolio.md
├── fase5-llm-agents/
│   ├── sprint16-llm-internals.md
│   ├── sprint17-rag-fundamentals.md
│   ├── sprint18-rag-advanced.md
│   ├── sprint19-agents-fundamentals.md
│   ├── sprint20-multi-agent.md
│   ├── sprint21-agentic-rag-production.md
│   ├── sprint22-fine-tuning.md
│   └── sprint23-mcp-a2a.md
├── notas/
└── relatorios/
```

## Estado atual

- [ ] Sprint 0 (opcional) — Stochastic Thinking — já tens scaffold em `Fase1_Foundation/Sprint00_StochasticThinking/`
- [ ] **Fase 1** — Fundamentos
- [ ] **Fase 2** — Deep Learning
- [ ] **Fase 3** — RL + Aplicado
- [ ] **Fase 4** — Especializadas + MLOps + Applied Portfolio
- [ ] **Fase 5** — LLM/Agents

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
- Deisenroth/Faisal/Ong — *Mathematics for Machine Learning* (PDF gratuito + 3 notebooks de tutorial em https://github.com/mml-book/mml-book.github.io/tree/master/tutorials)
- Boyd — *Convex Optimization* (abrir cap 9 quando bater Newton)
- Bishop — *PRML* (alternativa a ESL para certos tópicos)
- McElreath — *Statistical Rethinking* (Bayesian)

**LLM/Agents (Fase 5):**
- Alammar/Grootendorst — *Hands-On Large Language Models* (notebooks Colab vendored em Fase 5; livro O'Reilly opcional)

> Para roadmap quant aplicado, ver projeto sister `QuantHome/`. A Fase 6 do QuantHome (`07_ml/`) usa o que aprenderes aqui aplicado a trading real.

## External walkthroughs absorbed

Repos vendored com atribuição completa em `Fase{N}_X/Sprint0Y/external/{repo}/`. Snapshot frozen, atualização manual.

| Repo | Vendored em | Cobre |
|---|---|---|
| Karpathy nn-zero-to-hero | Sprint 5, 7 | MLP+backprop, GPT from scratch, BPE |
| labmlai annotated DL papers | Sprint 8, 10 | Diffusion (DDPM/DDIM/SD), PPO ref |
| FareedKhan all-rl-algorithms | Sprint 9, 10 | 18 RL algos didáticos (A2C, A3C, TRPO, SAC, MADDPG) |
| CleanRL | Sprint 10 | Single-file PPO, SAC, DDPG, TD3 (production-grade) |
| OpenAI Spinning Up | Sprint 9 | VPG docs + code, theoretical anchor |
| AI4Finance FinRL | Sprint 11 | RL applied to trading (quickstart + 1 strategy) |
| werner-duvaud muzero-general | Sprint 11.5 | AlphaZero + MuZero unified |
| Made with ML | Sprint 13, 14, 15 | MLOps end-to-end (Ray + MLflow + FastAPI + GH Actions) |
| Hands-On LLMs | Sprint 16, 22 | Tokenization, embeddings, fine-tuning (LoRA/QLoRA/DPO) |
| NirDiamant RAG_Techniques | Sprint 17, 18, 21 | Foundational + advanced RAG (~12 técnicas; non-commercial license) |
| NirDiamant GenAI_Agents | Sprint 19, 20, 21 | Agents fundamentals + multi-agent + agentic RAG (non-commercial license) |
| Microsoft ai-agents-for-beginners | Sprint 23 | MCP/A2A/MAF (lessons 11+14) |

## Reference shelf (não vendored, link only)

- mml-book/mml-book.github.io — `tutorials/{linear_regression,pca}.{ipynb,solution.ipynb}` para Sprints 3+4 (vendor blocked: no LICENSE in upstream)
- TheAlgorithms/Python — `Deeper:` opcional para SMO, K-means, t-SNE
- dair-ai/Prompt-Engineering-Guide — leitura ReAct/Tool Use 2h antes de Sprint 19
- academic/awesome-datascience — descoberta lateral de tools
- keon/awesome-nlp — libs PT-específicas, multilingual
