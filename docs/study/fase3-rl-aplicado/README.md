# Fase 3 — Reinforcement Learning + Aplicado

> 3 sprints, 6 semanas. From-scratch só para **REINFORCE** (Sprint 10 — load-bearing). PPO e DQN via `stable-baselines3`. Foco em compreensão + aplicação prática a finance/trading.

**Pasta de output:** `Fase3_RL/Sprint0X_Y/`.

---

## Sprint 9 — Bandits + Tabular RL (semanas 17-18)

**Pergunta nuclear:** *"Antes de neural networks, como é que um agente RL aprende? Tabular methods em ambientes pequenos."*

1. **Multi-armed bandit.** Build: ε-greedy, UCB1, Thompson sampling. Comparar regret em 10-armed bandit. Output: `01_bandits.py`. Reference: Sutton & Barto cap 2.
2. **Markov Decision Process intuição.** Build: implementar GridWorld 4x4. Value iteration manual. Plotar value function. Output: `02_mdp_gridworld.py`. Reference: Sutton & Barto cap 3-4.
3. **Q-learning tabular.** Build: Q-learning em FrozenLake (`gymnasium`). Plotar Q-table aprendida. Output: `03_qlearning.py`. Reference: Sutton & Barto cap 6.
4. **SARSA vs Q-learning.** Build: comparar on-policy (SARSA) vs off-policy (Q-learning) em Cliff Walking — mostrar que SARSA aprende safer policy. Output: `04_sarsa_qlearning.py`. Reference: Sutton & Barto cap 6.
5. **Monte Carlo control.** Build: MC com exploring starts em Blackjack. Output: `05_mc_blackjack.py`. Reference: Sutton & Barto cap 5.
6. **Eligibility traces (TD(λ)).** Build: TD(λ) em random walk. Comparar com TD(0) e MC. Output: `06_td_lambda.py`. Reference: Sutton & Barto cap 12.
7. **Function approximation linear.** Build: Q-learning com linear FA em MountainCar. Mostrar generalização vs tabular. Output: `07_linear_fa.py`. Reference: Sutton & Barto cap 9-10.
8. **Tabular wrap-up.** Build: comparativo de 5 algoritmos em CartPole-v1 (discretizado). Output: `08_tabular_summary.py`.

**Reference:** Sutton & Barto — *Reinforcement Learning* caps 1-12 (open-source: incompleteideas.net/book).

**Entrega:** `notas/sprint09-resumo.md` — pergunta-teste: "Diferença entre on-policy e off-policy em 1 minuto."

---

## Sprint 10 — Deep RL: Policy Gradient + PPO (semanas 19-20)

**Pergunta nuclear:** *"Quando o state space é contínuo ou enorme, neural networks substituem Q-tables. Policy gradient é a base."*

### Semana 1 — REINFORCE from-scratch (load-bearing)

1. **Derivação do Policy Gradient Theorem.** Build: derivação à mão em markdown. Output: `notas/policy-gradient-derivation.md`. Reference: Sutton & Barto cap 13. Williams (1992) — REINFORCE original.
2. **REINFORCE NumPy + PyTorch híbrido.** Build: REINFORCE com baseline em CartPole. NumPy para a derivação inicial, PyTorch para autodiff. Output: `01_reinforce.py`.
3. **Variance reduction com baseline.** Build: comparar REINFORCE com/sem baseline (value function). Mostrar redução de variância. Output: `02_baseline.py`.
4. **Actor-Critic.** Build: A2C em CartPole. Output: `03_a2c.py`. Reference: Mnih et al. (2016) — A3C.

### Semana 2 — PPO + DQN (libraries)

1. **DQN.** Build: usar `stable-baselines3` DQN em LunarLander. Tunar hyperparameters via Optuna. Output: `04_dqn_sb3.py`. Reference: Mnih et al. (2015) — DQN paper.
2. **PPO.** Build: `stable-baselines3` PPO em LunarLander e BipedalWalker. Output: `05_ppo_sb3.py`. Reference: Schulman et al. (2017) — PPO paper.
3. **PPO clipping intuição.** Build: implementar clipping manualmente em mini-PPO PyTorch (sem libraries). Mostrar curva da clipped objective. Output: `06_ppo_clip.py`.
4. **SAC para continuous control.** Build: `stable-baselines3` SAC em Pendulum. Output: `07_sac.py`. Reference: Haarnoja et al. (2018).
5. **Comparativo final.** Build: tabela A2C vs PPO vs SAC vs DQN em 4 ambientes (CartPole, LunarLander, BipedalWalker, Pendulum). Output: `08_comparativo.py`.

**Reference:** OpenAI Spinning Up (gratuito, excelente). Sutton & Barto cap 13. Schulman thesis.

**Entrega:** `notas/sprint10-resumo.md`.

---

## Sprint 11 — RL Aplicado a Finance (semanas 21-22)

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

---

## Bibliografia da Fase 3

- Sutton & Barto — *Reinforcement Learning* (referência core, gratuita)
- OpenAI Spinning Up (gratuito, excelente para policy gradient)
- David Silver Lectures (UCL course, YouTube)
- Liu et al. — FinRL papers
- Schulman, Mnih et al. — papers fundacionais (PPO, DQN, A3C)
