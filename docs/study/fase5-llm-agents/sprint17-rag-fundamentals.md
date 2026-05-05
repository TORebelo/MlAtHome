# Sprint 17 — RAG Fundamentals (semanas 31-32, primeira metade)

**Pergunta nuclear:** *"Como é que dou contexto factual a um LLM sem fine-tuning? Pipeline RAG do zero — chunk, embed, retrieve, generate — e os 3 ou 4 truques que separam um RAG decente de um inutilizável."*

> Sprint walkthrough-driven. **NirDiamant RAG_Techniques** (Custom non-commercial license — vendor permitido para uso de estudo) está em `Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/`. Sprint 18 reusa o mesmo snapshot. Ordem pedagógica: simple → chunking → query enhancement → contextual compression. Cada notebook é self-contained, OpenAI/local LLM agnostic.

> **License flag:** non-commercial only — ver `_ATTRIBUTION.md` na pasta vendor.

### Sessão 1 — Simple RAG: pipeline mínimo end-to-end

Build:        `simple_rag.ipynb`. Loader → splitter → embeddings → vector store → retriever → generator. Adaptar a corpus próprio (e.g. 10 PDFs financeiros em PT). Comparar resposta com vs sem retrieval.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/simple_rag.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/helper_functions.py
Reference:    Lewis et al. (2020) — *RAG: Retrieval-Augmented Generation*. Karpukhin et al. (2020) — DPR.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/01_simple_rag.ipynb

### Sessão 2 — Chunking strategies: choose_chunk_size + semantic_chunking

Build:        `choose_chunk_size.ipynb` + `semantic_chunking.ipynb`. Comparar fixed-size vs recursive vs semantic chunking. Sweep de chunk_size {200, 500, 1000} + overlap {0, 50, 100} num corpus controlado e medir retrieval@k.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/choose_chunk_size.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/semantic_chunking.ipynb
Reference:    LlamaIndex docs sobre chunking. Sentence-Transformers semantic similarity.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/02_chunking.ipynb

### Sessão 3 — Query transformations + decomposition

Build:        `query_transformations.ipynb`. Multi-query rewriting, sub-question decomposition, step-back prompting. Mostrar onde uma query mal formulada arruina retrieval e o transformation a salva.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/query_transformations.ipynb
Reference:    Zheng et al. (2023) — *Take a Step Back: Evoking Reasoning via Abstraction*. Anthropic blog sobre prompt decomposition.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/03_query_transformations.ipynb

### Sessão 4 — HyDE: Hypothetical Document Embeddings

Build:        `HyDe_Hypothetical_Document_Embedding.ipynb`. LLM gera um documento hipotético para a query → embedda esse → procura. Especialmente útil quando query é curta e o corpus tem documentos longos.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/HyDe_Hypothetical_Document_Embedding.ipynb
Reference:    Gao et al. (2022) — *Precise Zero-Shot Dense Retrieval without Relevance Labels* (HyDE paper).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/04_hyde.ipynb

### Sessão 5 — Contextual compression + chunk headers

Build:        `contextual_compression.ipynb` + `contextual_chunk_headers.ipynb`. Pós-retrieval, comprimir cada chunk para só o relevante (LLM-as-compressor) ou prepend metadata header (parent doc title / section) ao chunk para melhorar grounding.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/contextual_compression.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/contextual_chunk_headers.ipynb
Reference:    Anthropic — *Contextual Retrieval* blog post (similar idea).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/05_contextual_compression.ipynb

### Sessão 6 — Document augmentation + proposition chunking

Build:        `document_augmentation.ipynb` + `proposition_chunking.ipynb`. Gerar perguntas sintéticas para cada chunk e indexar perguntas em vez de (ou além de) chunks. Proposition-level chunking: cada "fact" é um item retrievable separadamente.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/document_augmentation.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/proposition_chunking.ipynb
Reference:    Chen et al. (2023) — *Dense X Retrieval: What Retrieval Granularity Should We Use?* (proposition-level).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint17_RAGFundamentals/notebooks/06_doc_augmentation.ipynb + nota `notas/sprint17-resumo.md`.

**Reference:** Lewis et al. (2020) — *RAG*. Gao et al. (2024) — *Retrieval-Augmented Generation for Large Language Models: A Survey*. NirDiamant `README.md` (vendored) — links para papers de cada técnica.

**Entrega:** `notas/sprint17-resumo.md` — pergunta-teste: "Dadas 3 queries de tipos diferentes (factual curta, ambígua, multi-hop), qual técnica de retrieval escolherias para cada? Justifica."
