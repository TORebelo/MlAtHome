# Sprint 21 — Agentic RAG em Produção (semanas 35-36, segunda metade)

**Pergunta nuclear:** *"Como é que combino RAG (Sprints 17-18) com agents (Sprints 19-20) num sistema controllável e avaliável? E como é que avalio rigorosamente um sistema cujo output é texto livre?"*

> Sprint walkthrough-driven. Reusa **dois snapshots vendored**: NirDiamant `RAG_Techniques` (em `Sprint17_RAGFundamentals/`) e NirDiamant `GenAI_Agents` (em `Sprint19_AgentsFundamentals/`). Foco: agentic RAG controllable + RAG evaluation rigorosa.

> **License flag:** non-commercial only — ver `_ATTRIBUTION.md` em ambas as pastas vendor.

### Sessão 1 — Agentic RAG: o LLM decide o pipeline em runtime

Build:        `Agentic_RAG.ipynb`. Em vez de pipeline fixo (chunk → embed → retrieve → generate), o agente **decide** que técnica de retrieval usar, quantas iterações, quando parar. Composição runtime-driven das técnicas dos Sprints 17-18.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/Agentic_RAG.ipynb
Reference:    NirDiamant `README.md` — secção agentic RAG. LangGraph "agentic RAG" tutorial.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/notebooks/01_agentic_rag.ipynb

### Sessão 2 — Controllable RAG: contextual quoting + reliable_rag

Build:        `contextual_quoting_agentic_system.ipynb` (do GenAI_Agents) + `reliable_rag.ipynb` (do RAG_Techniques). Sistema com **citation grounding obrigatório** — o agente não pode emitir resposta sem citar a passage. Hallucination check + answer-vs-source verification.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/contextual_quoting_agentic_system.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/reliable_rag.ipynb
Reference:    Anthropic — *Contextual Retrieval* + Citations API. Manakul et al. (2023) — *SelfCheckGPT* (hallucination detection).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/notebooks/02_controllable_rag.ipynb

### Sessão 3 — Retrieval feedback loop + explainability

Build:        `retrieval_with_feedback_loop.ipynb` + `explainable_retrieval.ipynb`. Capturar feedback do user (thumbs up/down ou edits) e usar para refinar retrieval. Explicar ao user porque é que retrieval escolheu esses chunks (similarity score breakdown, query-chunk overlap).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/retrieval_with_feedback_loop.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/all_rag_techniques/explainable_retrieval.ipynb
Reference:    Anthropic — *Building effective agents* (feedback loops como design lever).
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/notebooks/03_feedback_explain.ipynb

### Sessão 4 — RAG evaluation: métricas e harness

Build:        `define_evaluation_metrics.ipynb` + `end-2-end_rag_evaluation.ipynb` + `evalute_rag.py`. Métricas core: faithfulness (resposta segue o context), answer relevancy, context precision/recall. Construir harness próprio que corre suite contra um eval set pequeno.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/define_evaluation_metrics.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/end-2-end_rag_evaluation.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/evalute_rag.py
Reference:    Es et al. (2023) — *RAGAS: Automated Evaluation of Retrieval Augmented Generation*. Saad-Falcon et al. (2023) — *ARES*.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/notebooks/04_rag_eval_harness.ipynb

### Sessão 5 — RAG evaluation: libraries (DeepEval + Grouse + open-rag-eval)

Build:        `evaluation_deep_eval.ipynb` + `evaluation_grouse.ipynb` + `open-rag-eval-example.ipynb`. Comparar 3 frameworks de eval. Ver onde divergem nas métricas, o que cada um vê melhor (faithfulness, latency, cost).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/evaluation_deep_eval.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/evaluation_grouse.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint17_RAGFundamentals/external/nirdiamant-rag-techniques/evaluation/open-rag-eval-example.ipynb
Reference:    DeepEval docs. Grouse paper (Mu et al. 2024). open-rag-eval (Vectara) GitHub.
Source:       https://github.com/NirDiamant/RAG_Techniques
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/notebooks/05_eval_libs.ipynb

### Sessão 6 — Project: agentic RAG produção end-to-end

Build:        Combinar tudo. Pipeline: query → adaptive retrieval (Sprint 18 sessão 7 logic) → contextual compression → reliable_rag generation com citations → DeepEval harness para CI. Deploy num endpoint FastAPI mínimo (recap Sprint 14). Cross-link com Sprint 15 portfolio se quiseres usar para o teu Track B.
Reference:    Sprints 17, 18, 19, 20 todos. Sprint 13 (slice/behavioral) + Sprint 14 (serving).
Output:       Fase5_LLMAgents/Sprint21_AgenticRAGProduction/06_production/ + nota `notas/sprint21-resumo.md`.

**Reference:** Es et al. (2023) — RAGAS. Saad-Falcon et al. (2023) — ARES. Anthropic — *Building effective agents*. NirDiamant `README.md` (vendored).

**Entrega:** `notas/sprint21-resumo.md` — pergunta-teste: "Em 3 minutos: que métricas escolherias para avaliar um agentic RAG e porquê? Onde é que faithfulness e relevância podem divergir, e qual ganha em produção financeira (regulada)?"
