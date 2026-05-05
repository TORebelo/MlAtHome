# Sprint 5 — MLP + Backprop (semanas 9-10)

**Pergunta nuclear:** *"O que é exactamente backpropagation? Vou perceber-o uma vez para nunca mais ter dúvidas — pela mão de quem o explica melhor."*

> Sprint walkthrough-driven. Substitui re-implementação NumPy planeada. Karpathy faz exatamente este from-scratch melhor que qualquer alternativa; repetir = redundante.

### Sessão 1 — Micrograd: scalar autograd from scratch (Lecture 1)

Build:        Construir motor autograd escalar (`Value` class com `+`, `*`, `tanh`, backward) seguindo o vídeo.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/micrograd/
Video:        https://www.youtube.com/watch?v=VMj-3S1tku0
Reference:    Goodfellow cap 6.5 (chain rule)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/01_micrograd.ipynb + nota `notas/sprint05-micrograd.md`

### Sessão 2 — Makemore Part 1: Bigrams char-level (Lecture 2)

Build:        Modelo bigrama em PyTorch — contagens + NN equivalente sobre `names.txt`.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/makemore/makemore_part1_bigrams.ipynb
Video:        https://www.youtube.com/watch?v=PaCmpygFfXo
Reference:    —
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/02_bigrams.ipynb

### Sessão 3 — Makemore Part 2: MLP char-level (Lecture 3)

Build:        MLP char-level (Bengio 2003); train/dev/test, hyperparam sweeps.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/makemore/makemore_part2_mlp.ipynb
Video:        https://www.youtube.com/watch?v=TCH_1BHY58I
Reference:    Bengio 2003 (paper); Goodfellow cap 6
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/03_mlp.ipynb

### Sessão 4 — Makemore Part 3: Activations, Gradients, BatchNorm (Lecture 4)

Build:        MLP profundo + diagnósticos de ativações/gradientes + BatchNorm.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/makemore/makemore_part3_bn.ipynb
Video:        https://www.youtube.com/watch?v=P6sfmUTpUmc
Reference:    Ioffe & Szegedy 2015 (BatchNorm paper)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/04_diagnostics.ipynb

### Sessão 5 — Makemore Part 4: Manual Backprop (Lecture 5)

Build:        Backprop manual sem autograd, atravessando cross-entropy, linear, tanh, batchnorm, embeddings.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint05_MLP/external/karpathy-nn-zero-to-hero/makemore/makemore_part4_backprop.ipynb
Video:        https://www.youtube.com/watch?v=q8SA3rM6ckI
Reference:    Goodfellow cap 6.5 (chain rule revisited)
Source:       https://github.com/karpathy/nn-zero-to-hero
Output:       Fase2_DeepLearning/Sprint05_MLP/notebooks/05_manual_backprop.ipynb + `notas/sprint05-resumo.md` (resposta de 30s ao "o que é backprop").

**Entrega:** `notas/sprint05-resumo.md` — pergunta-teste: "Backprop em 30 segundos: chain rule + cache das activations + topological order do DAG."

> Lectures 4 e 6 (WaveNet) opcionais — não são load-bearing para o caminho LLM. Saltar se foco é Sprint 7 (GPT).
