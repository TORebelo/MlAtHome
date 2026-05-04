# Sprint 11.5 — AlphaZero / MuZero (semana extra Fase 3)

**Pergunta nuclear:** *"Como é que um agente domina jogos de tabuleiro a nível super-humano sem dataset, só com self-play? E o que é que MuZero generalizou em relação a AlphaZero?"*

> Sprint walkthrough-driven. werner-duvaud/muzero-general (MIT) está vendored — implementação unificada, ~3000 LOC, suporta AlphaZero (perfect-information board games) e MuZero (model learned, generaliza para Atari). Lê o código sessão a sessão; não reimplementa o motor. Roda em CartPole para validar setup, depois Connect4 / Tic-Tac-Toe para o jogo de tabuleiro.

### Sessão 1 — AlphaGo → AlphaZero → MuZero: a sequência das ideias

Build:        Ler os 3 papers em ordem. Escrever 1 página de markdown explicando: (a) o que AlphaGo precisava (supervised pretraining + RL), (b) o que AlphaZero descartou (zero human knowledge, pure self-play), (c) o que MuZero adicionou (learned dynamics model — não precisa do simulador do jogo).
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/README.md
Reference:    Silver et al. (2016) — *Mastering the game of Go with deep neural networks and tree search* (AlphaGo). Silver et al. (2017) — *Mastering the game of Go without human knowledge* (AlphaZero/AlphaGo Zero). Schrittwieser et al. (2019) — *Mastering Atari, Go, Chess and Shogi by Planning with a Learned Model* (MuZero).
Source:       https://github.com/werner-duvaud/muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/notebooks/01_history.md

### Sessão 2 — MCTS revisitado + UCT/PUCT

Build:        Re-derivar UCT (UCB applied to Trees) e PUCT (variant usado em AlphaZero, com prior do policy network). Implementar mini-MCTS sobre Tic-Tac-Toe próprio (~150 LOC) sem usar muzero-general; depois ler o `MCTS` class do muzero-general e comparar.
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/self_play.py
Reference:    Browne et al. (2012) — *A Survey of Monte Carlo Tree Search Methods*. Silver et al. (2017) AlphaZero — Appendix B (MCTS+PUCT details). Sprint 9 Sessão 8 (MCTS preview) é ponto de partida.
Source:       https://github.com/werner-duvaud/muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/notebooks/02_mcts_uct.ipynb

### Sessão 3 — A arquitetura MuZero: representation, dynamics, prediction

Build:        Estudar a arquitetura unificada MuZero: representation network (h), dynamics network (g), prediction network (f). Ler `models.py` integralmente; desenhar diagrama dos 3 networks e como interagem no MCTS rollout.
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/models.py
Reference:    Schrittwieser et al. (2019) MuZero — section 2 (model). Silver et al. (2017) AlphaZero (single network: policy + value).
Source:       https://github.com/werner-duvaud/muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/notebooks/03_muzero_architecture.md

### Sessão 4 — Self-play loop + replay buffer + trainer

Build:        Compreender o loop completo: workers de self-play geram trajectories → vão para replay buffer → trainer faz updates do model → shared storage propaga novos pesos para os workers. Identificar onde se aplicam re-analysis e prioritized replay.
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/replay_buffer.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/trainer.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/shared_storage.py
Reference:    MuZero paper appendix (training procedure). Schaul et al. (2015) — *Prioritized Experience Replay*.
Source:       https://github.com/werner-duvaud-muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/notebooks/04_self_play_loop.md

### Sessão 5 — Run + diagnose: CartPole + Connect4

Build:        Setup do muzero-general (instalar requirements vendored). Treinar primeiro CartPole (smoke-test, ~30 min CPU); depois Connect4 (board game perfect-info, várias horas GPU). Diagnosticar via `diagnose_model.py` e o notebook vendored. Plotar value/policy ao longo do treino.
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/muzero.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/games/cartpole.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/games/connect4.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/diagnose_model.py
Reference:    muzero-general README — instructions de treino e visualização.
Source:       https://github.com/werner-duvaud/muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/notebooks/05_run_diagnose.ipynb + checkpoints guardados.

### Sessão 6 — Adapter um game novo + síntese

Build:        Escrever um `Game` config próprio para um jogo simples (Othello reduzido 6x6 ou Hex pequeno). Não precisa de treinar até dominar — só validar que o pipeline corre 1 epoch sem crash. Síntese: 1 página markdown com "se eu tivesse que explicar MuZero a alguém em 5 minutos…".
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/games/abstract_game.py
Walkthrough:  ../../../Fase3_RL/Sprint11.5_AlphaZeroMuZero/external/werner-duvaud-muzero-general/games/tictactoe.py
Reference:    Implementações de jogos vendored como referência de estilo: `breakout.py`, `gomoku.py`, `lunarlander.py`.
Source:       https://github.com/werner-duvaud/muzero-general
Output:       Fase3_RL/Sprint11.5_AlphaZeroMuZero/games/<meu_jogo>.py + `notas/sprint11.5-resumo.md`.

**Reference:** Silver et al. — AlphaGo / AlphaGo Zero / AlphaZero. Schrittwieser et al. — MuZero. Hessel et al. (2018) — *Rainbow* (DQN tricks combinados, contraste com model-based MuZero).

**Entrega:** `notas/sprint11.5-resumo.md` — pergunta-teste: "Em 2 minutos: porque é que MuZero é um salto qualitativo em relação a AlphaZero, e em que tipo de domínios é que essa diferença importa?"

> Não é sprint load-bearing (zero from-scratch reimplementation do core). É sprint de **leitura profunda + run prático**. Salta para Fase 4 sem culpa se a Sessão 5 não convergir — a perceção arquitetural é o output principal.
