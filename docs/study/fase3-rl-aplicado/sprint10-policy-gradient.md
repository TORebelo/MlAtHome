# Sprint 10 — Deep RL: Policy Gradient + PPO (semanas 19-20)

**Pergunta nuclear:** *"Quando o state space é contínuo ou enorme, neural networks substituem Q-tables. Policy gradient é a base — e PPO é o cavalo de batalha."*

> Sprint walkthrough-augmented. CleanRL (single-file production-grade), FareedKhan all-rl-algorithms (didáticos), e labmlai annotated-dl (PPO + GAE de referência) estão vendored. REINFORCE continua load-bearing from-scratch (única reimplementação). Tudo o resto lê código vendored e adapta.

### Semana 1 — REINFORCE from-scratch (load-bearing)

1. **Derivação do Policy Gradient Theorem.** Build: derivação à mão em markdown. Output: `notas/policy-gradient-derivation.md`. Reference: Sutton & Barto cap 13. Williams (1992) — REINFORCE original.

2. **REINFORCE NumPy + PyTorch híbrido.**

   Build:        REINFORCE com baseline em CartPole. NumPy para a derivação inicial, PyTorch para autodiff. Comparar com o notebook FareedKhan e perceber as diferenças de implementação.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/06_reinforce.ipynb
   Reference:    Williams (1992). Sutton & Barto cap 13.3.
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/01_reinforce.ipynb

3. **Variance reduction com baseline + GAE.**

   Build:        Comparar REINFORCE com/sem baseline (value function). Implementar Generalized Advantage Estimation (GAE) seguindo a annotated implementation labmlai. Mostrar redução de variância.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/rl/ppo/gae.py
   Reference:    Schulman et al. (2015) — *High-Dimensional Continuous Control Using Generalized Advantage Estimation*.
   Source:       https://github.com/labmlai/annotated_deep_learning_paper_implementations
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/02_baseline_gae.ipynb

4. **Actor-Critic (A2C / A3C).**

   Build:        A2C em CartPole. Comparar versão sync (A2C) vs async (A3C) via FareedKhan notebooks. Discutir trade-off entre throughput e estabilidade.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/08_a2c.ipynb
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/09_a3c.ipynb
   Reference:    Mnih et al. (2016) — *Asynchronous Methods for Deep Reinforcement Learning* (A3C).
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/03_a2c.ipynb

### Semana 2 — PPO + DQN + SAC (libraries + CleanRL)

1. **DQN.**

   Build:        DQN em LunarLander. Estudar o single-file CleanRL `dqn.py` (production-quality, ~250 LOC). Comparar com o notebook didático FareedKhan. Tunar hyperparameters via Optuna em sb3 ou direct CleanRL.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/dqn.py
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/13_dqn.ipynb
   Reference:    Mnih et al. (2015) — DQN paper Nature.
   Source:       https://github.com/vwxyzjn/cleanrl
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/04_dqn.ipynb

2. **PPO — single-file production reference.**

   Build:        Ler completamente o `ppo.py` da CleanRL (~340 LOC, contém todos os tricks: GAE, clipping, value coef, entropy bonus, advantage normalization). Correr em LunarLander. Comparar com a annotated implementation labmlai e com o notebook FareedKhan.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/ppo.py
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/rl/ppo/experiment.ipynb
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/07_ppo.ipynb
   Reference:    Schulman et al. (2017) — *Proximal Policy Optimization Algorithms*. Engstrom et al. (2020) — *Implementation Matters in Deep Policy Gradients* (the "37 implementation details" lineage).
   Source:       https://github.com/vwxyzjn/cleanrl
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/05_ppo.ipynb

3. **PPO clipping intuição.**

   Build:        Mini-PPO PyTorch sem libraries (~100 LOC), focado só na clipped surrogate objective. Plotar a clipped objective como função do ratio rₜ(θ). Mostrar onde o clipping ativa.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/labmlai-annotated-dl/rl/ppo/__init__.py
   Reference:    Schulman et al. (2017). Comparar com TRPO (versão constrained, mais complexa).
   Deeper (opt): ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/12_trpo.ipynb (TRPO didático)
   Source:       https://github.com/labmlai/annotated_deep_learning_paper_implementations
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/06_ppo_clip.ipynb

4. **Continuous control: PPO / SAC / DDPG / TD3.**

   Build:        Pendulum + BipedalWalker. Comparar SAC (off-policy max-ent) vs PPO continuous vs DDPG vs TD3. Single-file CleanRL para cada.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/ppo_continuous_action.py
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/sac_continuous_action.py
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/ddpg_continuous_action.py
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/td3_continuous_action.py
   Reference:    Haarnoja et al. (2018) — SAC. Lillicrap et al. (2015) — DDPG. Fujimoto et al. (2018) — TD3.
   Deeper (opt): ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/11_sac.ipynb
   Source:       https://github.com/vwxyzjn/cleanrl
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/07_continuous_control.ipynb

5. **Atari: PPO em ALE.**

   Build:        Correr `ppo_atari.py` (CleanRL) num jogo Atari clássico (Breakout / Pong). Comparar curva de learning com o paper original. Discutir frame stacking, reward clipping, observation normalization.
   Walkthrough:  ../../../Fase3_RL/Sprint10_PolicyGradient/external/cleanrl/cleanrl/ppo_atari.py
   Reference:    Mnih et al. (2013) — *Playing Atari with Deep Reinforcement Learning*.
   Source:       https://github.com/vwxyzjn/cleanrl
   Output:       Fase3_RL/Sprint10_PolicyGradient/notebooks/08_ppo_atari.ipynb

6. **Comparativo final.** Build: tabela A2C vs PPO vs SAC vs DQN em 4 ambientes (CartPole, LunarLander, BipedalWalker, Pendulum). Métricas: episode reward médio últimos 100 episodes, samples para resolver, wall-clock. Output: `09_comparativo.py`.

**Reference:** OpenAI Spinning Up (gratuito, excelente). Sutton & Barto cap 13. Schulman thesis. CleanRL "37 implementation details" (`docs/blog/`).

**Entrega:** `notas/sprint10-resumo.md` — pergunta-teste: "Em 2 minutos: porque é que PPO substituiu TRPO na prática? E onde é que SAC vence PPO?"
