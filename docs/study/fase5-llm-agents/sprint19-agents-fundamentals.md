# Sprint 19 — Agents Fundamentals (semanas 33-34)

**Pergunta nuclear:** *"Como é que um LLM passa de chatbot a agente? Tools, memory, planning, e o framework LangGraph para orquestrar grafos de estado."*

> Sprint walkthrough-driven. **NirDiamant GenAI_Agents** está vendored em `Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/` (mesmo Custom non-commercial license que RAG_Techniques). Ordem: agentes simples (1-tool, sem state graph) → memory → LangGraph framework → primeiro agente full-blown.

> **License flag:** non-commercial only — ver `_ATTRIBUTION.md` na pasta vendor.

> **Pré-leitura recomendada (~2h, opcional):** dair-ai/Prompt-Engineering-Guide secções ReAct + Tool Use — ver `docs/study/README.md` "Reference shelf".

### Sessão 1 — Simple conversational agent (sem framework)

Build:        `simple_conversational_agent.ipynb`. Conversation loop manual: histórico em lista, system prompt, gerar resposta. Sem LangChain, sem LangGraph. Ver o "núcleo" antes do açúcar dos frameworks.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/simple_conversational_agent.ipynb
Reference:    NirDiamant `README.md` (vendored). Anthropic / OpenAI chat-completions API docs.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/01_simple_chat.ipynb

### Sessão 2 — Question-answering agent + tool use

Build:        `simple_question_answering_agent.ipynb`. Adicionar 1 tool (e.g. calculator ou web search). Compreender o pattern: LLM decide "tool call vs final answer" via output structured. ReAct prompting básico.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/simple_question_answering_agent.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/task_oriented_agent.ipynb
Reference:    Yao et al. (2022) — *ReAct: Synergizing Reasoning and Acting in Language Models*.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/02_qa_tool.ipynb

### Sessão 3 — Memory: contexto multi-turn + memória explícita

Build:        `memory_enhanced_conversational_agent.ipynb` + `memory-agent-tutorial.ipynb`. Diferença entre context window (passive memory) e memory store explícito (long-term, retrievable). Implementar ambos.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/memory_enhanced_conversational_agent.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/memory-agent-tutorial.ipynb
Reference:    MemGPT (Packer et al. 2023). LangChain memory patterns.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/03_memory.ipynb

### Sessão 4 — LangGraph: state machines para agentes

Build:        `langgraph-tutorial.ipynb`. Conceitos core do LangGraph: StateGraph, nodes, edges (incluindo conditional), checkpoints. Reescrever o QA agent da Sessão 2 em LangGraph para sentir o que melhora.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/langgraph-tutorial.ipynb
Reference:    LangGraph docs (langchain-ai.github.io/langgraph). Wu et al. (2023) — AutoGen comparativo.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/04_langgraph_basics.ipynb

### Sessão 5 — Primeiro agente LangGraph útil: travel planner

Build:        `simple_travel_planner_langgraph.ipynb`. Agente com 3-4 nodes (intake → search → plan → output) e conditional edges. Adaptar para um domain teu (e.g. earnings call summarizer ou recipe planner).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/simple_travel_planner_langgraph.ipynb
Reference:    LangGraph "Build a customer support bot" tutorial (canon).
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/05_travel_planner.ipynb

### Sessão 6 — Data analysis agent: tool-call em tabelas

Build:        `simple_data_analysis_agent_notebook.ipynb`. Agente que recebe um CSV/Pandas df e responde queries em natural language usando tool calls (df.query, plotting). Ler ambas versões (LangChain native vs PydanticAI) para perceber abstrações alternativas.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/simple_data_analysis_agent_notebook.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/simple_data_analysis_agent_notebook-pydanticai.ipynb
Reference:    PydanticAI docs. LangChain Tool docs.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint19_AgentsFundamentals/notebooks/06_data_analysis.ipynb + nota `notas/sprint19-resumo.md`.

**Reference:** Yao et al. (2022) — ReAct. Wei et al. (2022) — Chain-of-Thought. LangGraph docs. dair-ai Prompt Engineering Guide.

**Entrega:** `notas/sprint19-resumo.md` — pergunta-teste: "Em 2 minutos: o que LangGraph traz que um while-loop com tool dispatch não traz? Onde é que essa abstração pesa demasiado para o problema?"
