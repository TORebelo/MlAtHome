# Sprint 20 — Multi-agent (semanas 35-36, primeira metade)

**Pergunta nuclear:** *"Quando é que faz sentido orquestrar **múltiplos** agentes em vez de um agente monolítico maior? Patterns: supervisor + workers, swarm, handoff, e onde cada um falha."*

> Sprint walkthrough-driven. Reusa snapshot **NirDiamant GenAI_Agents** vendored em Sprint 19. Sprint 21 também reusa. Cobre: Scientific Paper Agent (research workflow), ATLAS / Academic_Task_Learning_Agent (multi-agent education system), e 1 business agent à escolha.

> **License flag:** non-commercial only — ver `_ATTRIBUTION.md` na pasta vendor partilhada.

### Sessão 1 — Multi-agent collaboration: supervisor + workers básico

Build:        `multi_agent_collaboration_system.ipynb`. Pattern fundamental: 1 supervisor LLM decide qual worker invocar; workers executam tasks especializadas; supervisor agrega. Implementação minimal antes de saltar para os exemplares full-blown.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/multi_agent_collaboration_system.ipynb
Reference:    LangGraph multi-agent docs. Wu et al. (2023) — *AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation*.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint20_MultiAgent/notebooks/01_supervisor_workers.ipynb

### Sessão 2 — Scientific Paper Agent: research workflow end-to-end

Build:        `scientific_paper_agent_langgraph.ipynb`. Agent que: (a) procura papers (arXiv API), (b) decide quais ler com base em relevance scoring, (c) sumariza e cita. Ler também `systematic_review_of_scientific_articles.ipynb` para um pipeline de SR mais ambicioso. Adaptar a research question própria.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/scientific_paper_agent_langgraph.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/systematic_review_of_scientific_articles.ipynb
Reference:    NirDiamant `README.md` — secção sobre scientific paper agent design.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint20_MultiAgent/notebooks/02_scientific_paper.ipynb

### Sessão 3 — ATLAS: Academic Task Learning Agent System

Build:        `Academic_Task_Learning_Agent_LangGraph.ipynb`. Sistema multi-agente para apoiar estudantes — agentes especializados (planner, tutor, evaluator) coordenados via LangGraph. Estudar a estrutura do state graph e os handoff conditions.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/Academic_Task_Learning_Agent_LangGraph.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/chiron_learning_agent_langgraph.ipynb
Reference:    LangGraph multi-agent supervisor pattern.
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint20_MultiAgent/notebooks/03_atlas.ipynb

### Sessão 4 — Swarm pattern: blog writer collaborativo

Build:        `blog_writer_swarm.ipynb`. Múltiplos agentes do mesmo "tipo" colaboram num task criativo (researcher + outliner + writer + critic). Comparar swarm vs supervisor: quando swarm vence (paralelizável, criativo) vs quando perde (state coordination cara).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/blog_writer_swarm.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/research_team_autogen.ipynb
Reference:    OpenAI Swarm framework docs. Park et al. (2023) — *Generative Agents: Interactive Simulacra of Human Behavior* (multi-agent simulação).
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint20_MultiAgent/notebooks/04_swarm.ipynb

### Sessão 5 — Business agent: customer support multi-agent

Build:        `customer_support_agent_langgraph.ipynb`. Sistema multi-agent business-grade: triage → specialist (billing, technical, escalation) → resolution. Ler também `sales_call_analyzer_agent.ipynb` para outro pattern business comum.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/customer_support_agent_langgraph.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint19_AgentsFundamentals/external/nirdiamant-genai-agents/all_agents_tutorials/sales_call_analyzer_agent.ipynb
Reference:    LangGraph "customer support" tutorial canónico. Anthropic — *Building effective agents* (engineering blog).
Source:       https://github.com/NirDiamant/GenAI_Agents
Output:       Fase5_LLMAgents/Sprint20_MultiAgent/notebooks/05_customer_support.ipynb + nota `notas/sprint20-resumo.md`.

**Reference:** Wu et al. (2023) — AutoGen. Park et al. (2023) — Generative Agents. Anthropic — *Building effective agents* (when *not* to use multi-agent). LangGraph multi-agent patterns docs.

**Entrega:** `notas/sprint20-resumo.md` — pergunta-teste: "Em 3 minutos: dá 2 problemas onde multi-agent vence single-agent + 1 problema onde multi-agent é over-engineering disfarçado. Justifica."
