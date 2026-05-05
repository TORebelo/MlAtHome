# Sprint 6 — CNNs e Visão (semanas 11-12)

**Pergunta nuclear:** *"Porque é que convoluções funcionam tão bem em imagens? Inductive bias visual."*

### Sessão 1 — Conv2d intuição

Build:        Aplicar 5 kernels manuais (edge detector, blur, sharpen) a uma imagem.
Output:       01_conv_intuition.py

### Sessão 2 — LeNet-5 PyTorch (NÃO from-scratch)

Reference:    LeCun et al. (1998).
Build:        Implementar LeNet em PyTorch. Treinar em MNIST.
Output:       02_lenet.py

### Sessão 3 — CIFAR-10 com CNN

Build:        CNN simples (3 conv + 2 fc) em CIFAR-10. Atingir >70% accuracy.
Output:       03_cifar_cnn.py

### Sessão 4 — Data augmentation

Build:        Adicionar `torchvision.transforms` augmentation. Medir improvement.
Output:       04_augmentation.py

### Sessão 5 — Transfer learning

Build:        Fine-tune ResNet18 pre-trained em CIFAR-100. Comparar com training from scratch.
Output:       05_transfer.py

### Sessão 6 — Visualização: filters e activations

Reference:    Zeiler & Fergus (2014).
Build:        Visualizar primeiros conv filters de ResNet treinado e maps de activation em camadas profundas.
Output:       06_visualizations.py

### Sessão 7 — Adversarial examples

Reference:    Goodfellow et al. (2014).
Build:        Gerar adversarial example com FGSM e atacar a tua CNN.
Output:       07_adversarial.py

### Sessão 8 — Object detection (overview, sklearn-like)

Build:        Usar `torchvision.models.detection.fasterrcnn` pré-treinado em imagens random.
Output:       08_object_detection.py

**Reference:** Goodfellow cap 9. CS231n notes (Stanford, online gratuito). Stevens caps 8.

**Entrega:** `notas/sprint06-resumo.md`.
