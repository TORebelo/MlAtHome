# Sprint 5 — MLP + Backprop (semanas 9-10)

**Pergunta nuclear:** *"O que é exactamente backpropagation? Vou implementá-lo uma vez em NumPy puro para nunca mais ter dúvidas."*

### Semana 1 — From-scratch

1. **Forward pass MLP NumPy.** Build: 3-layer MLP com ReLU. Dataset: MNIST flat. Output: `01_mlp_forward.py`. Reference: Goodfellow cap 6.
2. **Backprop manual.** Build: derivar gradientes à mão (escrever em markdown). Implementar `backward()` chain rule. Output: `02_mlp_backward.py` + `notas/backprop-derivation.md`.
3. **Treinar MNIST com NumPy MLP.** Build: SGD loop + mini-batches. Atingir >95% test accuracy. Output: `03_mlp_train_mnist.py`.
4. **Comparar com PyTorch.** Build: mesma arquitetura em PyTorch. Mostrar que dá mesma accuracy mas em 1/10 do código. Output: `04_mlp_pytorch.py`.

### Semana 2 — Building blocks práticos

1. **Activation functions zoo.** Build: comparar ReLU, Leaky ReLU, GELU, Swish em MNIST PyTorch. Plotar funções e gradientes. Output: `05_activations.py`.
2. **BatchNorm + Dropout.** Build: adicionar a MLP. Mostrar impacto em variance dos gradients e overfitting. Output: `06_batchnorm_dropout.py`. Reference: Ioffe & Szegedy (2015), Srivastava et al. (2014).
3. **Initialization importance.** Build: comparar Xavier, He, e zeros em deep MLP. Mostrar gradient vanishing com zeros. Output: `07_init.py`. Reference: Glorot & Bengio (2010), He et al. (2015).
4. **Hyperparameter search.** Build: Optuna search sobre lr/dropout/hidden_dim em MNIST. Output: `08_optuna.py`.

**Reference:** Goodfellow caps 6-8. Stevens — *Deep Learning with PyTorch* caps 6-7.

**Entrega:** `notas/sprint05-resumo.md` — pergunta-teste: "Backprop em 30 segundos: chain rule + cache das activations."
