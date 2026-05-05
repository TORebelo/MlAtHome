# Sprint 7 — Attention + Transformers (semanas 13-14)

**Pergunta nuclear:** *"Attention substituiu RNNs em quase todo o NLP/séries. Vou perceber porquê — pela mão de quem o explica melhor + ler código de produção."*

> Sprint walkthrough-driven. Karpathy Lecture 7 (Building GPT) + Lecture 8 (Tokenizer) são o curriculum. nanoGPT (production reference) e minbpe (BPE didático) estão vendored. ng-video-lecture (companion direto da Lecture 7) tem **no LICENSE upstream** — fica só como reference link.

### Sessão 1 — Building GPT from scratch (Lecture 7)

Build:        Seguir o vídeo construindo um GPT decoder-only sobre Tiny Shakespeare. Implementar self-attention, multi-head, blocks residuais, LayerNorm, geração.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nano-gpt/model.py
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nano-gpt/train.py
Video:        https://www.youtube.com/watch?v=kCc8FmEb1nY
Reference:    Vaswani et al. (2017) — *Attention is All You Need*. https://github.com/karpathy/ng-video-lecture (pedagogical companion, no LICENSE — link only)
Source:       https://github.com/karpathy/nanoGPT
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/01_build_gpt.ipynb

### Sessão 2 — Tokenizer / BPE (Lecture 8)

Build:        Implementar Byte Pair Encoding (treinar tokenizer + encode/decode). Aplicar a corpus Taylor Swift e a multilingual data. Mostrar problemas de tokenização.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-minbpe/minbpe/
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-minbpe/lecture.md
Video:        https://www.youtube.com/watch?v=zduSFxRajkE
Reference:    Sennrich et al. (2015) — original BPE paper.
Source:       https://github.com/karpathy/minbpe
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/02_bpe.ipynb + `notas/sprint07-bpe-issues.md`

### Sessão 3 — Production GPT: nanoGPT training pipeline

Build:        Compreender e correr `train.py` do nanoGPT em Tiny Shakespeare (CPU se preciso, ou Colab T4). Reproduzir a config `train_shakespeare_char.py`.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nano-gpt/config/train_shakespeare_char.py
Walkthrough:  ../../../Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-nano-gpt/train.py
Video:        — (baseado nos vídeos Karpathy build-nanogpt no canal)
Reference:    Karpathy README do nanoGPT (vendored em `external/karpathy-nano-gpt/README.md`).
Source:       https://github.com/karpathy/nanoGPT
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/03_nanogpt_run.ipynb + checkpoint guardado.

### Sessão 4 — Application: Mini-Transformer em IMDB sentiment

Build:        Construir encoder-only transformer (1 layer, 1 head) treinado em IMDB (binary sentiment). Comparar com BoW + logreg. Mostrar quando attention vence.
Dataset:      IMDB (HuggingFace `datasets` lib).
Reference:    `transformers.Trainer` quickstart. Lin et al. — *A Survey of Transformers*.
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/04_mini_transformer_imdb.py

### Sessão 5 — HuggingFace BERT em IMDB

Build:        Usar `bert-base-uncased` em IMDB com HuggingFace `Trainer`. Comparar accuracy com mini-transformer.
Dataset:      IMDB.
Reference:    HuggingFace docs.
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/05_hf_bert_imdb.py

### Sessão 6 — Fine-tuning eficiente (LoRA)

Build:        Fine-tune BERT em GLUE task com `peft` library + LoRA. Mostrar parâmetros treinados (% do total).
Reference:    Hu et al. (2021) — LoRA paper.
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/06_lora_finetune.py

### Sessão 7 — Embeddings e Semantic Search

Build:        Gerar embeddings com `sentence-transformers`. Cosine similarity. Aplicar a semantic search num corpus pequeno.
Dataset:      Reuters articles ou similar.
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/07_embeddings.py

### Sessão 8 — Vision Transformer (ViT)

Build:        Usar ViT pre-trained em CIFAR. Comparar com ResNet18 do Sprint 6.
Reference:    Dosovitskiy et al. (2020).
Output:       Fase2_DeepLearning/Sprint07_Transformers/notebooks/08_vit.py

**Reference:** Vaswani et al. (2017) — *Attention is All You Need*. Karpathy: *Let's build GPT* + *GPT Tokenizer* (YouTube). Lin et al. — *A Survey of Transformers*.

**Entrega:** `notas/sprint07-resumo.md` — pergunta-teste: "Em 1 minuto: porque é que self-attention escala melhor que RNNs e o que custa em termos de complexidade?"
