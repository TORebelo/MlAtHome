# Sprint 11 — RL Aplicado a Finance (semanas 21-22)

**Pergunta nuclear:** *"RL para portfolio allocation funciona? Vamos ser honestos."*

1. **Trading environment.** Build: gym-compatible environment para single-asset trading. State: returns lag + indicadores. Action: long/flat/short. Reward: P&L com costs. Output: `01_trading_env.py`. Reference: Liu et al. — *FinRL*.
2. **DQN trading agent.** Build: DQN sobre o env. Comparar com buy-and-hold em SPY 2015-2020 (train) e 2021-2024 (test). Output: `02_dqn_trader.py`.
3. **PPO portfolio allocation.** Build: PPO a alocar entre 5 ETFs. State: features de cada ETF. Action: weights normalized. Output: `03_ppo_portfolio.py`.
4. **Honest backtesting do RL agent.** Build: aplicar walk-forward + transaction costs realistas (Fase 4 do QuantHome). Mostrar que muitas vezes RL **não bate** baseline simples. Output: `04_rl_honest.py`.
5. **Bandit para regime selection.** Build: bandit que escolhe entre 3 estratégias diferentes (trend / mean-rev / B&H) baseado em regime detected. Output: `05_bandit_regimes.py`.
6. **Failure analysis.** Build: análise qualitativa — quando o RL agent falha catastroficamente? Plot equity curve com episode highlights. Output: `06_failure_analysis.py`.
7. **Imitation learning.** Build: behavior cloning de uma estratégia rule-based. Mostrar que IL é bom para warm-start. Output: `07_imitation.py`.
8. **Final report.** Build: relatório markdown comparando RL vs baselines em 3 universos. Honestidade brutal sobre limitações. Output: `relatorios/rl-finance-survey.md`.

**Reference:** Liu et al. — *FinRL*. Pricope (2021) — *Deep RL for Algorithmic Trading: A Survey*. López de Prado para rigor estatístico.

> **Aviso:** muitos papers de "RL for trading" têm metodologia frágil (overfitting, lookahead, costs irrealistas). Faz tudo com walk-forward + costs > 5bps. Se a tua estratégia precisa de < 1bp para ser lucrativa, é noise.

**Entrega Sprint 11 + Fase 3:**
- `notas/sprint11-resumo.md`.
- `notas/fase3-retrospectiva.md`.
