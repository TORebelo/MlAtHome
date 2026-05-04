# Fase 2 — Deep Learning

> 4 sprints, 8 semanas. From-scratch só para 2 conceitos load-bearing: **MLP+backprop** (Sprint 5) e **scaled-dot-product attention** (Sprint 7). Tudo o resto via PyTorch.

**Pasta de output:** `Fase2_DeepLearning/Sprint0X_Y/`.

---

## Sprint 5 — MLP + Backprop (semanas 9-10)

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

---

## Sprint 6 — CNNs e Visão (semanas 11-12)

**Pergunta nuclear:** *"Porque é que convoluções funcionam tão bem em imagens? Inductive bias visual."*

1. **Conv2d intuição.** Build: aplicar 5 kernels manuais (edge detector, blur, sharpen) a uma imagem. Output: `01_conv_intuition.py`.
2. **LeNet-5 PyTorch (NÃO from-scratch).** Build: implementar LeNet em PyTorch. Treinar em MNIST. Output: `02_lenet.py`. Reference: LeCun et al. (1998).
3. **CIFAR-10 com CNN.** Build: CNN simples (3 conv + 2 fc) em CIFAR-10. Atingir >70% accuracy. Output: `03_cifar_cnn.py`.
4. **Data augmentation.** Build: adicionar `torchvision.transforms` augmentation. Medir improvement. Output: `04_augmentation.py`.
5. **Transfer learning.** Build: fine-tune ResNet18 pre-trained em CIFAR-100. Comparar com training from scratch. Output: `05_transfer.py`.
6. **Visualização: filters e activations.** Build: visualizar primeiros conv filters de ResNet treinado e maps de activation em camadas profundas. Output: `06_visualizations.py`. Reference: Zeiler & Fergus (2014).
7. **Adversarial examples.** Build: gerar adversarial example com FGSM e atacar a tua CNN. Output: `07_adversarial.py`. Reference: Goodfellow et al. (2014).
8. **Object detection (overview, sklearn-like).** Build: usar `torchvision.models.detection.fasterrcnn` pré-treinado em imagens random. Output: `08_object_detection.py`.

**Reference:** Goodfellow cap 9. CS231n notes (Stanford, online gratuito). Stevens caps 8.

**Entrega:** `notas/sprint06-resumo.md`.

---

## Sprint 7 — Attention + Transformers (semanas 13-14)

**Pergunta nuclear:** *"Attention substituiu RNNs em quase todo o NLP/séries. Vou perceber porquê — implementando uma vez."*

### Semana 1 — Attention from-scratch

1. **Scaled dot-product attention NumPy.** Build: implementar `attention(Q, K, V)` em NumPy. Visualizar attention weights. Output: `01_attention_numpy.py` + `notas/attention-derivation.md`. Reference: Vaswani et al. (2017).
2. **Multi-head attention.** Build: estender para multi-head. Comparar com `torch.nn.MultiheadAttention`. Output: `02_mha.py`.
3. **Transformer encoder block.** Build: encoder block (MHA + FFN + residual + LayerNorm) em PyTorch. Output: `03_encoder_block.py`.
4. **Mini-Transformer em IMDB sentiment.** Build: encoder-only transformer (1 layer, 1 head) treinado em IMDB. Comparar com BoW + logreg. Output: `04_mini_transformer_imdb.py`.

### Semana 2 — Aplicações práticas

1. **HuggingFace transformers.** Build: usar `bert-base-uncased` em IMDB com HuggingFace `Trainer`. Comparar accuracy com mini-transformer da semana anterior. Output: `05_hf_bert_imdb.py`.
2. **Fine-tuning eficiente (LoRA).** Build: fine-tune BERT em GLUE task com `peft` library + LoRA. Mostrar parâmetros treinados. Output: `06_lora_finetune.py`. Reference: Hu et al. (2021).
3. **Embeddings e similarity.** Build: gerar embeddings com `sentence-transformers`. Calcular cosine similarity. Aplicar a semantic search num corpus pequeno. Output: `07_embeddings.py`.
4. **Vision Transformer (ViT).** Build: usar ViT pre-trained em CIFAR. Comparar com ResNet. Output: `08_vit.py`. Reference: Dosovitskiy et al. (2020).

**Reference:** Vaswani et al. (2017) — Attention is All You Need. Karpathy: *Let's build GPT* (YouTube). Lin et al. — *A Survey of Transformers*.

**Entrega:** `notas/sprint07-resumo.md`.

---

## Sprint 8 — Modelos Generativos (semanas 15-16)

**Pergunta nuclear:** *"Como é que um modelo aprende a gerar dados (imagens, text, etc.)? VAE, GAN, Diffusion."*

1. **Autoencoder simples.** Build: AE para MNIST. Visualizar reconstrução vs original. Visualizar latent space 2D. Output: `01_autoencoder.py`.
2. **VAE (PyTorch, NÃO NumPy).** Build: VAE com reparameterization trick. Treinar MNIST. Generate samples. Output: `02_vae.py`. Reference: Kingma & Welling (2013).
3. **VAE latent space exploration.** Build: interpolar 2 pontos no latent space. Mostrar smooth transitions. Output: `03_vae_latent.py`.
4. **GAN (PyTorch).** Build: DCGAN simples em MNIST. Mostrar mode collapse / training instability. Output: `04_dcgan.py`. Reference: Goodfellow et al. (2014).
5. **WGAN-GP.** Build: improvement sobre DCGAN. Mostrar treino mais estável. Output: `05_wgan_gp.py`. Reference: Gulrajani et al. (2017).
6. **Diffusion model (mini).** Build: DDPM para MNIST (32-step). Reference: Ho et al. (2020). Library: `diffusers` para versão pré-feita também. Output: `06_ddpm.py`.
7. **Stable Diffusion API usage.** Build: usar `diffusers` para gerar imagens com prompt. Não training — usage prático. Output: `07_stable_diffusion_demo.py`.
8. **Avaliar generative models.** Build: calcular FID e Inception Score para os teus models. Output: `08_eval_generative.py`. Reference: Heusel et al. (2017).

**Reference:** Foster — *Generative Deep Learning*. Karpathy: NN tutorials.

**Entrega Sprint 8 + Fase 2:**
- `notas/sprint08-resumo.md`.
- `notas/fase2-retrospectiva.md` — comparar com Fase 1 em densidade e enjoyment.

---

## Bibliografia da Fase 2

- Goodfellow et al. — *Deep Learning* (referência core, on-demand)
- Stevens — *Deep Learning with PyTorch*
- Foster — *Generative Deep Learning*
- Karpathy YouTube channel (intuição prática insubstituível)
- Stanford CS231n notes (gratuitas)
