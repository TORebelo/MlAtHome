# Sprint 10 — Deep RL: Policy Gradient + PPO (semanas 19-20)

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
