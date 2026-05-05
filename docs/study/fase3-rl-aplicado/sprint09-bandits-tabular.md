# Sprint 9 — Bandits + Tabular RL (semanas 17-18)

**Pergunta nuclear:** *"Antes de neural networks, como é que um agente RL aprende? Tabular methods em ambientes pequenos."*

> Sprint walkthrough-augmented. FareedKhan all-rl-algorithms (notebooks didáticos 01-05, 17) está vendored para Q-learning / SARSA / Expected SARSA / Dyna-Q / MCTS. Spinning Up (VPG core) entra como ponte teórica para Sprint 10. Bandits, MDP e Monte Carlo continuam de raiz própria.

1. **Multi-armed bandit.** Build: ε-greedy, UCB1, Thompson sampling em 10-armed bandit. Plotar regret cumulativo. Output: `01_bandits.py`. Reference: Sutton & Barto cap 2. Deeper: FareedKhan `01_simple_rl.ipynb` (intro RL geral, opcional).

2. **Markov Decision Process intuição.** Build: implementar GridWorld 4x4. Value iteration + policy iteration manuais. Plotar value function e policy. Output: `02_mdp_gridworld.py`. Reference: Sutton & Barto cap 3-4.

3. **Q-learning tabular.**

   Build:        Q-learning em FrozenLake (`gymnasium`). Plotar Q-table aprendida. Reproduzir + adaptar a notebook FareedKhan.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/02_q_learning.ipynb
   Reference:    Sutton & Barto cap 6. FareedKhan cheatsheet vendored.
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint09_BanditsTabular/notebooks/03_qlearning.ipynb

4. **SARSA vs Q-learning vs Expected SARSA.**

   Build:        Comparar on-policy (SARSA) vs off-policy (Q-learning) vs Expected SARSA em Cliff Walking. Mostrar que SARSA aprende safer policy.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/03_sarsa.ipynb
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/04_expected_sarsa.ipynb
   Reference:    Sutton & Barto cap 6.4-6.5.
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint09_BanditsTabular/notebooks/04_sarsa_qlearning.ipynb

5. **Monte Carlo control.** Build: MC com exploring starts em Blackjack (`gymnasium`). Plotar value function 3D. Output: `05_mc_blackjack.py`. Reference: Sutton & Barto cap 5.

6. **Dyna-Q (model-based vs model-free).**

   Build:        Comparar Dyna-Q vs Q-learning puro em GridWorld — mostrar speedup com planning steps. TD(λ) opcional para comparar com eligibility traces.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/05_dyna_q.ipynb
   Reference:    Sutton & Barto cap 8 (Dyna), cap 12 (eligibility traces).
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint09_BanditsTabular/notebooks/06_dyna_q.ipynb

7. **Function approximation linear.** Build: Q-learning com features lineares (tile coding) em MountainCar. Mostrar generalização vs tabular. Output: `07_linear_fa.py`. Reference: Sutton & Barto cap 9-10.

8. **Monte Carlo Tree Search (preview Sprint 11.5).**

   Build:        MCTS para um jogo simples (Tic-Tac-Toe ou GridWorld). UCT selection + rollout policy. Preview da estrutura que MuZero generaliza.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/fareedkhan-all-rl-algorithms/17_mcts.ipynb
   Reference:    Browne et al. (2012) — *A Survey of Monte Carlo Tree Search Methods*.
   Source:       https://github.com/FareedKhan-dev/all-rl-algorithms
   Output:       Fase3_RL/Sprint09_BanditsTabular/notebooks/08_mcts.ipynb

9. **Vanilla Policy Gradient — bridge to Sprint 10.**

   Build:        Ler e correr o VPG do Spinning Up em CartPole. Compreender o policy gradient theorem na forma como o OpenAI o expõe. Não re-implementar — esse trabalho fica para Sprint 10 Sessão 2.
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/openai-spinningup/spinup/algos/pytorch/vpg/vpg.py
   Walkthrough:  ../../../Fase3_RL/Sprint09_BanditsTabular/external/openai-spinningup/spinup/algos/pytorch/vpg/core.py
   Reference:    Sutton & Barto cap 13.1-13.3. Spinning Up "Intro to Policy Optimization".
   Source:       https://github.com/openai/spinningup
   Output:       Fase3_RL/Sprint09_BanditsTabular/notebooks/09_vpg_walkthrough.ipynb + nota `notas/sprint09-vpg-bridge.md`

**Reference:** Sutton & Barto — *Reinforcement Learning* caps 1-13 (open-source: incompleteideas.net/book). OpenAI Spinning Up (gratuito).

**Entrega:** `notas/sprint09-resumo.md` — pergunta-teste: "Diferença entre on-policy e off-policy em 1 minuto. Porque é que Q-learning consegue aprender de um buffer de comportamento qualquer mas SARSA não?"
