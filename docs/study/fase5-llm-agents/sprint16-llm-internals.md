# Sprint 16 — LLM Internals (semanas 29-30)

**Pergunta nuclear:** *"O que é que está exactamente dentro de um LLM? Tokenization, embeddings, atenção causal, geração — perceber tudo até ao byte antes de tocar em RAG ou agents."*

> Sprint walkthrough-driven. **Hands-On Large Language Models** (Alammar/Grootendorst, Apache-2.0) está vendored em `Sprint16_LLMInternals/external/handsonllm-hands-on-llms/` — 12 capítulos de notebooks Colab. Sprint 16 cobre caps **1, 2, 3, 8, 10**. Sprint 22 reusa o mesmo snapshot para fine-tuning (caps 11, 12).

### Sessão 1 — Introduction to Language Models (Chapter 1)

Build:        Correr `Chapter 1 - Introduction to Language Models.ipynb`. Compreender o panorama: encoder-only (BERT) vs decoder-only (GPT) vs encoder-decoder (T5). Quando escolher cada arquitetura?
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter01/
Video:        — (book-driven, sem video)
Reference:    Alammar & Grootendorst — *Hands-On Large Language Models* (O'Reilly 2024) cap 1.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint16_LLMInternals/notebooks/01_intro.ipynb + nota `notas/sprint16-llm-zoo.md`

### Sessão 2 — Tokens and Token Embeddings (Chapter 2)

Build:        `Chapter 2 - Tokens and Token Embeddings.ipynb`. BPE / WordPiece / SentencePiece. Compreender porque é que tokenization decisões afetam tudo (multilingual, code, números). Cross-link com Sprint 7 minbpe (já vendored).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter02/
Reference:    Hands-On LLMs cap 2. Karpathy — *Let's build the GPT Tokenizer* (Sprint 7 vendor: `Fase2_DeepLearning/Sprint07_Transformers/external/karpathy-minbpe/`).
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint16_LLMInternals/notebooks/02_tokenization.ipynb

### Sessão 3 — Looking Inside LLMs (Chapter 3)

Build:        `Chapter 3 - Looking Inside LLMs.ipynb`. Inspeccionar attention patterns, hidden states, logits. Probar um modelo middle-sized (Phi / Qwen 0.5B) localmente. Ligar com Karpathy GPT (Sprint 7) — já viste como construir, agora vês como inspeccionar um treinado.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter03/
Reference:    Hands-On LLMs cap 3. Karpathy nanoGPT (Sprint 7).
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint16_LLMInternals/notebooks/03_inside_llms.ipynb

### Sessão 4 — Semantic Search (Chapter 8)

Build:        `Chapter 8 - Semantic Search.ipynb`. Embeddings (sentence-transformers) + dense retrieval + lexical (BM25) + hybrid + reranking. Pré-requisito para Sprint 17 (RAG fundamentals).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter08/
Reference:    Hands-On LLMs cap 8. Karpukhin et al. (2020) — *Dense Passage Retrieval*. Robertson — BM25.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint16_LLMInternals/notebooks/04_semantic_search.ipynb

### Sessão 5 — Creating Text Embedding Models (Chapter 10)

Build:        `Chapter 10 - Creating Text Embedding Models.ipynb`. Treinar / fine-tunar um embedding model (contrastive, MNR loss). Avaliar em STS / MTEB benchmark mini. Cross-link com Sprint 7 sessão 7 (sentence-transformers básico).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter10/
Reference:    Hands-On LLMs cap 10. Reimers & Gurevych (2019) — *Sentence-BERT*. MTEB benchmark.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint16_LLMInternals/notebooks/05_embedding_models.ipynb + nota `notas/sprint16-resumo.md`.

**Reference:** Alammar & Grootendorst — *Hands-On Large Language Models* (O'Reilly 2024). Karpathy nn-zero-to-hero L7+L8 (Sprint 7 vendor — completar/recap se preciso).

**Entrega:** `notas/sprint16-resumo.md` — pergunta-teste: "Em 2 minutos: porque é que tokenization é often onde os bugs subtis vivem (multilingual, números, código)? Dá um exemplo concreto."
