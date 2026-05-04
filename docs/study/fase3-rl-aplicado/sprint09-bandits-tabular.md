# Sprint 9 — Bandits + Tabular RL (semanas 17-18)

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
