# Sprint 7 — Attention + Transformers (semanas 13-14)

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
