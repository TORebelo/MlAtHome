# Sprint 11 — RL Aplicado a Finance (semanas 21-22)

**Pergunta nuclear:** *"RL para portfolio allocation funciona? Vamos ser honestos."*

> Sprint walkthrough-augmented. AI4Finance FinRL está vendored — env Gym financeiros (`finrl/meta/env_*`), aplicações end-to-end (`finrl/applications/`), pipeline pedagógico em 3 ficheiros (`examples/FinRL_StockTrading_2026_{1_data,2_train,3_Backtest}.py`), e o demo de portfolio optimization em notebook. Sessões de honesty/walk-forward/imitation são próprias.

### Sessão 1 — Trading environment

Build:        Estudar o `env_stocktrading.py` da FinRL (gym-compatible). Compreender state (returns lag + indicadores), action (long/flat/short ou pesos), reward (P&L com transaction costs). Adaptar para single-asset trading próprio em SPY. Pipeline data → env via `FinRL_StockTrading_2026_1_data.py`.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/finrl/meta/env_stock_trading/env_stocktrading.py
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/examples/FinRL_StockTrading_2026_1_data.py
Reference:    Liu et al. — *FinRL: A Deep Reinforcement Learning Library for Automated Stock Trading* (arXiv 2011.09607). FinRL README vendored.
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/01_trading_env.ipynb

### Sessão 2 — DQN trading agent

Build:        DQN sobre o env. Treinar em SPY 2015-2020, testar em 2021-2024. Comparar com buy-and-hold. Usar o pipeline `FinRL_StockTrading_2026_2_train.py` como referência para train loop.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/examples/FinRL_StockTrading_2026_2_train.py
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/finrl/applications/stock_trading/stock_trading.py
Reference:    Mnih et al. (2015) — DQN. Liu et al. — FinRL paper.
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/02_dqn_trader.ipynb

### Sessão 3 — PPO portfolio allocation

Build:        PPO a alocar entre 5 ETFs. State: features de cada ETF. Action: weights normalized (softmax). Estudar o env de portfolio optimization da FinRL e o demo notebook.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/finrl/meta/env_portfolio_allocation/env_portfolio.py
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/examples/FinRL_PortfolioOptimizationEnv_Demo.ipynb
Reference:    Jiang et al. (2017) — *A Deep RL Framework for the Financial Portfolio Management Problem*.
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/03_ppo_portfolio.ipynb

### Sessão 4 — Honest backtesting do RL agent

Build:        Aplicar walk-forward + transaction costs realistas (>5bps + slippage) ao agent treinado na Sessão 2. Mostrar onde o RL agent **não bate** buy-and-hold quando metodologia é honesta. Usar o backtest pipeline da FinRL como ponto de partida e estender com walk-forward próprio.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/examples/FinRL_StockTrading_2026_3_Backtest.py
Reference:    López de Prado — *Advances in Financial Machine Learning* cap 7 (cross-validation in finance). Pricope (2021) — *Deep RL for Algorithmic Trading: A Survey* (problemas de overfitting).
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/04_rl_honest.ipynb

### Sessão 5 — Ensemble + regime selection

Build:        Bandit que escolhe entre 3 estratégias (trend / mean-rev / B&H) baseado em regime detectado. Inspeccionar a abordagem ensemble da FinRL como referência (3 agentes + scoring). Usar o conceito mas simplificado.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/examples/FinRL_Ensemble_StockTrading_ICAIF_2020.ipynb
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/finrl/applications/stock_trading/ensemble_stock_trading.py
Reference:    Yang et al. (2020) — *Deep RL for Automated Stock Trading: An Ensemble Strategy* (ICAIF).
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/05_ensemble_regimes.ipynb

### Sessão 6 — Failure analysis

Build:        Análise qualitativa — quando o RL agent falha catastroficamente? Plot equity curve com episode highlights, drawdowns máximos, períodos onde a policy explode.
Output:       06_failure_analysis.py

### Sessão 7 — Imitation learning

Build:        Behavior cloning de uma estratégia rule-based (e.g. simple momentum) para warm-start. Mostrar que IL acelera convergência do RL agent.
Walkthrough:  ../../../Fase3_RL/Sprint11_RLFinance/external/ai4finance-finrl/finrl/applications/imitation_learning/Imitation_Sandbox.ipynb
Reference:    Ho & Ermon (2016) — GAIL. Ross et al. (2011) — DAgger.
Source:       https://github.com/AI4Finance-Foundation/FinRL
Output:       Fase3_RL/Sprint11_RLFinance/notebooks/07_imitation.ipynb

### Sessão 8 — Final report

Build:        Relatório markdown comparando RL vs baselines em 3 universos (US large-cap, ETFs sector rotation, crypto top-10). Honestidade brutal sobre limitações: lookahead, costs, regime-shift, sample-size.
Output:       relatorios/rl-finance-survey.md

**Reference:** Liu et al. — *FinRL*. Yang et al. — Ensemble strategy. Pricope (2021) — *Deep RL for Algorithmic Trading: A Survey*. López de Prado para rigor estatístico.

> **Aviso:** muitos papers de "RL for trading" têm metodologia frágil (overfitting, lookahead, costs irrealistas). Faz tudo com walk-forward + costs > 5bps. Se a tua estratégia precisa de < 1bp para ser lucrativa, é noise.

**Entrega Sprint 11 + Fase 3:**
- `notas/sprint11-resumo.md` — pergunta-teste: "Quando é que o RL trader **vence** o buy-and-hold com costs realistas? E quando é que perde?"
- `notas/fase3-retrospectiva.md`.
