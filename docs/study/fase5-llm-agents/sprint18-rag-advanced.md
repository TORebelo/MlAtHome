# Sprint 18 — RAG Advanced (semanas 31-32, segunda metade)

**Pergunta nuclear:** *"Quando o simple RAG falha — porquê? Reranking, fusion, self-correction (Self-RAG, CRAG), e graph-based retrieval para quando relações entre entidades importam mais que similaridade textual."*

> Sprint walkthrough-driven. Reusa o snapshot **NirDiamant RAG_Techniques** vendored em Sprint 17 (`Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/`). Os paths abaixo apontam para essa pasta a partir da pasta de Sprint 18.

> **License flag:** non-commercial only — ver `_ATTRIBUTION.md` na pasta vendor partilhada.

### Sessão 1 — Reranking: cross-encoder pós-retrieval

Build:        `reranking.ipynb`. Bi-encoder retrieval (rápido, top-K=50) → cross-encoder reranking (lento, top-K=5). Mostrar diferença de qualidade vs cost. Comparar com `reranking_with_llamaindex.ipynb` para perceber a versão library-managed.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/reranking.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/reranking_with_llamaindex.ipynb
Reference:    Reimers & Gurevych — *Sentence-BERT* (cross-encoders). Cohere Rerank API docs.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/01_reranking.ipynb

### Sessão 2 — Fusion retrieval: BM25 + dense em ensemble

Build:        `fusion_retrieval.ipynb`. Reciprocal Rank Fusion combinando BM25 (lexical) com dense (semantic). Mostrar onde fusion ganha sobre cada um isolado (queries com termos raros / out-of-distribution).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/fusion_retrieval.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/fusion_retrieval_with_llamaindex.ipynb
Reference:    Cormack et al. (2009) — *Reciprocal Rank Fusion*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/02_fusion.ipynb

### Sessão 3 — Self-RAG: o LLM critica e corrige a sua própria retrieval

Build:        `self_rag.ipynb`. Adicionar reflection tokens (Retrieve / IsRel / IsSup / IsUse) ao output do LLM para que ele decida quando recuperar e classifique a utilidade. Implementação simplificada com prompts (não fine-tuning).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/self_rag.ipynb
Reference:    Asai et al. (2023) — *Self-RAG: Learning to Retrieve, Generate, and Critique through Self-Reflection*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/03_self_rag.ipynb

### Sessão 4 — CRAG: Corrective RAG com web fallback

Build:        `crag.ipynb`. Avaliador de relevância dos chunks retrieved → se baixa, recorrer a web search como fallback. Ler também `reliable_rag.ipynb` para ver checks de hallucination e citation grounding.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/crag.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/reliable_rag.ipynb
Reference:    Yan et al. (2024) — *Corrective Retrieval Augmented Generation*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/04_crag.ipynb

### Sessão 5 — GraphRAG: knowledge-graph-augmented retrieval

Build:        `graph_rag.ipynb` + `Microsoft_GraphRag.ipynb`. Construir KG do corpus (entity extraction + relation), retrievar via subgraph em vez de chunks. Especialmente bom para queries multi-hop e exploratórias.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/graph_rag.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/Microsoft_GraphRag.ipynb
Reference:    Edge et al. (2024) — *From Local to Global: A Graph RAG Approach to Query-Focused Summarization* (Microsoft).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/05_graphrag.ipynb

### Sessão 6 — RAPTOR: hierarchical recursive abstractive retrieval

Build:        `raptor.ipynb`. Cluster chunks → summarizar cada cluster → indexar à camada-cluster + chunk. Permite queries de granularidade variável (factual baixo nível ou síntese global).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/raptor.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/hierarchical_indices.ipynb
Reference:    Sarthi et al. (2024) — *RAPTOR: Recursive Abstractive Processing for Tree-Organized Retrieval*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/06_raptor.ipynb

### Sessão 7 — Adaptive retrieval + síntese final

Build:        `adaptive_retrieval.ipynb`. Router que escolhe a técnica certa por query (factual → simple, multi-hop → graph, abstract → RAPTOR). Construir um decision tree mínimo no teu corpus e medir improvement vs simple RAG single-strategy.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/adaptive_retrieval.ipynb
Reference:    Jeong et al. (2024) — *Adaptive-RAG: Learning to Adapt Retrieval-Augmented Large Language Models through Question Complexity*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint18_RAGAdvanced/notebooks/07_adaptive.ipynb + nota `notas/sprint18-resumo.md`.

**Reference:** Asai et al. (2023) — Self-RAG. Yan et al. (2024) — CRAG. Edge et al. (2024) — GraphRAG. Sarthi et al. (2024) — RAPTOR. Gao et al. (2024) — *RAG for LLMs: A Survey*.

**Entrega:** `notas/sprint18-resumo.md` — pergunta-teste: "Em 3 minutos: Self-RAG vs CRAG vs Adaptive-RAG — qual a diferença de approach e quando escolherias cada um? Onde é que GraphRAG complementa em vez de substituir?"
